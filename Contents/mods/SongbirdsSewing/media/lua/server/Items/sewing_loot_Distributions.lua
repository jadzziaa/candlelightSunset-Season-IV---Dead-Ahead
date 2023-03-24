require 'Items/Distributions'

--NOTE: Loot locations are listed in three primary files:
--loot groups ("ProceduralDistributions.lua")
--loot containers ("Distributions.lua")
--vehicle storage ("VehicleDistributions")
--Each file requires different format for function "addItemToLoot..."


-- lootContainers are listed in file lua/server/items/Distributions.lua
-- lootChance is a positive value (eg: 0.5 or 2 or 15). Remember to compare values to vanilla lootChances in file lua/server/items/Distributions.lua

--ITEMS TO ADD
local TailoringMagazineShoes = "Songbirds_Sewing_Patterns.TailoringMag1Shoes";
local TailoringMagazineBulletproof = "Songbirds_Sewing_Patterns.TailoringMag2Bulletproof";
local TailoringMagazineKnit = "Songbirds_Sewing_Patterns.TailoringMag3Knitting";
local TailoringMagazineWedding = "Songbirds_Sewing_Patterns.TailoringMag4Wedding";
local TailoringMagazineBags = "Songbirds_Sewing_Patterns.TailoringMag7Bags";


function addItemToLootContainer(lootContainer, lootChance, itemName)
	table.insert(SuburbsDistributions[lootContainer].items, itemName);
	table.insert(SuburbsDistributions[lootContainer].items, lootChance);
end

function addItemToLootSubContainer(lootContainer, lootSubContainer, lootChance, itemName)
	table.insert(SuburbsDistributions[lootContainer][lootSubContainer].items, itemName);
	table.insert(SuburbsDistributions[lootContainer][lootSubContainer].items, lootChance);
end

-- These loot containers already include all/most vanilla recipe magazines:

-- LOOT CONTAINER postbox (chance=0.5)
addItemToLootSubContainer("all", "postbox", 0.5, TailoringMagazineShoes);
addItemToLootSubContainer("all", "postbox", 0.5, TailoringMagazineBulletproof);
addItemToLootSubContainer("all", "postbox", 0.5, TailoringMagazineKnit);
addItemToLootSubContainer("all", "postbox", 0.5, TailoringMagazineWedding);
addItemToLootSubContainer("all", "postbox", 0.5, TailoringMagazineBags);


-- These loot containers are zombies:
-- (only included because players using "The Forest" mod cannot access town-based loot)

-- LOOT CONTAINER inventoryfemale (rare chance=0.0001 approx)
addItemToLootSubContainer("all", "inventoryfemale", 0.0001, TailoringMagazineShoes);
addItemToLootSubContainer("all", "inventoryfemale", 0.0001, TailoringMagazineKnit);

-- LOOT CONTAINER inventorymale (rare chance=0.0001 approx)
addItemToLootSubContainer("all", "inventorymale", 0.0001, TailoringMagazineBulletproof);
addItemToLootSubContainer("all", "inventorymale", 0.0001, TailoringMagazineBags);
