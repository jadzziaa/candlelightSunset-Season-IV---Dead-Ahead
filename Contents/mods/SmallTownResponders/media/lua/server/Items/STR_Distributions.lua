require 'Items/Distributions'

Distributions = Distributions or {};

local function STRDistributions()

	-- Check if the custom loot zones are enabled in sandbox options
	if SandboxVars.STR.LootZones then

	local STRdistributionTable = {

		policestorage = {
			locker = {
				procedural = true,
				procList = {
					{name="PoliceStorageGuns", min=0, max=99, forceForTiles="furniture_storage_02_8;furniture_storage_02_9;furniture_storage_02_10;furniture_storage_02_11"},
					{name="PoliceStorageOutfit", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7"},
					{name="LockerMeadeSO", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="MeadeSOL"},
					{name="LockerRiversidePD", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="RiversidePDL"},
					{name="LockerJeffersonSD", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="JeffersonSDL"},
				},
				dontSpawnAmmo = true,
			}
		},

		janitor = {
			metal_shelves = {
				procedural = true,
				procList = {
					{name="JanitorTools", min=1, max=1, weightChance=100},
					{name="JanitorCleaning", min=1, max=1, weightChance=100},
					{name="JanitorChemicals", min=0, max=99, weightChance=100},
					{name="LockersJeffersonEMS", min=0, max=99, forceForZones="JeffersonEMSL"},
				}
			},
			counter = {
				procedural = true,
				procList = {
					{name="JanitorMisc", min=1, max=1, weightChance=100},
					{name="JanitorTools", min=0, max=1, weightChance=100},
					{name="JanitorCleaning", min=0, max=1, weightChance=100},
					{name="JanitorChemicals", min=0, max=99, weightChance=100},
					{name="LockersJeffersonEMS", min=0, max=99, forceForZones="JeffersonEMSL"},
					{name="LockersLouisvilleEMS", min=0, max=99, forceForZones="LouisvilleEMSL"},
				}
			},
			crate = {
				procedural = true,
				procList = {
					{name="JanitorChemicals", min=0, max=99},
				}
			}
		},

		all = {
			metal_shelves = {
				procedural = true,
				procList = {
					{name="LockersLouisvilleEMS", min=0, max=99, forceForZones="LouisvilleEMSL"},
					{name="AllMetalShelves", min=0, max=99},
				}
			},
			crate = {
				procedural = true,
				procList = {
					{name="LockerValleyMall", min=0, max=99, forceForZones="MallValleyL"},
					{name="AllCrate", min=0, max=99},
				}
			},
			locker = {
				procedural = true,
				procList = {
					{name="Locker", min=0, max=99, weightChance=100},
					{name="LockerArmyBedroom", min=0, max=99, forceForZones="Army"},
					{name="LockerArmyBedroom", min=0, max=99, forceForItems="furniture_bedding_01_56;furniture_bedding_01_57;furniture_bedding_01_58;furniture_bedding_01_59"},
					{name="LockerClassy", min=0, max=99, forceForZones="Rich"},
					{name="LockersUSPSHQ", min=0, max=99, forceForZones="USPSL"},
				}
			},
		},

		changeroom = {
			locker = {
				procedural = true,
				procList = {
					{name="BowlingAlleyLockers", min=0, max=99, forceForRooms="bowlingalley"},
					{name="FactoryLockers", min=0, max=99, forceForRooms="batteryfactory;brewery;dogfoodfactory;factory;fryshipping;metalshop;radiofactory;warehouse;wirefactory;whiskeybottling"},
					{name="FireDeptLockers", min=0, max=99, forceForRooms="firestorage"},
					{name="GymLockers", min=0, max=99, forceForRooms="fitness"},
					{name="HospitalLockers", min=0, max=99, forceForRooms="hospitalroom"},
					{name="HuntingLockers", min=0, max=99, forceForRooms="hunting"},
					{name="PoliceLockers", min=0, max=99, forceForRooms="policestorage"},
					{name="PrisonGuardLockers", min=0, max=99, forceForRooms="cells"},
					{name="LockerRosewoodSD", min=0, max=99, forceForRooms="policestorage", forceForZones="RosewoodSDL"},
					{name="LockerMuldraughPD", min=0, max=99, forceForRooms="policestorage", forceForZones="MuldraughPDL"},
					{name="LockerWestPointPD", min=0, max=99, forceForRooms="policestorage", forceForZones="WestPointPDL"},
					{name="LockerLouisvillePD", min=0, max=99, forceForZones="LouisvillePDL"},
					{name="LockerJeffersonPD", min=0, max=99, forceForZones="JeffersonPDL"},
					{name="LockerJeffersonSD", min=0, max=99, forceForZones="JeffersonSDL"},
					{name="LockerKSP", min=0, max=99, forceForRooms="lockerroom", forceForZones="LouisvilleKSPL"},
					{name="LockerMeadeDOC", min=0, max=99, forceForRooms="policestorage", forceForZones="RosewoodPrisonL"},
					{name="FireDeptLockersRW", min=0, max=99, forceForZones="FireDeptRWL"},
					{name="FireDeptLockersLV", min=0, max=99, forceForZones="FireDeptLVL"},
					{name="LockersUSPSHQ", min=0, max=99, forceForZones="USPSL"},
				}
			}
		},

		garagestorage = {
			locker = {
				procedural = true,
				procList = {
					{name="FireDeptLockers", min=0, max=99, forceForRooms="firestorage"},
					{name="GarageFirearms", min=0, max=99, forceForTiles="furniture_storage_02_8;furniture_storage_02_9;furniture_storage_02_10;furniture_storage_02_11"},
					{name="GarageTools", min=0, max=99, weightChance=100},
					{name="FireDeptLockersRW", min=0, max=99, forceForZones="FireDeptRWL"},
					{name="FireDeptLockersLV", min=0, max=99, forceForZones="FireDeptLVL"},
				}
			}
		},

		dentiststorage = {
			isShop = true,
			metal_shelves = {
				procedural = true,
				procList = {
					{name="MedicalStorageDrugs", min=0, max=6, weightChance=100},
					{name="MedicalStorageTools", min=0, max=4, weightChance=80},
					{name="MedicalStorageOutfit", min=0, max=2, weightChance=40},
					{name="LockersMeadeEMS", min=0, max=99, forceForZones="MeadeEMSL"},
				}
			}
		},

		prisoncells = {
			wardrobe = {
				procedural = true,
				procList = {
					{name="PrisonCellRandom", min=0, max=99},
					{name="PrisonCellMeadeRandom", min=0, max=99, forceForZones="RosewoodPrisonInmateCellL"},
					{name="PrisonCellMeadeMaxRandom", min=0, max=99, forceForZones="RosewoodPrisonInmateMaxCellL"},
					{name="PrisonCellLouisvilleRandom", min=0, max=99, forceForZones="LouisvillePDPrisonCellL"},
				}
			}
		},

		laundry = {
			clothingdryer = {
				procedural = true,
				procList = {
					{name="GymLaundry", min=0, max=99, forceForRooms="fitness"},
					{name="Empty", min=0, max=99, weightChance=100},
					{name="LaundryHospital", min=0, max=99, forceForRooms="hospitalroom"},
					{name="LaundryLoad1", min=0, max=1, weightChance=10},
					{name="LaundryLoad2", min=0, max=1, weightChance=10},
					{name="LaundryLoad3", min=0, max=1, weightChance=10},
					{name="LaundryLoad4", min=0, max=1, weightChance=10},
					{name="LaundryLoad5", min=0, max=1, weightChance=10},
					{name="LaundryLoad6", min=0, max=1, weightChance=10},
					{name="LaundryLoad7", min=0, max=1, weightChance=10},
					{name="LaundryLoad8", min=0, max=1, weightChance=10},
					{name="LaundryInmateMeade", min=0, max=99, forceForZones="RosewoodPrisonInmateL"},
					{name="LaundryInmateLouisville", min=0, max=99, forceForZones="LouisvillePDPrisonL"},
				}
			},
			clothingdryerbasic = {
				procedural = true,
				procList = {
					{name="GymLaundry", min=0, max=99, forceForRooms="fitness"},
					{name="Empty", min=0, max=99, weightChance=100},
					{name="LaundryHospital", min=0, max=99, forceForRooms="hospitalroom"},
					{name="LaundryLoad1", min=0, max=1, weightChance=10},
					{name="LaundryLoad2", min=0, max=1, weightChance=10},
					{name="LaundryLoad3", min=0, max=1, weightChance=10},
					{name="LaundryLoad4", min=0, max=1, weightChance=10},
					{name="LaundryLoad5", min=0, max=1, weightChance=10},
					{name="LaundryLoad6", min=0, max=1, weightChance=10},
					{name="LaundryLoad7", min=0, max=1, weightChance=10},
					{name="LaundryLoad8", min=0, max=1, weightChance=10},
					{name="LaundryInmateMeade", min=0, max=99, forceForZones="RosewoodPrisonInmateL"},
					{name="LaundryInmateLouisville", min=0, max=99, forceForZones="LouisvillePDPrisonL"},
				}
			},
			clothingwasher = {
				procedural = true,
				procList = {
					{name="GymLaundry", min=0, max=99, forceForRooms="fitness"},
					{name="Empty", min=0, max=99, weightChance=100},
					{name="LaundryHospital", min=0, max=99, forceForRooms="hospitalroom"},
					{name="LaundryLoad1", min=0, max=1, weightChance=10},
					{name="LaundryLoad2", min=0, max=1, weightChance=10},
					{name="LaundryLoad3", min=0, max=1, weightChance=10},
					{name="LaundryLoad4", min=0, max=1, weightChance=10},
					{name="LaundryLoad5", min=0, max=1, weightChance=10},
					{name="LaundryLoad6", min=0, max=1, weightChance=10},
					{name="LaundryLoad7", min=0, max=1, weightChance=10},
					{name="LaundryLoad8", min=0, max=1, weightChance=10},
					{name="LaundryInmateMeade", min=0, max=99, forceForZones="RosewoodPrisonInmateL"},
					{name="LaundryInmateLouisville", min=0, max=99, forceForZones="LouisvillePDPrisonL"},
				}
			},
			counter = {
				procedural = true,
				procList = {
					{name="LaundryCleaning", min=0, max=99, weightChance=100},
					{name="LaundryLoad1", min=0, max=2, weightChance=60},
					{name="LaundryLoad2", min=0, max=2, weightChance=60},
					{name="LaundryLoad3", min=0, max=2, weightChance=20},
					{name="LaundryLoad4", min=0, max=2, weightChance=40},
					{name="LaundryLoad5", min=0, max=2, weightChance=20},
					{name="LaundryLoad6", min=0, max=12, weightChance=10},
					{name="LaundryCleaning", min=0, max=99, forceForZones="RosewoodPrisonInmateL"},
					{name="LaundryCleaning", min=0, max=99, forceForZones="LouisvillePDPrisonL"},
				}
			},
			locker = {
				procedural = true,
				procList = {
					{name="FactoryLockers", min=0, max=99, forceForRooms="batteryfactory"},
				}
			},
			metal_shelves = {
				procedural = true,
				procList = {
					{name="LaundryCleaning", min=0, max=99},
				}
			},
			shelves = {
				procedural = true,
				procList = {
					{name="LaundryCleaning", min=0, max=99},
				}
			}
		},

		officestorage = {
			isShop = true,
			crate = {
				procedural = true,
				procList = {
					{name="CrateOfficeSupplies", min=0, max=99},
				}
			},
			metal_shelves = {
				procedural= true,
				procList = {
					{name="OfficeShelfSupplies", min=0, max=99},
					{name="LockersUSPSHQ", min=0, max=99, forceForZones="USPSL"},
				}
			}
		},

		office = {
			crate = {
				procedural = true,
				procList = {
					{name="CrateOfficeSupplies", min=0, max=99},
				}
			},
			counter = {
				procedural = true,
				procList = {
					{name="OfficeCounter", min=0, max=99},
				}
			},
			desk = {
				procedural = true,
				procList = {
					{name="OfficeDesk", min=0, max=99, weightChance=100},
					{name="PoliceDesk", min=0, max=99, forceForRooms="policestorage"},
				}
			},
			freezer = {
				rolls = 1,
				items = {
					
				}
			},
			fridge = {
				procedural = true,
				procList = {
					{name="OfficeFridge", min=0, max=99},
				}
			},
			metal_shelves = {
				procedural= true,
				procList = {
					{name="OfficeShelfSupplies", min=0, max=99},
					{name="LockerOhioMall", min=0, max=99, forceForZones="MallOhioL"},
				}
			},
			shelves = {
				procedural= true,
				procList = {
					{name="MedicalOfficeBooks", min=0, max=99, weightChance=100, forceForRooms="hospitalroom"},
					{name="ShelfGeneric", min=0, max=99},
				}
			},
		},
	}

	table.insert(Distributions, 2, STRdistributionTable);

	end

	if SandboxVars.STR.DuffelLoot then

		local STR_DuffeldistributionTable = {

			Bag_DuffelBag_EMS_Red = {
				rolls = 2,
				items = {
					"AlcoholWipes", 50,
					"AlcoholWipes", 20,
					"AlcoholWipes", 10,
					"Bandage", 50,
					"Bandage", 20,
					"Bandage", 10,
					"Bandaid", 50,
					"Bandaid", 20,
					"Bandaid", 10,
					"Coldpack", 10,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"Gloves_Surgical", 2,
					"STR.Medical_Gloves_Black", 2,
					"STR.Medical_Gloves_Green", 2,
					"STR.Medical_Gloves_Light_Blue", 2,
					"STR.Medical_Gloves_Orange", 2,
					"STR.Medical_Gloves_Purple", 2,
					"STR.Medical_Gloves_Red", 2,
					"STR.Medical_Gloves_Yellow", 2,
					"STR.Medical_Gloves_White", 2,
					"Hat_SurgicalMask_Blue", 10,
					"Pills", 20,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsSleepingTablets", 10,
					"Scalpel", 10,
					"Scissors", 10,
					"SutureNeedle", 50,
					"SutureNeedle", 20,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 20,
					"Tweezers", 10,
				},
				junk = {
					rolls = 1,
					items = {
						
					}
				}
			},

			Bag_DuffelBag_EMS_Blue = {
				rolls = 2,
				items = {
					"AlcoholWipes", 50,
					"AlcoholWipes", 20,
					"AlcoholWipes", 10,
					"Bandage", 50,
					"Bandage", 20,
					"Bandage", 10,
					"Bandaid", 50,
					"Bandaid", 20,
					"Bandaid", 10,
					"Coldpack", 10,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"Gloves_Surgical", 2,
					"STR.Medical_Gloves_Black", 2,
					"STR.Medical_Gloves_Green", 2,
					"STR.Medical_Gloves_Light_Blue", 2,
					"STR.Medical_Gloves_Orange", 2,
					"STR.Medical_Gloves_Purple", 2,
					"STR.Medical_Gloves_Red", 2,
					"STR.Medical_Gloves_Yellow", 2,
					"STR.Medical_Gloves_White", 2,
					"Hat_SurgicalMask_Blue", 10,
					"Pills", 20,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsSleepingTablets", 10,
					"Scalpel", 10,
					"Scissors", 10,
					"SutureNeedle", 50,
					"SutureNeedle", 20,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 20,
					"Tweezers", 10,
				},
				junk = {
					rolls = 1,
					items = {
						
					}
				}
			},

			Bag_DuffelBag_EMS_Green = {
				rolls = 2,
				items = {
					"AlcoholWipes", 50,
					"AlcoholWipes", 20,
					"AlcoholWipes", 10,
					"Bandage", 50,
					"Bandage", 20,
					"Bandage", 10,
					"Bandaid", 50,
					"Bandaid", 20,
					"Bandaid", 10,
					"Coldpack", 10,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"Gloves_Surgical", 2,
					"STR.Medical_Gloves_Black", 2,
					"STR.Medical_Gloves_Green", 2,
					"STR.Medical_Gloves_Light_Blue", 2,
					"STR.Medical_Gloves_Orange", 2,
					"STR.Medical_Gloves_Purple", 2,
					"STR.Medical_Gloves_Red", 2,
					"STR.Medical_Gloves_Yellow", 2,
					"STR.Medical_Gloves_White", 2,
					"Hat_SurgicalMask_Blue", 10,
					"Pills", 20,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsSleepingTablets", 10,
					"Scalpel", 10,
					"Scissors", 10,
					"SutureNeedle", 50,
					"SutureNeedle", 20,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 20,
					"Tweezers", 10,
				},
				junk = {
					rolls = 1,
					items = {
						
					}
				}
			},
		}

		table.insert(Distributions, 2, STR_DuffeldistributionTable);

	end
end

Events.OnPreDistributionMerge.Add(STRDistributions);

SuburbsDistributions.all.Outfit_KSP_Trooper = SuburbsDistributions.all.Outfit_KSP_Trooper or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_KSP_Trooper"].items, "STR.KSPPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_KSP_Trooper"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_KSP_Trooper"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_KSP_Trooper"].items, 35)

SuburbsDistributions.all.Outfit_PoliceMeade = SuburbsDistributions.all.Outfit_PoliceMeade or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMeade"].items, "STR.MeadeSheriffBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMeade"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMeade"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMeade"].items, 35)

SuburbsDistributions.all.Outfit_PoliceRosewood = SuburbsDistributions.all.Outfit_PoliceRosewood or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRosewood"].items, "STR.RosewoodSheriffBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRosewood"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRosewood"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRosewood"].items, 35)

SuburbsDistributions.all.Outfit_PoliceWestPoint = SuburbsDistributions.all.Outfit_PoliceWestPoint or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceWestPoint"].items, "STR.WestPointPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceWestPoint"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceWestPoint"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceWestPoint"].items, 35)

SuburbsDistributions.all.Outfit_PoliceMuldraugh = SuburbsDistributions.all.Outfit_PoliceMuldraugh or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMuldraugh"].items, "STR.MuldraughPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMuldraugh"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMuldraugh"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceMuldraugh"].items, 35)

SuburbsDistributions.all.Outfit_PoliceRiverside = SuburbsDistributions.all.Outfit_PoliceRiverside or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiverside"].items, "STR.RiversidePoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiverside"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiverside"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceRiverside"].items, 35)

SuburbsDistributions.all.Outfit_PoliceLouisville = SuburbsDistributions.all.Outfit_PoliceLouisville or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceLouisville"].items, "STR.LouisvillePoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceLouisville"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceLouisville"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceLouisville"].items, 35)

SuburbsDistributions.all.Outfit_PoliceJeffersonPD = SuburbsDistributions.all.Outfit_PoliceJeffersonPD or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonPD"].items, "STR.JeffersonPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonPD"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonPD"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonPD"].items, 35)

SuburbsDistributions.all.Outfit_PoliceJeffersonSD = SuburbsDistributions.all.Outfit_PoliceJeffersonSD or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonSD"].items, "STR.JeffersonSheriffBadge")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonSD"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonSD"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_PoliceJeffersonSD"].items, 35)

