local distributionTable = VehicleDistributions[1]


VehicleDistributions.merctire = {
    rolls = 1,
    items = {
        "ModernTire3", 500,
    }
}

VehicleDistributions.mercspareTireRoofrack = {

	mercroofrack = VehicleDistributions.merctire;
	
	TruckBed = VehicleDistributions.TrunkStandard;
	TruckBedOpen = VehicleDistributions.TrunkStandard;
	TrailerTrunk = VehicleDistributions.TrunkStandard;
	
	GloveBox = VehicleDistributions.GloveBox;
	
	SeatRearLeft = VehicleDistributions.Seat;
	SeatRearRight = VehicleDistributions.Seat;
}

distributionTable["85mercJunk"] = distributionTable["CarNormal"]
distributionTable["85mercSedan"] = distributionTable["CarNormal"]
distributionTable["85mercWagon"] = distributionTable["CarNormal"]
distributionTable["85mercWagon2"] = { Normal = VehicleDistributions.mercspareTireRoofrack; }