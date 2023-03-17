--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

MINI69 = {
	parts = {
		BumperFront = {
			MINI69BumperFront = {
				FrontBumper0 = "69miniBumperFront0",
				FrontBumper1 = "69miniBumperFront1",
				FrontBumper2 = "69miniBumperFront2",
			},
			default = "trve_random",
			noPartChance = 5,
		},
		BumperFrontIJ = {
			MINI69BumperFront = {
				FrontBumper2 = "69miniBumperFront2",
				FrontBumper0 = "69miniBumperFront0",
				FrontBumper1 = "69miniBumperFront1",
			},
			default = "first",
		},
		BumperFrontPS = {
			MINI69BumperFront = {
				FrontBumper0 = "69miniBumperFront0",
				FrontBumper1 = "69miniBumperFront1",
				FrontBumper2 = "69miniBumperFront2",
			},
		},
		BumperRear = {
			MINI69BumperRear = {
				BumperRear0 = "69miniBumperRear0",
				BumperRear1 = "69miniBumperRear1",
			},
			default = "trve_random",
			noPartChance = 5,
		},
		BumperRearPS = {
			MINI69BumperRear = {
				BumperRear0 = "69miniBumperRear0",
				BumperRear1 = "69miniBumperRear1",
			},
		},
		Roofrack = {
			MINI69Roofrack = {
				Roofrack0 = "69miniRoofrack1",
			},
			default = "trve_random",
			noPartChance = 75,
		},
		DoorFrontLeftArmor = {
			MINI69DoorFrontLeftArmor = {
				MINI69leftdoora = "69miniFrontDoorArmor",
			},
		},
		DoorFrontRightArmor = {
			MINI69DoorFrontRightArmor = {
				MINI69rightdoora = "69miniFrontDoorArmor",
			},
		},
		WindowRearLeftArmor = {
			MINI69WindowRearLeftArmor = {
				MINI69leftwinra = "69miniRearWindowArmor",
			},
		},
		WindowRearRightArmor = {
			MINI69WindowRearRightArmor = {
				MINI69rightwinra = "69miniRearWindowArmor",
			},
		},
		WindshieldArmor = {
			MINI69WindshieldArmor = {
				MINI69winda = "69miniWindshieldArmor",
			},
		},
		WindshieldRearArmor = {
			MINI69WindshieldRearArmor = {
				MINI69windra = "69miniWindshieldRearArmor",
			},
		},
		SpareTire = {
			MINI69SpareTire = {
				SpareTire = "69miniTire1",
			},
			default = "trve_random",
			noPartChance = 33,
		},
	},
};

KI5:createVehicleConfig(MINI69);


function MINI69.ContainerAccess.TruckBed(vehicle, part, chr)
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

function MINI69.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function Recipe.OnCreate.IllTakeThatBoxAlso(items, result, player)
    player:getInventory():AddItem("Base.69miniTeaCrate");
end