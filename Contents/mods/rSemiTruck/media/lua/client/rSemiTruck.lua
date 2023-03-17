require "luautils"

require "rLib.Client"

rSemiTruck = rSemiTruck or {}
rSemiTruck.Event = {}

local function IsSemiTruckAny(vehicle)
	assert(rLib.arg(vehicle, "BaseVehicle"))

	local vehicleName = vehicle:getScript():getFullName()

	return vehicleName == "Rotators.SemiTruck" or vehicleName == "Rotators.SemiTruckLite" or vehicleName == "Rotators.SemiTruckBox"
end

local function IsSemiTruckOrSemiTruckLite(vehicle)
	assert(rLib.arg(vehicle, "BaseVehicle"))

	local vehicleName = vehicle:getScript():getFullName()

	return vehicleName == "Rotators.SemiTruck" or vehicleName == "Rotators.SemiTruckLite"
end

local function IsSemiTrailer(vehicle)
	assert(rLib.arg(vehicle, "BaseVehicle"))

	local vehicleName = vehicle:getScript():getFullName()

	return vehicleName == "Rotators.SemiTrailerVan" or vehicleName == "Rotators.SemiTrailerCistern"
end

function rSemiTruck.Event.PostAutoRepair(player, vehicle, part, armor) -- called directly by rLib --
	assert(rLib.arg(player, "IsoPlayer"))
	assert(rLib.arg(vehicle, "BaseVehicle"))
	assert(rLib.arg(part, "VehiclePart"))
	assert(rLib.arg(armor, "table"))

	rLib.dprint("[rSemiTruck] PostAutoRepair : %s : %s", vehicle:getScript():getFullName(), part:getId())

	if ZombRand(100) < armor.condition - part:getCondition() and type(armor.needs) == "table" and armor.needs.part then
		local guard = vehicle:getPartById(armor.needs.part)
		local guardCondition = guard:getCondition() - ZombRand(8)

		rLib.dprint("[rSemiTruck] Guard condition: %s => %f", guard:getId(), guardCondition)
		sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = guard:getId(), condition = guardCondition })
	end

	return true
end

function rSemiTruck.Event.ToggleHeadlights(player, vehicle)
	assert(rLib.arg(player, "IsoPlayer"))
	assert(rLib.arg(vehicle, "BaseVehicle"))

	--[[ if not IsSemiTruckOrSemiTruckLite(vehicle) then
		return
	end --]]

	local trailer = vehicle:getVehicleTowing()
	if not trailer or not IsSemiTrailer(trailer) then
		return
	end

	rLib.Commands.SendToServer(player, "SetVehicleHeadlights", {vehicleId = trailer:getId(), set = not vehicle:getHeadlightsOn()}, true)
end

function rSemiTruck.Event.AttachDetachVehicle(player, vehicleA, vehicleB)
	assert(rLib.arg(player, "IsoPlayer"))
	assert(rLib.arg(vehicleA, "BaseVehicle"))
	assert(rLib.arg(vehicleB, "BaseVehicle"))

	vehicleA:updateTotalMass()
	vehicleB:updateTotalMass()

	if --[[ not IsSemiTruckOrSemiTruckLite(vehicleA) or --]] not IsSemiTrailer(vehicleB) then
		return
	end

	local batteryPart = vehicleA:getPartById("Battery")
	if batteryPart then
		local batteryInv = batteryPart:getInventoryItem()
		local batteryVar = batteryInv and batteryInv:getUsedDelta() or 0
		if batteryInv and batteryVar > 0 then
			rLib.Commands.SendToServer(player, "SetVehicleBattery",
			{
				vehicleId = vehicleB:getId(),
				battery = rLib.Events.Current == "Vehicle.AttachVehicle" and batteryVar or 0
			}, true)
		end
	end

	rLib.Commands.SendToServer(player, "SetVehicleHeadlights",
	{
		vehicleId = vehicleB:getId(),
		set = rLib.Events.Current == "Vehicle.AttachVehicle" and vehicleA:getHeadlightsOn() or false
	}, true)
end

