-- Switches the PrepperKnife state between swing and stab while keeping the conditions and in the primiary hand
function Recipe.OnCreate.PrepperKnifeStab(items, result, player, PrepperKnifeKnock, firstHand, secondHand)
    result:setCondition(PrepperKnifeKnock:getCondition());
    if secondHand then
        player:setSecondaryHandItem(result);
    elseif firstHand and not secondHand then
        player:setPrimaryHandItem(result);
    end
end

function Recipe.OnCreate.PrepperKnifeSwing(items, result, player, PrepperKnifeStab, firstHand, secondHand)
    result:setCondition(PrepperKnifeStab:getCondition());
	
    if secondHand or firstHand then
        if not player:getPrimaryHandItem() then
            player:setPrimaryHandItem(result);
        end
        player:setPrimaryHandItem(result);
    end
end

function Recipe.OnCreate.PrepperKnifeKnock(items, result, player, PrepperKnifeSwing, firstHand, secondHand)
    result:setCondition(PrepperKnifeSwing:getCondition());
	
    if secondHand or firstHand then
        if not player:getPrimaryHandItem() then
            player:setPrimaryHandItem(result);
        end
        player:setPrimaryHandItem(result);
    end
end