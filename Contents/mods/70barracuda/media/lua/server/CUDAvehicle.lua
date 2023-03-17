--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

CUDA = {
	parts = {
		FrontBumper0 = {
			CUDAFrontBumper = {
				FrontBumper0 = "CUDAFrontBumper0",
				FrontBumper1 = "CUDAFrontBumper1",
				FrontBumper2 = "CUDAFrontBumper2",
				FrontBumperA = "CUDAFrontBumperA",
			},
			default = "first",
		},
		FrontBumper1 = {
			CUDAFrontBumper = {
				FrontBumper1 = "CUDAFrontBumper1",
				FrontBumper0 = "CUDAFrontBumper0",
				FrontBumper2 = "CUDAFrontBumper2",
				FrontBumperA = "CUDAFrontBumperA",
			},
			default = "first",
		},
		FrontBumper2 = {
			CUDAFrontBumper = {
				FrontBumper2 = "CUDAFrontBumper2",
				FrontBumper0 = "CUDAFrontBumper0",
				FrontBumper1 = "CUDAFrontBumper1",
				FrontBumperA = "CUDAFrontBumperA",
			},
			default = "first",
		},
		WindshieldArmor = {
			CUDAWindshieldArmor = {
				CUDAwinda = "CUDAWindshieldArmor",
			},
		},
		DoorLeftArmor = {
			CUDADoorLeftArmor = {
				CUDAleftdoora = "CUDADoorArmor",
			},
		},
		DoorRightArmor = {
			CUDADoorRightArmor = {
				CUDArightdoora = "CUDADoorArmor",
			},
		},
		
		WindshieldRearArmor = {
			CUDAWindshieldRearArmor = {
				CUDAwindra = "CUDAWindshieldRearArmor",
			},
		},
		RearBumper = {
			CUDARearBumper = {
				RearBumper0 = "CUDARearBumper0",
				RearBumperA = "CUDARearBumperA",
			},
			default = "first",
		},
		Spoiler = {
			CUDASpoiler = {
				cudaspoiler0 = "CUDASpoiler0",
				cudaspoiler1 = "CUDASpoiler1",
			},
			default = "trve_random",
			noPartChance = 50,
		},
		SpareTire = {
			CUDASpareTire = {
				CUDASpareTire0 = "CUDAtire3",
			},
			default = "trve_random",
			noPartChance = 25,
		},
	},
};

KI5:createVehicleConfig(CUDA);