--require "recipecode";

function Recipe.OnGiveXP.MetalWelding01(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 1);
	player:getXp():AddXP(Perks.Strength, 6);
end

function Recipe.OnGiveXP.MetalWelding03(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 3);
	player:getXp():AddXP(Perks.Strength, 10);
end

function Recipe.OnGiveXP.MetalWelding05(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 5);
	player:getXp():AddXP(Perks.Strength, 14);
end

function Recipe.OnGiveXP.MechWeld05(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 3);
    player:getXp():AddXP(Perks.MetalWelding, 5);	
end

function Recipe.OnGiveXP.DisStr(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Strength, 8);
end

function Recipe.OnGiveXP.Electricity03(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity, 3);
end

-- keep favs when dismantling
function Recipe.OnTest.DismantleFavs(item)
    if not item  then return end
    if item:getType() == "WeldingMask" or item:getType() == "BlowTorch" or item:getType() == "Hammer" or item:isBroken() then
       return true
    end
    return not item:isFavorite()
end


--change parameter in item
local item = ScriptManager.instance:getItem("Base.Lighter")    
if item then 
    item:DoParam("ticksPerEquipUse = 250")
	item:DoParam("ReplaceOnDeplete = EmptyLighter")
end


--breaking items for strenght
function Recipe.OnGiveXP.BreakStr(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Strength, 4);
end


--recycle metal items
function Recipe.OnCreate.RecycleToScrapMetal(items, result, player)
    local weight = 0
    for i = 0, items:size()-1 do
        local item = items:get(i)
        if item and item:getType() ~= "WeldingMask" and item:getType() ~= "BlowTorch" then
            weight = weight + item:getWeight()
        end
    end

    local scrapQuantity = math.floor(weight*10*0.5)
    if scrapQuantity < 1 then 
		player:getXp():AddXP(Perks.Strength, 4)
    else
        player:getInventory():AddItems("Base.ScrapMetal", scrapQuantity)
        player:getXp():AddXP(Perks.MetalWelding, scrapQuantity*2)
		player:getXp():AddXP(Perks.Strength, scrapQuantity*4)
    end
end


--recycle vehicle items
function Recipe.OnCreate.RecycleToScrapMetalVHC(items, result, player)
    local weight = 0
    for i = 0, items:size()-1 do
        local item = items:get(i)
        if item and item:getType() ~= "WeldingMask" and item:getType() ~= "BlowTorch" then
            weight = weight + item:getWeight()
        end
    end

    local scrapQuantity = math.floor(weight*10*0.5)

        player:getInventory():AddItems("Base.ScrapMetal", scrapQuantity*0.6)
        player:getXp():AddXP(Perks.MetalWelding, scrapQuantity*4)
		player:getXp():AddXP(Perks.Mechanics, scrapQuantity*2)
		player:getXp():AddXP(Perks.Strength, scrapQuantity*4)
end


--glass creation chance
function Recipe.OnCreate.TryMakeGlass(items, result, player)
    local skillChance = player:getPerkLevel(Perks.MetalWelding)
    local finalChance = 1 + skillChance

    if ZombRand(0,9) < finalChance then
		player:getInventory():AddItems("GlassPane",1)
		player:getXp():AddXP(Perks.Strength,4)
		else
		player:getInventory():AddItems("GlassShard",4)
		player:getXp():AddXP(Perks.Strength,4)
    end
end
