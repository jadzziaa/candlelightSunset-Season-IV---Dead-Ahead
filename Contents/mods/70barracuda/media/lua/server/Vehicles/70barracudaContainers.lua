local distributionTable = VehicleDistributions[1]

VehicleDistributions.CUDA = {

	GloveBox = VehicleDistributions.GloveBox;
	CUDATrunk = VehicleDistributions.TrunkSports;
}

distributionTable["70barracuda"] = { Normal = VehicleDistributions.CUDA; }
distributionTable["70cuda"] = { Normal = VehicleDistributions.CUDA; }
distributionTable["70barracudaAAR"] = { Normal = VehicleDistributions.CUDA; }