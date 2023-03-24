
function onUnfoldSpasStock_OnCreate(items, result, player, firstHand, secondHand)
	local inv = player:getInventory();
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getSubCategory() == "Firearm" then
			if result:haveChamber() then
				result:setRoundChambered(true)
				result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			end
			local modData = result:getModData()
			for k,v in pairs(item:getModData()) do
				modData[k] = v
			end
			local clip = item:isContainsClip()
			local scope = item:getScope()
			local sling = item:getSling()
			local canon = item:getCanon()
			local stock = item:getStock()
			local pad = item:getRecoilpad()
			if clip then
			result:setContainsClip(true)
			result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			end
			if scope then
			result:attachWeaponPart(scope)
			end
			if sling then
			result:attachWeaponPart(sling)
			end
			if canon then
			result:attachWeaponPart(canon)
			end
			if stock then
				newstock = InventoryItemFactory.CreateItem('Base.' .. result:getType() .. '_Stock_Extended');
				if newstock then
					result:attachWeaponPart(newstock)
				end
			end
			if pad then
			result:attachWeaponPart(pad)
			end
			if secondHand or firstHand then
	        player:setSecondaryHandItem(result);
	        if not player:getPrimaryHandItem() then
	            player:setPrimaryHandItem(result);
	        end
	    end
			return
		end
    end
end

function onFoldSpasStock_OnCreate(items, result, player, firstHand, secondHand)
	local inv = player:getInventory();
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getSubCategory() == "Firearm" then
			if result:haveChamber() then
				result:setRoundChambered(true)
				result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			end
			local modData = result:getModData()
			for k,v in pairs(item:getModData()) do
				modData[k] = v
			end
			local clip = item:isContainsClip()
			local scope = item:getScope()
			local sling = item:getSling()
			local canon = item:getCanon()
			local stock = item:getStock()
			local pad = item:getRecoilpad()
			if clip then
			result:setContainsClip(true)
			result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			end
			if scope then
			result:attachWeaponPart(scope)
			end
			if sling then
			result:attachWeaponPart(sling)
			end
			if canon then
			result:attachWeaponPart(canon)
			end
			if stock then
				newstock = InventoryItemFactory.CreateItem('Base.' .. result:getType() .. '_Stock_Detracted');
				if newstock then
					result:attachWeaponPart(newstock)
				end
			end
			if pad then
			result:attachWeaponPart(pad)
			end
			if secondHand or firstHand then
	        player:setSecondaryHandItem(result);
	        if not player:getPrimaryHandItem() then
	            player:setPrimaryHandItem(result);
	        end
	    end
			return
		end
    end
end
