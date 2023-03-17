require('Foraging/forageSystem')

Events.onAddForageDefs.Add(function()



    local RockSalt = {
    	type = "Sprout.RockSalt",
        minCount    = 2,
        maxCount    = 4,
        perks       = { "PlantScavenging" },
        chance      = 30,
        xp          = 20,
        rainChance  = 0,
        snowChance  = -10,
        categories  = { "WildPlants" },
        zones = {
            Forest      = 100,
            DeepForest  = 100,
            Vegitation  = 100,
            FarmLand    = 100,
            Farm        = 100,
            TrailerPark = 100,
            TownZone    = 100,
            Nav         = 100,
        },
        months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 7, 8, 9 },
        malusMonths = { 3, 4 },
        spawnFuncs = { doWildFoodSpawn },
    };

    local PepperPlant = {
            type        = "Sprout.PepperPlant",
            minCount    = 2,
            maxCount    = 4,
            perks       = { "PlantScavenging" },
            chance      = 30,
            xp          = 20,
            rainChance  = 0,
            snowChance  = -10,
            categories  = { "WildPlants" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 7, 8, 9 },
            malusMonths = { 3, 4 },
            spawnFuncs = { doWildFoodSpawn },
        };

    local AppleSeed = {
            type = "Sprout.AppleSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },
        };

        local AvocadoSeed = {
            type = "Sprout.AvocadoSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local BananaSeed = {
            type = "Sprout.BananaSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local BellPepperSeed = {
            type = "Sprout.BellPepperSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local BerryBlackSeed = {
            type = "Sprout.BerryBlackSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local BerryBlueSeed = {
            type = "Sprout.BerryBlueSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local CherrySeed = {
            type = "Sprout.CherrySeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local CornSeed = {
            type = "Sprout.CornSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local EggplantSeed = {
            type = "Sprout.EggplantSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local GingerSeed = {
            type = "Sprout.GingerSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local GinsengSeed = {
            type = "Sprout.GinsengSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local GrapefruitSeed = {
            type = "Sprout.GrapefruitSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local GrapeSeed = {
            type = "Sprout.GrapeSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local LeekSeed = {
            type = "Sprout.LeekSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local LemongrassSeed = {
            type = "Sprout.LemongrassSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local LemonSeed = {
            type = "Sprout.LemonSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local LettuceSeed = {
            type = "Sprout.LettuceSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local LimeSeed = {
            type = "Sprout.LimeSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local MangoSeed = {
            type = "Sprout.MangoSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local MushroomSpores = {
            type = "Sprout.MushroomSpores",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local OliveSeed = {
            type = "Sprout.OliveSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local OnionSeed = {
            type = "Sprout.OnionSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local OrangeSeed = {
            type = "Sprout.OrangeSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local PeachSeed = {
            type = "Sprout.PeachSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local PineappleSeed = {
            type = "Sprout.PineappleSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local PumpkinSeed = {
            type = "Sprout.PumpkinSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local SoyBeanSeed = {
            type = "Sprout.SoyBeanSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local SugarCaneSeed = {
            type = "Sprout.SugarCaneSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local WatermelonSeed = {
            type = "Sprout.WatermelonSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local WheatSeed = {
            type = "Sprout.WheatSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local ZucchiniSeed = {
            type = "Sprout.ZucchiniSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local RiceSeed = {
            type = "Sprout.RiceSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },

        };
        local PepperPlantSeed = {
            type = "Sprout.PepperPlantSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },
        };
        local HopsSeed = {
            type = "Sprout.HopsSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },
        };
        local CottonSeed = {
            type = "Sprout.CottonSeed",
            minCount = 1,
            maxCount = 6,
            skill = 4,
            xp = 5,
            snowChance = -10,
            perks       = { "PlantScavenging" },
            categories = { "Fruits" },
            zones = {
                Forest      = 20,
                DeepForest  = 20,
                Vegitation  = 20,
                FarmLand    = 15,
                Farm        = 15,
                TrailerPark = 10,
                TownZone    = 10,
                Nav         = 10,
            },
            months      = { 1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
            bonusMonths = { 1, 2, 12 },
            malusMonths = { 3, 4, 10, 11 },
            spawnFuncs = { doWildFoodSpawn },
        };



--Adding them to the foraging system
forageSystem.addItemDef(AppleSeed);
forageSystem.addItemDef(AvocadoSeed);
forageSystem.addItemDef(BananaSeed);
forageSystem.addItemDef(BellPepperSeed);
forageSystem.addItemDef(BerryBlackSeed);
forageSystem.addItemDef(BerryBlueSeed);
forageSystem.addItemDef(CherrySeed);
forageSystem.addItemDef(CornSeed);
forageSystem.addItemDef(EggplantSeed);
forageSystem.addItemDef(GingerSeed);
forageSystem.addItemDef(GinsengSeed);
forageSystem.addItemDef(GrapefruitSeed);
forageSystem.addItemDef(GrapeSeed);
forageSystem.addItemDef(LeekSeed);
forageSystem.addItemDef(LemongrassSeed);
forageSystem.addItemDef(LemonSeed);
forageSystem.addItemDef(LettuceSeed);
forageSystem.addItemDef(LimeSeed);
forageSystem.addItemDef(MangoSeed);
forageSystem.addItemDef(MushroomSpores);
forageSystem.addItemDef(OliveSeed);
forageSystem.addItemDef(OnionSeed);
forageSystem.addItemDef(OrangeSeed);
forageSystem.addItemDef(PeachSeed);
forageSystem.addItemDef(PineappleSeed);
forageSystem.addItemDef(PumpkinSeed);
forageSystem.addItemDef(SoyBeanSeed);
forageSystem.addItemDef(SugarCaneSeed);
forageSystem.addItemDef(WatermelonSeed);
forageSystem.addItemDef(WheatSeed);
forageSystem.addItemDef(ZucchiniSeed);
forageSystem.addItemDef(RiceSeed);
forageSystem.addItemDef(PepperPlantSeed);
forageSystem.addItemDef(HopsSeed);
forageSystem.addItemDef(CottonSeed);

 forageSystem.addItemDef(RockSalt);
 forageSystem.addItemDef(PepperPlant);

end)



