--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

ECTO1 = {
	parts = {
		DoorFrontLeftArmor = {
			ECTO1DoorFrontLeftArmor = {
				DoorFrontLeftArmor1 = "ECTO1CarFrontDoorArmor1_Item",
			},
		},
		DoorFrontRightArmor = {
			ECTO1DoorFrontRightArmor = {
				DoorFrontRightArmor1 = "ECTO1CarFrontDoorArmor1_Item",
			},
		},
		DoorRearLeftArmor = {
			ECTO1DoorRearLeftArmor = {
				DoorFrontLeftArmor1 = "ECTO1CarRearDoorArmor1_Item",
			},
		},
		DoorRearRightArmor = {
			ECTO1DoorRearRightArmor = {
				DoorRearRightArmor1 = "ECTO1CarRearDoorArmor1_Item",
			},
		},
		Bullbar = {
			ECTO1Bullbar = {
				Bullbar1 = "ECTO1Bullbar1_Item",
			},
		},
		WindshieldArmor = {
			ECTO1WindshieldArmor = {
				WindshieldArmor1 = "ECTO1WindshieldArmor1_Item",
				WindshieldArmor2 = "ECTO1WindshieldArmor2_Item",
			},
		},
		WindshieldRearArmor = {
			ECTO1WindshieldRearArmor = {
				WindshieldRearArmor1 = "ECTO1WindshieldArmor1_Item",
			},
		},
		Roofrack = {
			ECTO1Roofrack = {
				Roofrack1 = "ECTO1Roofrack1_Item",
			},
			default = "first",
		},
		Equipment = {
			ECTO1Equipment = {
				Equipment1 = "ECTO1Equipment1_Item",
			},
			default = "first",
		},
	},
};

ECTO1.parts.Roofrack.default = ECTO1.parts.Roofrack.ECTO1Roofrack.Roofrack1;
ECTO1.parts.Equipment.default = ECTO1.parts.Equipment.ECTO1Equipment.Equipment1;

KI5:createVehicleConfig(ECTO1);

function ECTO1.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 3 or seat == 2 or seat == 1 or seat == 0;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("TrunkDoor")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end

function ECTO1.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function ECTO1.UninstallComplete.TrunkDoor(vehicle, part, chr)
		KI5:sendClientCommand("vehicle", "setDoorOpen", {
		vehicle = part:getVehicle():getId(),
		part = part:getId(),
		open = true
		});
end