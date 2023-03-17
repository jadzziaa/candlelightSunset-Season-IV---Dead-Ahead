require "Definitions/AttachedWeaponDefinitions"

-- Core Overwrite by Item
--AttachedWeaponDefinitions.meleeInBack = {
--	chance = 50,
--	outfit = {"Bandit"},
--	weaponLocation = {"Shovel Back"},
--	bloodLocations = nil,
--	addHoles = false,
--	daySurvived = 0,
--	weapons = {
--		"Base.BaseballBat",
--		"Base.BaseballBatNails",
--		"Base.Shovel",
--		"Base.HockeyStick",
--	},
--}

--AttachedWeaponDefinitions.melee2InBack = {
--	chance = 60,
--	outfit = {"Bandit"},
--	weaponLocation = {"Big Weapon On Back"},
--	bloodLocations = nil,
--	addHoles = false,
--	daySurvived = 0,
--	weapons = {
--		"Base.WoodAxe",
--		"Base.Machete",
--		"Base.Crowbar",
--		"Base.BaseballBat",
--		"Base.BaseballBatNails",
--		"Base.HockeyStick",
--	},
--}

AttachedWeaponDefinitions.nightstick = {
	chance = 30,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard"},
	weaponLocation = {"Nightstick Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Bag_WeaponBag",
	weapons = {
		"Base.Nightstick",
	},
}

AttachedWeaponDefinitions.handgunHolster = {
	id = "handgunHolster",
	chance = 50,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard", "PrivateMilitia", "Ranger", "Bandit"},
	weaponLocation =  {"Holster Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.HolsterSimple",
	weapons = {
		"Base.Pistol",
		"Base.Pistol2",
		"Base.Pistol3",
		"Base.Revolver",
		"Base.Revolver_Long",
		"Base.Revolver_Short",
	},
}

AttachedWeaponDefinitions.shotgunPolice = {
	id = "shotgunPolice",
	chance = 30,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrivateMilitia"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Shotgun",
	},
}

-- Core Overwrite by Type
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Police = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceState = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRiot = {
	chance = 80;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PrivateMilitia = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.shotgunSawed,
		AttachedWeaponDefinitions.assaultRifleOnBack,
		AttachedWeaponDefinitions.assaultRifle2,
		AttachedWeaponDefinitions.huntingRifleOnBack,
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.knivesBelt,
	},
}

--table.insert(AttachedWeaponDefinitions.shotgunSawed.weapons, "Base.ShotgunSawnoff")

-- Core Insert by Item
AttachedWeaponDefinitions.shotgunSawed = {
	id = "shotgunSawed",
	chance = 30,
	outfit = {"Bandit", "PrivateMilitia"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.ShotgunSawnoff",
	},
}

-- Core Insert by Type
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.ArmyCamoGreen = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.assaultRifleOnBack,
		AttachedWeaponDefinitions.huntingKnifeLeftLeg,
		AttachedWeaponDefinitions.MacheteShoulder,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Ranger = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.knivesBelt,
	},
}

