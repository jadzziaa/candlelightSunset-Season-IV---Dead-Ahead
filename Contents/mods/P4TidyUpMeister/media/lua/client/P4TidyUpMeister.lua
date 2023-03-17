local P4TidyUpMeister = {}

P4TidyUpMeister.player = nil
P4TidyUpMeister.needsReequip = false
P4TidyUpMeister.doNotReequip = false
P4TidyUpMeister.ignoreStop = false
P4TidyUpMeister.primaryItem = nil
P4TidyUpMeister.secondaryItem = nil
P4TidyUpMeister.wornItems = {}
P4TidyUpMeister.transferredItems = {}

P4TidyUpMeister.Messages_ToDoReequip = getText("UI_P4TidyUpMeister_Messages_ToDoReequip")
P4TidyUpMeister.Messages_ToDoNotReequip = getText("UI_P4TidyUpMeister_Messages_ToDoNotReequip")
P4TidyUpMeister.ContextMenu_ToDoReequip = getText("ContextMenu_P4TidyUpMeister_ToDoReequip")
P4TidyUpMeister.ContextMenu_ToDoNotReequip = getText("ContextMenu_P4TidyUpMeister_ToDoNotReequip")

-- *****************************************************************************
-- * Options
-- *****************************************************************************

P4TidyUpMeister.options = {
	forceReequip = false,
	useContextMenu = true,
	enableBuild = true,
	enableFirearms = true,
	enableFitness = true,
	enableEatFood = true,
	enableTakePills = true,
	enableReading = true,
	enableMedical = true,
	enableTailoring = true,
}

SetModOptions = function(options)
	P4TidyUpMeister.options = options
end

-- *****************************************************************************
-- * ModData functions
-- *****************************************************************************

P4TidyUpMeister.setDoNotReequip = function()
	local modData = P4TidyUpMeister.player:getModData()
	if not modData.P4TidyUpMeister then
		modData.P4TidyUpMeister = {}
		modData.P4TidyUpMeister.doNotReequip = false
	end
	P4TidyUpMeister.doNotReequip = modData.P4TidyUpMeister.doNotReequip
end

P4TidyUpMeister.toggleDoNotReequip = function()
	local modData = P4TidyUpMeister.player:getModData()
	modData.P4TidyUpMeister.doNotReequip = not modData.P4TidyUpMeister.doNotReequip
	P4TidyUpMeister.doNotReequip = modData.P4TidyUpMeister.doNotReequip
	if P4TidyUpMeister.doNotReequip then
		P4TidyUpMeister.showInfo(P4TidyUpMeister.Messages_ToDoNotReequip)
	else
		P4TidyUpMeister.showInfo(P4TidyUpMeister.Messages_ToDoReequip)
	end
end

-- *****************************************************************************
-- * Overwrite functions
-- *****************************************************************************

-- [SET] Most actions via context menu
P4TidyUpMeister.ISWorldObjectContextMenu_equip = ISWorldObjectContextMenu.equip
function ISWorldObjectContextMenu.equip(player, handItem, item, primary, twoHands)
	-- Even if already have tools equipped, this function will always be called, so start the hook here.
	P4TidyUpMeister.set(player)
	return P4TidyUpMeister.ISWorldObjectContextMenu_equip(player, handItem, item, primary, twoHands)
end

-- [SET] Build
P4TidyUpMeister.ISBuildAction_new = ISBuildAction.new
function ISBuildAction:new(player, item, x, y, z, north, spriteName, time)
	if P4TidyUpMeister.options.enableBuild then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	return P4TidyUpMeister.ISBuildAction_new(self, player, item, x, y, z, north, spriteName, time)
end

-- [SET] Build
P4TidyUpMeister.ISBuildMenu_onMultiStageBuildSelected = ISBuildMenu.onMultiStageBuildSelected
function ISBuildMenu.onMultiStageBuildSelected(cursor, square)
	if P4TidyUpMeister.options.enableBuild then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISBuildMenu_onMultiStageBuildSelected(cursor, square)
end

