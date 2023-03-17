
local function TransferVisual(item, newItem)
	local visual = item:getVisual()
	local newVisual = newItem:getVisual()
	newVisual:setTint(visual:getTint(item:getClothingItem()))
	newVisual:setBaseTexture(visual:getBaseTexture())
	newVisual:setTextureChoice(visual:getTextureChoice())
	newVisual:setDecal(visual:getDecal(item:getClothingItem()))
	if newItem:IsInventoryContainer() and item:IsInventoryContainer() then
		newItem:getItemContainer():setItems(item:getItemContainer():getItems())
		-- Handle renamed bag
		if item:getName() ~= item:getScriptItem():getDisplayName() then
			newItem:setName(item:getName())
		end
	end
--    newItem:setDirtyness(item:getDirtyness())
--    newItem:setTexture(item:getTexture())
	newItem:setColor(item:getColor())
	newVisual:copyDirt(visual)
	newVisual:copyBlood(visual)
	newVisual:copyHoles(visual)
	newVisual:copyPatches(visual)
	if newItem:IsClothing() then
		item:copyPatchesTo(newItem)
		newItem:setWetness(item:getWetness())
	end
	if instanceof(newItem, "AlarmClockClothing") and instanceof(item, "AlarmClockClothing") then
		newItem:setAlarmSet(item:isAlarmSet())
		newItem:setHour(item:getHour())
		newItem:setMinute(item:getMinute())
		newItem:syncAlarmClock()
		-- Network stuff
		-- FIXME: is this done when dropping the watch?
		item:setAlarmSet(false)
		item:syncAlarmClock()
	end
	newItem:setCondition(item:getCondition())
	newItem:setFavorite(item:isFavorite())
	if item:hasModData() then
		newItem:copyModData(item:getModData())
	end
	newItem:synchWithVisual()
end


function Recipe.OnCreate.UpdateClothingVisual(items, result, player)
  for i=0, items:size()-1 do
	-- find the clothing item in the list of item inputs
	if items:get(i):IsClothing() then
		TransferVisual(items:get(i), result);
	end
  end
end
