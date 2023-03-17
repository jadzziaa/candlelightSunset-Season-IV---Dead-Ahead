require "Items/ItemPicker"

JCD_LLE = JCD_LLE
JCD_LLE_debug = false


JCD_LLE_skill_books = {
	"Base.BookCarpentry", "Base.BookCooking", "Base.BookElectrician", "Base.BookFarming", 
	"Base.BookFirstAid", "Base.BookFishing", "Base.BookForaging", "Base.BookMechanic", 
	"Base.BookMetalWelding", "Base.BookTailoring", "Base.BookTrapping", 
	"Base.BookFitness", "Base.BookStrength",
}

JCD_LLE_bathroom_items = {
	"Base.Bandaid", "Base.Bandage", "Base.BathTowel", "Base.Tissue", "Base.Tweezers", "Base.PillsAntiDep", "Base.Pills", "Base.AlcoholWipes",
	"Base.Bandaid", "Base.Bandage", "Base.BathTowel", "Base.Tissue", "Base.Tweezers", "Base.PillsAntiDep", "Base.Pills", "Base.PillsSleepingTablets", "Base.Antibiotics", "Base.PillsVitamins",
	"Base.Bandaid", "Base.Bandage", "Base.BathTowel", "Base.Tissue", "Base.Tweezers", "Base.PillsAntiDep", "Base.Pills", "Base.PillsSleepingTablets", "Base.Antibiotics", "Base.PillsVitamins",
	"Base.Splint", "Base.AlcoholWipes", "Base.Disinfectant", "Base.AlcoholedCottonBalls", "Base.SutureNeedle", "Base.SutureNeedleHolder", "Base.Needle", "Base.Thread",
	"Base.Cologne", "Base.Comb", "Base.MakeupEyeshadow", "Base.MakeupFoundation", "Base.Lipstick", "Base.Perfume",
	"Base.PipeWrench",
}

JCD_LLE_bedroom_cupboard_items = {
	"Base.WhiskeyFull", "Base.Cigarettes", "Base.PillsSleepingTablets",
	"Base.Wallet", "Base.Wallet2", "Base.Wallet3", "Base.Wallet4", "Base.Money", "Base.Necklacepearl",
	"Base.Glasses", "Base.Ring", "Base.WeddingRing_Man", "Base.WeddingRing_Woman", 
	"Base.MintCandy", "Base.Chocolate", "Base.Crisps3", "Base.HotDrink", "Base.HotDrinkRed", "Base.HotDrinkWhite", "Base.HotDrinkSpiffo",
	"Base.Lamp", 
	"Base.Needle", "Base.Thread", "Base.Thread", "Base.Twine", 
	"Base.Scotchtape", "Base.Gum", 
	"Base.Eraser",
	"Base.Book", "Base.ComicBook", "Base.MagazineCrossword1", "Base.MagazineCrossword2", "Base.MagazineCrossword3", 
	"Base.HottieZ", "Base.Magazine", "Base.Newspaper", "Base.TVMagazine", "Base.MagazineWordsearch1", "Base.MagazineWordsearch2", "Base.MagazineWordsearch3", 
}
-- "Base.Belt", 

