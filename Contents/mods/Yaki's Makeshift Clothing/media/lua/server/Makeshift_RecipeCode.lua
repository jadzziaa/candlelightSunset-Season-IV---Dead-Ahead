-- Written this way so that you can re-use in different mods of yours
Yaki_Recipes = Yaki_Recipes or {}
Yaki_Recipes.OnCreate = Yaki_Recipes.OnCreate or {}

-- DyeClothingRed
function Yaki_Recipes.OnCreate.DyeClothingRed(items, result, player)
    result:getVisual():setTextureChoice(0);
    result:synchWithVisual();
end

-- DyeClothingGreen
function Yaki_Recipes.OnCreate.DyeClothingGreen(items, result, player)
    result:getVisual():setTextureChoice(1);
    result:synchWithVisual();
end

-- DyeClothingBlue
function Yaki_Recipes.OnCreate.DyeClothingBlue(items, result, player)
    result:getVisual():setTextureChoice(2);
    result:synchWithVisual();
end

-- DyeClothingBrown
function Yaki_Recipes.OnCreate.DyeClothingBrown(items, result, player)
    result:getVisual():setTextureChoice(3);
    result:synchWithVisual();
end

-- DyeClothingGrey
function Yaki_Recipes.OnCreate.DyeClothingGrey(items, result, player)
    result:getVisual():setTextureChoice(4);
    result:synchWithVisual();
end

-- DyeClothingWhite
function Yaki_Recipes.OnCreate.DyeClothingWhite(items, result, player)
    result:getVisual():setTextureChoice(5);
    result:synchWithVisual();
end

-- Give Empty Pot
function Yaki_Recipes.GiveEmptyPot(items, result, player, selectedItem)
  local inv = player:getInventory();
  inv:AddItem("Base.Pot");
end

-- Give Tailoring XP
function Recipe.OnGiveXP.Tailoring10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 10);
end

-- 
Give10TXP = Recipe.OnGiveXP.Tailoring10