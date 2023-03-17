function Recipe.OnCreate.CreateSpear(items, result, player, selectedItem)
	local spearConditionMax = result:getConditionMax()	
    for i=0,items:size() - 1 do
		if instanceof (items:get(i), "HandWeapon") and (items:get(i):getCategories():contains("SmallBlade") or items:get(i):getCategories():contains("LongBlade") or items:get(i):getCategories():contains("Axe")) then
			if ZombRand(3) == 0 then
				items:get(i):setCondition(items:get(i):getCondition() - 1);
			end
		end
		if items:get(i):getType() == "SharpedStone" then
			if ZombRand(3) == 0 then
				player:getInventory():Remove(items:get(i))
			end
			spearConditionMax = spearConditionMax - ZombRand(3) 
		end
    end		
	result:setCondition(spearConditionMax)
end

function Recipe.OnCreate.UpgradeSpear(items, result, player, selectedItem)
    local conditionMax = 0;
	local spearCondition = 0;
	local spearConditionMax = 0;
	local spearConditionPenalty = 0;
	local attachmentCondition = 0;
	local timesrepaired = 0;	
	for i=0,items:size() - 1 do
		if items:get(i):getType() == "SpearCrafted" then
			spearCondition = items:get(i):getCondition()
			spearConditionMax = items:get(i):getConditionMax()			
		end
	end
	spearConditionPenalty = spearConditionMax - spearCondition
	for i=0,items:size() - 1 do
		if instanceof (items:get(i), "HandWeapon") and items:get(i):getType() ~= "SpearCrafted" then
			attachmentCondition = items:get(i):getCondition()
			timesrepaired = items:get(i):getHaveBeenRepaired();				
		end
		if items:get(i):getType() == "SharpedStone" and items:get(i):getType() ~= "SpearCrafted" then
			attachmentCondition = 8;
		end		
	end
	conditionMax = attachmentCondition - spearConditionPenalty
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 1 then
        conditionMax = 1;
    end

	result:setHaveBeenRepaired(timesrepaired)	
    result:setCondition(conditionMax);
end

function Recipe.OnCreate.DismantleSpear(items, result, player, selectedItem)
	local conditionCurrent = selectedItem:getCondition();
	local timesRepaired = selectedItem:getHaveBeenRepaired();

	result:setHaveBeenRepaired(timesRepaired)
    result:setCondition(conditionCurrent);
	
    local spear = player:getInventory():AddItem("Base.SpearCrafted");
	local spearConditionMax = spear:getConditionMax();
	local spearConditionDamaged = spearConditionMax - 2;

	if conditionCurrent > spearConditionDamaged then
		spearConditionResult = conditionCurrent;
		elseif conditionCurrent <= spearConditionDamaged and conditionCurrent ~= 0 then
			spearConditionResult = spearConditionDamaged;
			elseif conditionCurrent == 0 then
				if ZombRand(4) == 0 then
				spearConditionResult = 0;
					else spearConditionResult = spearConditionDamaged;
				end
		end
		
	if spearConditionResult >= spearConditionMax then
	spearConditionResult = spearConditionMax;
	end
		
	spear:setCondition(spearConditionResult);
	
end
