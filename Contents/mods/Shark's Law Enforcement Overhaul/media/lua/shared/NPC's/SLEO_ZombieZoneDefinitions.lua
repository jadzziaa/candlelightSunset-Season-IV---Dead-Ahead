require 'NPCs/ZombiesZoneDefinition'

SLEO_ZombiesZoneDefinition = ZombiesZoneDefinition or {};

-- name of the zone for the zone type ZombiesType (in worldzed)

ZombiesZoneDefinition.BlackSWAT = {
	SharkBlackSWATLight = {
		name="SharkBlackSWATLight",
		toSpawn = 4,
		chance=75,
	},
}

ZombiesZoneDefinition.BlackSWAT_Equipped = {
	SharkBlackSWAT = {
		name="SharkBlackSWAT",
		toSpawn = 4,
		chance=75,
	},
}

ZombiesZoneDefinition.BlueSWAT = {
	SharkBlueSWATLight = {
		name="SharkBlueSWATLight",
		toSpawn = 4,
		chance=75,
	},
}

ZombiesZoneDefinition.BlueSWAT_Equipped = {
	SharkBlueSWAT = {
		name="SharkBlueSWAT",
		toSpawn = 4,
		chance=75,
	},
}

ZombiesZoneDefinition.GreenSWAT = {
	SharkGreenSWATLight = {
		name="SharkGreenSWATLight",
		toSpawn = 4,
		chance=75,
	},
}

ZombiesZoneDefinition.GreenSWAT_Equipped = {
	SharkGreenSWAT = {
		name="SharkGreenSWAT",
		toSpawn = 4,
		chance=75,
	},
}

ZombiesZoneDefinition.RiotControl = {
	PoliceRiot = {
		name="PoliceRiot",
		toSpawn = 30,
		chance=100,
	},

	SharkBlackSWAT = {
		name="SharkBlackSWAT",
		toSpawn = 5,
		chance=100,
	},
}

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
SLEO_ZombiesZoneDefinition.Default = ZombiesZoneDefinition.Default or {};