SuburbsDistributions.all.Outfit_FederalRanger = SuburbsDistributions.all.Outfit_FederalRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_FederalRanger"].items, "STR.FederalRangerBadge")
table.insert(SuburbsDistributions["all"]["Outfit_FederalRanger"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_FederalRanger"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_FederalRanger"].items, 35)

SuburbsDistributions.all.Outfit_StateRanger = SuburbsDistributions.all.Outfit_StateRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_StateRanger"].items, "STR.StateRangerBadge")
table.insert(SuburbsDistributions["all"]["Outfit_StateRanger"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_StateRanger"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_StateRanger"].items, 35)

SuburbsDistributions.all.Outfit_State_LawRanger = SuburbsDistributions.all.Outfit_State_LawRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_State_LawRanger"].items, "STR.StateLawRangerBadge")
table.insert(SuburbsDistributions["all"]["Outfit_State_LawRanger"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_State_LawRanger"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_State_LawRanger"].items, 35)

SuburbsDistributions.all.Outfit_EMSLouisville = SuburbsDistributions.all.Outfit_EMSLouisville or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_EMSLouisville"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_EMSLouisville"].items, 35)

SuburbsDistributions.all.Outfit_EMSMeade = SuburbsDistributions.all.Outfit_EMSMeade or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_EMSMeade"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_EMSMeade"].items, 35)

