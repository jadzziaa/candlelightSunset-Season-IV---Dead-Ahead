local distributionTable = VehicleDistributions[1]

VehicleDistributions.sableSpare = {
    rolls = 1,
    items = {
        "ModernTire1", 500,
    }
}

VehicleDistributions.sableConsole = {
    rolls = 2,
    items = {
        "Tissue", 10,
        "Battery", 10,
        "BluePen", 8,
        "WaterBottleEmpty", 4,
        "Earbuds", 2,
        "Glasses_Sun", 2,
        "Glasses_Aviators", 1,

    }
}

VehicleDistributions.sable = {

	sableSpare = VehicleDistributions.sableSpare;

	CenterConsole = VehicleDistributions.sableConsole;
	
	TruckBed = VehicleDistributions.TrunkStandard;
	
	GloveBox = VehicleDistributions.GloveBox;
	
	SeatRearLeft = VehicleDistributions.Seat;
	SeatRearRight = VehicleDistributions.Seat;
}

distributionTable["08sable"] = { Normal = VehicleDistributions.sable; }