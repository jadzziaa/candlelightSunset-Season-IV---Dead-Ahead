-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...
-- this is used in IsoZombie.addRandomAttachedWeapon()

AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

AttachedWeaponDefinitions.policeRadio = {
	chance = 30,
	outfit = {"Police", "PoliceState", "PoliceRiot"},
	weaponLocation = {"Walkie Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Radio.WalkieTalkie4",
	},
}

AttachedWeaponDefinitions.handgunDutyBelt = {
	id = "handgunDutyBelt",
	chance = 50,
	outfit = {"Police", "PoliceState", "PoliceRiot"},
	weaponLocation =  {"Holster Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "STR.Belt_PoliceDuty",
	weapons = {
		"Base.Pistol",
		"Base.Pistol2",
		"Base.Pistol3",
		"Base.Revolver",
		"Base.Revolver_Long",
		"Base.Revolver_Short",
	},
}

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceMuldraugh");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceMuldraugh");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceMuldraugh");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceMuldraughRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceMuldraughRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceMuldraughRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceMeade");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceMeade");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceMeade");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceMeadeRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceMeadeRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceMeadeRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceWestPoint");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceWestPoint");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceWestPoint");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceWestPointRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceWestPointRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceWestPointRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceRiverside");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceRiverside");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceRiverside");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceRiversideRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceRiversideRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceRiversideRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceRosewood");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceRosewood");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceRosewood");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceRosewoodRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceRosewoodRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceRosewoodRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceLouisville");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceLouisville");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceLouisville");
table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "PoliceLouisville");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceLouisvilleRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceLouisvilleRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceLouisvilleRiot");
table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "PoliceLouisvilleRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceJeffersonPD");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceJeffersonPD");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceJeffersonPD");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceJeffersonPDRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceJeffersonPDRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceJeffersonPDRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceJeffersonSD");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceJeffersonSD");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceJeffersonSD");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceJeffersonSDRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceJeffersonSDRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceJeffersonSDRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "KSP_Trooper");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "KSP_Trooper");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "KSP_Trooper");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "KSP_TrooperRiot");
table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "KSP_TrooperRiot");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "KSP_TrooperRiot");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "DOC_Meade");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "DOC_Meade");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "DOC_Jefferson");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "DOC_Jefferson");

table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "SecurityBank");
table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "SecurityBank");
table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "SecurityBank");

table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "SecurityMallOhio");
table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "SecurityMallOhio");

table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "SecurityMallValley");
table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "SecurityMallValley");

table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "SecurityMallLV");
table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "SecurityMallLV");

if getActivatedMods():contains("RavenCreek") then

AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

	table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceRavenCreek");
	table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceRavenCreek");
	table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceRavenCreek");
	table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "PoliceRavenCreek");

	table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "PoliceRavenCreekRiot");
	table.insert(AttachedWeaponDefinitions.shotgunPolice["outfit"], "PoliceRavenCreekRiot");
	table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "PoliceRavenCreekRiot");
	table.insert(AttachedWeaponDefinitions.policeRadio["outfit"], "PoliceRavenCreekRiot");

	table.insert(AttachedWeaponDefinitions.handgunDutyBelt["outfit"], "DOC_RavenCreek");
	table.insert(AttachedWeaponDefinitions.nightstick["outfit"], "DOC_RavenCreek");

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRavenCreek = {
		chance = 50;
		maxitem = 2;
		weapons = {
			AttachedWeaponDefinitions.handgunDutyBelt,
			AttachedWeaponDefinitions.shotgunPolice,
			AttachedWeaponDefinitions.nightstick,
			AttachedWeaponDefinitions.policeRadio,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRavenCreekRiot = {
		chance = 50;
		maxitem = 2;
		weapons = {
			AttachedWeaponDefinitions.handgunDutyBelt,
			AttachedWeaponDefinitions.shotgunPolice,
			AttachedWeaponDefinitions.nightstick,
			AttachedWeaponDefinitions.policeradio,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.DOC_RavenCreek = {
		chance = 50;
		maxitem = 2;
		weapons = {
			AttachedWeaponDefinitions.handgunDutyBelt,
			AttachedWeaponDefinitions.nightstick,
		},
	}

end

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceMuldraugh = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceMuldraughRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceMeade = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceMeadeRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceWestPoint = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceWestPointRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRiverside = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRiversideRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRosewood = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRosewoodRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceLouisville = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeRadio,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceLouisvilleRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeradio,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceJeffersonPD = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceJeffersonPDRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceJeffersonSD = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceJeffersonSDRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.KSP_Trooper = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.KSP_TrooperRiot = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.DOC_Meade = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.DOC_Jefferson = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SecurityBank = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunDutyBelt,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeRadio,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SecurityMallOhio = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeRadio,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SecurityMallValley = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeRadio,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SecurityMallLV = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeRadio,
	},
}
