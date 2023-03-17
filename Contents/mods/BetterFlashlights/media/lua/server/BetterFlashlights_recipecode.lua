
-- When creating item in result box of crafting panel.
function Recipe.OnCreate.BF_TorchBatteryRemoval(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		-- we found the battery, we change his used delta according to the battery
		if item:getType() == "BF_HeadLight" or item:getType() == "HandTorch_Army1" or item:getType() == "HandTorch_Army2" or item:getType() == "HandTorch_ManLite" or item:getType() == "HandTorch_CK_LED" or item:getType() == "Torch1" or item:getType() == "Torch2" or item:getType() == "Torch3" or item:getType() == "Torch4" or item:getType() == "Torch5" or item:getType() == "Torch6" or item:getType() == "Torch7" or item:getType() == "TorchArmy1" or item:getType() == "TorchArmy2" or item:getType() == "BF_EgenerexLite" or item:getType() == "BF_SpiffoLite" or item:getType() == "BF_OldFlashlight" then
			result:setUsedDelta(item:getUsedDelta());
			-- then we empty the torch used delta (his energy)
			item:setUsedDelta(0);
		end
	end
end

-- Return true if recipe is valid, false otherwise
function Recipe.OnTest.BF_TorchBatteryInsert(sourceItem, result)
	if sourceItem:getType() == "BF_HeadLight" or sourceItem:getType() == "HandTorch_Army1" or sourceItem:getType() == "HandTorch_Army2" or sourceItem:getType() == "HandTorch_ManLite" or sourceItem:getType() == "HandTorch_CK_LED" or sourceItem:getType() == "Torch1" or sourceItem:getType() == "Torch2" or sourceItem:getType() == "Torch3" or sourceItem:getType() == "Torch4" or sourceItem:getType() == "Torch5" or sourceItem:getType() == "Torch6" or sourceItem:getType() == "Torch7" or sourceItem:getType() == "TorchArmy1" or sourceItem:getType() == "TorchArmy2"  or sourceItem:getType() == "BF_EgenerexLite" or sourceItem:getType() == "BF_SpiffoLite" or sourceItem:getType() == "BF_OldFlashlight"then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end

-- When creating item in result box of crafting panel.
function Recipe.OnCreate.BF_TorchBatteryInsert(items, result, player)
  for i=0, items:size()-1 do
	-- we found the battery, we change his used delta according to the battery
	if items:get(i):getType() == "Battery" then
		result:setUsedDelta(items:get(i):getUsedDelta());
	end
  end
end

function Recipe.OnCreate.BF_DismantleFlashlight(items, result, player)
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getType() == "BF_HeadLight" or item:getType() == "HandTorch_Army1" or item:getType() == "HandTorch_Army2" or item:getType() == "HandTorch_ManLite" or item:getType() == "HandTorch_CK_LED" or item:getType() == "Torch1" or item:getType() == "Torch2" or item:getType() == "Torch3" or item:getType() == "Torch4" or item:getType() == "Torch5" or item:getType() == "Torch6" or item:getType() == "Torch7" or item:getType() == "TorchArmy1" or item:getType() == "TorchArmy2" or item:getType() == "BF_EgenerexLite" or item:getType() == "BF_SpiffoLite" or item:getType() == "BF_OldFlashlight" then
			if item:getUsedDelta() > 0 then
				local battery = player:getInventory():AddItem("Base.Battery")
				if battery then
					battery:setUsedDelta(item:getUsedDelta())
				end
			end
			break
		end
	end
end