SuburbsDistributions.all.Outfit_EMSJefferson = SuburbsDistributions.all.Outfit_EMSJefferson or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_EMSJefferson"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_EMSJefferson"].items, 35)

SuburbsDistributions.all.Outfit_DOC_Meade = SuburbsDistributions.all.Outfit_DOC_Meade or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_DOC_Meade"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_DOC_Meade"].items, 35)

SuburbsDistributions.all.Outfit_DOC_Jefferson = SuburbsDistributions.all.Outfit_DOC_Jefferson or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_DOC_Jefferson"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_DOC_Jefferson"].items, 35)

SuburbsDistributions.all.Outfit_SecurityBank = SuburbsDistributions.all.Outfit_SecurityBank or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SecurityBank"].items, "STR.SecurityBankBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityBank"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_SecurityBank"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityBank"].items, 35)

SuburbsDistributions.all.Outfit_SecurityMallOhio = SuburbsDistributions.all.Outfit_SecurityMallOhio or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallOhio"].items, "STR.SecurityMallOhioBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallOhio"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallOhio"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallOhio"].items, 35)

SuburbsDistributions.all.Outfit_SecurityMallValley = SuburbsDistributions.all.Outfit_SecurityMallValley or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallValley"].items, "STR.SecurityMallValleyBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallValley"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallValley"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallValley"].items, 35)

