--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

DG70 = {
	parts = {
		FrontBumper = {
			DG70FrontBumper = {
				FrontBumper0 = "DG70FrontBumper0",
				FrontBumperA = "DG70FrontBumperA",
				FrontBumperB = "DG70FrontBumperB",
				FrontBumperC = "DG70FrontBumperC",
			},
			default = "first",
		},
		WindshieldArmor = {
			DG70WindshieldArmor = {
				DG70winda = "DG70WindshieldArmor",
			},
		},
		DoorLeftArmor = {
			DG70DoorLeftArmor = {
				DG70leftdoora = "DG70DoorArmor",
			},
		},
		DoorRightArmor = {
			DG70DoorRightArmor = {
				DG70rightdoora = "DG70DoorArmor",
			},
		},
		
		WindshieldRearArmor = {
			DG70WindshieldRearArmor = {
				DG70windra = "DG70WindshieldRearArmor",
			},
		},
		RearBumper = {
			DG70RearBumper = {
				RearBumper0 = "DG70RearBumper0",
				RearBumperA = "DG70RearBumperA",
				RearBumperB = "DG70RearBumperB",
				RearBumperC = "DG70RearBumperC",
			},
			default = "first",
		},
		Spoiler = {
			DG70Spoiler = {
				dgspoiler0 = "DG70Spoiler0",
				dgspoiler1 = "DG70Spoiler1",
			},
			default = "trve_random",
			noPartChance = 50,
		},
		SpareTire = {
			DG70SpareTire = {
				DGSpareTire = "DodgeRTtire3",
			},
			default = "trve_random",
			noPartChance = 25,
		},
		EngineDoor = {
			EngineDoor = {
				hoodTA0 = "DG70TAEngineDoor0",
				hoodTA1 = "DG70TAEngineDoor1",
			},
			default = "random",
		},
	},
};

KI5:createVehicleConfig(DG70);