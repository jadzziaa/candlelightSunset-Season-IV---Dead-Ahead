--require "client/hwsharpedstone"

function Recipe.OnCreate.SharpenStone(items, result, player)
    player:getInventory():AddItem("Base.Stone");
end

function Recipe.OnCreate.CreateHMBaseballBat(items, result, player, selectedItem)
    local conditionMax = player:getPerkLevel(Perks.Woodwork) - 1;
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 5 then
        conditionMax = 5;
    end
    result:setCondition(conditionMax)
	
	for i=0,items:size() - 1 do
        if instanceof (items:get(i), "HandWeapon") and items:get(i):getCategories():contains("SmallBlade") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
		end
	end
end

function Recipe.OnCreate.SpikedHMBat(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "HandmadeBaseballBat" then
            result:setCondition(item:getCondition())
            break
        end
    end
end

function Recipe.OnCreate.CreateWoodenClub(items, result, player, selectedItem)
    local conditionMax = 3 + player:getPerkLevel(Perks.Woodwork);
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 3 then
        conditionMax = 3;
    end
    result:setCondition(conditionMax)
	
	for i=0,items:size() - 1 do
        if instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
end

function Recipe.OnCreate.CreateWoodenMallet(items, result, player, selectedItem)
    local conditionMax = player:getPerkLevel(Perks.Woodwork) + 1;
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 5 then
        conditionMax = 5;
    end
	result:setConditionLowerChance(8)
	result:setCritDmgMultiplier(2)
    result:setCondition(conditionMax)
	result:setName(getText("UI_HWMallet"))
	for i=0,items:size() - 1 do
        if (instanceof (items:get(i), "HandWeapon") and items:get(i):getCategories():contains("SmallBlade")) or items:get(i):getType() == "Machete" then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
		end
	end
end

function Recipe.OnCreate.CreateWoodenSword(items, result, player, selectedItem)
    local conditionMax = player:getPerkLevel(Perks.Woodwork) - 1;
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 7 then
        conditionMax = 7;
	end
	result:setCondition(conditionMax)
	
	for i=0,items:size() - 1 do
        if instanceof (items:get(i), "HandWeapon") and items:get(i):getCategories():contains("SmallBlade") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
		end
	end
end

function Recipe.OnCreate.SpikedHMClub(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "HMWoodenClub" then
            result:setCondition(item:getCondition())
            break
        end
    end
end

--[[function Recipe.OnCreate.CreateSpear(items, result, player, selectedItem)
    local conditionMax = 2 + player:getPerkLevel(Perks.Woodwork);
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 2 then
        conditionMax = 2;
    end
    result:setCondition(conditionMax)
    
    if selectedItem:getType() == "SharpedStone" then
		if ZombRand(3) == 0 then
			selectedItem:getContainer():RemoveOneOf("Base.SharpedStone");
		end
	else
		for i=0,items:size() - 1 do
			if instanceof (items:get(i), "HandWeapon") and items:get(i):getCategories():contains("SmallBlade") and selectedItem:getType() ~= "SharpedStone" then
				items:get(i):setCondition(items:get(i):getCondition() - 1);
			end
		end
	end
end]]

function Recipe.OnCreate.CreateCombatRod(items, result, player, selectedItem)
    local conditionMax = 2 + player:getPerkLevel(Perks.Woodwork);
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 2 then
        conditionMax = 2;
    end
    result:setCondition(conditionMax)
	if selectedItem:getType() == "SharpedStone" then
		if ZombRand(3) == 0 then
			selectedItem:getContainer():RemoveOneOf("Base.SharpedStone");
		end
	else
		for i=0,items:size() - 1 do
			if instanceof (items:get(i), "HandWeapon") and (items:get(i):getCategories():contains("SmallBlade") or items:get(i):getCategories():contains("LongBlade")) then
				items:get(i):setCondition(items:get(i):getCondition() - 1);
			end
		end
	end
end

function Recipe.OnCreate.CreateImprovedStoneAxe(items, result, player, selectedItem)
	local conditionMax = 1 + player:getPerkLevel(Perks.Woodwork)
	conditionMax = ZombRand(conditionMax, conditionMax + 2)
	if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 3 then
        conditionMax = 2;
    end
	result:setCondition(conditionMax)
	
	if instanceof (selectedItem, "HandWeapon") and (selectedItem:getCategories():contains("SmallBlade") or selectedItem:getCategories():contains("LongBlade")) then
		selectedItem:setCondition(selectedItem:getCondition() - 1)
	else
		for i=0, items:size() - 1 do
			if instanceof (items:get(i), "HandWeapon") and (items:get(i):getCategories():contains("SmallBlade") or items:get(i):getCategories():contains("LongBlade")) then
				items:get(i):setCondition(items:get(i):getCondition() - 1);
			end
		end
	end
end

function Recipe.OnGiveXP.WoodWork10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 10);
end

function Recipe.OnGiveXP.WoodWork20(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Woodwork, 20);
end