SuburbsDistributions.all.Outfit_SecurityMallLV = SuburbsDistributions.all.Outfit_SecurityMallLV or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallLV"].items, "STR.SecurityMallLVBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallLV"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallLV"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityMallLV"].items, 35)

SuburbsDistributions.all.Outfit_SecurityHotelHavisham = SuburbsDistributions.all.Outfit_SecurityHotelHavisham or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SecurityHotelHavisham"].items, "STR.SecurityHotelHavishamBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityHotelHavisham"].items, 50)
table.insert(SuburbsDistributions["all"]["Outfit_SecurityHotelHavisham"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityHotelHavisham"].items, 35)

SuburbsDistributions.all.Outfit_SecurityHotelFancy = SuburbsDistributions.all.Outfit_SecurityHotelFancy or {rolls = 1,items = {},junk= {rolls =1, items={}}}
table.insert(SuburbsDistributions["all"]["Outfit_SecurityHotelFancy"].items, "Base.HandTorch")
table.insert(SuburbsDistributions["all"]["Outfit_SecurityHotelFancy"].items, 35)

SuburbsDistributions.all.Outfit_SusceptibleKSP_Trooper = SuburbsDistributions.all.Outfit_SusceptibleKSP_Trooper or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleKSP_Trooper"].items, "STR.KSPPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleKSP_Trooper"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceMeade = SuburbsDistributions.all.Outfit_SusceptiblePoliceMeade or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceMeade"].items, "STR.MeadeSheriffBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceMeade"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceRosewood = SuburbsDistributions.all.Outfit_SusceptiblePoliceRosewood or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceRosewood"].items, "STR.RosewoodSheriffBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceRosewood"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceWestPoint = SuburbsDistributions.all.Outfit_SusceptiblePoliceWestPoint or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceWestPoint"].items, "STR.WestPointPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceWestPoint"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceMuldraugh = SuburbsDistributions.all.Outfit_SusceptiblePoliceMuldraugh or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceMuldraugh"].items, "STR.MuldraughPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceMuldraugh"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceRiverside = SuburbsDistributions.all.Outfit_SusceptiblePoliceRiverside or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceRiverside"].items, "STR.RiversidePoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceRiverside"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceLouisville = SuburbsDistributions.all.Outfit_SusceptiblePoliceLouisville or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceLouisville"].items, "STR.LouisvillePoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceLouisville"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceJeffersonPD = SuburbsDistributions.all.Outfit_SusceptiblePoliceJeffersonPD or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceJeffersonPD"].items, "STR.JeffersonPoliceBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceJeffersonPD"].items, 50)

SuburbsDistributions.all.Outfit_SusceptiblePoliceJeffersonSD = SuburbsDistributions.all.Outfit_SusceptiblePoliceJeffersonSD or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceJeffersonSD"].items, "STR.JeffersonSheriffBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptiblePoliceJeffersonSD"].items, 50)

SuburbsDistributions.all.Outfit_SusceptibleFederalRanger = SuburbsDistributions.all.Outfit_SusceptibleFederalRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleFederalRanger"].items, "STR.FederalRangerBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleFederalRanger"].items, 50)

SuburbsDistributions.all.Outfit_SusceptibleStateRanger = SuburbsDistributions.all.Outfit_SusceptibleStateRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleStateRanger"].items, "STR.StateRangerBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleStateRanger"].items, 50)

SuburbsDistributions.all.Outfit_SusceptibleState_LawRanger = SuburbsDistributions.all.Outfit_SusceptibleState_LawRanger or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleState_LawRanger"].items, "STR.StateLawRangerBadge")
table.insert(SuburbsDistributions["all"]["Outfit_SusceptibleState_LawRanger"].items, 50)
