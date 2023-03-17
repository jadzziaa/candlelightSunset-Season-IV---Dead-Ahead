-- Huge thanks to the modder AuthenticPeach! This piece of code has been took from his mod "AuthenticZ"
-- When creating item in result box of crafting panel.
function UndeadSurvivorTorchBatteryRemoval_OnCreate(items, result, player)
  for i=0, items:size()-1 do
	-- we found the battery, we change his used delta according to the battery
	if items:get(i):getType() == "PrepperFlashlight" then
		result:setUsedDelta(items:get(i):getUsedDelta());
		-- then we empty the torch used delta (his energy)
		items:get(i):setUsedDelta(0);
	end
  end
end

-- Return true if recipe is valid, false otherwise
function UndeadSurvivorTorchBatteryInsert_TestIsValid (sourceItem, result)
	if sourceItem:getType() == "PrepperFlashlight" then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end

