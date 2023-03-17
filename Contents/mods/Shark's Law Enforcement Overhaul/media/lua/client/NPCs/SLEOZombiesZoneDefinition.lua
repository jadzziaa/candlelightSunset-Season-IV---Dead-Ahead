SLEOZombiesZoneDefinition = ZombiesZoneDefinition or {};

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
SLEOZombiesZoneDefinition.Default = ZombiesZoneDefinition.Default or {};


SLEOZombiesZoneDefinition.Police = {
	Police = {
		name="Police",
		chance=40,
	},

	SharkBlackSWATLight = {
		name="SharkBlackSWATLight",
		chance=5,
	},

	SharkBlueSWATLight = {
		name="SharkBlackSWATLight",
		chance=5,
	},

	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=20,
		gender="female",
	},

	OfficeWorker = {
		name="OfficeWorker",
		chance=20,
		gender="male",
		beardStyles="null:80",
	},
}


SLEOZombiesZoneDefinition.PoliceState = {
	Police = {
		name="PoliceState",
		chance=40,
	},

	SharkBlackSWATLight = {
		name="SharkBlackSWATLight",
		chance=5,
	},

	SharkBlueSWATLight = {
		name="SharkBlueSWATLight",
		chance=5,
	},

	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=20,
		gender="female",
	},

	OfficeWorker = {
		name="OfficeWorker",
		chance=20,
		gender="male",
		beardStyles="null:80",
	},
}


ZombiesZoneDefinition.Prison = {
	maleChance = 80,
	Doctor = {
		name="Doctor",
		chance=2,
	},
	Priest = {
		name="Priest",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
	Doctor2 = {
		name="Doctor",
		chance=20,
		room="medicalstorage",
	},
	Nurse = {
		name="Nurse",
		chance=30,
		room="medicalstorage",
	},
	Priest = {
		name="Priest",
		mandatory="true",
		toSpawn=1,
		gender="male",
	},
	Waiter_Diner = {
		name="Waiter_Diner",
		chance=2,
	},
	SharkPrisonGuard = {
		name="SharkPrisonGuard",
		chance=20,
		gender="male",
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=30,
		room="office",
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=30,
		room="office",
		beardStyles="null:80",
	},
	SharkPrisonSORT = {
		name="SharkPrisonSORT",
		gender="male",
		chance=10,
		room="security",
	},
	Inmate = {
		name="Inmate",
		chance=76,
		gender="male",
		room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
	},
	-- this one is used for lower chance of inmate in some rooms
	InmateLowerZone = {
		name="Inmate",
		chance=30,
		gender="male",
		room="bathroom;kitchen;medicalstorage;library",
	},
	Naked = {
		name="Naked",
		chance=50,
		gender="male",
		room="bathroom",
	},
	Cook_Generic = {
		name="Cook_Generic",
		chance=30,
		gender="male",
		room="kitchen",
	},
}

table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlueSWATLight", chance=0.01});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlueJumpsuitSWAT", chance=0.01});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlackSWATLight", chance=0.01});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkGreenSWATLight", chance=0.01});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlackSWAT", chance=0.01});