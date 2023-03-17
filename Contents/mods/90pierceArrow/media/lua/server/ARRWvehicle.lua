--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

ARRW = {
	parts = {

		Mudflaps = {
			ARRWMudflaps = {
				Mudflaps0 = "90pierceArrowMudflaps2",
			},
			default = "trve_random",
			noPartChance = 50,
		},
		WindowFrontLeftArmor = {
			ARRWWindowFrontLeftArmor = {
				ARRWwinfla = "90pierceArrowSideWindowArmor",
			},
		},
		WindowFrontRightArmor = {
			ARRWWindowFrontRightArmor = {
				ARRWwinfra = "90pierceArrowSideWindowArmor",
			},
		},
		WindowRearLeftArmor = {
			ARRWWindowRearLeftArmor = {
				ARRWwinrla = "90pierceArrowSideWindowArmor",
			},
		},
		WindowRearRightArmor = {
			ARRWWindowRearRightArmor = {
				ARRWwinrra = "90pierceArrowSideWindowArmor",
			},
		},
		WindowMiddleLeftArmor = {
			ARRWWindowMiddleLeftArmor = {
				ARRWwinmla = "90pierceArrowSideWindowArmor",
			},
		},
		WindowMiddleRightArmor = {
			ARRWWindowMiddleRightArmor = {
				ARRWwinmra = "90pierceArrowSideWindowArmor",
			},
		},
		WindshieldArmor = {
			ARRWWindshieldArmor = {
				ARRWwinda = "90pierceArrowWindshieldArmor",
			},
		},
		WindshieldRearArmor = {
			ARRWWindshieldRearArmor = {
				WindshieldRearArmor = "90pierceArrowWindshieldRearArmor",
			},
		},
		
	},
};


KI5:createVehicleConfig(ARRW);

function ARRW.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local Trunk = vehicle:getPartById("TrunkDoorRear")
	if Trunk and Trunk:getDoor() then
		if not Trunk:getInventoryItem() then return true end
		if not Trunk:getDoor():isOpen() then return false end
	end
	--
	return true
end

function ARRW.ContainerAccess.TrunkLeft(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local TrunkLeft = vehicle:getPartById("TrunkDoorLeft")
	if TrunkLeft and TrunkLeft:getDoor() then
		if not TrunkLeft:getInventoryItem() then return true end
		if not TrunkLeft:getDoor():isOpen() then return false end
	end
	--
	return true
end

function ARRW.ContainerAccess.TrunkRight(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local TrunkRight = vehicle:getPartById("TrunkDoorRight")
	if TrunkRight and TrunkRight:getDoor() then
		if not TrunkRight:getInventoryItem() then return true end
		if not TrunkRight:getDoor():isOpen() then return false end
	end
	--
	return true
end