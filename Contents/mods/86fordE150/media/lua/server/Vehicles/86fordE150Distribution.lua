local distributionTable = VehicleDistributions[1]

VehicleDistributions.DNDTrunk = {
    rolls = 7,
    items ={
        "Ketchup", 1,
        "Mustard", 1,
        "Hotdog", 1,
        "Baloney", 1,
        "Sausage", 1,
        "Burger", 1,
        "DogChew", 1,
        "Dogfood", 1,
        "DogfoodOpen", 1.5,
        "WaterDish", 1,
        "Leash", 1,
        "Scissors", 1,
        "Hat_Cowboy", 2,
        "BeerBottle", 1,
        "BeerEmpty", 1,
        "BeerCan", 1,
        "BeerCanEmpty", 1,
        "Mugfull", 1,
        "Salt", 2,
        "Underpants_AnimalPrint", 2,
        "Glasses_SkiGoggles", 2,
        "GuitarAcoustic", 1,
        "Worm", 2,
    }
}

VehicleDistributions.DNDSeat = {
    rolls = 2,
    items ={
        "Briefcase", 1,
        "Money", 2,
        "SheetPaper2", 1,
        "DeadBird", 1,
        "Hat_Spiffo", 0.2,
        "SpiffoSuit", 0.2,
        "SpiffoTail", 0.2,
        "Worm", 2,
    }
}

VehicleDistributions.DNDGloveBox = {
    rolls = 4,
    items ={
        "HottieZ", 1,
        "Revolver_Short", 1,
        "Wallet3", 1,
        "PillsVitamins", 1,
        "Map", 1,
        "Newspaper", 1,
        "Chocolate", 1,
        "BeefJerky", 1,
        "Burger", 1,
        "Matches", 2,
        "Gloves_WhiteTINT", 1,
        "Scarf_White", 2,
        "Worm", 1,
        "Worm", 2,
    }
}

VehicleDistributions.PaydayTrunk = {
    rolls = 7,
    items ={
        "PaydayGoldBars", 5,
        "PaydayCoke", 4,
        "PaydayMoneyPile", 4,
        "PaydayMeth", 4,
        "PaydayToothbrush", 3,
        "Money", 3,
        "Hat_chains_mask_blank", 4,
        "Hat_dallas_mask_blank", 4,
        "Hat_hoxton_mask_blank", 4,
        "Hat_wolf_mask_blank", 4,
        "Hat_chains_mask", 3,
        "Hat_dallas_mask", 3,
        "Hat_hoxton_mask", 3,
        "Hat_wolf_mask", 3,
        "PaydayLootBag", 3,

    }
}

VehicleDistributions.PaydayCabinet = {
    rolls = 5,
    items ={
        "Hat_chains_mask", 5,
        "Hat_dallas_mask", 5,
        "Hat_hoxton_mask", 5,
        "Hat_wolf_mask", 5,
        "Gloves_Surgical", 4,
        "Hat_chains_mask_blank", 3,
        "Hat_dallas_mask_blank", 3,
        "Hat_hoxton_mask_blank", 3,
        "Hat_wolf_mask_blank", 3,
        "Shirt_FormalWhite", 3,
        "ShirtFormalTINT", 3,
        "Vest_BulletCivilian", 3,
        "Vest_BulletPolice", 3,
        "Suit_Jacket", 3,
        "Trousers_Suit", 3,
        "Shoes_Random", 3,
        "Boilersuit_Prisoner", 3,
        "Shotgun", 3,
        "DoubleBarrelShotgun", 3,
        "PaydayAmmoBag", 3,
        "PaydayBodyBagCase", 3,
        "PaydayFirstAidKit", 3,
        "PaydayLootBag", 3,
        "PaydayMoneyPile", 3,

    }
}

VehicleDistributions.PaydayGlovebox = {
    rolls = 2,
    items ={
        "Gloves_Surgical", 2,
        "Money", 2,
        "Revolver_Long", 1,
        "Pistol", 1,
        "WalkieTalkie4", 1,
        "Glasses_Aviators", 1,
        "Hat_BalaclavaFull", 1,
        "Tie_Full", 1,

    }
}

VehicleDistributions.F150dnd = {

    GloveBox = VehicleDistributions.DNDGloveBox;
    E150Trunk = VehicleDistributions.DNDTrunk;
    SeatMiddleLeft = VehicleDistributions.DNDSeat;
}

VehicleDistributions.E150pd = {

    GloveBox = VehicleDistributions.PaydayGlovebox;
    E150Trunk = VehicleDistributions.PaydayTrunk;
    E150RearCabinet = VehicleDistributions.PaydayCabinet;
}

VehicleDistributions.F150 = {

	GloveBox = VehicleDistributions.GloveBox;
	E150Trunk = VehicleDistributions.TrunkHeavy;
}

distributionTable["86fordE150"] = { Normal = VehicleDistributions.F150; }
distributionTable["86fordE150dnd"] = { Normal = VehicleDistributions.F150dnd; }
distributionTable["86fordE150slide"] = { Normal = VehicleDistributions.F150; }
distributionTable["86fordE150long"] = { Normal = VehicleDistributions.F150; }
distributionTable["86fordE150pd"] = { Normal = VehicleDistributions.E150pd; }