JCD_LLE_bedroom_wardrobe_items = {
	"Base.Gloves_WhiteTINT", "Base.Gloves_LeatherGloves", "Base.Gloves_FingerlessGloves", "Base.Gloves_LongWomenGloves",
	"Base.Jacket_WhiteTINT", "Base.Jacket_Black", "Base.JacketLong_Random", "Base.Jacket_Varsity", "Base.Jacket_PaddedDOWN", "Base.Jacket_ArmyCamoGreen", "Base.JacketLong_Random", "Base.Jacket_CoatArmy", "Base.Jacket_Ranger",
	"Base.Jacket_LeatherWildRacoons", "Base.Jacket_LeatherIronRodent", "Base.Jacket_LeatherBarrelDogs",
	"Base.Shirt_HawaiianRed", "Base.Shirt_FormalWhite_ShortSleeveTINT", "Base.Tshirt_WhiteTINT", "Base.Tshirt_Profession_RangerGreen", "Base.Tshirt_Profession_VeterenGreen", "Base.Tshirt_ArmyGreen",
	"Base.Trousers_Denim", "Base.Trousers_Padded", "Base.Trousers", "Base.Trousers",
	"Base.Hat_CrashHelmetFULL", "Base.Hat_FootballHelmet", "Hat_BaseballHelmet_KY",
	"Base.Shoes_ArmyBoots", "Base.Shoes_ArmyBootsDesert",
	"Base.Scarf_White", "Base.Scarf_StripeBlackWhite", "Base.Scarf_StripeBlueWhite", "Base.Scarf_StripeRedWhite",
	"Base.Vest_Hunting_Camo", "Base.Vest_BulletCivilian",
	"Base.Hat_Beret", "Base.Hat_BeretArmy",
	"Base.AmmoStrap_Bullets", "Base.AmmoStrap_Shells", "Base.HolsterDouble",
	"Base.Hat_EarMuffs",
	"Base.Hat_WinterHat", "Base.Hat_WoolyHat", "Base.Hat_Cowboy",
	"Base.LongJohns", "Base.LongJohns_Bottoms",
	"Base.Bag_Satchel",
	"Base.Pistol",  "Base.Bullets9mmBox", "Base.9mmClip", 
	"Base.Pistol2", "Base.Bullets45Box",  "Base.45Clip", 
	"Base.Pistol3", "Base.Bullets44Box",  "Base.44Clip",
	"Jacket_CoatArmy", "Base.Shirt_Denim", 
	"Base.Katana",
}

JCD_LLE_locker_items = {
	"Base.Gloves_LeatherGloves", "Base.Gloves_FingerlessGloves", 
	"Base.HolsterDouble", "Base.AmmoStrap_Bullets", "Base.AmmoStrap_Shells", 
	
	"Base.Jacket_Black", "Base.Jacket_ArmyCamoGreen", "Base.JacketLong_Random",
	"Base.Tshirt_Profession_VeterenGreen", "Base.Tshirt_ArmyGreen",
	"Base.Shoes_ArmyBoots", "Base.Shoes_ArmyBootsDesert",
	"Base.Hat_BeretArmy",
	"Base.Vest_BulletArmy",
	
	"Base.Pistol",  "Base.Bullets9mmBox", "Base.9mmClip", 
	"Base.Pistol2", "Base.Bullets45Box",  "Base.45Clip", 
	"Base.Pistol3", "Base.Bullets44Box",  "Base.44Clip",
	"Base.Revolver", "Base.Revolver_Short", "Base.Revolver_Long",
	"Base.223Bullets",
	"Base.308Bullets",
	"Base.Bullets38", "Base.Bullets38Box",
	"Base.556Bullets", "Base.556Box", "Base.556Clip",
	"Base.ShotgunShellsBox",
	"Base.AssaultRifle", "Base.AssaultRifle2",
	"Base.VarmintRifle", "Base.HuntingRifle",
	"Base.DoubleBarrelShotgun", "Base.Shotgun", "Base.ShotgunSawnoff", "Base.DoubleBarrelShotgunSawnoff",
	"Base.M14Clip",
	
	"Base.AmmoStraps", "Base.Bayonnet", "Base.ChokeTubeFull", "Base.ChokeTubeImproved",
	"Base.GunLight", "Base.IronSight", "Base.Laser", "Base.RecoilPad", "Base.RedDot", "Base.Sling", 
	"Base.x2Scope", "Base.x4Scope", "Base.x8Scope",
	"Base.Machete",
}

