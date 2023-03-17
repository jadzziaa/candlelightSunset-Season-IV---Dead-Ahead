local distributionTable = VehicleDistributions[1]

VehicleDistributions.SS100 = {

	SS100topbox = VehicleDistributions.PostalGloveBox;
	SS100sideBoxl = VehicleDistributions.RadioGloveBox;
	SS100sideBoxr = VehicleDistributions.RadioGloveBox;
}

distributionTable["28ss1000"] = { Normal = VehicleDistributions.SS100; }
distributionTable["28ss1000hermes"] = { Normal = VehicleDistributions.SS100; }