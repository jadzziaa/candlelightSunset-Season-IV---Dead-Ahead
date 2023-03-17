--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

W460SWB = {
	parts = {
		Bumper = {
			W460SWBBumper = {
				Bumper1 = "W460Bumper1_Item",
				Bullbar2 = "W460Bullbar2_Item",
				Bullbar3 = "W460Bullbar3_Item",
			},
			default = "trve_random",
			noPartChance = 10,
		},
		BumperRear = {
			W460SWBBumperRear = {
				BumperRear1 = "W460BumperRear1_Item",
			},
			default = "trve_random",
			noPartChance = 20,
		},
		Roofrack = {
			W460SWBRoofrack = {
				Roofrack1 = "W460Roofrack1_Item",
			},
			default = "trve_random",
			noPartChance = 75,
		},
		Bodykit = {
			W460SWBBodykit = {
				Bodykit1 = "W460Bodykit1_Item",
			},
			default = "trve_random",
			noPartChance = 60,
		},
		Mudflaps = {
			W460SWBMudflaps = {
				Mudflaps1 = "W460Mudflaps1_Item",
			},
			default = "trve_random",
			noPartChance = 50,
		},
		DoorFrontLeftArmor = {
			W460SWBDoorFrontLeftArmor = {
				DoorFrontLeftArmor1 = "W460CarFrontDoorArmor1_Item",
			},
		},
		DoorFrontRightArmor = {
			W460SWBDoorFrontRightArmor = {
				DoorFrontRightArmor1 = "W460CarFrontDoorArmor1_Item",
			},
		},
		DoorRearLeftArmor = {
			W460SWBDoorRearLeftArmor = {
				DoorRearLeftArmor1 = "W460CarRearDoorArmor1_Item",
			},
		},
		DoorRearRightArmor = {
			W460SWBDoorRearRightArmor = {
				DoorRearRightArmor1 = "W460CarRearDoorArmor1_Item",
			},
		},
		WindshieldArmor = {
			W460SWBWindshieldArmor = {
				WindshieldArmor1 = "W460WindshieldArmor1_Item",
			},
		},
		WindshieldRearArmor = {
			W460SWBWindshieldRearArmor = {
				WindshieldRearArmor1 = "W460WindshieldRearArmor1_Item",
			},
		},
		WindowArmor = {
			W460SWBWindowArmor = {
				WindowArmor1 = "W460WindowArmor1_Item",
			},
		},
		SpareTire = {
			W460SWBSpareTire = {
				SpareTire1 = "W460NormalTire2",
				SpareTire2 = "W460WideTire2",
				SpareTire3 = "W460ModernTire2",
			},
			default = "trve_random",
			noPartChance = 33,
		},
		TireFrontLeft = {
			TireFrontLeft = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
		TireFrontRight = {
			TireFrontRight = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
		TireRearLeft = {
			TireRearLeft = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
		TireRearRight = {
			TireRearRight = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
	},
};

KI5:createVehicleConfig(W460SWB);


function W460SWB.ContainerAccess.Trunk(vehicle, part, chr)
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

function W460SWB.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function W460SWB.UninstallComplete.TrunkDoor(vehicle, part, chr)
		KI5:sendClientCommand("vehicle", "setDoorOpen", {
		vehicle = part:getVehicle():getId(),
		part = part:getId(),
		open = true
		});
end