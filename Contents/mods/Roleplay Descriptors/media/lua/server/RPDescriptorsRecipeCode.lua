--[[
 This function copies the text info from the sheet of paper, then applies that
	to the resulting pinned note. Also copies condition data from the
		knife/screwdriver used, saving that data onto the pinned note.
]]--
function Recipe.OnCreate.StabNote(items, result, player, selectedItem)
	for i=0,items:size() - 1 do
	local item = items:get(i)
        if instanceof (item, "HandWeapon") then
            local conditionMax = item:getConditionMax();
			local condition = item:getCondition();
			result:setConditionMax(conditionMax);
			result:setCondition(condition);
		end
		if instanceof (item, "Literature") then
			local title = item:getName();
			local writing = item:getCustomPages();
			local locked = item:getLockedBy();
				if title ~= "Sheet of Paper" then
					result:setName(title);
				end
			result:setCustomPages(writing);
			result:setLockedBy(locked);
		end
    end
end

--[[
 This function serves 2 purposes. 
 1: Copies text info from the Pinned Note, then applies that to the paper recieved.
 2: Copies condition information from the pinned note, and applies that to the
		weapon reclaimed.
]]--
function Recipe.OnCreate.ReclaimPin(items, result, player, selectedItem)

	local title = selectedItem:getName();
	local writing = selectedItem:getCustomPages();
	local locked = selectedItem:getLockedBy();
	
	local conditionMax = selectedItem:getConditionMax();
	local condition = selectedItem:getCondition();

	if conditionMax and condition then
		result:setConditionMax(conditionMax);
		result:setCondition(condition);
	else
		result:setConditionMax(10);
		result:setCondition((10 - ZombRand(4)));
	end
	
	if (title ~= "Pinned Sheet of Paper (Hunting Knife)") and (title ~= "Pinned Sheet of Paper (Kitchen Knife)")
	and (title ~= "Pinned Sheet of Paper (Screwdriver)") and (title ~= "Pinned Sheet of Paper") then
		local paper = player:getInventory():AddItem("Base.SheetPaper2")
			paper:setCustomPages(writing)
			paper:setLockedBy(locked)
			paper:setName(title)
	else
		local paper = player:getInventory():AddItem("Base.SheetPaper2")
			paper:setCustomPages(writing)
			paper:setLockedBy(locked)
	end
end

--[[
 This function copies the information from literature, and applies that to the 
 result of the recipe.
]]--
function Recipe.OnCreate.KeepText (items, result, player, selectedItem)
	for i=0,items:size() - 1 do
	local item = items:get(i)
		if instanceof (item, "Literature") then
			if (item:getName() ~= "Sheet of Paper") and (item:getName() ~= "Pinned Sheet of Paper") then
				result:setName(item:getName());
			end
		result:setCustomPages(item:getCustomPages());
		result:setLockedBy(item:getLockedBy());
		end
	end
end