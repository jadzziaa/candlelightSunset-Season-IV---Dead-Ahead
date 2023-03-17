require 'Items/Distributions'
require 'Items/STR_Distributions'

Distributions = Distributions or {};

-- Check if the custom loot zones are enabled in sandbox options
if SandboxVars.STR.LootZones and getActivatedMods():contains("RavenCreek") then

	local STRdistributionTable = {

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
					{name="LaundryInmateRavenCreek", min=0, max=99, forceForZones="RavenCreekPrisonL"},
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
					{name="LaundryInmateRavenCreek", min=0, max=99, forceForZones="RavenCreekPrisonL"},
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
					{name="LaundryInmateRavenCreek", min=0, max=99, forceForZones="RavenCreekPrisonL"},
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

		prisoncells = {
			wardrobe = {
				procedural = true,
				procList = {
					{name="PrisonCellRandom", min=0, max=99},
					{name="PrisonCellMeadeRandom", min=0, max=99, forceForZones="RosewoodPrisonInmateCellL"},
					{name="PrisonCellMeadeMaxRandom", min=0, max=99, forceForZones="RosewoodPrisonInmateMaxCellL"},
					{name="PrisonCellLouisvilleRandom", min=0, max=99, forceForZones="LouisvillePDPrisonCellL"},
					{name="PrisonCellRavenCreekRandom", min=0, max=99, forceForZones="RavenCreekPrisonL"},
				}
			}
		},

		policestorage = {
			locker = {
				procedural = true,
				procList = {
					{name="PoliceStorageGuns", min=0, max=99, forceForTiles="furniture_storage_02_8;furniture_storage_02_9;furniture_storage_02_10;furniture_storage_02_11"},
					{name="PoliceStorageOutfit", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7"},
					{name="LockerMeadeSO", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="MeadeSOL"},
					{name="LockerRiversidePD", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="RiversidePDL"},
					{name="LockerJeffersonSD", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="JeffersonSDL"},
					{name="LockerRavenCreekPD", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="PoliceRavenCreekL3"},
				},
				dontSpawnAmmo = true,
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
			locker = {
				procedural = true,
				procList = {
					{name="Locker", min=0, max=99, weightChance=100},
					{name="LockerArmyBedroom", min=0, max=99, forceForZones="Army"},
					{name="LockerArmyBedroom", min=0, max=99, forceForItems="furniture_bedding_01_56;furniture_bedding_01_57;furniture_bedding_01_58;furniture_bedding_01_59"},
					{name="LockerClassy", min=0, max=99, forceForZones="Rich"},
					{name="LockersUSPSHQ", min=0, max=99, forceForZones="USPSL"},
					{name="LockerRavenCreekPD", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7", forceForZones="PoliceRavenCreekL", forceForRooms="storage"},
					{name="LockerRavenCreekPD", min=0, max=99, forceForTiles="furniture_storage_02_12;furniture_storage_02_13;furniture_storage_02_14;furniture_storage_02_15", forceForZones="PoliceRavenCreekL2", forceForRooms="office"},
					{name="LockerRavenCreekFD", min=0, max=99, forceForTiles="furniture_storage_02_4;furniture_storage_02_5;furniture_storage_02_6;furniture_storage_02_7;furniture_storage_02_12;furniture_storage_02_13;furniture_storage_02_14;furniture_storage_02_15", forceForZones="FireDeptRavenCreekL"},
				}
			},
		},
	}

	table.insert(Distributions, 2, STRdistributionTable);

	SuburbsDistributions.all.Outfit_PoliceRavenCreek = SuburbsDistributions.all.Outfit_PoliceRavenCreek or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
	table.insert(SuburbsDistributions["all"]["Outfit_PoliceRavenCreek"].items, "STR.RavenCreekPoliceBadge")
	table.insert(SuburbsDistributions["all"]["Outfit_PoliceRavenCreek"].items, 50)
	table.insert(SuburbsDistributions["all"]["Outfit_PoliceRavenCreek"].items, "Base.HandTorch")
	table.insert(SuburbsDistributions["all"]["Outfit_PoliceRavenCreek"].items, 35)

	SuburbsDistributions.all.Outfit_EMSRavenCreek = SuburbsDistributions.all.Outfit_EMSRavenCreek or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
	table.insert(SuburbsDistributions["all"]["Outfit_EMSRavenCreek"].items, "Base.HandTorch")
	table.insert(SuburbsDistributions["all"]["Outfit_EMSRavenCreek"].items, 35)

	SuburbsDistributions.all.Outfit_DOC_RavenCreek = SuburbsDistributions.all.Outfit_DOC_RavenCreek or {rolls = 1,items = {},junk= {rolls =1, items={}}} 
	table.insert(SuburbsDistributions["all"]["Outfit_DOC_RavenCreek"].items, "Base.HandTorch")
	table.insert(SuburbsDistributions["all"]["Outfit_DOC_RavenCreek"].items, 35)

end
