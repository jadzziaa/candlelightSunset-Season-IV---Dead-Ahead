local distributionTable = VehicleDistributions[1]

VehicleDistributions.ARRWsmallTrunkCiv = {
    rolls = 3,
    items ={
	"Hat_Fireman", 3,
	"Jacket_Fireman", 3,
        "Radio.WalkieTalkie5", 2,
	"EmptyPetrolCan", 5,
	"PetrolCan", 2,
        "Radio.WalkieTalkie4",2,
        "Radio.WalkieTalkie5",2,
        "farming.WateredCan", 3,
        "Bandage", 2,
        "Bandage", 2,
        "FirstAidKit", 1,
        "FirstAidKit", 1,
        "Bandaid", 2,
        "Bandaid", 2,
        "Tweezers", 4,
        "Disinfectant", 4,
        "AlcoholWipes", 3,
        "SutureNeedle", 2,
	
    }
}

VehicleDistributions.ARRWbigTrunkCiv = {
    rolls = 2,
    items ={
        "90pierceArrowTire2", 10,
	"Hat_Fireman", 5,
	"Jacket_Fireman", 5,
	"Trousers_Fireman", 5,
        "Hat_GasMask", 3,
        "Radio.WalkieTalkie5", 3,
        "FirstAidKit", 3,
	"EmptyPetrolCan", 3,
	"PetrolCan", 2,
	"Shoes_Wellies", 3,
        "Axe", 3,
        "Radio.WalkieTalkie4",2,
        "Radio.WalkieTalkie5",2,
        "farming.WateredCan", 3,
        "Bandage", 2,
        "Bandage", 2,
        "FirstAidKit", 1,
        "FirstAidKit", 1,
        "Bandaid", 2,
        "Bandaid", 2,
        "Tweezers", 4,
        "Disinfectant", 4,
        "AlcoholWipes", 3,
        "SutureNeedle", 2,
	
    }
}

VehicleDistributions.ARRW = {
	
	GloveBox = VehicleDistributions.FireGloveBox;

    ARRWTrunk = VehicleDistributions.FireTruckBed;
	ARRWTrunkLTL = VehicleDistributions.FireTruckBed;
    ARRWTrunkLTR = VehicleDistributions.ARRWbigTrunkCiv;
    ARRWTrunkLBL = VehicleDistributions.FireTruckBed;
    ARRWTrunkLBR = VehicleDistributions.ARRWsmallTrunkCiv;

    ARRWTrunkRL = VehicleDistributions.ARRWsmallTrunkCiv;
    ARRWTrunkRR = VehicleDistributions.ARRWsmallTrunkCiv;
}

distributionTable["90pierceArrow"] = { Normal = VehicleDistributions.ARRW; }