LZTable = 
{
	-- chance desde x.xxxxx hasta 100%
	-- Items diferentes a modulo Base requieren su propio modulo.
	-- La dificultad de other loot variará la chance del item siendo de esta manera:
		-- Bastante Raro: -25% (de) la chance seteada. Ejemplo = "75 de chance pasa a ser 56,25"
		-- Raro: La chance seteada. Ejemplo = "75 de chance pasa a ser 75"
		-- Normal: +5% (de) la chance seteada. Ejemplo = "75 de chance pasa a ser 78.75"
		-- Común: +12,5% (de) la chance seteada. Ejemplo = "75 de chance pasa a ser 84,375"
		-- Abundante: +25% (de) la chance seteada. Ejemplo = "75 de chance pasa a ser 93,75"
		
	--Al total de la chance real se le sumará un 25% de esa chance si el zombie lleva una mochila en la espalda y los items aparecerán dentro (En el caso de que no esté llena)
		
	--Formato:
	-- Item, chance, Count(Propiedad de Script Opcional para decidir si spawnear una unidad o la cantidad especificada en la propiedad Count de Script)
	--Ejemplos:

	--Clavos con 25% de chance (1 Unidad)
	--{"Nails", 25}, 
	
	--Clavos con 25% de chance (5 Unidades como se especifica en el script)
	--{"Nails", 25, true}, 

	AirCrew = {
		{"Radio.WalkieTalkie5", 10},
		{"HandTorch", 15},
	},
	AmbulanceDriver = {
		{"FirstAidKit", 15},
		{"Gloves_Surgical", 20},
		{"Hat_SurgicalMask_Blue", 20},
	},
	ArmyCamoDesert = {
		{"Radio.WalkieTalkie5", 10},
		{"HandTorch", 15},
	},
	ArmyCamoGreen = {
		{"Radio.WalkieTalkie5", 10},
		{"HandTorch", 15},
	},
	ArmyInstructor = {
		{"Radio.WalkieTalkie5", 10},
		{"HandTorch", 15},
	}, --OnlyMale
	ArmyServiceUniform = {
		{"Radio.WalkieTalkie5", 10},
		{"HandTorch", 15},
	},
	Bandit = {
		{"PipeBomb", 10},
		{"WhiskeyFull", 10},
		{"HottieZ", 15},
		{"Cigarettes", 20, true},
		{"Lighter", 20},
	},
	BaseballPlayer_KY = {
		{"Baseball", 25},
	},
	BaseballPlayer_Rangers = {
		{"Baseball", 25},
	},
	BaseballPlayer_Z = {
		{"Football", 25},
	},
	Bathrobe = {
		{"BathTowelWet", 25},
		{"Soap2", 30},
	},
	Bedroom = {
		{"PillsSleepingTablets", 15},
		{"AlarmClock2", 15},
	},
	Biker = {
		{"BeerCan", 15},
		{"BeerBottle", 15},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Cigarettes", 30},
		{"Lighter", 30},
	},
	
	-- Bob = {
	-- }, --OnlyMale
	
	Camper = {
		{"FlintKnife", 10},
		{"PlantainCataplasm", 15},
		{"ComfreyCataplasm", 15},
		{"WildGarlicCataplasm", 15},
		{"SharpedStone", 15},
		{"BerryBlack", 30},
		{"BerryBlue", 30},
		{"BerryGeneric1", 30},
		{"BerryGeneric2", 30},
		{"BerryGeneric3", 30},
		{"BerryGeneric4", 30},
		{"BerryGeneric5", 30},
	},
	Chef = {
		{"PotOfSoupRecipe", 10},
		{"MeatCleaver", 15},
		{"farming.Potato", 30},
		{"farming.Tomato", 30},
},
	Classy = {
		{"Cigarettes", 25, true},
		{"Lighter", 25},
	},
	ConstructionWorker = {
		{"NailsBox", 10},
		{"DuctTape", 10},
		{"Woodglue", 10},
		{"Glue", 10},
		{"Scotchtape", 10},
		{"Nails", 25},
		{"Nails", 25},
		{"Nails", 25},
		{"Nails", 25},
		{"Nails", 25},
		{"Nails", 35, true},
	}, --OnlyMale
	Cook_Generic = {
		{"Vinegar", 15},
		{"Yeast", 15},
		{"Flour", 15},
	},
	Cook_IceCream = {
		{"IcecreamMelted", 15},
		{"IcePick", 15},
	},
	Cook_Spiffos = {
		{"Burger", 10},
		{"ChickenFried", 10},
		{"Corndog", 10},
		{"Fries", 15},
		{"PopBottle", 15},
	},
	Cyclist = {
		{"Banana", 10},
		{"Apple", 10},
		{"WaterBottleFull", 15},
	},
	Doctor = {
		{"Bandage", 10},
		{"Splint", 10},
		{"FirstAidKit", 10},
		{"Gloves_Surgical", 15},
		{"Hat_SurgicalMask_Blue", 15},
		{"Scalpel", 15},
	},
	DressLong = {
		{"Needle", 10},
		{"Thread", 10},
		{"HairDyeBlack", 10},
	}, --OnlyFemale
	DressNormal = {	
		{"HairDyeBlack", 10},
		{"HairDyeBlonde", 10},
	}, --OnlyFemale
	DressShort = {
		{"HairDyeBlonde", 10},
		{"HairDyePink", 10},
	}, --OnlyFemale
	Farmer = {
		{"FarmingMag1", 5},
		{"farming.GardeningSprayMilk", 5},
		{"farming.GardeningSprayCigarettes", 5},
		{"farming.GardeningSprayFull", 10},
		{"farming.WateredCanFull", 10},
		{"farming.HandShovel", 15},
		{"SeedBag", 15},
	},
	Fireman = {
		{"Axe", 5},
		{"WalkieTalkie4", 10},
		{"Extinguisher", 20},
	},
	FiremanFullSuit = {
		{"Axe", 10},
		{"Extinguisher", 15},
	},
	Fisherman = {
		{"Trout", 10},
		{"FishingRod", 10},
		{"FishingNet", 10},
		{"FishingTackle", 10},
		{"FishingTackle2", 10},
		{"FishingLine", 10},
		{"Twine", 15},
	}, --OnlyMale
	FitnessInstructor = {
		{"BarBell", 10},
		{"DumbBell", 15},
	},
	Foreman = {
		{"DuctTape", 10},
		{"Woodglue", 10},
		{"Glue", 10},
		{"Scotchtape", 10},
	}, --OnlyMale
	Fossoil = {
		{"PetrolCan", 10},
	},
	Gas2Go = {
		{"PetrolCan", 10},
	},
	-- Generic_Skirt = {
	-- }, --OnlyFemale

	-- Generic01 = {
	-- },
	-- Generic02 = {
	-- },
	-- Generic03 = {
	-- },
	-- Generic04 = {
	-- },
	-- Generic05 = {	
	-- },

	Ghillie = {
		{"WalkieTalkie5", 10},
		{"HuntingKnife", 15},
	}, --OnlyMale
	GigaMart_Employee = {
		{"Broom", 10},
		{"Garbagebag", 15},
	},
	Golfer = {
		{"GolfBall", 25},
	},
	Groom = {
	}, --OnlyMale
	HazardSuit = {
	},
	HockeyPsycho = {
	}, --OnlyMale
	HospitalPatient = {
		{"BandageDirty", 10},
		{"BandageDirty", 10},
		{"BandageDirty", 10},
		{"BandageDirty", 10},
		{"BandageDirty", 10},
	},
	Hunter = {
		{"DeadRabbit", 5},
		{"Twine", 5},
		{"DeadSquirrel", 10},
		{"TrapMouse", 20},
	}, --OnlyMale
	Inmate = {
		{"IcePick", 10},
		{"ChairLeg", 10},
		{"TableLeg", 10},
	}, --OnlyMale
	InmateEscaped = {
		{"IcePick", 10},
		{"ChairLeg", 10},
		{"TableLeg", 10},
	}, --OnlyMale
	InmateKhaki = {
		{"IcePick", 10},
		{"ChairLeg", 10},
		{"TableLeg", 10},
	}, --OnlyMale
	Jewelry = {
	}, --OnlyMale
	Jockey01 = {
	}, --OnlyMale
	Jockey02 = {
	}, --OnlyMale
	Jockey03 = {
	}, --OnlyMale
	Jockey04 = {
	}, --OnlyFemale
	Jockey05 = {
	}, --OnlyFemale
	Jockey06 = {
	}, --OnlyMale
	-- Kate = {
	-- }, --OnlyFemale
	MallSecurity = {
		{"WalkieTalkie4", 15},
		{"HandTorch", 15}, 
	}, --OnlyMale
	McCoys = {
		{"WoodAxe", 5},
		{"Saw", 5},
		{"DuctTape", 10},
		{"Woodglue", 10},
	}, --OnlyMale

	-- Mannequin1 = {
	-- }, --OnlyFemale
	-- Mannequin2 = {
	-- }, --OnlyFemale

	Mechanic = {
		{"EngineParts", 5},
		{"EngineParts", 5},
		{"EngineParts", 5},
		{"EngineParts", 5},
		{"EngineParts", 5},
		{"CarBatteryCharger", 5},
		{"Jack", 10},
		{"LugWrench", 10},
		{"TirePump", 10},
		{"Wrench", 15},
	}, --OnlyMale
	MetalWorker = {
		{"SheetMetal", 5},
		{"SmallSheetMetal", 5},
		{"ScrewsBox", 10},
		{"ScrapMetal", 10},
		{"WeldingRods", 15},
		{"BlowTorch", 15},
		{"Wire", 15},
		{"Screws", 25},
		{"Screws", 25},
		{"Screws", 25},
		{"Screws", 25},
		{"Screws", 25},
		{"Screws", 35, true},
	}, --OnlyMale
	Naked = {
	},
	NakedVeil = {
	}, --OnlyFemale
	Nurse = {
		{"SutureNeedle", 10},
		{"FirstAidKit", 15},
		{"Tweezers", 15},
		{"Gloves_Surgical", 15},
		{"Hat_SurgicalMask_Blue", 15},
	},
	OfficeWorker = {
		{"Pen", 10},
		{"Notebook", 10},
	}, --OnlyMale
	OfficeWorkerSkirt = {
		{"Pen", 10},
		{"MintCandy", 15},
	}, --OnlyFemale
	Party = {
		{"Pop", 10},
		{"Crisps", 10},
	},
	Pharmacist = {
		{"Pills", 10},
		{"PillsAntiDep", 10},
		{"PillsBeta", 10},
		{"PillsSleepingTablets", 10},
		{"PillsVitamins", 10},
	},
	PokerDealer = {
		{"BeerCan", 10},
		{"BeerBottle", 15},
		{"Dice", 15},
		{"Money", 25},
		{"Money", 25},
		{"Money", 25},
		{"Money", 25},
		{"Money", 25},
		{"Money", 25},
	}, --OnlyMale
	Police = {
		{"WalkieTalkie4", 10},
		{"HandTorch", 10},
	},
	PoliceRiot = {
		{"WalkieTalkie4", 10},
		{"HandTorch", 10},
	}, --OnlyMale
	PoliceState = {
		{"WalkieTalkie4", 10},
		{"HandTorch", 10},
	},
	Postal = {
		{"LetterOpener", 15},
	},
	Priest = {
		{"Wine2", 15},
	}, --OnlyMale
	PrisonGuard = {
		{"WalkieTalkie4", 10},
		{"HandTorch", 15},
	}, --OnlyMale
	PrivateMilitia = {
		{"WalkieTalkie5", 10},
	},
	Punk = {
		{"BeerCan", 15},
		{"BeerBottle", 15},
		{"Hairgel", 15},
	},
	-- Raider = {
	-- }, --OnlyMale
	Ranger = {
		{"WalkieTalkie4", 10},
		{"Torch", 10},
		{"Extinguisher", 15},
	},
	Redneck = {
		{"BeerCan", 10},
		{"BeerBottle", 15},
	},
	Rocker = {
		{"WhiskeyFull", 10},
		{"Cigarettes", 15, true},
		{"Lighter", 20},
	},
	Santa = {
		{"AssaultRifle", 50},
		{"Candycane", 100},
		{"Candycane", 100},
		{"Candycane", 100},
		{"Candycane", 100},
		{"Candycane", 100},
	 },
	SantaGreen = {
		{"Candycane", 100},
		{"Candycane", 100},
		{"Candycane", 100},
		{"Candycane", 100},
		{"Candycane", 100},
	 },
	Security = {
		{"WalkieTalkie4", 10},
		{"HandTorch", 15},
	}, --OnlyMale
	-- Ski = {
	-- },
	Spiffo = {
		{"Sledgehammer", 10},
		{"SpiffoBig", 50},
		{"Spiffo", 100},
	},
	SportsFan = {
		{"TennisBall", 15},
		{"TennisRacket", 15},
	},
	StreetSports = {
		{"DumbBell", 10},
	},
	Student = {
		{"Glue", 10},
		{"Scotchtape", 10},
		{"ComicBook", 15},
	},
	-- Survivalist = {
	-- },
	-- Survivalist02 = {
	-- },
	-- Survivalist03 = {
	-- },
	Swimmer = {
		{"BathTowelWet", 15},
	},
	Teacher = {
		{"Book", 20},
	},
	
	-- test = {
	-- }, --OnlyFemale

	Thug = {
		{"IcePick", 15},
		{"ChairLeg", 15},
		{"TableLeg", 15},
		{"Cigarettes", 20, true},
		{"Lighter", 25},
	}, --OnlyMale
	ThunderGas = {
		{"PetrolCan", 10},
	},
	TinFoilHat = {
		{"Bleach", 20},
	},
	Tourist = {
		{"MarchRidgeMap", 5},
		{"MuldraughMap", 5},
		{"RiversideMap", 5},
		{"RosewoodMap", 5},
		{"WestpointMap", 5},
		{"Pen", 10},
	},
	Trader = {
	},

	-- TutorialBrother1 = {
	-- }, --OnlyMale
	-- TutorialBrother2 = {
	-- }, --OnlyMale
	-- TutorialDad = {
	-- }, --OnlyMale
	-- TutorialMom = {
	-- }, --OnlyFemale

	-- Varsity = {
	-- },
	Veteran = {
		{"PillsAntiDep", 15},
	}, --OnlyMale
	Waiter_Classy = {
		{"Wine", 10},
		{"Corkscrew", 15},
		{"Wine2", 15},
	},
	Waiter_Diner = {
		{"Corkscrew", 15},
		{"Ketchup", 15},
		{"Mustard", 15},
	},
	Waiter_Market = {
		{"Potato", 10},
		{"Tomato", 10},
		{"Eggplant", 10},
	},
	Waiter_PileOCrepe = {
		{"Pie", 10},
		{"CakeSlice", 10},
		{"Chocolate", 10},
		{"CookieChocolateChip", 15},
		{"CookieJelly", 15},
		{"Modjeska", 20},
	},
	Waiter_PizzaWhirled = {
		{"Pizza", 10},
		{"Pop", 15},
	},
	Waiter_Restaurant = {
		{"Wine", 10},
		{"Corkscrew", 15},
		{"Wine2", 20},
	},
	Waiter_Spiffo = {
		{"Ketchup", 10},
		{"Mustard", 10},
		{"PopBottle", 15},
	},
	-- Waiter_TachoDelPancho = {
	-- },
	WeddingDress = {
		{"Needle", 10},
		{"Thread", 10},
	}, --OnlyFemale

}

