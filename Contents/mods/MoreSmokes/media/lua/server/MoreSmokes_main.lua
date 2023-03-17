require "recipecode"

MoreSmokes = MoreSmokes or {};

MoreSmokes.options = {
    Pack = {"MSCigarettePack", "CigarilloPack", "CigarBox", "JointsPackNorthernLights", "JointsPackPurpleHaze", "JointsPackSourDiesel", "BluntsPackNorthernLights", "BluntsPackPurpleHaze", "BluntsPackSourDiesel", "SpliffsPackNorthernLights", "SpliffsPackPurpleHaze", "SpliffsPackSourDiesel" },
    Seed = {"SeedPackTobacco", "SeedPackNorthernLights", "SeedPackPurpleHaze", "SeedPackSourDiesel"},
    Tobacco = {"TobaccoZipLockBag", "ChewingTobaccoCan"},
    Cannabis = {"NorthernLightsZipLockBag", "PurpleHazeZipLockBag","SourDieselZipLockBag"},
    Bong = {"Bong1v1", "Bong1v2", "Bong1v3", "Bong1v4", "Bong2v1", "Bong2v2", "Bong2v3", "Bong2v4", "Bong3v1", "Bong3v2", "Bong3v3", "Bong3v4", "Bong4v1", "Bong4v2", "Bong4v3", "Bong4v4", "Bong5"},
    Pipe = {"SmokePipe1", "SmokePipe2", "SmokePipe3", "SmokePipeGlassBlue", "SmokePipeGlassGreen", "SmokePipeGlassYellow", "SmokePipePink"},
    Hookah = {"Hookah1", "Hookah2", "Hookah3"},
    Edibles = {"CannabisButter", "CannabisChocolateBar", "CannabisBrownie", "CannabisGummies"},
    Recipe = {"MoreSmokesMagazine1", "MoreSmokesMagazine2", "MoreSmokesMagazine3", "MoreSmokesMagazine4"}
}

function MoreSmokes.openSmokesKit(items, result, player)
    local inventory = player:getInventory();
    local spawns = {
        "Grinder",
    }
    
    function addRandomItem(oType, count)
        for i = 1, count or 1
        do
            table.insert(spawns, MoreSmokes.options[oType][ZombRand(#MoreSmokes.options[oType] + 1)]);
        end
    end
    
    addRandomItem("Pack");
    addRandomItem("Seed", 2);
    addRandomItem("Recipe");
    
    local r = ZombRand(1, 100);
    
    if r <= 15
    then
        addRandomItem("Bong");
        addRandomItem("Cannabis");
    elseif r <= 30 
    then
        addRandomItem("Pipe");
        addRandomItem("Tobacco");
    elseif r <= 55
    then
        addRandomItem("Hookah");
        addRandomItem("Tobacco");
    elseif r <= 85
    then
        addRandomItem("Edibles", 2);
        addRandomItem("Seed", 2);
    else
        addRandomItem("Pack");
        addRandomItem("Bong");
        addRandomItem("Edibles");
        addRandomItem("Recipe");
    end
    
    for i, itemId in ipairs(spawns)
    do
        inventory:AddItem("MoreSmokes." .. itemId);
    end
end

function MoreSmokes.onEatJoint(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 40);
        stats:setStress(stats:getStress() + 0.12);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 25);
end

function MoreSmokes.onEatBlunt(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 55);
        stats:setStress(stats:getStress() + 0.15);
    end
    if character:HasTrait("Smoker") then
        stats:setStress(stats:getStress() - 10);
        stats:setStressFromCigarettes(0);
        character:setTimeSinceLastSmoke(0);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 35);
end

function MoreSmokes.onEatEdible(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 40);
        stats:setStress(stats:getStress() + 0.12);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 25);
end

function MoreSmokes.onEatMixed(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 20);
        stats:setStress(stats:getStress() + 0.08);
    end
    if character:HasTrait("Smoker") then
        stats:setStress(stats:getStress() - 10);
        stats:setStressFromCigarettes(0);
        character:setTimeSinceLastSmoke(0);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 10);
end

