local distributionTable = VehicleDistributions[1]

VehicleDistributions.W460 = {

	GloveBox = VehicleDistributions.GloveBox;
	W460Trunk = VehicleDistributions.TrunkHeavy;
}

distributionTable["84mercLWB2"] = { Normal = VehicleDistributions.W460; }
distributionTable["84mercLWB4"] = { Normal = VehicleDistributions.W460; }
distributionTable["84mercSWB"] = { Normal = VehicleDistributions.W460; }