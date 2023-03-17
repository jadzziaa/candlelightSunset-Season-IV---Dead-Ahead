Distributions = Distributions or {};

local distributionTable = {

    --    BAGS/CONTAINERS

    Bag_ALICEpack = {
        rolls = 1,
        items = {
            "SDelight.MaduroCigarSingle", 4,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        },
        fillRand = 1,
    },

    Bag_ALICEpack_Army = {
        rolls = 2,
        items = {
            "SDelight.MaduroCigarSingle", 2,
        }
    },

    Bag_BigHikingBag = {
        rolls = 5,
        items = {
            "SDelight.MaduroCigarSingle", 2,
        },
    },

    Bag_GolfBag = {
        rolls = 3,
        items = {
            "SDelight.BoxofCigars", 5,
            "SDelight.MaduroCigarSingle", 10,
          },
    },

    Bag_NormalHikingBag = {
        rolls = 5,
        items = {
            "SDelight.MaduroCigarSingle", 2,
        }
    },

    Flightcase = {
        rolls = 1,
        items = {
            "SDelight.BoxofCigars", 5,
            "SDelight.MaduroCigarSingle", 8,
        },
    },

    Handbag = {
        rolls = 2,
        items = {
            "SDelight.MaduroCigarSingle", 4,
        }
    },
}

require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

    --Survivor Bag (Rare)
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SDelight.MaduroCigarSingle");
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 0.5);
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SDelight.ColoradoCigarSingle");
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 0.5);
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SDelight.ClaroCigarSingle");
    table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 0.5);

    --DishCabinetGeneric
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SDelight.MaduroCigarSingle"); 
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 1);
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SDelight.ColoradoCigarSingle"); 
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 1);
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SDelight.ClaroCigarSingle"); 
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 1);
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SDelight.MaduroCigarBox"); 
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 0.3);
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SDelight.ColoradoCigarBox"); 
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 0.3);
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SDelight.ClaroCigarBox"); 
    table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 0.3);

    --DaycareDesk
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SDelight.MaduroCigarSingle");
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.1);
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SDelight.ColoradoCigarSingle");
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.1);
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SDelight.ClaroCigarSingle");
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.1);
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SDelight.MaduroCigarBox");
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.02);
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SDelight.ColoradoCigarBox");
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.02);
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SDelight.ClaroCigarBox");
    table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.02);

    --BarCounterGlasses
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SDelight.MaduroCigarSingle");
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 0.2);
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SDelight.ColoradoCigarSingle");
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 0.2);
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SDelight.ClaroCigarSingle");
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 0.2);
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SDelight.MaduroCigarBox");
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 5);
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SDelight.ColoradoCigarBox");
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 5);
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SDelight.ClaroCigarBox");
    table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, 5);

    --LockerArmyBedroom
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SDelight.MaduroCigarSingle");
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, 0.5);
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SDelight.ColoradoCigarSingle");
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, 0.5);
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SDelight.ClaroCigarSingle");
    table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, 0.5);

    --HuntingLockers
    table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SDelight.MaduroCigarSingle");
    table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, 0.5);
    table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SDelight.ColoradoCigarSingle");
    table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, 0.5);
    table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SDelight.ClaroCigarSingle");
    table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, 0.5);

    -- Zombie Drops
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SDelight.MaduroCigarSingle");
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SDelight.ColoradoCigarSingle");
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SDelight.ClaroCigarSingle");
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);

    -- BarShelfLiquor
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SDelight.MaduroCigarSingle");
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 10);
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SDelight.ColoradoCigarSingle");
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 10);
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SDelight.ClaroCigarSingle");
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 10);
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SDelight.MaduroCigarBox");
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 5);
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SDelight.ColoradoCigarBox");
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 5);
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SDelight.ClaroCigarBox");
    table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 5);

    --DishCabinetLiquor
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SDelight.MaduroCigarSingle");
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, 10);
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SDelight.ColoradoCigarSingle");
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, 10);
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SDelight.ClaroCigarSingle");
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, 10);
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SDelight.MaduroCigarBox");
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, 5);
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SDelight.ColoradoCigarBox");
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, 5);
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SDelight.ClaroCigarBox");
    table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, 5);
    
    --BarCounterLiquor
    table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SDelight.MaduroCigarBox");
    table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 5);
    table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SDelight.ColoradoCigarBox");
    table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 5);
    table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SDelight.ClaroCigarBox");
    table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 5);

table.insert(Distributions, 1, distributionTable);