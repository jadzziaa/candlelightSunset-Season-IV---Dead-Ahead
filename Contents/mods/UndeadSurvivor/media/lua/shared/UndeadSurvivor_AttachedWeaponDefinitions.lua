require "Definitions/AttachedWeaponDefinitions"

--> Amazona <--

AttachedWeaponDefinitions.AmazonaSpear= {
	chance = 100,
	outfit = {"Amazona"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.AmazonaSpear",
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Amazona = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.AmazonaSpear,
		AttachedWeaponDefinitions.knivesBelt,
	},
}

--> Stalker <--

AttachedWeaponDefinitions.StalkerKnife= {
	chance = 100,
	outfit = {"Stalker"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.StalkerKnife",
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Stalker = {
	chance = 25;
	weapons = {
		AttachedWeaponDefinitions.StalkerKnife,
	},
}


--> Prepper <--

AttachedWeaponDefinitions.PrepperFlashlight= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"PrepperFlashlight"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.PrepperFlashlight",
	},
}

AttachedWeaponDefinitions.PrepperHolster= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"PrepperHolster"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Pistol",
		"Base.Pistol2",
		"Base.Pistol3",
	},
}

AttachedWeaponDefinitions.PrepperKnife= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"PrepperKnife"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.PrepperKnifeStab",
	},
}

AttachedWeaponDefinitions.GunMagazine1= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine1"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}

AttachedWeaponDefinitions.GunMagazine2= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine2"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}

AttachedWeaponDefinitions.GunMagazine3= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine3"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}

AttachedWeaponDefinitions.GunMagazine4= {
	chance = 100,
	outfit = {"Prepper"},
	weaponLocation = {"GunMagazine4"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.9mmClip",
		"Base.45Clip",
		"Base.44Clip",
	},
}



AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Prepper = {
	chance = 90;
	maxitem = 7;
	weapons = {
		AttachedWeaponDefinitions.PrepperKnife,
		AttachedWeaponDefinitions.PrepperFlashlight,
		AttachedWeaponDefinitions.PrepperHolster,
		AttachedWeaponDefinitions.GunMagazine1,
		AttachedWeaponDefinitions.GunMagazine2,
		AttachedWeaponDefinitions.GunMagazine3,
		AttachedWeaponDefinitions.GunMagazine4,
	},
}


--> Headhunter <--

AttachedWeaponDefinitions.HeadhunterRifle= {
	chance = 100,
	outfit = {"Headhunter"},
	weaponLocation = {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.HeadhunterRifle",
	},
}

AttachedWeaponDefinitions.DeadlyHeadhunterRifle= {
	chance = 100,
	outfit = {"DeadlyHeadhunter"},
	weaponLocation = {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.DeadlyHeadhunterRifle",
	},
}

AttachedWeaponDefinitions.HeadhunterBounty= {
	chance = 100,
	outfit = {"Headhunter"},
	weaponLocation = {"Bounty Letter"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.BountyPhoto01",
		"UndeadSurvivor.BountyPhoto02",
		"UndeadSurvivor.BountyPhoto03",
		"UndeadSurvivor.BountyPhoto04",
		"UndeadSurvivor.BountyPhoto05",
		"UndeadSurvivor.BountyPhoto06",
		"UndeadSurvivor.BountyPhoto07",
		"UndeadSurvivor.BountyPhoto08",
		"UndeadSurvivor.BountyPhoto09",
		"UndeadSurvivor.BountyPhoto10",
	},
}

AttachedWeaponDefinitions.DeadlyHeadhunterBounty= {
	chance = 100,
	outfit = {"DeadlyHeadhunter"},
	weaponLocation = {"Bounty Letter"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"UndeadSurvivor.BountyPhoto01",
		"UndeadSurvivor.BountyPhoto02",
		"UndeadSurvivor.BountyPhoto03",
		"UndeadSurvivor.BountyPhoto04",
		"UndeadSurvivor.BountyPhoto05",
		"UndeadSurvivor.BountyPhoto06",
		"UndeadSurvivor.BountyPhoto07",
		"UndeadSurvivor.BountyPhoto08",
		"UndeadSurvivor.BountyPhoto09",
		"UndeadSurvivor.BountyPhoto10",
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Headhunter = {
	chance = 40;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.HeadhunterRifle,
		AttachedWeaponDefinitions.HeadhunterBounty,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.DeadlyHeadhunter = {
	chance = 40;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.DeadlyHeadhunterRifle,
		AttachedWeaponDefinitions.HeadhunterBounty,
	},
}