JCD_LLE_garagestorage_crate_items = {
	"Base.Machete",
	"Base.Sledgehammer", "Base.Sledgehammer2", "Base.Crowbar", "Base.Hammer", "Base.ClubHammer", "Base.BallPeenHammer",
	"Base.MetalBar", "Base.SheetMetal", "Base.SmallSheetMetal", "Base.MetalPipe", "Base.Aluminum",
	"Base.MetalBar", "Base.SheetMetal", "Base.SmallSheetMetal", "Base.MetalPipe", "Base.Aluminum",
	"Base.Woodglue", "Base.DuctTape", "Base.Glue", 
	"Base.Wire",
	"Base.Torch", "Base.HandTorch",
	"Base.BlowTorch", "Base.PropaneTank", "Base.WeldingRods",
	"Base.Fertilizer", "Base.CompostBag",
	"Base.ConcretePowder", "Base.PlasterPowder",
	"Base.MotionSensor",
	"Base.LugWrench", "Base.Wrench", "Base.PipeWrench", 
	"Base.GardenSaw", "Base.GardenHoe", "Base.GardenFork", "Base.HandFork", "Base.HandScythe",
	"Base.Generator", "Base.Jack", "Base.Saw", "Base.TirePump", "Base.Shovel", "Base.Shovel2",
	"Base.CarBatteryCharger", "Base.Extinguisher", "Base.WeldingMask",
	"Base.Axe", "Base.BaseballBat", "Base.DumbBell", "Base.HandAxe", "Base.PickAxe", "Base.WoodAxe",
	"Base.TrapBox", "Base.TrapCage", "Base.TrapMouse", "Base.Amplifier", 
	"Base.NailsBox", "Base.ScrewsBox", "Base.Nails", "Base.Nails",
	"Base.GunPowder", "Base.Rope", 
	"Base.Gravelbag", "Base.Sandbag", "Base.IronIngot", "Base.BucketEmpty", 
	"Base.Plank", "Base.Tarp", "Base.BarbedWire", "Base.WoodenStick", 
	"Base.Coldpack", "Base.Timer", 
	"Base.PetrolCan", "Base.Charcoal", 
	"Base.FishingLine", "Base.FishingRod", "Base.FishingTackle", "Base.FishingTackle2", "Base.BaitFish", "Base.FishingNet", 
	
	"Base.EngineParts", "Base.EngineParts", 
	"Base.BigTrunk1", "Base.BigTrunk2", "Base.BigTrunk3",
	"Base.TrailerTrunk1", "Base.TrailerTrunk2", "Base.TrailerTrunk3", 
	"Base.OldBrake1", "Base.OldBrake2", "Base.OldBrake3", 
	"Base.ModernBrake1", "Base.ModernBrake2", "Base.ModernBrake3", 
	"Base.NormalBrake1", "Base.NormalBrake2", "Base.NormalBrake3", 
	"Base.CarBattery1", "Base.CarBattery2", "Base.CarBattery3",
	"Base.RearCarDoorDouble1", "Base.RearCarDoorDouble2", "Base.RearCarDoorDouble3",
	"Base.RearCarDoor1", "Base.RearCarDoor2", "Base.RearCarDoor3",
	"Base.FrontCarDoor1", "Base.FrontCarDoor2", "Base.FrontCarDoor3", 
	"Base.BigGasTank1", "Base.BigGasTank2", "Base.BigGasTank3", 
	"Base.NormalGasTank1", "Base.NormalGasTank2", "Base.NormalGasTank3", 
	"Base.SmallGasTank1", "Base.SmallGasTank2", "Base.SmallGasTank3", 
	"Base.GloveBox1", "Base.GloveBox2", "Base.GloveBox3", 
	"Base.EngineDoor1", "Base.EngineDoor2", "Base.EngineDoor3", 
	"Base.NormalCarMuffler1", "Base.NormalCarMuffler2", "Base.NormalCarMuffler3", 
	"Base.OldCarMuffler1", "Base.OldCarMuffler2", "Base.OldCarMuffler3", 
	"Base.ModernCarMuffler1", "Base.ModernCarMuffler2", "Base.ModernCarMuffler3", 
	
	"Base.NormalCarSeat1", "Base.NormalCarSeat2", "Base.NormalCarSeat3", 
	
	"Base.SmallTrunk1", "Base.SmallTrunk2", "Base.SmallTrunk3", 
	"Base.VanSeatsTrunk2", 
	"Base.NormalTrunk1", "Base.NormalTrunk2", "Base.NormalTrunk3", 
	
	"Base.ModernSuspension1", "Base.ModernSuspension2", "Base.ModernSuspension3", 
	"Base.NormalSuspension1", "Base.NormalSuspension2", "Base.NormalSuspension3", 
		
	"Base.OldTire1", "Base.OldTire2", "Base.OldTire3", 
	"Base.NormalTire1", "Base.NormalTire2", "Base.NormalTire3", 
	"Base.ModernTire1", "Base.ModernTire2", "Base.ModernTire3", 
	
	"Base.TrunkDoor1", "Base.TrunkDoor2", "Base.TrunkDoor3", 
	
	"Base.FrontWindow1", "Base.FrontWindow2", "Base.FrontWindow3", 
	"Base.RearWindow1", "Base.RearWindow2", "Base.RearWindow3", 
	"Base.Windshield1", "Base.Windshield2", "Base.Windshield3", 
	"Base.RearWindshield1", "Base.RearWindshield2", "Base.RearWindshield3", 
}
--"Base.BarBell", 

