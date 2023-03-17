ISEasyOutfits = {};

ISEasyOutfits.ACTIONTIME = 10;

ISEasyOutfits.GetParent = function(container)
	local object = nil;
	local parent = container:getParent();
	if parent then
		object = parent;
	-- else
		-- local bag = container:getContainingItem();
		-- object = bag;
	end
	return object;
end

ISEasyOutfits.GetModData = function(player, container)
	local object = nil;
	local modData = nil;
	local parent = container:getParent();
	if parent then
		object = parent;
		modData = parent:getModData();
	else
		local playerData = player:getModData();
		--object = bag;
		playerData[container:getContainingItem():getID()] = playerData[container:getContainingItem():getID()] or {};
		modData = playerData[container:getContainingItem():getID()];
	end
	if modData.easyOutfits == nil then
		modData.easyOutfits = {};
		modData.easyOutfits.enable = false;
		modData.easyOutfits.outfits = {};
	end
	return object, modData.easyOutfits;
end

ISEasyOutfits.ApplyTag = function(player, item)
	local container = item:getContainer();
	local object, modData = ISEasyOutfits.GetModData(getSpecificPlayer(player), container);
	modData.enable = true;
	modData.outfits[item:getName()] = {outfitRegistered = false, outfitItems = {} };
	if isClient() and object then
		object:transmitModData();
        container:removeItemOnServer(item);
    end
	container:DoRemoveItem(item);
end

ISEasyOutfits.RenameTag = function(player, item)
	local modal = ISTextBox:new(0, 0, 280, 180, getText("ContextMenu_EasyOutfitsRenameTag"), item:getName(), nil, ISInventoryPaneContextMenu.onRenameBagClick, player, getSpecificPlayer(player), item);
	modal:initialise();
	modal:addToUIManager();
	if JoypadState.players[player+1] then
		setJoypadFocus(player, modal)
	end
end

ISEasyOutfits.TagContextMenu = function(player, context, items)
	items = ISInventoryPane.getActualItems(items)
	local playerObj = getSpecificPlayer(player)
	for _, item in ipairs(items) do
		if item:getFullType() == "EasyOutfits.OutfitTag" then
			local applyOption = context:addOption(getText("ContextMenu_EasyOutfitsApplyTag"), player, ISEasyOutfits.ApplyTag, item);
			if playerObj:getInventory() == item:getContainer() then
				local toolTip = ISWorldObjectContextMenu.addToolTip();
				toolTip.description = getText("ContextMenu_EasyOutfitsApplyPlayer");
				applyOption.toolTip = toolTip;
				applyOption.notAvailable = true;
			elseif item:getContainer():getType() == "floor" then
				local toolTip = ISWorldObjectContextMenu.addToolTip();
				toolTip.description = getText("ContextMenu_EasyOutfitsApplyFloor");
				applyOption.toolTip = toolTip;
				applyOption.notAvailable = true;
			elseif instanceof(item:getContainer():getParent(), "BaseVehicle") then
				local toolTip = ISWorldObjectContextMenu.addToolTip();
				toolTip.description = getText("ContextMenu_EasyOutfitsApplyVehicles");
				applyOption.toolTip = toolTip;
				applyOption.notAvailable = true;
			end
			
			local renameOption = context:addOption(getText("ContextMenu_EasyOutfitsRenameTag"), player, ISEasyOutfits.RenameTag, item);
			break;
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(ISEasyOutfits.TagContextMenu);

ISEasyOutfits.StoreOutfit = function(player, container, outfit)
	if container then
		if outfit.outfitRegistered then
			for _, itemId in ipairs(outfit.outfitItems) do
				local itemToBeStored = player:getInventory():getItemWithIDRecursiv(itemId);
				if itemToBeStored then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, itemToBeStored, itemToBeStored:getContainer(), container, ISEasyOutfits.ACTIONTIME));
				end
			end
		else
			for i=0, player:getWornItems():size()-1 do
				local itemToBeStored = player:getWornItems():getItemByIndex(i)
				if (itemToBeStored:getCategory() == "Clothing") then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, itemToBeStored, itemToBeStored:getContainer(), container, ISEasyOutfits.ACTIONTIME));
				end
			end
		end
	end
end

ISEasyOutfits.RetreiveOutfit = function(player, container, outfit, wear)	
	if container then
		if outfit.outfitRegistered then
			for _, itemId in ipairs(outfit.outfitItems) do
				local itemToBeWorn = container:getItemWithIDRecursiv(itemId);
				if itemToBeWorn then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, itemToBeWorn, itemToBeWorn:getContainer(), player:getInventory(), ISEasyOutfits.ACTIONTIME));
					if wear then ISTimedActionQueue.add(ISWearClothing:new(player, itemToBeWorn, ISEasyOutfits.ACTIONTIME)); end
				end
			end
		else
			local items = container:getItems();
			for i=items:size()-1, 0, -1 do
				local itemToBeWorn = items:get(i);
				if (itemToBeWorn:getCategory() == "Clothing") then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, itemToBeWorn, itemToBeWorn:getContainer(), player:getInventory(), ISEasyOutfits.ACTIONTIME))
					if wear then ISTimedActionQueue.add(ISWearClothing:new(player, itemToBeWorn, ISEasyOutfits.ACTIONTIME)); end
				end
			end
		end
	end
