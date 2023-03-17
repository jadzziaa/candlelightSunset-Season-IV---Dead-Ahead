-- Cosmic was here
-- So was Greb
-- Did you hear about the magic tractor?
function Recipe.OnCreate.MakeTwoHeaded(items, result, player)
	if result:getType() == "DefilerSledgehammer" or result:getType() == "DespoilerSledgehammer" 
		or result:getType() == "DefilerAxe" or result:getType() == "DespoilerAxe" then
		
		local modData = result:getModData();
		local weaponCond = result:getCondition();
		
		-- If the ModData hasn't been initialized on this weapon
		if not modData.HammerTimeCond then
			modData.HammerTimeCond = { weaponCond, weaponCond };
		end
		
	end
end

function Recipe.OnCreate.SwitchToHead1(items, result, player, firstHand, secondHand)
	local weapon = nil;
	local oldForm = 0;
	local oldCondition = 0;
	local newCondition = 0;
	for i=0, items:size()-1 do
		if items:get(i):getType() == "DefilerAxe" or items:get(i):getType() == "DespoilerAxe" then
			weapon = items:get(i);
			oldForm = 2;
			oldCondition = weapon:getCondition();
			break;
		end
    end
	if weapon then
		local modData = weapon:getModData();
		
		-- If the ModData hasn't been initialized on this weapon
		if not modData.HammerTimeCond then
			modData.HammerTimeCond = { oldCondition, oldCondition };
		end
		
		-- Store off the condition of the previous side
		modData.HammerTimeCond[oldForm] = oldCondition;
		
		-- Get the existing condition for this side of the weapon
		newCondition = modData.HammerTimeCond[1];
		
		-- Copy the ModData from the old to the new and set the new's condition
		result:getModData().HammerTimeCond = modData.HammerTimeCond;
		result:setCondition(newCondition);
	end
	
	if firstHand and secondHand then
        player:setPrimaryHandItem(nil);
        player:setSecondaryHandItem(nil);
		player:setPrimaryHandItem(result);
		player:setSecondaryHandItem(result);
    elseif not result:isRequiresEquippedBothHands() then
		if firstHand and not secondHand then
			player:setPrimaryHandItem(nil);
			player:setPrimaryHandItem(result);
		elseif secondHand then
			player:setSecondaryHandItem(nil);
			player:setSecondaryHandItem(result);
		end
	end
end

function Recipe.OnCreate.SwitchToHead2(items, result, player, firstHand, secondHand)
	local weapon = nil;
	local oldForm = 0;
	local oldCondition = 0;
	local newCondition = 0;
	for i=0, items:size()-1 do
		if items:get(i):getType() == "DefilerSledgehammer" or items:get(i):getType() == "DespoilerSledgehammer" then
			weapon = items:get(i);
			oldForm = 1;
			oldCondition = weapon:getCondition();
			break;
		end
    end
	if weapon then
		local modData = weapon:getModData();
		
		-- If the ModData hasn't been initialized on this weapon
		if not modData.HammerTimeCond then
			modData.HammerTimeCond = { oldCondition, oldCondition };
		end
		
		-- Store off the condition of the previous side
		modData.HammerTimeCond[oldForm] = oldCondition;
		
		-- Get the existing condition for this side of the weapon
		newCondition = modData.HammerTimeCond[2];
		
		-- Copy the ModData from the old to the new and set the new's condition
		result:getModData().HammerTimeCond = modData.HammerTimeCond;
		result:setCondition(newCondition);
	end
	
	if firstHand and secondHand then
        player:setPrimaryHandItem(nil);
        player:setSecondaryHandItem(nil);
		player:setPrimaryHandItem(result);
		player:setSecondaryHandItem(result);
    elseif not result:isRequiresEquippedBothHands() then
		if firstHand and not secondHand then
			player:setPrimaryHandItem(nil);
			player:setPrimaryHandItem(result);
		elseif secondHand then
			player:setSecondaryHandItem(nil);
			player:setSecondaryHandItem(result);
		end
	end
end

function Recipe.OnCreate.TransferCondition(items, result, player, oldItem, firstHand, secondHand)
    result:setCondition(oldItem:getCondition());
    
    if secondHand or firstHand then
        if not player:getPrimaryHandItem() then
            player:setPrimaryHandItem(result);
        end
        player:setPrimaryHandItem(result);
    end
end
-- Cosmic is the greatest
-- I am forever grateful for your help, codemeister!
-- It drove down the road and then turned into a field!