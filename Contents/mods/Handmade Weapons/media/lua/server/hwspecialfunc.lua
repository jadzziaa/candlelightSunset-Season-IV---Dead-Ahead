--[[local lastStone = {}

function Recipe.OnTest.CreateCombatRod(sourceItem, result)
	if luautils.haveToBeTransfered(getSpecificPlayer(0), testItem) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(getSpecificPlayer(0), sourceItem, sourceItem:getContainer(), getSpecificPlayer(0):getInventory(), nil))
		return true
	end
	return true
end

function Recipe.OnCreate.CreateCombatRod(items, result, player, selectedItem)
    local conditionMax = 3 + player:getPerkLevel(Perks.Woodwork);
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 3 then
        conditionMax = 3;
    end
    result:setCondition(conditionMax)
	
	if instanceof(lastStone[0], "InventoryItem") and not instanceof(selectedItem, "HandWeapon") then
		if ZombRand(3) == 0 then
			lastStone[0]:getContainer():RemoveOneOf("Base.SharpedStone")
			ISTimedActionQueue.clear(player)
			lastStone[0] = nil
		else
			if selectedItem:getType() == "SharpedStone" then
				lastStone[0] = selectedItem
			end
		end
	else
		if selectedItem:getType() == "SharpedStone" then
			if ZombRand(3) == 0 then
				selectedItem:getContainer():RemoveOneOf("Base.SharpedStone")
				ISTimedActionQueue.clear(player)
				lastStone[0] = nil
			else
				lastStone[0] = selectedItem
			end
		else
			for i=0,items:size() - 1 do
				if instanceof (items:get(i), "HandWeapon") and items:get(i):getCategories():contains("SmallBlade") then
					items:get(i):setCondition(items:get(i):getCondition() - 1);
				end
			end
		end
	end
end]]