require "recipecode"

--Refer to https://projectzomboid.com/modding/index-files/index-7.html for commands
--Refer to https://pzwiki.net/wiki/Debug_mode#Moodles_and_Body for min/max moodle values


--TEST CODE ONLY (ensure not used in actual recipes)
--function Recipe.OnGiveXP.WoodWork100(recipe, ingredients, result, player)
--    player:getXp():AddXP(Perks.Woodwork, 100);
--end

--TEST CODE ONLY (ensure not used in actual recipes)
--function Recipe.OnCreate.GetStarterKit(recipe, result, player)
--    local item1 = InventoryItemFactory.CreateItem("Base.Crisps");
--    player:getInventory():AddItem(item1);
--    local item2 = InventoryItemFactory.CreateItem("Base.Needle");
--    player:getInventory():AddItem(item2);
--    local item3 = InventoryItemFactory.CreateItem("Base.Scissors");
--    player:getInventory():AddItem(item3);
--    local item4 = InventoryItemFactory.CreateItem("Base.Thread");
--    player:getInventory():AddItem(item4);
--    local item5 = InventoryItemFactory.CreateItem("Base.WaterBottleFull");
--    player:getInventory():AddItem(item5);
--    local item6 = InventoryItemFactory.CreateItem("Base.HuntingKnife");
--    player:getInventory():AddItem(item6);
--    local item7 = InventoryItemFactory.CreateItem("Base.TinOpener");
--    player:getInventory():AddItem(item7);
--end

--Define XP for crafting
function Recipe.OnGiveXP.Tailoring1(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 1);
end
function Recipe.OnGiveXP.Tailoring3(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 3);
end
function Recipe.OnGiveXP.Tailoring5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 5);
end
function Recipe.OnGiveXP.Tailoring10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 10);
end
function Recipe.OnGiveXP.Tailoring15(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 15);
end
function Recipe.OnGiveXP.Tailoring20(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 20);
end
function Recipe.OnGiveXP.Tailoring25(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 25);
end

--Define function to place yarn in inventory
function Recipe.OnCreate.GetYarn1(recipe, result, player)
    local yarn = InventoryItemFactory.CreateItem("Base.Yarn");
    player:getInventory():AddItem(yarn);
end
function Recipe.OnCreate.GetYarn2(recipe, result, player)
	local NumberOfYarn = 2;
	for i=1,NumberOfYarn do
		local yarn = InventoryItemFactory.CreateItem("Base.Yarn");
		player:getInventory():AddItem(yarn);
	end
end

--Define function to place thread in inventory
function Recipe.OnCreate.GetThread1(recipe, result, player)
    local thread = InventoryItemFactory.CreateItem("Base.Thread");
    player:getInventory():AddItem(thread);
end

--Define function to place sheet in inventory
function Recipe.OnCreate.GetSheet1(recipe, result, player)
    local sheet = InventoryItemFactory.CreateItem("Base.Sheet");
    player:getInventory():AddItem(sheet);
end

--Define changes to moodles unhappy, boredom, stress

function SongbirdSewingChangeMood()
	--get existing data and assign to local variable
	local SBplayer = getPlayer();
	--TEST ... local SBplayerName = SBplayer:getFullName();
	--TEST ... SBplayer:Say("Hi "..SBplayerName);
	--define mood changes
	--Note: valid values between -100 and +100
	--(negative is decrease, positive is increase)
	local SadnessChange = -5;
	local BoredomChange = -5;
	local StressChange = -3;
	--call functions to change moods
	SongbirdChangeSadness(SBplayer,SadnessChange);
	SongbirdChangeBoredom(SBplayer,BoredomChange);
	SongbirdChangeStress(SBplayer,StressChange);
end
function SongbirdChangeSadness(player,changeAmount)
	--Note: changeAmount positive is increased sadness, negative is decreased sadness
	local minSadness = 0;
	local maxSadness = 100;
	local CurrentSadnessLevel = player:getBodyDamage():getUnhappynessLevel();
	--TEST ... SBplayer:Say("Current sadness at "..CurrentSadnessLevel);
	local NewSadnessLevel = CurrentSadnessLevel + changeAmount;
	--ensure result is between min and max
	NewSadnessLevel = math.max(minSadness,NewSadnessLevel);
	NewSadnessLevel = math.min(NewSadnessLevel,maxSadness);
	--TEST ... SBplayer:Say("New sadness at "..NewSadnessLevel);
	--apply result
	player:getBodyDamage():setUnhappynessLevel(NewSadnessLevel);
end
function SongbirdChangeBoredom(player,changeAmount)
	--Note: changeAmount positive is increased boredom, negative is decreased boredom
	local minBoredom = 0;
	local maxBoredom = 100;
	local CurrentBoredomLevel = player:getBodyDamage():getBoredomLevel();
	local NewBoredomLevel = CurrentBoredomLevel + changeAmount;
	--ensure result is between min and max
	NewBoredomLevel = math.max(minBoredom,NewBoredomLevel);
	NewBoredomLevel = math.min(NewBoredomLevel,maxBoredom);
	--apply result
	player:getBodyDamage():setBoredomLevel(NewBoredomLevel);
end
function SongbirdChangeStress(player,changeAmount)
	--Note: changeAmount positive is increased stress, negative is decreased stress
	local minStress = 0;
	local maxStress = 1;
	--convert to percentage for this moodle
	if changeAmount ~= 0 then --not equal zero
		changeAmount = changeAmount / 100;
	end
	--continue as normal
	local CurrentStressLevel = player:getStats():getStress();
	local NewStressLevel = CurrentStressLevel + changeAmount;
	--ensure result is between min and max
	NewStressLevel = math.max(minStress,NewStressLevel);
	NewStressLevel = math.min(NewStressLevel,maxStress);
	--apply result
	player:getStats():setStress(NewStressLevel);
end