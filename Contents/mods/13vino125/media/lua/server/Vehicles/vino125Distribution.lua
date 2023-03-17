local distributionTable = VehicleDistributions[1]

VehicleDistributions.VN125 = {

	VN125TopBags = VehicleDistributions.PostalGloveBox;
	VN125SideBags = VehicleDistributions.RadioGloveBox;
}

VehicleDistributions.PizzaBoy = {

    VN125PizzaBox = VehicleDistributions.SpiffoTruckBed;
}

distributionTable["vino125"] = { Normal = VehicleDistributions.VN125; }
distributionTable["vino125b"] = { Normal = VehicleDistributions.VN125; }
distributionTable["vino125pizza"] = { Normal = VehicleDistributions.PizzaBoy; }