JCD_LLE_garagestorage_shelf_items = {
	"Base.Sledgehammer", "Base.Sledgehammer2", "Base.Crowbar", "Base.Hammer", "Base.ClubHammer", "Base.BallPeenHammer",
	"Base.MetalBar", "Base.SheetMetal", "Base.SmallSheetMetal", "Base.MetalPipe", "Base.Aluminum",
	"Base.MetalBar", "Base.SheetMetal", "Base.SmallSheetMetal", "Base.MetalPipe", "Base.Aluminum",
	"Base.Woodglue", "Base.DuctTape", "Base.Glue", 
	"Base.Wire",
	"Base.Torch", "Base.HandTorch",
	"Base.BlowTorch", "Base.PropaneTank", "Base.WeldingRods",
	"Base.Fertilizer", "Base.CompostBag",
	"Base.ConcretePowder", "Base.PlasterPowder",
	"Base.MotionSensor",
	"Base.LugWrench", "Base.Wrench", "Base.PipeWrench", 
	"Base.GardenSaw", "Base.GardenHoe", "Base.GardenFork", "Base.HandFork", "Base.HandScythe",
	"Base.Jack", "Base.Saw", "Base.TirePump", "Base.Shovel", "Base.Shovel2",
	"Base.Extinguisher", "Base.WeldingMask",
	"Base.Axe", "Base.BaseballBat", "Base.DumbBell", "Base.HandAxe", "Base.PickAxe", "Base.WoodAxe",
	"Base.TrapBox", "Base.TrapCage", "Base.TrapMouse", "Base.Amplifier", 
	"Base.NailsBox", "Base.ScrewsBox", "Base.Nails", "Base.Nails",
	"Base.GunPowder", "Base.Rope", 
	"Base.Gravelbag", "Base.Sandbag", "Base.IronIngot", "Base.BucketEmpty", 
	"Base.Plank", "Base.Tarp", "Base.WoodenStick", 
	"Base.Coldpack", "Base.Timer", 
	"Base.PetrolCan", "Base.Charcoal"
}

