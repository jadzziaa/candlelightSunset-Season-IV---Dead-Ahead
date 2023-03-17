----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- eris_nvg - night vision goggles
--
-- item artwork: Lith
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 1.5;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if eris_nvg then
	if eris_nvg.versionNumber >= versionNumber then
		return;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local eris_nvg = {
	versionNumber = versionNumber,
	batteryManagers = {},
	numActiveNVG = 0,
	activeNVG = {},
	playerScreenBounds = {},
	brightnessOverlay = getTexture("media/textures/overlayBrightness.png"),
};

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.doCheck = function(_plObj)
	for itemID, batteryManager in pairs(eris_nvg.batteryManagers) do
		batteryManager:update();
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.doMenu = function(_plID, _context, _items)
	local isWearing;
	local itemObj, itemID;
	local plObj = getPlayer(_plID);
	for i, items in ipairs(_items) do
		if not instanceof(items, "InventoryItem") then itemObj = items.items[1]; else itemObj = items; end;
		if itemObj then
			if eris_nvg.isInPlayerInventory(nil, plObj, itemObj) and itemObj:getFullType() == "eris_nvg.nvgoggles" then
				itemID = eris_nvg.getItemID(itemObj);
				if not eris_nvg.batteryManagers[itemID] then eris_nvg.initialiseNVG(itemID, plObj, itemObj); end;
				isWearing = eris_nvg.isWearing(nil, plObj, itemObj);
				if isWearing then eris_nvg.batteryManagers[itemID]:doActionMenu(_context); end;
				eris_nvg.batteryManagers[itemID]:doPowerLevelMenu(_context);
				eris_nvg.batteryManagers[itemID]:doBatteryMenu(_context);
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.isActive = function(_, _plObj, _itemObj)
	return _plObj:isWearingNightVisionGoggles() or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.isWearing = function(_, _plObj, _itemObj)
	return _itemObj:getBodyLocation() or false;
	--return _plObj:getClothingItem_Head() == _itemObj or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.isInPlayerInventory = function(_, _plObj, _itemObj)
	return _itemObj:getContainer() == _plObj:getInventory() or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.isValid = function(_, _plObj, _itemObj)
	if _plObj and _itemObj then
		return eris_nvg.isWearing(_, _plObj, _itemObj) or false;
	else
		return nil;
	end;
	return false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.onActivate = function(_, _plObj, _itemObj, _manager)
	_plObj:setWearingNightVisionGoggles(true);
	eris_nvg.activeNVG[_plObj:getDisplayName() .. _plObj:getPlayerNum()] = _manager;
	eris_nvg.numActiveNVG = eris_nvg.numActiveNVG + 1;
	eris_nvg.updateScreenBounds();
	Events.OnPreUIDraw.Add(eris_nvg.doBrightnessOverlay);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.onBatteryDead = function(_, _plObj, _itemObj, _manager)
	eris_nvg.onDeactivate(_, _plObj, _itemObj, _manager);
	-- eris_nvg.batteryManagers[_itemObj:getType() .. _itemObj:getID()] = nil;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.onDeactivate = function(_, _plObj, _itemObj, _manager)
	_plObj:setWearingNightVisionGoggles(false);
	eris_nvg.activeNVG[_plObj:getDisplayName() .. _plObj:getPlayerNum()] = nil;
	eris_nvg.numActiveNVG = eris_nvg.numActiveNVG - 1; if eris_nvg.numActiveNVG < 0 then eris_nvg.numActiveNVG = 0; end;
	eris_nvg.updateScreenBounds();
	Events.OnPreUIDraw.Remove(eris_nvg.doBrightnessOverlay);
end


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.initialiseNVG = function(_itemID, _plObj, _itemObj)
	local nvgObj = {
		plObj = _plObj,
		itemObj = _itemObj,
		runtime = 6,
		target = nil,
		adjustablePower = true,
		itemWeightNoBattery = 0.7,
		itemWeightWithBattery = 1.2,
		isValid = eris_nvg.isValid,
		isActive = eris_nvg.isActive,
		onActivate = eris_nvg.onActivate,
		onDeactivate = eris_nvg.onDeactivate,
		onBatteryDead = eris_nvg.onBatteryDead,
	};
	eris_nvg.batteryManagers[_itemID] = eris_uiBattery:new(nvgObj);
	eris_nvg.batteryManagers[_itemID]:initialise();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.getItemID = function(_itemObj)
	return _itemObj:getType() .. _itemObj:getID();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	-- eris_nvg.initInvInfo();
eris_nvg.initInvInfo = function()
	local nvBar;
	local forItems = {"eris_nvg.nvgoggles", "eris_nvg.nvgoggles41"};
	for i, item in ipairs(forItems) do
		nvBar = {
			id = item,
			label = getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ",
			itemTest = function(_itemObj, _id) return _itemObj:getFullType() == _id end,
			getValue = function(_itemObj) return _itemObj:getModData()["uiBattery_batteryLevel"] end,
			setValue = function(_itemObj, _value) _itemObj:getModData()["uiBattery_batteryLevel"] = _value end,
		};
		-- eris_invBar.registerItem(nvBar.id, nvBar.label, nvBar.itemTest, nvBar.getValue, nvBar.setValue, true, true);
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.init = function()
	eris_nvg.updateScreenBounds();
	Events.OnClothingUpdated.Add(eris_nvg.doCheck);
	Events.OnFillInventoryObjectContextMenu.Add(eris_nvg.doMenu);
	eris_inventoryBar.registerItem("eris_nvg.nvgoggles", "uiBattery_batteryLevel", getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ");
	eris_inventoryTooltip.registerItem("eris_nvg.nvgoggles", "uiBattery_batteryLevel", getTextOrNull("IGUI_invpanel_Remaining") or "Remaining: ");
	eris_nvg.initInvInfo();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Events.OnGameStart.Add(eris_nvg.init);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.doBrightnessOverlay = function()
	local nvgItem;
	local bounds, powerLevel;
	for plID, manager in pairs(eris_nvg.activeNVG) do
		if manager then
			bounds = eris_nvg.playerScreenBounds[plID];
			powerLevel = manager:getPowerLevel();
			if bounds and powerLevel then
				UIManager.DrawTexture(eris_nvg.brightnessOverlay, bounds.x, bounds.y, bounds.w, bounds.h, 1 - powerLevel);
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_nvg.updateScreenBounds = function()
	local plID;
	local player, playerNum;
	local x, y, w, h;
	local playerList = IsoPlayer.getPlayers();
	if playerList then
		for i = 0, playerList:size() - 1 do
			player = playerList:get(i);
			if player then
				playerNum = player:getPlayerNum();
				plID = player:getDisplayName() .. playerNum;
				eris_nvg.playerScreenBounds[plID] = {
					x = getPlayerScreenLeft(playerNum),
					y = getPlayerScreenTop(playerNum),
					w = getPlayerScreenWidth(playerNum),
					h = getPlayerScreenHeight(playerNum),
				};
				-- print("updating player " ..i)
				-- for k, v in pairs(eris_nvg.playerScreenBounds[plID]) do
					-- print(k, v)
				-- end;
			end;
		end;
	end;
end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Events.OnCreatePlayer.Add(eris_nvg.updateScreenBounds);
Events.OnResolutionChange.Add(eris_nvg.updateScreenBounds);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------