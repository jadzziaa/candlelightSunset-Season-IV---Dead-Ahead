local distributionTable = VehicleDistributions[1]

VehicleDistributions.R32Spare = {
    rolls = 1,
    items = {
        "R32Tire0", 500,
    }
}

VehicleDistributions.R32 = {

	GloveBox = VehicleDistributions.GloveBox;
	R32Trunk = VehicleDistributions.TrunkHeavy;
	R32Spare = VehicleDistributions.R32Spare;
}

distributionTable["92nissanGTR"] = { Normal = VehicleDistributions.R32; }