

function Recipe.OnCreate.UpgradeSpear(items, result, player, selectedItem)
    local conditionMax = 0;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item and item:getModData().modifier then
            if item:getType() == "SpearCrafted" then
                conditionMax = items:get(i):getCondition()
                if item:getModData().modifier then
                    result:getModData().spearModifier = item:getModData().modifier
                end
            elseif instanceof(items:get(i), "HandWeapon") then
                conditionMax = conditionMax - ((items:get(i):getConditionMax() - items:get(i):getCondition())/2)
                if item:getModData().modifier then
                    result:getModData().bladeModifier = item:getModData().modifier
                end
            end
        end
    end

    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 2 then
        conditionMax = 2;
    end

    result:setCondition(conditionMax);

    if result:getModData().bladeModifier then
        result:getModData().modifier = result:getModData().bladeModifier
        result:getModData().modifierChecked = true
    elseif result:getModData().spearModifier then
        result:getModData().modifier = result:getModData().spearModifier
        result:getModData().modifierChecked = true
    end

end

function Recipe.OnCreate.DismantleSpear(items, result, player, selectedItem)
    local conditionMax = selectedItem:getCondition();
    if conditionMax > selectedItem:getConditionMax() then
        conditionMax = selectedItem:getConditionMax();
    end
    if conditionMax < 2 then
        conditionMax = 2;
    end
    local spear = player:getInventory():AddItem("Base.SpearCrafted");
    spear:setCondition(conditionMax);
    if selectedItem:getModData().spearModifier then
        spear:getModData().modifier = selectedItem:getModData().spearModifier
    else
        spear:getModData().modifier = selectedItem:getModData().modifier
    end
    spear:getModData().modifierChecked = true
    if selectedItem:getModData().bladeModifier then
        result:getModData().modifier = selectedItem:getModData().bladeModifier
    else
        result:getModData().modifier = selectedItem:getModData().modifier
    end
    result:getModData().modifierChecked = true
end

function Recipe.OnCreate.OpenUmbrella(items, result, player, umbrella, firstHand, secondHand)
    result:setCondition(umbrella:getCondition());
    if umbrella:getModData().modifier then 
        result:getModData().modifier = umbrella:getModData().modifier
        result:getModData().modifierChecked = true
    end
    if secondHand then
        player:setSecondaryHandItem(result);
    elseif firstHand and not secondHand then
        player:setPrimaryHandItem(result);
    end
end

function Recipe.OnCreate.CloseUmbrella(items, result, player, umbrella, firstHand, secondHand)
    result:setCondition(umbrella:getCondition());
    if umbrella:getModData().modifier then 
        result:getModData().modifier = umbrella:getModData().modifier
        result:getModData().modifierChecked = true
    end
    if secondHand or firstHand then
        if not player:getPrimaryHandItem() then
            player:setPrimaryHandItem(result);
        end
        player:setSecondaryHandItem(result);
    end
end


-- function Recipe.OnCreate.AddBaseIngredientToCookingVessel(items, result, player)
--     for i=0,items:size() - 1 do
--         local item = items:get(i)
--         if item:getType() == "WaterSaucepan" or item:getType() == "WaterPot" then
--             result:setCondition(item:getCondition());
--         end
--         if instanceof(item, "HandWeapon") then
--             local modData = item:getModData()
--             if modData.modifier then
--                 result:getModData().modifier = modData.modifier
--                 result:getModData().modifierChecked = true
--             end
--         end
--     end
-- end