JCD_LLE_kitchen_counter_items = {
	"Base.PipeWrench",
	"Base.CannedFruitBeverage", 
	
	"Base.DishCloth", "Base.DishCloth", "Base.DishCloth",
	"Base.WaterBottleFull", "Base.Wine", "Base.Wine2",
	"Base.WaterMugSpiffo", "Base.Wine", "Base.JuiceBox",
	"Base.BleachEmpty", "Base.Bleach",
	"Base.Aluminum",
	
	"Base.Basil", "Base.BeefJerky", "Base.BouillonCube", "Base.OatsRaw",
	"Base.TinnedBeans", "Base.CannedCarrots2", "Base.CannedChili", "Base.CannedCorn", "Base.CannedCornedBeef", "Base.CannedMilk", "Base.CannedFruitCocktail", "Base.CannedMushroomSoup", 
	"Base.CannedPeaches", "Base.CannedPeas", "Base.CannedPineapple", "Base.CannedPotato2", "Base.CannedSardines", "Base.CannedBolognese", "Base.CannedTomato2", "Base.TunaTin", "Base.TinnedSoup", 
	
	"Base.Cereal", "Base.Cereal", 
	
	"Base.Crisps", "Base.Crisps2", "Base.Crisps3", "Base.Crisps4", 
	
	"Base.Chives", 
	
	"Base.ChocoCakes", "Base.Chocolate", "Base.CookieChocolateChip", "Base.ChocolateChips", "Base.CookiesChocolate", "Base.ChocolateCoveredCoffeeBeans", 
	
	"Base.Cilantro", "Base.CinnamonRoll", "Base.Crackers", "Base.DehydratedMeatStick", 
	
	"Base.DriedBlackBeans", "Base.DriedChickpeas", "Base.DriedKidneyBeans", "Base.DriedLentils", "Base.DriedSplitPeas", "Base.DriedWhiteBeans", 
	
	"Base.Ramen", "Base.JamFruit", "Base.GrahamCrackers", 
	
	"Base.GummyBears", "Base.GummyWorms", 
	
	"Base.Honey", "Base.Popcorn", 
	
	"Base.Lard", "Base.Macandcheese", "Base.JamMarmalade", "Base.Marshmallows", "Base.MintCandy", 
	
	"Base.Pasta", "Base.PeanutButter", "Base.Peanuts", "Base.Pretzel", "Base.Rice", "Base.RicePaper", "Base.DoughRolled", 
	
	"Base.Rosemary", "Base.Sage", "Base.SunflowerSeeds", "Base.TVDinner", "Base.Thyme", "Base.TomatoPaste", "Base.TortillaChips", 
	
	"Base.BakingPan", "Base.BakingSoda", "Base.BakingTray", "Base.BoxOfJars", "Base.SugarBrown", "Base.Butter", "Base.CakeBatter", "Base.CakePrep", 
	"Base.CocoaPowder", "Base.Coffee2", "Base.TortillaChips", "Base.Pot", "Base.Bowl", "Base.Cornflour", "Base.Cornmeal", "Base.EmptyJar", "Base.Kettle", 
	"Base.Mugl", "Base.Flour", "Base.Pan", "Base.GravyMix", "Base.GridlePan", "Base.Hotsauce", "Base.JarLid", "Base.Ketchup", "Base.MapleSyrup", 
	"Base.Margarine", "Base.Marinara", "Base.MuffinTray", "Base.Mustard", "Base.OilOlive", "Base.PancakeMix", "Base.Pepper", "Base.PieDough", "Base.RiceVinegar", 
	"Base.RoastingPan", "Base.RollingPin", "Base.Salt", "Base.Saucepan", "Base.Soysauce", "Base.Sugar", "Base.SugarPacket", "Base.OilVegetable", "Base.Vinegar", "Base.Yeast", 
	
}

local function JCD_LLE_getTableSize(t)
	local count = 0
    for _, __ in pairs(t) do
        count = count + 1
    end
    return count
end

