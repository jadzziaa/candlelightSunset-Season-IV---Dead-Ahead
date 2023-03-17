require "Vehicles/Vehicles" -- VehicleUtils.* --

rSemiTruck = rSemiTruck or {}
rSemiTruck.Vehicle =
{
	Create = {},
	Init = {},
	Update = {},
	ContainerAccess = {}
}

---

function rSemiTruck.Vehicle.ContainerAccess.TrunkToolbox(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local ToolboxDoor = vehicle:getPartById("ToolboxDoor")
	if ToolboxDoor and ToolboxDoor:getDoor() then
		if not ToolboxDoor:getInventoryItem() then return true end
		if not ToolboxDoor:getDoor():isOpen() then return false end
	end
	return true
end

function rSemiTruck.Vehicle.ContainerAccess.TrunkLeft(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local TrunkDoorLeft = vehicle:getPartById("TrunkDoorLeft")
	if TrunkDoorLeft and TrunkDoorLeft:getDoor() then
		if not TrunkDoorLeft:getInventoryItem() then return true end
		if not TrunkDoorLeft:getDoor():isOpen() then return false end
	end
	return true
end

-- custom engine update function to not disable part updates if the engine is stopped
function rSemiTruck.Vehicle.Update.Engine(vehicle, part, elapsedMinutes)
    -- engine update function from Vehicles.lua
    Vehicles.Update.Engine(vehicle, part, elapsedMinutes)
    vehicle:setNeedPartsUpdate(true);
end

---

function rSemiTruck.Vehicle.CreateBullbar(vehicle, part)
   if ZombRand(100) <= 5 then
      local invItem = VehicleUtils.createPartInventoryItem(part);
   end
end

---

local function OnSetTrunkLocked(module, cmd, player, args)
	if module ~= "vehicle" or cmd ~= "setTrunkLocked" then
		return
	end

	local vehicle = player:getVehicle()
	if not vehicle then
		return
	end

	local trunkLeft = vehicle:getPartById("TrunkDoorLeft")
	if trunkLeft and trunkLeft:getInventoryItem() then
		trunkLeft:getDoor():setLocked(args.locked)
		vehicle:transmitPartDoor(trunkLeft)
	end
end

Events.OnClientCommand.Add(OnSetTrunkLocked)
