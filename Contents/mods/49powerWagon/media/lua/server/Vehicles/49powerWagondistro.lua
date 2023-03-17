local distributionTable = VehicleDistributions[1]

VehicleDistributions.PWR = {

	GloveBox = VehicleDistributions.GloveBox;
	PWRTrunk = VehicleDistributions.TrunkHeavy;
}

distributionTable["49powerWagon"] = { Normal = VehicleDistributions.PWR; }
distributionTable["49powerWagonPA"] = { Normal = VehicleDistributions.PWR; }
distributionTable["49powerWagonPD"] = { Normal = VehicleDistributions.PWR; }