-- [SET] Firearms (Upgrade weapon)
P4TidyUpMeister.ISInventoryPaneContextMenu_onUpgradeWeapon = ISInventoryPaneContextMenu.onUpgradeWeapon
function ISInventoryPaneContextMenu.onUpgradeWeapon(weapon, part, player)
	if P4TidyUpMeister.options.enableFirearms then
		P4TidyUpMeister.set(player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onUpgradeWeapon(weapon, part, player)
end

-- [SET] Firearms (Remove upgrade weapon)
P4TidyUpMeister.ISInventoryPaneContextMenu_onRemoveUpgradeWeapon = ISInventoryPaneContextMenu.onRemoveUpgradeWeapon
function ISInventoryPaneContextMenu.onRemoveUpgradeWeapon(weapon, part, player)
	if P4TidyUpMeister.options.enableFirearms then
		P4TidyUpMeister.set(player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onRemoveUpgradeWeapon(weapon, part, player)
end

-- [SET] Firearms (Insert magazine)
P4TidyUpMeister.ISInventoryPaneContextMenu_onInsertMagazine = ISInventoryPaneContextMenu.onInsertMagazine
function ISInventoryPaneContextMenu.onInsertMagazine(player, weapon, magazine)
	if P4TidyUpMeister.options.enableFirearms then
		P4TidyUpMeister.set(player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onInsertMagazine(player, weapon, magazine)
end

-- [SET] Firearms (Eject magazine)
P4TidyUpMeister.ISInventoryPaneContextMenu_onEjectMagazine = ISInventoryPaneContextMenu.onEjectMagazine
function ISInventoryPaneContextMenu.onEjectMagazine(player, weapon)
	if P4TidyUpMeister.options.enableFirearms then
		P4TidyUpMeister.set(player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onEjectMagazine(player, weapon)
end

-- [SET] Firearms (Load bullets into firearm)
P4TidyUpMeister.ISInventoryPaneContextMenu_onLoadBulletsIntoFirearm = ISInventoryPaneContextMenu.onLoadBulletsIntoFirearm
function ISInventoryPaneContextMenu.onLoadBulletsIntoFirearm(player, weapon)
	if P4TidyUpMeister.options.enableFirearms then
		P4TidyUpMeister.set(player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onLoadBulletsIntoFirearm(player, weapon)
end

-- [SET] Firearms (Unload bullets from firearm)
P4TidyUpMeister.ISInventoryPaneContextMenu_onUnloadBulletsFromFirearm = ISInventoryPaneContextMenu.onUnloadBulletsFromFirearm
function ISInventoryPaneContextMenu.onUnloadBulletsFromFirearm(player, weapon)
	if P4TidyUpMeister.options.enableFirearms then
		P4TidyUpMeister.set(player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onUnloadBulletsFromFirearm(player, weapon)
end

-- [SET] Firearms (Rack gun)
P4TidyUpMeister.ISInventoryPaneContextMenu_onRackGun = ISInventoryPaneContextMenu.onRackGun
function ISInventoryPaneContextMenu.onRackGun(player, weapon)
	if P4TidyUpMeister.options.enableFirearms then
		P4TidyUpMeister.set(player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onRackGun(player, weapon)
end

-- [SET] Fitness
P4TidyUpMeister.ISFitnessAction_new = ISFitnessAction.new
function ISFitnessAction:new(player, exercise, timeToExe, fitnessUI, exeData)
	if P4TidyUpMeister.options.enableFitness then
		P4TidyUpMeister.set(player, true)
	end
	return P4TidyUpMeister.ISFitnessAction_new(self, player, exercise, timeToExe, fitnessUI, exeData)
end

-- [SET] Eat food
P4TidyUpMeister.ISInventoryPaneContextMenu_onEatItems = ISInventoryPaneContextMenu.onEatItems
function ISInventoryPaneContextMenu.onEatItems(items, percentage, playerNo)
	if P4TidyUpMeister.options.enableEatFood then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onEatItems(items, percentage, playerNo)
end

-- [SET] Eat food (Drink)
P4TidyUpMeister.ISInventoryPaneContextMenu_onDrinkForThirst = ISInventoryPaneContextMenu.onDrinkForThirst
function ISInventoryPaneContextMenu.onDrinkForThirst(waterContainer, player)
	if P4TidyUpMeister.options.enableEatFood then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onDrinkForThirst(waterContainer, player)
end

-- [SET] Eat food (Drink)
P4TidyUpMeister.ISInventoryPaneContextMenu_onDrink = ISInventoryPaneContextMenu.onDrink
function ISInventoryPaneContextMenu.onDrink(items, waterContainer, percentage, player)
	if P4TidyUpMeister.options.enableEatFood then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onDrink(items, waterContainer, percentage, player)
end

-- [SET] Take pills
P4TidyUpMeister.ISInventoryPaneContextMenu_onPillsItems = ISInventoryPaneContextMenu.onPillsItems
function ISInventoryPaneContextMenu.onPillsItems(items, player)
	if P4TidyUpMeister.options.enableTakePills then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onPillsItems(items, player)
end

-- [SET] Reading
P4TidyUpMeister.ISInventoryPaneContextMenu_onLiteratureItems = ISInventoryPaneContextMenu.onLiteratureItems
function ISInventoryPaneContextMenu.onLiteratureItems(items, player)
	if P4TidyUpMeister.options.enableReading then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_onLiteratureItems(items, player)
end

-- [SET] Medical (Health Panel)
P4TidyUpMeister.HealthPanelAction_new = HealthPanelAction.new
function HealthPanelAction:new(character, handler, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
	if P4TidyUpMeister.options.enableMedical then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	return P4TidyUpMeister.HealthPanelAction_new(self, character, handler, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
end

-- [SET] Tailoring (Repair)
P4TidyUpMeister.ISInventoryPaneContextMenu_repairClothing = ISInventoryPaneContextMenu.repairClothing
function ISInventoryPaneContextMenu.repairClothing(player, clothing, part, fabric, thread, needle)
	if P4TidyUpMeister.options.enableTailoring then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_repairClothing(player, clothing, part, fabric, thread, needle)
end

-- [SET] Tailoring (Remove patch)
P4TidyUpMeister.ISInventoryPaneContextMenu_removePatch = ISInventoryPaneContextMenu.removePatch
function ISInventoryPaneContextMenu.removePatch(player, clothing, part, needle)
	if P4TidyUpMeister.options.enableTailoring then
		P4TidyUpMeister.set(P4TidyUpMeister.player)
	end
	P4TidyUpMeister.ISInventoryPaneContextMenu_removePatch(player, clothing, part, needle)
end

-- [SET] Mechanics (Install part)
P4TidyUpMeister.ISVehiclePartMenu_onInstallPart = ISVehiclePartMenu.onInstallPart
function ISVehiclePartMenu.onInstallPart(player, part, item)
	-- Notice : Mechanics is always be processed as the basic function.
	P4TidyUpMeister.set(P4TidyUpMeister.player)
	P4TidyUpMeister.ISVehiclePartMenu_onInstallPart(player, part, item)
end

-- [SET] Mechanics (Uninstall part)
P4TidyUpMeister.ISVehiclePartMenu_onUninstallPart = ISVehiclePartMenu.onUninstallPart
function ISVehiclePartMenu.onUninstallPart(player, part)
	-- Notice : Mechanics is always be processed as the basic function.
	P4TidyUpMeister.set(P4TidyUpMeister.player)
	P4TidyUpMeister.ISVehiclePartMenu_onUninstallPart(player, part)
end

-- [SET] Mechanics (Fix)
P4TidyUpMeister.ISInventoryPaneContextMenu_onFix = ISInventoryPaneContextMenu.onFix
function ISInventoryPaneContextMenu.onFix(brokenObject, player, fixing, fixer, vehiclePart)
	-- Notice : Mechanics is always be processed as the basic function.
	P4TidyUpMeister.set(P4TidyUpMeister.player)
	P4TidyUpMeister.ISInventoryPaneContextMenu_onFix(brokenObject, player, fixing, fixer, vehiclePart)
end

P4TidyUpMeister.ISInventoryTransferAction_new = ISInventoryTransferAction.new
function ISInventoryTransferAction:new(player, item, srcContainer, destContainer, time)
	if P4TidyUpMeister.needsReequip then
		P4TidyUpMeister.transferredItems[item] = srcContainer
	end
	return P4TidyUpMeister.ISInventoryTransferAction_new(self, player, item, srcContainer, destContainer, time)
end

P4TidyUpMeister.ISBaseTimedAction_stop = ISBaseTimedAction.stop
function ISBaseTimedAction:stop()
	P4TidyUpMeister.ISBaseTimedAction_stop(self)
	if not P4TidyUpMeister.ignoreStop then
		if P4TidyUpMeister.options.forceReequip then
			P4TidyUpMeister.forceReequip(self.character)
		else
			P4TidyUpMeister.reset()
		end
	end
end

-- *****************************************************************************
-- * Event trigger functions
-- *****************************************************************************

P4TidyUpMeister.OnCreatePlayer = function(playerIndex, player)
	P4TidyUpMeister.player = player
	P4TidyUpMeister.setDoNotReequip()
end
Events.OnCreatePlayer.Add(P4TidyUpMeister.OnCreatePlayer)

P4TidyUpMeister.OnFillWorldObjectContextMenu = function(player, context, worldObjects, test)
	if P4TidyUpMeister.options.useContextMenu then
		if P4TidyUpMeister.doNotReequip then
			context:addOption(P4TidyUpMeister.ContextMenu_ToDoReequip, nil, P4TidyUpMeister.toggleDoNotReequip)
		else
			context:addOption(P4TidyUpMeister.ContextMenu_ToDoNotReequip, nil, P4TidyUpMeister.toggleDoNotReequip)
		end
	end
end
Events.OnFillWorldObjectContextMenu.Add(P4TidyUpMeister.OnFillWorldObjectContextMenu)

P4TidyUpMeister.OnPlayerUpdate = function(player)
	if P4TidyUpMeister.player ~= player then
		return
	end
	if P4TidyUpMeister.needsReequip and not player:hasTimedActions() then
		P4TidyUpMeister.reequip(player)
	end
end
Events.OnPlayerUpdate.Add(P4TidyUpMeister.OnPlayerUpdate)

-- *****************************************************************************
-- * Reequipt functions
-- *****************************************************************************

P4TidyUpMeister.set = function(player, ignoreStop)
	if (not P4TidyUpMeister.needsReequip) and (not P4TidyUpMeister.doNotReequip) then
		P4TidyUpMeister.needsReequip = true
		P4TidyUpMeister.ignoreStop = ignoreStop
		P4TidyUpMeister.primaryItem = player:getPrimaryHandItem()
		P4TidyUpMeister.secondaryItem = player:getSecondaryHandItem()
		local wornItems = player:getWornItems()
		for i=0, wornItems:size()-1 do
			local wornItem = wornItems:get(i)
			P4TidyUpMeister.wornItems[wornItem:getLocation()] = wornItem:getItem()
		end
	end
end

P4TidyUpMeister.reset = function()
	P4TidyUpMeister.needsReequip = false
	P4TidyUpMeister.ignoreStop = false
	P4TidyUpMeister.primaryItem = nil
	P4TidyUpMeister.secondaryItem = nil
	P4TidyUpMeister.wornItems = {}
	P4TidyUpMeister.transferredItems = {}
end

P4TidyUpMeister.reequip = function(player)
	if P4TidyUpMeister.needsReequip and not P4TidyUpMeister.doNotReequip then
		local primaryItem = player:getPrimaryHandItem()
		local secondaryItem = player:getSecondaryHandItem()
		-- Check twoHands before
		local bTwoHands = false
		if P4TidyUpMeister.primaryItem and (P4TidyUpMeister.primaryItem == P4TidyUpMeister.secondaryItem) then
			bTwoHands = true
		end
		-- Check twoHans after
		local aTwoHands = false
		if primaryItem and (primaryItem == secondaryItem) then
			aTwoHands = true
		end
		-- Reequip primary item
		if P4TidyUpMeister.primaryItem then
			ISTimedActionQueue.add(ISEquipWeaponAction:new(player, P4TidyUpMeister.primaryItem, 50, true, bTwoHands))
		else
			if primaryItem then
				ISTimedActionQueue.add(ISUnequipAction:new(player, primaryItem, 50))
			end
		end
		-- Reequip secondary item
		if P4TidyUpMeister.secondaryItem then
			if not bTwoHands then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(player, P4TidyUpMeister.secondaryItem, 50, false, false))
			end
		else
			if secondaryItem and not aTwoHands then
				ISTimedActionQueue.add(ISUnequipAction:new(player, secondaryItem, 50))
			end
		end
		-- Reequip worn items
		local wornItems = {}
		local tempItems = player:getWornItems()
		for i=0, tempItems:size()-1 do
			local wornItem = tempItems:get(i)
			local location = wornItem:getLocation()
			wornItems[location] = wornItem:getItem()
			if not P4TidyUpMeister.wornItems[location] then
				ISTimedActionQueue.add(ISUnequipAction:new(player, wornItem:getItem(), 50))
			end
		end
		for location,wornItem in pairs(P4TidyUpMeister.wornItems) do
			if wornItem ~= wornItems[location] then
				ISTimedActionQueue.add(ISWearClothing:new(player, wornItem, 50))
			end
		end
		-- Transfer items to srcContainer
		local inventory = player:getInventory()
		for item,destContainer in pairs(P4TidyUpMeister.transferredItems) do
			if inventory:contains(item) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, inventory, destContainer))
			else
				local replaceItem = item:getReplaceOnUse()
				if replaceItem then
					local invItems = inventory:getItems()
					for i=0, invItems:size()-1 do
						local invItem = invItems:get(i)
						if replaceItem == invItem:getType() then
							ISTimedActionQueue.add(ISInventoryTransferAction:new(player, invItem, inventory, destContainer))
							break
						end
					end
				end
			end
		end
		P4TidyUpMeister.reset()
	end
end

P4TidyUpMeister.forceReequip = function(player)
	if P4TidyUpMeister.needsReequip then
		player:setPrimaryHandItem(P4TidyUpMeister.primaryItem)
		player:setSecondaryHandItem(P4TidyUpMeister.secondaryItem)
		P4TidyUpMeister.reset()
	end
end

P4TidyUpMeister.showInfo = function(message)
	P4TidyUpMeister.player:Say(message, 0.607, 0.717, 1.000, UIFont.Dialogue, 15, "radio")
end
