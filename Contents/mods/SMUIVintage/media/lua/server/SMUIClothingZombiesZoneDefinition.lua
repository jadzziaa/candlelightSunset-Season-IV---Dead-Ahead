SMUIZombiesZoneDefinition = ZombiesZoneDefinition or {};


SMUIZombiesZoneDefinition.SMUIGeneralMilitary = {
	SharkERDL = {
		name="SharkERDL",
		chance=100,
	},

	SharkERDLEquipped = {
		name="SharkERDLEquipped",
		chance=100,
	},

}

SMUIZombiesZoneDefinition.SMUIMilitaryPolice = {
	SharkOG107MP = {
		name="SharkOG107MP",
		chance=55,
		toSpawn=3,
	},
}

SMUIZombiesZoneDefinition.SMUIMarchRidge = {
	SharkOG107MP = {
		name="SharkOG107MP",
		chance=50,
		toSpawn=3,
	},
}

SMUIZombiesZoneDefinition.SMUINationalGuard = {
	SharkOG107 = {
		name="SharkOG107",
		chance=50,
	},
	SharkOG107Equipped = {
		name="SharkOG107Equipped",
		chance=50,
	},
	SharkOG107USNG = {
		name="SharkOG107USNG",
		chance=50,
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
		chance=5,
		toSpawn=5,
	},
}

SMUIZombiesZoneDefinition.Army = {

	SharkERDL = {
		name="SharkERDL",
		chance=50,
		gender="male",
	},	
	SharkERDLEquipped = {
		name="SharkERDLEquipped",
		chance=50,
		gender="male",
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

table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkMilitaryPolice", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkVeteran", chance=0.01});
table.insert(SMUIZombiesZoneDefinition.Default,{name = "SharkPreparedSurvivor", chance=0.01});
