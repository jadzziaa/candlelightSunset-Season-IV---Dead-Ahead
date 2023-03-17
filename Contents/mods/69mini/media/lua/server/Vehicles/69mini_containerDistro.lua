local distributionTable = VehicleDistributions[1]

VehicleDistributions.MiniUnionJack = {
    rolls = 5,
    items = {
        "69miniMeatballBulldog", 10,
        "69miniCrateOfTea", 15,
        "69miniRupertBear", 9,
        "EmptyPetrolCan", 10,
        "EmptySandbag", 4,
        "Garbagebag", 6,
        "Plasticbag", 10,
        "PopBottleEmpty", 4,
        "PopEmpty", 4,
        "RubberBand", 6,
        "Tarp", 10,
        "Tissue", 10,
        "Tote", 6,
        "Twine", 10,
    }
}

VehicleDistributions.MiniItalianJob = {
    rolls = 1,
    items = {
        "69miniGoldBullions", 35,
        "DuctTape", 8,
        "EmptyPetrolCan", 10,
        "EmptySandbag", 4,
        "Garbagebag", 6,
        "Plasticbag", 10,
        "PopBottleEmpty", 4,
        "PopEmpty", 4,
        "RubberBand", 6,
        "Tarp", 10,
        "Tissue", 10,
        "Tote", 6,
        "Twine", 10,
        "WaterBottleEmpty", 4,
        "WhiskeyEmpty", 1,
    }
}

VehicleDistributions.MiniMrBean = {
    rolls = 1,
    items = {
        "69miniTeddy", 100,
    }
}

VehicleDistributions.MINI69 = {

	GloveBox = VehicleDistributions.GloveBox;
	MINI69Trunk = VehicleDistributions.TrunkStandard;
}

VehicleDistributions.MINI69UJ = {

	GloveBox = VehicleDistributions.GloveBox;
	MINI69Trunk = VehicleDistributions.MiniUnionJack;
}

VehicleDistributions.MINI69IJ = {

	GloveBox = VehicleDistributions.GloveBox;
	MINI69Trunk = VehicleDistributions.MiniItalianJob;
}

VehicleDistributions.MINI69MrB = {

	GloveBox = VehicleDistributions.GloveBox;
	MINI69Trunk = VehicleDistributions.TrunkStandard;
	SeatRearLeft = VehicleDistributions.MiniMrBean;
}

distributionTable["69mini"] = { Normal = VehicleDistributions.MINI69; }
distributionTable["69miniUnionJack"] = { Normal = VehicleDistributions.MINI69UJ; }
distributionTable["69miniIJ"] = { Normal = VehicleDistributions.MINI69IJ; }
distributionTable["69miniMrB"] = { Normal = VehicleDistributions.MINI69MrB; }
distributionTable["69miniPS"] = { Normal = VehicleDistributions.MINI69; }