local function JCD_LLE_fill_book_shelves(roomName, containerType, itemContainer, player, minItemsToAdd, maxItemsToAdd)
	local itemArrayCount = JCD_LLE_getTableSize(JCD_LLE_skill_books);
	local addItemAmount = ZombRand(maxItemsToAdd); -- how many skillbooks should be added? (None to 3)

	print(roomName .. ": " .. containerType .. ": MOD FILLING CONTAINER");
	
	-- Adds random skillbook of level 1 to 4 (not level 5). 
	
	-- level 1 = 40/100, level 2 = 30/100, level 3 = 20/100, level 4 = 10/100, level 5 = 0/100
	local total = 0;
	local skill_book_level_chance = ZombRand(100);
	local skill_book_level_chance_of_level_1 = 40;
	local skill_book_level_chance_of_level_2 = skill_book_level_chance_of_level_1 + 30;
	local skill_book_level_chance_of_level_3 = skill_book_level_chance_of_level_2 + 20;
	
	local skill_book_level = 1;
	
	if (skill_book_level_chance >= skill_book_level_chance_of_level_1) then
		skill_book_level = 2;
	end
	
	if (skill_book_level_chance >= skill_book_level_chance_of_level_2) then
		skill_book_level = 3;
	end
	
	if (skill_book_level_chance >= skill_book_level_chance_of_level_3) then
		skill_book_level = 4;
	end
	
	
	for i=1-minItemsToAdd, (addItemAmount) do
		local iItem = ZombRand(itemArrayCount) + 1;
		local item = JCD_LLE_skill_books[iItem] .. (skill_book_level);
		print("min:" .. minItemsToAdd .. " max:" .. maxItemsToAdd .. " item:" .. iItem);
		itemContainer:AddItem(item);
		--print(item);
		total = total+1;
	end
	
	print(roomName .. ": " .. containerType .. ". Total:" .. total);
	--player:Say(roomName .. ": " .. containerType .. ". Total:" .. total);
end

local function JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, listOfItems, testAddingAllItems, minItemsToAdd, maxItemsToAdd)
	local itemArrayCount = JCD_LLE_getTableSize(listOfItems);
	local addItemAmount = ZombRand(maxItemsToAdd); -- how many items should be added?

	print(roomName .. ": " .. containerType .. ": MOD FILLING CONTAINER");
	--player:Say(roomName .. ": " .. containerType .. ": MOD FILLING CONTAINER");
	local total = 0;
	if testAddingAllItems ~= true then
		-- Adds random items based on container type as defined in "listOfItems".
		for i=1-minItemsToAdd, (addItemAmount) do
			local iItem = ZombRand(itemArrayCount) + 1;
			local item = listOfItems[iItem];
			print("min:" .. minItemsToAdd .. " max:" .. maxItemsToAdd .. " item:" .. iItem);
			itemContainer:AddItem(item);
			--print(item);
			total = total+1;
		end
	else
		-- test by adding all items
		for i, item in ipairs(listOfItems) do
			itemContainer:AddItem(item);
			--print("ADDING TO CONTAINER:" .. item);
			total = total+1;
		end
	end
	
	print(roomName .. ": " .. containerType .. ". Total:" .. total);
	--player:Say(roomName .. ": " .. containerType .. ". Total:" .. total);
end