end

ISEasyOutfits.RegisterOutfit = function(player, container, outfit)	
	if container then
		outfit.outfitItems = { };
		local items = container:getItems();
		for i=items:size()-1, 0, -1 do
			local itemToRegister = items:get(i);
			if (itemToRegister:getCategory() == "Clothing") then
				table.insert(outfit.outfitItems, itemToRegister:getID());
				outfit.outfitRegistered = true;
			end
		end
		local parent = ISEasyOutfits.GetParent(container);
		if isClient() and parent then		
			parent:transmitModData();
		end
	end
end

ISEasyOutfits.RemoveOutfit = function(player, container, modData, name)
	modData.outfits[name] = nil;
	modData.enable = false;
	for _ in pairs(modData.outfits) do
		modData.enable = true;
		break;
	end
	local outfitTag = InventoryItemFactory.CreateItem("EasyOutfits.OutfitTag");
	outfitTag:setName(name);
	local parent = ISEasyOutfits.GetParent(container);
	if isClient() and parent then		
		parent:transmitModData();
		container:addItemOnServer(outfitTag);
	end
	container:AddItem(outfitTag);
end

ISEasyOutfits.WorldOutfitsContextMenu = function(player, context, worldobjects, test)
	local dupCheck = {}
	local playerObj = getSpecificPlayer(player);
	
	for _,obj in ipairs(worldobjects) do 
		if obj and obj:getContainer() and dupCheck[obj] == nil then
			dupCheck[obj] = 1;
		end
	end
	
	local sq = clickedSquare;
	if sq then 
		if sq:getObjects() then
			local objects = sq:getObjects();
			for i=0, objects:size() - 1 do
				local obj = objects:get(i);
				if obj and obj:getContainer() and dupCheck[obj] == nil then
					dupCheck[obj] = 1;
				end
			end
		end
	end	
	
	for obj,_ in pairs(dupCheck) do
		local modData = obj:getModData().easyOutfits;
		if modData and modData.enable then
			for name,outfit in pairs(modData.outfits) do
				local optionContainer = context:getNew(context);			
				local containerName = name;
				context:addSubMenu(context:addOption(containerName), optionContainer);
				
				local container = obj:getContainer();
				local optionStore = optionContainer:addOption(getText("ContextMenu_EasyOutfitsStoreOutfit"), playerObj, ISEasyOutfits.StoreOutfit, container, outfit);
				local optionWear = optionContainer:addOption(getText("ContextMenu_EasyOutfitsWearOutfit"), playerObj, ISEasyOutfits.RetreiveOutfit, container, outfit, true);
				local optionRetreive = optionContainer:addOption(getText("ContextMenu_EasyOutfitsRetreiveOutfit"), playerObj, ISEasyOutfits.RetreiveOutfit, container, outfit, false);
				local optionRegister = optionContainer:addOption(getText("ContextMenu_EasyOutfitsRegisterOutfit"), playerObj, ISEasyOutfits.RegisterOutfit, container, outfit);
				local optionRemove = optionContainer:addOption(getText("ContextMenu_EasyOutfitsRemoveOutfit"), playerObj, ISEasyOutfits.RemoveOutfit, container, modData, name);
			end
			break;
		end
	end
end
Events.OnFillWorldObjectContextMenu.Add(ISEasyOutfits.WorldOutfitsContextMenu);

ISEasyOutfits.InventoryOutfitsContextMenu = function(player, context, items)
	items = ISInventoryPane.getActualItems(items)
	local playerObj = getSpecificPlayer(player)
	for _, item in ipairs(items) do
		local itemId = item:getID();
		local itemData = playerObj:getModData()[itemId];
		if itemData then
			local modData = itemData.easyOutfits;
			if modData and modData.enable then
				for name,outfit in pairs(modData.outfits) do
					local optionContainer = context:getNew(context);			
					local containerName = name;
					context:addSubMenu(context:addOption(containerName), optionContainer);
					
					local container = item:getInventory();
					local optionStore = optionContainer:addOption(getText("ContextMenu_EasyOutfitsStoreOutfit"), playerObj, ISEasyOutfits.StoreOutfit, container, outfit);
					local optionWear = optionContainer:addOption(getText("ContextMenu_EasyOutfitsWearOutfit"), playerObj, ISEasyOutfits.RetreiveOutfit, container, outfit, true);
					local optionRetreive = optionContainer:addOption(getText("ContextMenu_EasyOutfitsRetreiveOutfit"), playerObj, ISEasyOutfits.RetreiveOutfit, container, outfit, false);
					local optionRegisterOutfit = optionContainer:addOption(getText("ContextMenu_EasyOutfitsRegisterOutfit"), playerObj, ISEasyOutfits.RegisterOutfit, container, outfit);
					local optionUnmark = optionContainer:addOption(getText("ContextMenu_EasyOutfitsRemoveOutfit"), playerObj, ISEasyOutfits.RemoveOutfit, container, modData, name);
				end
				break;
			end
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(ISEasyOutfits.InventoryOutfitsContextMenu);