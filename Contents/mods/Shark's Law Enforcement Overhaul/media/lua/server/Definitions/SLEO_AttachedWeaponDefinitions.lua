require "Definitions/AttachedWeaponDefinitions"

-- For Specific Outfits --

-- assault rifle on back
AttachedWeaponDefinitions.LongGunOnBack = {
	id = "LongGunOnBack",
	chance = 30,
	outfit = {"SharkBlackSWAT","SharkBlackSWATRiot","SharkBlackSWATLight"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.AssaultRifle",
		"Base.AssaultRifle2",
		"Base.Shotgun",
	},
}

AttachedWeaponDefinitions.PoliceHandGun = {
	id = "PoliceHandGun",
	chance = 30,
	outfit = {"SharkBlackSWAT","SharkBlackSWATLight"},
	weaponLocation = {"Holster Left", "Holster Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.HolsterSimple",
	weapons = {
    "Base.Pistol",
	"Base.Pistol2",
	},
}	

-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkBlackSWAT = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
		AttachedWeaponDefinitions.LongGunOnBack,	
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkBlackSWATLight = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
		AttachedWeaponDefinitions.LongGunOnBack,	
	},
}