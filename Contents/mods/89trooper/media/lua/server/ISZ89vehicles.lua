--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

ISZ89 = {
	parts = {
		BumperFront = {
			ISZ89BumperFront = {
				FrontBumper0 = "89trooperBumperFront0",
				FrontBullbarA = "89trooperBullbarFrontA",
				FrontBullbarB = "89trooperBullbarFrontB",
			},
			default = "trve_random",
			noPartChance = 5,
		},
		BumperFrontOP = {
			ISZ89BumperFront = {
				FrontBullbarA = "89trooperBullbarFrontA",
				FrontBullbarB = "89trooperBullbarFrontB",
			},
			default = "random",
		},
		BumperRear = {
			ISZ89BumperRear = {
				BumperRear0 = "89trooperBumperRear0",
			},
			default = "trve_random",
			noPartChance = 5,
		},
		Roofrack = {
			ISZ89Roofrack = {
				Roofrack0 = "89trooperRoofrack2",
			},
			default = "trve_random",
			noPartChance = 75,
		},
		Mudflaps = {
			ISZ89Mudflaps = {
				Mudflaps0 = "89trooperMudflaps2",
			},
			default = "trve_random",
			noPartChance = 50,
		},
		DoorFrontLeftArmor = {
			ISZ89DoorFrontLeftArmor = {
				ISZ89leftdoora = "89trooperFrontDoorArmor",
			},
		},
		DoorFrontRightArmor = {
			ISZ89DoorFrontRightArmor = {
				ISZ89rightdoora = "89trooperFrontDoorArmor",
			},
		},
		DoorRearLeftArmor = {
			ISZ89DoorRearLeftArmor = {
				ISZ89leftdoorra = "89trooperRearDoorArmor",
			},
		},
		DoorRearRightArmor = {
			ISZ89DoorRearRightArmor = {
				ISZ89rightdoorra = "89trooperRearDoorArmor",
			},
		},
		WindowBackLeftArmor = {
			ISZ89WindowBackLeftArmor = {
				ISZ89winbla = "89trooperBackWindowArmor",
			},
		},
		WindowBackRightArmor = {
			ISZ89WindowBackRightArmor = {
				ISZ89winbra = "89trooperBackWindowArmor",
			},
		},
		WindshieldArmor = {
			ISZ89WindshieldArmor = {
				ISZ89winda = "89trooperWindshieldArmor",
			},
		},
		WindshieldRearArmor = {
			ISZ89WindshieldRearArmor = {
				WindshieldRearArmor = "ISZ89WindshieldRearArmor",
			},
		},
		WindowArmor = {
			ISZ89WindowArmor = {
				WindowArmor = "ISZ89WindowArmor",
			},
		},
		SpareTire = {
			ISZ89SpareTire = {
				SpareTire = "89trooperTire2",
			},
			default = "trve_random",
			noPartChance = 33,
		},
		SpareTireFront = {
			ISZ89SpareTireFront = {
				SpareTire = "89trooperTire2",
			},
			default = "trve_random",
			noPartChance = 10,
		},
		SideSteps = {
			ISZ89SideSteps = {
				SideSteps = "ISZ89SideSteps2",
			},
			default = "trve_random",
			noPartChance = 75,
		},
	},
};

KI5:createVehicleConfig(ISZ89);


function ISZ89.ContainerAccess.TruckBed(vehicle, part, chr)
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

function ISZ89.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end