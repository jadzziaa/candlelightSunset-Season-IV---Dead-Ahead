-- When creating item in result box of crafting panel.
function Recipe.OnCreate.HeaterBatteryRemoval(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		-- we found the battery, we change his used delta according to the battery
		if item:getType() == SmallHeaterObject.itemType then
			result:setUsedDelta(item:getUsedDelta());
			-- then we empty the torch used delta (his energy)
			item:setUsedDelta(0);
		end
	end
end

function Recipe.OnTest.HeaterBatteryInsert(sourceItem, result)
	if sourceItem:getType() == SmallHeaterObject.itemType then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end


function Recipe.OnCreate.OutdoorHeaterBatteryRemoval(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		-- we found the battery, we change his used delta according to the battery
		if item:getType() == OutdoorHeaterObject.itemType then
			result:setUsedDelta(item:getUsedDelta());
			-- then we empty the torch used delta (his energy)
			item:setUsedDelta(0);
		end
	end
end

function Recipe.OnTest.OutdoorHeaterBatteryInsert(sourceItem, result)
	if sourceItem:getType() == OutdoorHeaterObject.itemType then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end

