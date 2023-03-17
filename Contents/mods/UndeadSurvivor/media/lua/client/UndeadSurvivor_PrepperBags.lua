-- Adds a second items as result in the "Remove Bags from Prepper Vest" recipe and keep items in it
-- Huge thanks to the modder AuthenticPeach! This piece of code has been took from his mod "AuthenticZ"
function RemoveBags(item, resultItem, player)

	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local dItem;
	player_Inventory:AddItem("UndeadSurvivor.PrepperVest")
	for i = 0, (item:size()-1) do 
		dItem = item:get(i); 
		
		if dItem:getCategory() == "Container" then 
			if player:getClothingItem_Back() == dItem then 
				player:setClothingItem_Back(nil);
			end
			if player:getPrimaryHandItem() == dItem then 
				player:setPrimaryHandItem(nil);
			end
			if player:getSecondaryHandItem() == dItem then 
				player:setSecondaryHandItem(nil); 
			end
			dInv = dItem:getInventory(); 
			newInv= resultItem:getInventory(); 
			dInvItems = dInv:getItems(); 
			if dInvItems:size() >= 1 then 
				for i2 = 0, (dInvItems:size()-1) do
					invItem = dInvItems:get(i2);
					table.insert(transferred_Items, invItem) 
				end
			end
		end
	end
	
	for i3, k3 in ipairs(transferred_Items) do
		dInv:Remove(k3); 
		newInv:AddItem(k3); 
	end
end

-- Keep items in the bag after "Make Prepper Vest with bags" recipe
-- Huge thanks to the modder AuthenticPeach! This piece of code has been took from his mod "AuthenticZ"
function AddBags(item, resultItem, player)

	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local dItem;
	
	for i = 0, (item:size()-1) do 
		dItem = item:get(i); 
		
		if dItem:getCategory() == "Container" then 
			if player:getClothingItem_Back() == dItem then 
				player:setClothingItem_Back(nil);
			end
			if player:getPrimaryHandItem() == dItem then 
				player:setPrimaryHandItem(nil);
			end
			if player:getSecondaryHandItem() == dItem then 
				player:setSecondaryHandItem(nil); 
			end
			dInv = dItem:getInventory(); 
			newInv= resultItem:getInventory(); 
			dInvItems = dInv:getItems(); 
			if dInvItems:size() >= 1 then 
				for i2 = 0, (dInvItems:size()-1) do
					invItem = dInvItems:get(i2);
					table.insert(transferred_Items, invItem) 
				end
			end
		end
	end
	
	for i3, k3 in ipairs(transferred_Items) do
		dInv:Remove(k3); 
		newInv:AddItem(k3); 
	end
end