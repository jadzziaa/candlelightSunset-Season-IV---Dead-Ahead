local distributionTable = VehicleDistributions[1]

VehicleDistributions.def110Spare = {
    rolls = 1,
    items = {
        "ModernTire2", 500,
    }
}

VehicleDistributions.def110 = {

	def110Spare = VehicleDistributions.def110Spare;
	
	TruckBed = VehicleDistributions.TrunkHeavy;
	TruckBedOpen = VehicleDistributions.TrunkHeavy;
	TrailerTrunk = VehicleDistributions.TrunkHeavy;
	
	GloveBox = VehicleDistributions.GloveBox;
	
	SeatRearLeft = VehicleDistributions.Seat;
	SeatRearRight = VehicleDistributions.Seat;
}

distributionTable["89def110"] = { Normal = VehicleDistributions.def110; }
distributionTable["89def110op"] = { Normal = VehicleDistributions.def110; }