function Recipe.OnGiveXP.Tailoring01(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Tailoring, 1);
end

function Recipe.OnGiveXP.Tailoring03(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Tailoring, 3);
end

function Recipe.OnGiveXP.Tailoring05(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Tailoring, 5);
end

function Recipe.OnGiveXP.Tailoring10(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Tailoring, 10);
end

function Recipe.OnGiveXP.Tailoring15(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Tailoring, 15);
end

--jarred food lasting 365 days, must be COOKED
	function CannedFood_OnCooked(cannedFood)
    local jarage = cannedFood:getAge() / cannedFood:getOffAgeMax()
    cannedFood:setOffAgeMax(365)
    cannedFood:setOffAge(300)
    cannedFood:setAge(cannedFood:getOffAgeMax() * jarage)
end

local item = ScriptManager.instance:getItem("Base.MeatCleaver")    
if item then 
	item:DoParam("Tags = CanOpener")
end

local item = ScriptManager.instance:getItem("Base.KitchenKnife")    
if item then 
	item:DoParam("Tags = CanOpener")
end

local item = ScriptManager.instance:getItem("Base.HuntingKnife")    
if item then 
	item:DoParam("Tags = CanOpener")
end

