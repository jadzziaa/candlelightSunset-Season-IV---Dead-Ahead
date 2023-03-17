local distributionTable = VehicleDistributions[1]

VehicleDistributions.LINMinibar = {
    rolls = 8,
    items = {
    	"BeerBottle", 20,
        "WaterBottleEmpty", 4,
        "WhiskeyFull", 30,
        "Wine", 10,
        "Wine2", 20,
        "WhiskeyFull", 10,
        "WhiskeyFull", 10,
        "BeerCanEmpty", 2,
        "BeerEmpty", 1,
        "Corkscrew", 10,
    },
    junk = {
        rolls = 1,
        items = {
            "PopBottleEmpty", 4,
        	"PopEmpty", 4,
       		"Tissue", 3,
        }
    }
}

VehicleDistributions.LINFloor = {
    rolls = 5,
    items = {
    	"GuitarElectricBassBlack", 25,
    	"PillsAntiDep", 20,
        "WaterBottleEmpty", 4,
        "PopEmpty", 4,
       	"Tissue", 10,
       	"Cigarettes", 20,
       	"Lighter", 10,
       	"Cologne", 4,

    },
}

VehicleDistributions.LIN93 = {

	GloveBox = VehicleDistributions.GolfGloveBox;
	LIN93Trunk = VehicleDistributions.GolfTruckBed;
	LIN93Minibar = VehicleDistributions.LINMinibar;
	LIN93Floor = VehicleDistributions.LINFloor;
}

distributionTable["93townCar"] = { Normal = VehicleDistributions.LIN93; }
distributionTable["93townCarLimo"] = { Normal = VehicleDistributions.LIN93; }