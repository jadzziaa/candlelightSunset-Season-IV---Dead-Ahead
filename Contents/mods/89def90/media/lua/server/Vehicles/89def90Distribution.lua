local distributionTable = VehicleDistributions[1]

VehicleDistributions.def90Spare = {
    rolls = 1,
    items = {
        "ModernTire2", 500,
    }
}

VehicleDistributions.def90 = {

	def90Spare = VehicleDistributions.def90Spare;
	
	TruckBed = VehicleDistributions.TrunkHeavy;
	TruckBedOpen = VehicleDistributions.TrunkHeavy;
	TrailerTrunk = VehicleDistributions.TrunkHeavy;
	
	GloveBox = VehicleDistributions.GloveBox;
	
	SeatRearLeft = VehicleDistributions.Seat;
	SeatRearRight = VehicleDistributions.Seat;
}

distributionTable["89def90"] = { Normal = VehicleDistributions.def90; }
distributionTable["89def90op"] = { Normal = VehicleDistributions.def90; }