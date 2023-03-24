
function ISHotwireVehicle:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = SandboxVars.ExpandedHotwire.HotwireBaseDuration - (character:getPerkLevel(Perks.Electricity) * SandboxVars.ExpandedHotwire.HotwireElectricityScalar) - (character:getPerkLevel(Perks.Mechanics) * SandboxVars.ExpandedHotwire.HotwireMechanicsScalar);
	return o
end

VehicleMenuAPI.registerSlice("Hotwire", function(menu, player, vehicle)
	if vehicle:isDriver(player) and
			SandboxVars.ExpandedHotwire.AllowHotwire and
      not vehicle:isHotwired() and
			not vehicle:isEngineStarted() and
			not vehicle:isEngineRunning() and
			not SandboxVars.VehicleEasyUse and
			not vehicle:isKeysInIgnition() and
			not player:getInventory():haveThisKeyId(vehicle:getKeyId()) then
		if ((player:getPerkLevel(Perks.Electricity) >= SandboxVars.ExpandedHotwire.HotwireElectricity and player:getPerkLevel(Perks.Mechanics) >= SandboxVars.ExpandedHotwire.HotwireMechanics) or (player:HasTrait("Burglar") and SandboxVars.ExpandedHotwire.AllowHotwireBurglar)) then
			menu:addSlice(getText("ContextMenu_VehicleHotwire"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISVehicleMenu.onHotwire, player)
		else
			menu:addSlice(getText("ContextMenu_VehicleHotwireSkillEH"):gsub("?", SandboxVars.ExpandedHotwire.HotwireElectricity, 1):gsub("?", SandboxVars.ExpandedHotwire.HotwireMechanics, 1), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), nil, player)
		end
	end
end)

local function onUnHotwire(player)
	ISTimedActionQueue.add(ISUnHotwireVehicle:new(player))
end

VehicleMenuAPI.registerSlice("UnHotwire", function(menu, player, vehicle)
	if vehicle:isDriver(player) and
			SandboxVars.ExpandedHotwire.AllowUnHotwire and
      vehicle:isHotwired() and
			not vehicle:isEngineStarted() and
			not vehicle:isEngineRunning() and
			not SandboxVars.VehicleEasyUse then
		if ((player:getPerkLevel(Perks.Electricity) >= SandboxVars.ExpandedHotwire.UnHotwireElectricity and player:getPerkLevel(Perks.Mechanics) >= SandboxVars.ExpandedHotwire.UnHotwireMechanics) or (player:HasTrait("Burglar") and SandboxVars.ExpandedHotwire.AllowHotwireBurglar)) then
			menu:addSlice(getText("ContextMenu_VehicleUnHotwire"), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), onUnHotwire, player)
		else
			menu:addSlice(getText("ContextMenu_VehicleUnHotwireSkillEH"):gsub("?", SandboxVars.ExpandedHotwire.UnHotwireElectricity, 1):gsub("?", SandboxVars.ExpandedHotwire.UnHotwireMechanics, 1), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), nil, player)
		end
	end
end)

local function onCraftKey(player)
	ISTimedActionQueue.add(ISCraftKey:new(player))
end

VehicleMenuAPI.registerSlice("CraftKey", function(menu, player, vehicle)
	if vehicle:isDriver(player) and
			SandboxVars.ExpandedHotwire.AllowKeyCrafting and
			not vehicle:isEngineStarted() and
			not vehicle:isEngineRunning() and
			not SandboxVars.VehicleEasyUse then
		if (player:getPerkLevel(Perks.Electricity) >= SandboxVars.ExpandedHotwire.KeyCraftingElectricity and player:getPerkLevel(Perks.Mechanics) >= SandboxVars.ExpandedHotwire.KeyCraftingMechanics and player:getPerkLevel(Perks.MetalWelding) >= SandboxVars.ExpandedHotwire.KeyCraftingMetalWelding) then
			menu:addSlice(getText("ContextMenu_VehicleKeyCrafting"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), onCraftKey, player)
		else
			menu:addSlice(getText("ContextMenu_VehicleKeyCraftingSkill"):gsub("?", SandboxVars.ExpandedHotwire.KeyCraftingElectricity, 1):gsub("?", SandboxVars.ExpandedHotwire.KeyCraftingMechanics, 1):gsub("?", SandboxVars.ExpandedHotwire.KeyCraftingMetalWelding, 1), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), nil, player)
		end
	end
end)