function MoreSmokes.onEatPipe(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 50);
        stats:setStress(stats:getStress() + 0.15);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 30);
end

function MoreSmokes.onEatHookah(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 45);
        stats:setStress(stats:getStress() + 0.12);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 25);
end

function MoreSmokes.onEatBong(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 60);
        stats:setStress(stats:getStress() + 0.18);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 40);
end

function MoreSmokes.onEatCannabisPlus(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 50);
        stats:setStress(stats:getStress() + 0.10);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 35);
end

function MoreSmokes.onEatBluntPlus(food, character, player)
    local script = food:getScriptItem()
    local stats = character:getStats()
    if character:HasTrait("ParanoidToker") then
        stats:setPanic(stats:getPanic() + 60);
        stats:setStress(stats:getStress() + 0.18);
    end
    if character:HasTrait("Smoker") then
        stats:setStress(stats:getStress() - 10);
        stats:setStressFromCigarettes(0);
        character:setTimeSinceLastSmoke(0);
    end
    if stats:getPanic() < 0 then
        stats:setPanic(0);
    end
    if stats:getStress() < 0 then
        stats:setStress(0);
    end
    MoreSmokes.stonedIncrease(player, 45);
end

-- Default function to award XP for Cultivation Skill
function Recipe.OnGiveXP.Cultivation5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cultivation, 5);
end

function Recipe.OnGiveXP.Cultivation10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cultivation, 10);
end

function Recipe.OnGiveXP.Cultivation15(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cultivation, 15);
end

function Recipe.OnGiveXP.Cultivation20(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cultivation, 20);
end

function Recipe.OnGiveXP.Cultivation25(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cultivation, 25);
end

-- Custom Item Tags to be used for referencing list of items in that category, 
-- designed for future recipe development or add ons

function Recipe.GetItemTypes.Cannabis(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("Cannabis"))
end

function Recipe.GetItemTypes.Tobacco(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("Tobacco"))
end

function Recipe.GetItemTypes.CannaButter(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("CannaButter"))
end

function Recipe.GetItemTypes.Edibles(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("Edibles"))
end

