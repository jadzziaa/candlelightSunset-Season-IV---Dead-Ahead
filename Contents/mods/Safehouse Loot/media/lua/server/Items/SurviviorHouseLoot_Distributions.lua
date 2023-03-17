	require "Items/Distributions"

	SuburbsDistributions = SuburbsDistributions or {}
	local safehouseLoot = SuburbsDistributions.SafehouseLoot

	safehouseLoot.counter = {
			procedural = true,
			procList = {
				{name="KitchenCannedFood", min=1, max=7, weightChance=100},
				{name="KitchenDryFood", min=1, max=2, weightChance=100},
				{name="MeleeWeapons", min=1, max=2, weightChance=100},
				{name="FirearmWeapons", min=1, max=1, weightChance=100},
				{name="StoreCounterTobacco", min=0, max=2, weightChance=100},
				{name="PlankStashMoney", min=0, max=1, weightChance=100},
				{name="ArmyStorageGuns", min=0, max=1, weightChance=100},
				{name="ArmyStorageElectronics", min=0, max=1, weightChance=100},
				{name="ArmySurplusOutfit", min=0, max=1, weightChance=100},
				{name="ArmySurplusBackpacks", min=0, max=1, weightChance=100},
				{name="BarCounterLiquor", min=0, max=1, weightChance=100},
				{name="ClothingStorageWinter", min=0, max=1, weightChance=100},
				{name="CrateCamping", min=0, max=1, weightChance=100},
				{name="CrateTools", min=0, max=1, weightChance=100},
				{name="FridgeWater", min=0, max=1, weightChance=100},
				{name="MedicalStorageDrugs", min=0, max=2, weightChance=100},
                {name="CampingStoreBooks", min=0, max=1, weightChance=100},
                {name="CampingStoreClothes", min=0, max=1, weightChance=100},
			},
		}
		
		
	local loot = {
			procedural = true,
			procList = {
				{name="KitchenCannedFood", min=0, max=7, weightChance=100},
				{name="KitchenDryFood", min=0, max=2, weightChance=100},
				{name="MeleeWeapons", min=0, max=2, weightChance=100},
				{name="FirearmWeapons", min=0, max=1, weightChance=100},
				{name="StoreCounterTobacco", min=0, max=2, weightChance=100},
				{name="PlankStashMoney", min=0, max=1, weightChance=100},
				{name="ArmyStorageGuns", min=0, max=1, weightChance=100},
				{name="ArmyStorageElectronics", min=0, max=1, weightChance=100},
				{name="ArmySurplusOutfit", min=0, max=1, weightChance=100},
				{name="ArmySurplusBackpacks", min=0, max=1, weightChance=100},
				{name="BarCounterLiquor", min=0, max=1, weightChance=100},
				{name="ClothingStorageWinter", min=0, max=1, weightChance=100},
				{name="CrateCamping", min=0, max=1, weightChance=100},
				{name="CrateTools", min=0, max=1, weightChance=100},
				{name="FridgeWater", min=0, max=1, weightChance=100},
				{name="MedicalStorageDrugs", min=0, max=2, weightChance=100},
                {name="GunStoreShelf", min=0, max=1, weightChance=100},
                {name="CampingStoreBooks", min=0, max=1, weightChance=100},
                {name="CampingStoreClothes", min=0, max=1, weightChance=100},
			},
		}
	safehouseLoot.crate = loot
	safehouseLoot.freezer = {
			procedural = true,
			procList = {
				{name="Meat", min=0, max=99},
			},
		}
	safehouseLoot.fridge = {
			procedural = true,
			procList = {
				{name="FridgeBeer", min=0, max=99, weightChance=100},
				{name="Meat", min=0, max=99, weightChance=100},
			},
		}
	safehouseLoot.locker = {
			procedural = true,
			procList = {
				{name="KitchenDryFood", min=0, max=2, weightChance=100},
				{name="MeleeWeapons", min=0, max=2, weightChance=100},
				{name="FirearmWeapons", min=0, max=1, weightChance=100},
				{name="StoreCounterTobacco", min=0, max=2, weightChance=100},
				{name="ArmyStorageGuns", min=0, max=1, weightChance=100},
				{name="ArmyStorageElectronics", min=0, max=1, weightChance=100},
				{name="ArmySurplusOutfit", min=0, max=1, weightChance=100},
				{name="ArmySurplusBackpacks", min=0, max=1, weightChance=100},
				{name="BarCounterLiquor", min=0, max=1, weightChance=100},
				{name="ClothingStorageWinter", min=0, max=1, weightChance=100},
				{name="CrateCamping", min=0, max=1, weightChance=100},
				{name="CrateTools", min=0, max=1, weightChance=100},
				{name="MedicalStorageDrugs", min=0, max=2, weightChance=100},
                {name="GarageMechanic", min=0, max=1, weightChance=100},
                {name="CampingStoreClothes", min=0, max=1, weightChance=100},
			},
		}
	safehouseLoot.metal_shelves = {
			procedural = true,
			procList = {
				{name="KitchenCannedFood", min=0, max=7, weightChance=100},
				{name="KitchenDryFood", min=0, max=2, weightChance=100},
				{name="MeleeWeapons", min=0, max=2, weightChance=100},
				{name="FirearmWeapons", min=0, max=1, weightChance=100},
				{name="StoreCounterTobacco", min=0, max=2, weightChance=100},
				{name="ArmyStorageGuns", min=0, max=1, weightChance=100},
				{name="ArmyStorageElectronics", min=0, max=1, weightChance=100},
				{name="ArmySurplusOutfit", min=0, max=1, weightChance=100},
				{name="ArmySurplusBackpacks", min=0, max=1, weightChance=100},
				{name="BarCounterLiquor", min=0, max=1, weightChance=100},
				{name="ClothingStorageWinter", min=0, max=1, weightChance=100},
				{name="CrateCamping", min=0, max=1, weightChance=100},
				{name="CrateTools", min=0, max=1, weightChance=100},
				{name="FridgeWater", min=0, max=1, weightChance=100},
				{name="MedicalStorageDrugs", min=0, max=2, weightChance=100},
                {name="GarageMechanic", min=0, max=1, weightChance=100},
                {name="GunStoreShelf", min=0, max=1, weightChance=100},
                {name="CampingStoreClothes", min=0, max=1, weightChance=100},
                {name="SafehouseTraps", min=0, max=1, weightChance=20},
			},
		}
	safehouseLoot.shelves = {
			procedural = true,
			procList = {
				{name="KitchenCannedFood", min=0, max=7, weightChance=100},
				{name="KitchenDryFood", min=0, max=2, weightChance=100},
				{name="MeleeWeapons", min=0, max=2, weightChance=100},
				{name="FirearmWeapons", min=0, max=1, weightChance=100},
				{name="StoreCounterTobacco", min=0, max=2, weightChance=100},
				{name="ArmyStorageGuns", min=0, max=1, weightChance=100},
				{name="ArmyStorageElectronics", min=0, max=1, weightChance=100},
				{name="BarCounterLiquor", min=0, max=1, weightChance=100},
				{name="CrateCamping", min=0, max=1, weightChance=100},
				{name="CrateTools", min=0, max=1, weightChance=100},
				{name="FridgeWater", min=0, max=1, weightChance=100},
				{name="MedicalStorageDrugs", min=0, max=2, weightChance=100},
                {name="GarageMechanic", min=0, max=1, weightChance=100},
                {name="GunStoreShelf", min=0, max=1, weightChance=100},
                {name="CampingStoreBooks", min=0, max=1, weightChance=100},
			},
		}
	safehouseLoot.sidetable = loot
	safehouseLoot.wardrobe = loot
	safehouseLoot.SurvivorCrate = {
            rolls = 2,
            items = {
                "Crisps",15,
                "Crisps2", 15,
                "Crisps3", 15,
                "Crisps4", 15,
                "Cereal", 15,
                "Dogfood", 15,
                "TVDinner",15,
                "TinnedSoup", 15,
                "TinnedBeans", 15,
                "CannedCornedBeef", 15,
                "Macandcheese", 15,
                "CannedChili", 15,
                "CannedBolognese", 15,
                "CannedCarrots2", 15,
                "CannedCorn", 15,
                "CannedMushroomSoup", 15,
                "CannedPeas", 15,
                "CannedPotato2", 15,
                "CannedSardines", 15,
                "CannedTomato2", 15,
                "Shotgun", 1,
                "DoubleBarrelShotgun", 0.5,
                "ShotgunShellsBox", 5,
                "ShotgunShellsBox", 5,
                "Machete", 1,
            }
        }
			
			 -- safehouseLoot.medicine = {
            -- rolls = 3,
            -- items = {
                -- "Pills", 10,
                -- "PillsBeta", 10,
                -- "PillsAntiDep", 10,
                -- "PillsSleepingTablets", 10,
                -- "PillsVitamins", 10,
                -- "Bandage", 10,
                -- "Bandage", 10,
                -- "Bandaid", 10,
                -- "Bandaid", 10,
                -- "FirstAidKit", 2,
                -- "Tweezers", 5,
                -- "Disinfectant", 10,
                -- "AlcoholWipes", 5,
                -- "SutureNeedle", 5,
                -- "SutureNeedleHolder", 5,
                -- "Antibiotics", 5,
                -- "Scalpel", 5,
            -- }
        -- },
			
        
		
		
	SuburbsDistributions.SurvivorCache1 = safehouseLoot
	SuburbsDistributions.SurvivorCache2 = safehouseLoot
	
	
	--SuburbsDistributions.SafehouseLoot.shelves

    -- SuburbsDistributions.SafehouseLoot = {
        -- counter = {
            -- procedural = true,
            -- procList = {
                -- {name="KitchenCannedFood", min=1, max=7, weightChance=100},
                -- {name="KitchenDryFood", min=1, max=2, weightChance=100},
                -- {name="MeleeWeapons", min=1, max=2, weightChance=100},
                -- {name="FirearmWeapons", min=1, max=1, weightChance=100},
            -- },
        -- },
        
        -- medicine = {
            -- rolls = 3,
            -- items = {
                -- "Pills", 10,
                -- "PillsBeta", 10,
                -- "PillsAntiDep", 10,
                -- "PillsSleepingTablets", 10,
                -- "PillsVitamins", 10,
                -- "Bandage", 10,
                -- "Bandage", 10,
                -- "Bandaid", 10,
                -- "Bandaid", 10,
                -- "FirstAidKit", 2,
                -- "Tweezers", 5,
                -- "Disinfectant", 10,
                -- "AlcoholWipes", 5,
                -- "SutureNeedle", 5,
                -- "SutureNeedleHolder", 5,
                -- "Antibiotics", 5,
                -- "Scalpel", 5,
            -- }
        -- },
    -- }
    
    -- SuburbsDistributions.ShotgunCache1 = {
        -- ShotgunBox = {
            -- rolls = 2,
            -- items = {
                -- "Shotgun", 500,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShellsBox", 20,
                -- "ShotgunShellsBox", 20,
                -- "ShotgunShellsBox", 20,
            -- }
        -- },
        
        -- Bag_DuffelBagTINT = {
            -- rolls = 2,
            -- items = {
                -- "Shotgun", 500,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShellsBox", 20,
                -- "ShotgunShellsBox", 20,
                -- "ShotgunShellsBox", 20,
            -- },
            -- fillRand=1,
        -- },
    -- }
    
    -- SuburbsDistributions.ShotgunCache2 = {
        -- ShotgunBox = {
            -- rolls = 2,
            -- items = {
                -- "Shotgun", 500,
                -- "Shotgun", 5,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShells", 30,
                -- "ShotgunShellsBox", 20,
                -- "ShotgunShellsBox", 20,
                -- "ShotgunShellsBox", 20,
                -- "ShotgunShells", 10,
                -- "ShotgunShells", 10,
                -- "ShotgunShells", 10,
                -- "ShotgunShells", 10,
                -- "ShotgunShellsBox", 8,
                -- "ShotgunShellsBox", 8,
                -- "ShotgunShellsBox", 8,
            -- }
        -- },
        
        -- counter = {
            -- rolls = 2,
            -- items = {
                -- "Shotgun", 8,
                -- "ShotgunShells", 8,
                -- "ShotgunShells", 8,
                -- "ShotgunShellsBox", 5,
            -- }
        -- },
    -- },
    
    -- SuburbsDistributions.ToolsCache1 = {
        -- ToolsBox = {
            -- rolls = 2,
            -- items = {
                -- "Nails", 30,
                -- "Nails", 30,
                -- "Hammer", 10,
                -- "Tarp", 10,
                -- "Saw", 10,
                -- "GardenSaw", 10,
                -- "Plank", 10,
                -- "Plank", 10,
                -- "Axe", 3,
                -- "WoodAxe", 3,
                -- "NailsBox", 4,
                -- "NailsBox", 4,
                -- "DuctTape", 8,
                -- "Glue", 8,
                -- "Scotchtape", 8,
                -- "Woodglue", 8,
                -- "Rope", 8,
                -- "LeadPipe", 10,
                -- "HandAxe", 5,
                -- "PipeWrench", 7,
                -- "ClubHammer", 7,
                -- "WoodenMallet", 7,
            -- },
        -- },
        
        -- counter = {
            -- rolls = 2,
            -- items = {
                -- "Nails", 10,
                -- "Nails", 10,
                -- "Hammer", 5,
                -- "Tarp", 5,
                -- "Saw", 5,
                -- "GardenSaw", 5,
                -- "Plank", 5,
                -- "Plank", 5,
                -- "Axe", 2,
                -- "WoodAxe", 2,
                -- "NailsBox", 4,
                -- "NailsBox", 4,
                -- "DuctTape", 3,
                -- "Glue", 3,
                -- "Scotchtape", 3,
                -- "Woodglue", 3,
                -- "Rope", 3,
                -- "Shovel", 0.5,
                -- "Shovel2", 0.5,
                -- "farming.HandShovel", 3,
                -- "HandScythe", 3,
                -- "HandFork", 3,
                -- "LeadPipe", 10,
                -- "HandAxe", 5,
                -- "PipeWrench", 7,
                -- "ClubHammer", 7,
                -- "WoodenMallet", 7,
            -- },
        -- },
        
        -- Bag_DuffelBagTINT = {
            -- rolls = 2,
            -- items = {
                -- "NailsBox", 2,
                -- "NailsBox", 2,
                -- "Hammer", 10,
                -- "Tarp", 10,
                -- "Saw", 10,
                -- "GardenSaw", 10,
                -- "Plank", 10,
                -- "Plank", 10,
                -- "Axe", 3,
                -- "WoodAxe", 3,
                -- "NailsBox", 2,
                -- "NailsBox", 2,
                -- "DuctTape", 8,
                -- "Glue", 8,
                -- "Scotchtape", 8,
                -- "Woodglue", 8,
                -- "Rope", 8,
                -- "LeadPipe", 10,
                -- "HandAxe", 5,
                -- "PipeWrench", 7,
                -- "ClubHammer", 7,
                -- "WoodenMallet", 7,
            -- },
            -- fillRand = 1,
        -- },
    -- }
    
    -- SuburbsDistributions.GunCache1 = {
        -- GunBox = {
            -- rolls = 2,
            -- items = {
                -- "Pistol", 50,
                -- "Pistol2", 50,
                -- "Pistol3", 5,
                -- "Revolver_Short", 3,
                -- "Revolver", 2,
                -- "Revolver_Long", 1,
                -- "Bullets9mm", 30,
                -- "Bullets9mm", 30,
                -- "Bullets9mm", 30,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets38Box", 10,
                -- "Bullets44Box", 10,
                -- "Bullets45Box", 10,
                -- "Bullets38Box", 10,
                -- "Bullets44Box", 10,
                -- "Bullets45Box", 10,
            -- },
            -- dontSpawnAmmo = true,
        -- },
        
        -- counter = {
            -- rolls = 2,
            -- items = {
                -- "Pistol", 2,
                -- "Pistol2", 2,
                -- "Pistol3", 1,
                -- "Revolver_Short", 1.5,
                -- "Revolver", 1,
                -- "Revolver_Long", 0.5,
            -- },
        -- },
        
        -- Bag_DuffelBagTINT = {
            -- rolls = 2,
            -- items = {
                -- "Pistol", 50,
                -- "Pistol2", 50,
                -- "Pistol3", 5,
                -- "Revolver_Short", 5,
                -- "Revolver", 3,
                -- "Revolver_Long", 2,
                -- "Shotgun", 10,
                -- "DoubleBarrelShotgun", 7,
            -- },
            -- fillRand = 1,
        -- },
    -- },
    
    -- SuburbsDistributions.GunCache2 = {
        -- GunBox = {
            -- rolls = 2,
            -- items = {
                -- "Pistol", 50,
                -- "Pistol2", 50,
                -- "Pistol3", 5,
                -- "Revolver_Short", 3,
                -- "Revolver", 2,
                -- "Revolver_Long", 1,
                -- "Bullets9mm", 30,
                -- "Bullets9mm", 30,
                -- "Bullets9mm", 30,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mm", 10,
                -- "Bullets9mm", 10,
                -- "Bullets9mm", 10,
                -- "Bullets9mmBox", 8,
                -- "Bullets9mmBox", 8,
                -- "Bullets9mmBox", 8,
                -- "Bullets9mmBox", 8,
            -- },
            -- dontSpawnAmmo = true,
        -- },
        
        -- Bag_DuffelBagTINT = {
            -- rolls = 2,
            -- items = {
                -- "Pistol", 50,
                -- "Pistol2", 50,
                -- "Pistol3", 5,
                -- "Revolver_Short", 3,
                -- "Revolver", 2,
                -- "Revolver_Long", 1,
                -- "Bullets9mm", 30,
                -- "Bullets9mm", 30,
                -- "Bullets9mm", 30,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mmBox", 20,
                -- "Bullets9mm", 10,
                -- "Bullets9mm", 10,
                -- "Bullets9mm", 10,
                -- "Bullets9mmBox", 8,
                -- "Bullets9mmBox", 8,
                -- "Bullets9mmBox", 8,
                -- "Bullets9mmBox", 8,
                -- "Bullets38Box", 10,
                -- "Bullets44Box", 10,
                -- "Bullets45Box", 10,
                -- "Bullets38Box", 10,
                -- "Bullets44Box", 10,
                -- "Bullets45Box", 10,
            -- },
            -- fillRand=1,
        -- },
    -- },
    
    -- SuburbsDistributions.SurvivorCache1 = {
        -- counter = {
            -- procedural = true,
            -- procList = {
                -- {name="KitchenCannedFood", min=1, max=7, weightChance=100},
                -- {name="KitchenDryFood", min=1, max=2, weightChance=100},
                -- {name="MeleeWeapons", min=1, max=2, weightChance=100},
                -- {name="FirearmWeapons", min=1, max=1, weightChance=100},
            -- },
        -- },
        
        -- medicine = {
            -- rolls = 2,
            -- items = {
                -- "Pills", 10,
                -- "PillsBeta", 10,
                -- "PillsAntiDep", 10,
                -- "PillsSleepingTablets", 10,
                -- "PillsVitamins", 10,
                -- "Bandage", 10,
                -- "Bandage", 10,
                -- "Bandaid", 10,
                -- "Bandaid", 10,
                -- "FirstAidKit", 2,
                -- "Tweezers", 5,
                -- "Disinfectant", 10,
                -- "AlcoholWipes", 5,
                -- "SutureNeedle", 5,
                -- "SutureNeedleHolder", 5,
                -- "Antibiotics", 5,
            -- }
        -- },
        
        -- SurvivorCrate = {
            -- rolls = 2,
            -- items = {
                -- "Crisps",15,
                -- "Crisps2", 15,
                -- "Crisps3", 15,
                -- "Crisps4", 15,
                -- "Cereal", 15,
                -- "Dogfood", 15,
                -- "TVDinner",15,
                -- "TinnedSoup", 15,
                -- "TinnedBeans", 15,
                -- "CannedCornedBeef", 15,
                -- "Macandcheese", 15,
                -- "CannedChili", 15,
                -- "CannedBolognese", 15,
                -- "CannedCarrots2", 15,
                -- "CannedCorn", 15,
                -- "CannedMushroomSoup", 15,
                -- "CannedPeas", 15,
                -- "CannedPotato2", 15,
                -- "CannedSardines", 15,
                -- "CannedTomato2", 15,
                -- "Shotgun", 1,
                -- "DoubleBarrelShotgun", 0.5,
                -- "ShotgunShellsBox", 5,
                -- "ShotgunShellsBox", 5,
                -- "Machete", 1,
            -- }
        -- },
    -- },
    
    -- SuburbsDistributions.SurvivorCache2 = {
        -- counter = {
            -- procedural = true,
            -- procList = {
                -- {name="KitchenCannedFood", min=1, max=7, weightChance=100},
                -- {name="KitchenDryFood", min=1, max=2, weightChance=100},
                -- {name="MeleeWeapons", min=1, max=2, weightChance=100},
                -- {name="FirearmWeapons", min=1, max=1, weightChance=100},
            -- },
        -- },
        
        -- medicine = {
            -- rolls = 2,
            -- items = {
                -- "Pills", 10,
                -- "PillsBeta", 10,
                -- "PillsAntiDep", 10,
                -- "PillsSleepingTablets", 10,
                -- "PillsVitamins", 10,
                -- "Bandage", 10,
                -- "Bandage", 10,
                -- "Bandaid", 10,
                -- "Bandaid", 10,
                -- "FirstAidKit", 2,
                -- "Tweezers", 5,
                -- "Disinfectant", 10,
                -- "AlcoholWipes", 5,
                -- "SutureNeedle", 5,
                -- "SutureNeedleHolder", 5,
                -- "Antibiotics", 5,
            -- }
        -- },
        
        -- SurvivorCrate = {
            -- rolls = 2,
            -- items = {
                -- "Crisps",15,
                -- "Crisps2", 15,
                -- "Crisps3", 15,
                -- "Crisps4", 15,
                -- "Cereal", 15,
                -- "Dogfood", 15,
                -- "TVDinner",15,
                -- "TinnedSoup", 15,
                -- "TinnedBeans", 15,
                -- "CannedCornedBeef", 15,
                -- "Macandcheese", 15,
                -- "CannedChili", 15,
                -- "CannedBolognese", 15,
                -- "CannedCarrots2", 15,
                -- "CannedCorn", 15,
                -- "CannedMushroomSoup", 15,
                -- "CannedPeas", 15,
                -- "CannedPotato2", 15,
                -- "CannedSardines", 15,
                -- "CannedTomato2", 15,
                -- "Shotgun", 1,
                -- "DoubleBarrelShotgun", 0.5,
                -- "ShotgunShellsBox", 5,
                -- "ShotgunShellsBox", 5,
                -- "Machete", 1,
            -- }
        -- },
    -- }
