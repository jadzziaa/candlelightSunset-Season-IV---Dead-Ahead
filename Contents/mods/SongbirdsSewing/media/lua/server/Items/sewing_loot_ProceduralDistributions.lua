require 'Items/ProceduralDistributions'

--NOTE: Loot locations are listed in three primary files:
--loot groups ("ProceduralDistributions.lua")
--loot containers ("Distributions.lua")
--vehicle storage ("VehicleDistributions")
--Each file requires different format for function "addItemToLoot..."


-- lootGroups are listed in file lua/server/items/ProceduralDistributions.lua
-- lootChance is a positive value (eg: 0.5 or 2 or 15). Remember to compare values to vanilla lootChances in file lua/server/items/ProceduralDistributions.lua

--ITEMS TO ADD
local TailoringMagazineShoes = "Songbirds_Sewing_Patterns.TailoringMag1Shoes";
local TailoringMagazineBulletproof = "Songbirds_Sewing_Patterns.TailoringMag2Bulletproof";
local TailoringMagazineKnit = "Songbirds_Sewing_Patterns.TailoringMag3Knitting";
local TailoringMagazineWedding = "Songbirds_Sewing_Patterns.TailoringMag4Wedding";
local TailoringMagazineBags = "Songbirds_Sewing_Patterns.TailoringMag7Bags";


function addItemToLootGroup(lootGroup, lootChance, itemName)
  table.insert(ProceduralDistributions.list[lootGroup].items, itemName);
  table.insert(ProceduralDistributions.list[lootGroup].items, lootChance);
end


-- These loot groups already include all/most vanilla recipe magazines:

-- LOOT GROUP BookstoreMisc (chance=2)
addItemToLootGroup("BookstoreMisc", 2, TailoringMagazineShoes);
addItemToLootGroup("BookstoreMisc", 2, TailoringMagazineBulletproof);
addItemToLootGroup("BookstoreMisc", 2, TailoringMagazineKnit);
addItemToLootGroup("BookstoreMisc", 2, TailoringMagazineWedding);
addItemToLootGroup("BookstoreMisc", 2, TailoringMagazineBags);

-- LOOT GROUP CrateMagazines (chance=1)
addItemToLootGroup("CrateMagazines", 1, TailoringMagazineShoes);
addItemToLootGroup("CrateMagazines", 1, TailoringMagazineBulletproof);
addItemToLootGroup("CrateMagazines", 1, TailoringMagazineKnit);
addItemToLootGroup("CrateMagazines", 1, TailoringMagazineWedding);
addItemToLootGroup("CrateMagazines", 1, TailoringMagazineBags);

-- LOOT GROUP LibraryBooks (chance=1)
addItemToLootGroup("LibraryBooks", 1, TailoringMagazineShoes);
addItemToLootGroup("LibraryBooks", 1, TailoringMagazineBulletproof);
addItemToLootGroup("LibraryBooks", 1, TailoringMagazineKnit);
addItemToLootGroup("LibraryBooks", 1, TailoringMagazineWedding);
addItemToLootGroup("LibraryBooks", 1, TailoringMagazineBags);

-- LOOT GROUP LivingRoomShelf (chance=0.1)
addItemToLootGroup("LivingRoomShelf", 0.1, TailoringMagazineShoes);
addItemToLootGroup("LivingRoomShelf", 0.1, TailoringMagazineBulletproof);
addItemToLootGroup("LivingRoomShelf", 0.1, TailoringMagazineKnit);
addItemToLootGroup("LivingRoomShelf", 0.1, TailoringMagazineWedding);
addItemToLootGroup("LivingRoomShelf", 0.1, TailoringMagazineBags);

-- LOOT GROUP LivingRoomShelfNoTapes (chance=0.1)
addItemToLootGroup("LivingRoomShelfNoTapes", 0.1, TailoringMagazineShoes);
addItemToLootGroup("LivingRoomShelfNoTapes", 0.1, TailoringMagazineBulletproof);
addItemToLootGroup("LivingRoomShelfNoTapes", 0.1, TailoringMagazineKnit);
addItemToLootGroup("LivingRoomShelfNoTapes", 0.1, TailoringMagazineWedding);
addItemToLootGroup("LivingRoomShelfNoTapes", 0.1, TailoringMagazineBags);

-- LOOT GROUP LivingRoomSideTable (chance=0.1)
addItemToLootGroup("LivingRoomSideTable", 0.1, TailoringMagazineShoes);
addItemToLootGroup("LivingRoomSideTable", 0.1, TailoringMagazineBulletproof);
addItemToLootGroup("LivingRoomSideTable", 0.1, TailoringMagazineKnit);
addItemToLootGroup("LivingRoomSideTable", 0.1, TailoringMagazineWedding);
addItemToLootGroup("LivingRoomSideTable", 0.1, TailoringMagazineBags);

