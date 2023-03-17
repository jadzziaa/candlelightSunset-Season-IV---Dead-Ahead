--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

LIN93 = {
	parts = {
		BumperFront = {
			LIN93BumperFront = {
				FrontBumper0 = "93townCarBumperFront0",
				FrontBumper1 = "93townCarBumperFront1",
				FrontBullbarA = "93townCarBullbarFrontA",
				FrontBullbarB = "93townCarBullbarFrontB",
				FrontBullbarC = "93townCarBullbarFrontC",
			},
			default = "first",
		},
		BumperRear = {
			LIN93BumperRear = {
				BumperRear0 = "93townCarBumperRear0",
			},
			default = "first",
		},
		DoorFrontLeftArmor = {
			LIN93DoorFrontLeftArmor = {
				LIN93leftdoora = "93townCarFrontDoorArmor",
			},
		},
		DoorFrontRightArmor = {
			LIN93DoorFrontRightArmor = {
				LIN93rightdoora = "93townCarFrontDoorArmor",
			},
		},
		DoorRearLeftArmor = {
			LIN93DoorRearLeftArmor = {
				LIN93leftdoorra = "93townCarRearDoorArmor",
			},
		},
		DoorRearRightArmor = {
			LIN93DoorRearRightArmor = {
				LIN93rightdoorra = "93townCarRearDoorArmor",
			},
		},
		WindowMiddleLeftArmor = {
			LIN93WindowMiddleLeftArmor = {
				LIN93winbla = "93townCarMiddleWindowArmor",
			},
		},
		WindowMiddleRightArmor = {
			LIN93WindowMiddleRightArmor = {
				LIN93winbra = "93townCarMiddleWindowArmor",
			},
		},
		WindshieldArmor = {
			LIN93WindshieldArmor = {
				LIN93winda0 = "93townCarWindshieldArmorA",
				LIN93winda1 = "93townCarWindshieldArmorB",
			},
		},
		WindshieldRearArmor = {
			LIN93WindshieldRearArmor = {
				WindshieldRearArmor = "93townCarWindshieldRearArmor",
			},
		},
		WindowArmor = {
			LIN93WindowArmor = {
				WindowArmor = "93townCarWindowArmor",
			},
		},
		SpareTire = {
			LIN93SpareTire = {
				SpareTire = "93townCarTire",
			},
			default = "trve_random",
			noPartChance = 33,
		},

		Trunkrack = {
			LIN93Trunkrack = {
				Trunkrack = "93townCarTrunkRack",
			},
			default = "trve_random",
			noPartChance = 50,
		},
	},
};

KI5:createVehicleConfig(LIN93);


function LIN93.ContainerAccess.FloorMinibar(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 5 or seat == 4 or seat == 3 or seat == 2;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("DoorRearRight")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end

function LIN93.ContainerAccess.Trunkrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end