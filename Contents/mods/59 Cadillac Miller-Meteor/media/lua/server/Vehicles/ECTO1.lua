local distributionTable = VehicleDistributions[1]

VehicleDistributions.ECTO1 = {

	GloveBox = VehicleDistributions.GloveBox;
	ECTO1Trunk = VehicleDistributions.TrunkHeavy;
}

distributionTable["ECTO1"] = { Normal = VehicleDistributions.ECTO1; }
distributionTable["59meteor"] = { Normal = VehicleDistributions.ECTO1; }
distributionTable["59ambulance"] = { Normal = VehicleDistributions.ECTO1; }
distributionTable["ECTO1Burnt"] = { Normal = VehicleDistributions.ECTO1; }