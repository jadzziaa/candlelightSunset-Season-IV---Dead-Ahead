require 'Vehicles/VehicleDistributions'

--NOTE: Loot locations are listed in three primary files:
--loot groups ("ProceduralDistributions.lua")
--loot containers ("Distributions.lua")
--vehicle storage ("VehicleDistributions")
--Each file requires different format for function "addItemToLoot..."


-- Vehicle lootContainers are listed in file lua/server/vehicles/VehicleDistributions.lua
-- lootChance is a positive value (eg: 0.5 or 2 or 15). Remember to compare values to vanilla lootChances in file lua/server/vehicles/VehicleDistributions.lua

--ITEMS TO ADD
local TailoringMagazineShoes = "Songbirds_Sewing_Patterns.TailoringMag1Shoes";
local TailoringMagazineBulletproof = "Songbirds_Sewing_Patterns.TailoringMag2Bulletproof";
local TailoringMagazineKnit = "Songbirds_Sewing_Patterns.TailoringMag3Knitting";
local TailoringMagazineWedding = "Songbirds_Sewing_Patterns.TailoringMag4Wedding";
local TailoringMagazineBags = "Songbirds_Sewing_Patterns.TailoringMag7Bags";


function addItemToVehicleLootContainer(lootContainer, lootChance, itemName)
	table.insert(VehicleDistributions[lootContainer].items, itemName);
	table.insert(VehicleDistributions[lootContainer].items, lootChance);
end

-- These vehicle loot containers already include all/most vanilla recipe magazines:

-- VEHICLE LOOT CONTAINER PostalTruckBed (chance=0.5)
addItemToVehicleLootContainer("PostalTruckBed", 0.5, TailoringMagazineShoes);
addItemToVehicleLootContainer("PostalTruckBed", 0.5, TailoringMagazineBulletproof);
addItemToVehicleLootContainer("PostalTruckBed", 0.5, TailoringMagazineKnit);
addItemToVehicleLootContainer("PostalTruckBed", 0.5, TailoringMagazineWedding);
addItemToVehicleLootContainer("PostalTruckBed", 0.5, TailoringMagazineBags);