--Lista Actual (Build 41.53) de Outfits Base
----------------------------------
-- AirCrew
-- AmbulanceDriver
-- ArmyCamoDesert
-- ArmyCamoGreen
-- ArmyInstructor (Solo masculino)
-- ArmyServiceUniform
-- Bandit
-- BaseballPlayer_KY
-- BaseballPlayer_Rangers
-- BaseballPlayer_Z
-- Bathrobe
-- Bedroom
-- Biker
-- Bob (Solo masculino)
-- Camper
-- Chef
-- Classy
-- ConstructionWorker (Solo masculino)
-- Cook_Generic
-- Cook_IceCream
-- Cook_Spiffos
-- Cyclist
-- Doctor
-- DressLong (Solo femenino)
-- DressNormal (Solo femenino)
-- DressShort (Solo femenino)
-- Farmer
-- Fireman
-- FiremanFullSuit
-- Fisherman (Solo masculino)
-- FitnessInstructor
-- Foreman (Solo masculino)
-- Fossoil
-- Gas2Go
-- Generic_Skirt (Solo femenino)
-- Generic01
-- Generic02
-- Generic03
-- Generic04
-- Generic05
-- Ghillie (Solo masculino)
-- GigaMart_Employee
-- Golfer
-- Groom (Solo masculino)
-- HazardSuit
-- HockeyPsycho (Solo masculino)
-- HospitalPatient
-- Hunter (Solo masculino)
-- Inmate (Solo masculino)
-- InmateEscaped (Solo masculino)
-- InmateKhaki (Solo masculino)
-- Jewelry (Solo masculino)
-- Jockey01 (Solo masculino)
-- Jockey02 (Solo masculino)
-- Jockey03 (Solo masculino)
-- Jockey04 (Solo femenino)
-- Jockey05 (Solo femenino)
-- Jockey06 (Solo masculino)
-- Kate (Solo femenino)
-- MallSecurity (Solo masculino)
-- McCoys (Solo masculino)
-- Mannequin1 (Solo femenino)
-- Mannequin2 (Solo femenino)
-- Mechanic (Solo masculino)
-- MetalWorker (Solo masculino)
-- Naked
-- NakedVeil (Solo femenino)
-- Nurse
-- OfficeWorker  (Solo masculino)
-- OfficeWorkerSkirt (Solo femenino)
-- Party
-- Pharmacist
-- PokerDealer (Solo masculino)
-- Police
-- PoliceRiot (Solo masculino)
-- PoliceState
-- Postal
-- Priest (Solo masculino)
-- PrisonGuard (Solo masculino)
-- PrivateMilitia
-- Punk
-- Raider (Solo masculino)
-- Ranger
-- Redneck
-- Rocker
-- Santa
-- SantaGreen
-- Security (Solo masculino)
-- Ski
-- Spiffo
-- SportsFan
-- StreetSports
-- Student
-- Survivalist
-- Survivalist02
-- Survivalist03
-- Swimmer
-- Teacher
-- test (Solo femenino)
-- Thug (Solo masculino)
-- ThunderGas
-- TinFoilHat
-- Tourist
-- Trader
-- TutorialBrother1 (Solo masculino)
-- TutorialBrother2 (Solo masculino)
-- TutorialDad (Solo masculino)
-- TutorialMom (Solo femenino)
-- Varsity
-- Veteran (Solo masculino)
-- Waiter_Classy
-- Waiter_Diner
-- Waiter_Market
-- Waiter_PileOCrepe
-- Waiter_PizzaWhirled
-- Waiter_Restaurant
-- Waiter_Spiffo
-- Waiter_TachoDelPancho
-- WeddingDress (Solo femenino)