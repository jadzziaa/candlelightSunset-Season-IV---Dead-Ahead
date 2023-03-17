require "Definitions/AttachedWeaponDefinitions"
-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...

-- assault rifle on back
AttachedWeaponDefinitions.assaultRifleM16OnBack = {
	id = "assaultRifleM16OnBack",
	chance = 5,
	outfit = {"SharkArmyCamoGreenMale", "SharkArmyCamoGreenFemale","SharkArmyCamoDesertFemale", "SharkArmyCamoDesertMale", "SharkArmyCamoUrbanMale",
"SharkArmyCamoUrbanFemale", "SharkArmyCamoUrbanGearedMale", "SharkArmyCamoGreenMaleGasMask", "SharkArmyCamoGreenFemaleGasMask", "SharkMOPPSuitOD",	
"SharkArmyInstructor","SharkArmyCavalry"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 20,
	weapons = {
		"Base.AssaultRifle",
	},
}

AttachedWeaponDefinitions.handgunM9 = {
	id = "handgunM9",
	chance = 5,
	outfit = {"SharkArmyCamoGreenMale", "SharkArmyCamoGreenFemale","SharkArmyCamoDesertFemale", "SharkArmyCamoDesertMale", "SharkArmyCamoUrbanMale",
"SharkArmyCamoUrbanFemale", "SharkArmyCamoUrbanGearedMale", "SharkArmyCamoGreenMaleGasMask", "SharkArmyCamoGreenFemaleGasMask", "SharkMOPPSuitOD",	
"SharkArmyInstructor","SharkArmyCavalry"},
	weaponLocation = {"Holster Left", "Holster Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.HolsterSimple",
	weapons = {
    "Base.Pistol",
	},
}	

AttachedWeaponDefinitions.FragGrenade = {
	id = "FragGrenade",
	chance = 0,
	outfit = {"SharkArmyCamoGreenMale", "SharkArmyCamoGreenFemale","SharkArmyCamoDesertFemale", "SharkArmyCamoDesertMale", "SharkArmyCamoUrbanMale",
"SharkArmyCamoUrbanFemale", "SharkArmyCamoUrbanGearedMale", "SharkArmyCamoGreenMaleGasMask", "SharkArmyCamoGreenFemaleGasMask", "SharkMOPPSuitOD"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
    "SMUIClothing.M67Grenade",
	},
}	


-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenMale = {
	chance = 5;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemale = {
	chance = 5;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertFemale = {
	chance = 5;
	maxitem = 3;	
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoDesertMale = {
	chance = 5;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
} 
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanMale = {
	chance = 5;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanFemale = {
	chance = 5;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoUrbanGearedMale = {
	chance = 5;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenMaleGasMask = {
	chance = 5;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCamoGreenFemaleGasMask = {
	chance = 5;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyInstructor = {
	chance = 5;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkArmyCavalry = {
	chance = 5;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkMOPPSuitOD = {
	chance = 5;
	weapons = {
		AttachedWeaponDefinitions.handgunM9,
		AttachedWeaponDefinitions.assaultRifleM16OnBack,	
	},
}