function rSemiTruck.Event.PlayerUpdate(player)
	local vehicle = player:getVehicle() or player:getNearVehicle()
	if not vehicle then
		return
	end

	if vehicle:getVehicleTowing() then
		vehicle = vehicle:getVehicleTowing()
	end

	-- process semi-trailer only --
	local attachment = vehicle:getTowAttachmentOther()
	if not attachment or string.lower(attachment) ~= "trailertruck" --[[or attachment ~= "trailer"]] then
		return
	end

	local partTrunk = vehicle:getPartById("TruckBed")
	if not partTrunk then
		return
	end

	local partsContainersMass = 0
	local partsInventoryMass = 0
	for p=0, vehicle:getPartCount()-1 do
		local part = vehicle:getPartByIndex(p)
		local item = part:getItemContainer()
		if item then
			partsContainersMass = partsContainersMass + item:getCapacityWeight()
		end

		item = part:getInventoryItem()
		if item then
			partsInventoryMass = partsInventoryMass + item:getWeight()
		end
	end

	local wantedMass = vehicle:getInitialMass() + partsInventoryMass + (partsContainersMass / 4)
	vehicle:setMass(math.floor(wantedMass))
end

function rSemiTruck.Event.EnterVehicle(player)
	if not rLib.modversion then -- modversion() was added in v1.2 --
		luautils.okModal("Your rLib is older than Lexx's mouse")
		return
	end

	local r = rLib.modversion("RotatorsLib") or rLib.modversion("RotatorsLib_DEV")
	if not r or r < 1.2 then
		luautils.okModal("Your rLib is bad and you should feel bad")
	end
end

rLib.Events.On("Vehicle.ToggleHeadlights", rSemiTruck.Event.ToggleHeadlights)
rLib.Events.On("Vehicle.AttachVehicle", rSemiTruck.Event.AttachDetachVehicle)
rLib.Events.On("Vehicle.DetachVehicle", rSemiTruck.Event.AttachDetachVehicle)
Events.OnPlayerUpdate.Add(rSemiTruck.Event.PlayerUpdate)
--Events.OnEnterVehicle.Add(rSemiTruck.Event.EnterVehicle)

--[[

TODO/wait for fix

local ISVM_doTowingMenu = ISVehicleMenu.doTowingMenu
function ISVehicleMenu.doTowingMenu(player, trailer, radial, ...)
	ISVM_doTowingMenu(player, trailer, radial, ...)

	local vehicleName = trailer:getScript():getFullName()
	if vehicleName ~= "Rotators.SemiTruckBox" and vehicleName ~= "Rotators.SemiTrailerVan" then
		return
	end

	if radial and radial.slices then
		for idx,slice in ipairs(radial.slices) do
			if slice.text == getText("IGUI_OpenTrunk") or slice.text == getText("IGUI_CloseTrunk") then
				return
			end
		end
	end

	local part = trailer:getPartById("DoorRear")
	if part and part:getInventoryItem() then
		local text = part:getDoor():isOpen() and "IGUI_CloseTrunk" or "IGUI_OpenTrunk"
		local func = part:getDoor():isOpen() and ISVehicleMenu.onCloseDoor or ISVehicleMenu.onOpenDoor
		radial:addSlice(getText(text), getTexture("media/ui/vehicles/vehicle_exit.png"), func, player, part)
	end
end
]]--

--[[
	Enables vehicle overlay editor for selected vehicle(s)
	Can be temporary enabled for any near vehicle by using debug mode console command: rLib.UI.VehicleOverlayEditor.Try()
	RotatorsLib : https://steamcommunity.com/sharedfiles/filedetails/?id=2732594572
]]--

if getDebug() and rLib and rLib.Events.Exists("Vehicle.MechanicsSetVisible") then
	local function EnableVehicleOverlayEditor(ui, uiVisible)
		if uiVisible then
			local vehicleName = ui.vehicle:getScript():getFullName()
			if vehicleName == "Rotators.SemiTruck" or vehicleName == "Rotators.SemiTruckLite" or vehicleName == "Rotators.SemiTruckBox" then
				rLib.UI.VehicleOverlayEditor.Enable(ui)
			end
		end
	end
	rLib.Events.On("Vehicle.MechanicsSetVisible", EnableVehicleOverlayEditor)
end