-- LOOT GROUP LivingRoomSideTableNoRemote (chance=0.1)
addItemToLootGroup("LivingRoomSideTableNoRemote", 0.1, TailoringMagazineShoes);
addItemToLootGroup("LivingRoomSideTableNoRemote", 0.1, TailoringMagazineBulletproof);
addItemToLootGroup("LivingRoomSideTableNoRemote", 0.1, TailoringMagazineKnit);
addItemToLootGroup("LivingRoomSideTableNoRemote", 0.1, TailoringMagazineWedding);
addItemToLootGroup("LivingRoomSideTableNoRemote", 0.1, TailoringMagazineBags);

-- LOOT GROUP MagazineRackMixed (chance=1)
addItemToLootGroup("MagazineRackMixed", 1, TailoringMagazineShoes);
addItemToLootGroup("MagazineRackMixed", 1, TailoringMagazineBulletproof);
addItemToLootGroup("MagazineRackMixed", 1, TailoringMagazineKnit);
addItemToLootGroup("MagazineRackMixed", 1, TailoringMagazineWedding);
addItemToLootGroup("MagazineRackMixed", 1, TailoringMagazineBags);

-- LOOT GROUP PostOfficeMagazines (chance=1)
addItemToLootGroup("PostOfficeMagazines", 1, TailoringMagazineShoes);
addItemToLootGroup("PostOfficeMagazines", 1, TailoringMagazineBulletproof);
addItemToLootGroup("PostOfficeMagazines", 1, TailoringMagazineKnit);
addItemToLootGroup("PostOfficeMagazines", 1, TailoringMagazineWedding);
addItemToLootGroup("PostOfficeMagazines", 1, TailoringMagazineBags);

-- LOOT GROUP ShelfGeneric (chance=0.1)
addItemToLootGroup("ShelfGeneric", 0.1, TailoringMagazineShoes);
addItemToLootGroup("ShelfGeneric", 0.1, TailoringMagazineBulletproof);
addItemToLootGroup("ShelfGeneric", 0.1, TailoringMagazineKnit);
addItemToLootGroup("ShelfGeneric", 0.1, TailoringMagazineWedding);
addItemToLootGroup("ShelfGeneric", 0.1, TailoringMagazineBags);


-- These loot groups already include tailoring-related items:

-- LOOT GROUP CrateTailoring (includes needle, thread, fabric, clothing) (estimated chance=6)
addItemToLootGroup("CrateTailoring", 6, TailoringMagazineShoes);
addItemToLootGroup("CrateTailoring", 6, TailoringMagazineBulletproof);
addItemToLootGroup("CrateTailoring", 6, TailoringMagazineKnit);
addItemToLootGroup("CrateTailoring", 6, TailoringMagazineWedding);
addItemToLootGroup("CrateTailoring", 6, TailoringMagazineBags);

-- LOOT GROUP Homesteading (includes knitting needles and yarn) (estimated chance=4)
addItemToLootGroup("Homesteading", 4, TailoringMagazineShoes);
addItemToLootGroup("Homesteading", 4, TailoringMagazineBulletproof);
addItemToLootGroup("Homesteading", 4, TailoringMagazineKnit);
addItemToLootGroup("Homesteading", 4, TailoringMagazineWedding);
addItemToLootGroup("Homesteading", 4, TailoringMagazineBags);

-- LOOT GROUP KitchenBook (includes Tailoring books and some recipe magazines) (estimated chance=0.1)
addItemToLootGroup("KitchenBook", 0.1, TailoringMagazineShoes);
addItemToLootGroup("KitchenBook", 0.1, TailoringMagazineBulletproof);
addItemToLootGroup("KitchenBook", 0.1, TailoringMagazineKnit);
addItemToLootGroup("KitchenBook", 0.1, TailoringMagazineWedding);
addItemToLootGroup("KitchenBook", 0.1, TailoringMagazineBags);

-- LOOT GROUP SewingStoreTools  (estimated chance=5)
addItemToLootGroup("SewingStoreTools", 5, TailoringMagazineShoes);
addItemToLootGroup("SewingStoreTools", 5, TailoringMagazineBulletproof);
addItemToLootGroup("SewingStoreTools", 5, TailoringMagazineKnit);
addItemToLootGroup("SewingStoreTools", 5, TailoringMagazineWedding);
addItemToLootGroup("SewingStoreTools", 5, TailoringMagazineBags);

-- LOOT GROUP SewingStoreFabric  (estimated chance=6)
addItemToLootGroup("SewingStoreFabric", 6, TailoringMagazineShoes);
addItemToLootGroup("SewingStoreFabric", 6, TailoringMagazineBulletproof);
addItemToLootGroup("SewingStoreFabric", 6, TailoringMagazineKnit);
addItemToLootGroup("SewingStoreFabric", 6, TailoringMagazineWedding);
addItemToLootGroup("SewingStoreFabric", 6, TailoringMagazineBags);


-- These loot groups already include specific related items:

-- LOOT GROUP GunStoreMagazineRack (suitable for TailoringMag2Bulletproof only) (estimated chance=1)
addItemToLootGroup("GunStoreMagazineRack", 1, TailoringMagazineBulletproof);