function Recipe.GetItemTypes.Bong(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Bong"))
end

function Recipe.GetItemTypes.Pipe(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Pipe"))
end

function Recipe.GetItemTypes.Hookah(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Hookah"))
end

function Recipe.GetItemTypes.TobaccoCan(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("TobaccoCan"))
end

-- OnCreate Recipes
-- Gain back items on Unloading Smoking Vessels
function Recipe.OnCreate.UnloadTobacco(items, result, player)
    player:getInventory():AddItems("MoreSmokes.TobaccoLoose", 3)
end

function Recipe.OnCreate.UnloadShishaWatermelon(items, result, player)
    player:getInventory():AddItems("MoreSmokes.ShishaWatermelonCan", 1)
end

function Recipe.OnCreate.UnloadShishaOrange(items, result, player)
    player:getInventory():AddItems("MoreSmokes.ShishaOrangeCan", 1)
end

function Recipe.OnCreate.UnloadShishaLemon(items, result, player)
    player:getInventory():AddItems("MoreSmokes.ShishaLemonCan", 1)
end

function Recipe.OnCreate.UnloadNorthernLights (items, result, player)
    player:getInventory():AddItems("MoreSmokes.NorthernLightsLoose", 3)
end

function Recipe.OnCreate.UnloadPurpleHaze (items, result, player)
    player:getInventory():AddItems("MoreSmokes.PurpleHazeLoose", 3)
end

function Recipe.OnCreate.UnloadSourDiesel (items, result, player)
    player:getInventory():AddItems("MoreSmokes.SourDieselLoose", 3)
end

local sVars = SandboxVars.MoreSmokes;
sVars.CultivationBonus = sVars.CultivationBonus or 0;

function MoreSmokes.onCultPerkTobacco(items, character, player)
    local player = getPlayer();
    local cultivation = player:getPerkLevel(Perks.Cultivation);
    local r = ZombRand(1, 100);

    if cultivation >= 8 and r <= 40 then
        player:getInventory():AddItems("MoreSmokes.TobaccoLoose", (1 + sVars.CultivationBonus))
    elseif cultivation >= 6 and r <= 30 then
        player:getInventory():AddItems("MoreSmokes.TobaccoLoose", (1 + sVars.CultivationBonus))
    elseif cultivation >= 4 and r <= 20 then
        player:getInventory():AddItems("MoreSmokes.TobaccoLoose", (1 + sVars.CultivationBonus))
    elseif cultivation >= 2 and r <= 10 then
        player:getInventory():AddItems("MoreSmokes.TobaccoLoose", (1 + sVars.CultivationBonus))
    end
end

function MoreSmokes.onCultPerkNorthernLights(items, character, player)
    local player = getPlayer();
    local cultivation = player:getPerkLevel(Perks.Cultivation);

    if cultivation >= 8 then
        player:getInventory():AddItems("MoreSmokes.NorthernLightsLoose", (4 + sVars.CultivationBonus))
    elseif cultivation >= 6 then
        player:getInventory():AddItems("MoreSmokes.NorthernLightsLoose", (3 + sVars.CultivationBonus))
    elseif cultivation >= 4 then
        player:getInventory():AddItems("MoreSmokes.NorthernLightsLoose", (2 + sVars.CultivationBonus))
    elseif cultivation >= 2 then
        player:getInventory():AddItems("MoreSmokes.NorthernLightsLoose", (1 + sVars.CultivationBonus))
    end
    player:getInventory():AddItem("EmptyJar")
    player:getInventory():AddItem("JarLid")
end

function MoreSmokes.onCultPerkPurpleHaze(items, character, player)
    local player = getPlayer();
    local cultivation = player:getPerkLevel(Perks.Cultivation);

    if cultivation >= 8 then
        player:getInventory():AddItems("MoreSmokes.PurpleHazeLoose", (4 + sVars.CultivationBonus))
    elseif cultivation >= 6 then
        player:getInventory():AddItems("MoreSmokes.PurpleHazeLoose", (3 + sVars.CultivationBonus))
    elseif cultivation >= 4 then
        player:getInventory():AddItems("MoreSmokes.PurpleHazeLoose", (2 + sVars.CultivationBonus))
    elseif cultivation >= 2 then
        player:getInventory():AddItems("MoreSmokes.PurpleHazeLoose", (1 + sVars.CultivationBonus))
    end
    player:getInventory():AddItem("EmptyJar")
    player:getInventory():AddItem("JarLid")
end

function MoreSmokes.onCultPerkSourDiesel(items, character, player)
    local player = getPlayer();
    local cultivation = player:getPerkLevel(Perks.Cultivation);

    if cultivation >= 8 then
        player:getInventory():AddItems("MoreSmokes.SourDieselLoose", (4 + sVars.CultivationBonus))
    elseif cultivation >= 6 then
        player:getInventory():AddItems("MoreSmokes.SourDieselLoose", (3 + sVars.CultivationBonus))
    elseif cultivation >= 4 then
        player:getInventory():AddItems("MoreSmokes.SourDieselLoose", (2 + sVars.CultivationBonus))
    elseif cultivation >= 2 then
        player:getInventory():AddItems("MoreSmokes.SourDieselLoose", (1 + sVars.CultivationBonus))
    end
    player:getInventory():AddItem("EmptyJar")
    player:getInventory():AddItem("JarLid")
end

--THIS KEEPS BREAKING AND NOT SURE WHY?
-- Adds  empty Jar back to inventory after removing bud from the jar
function Recipe.OnCreate.EarlyBudRemoval(items, result, player)
    player:getInventory():AddItem("EmptyJar")
    player:getInventory():AddItem("JarLid")
end   

-- give Tray back (FOR EDIBLES - WRITE THE CODE)
function Recipe.OnCreate.GetBakedGoodsPan(items,result,player)
    if selectedItem:isBurnt() then result:setBurnt(true) end
    player:getInventory():AddItem("Base.BakingTray");
    player:getInventory():Remove(selectedItem);
end

function Recipe.OnCreate.BagRetrieval(items, result, player)
    player:getInventory():AddItem("Base.Garbagebag")
end

