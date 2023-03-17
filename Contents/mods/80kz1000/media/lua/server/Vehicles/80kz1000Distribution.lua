local distributionTable = VehicleDistributions[1]

VehicleDistributions.CHiPs = {
	rolls = 1,
        items = {
        	"Hat_CHiPsHelmet", 500,
    }
}

VehicleDistributions.KZ1KPolice = {
        rolls = 2,
        items = {
            "308Box", 10,
            "AmmoStrap_Bullets", 4,
            "AmmoStrap_Shells", 4,
            "Bullets9mmBox", 20,
            "Bullets9mmBox", 10,
            "FiberglassStock", 4,
            "HandTorch", 4,
            "Hat_EarMuff_Protectors", 4,
            "HolsterDouble", 1,
            "HolsterSimple", 4,
            "HuntingRifle", 8,
            "M14Clip", 4,
            "Nightstick", 2,
            "Pistol", 7,
            "ShotgunShellsBox", 10,
            "Sling", 4,
            "Vest_BulletPolice", 2,
        },
        junk = {
            rolls = 1,
            items = {
                "FirstAidKit", 10,
            }
        }
}

VehicleDistributions.KZ1K = {

	KZ1Ktrunk = VehicleDistributions.CHiPs;
	KZ1Kleftbox = VehicleDistributions.KZ1KPolice;
	KZ1Krightbox = VehicleDistributions.KZ1KPolice;
}

distributionTable["80kz1000"] = { Normal = VehicleDistributions.KZ1K; }