local function JCD_LLE_fill_container(roomName, containerType, itemContainer, player, minItemsToAdd, maxItemsToAdd)
	--print("REACHED JCD_LLE_fill_container");
	if (roomName == "livingroom" or roomName == "kitchen" or roomName == "bedroom") and containerType == "shelves" then
		JCD_LLE_fill_book_shelves(roomName, containerType, itemContainer, player, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "bathroom") and (containerType == "counter" or containerType == "medicine") then
		JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_bathroom_items, false, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "bedroom" or roomName == "motelroomoccupied") and (containerType == "sidetable" or containerType == "counter" or containerType == "dresser") then
		JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_bedroom_cupboard_items, false, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "bedroom" or roomName == "motelroomoccupied") and (containerType == "wardrobe") then
		JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_bedroom_wardrobe_items, false, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "livingroom") and (containerType == "locker") then
		JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_locker_items, false, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "gasstorage" or roomName == "garagestorage" or roomName == "storageunit" or roomName == "janitor" or roomName == "warehouse") and (containerType == "metal_shelves" or containerType == "shelves") then
		JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_garagestorage_shelf_items, false, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "gasstorage" or roomName == "garagestorage" or roomName == "storageunit" or roomName == "janitor" or roomName == "warehouse") and (containerType == "counter" or containerType == "crate") then
		JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_garagestorage_crate_items, false, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "kitchen") and (containerType == "counter" or containerType == "overhead") or (roomName == "livingroom" and containerType == "counter") then
		JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_kitchen_counter_items, false, minItemsToAdd, maxItemsToAdd);
	elseif (roomName == "livingroom" or roomName == "closet") and (containerType == "crate") then
		local rand = ZombRand(7);
		
		-- a livingroom/closet crate can contain almost anything.
		if rand == 0 then
			JCD_LLE_fill_book_shelves(roomName, containerType, itemContainer, player, minItemsToAdd, maxItemsToAdd);
		elseif rand == 1 then
			JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_bathroom_items, false, minItemsToAdd, maxItemsToAdd);
		elseif rand == 2 then
			JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_bedroom_cupboard_items, false, minItemsToAdd, maxItemsToAdd);
		elseif rand == 3 then
			JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_bedroom_wardrobe_items, false, minItemsToAdd, maxItemsToAdd);
		elseif rand == 4 then
			JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_locker_items, false, minItemsToAdd, maxItemsToAdd);
		elseif rand == 5 then
			JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_garagestorage_crate_items, false, minItemsToAdd, maxItemsToAdd);
		elseif rand == 6 then
			JCD_LLE_fill_custom_containers(roomName, containerType, itemContainer, player, JCD_LLE_kitchen_counter_items, false, minItemsToAdd, maxItemsToAdd);
		end
	end
end

local function JCD_LLE_onFillContainer(roomName, containerType, itemContainer)
	if roomName ~= "all" then
		for playerIndex = 0, getNumActivePlayers()-1 do
			local player = getSpecificPlayer(playerIndex);
			local isoWorld = getWorld();
			local isoMetaChunk = null;
			
			if player ~= null then
				local items = itemContainer:getItems();
				local itemsLength = items:size();
				
				print(roomName .. ": " .. containerType .. ": Num Items In Container: " .. itemsLength);
				if itemsLength < 4 then
					local lucky = player:HasTrait("Lucky");
					local unlucky = player:HasTrait("Unlucky");
					local rollFillEmptyContainer = ZombRand(100);
					
					if lucky == true then
						rollFillEmptyContainer = rollFillEmptyContainer + 15; --15% more chance to fill empty containers if you have the lucky trait
					end
					if unlucky == true then
						rollFillEmptyContainer = rollFillEmptyContainer - 15; --15% less chance to fill empty containers if you have the unlucky trait
					end
					
					-- 65% Chance (+/- Luck/Unluck) to spawn items in empty/lacking container
					if rollFillEmptyContainer >= (100-65) then
						if itemsLength == 0 then
							JCD_LLE_fill_container(roomName, containerType, itemContainer, player, 1, 4);
						elseif itemsLength == 1 then
							JCD_LLE_fill_container(roomName, containerType, itemContainer, player, 1, 3);
						elseif itemsLength == 2 then
							JCD_LLE_fill_container(roomName, containerType, itemContainer, player, 1, 2);
						elseif itemsLength == 3 then
							JCD_LLE_fill_container(roomName, containerType, itemContainer, player, 1, 1);
						end
					end
				end
			
				-- Seems like intensity has something to do with the loot calculation per game but it doesn't seem to be what we're after.
				--isoMetaChunk = isoWorld:getMetaChunk(player:getX() / 10, player:getY() / 10);
				--if isoMetaChunk ~= null then
				--	local intensity = isoMetaChunk:getLootZombieIntensity();
				--	player:Say("INTENSITY:" .. intensity);
				--	print("INTENSITY:" .. intensity);
				--end
			end
		end
	end
end

Events.OnFillContainer.Add(JCD_LLE_onFillContainer)