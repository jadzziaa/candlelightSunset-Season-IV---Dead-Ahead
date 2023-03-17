SMUIZombiesZoneDefinition = ZombiesZoneDefinition or {};


SMUIZombiesZoneDefinition.SMUIGeneralMilitary = {
	SharkArmyCamoGreen = {
		name="SharkArmyCamoGreen",
		chance=100,
	},

	SharkArmyCamoGreenMale = {
		name="SharkArmyCamoGreenMale",
		chance=100,
	},

	SharkArmyCamoGreenFemale = {
		name="SharkArmyCamoGreenFemale",
		chance=15,
	},

	SharkArmyMedicalMale = {
		name="SharkMedicalFemale",
		chance=1,
	},

	SharkArmyMedicalFemale = {
		name="SharkArmyMedicalFemale",
		chance=1,
	},
}

SMUIZombiesZoneDefinition.SMUIMilitaryPolice = {
	SharkMilitaryPolice = {
		name="SharkMilitaryPolice",
		chance=55,
		toSpawn=3,
	},
}

SMUIZombiesZoneDefinition.SMUIMarchRidge = {
	SharkMilitaryPolice = {
		name="SharkMilitaryPoliceMarchRidge",
		chance=100,
		toSpawn=3,
	},
}

SMUIZombiesZoneDefinition.SMUINationalGuard = {
	SharkNationalGuard = {
		name="SharkArmyCamoGreenReservist",
		chance=100,
		toSpawn=30,
	},
}

SMUIZombiesZoneDefinition.SMUISpecialForces = {
	SharkSpecialForces = {
		name="SharkSpecialForces",
		chance=100,
		toSpawn=1,
	},
}

SMUIZombiesZoneDefinition.SMUISecretLab = {
	SharkSecretLabSoldier = {
		name="SharkSecretLabSoldier",
		chance=100,
		toSpawn=10,
	},
	SharkSecretLabMP = {
		name="SharkSecretLabMP",
		chance=100,
		toSpawn=5,
	},
}

SMUIZombiesZoneDefinition.SMUISurvivalist = {
	SharkPreparedSurvivor = {
		name="SharkPreparedSurvivor",
		chance=60,
		toSpawn=5,
	},
	SharkBandit = {
		name="SharkBandit",
		chance=60,
		toSpawn=2,
	},
}

SMUIZombiesZoneDefinition.Army = {

	SharkArmyCamoGreen = {
		name="SharkArmyCamoGreen",
		chance=70,
		gender="male",
	},	
	SharkArmyCamoDesertMale = {
		name="SharkArmyCamoDesertMale",
		chance=1,
		gender="male",
	},
	SharkArmyCamoDesertMaleDCU = {
		name="SharkArmyCamoDesertMaleDCU",
		chance=3,
		gender="male",
	},
	SharkArmyCamoDesertFemale = {
		name="SharkArmyCamoDesertFemale",
		chance=1,
		gender="female",
	},	
	SharkArmyCamoGreenMale = {
		name="SharkArmyCamoGreenMale",
		chance=15,
		gender="male",		
	},
	SharkArmyCamoGreenFemale = {
		name="SharkArmyCamoGreenFemale",
		chance=5,
		gender="female",			
	},
	SharkArmyCamoGreenNVGMale = {
		name="SharkArmyCamoGreenNVGMale",
		chance=1,
		gender="male",			
	},
	SharkArmyCamoGreenNVGFemale = {
		name="SharkArmyCamoGreenNVGFemale",
		chance=1,
		gender="female",			
	},
	SharkTankCrewman = {
		name="SharkTankCrewman",
		chance=5,
		gender="male",			
	},
	SharkMOPPSuitOD = {
		name="SharkMOPPSuitOD",
		chance=2,
		gender="male",			
	},
	SharkArmyCamoUrbanGearedMale = {
		name="SharkArmyCamoUrbanGearedMale",
		chance=1,
		gender="male",			
	},
	SharkArmyCamoUrbanMale = {
		name="SharkArmyCamoUrbanMale",
		chance=1,
		gender="male",			
	},
	SharkArmyCamoUrbanFemale = {
		name="SharkArmyCamoUrbanFemale",
		chance=1,
		gender="female",		
	},
	SharkMilitaryPolice = {
		name="SharkArmyCamoUrbanFemale",
		chance=10,
	},
	
	
}

SMUIZombiesZoneDefinition.SecretBase = {
	ArmyGeneral = {
		name="ArmyGeneral",
		chance=1,
		gender="male",
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=0,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=0,
		gender="male",
		beardStyles="null:80",
	},
	SharkCleanUpCrew = {
		name="SharkArmyCamoUrbanMale",
		gender="male",			
		toSpawn=10,
		chance=30,
	},
	SharkSecretLabSoldier = {
		name="SharkSecretLabSoldier",
		gender="male",			
		toSpawn=10,
		chance=50,
	},
	SharkSecretLabMP = {
		name="SharkSecretLabMP",
		gender="male",			
		toSpawn=5,
		chance=50,
	},
	Doctor = {
		name="Doctor",
		chance=10,
	},
}

local SharkPreparedSurvivor = {
		name="SharkPreparedSurvivor",
		gender="male",		
		chance=10,
	};
ZombiesZoneDefinition.Survivalist[SharkPreparedSurvivor] = SharkPreparedSurvivor;

local SharkHunter = {
		name="SharkHunter",
		gender="male",		
		chance=3,
	};
ZombiesZoneDefinition.TrailerPark[SharkHunter] = SharkHunter;

local SharkHunter2 = {
		name="SharkHunter",
		gender="male",		
		chance=10,
	};
ZombiesZoneDefinition.Survivalist[SharkHunter2] = SharkHunter2;

local SharkVeteran = {
		name="SharkVeteran",
		gender="male",		
		chance=3,
	};
	
ZombiesZoneDefinition.Bar[SharkVeteran] = SharkVeteran;
ZombiesZoneDefinition.StreetPoor[SharkVeteran] = SharkVeteran;
ZombiesZoneDefinition.TrailerPark[SharkVeteran] = SharkVeteran;

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
SMUIZombiesZoneDefinition.Default = ZombiesZoneDefinition.Default or {};

table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenMale", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenFemale", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreenReservist", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkArmyCamoGreen", chance=0.04});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkTankCrewman", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkMilitaryPolice", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkVeteran", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkBandit", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkPreparedSurvivor", chance=0.01});
