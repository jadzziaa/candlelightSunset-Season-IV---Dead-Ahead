ISUniversalGunRepair = {};

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function predicateCantClean(item)
	local data = item:getModData().UGR;
	if data then
		return data[3] < SandboxVars.UniversalGunRepair.MinimumCleanThreshold;
	else
		return false;
	end
end

local function predicateCantRepair(item)
	local data = item:getModData().UGR;
	if data then
		return data[3] < SandboxVars.UniversalGunRepair.MinimumRepairThreshold;
	else
		return false;
	end
end

local function predicateMeetRepairSkill(playerObj)
	local skillReq = SandboxVars.UniversalGunRepair.MinimumFirearmSkill;
	return (playerObj:getPerkLevel(Perks.Reloading) < skillReq) and (playerObj:getPerkLevel(Perks.Aiming) < skillReq)
end

ISUniversalGunRepair.DisassembleContextMenu = function(player, context, items)
	local playerObj = getSpecificPlayer(player)	
	local playerInv = playerObj:getInventory();
	items = ISInventoryPane.getActualItems(items)
	for _, item in ipairs(items) do
		if item:IsWeapon() and item:getSubCategory() == "Firearm" then
			if playerInv:containsTagRecurse("UGRToolClean") or playerInv:containsTagRecurse("UGRToolRepair") then
				local screwdriver = playerObj:getInventory():getFirstTagEvalRecurse("Screwdriver", predicateNotBroken);
			
				local option = context:addOption(getText("ContextMenu_UGRDisassemble"), playerObj, ISUniversalGunRepair.OnDisassemble, item, screwdriver); 
				
				local toolTip = nil;
				local newLine = "";
				if screwdriver == nil then
					toolTip = toolTip or ISWorldObjectContextMenu.addToolTip();
					toolTip.description = newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Screwdriver"));
					option.notAvailable = true;
				end
				if toolTip then
					option.toolTip = toolTip;
				end
				break;
			end
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(ISUniversalGunRepair.DisassembleContextMenu);

ISUniversalGunRepair.OnDisassemble = function(playerObj, gun,  screwdriver)
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, screwdriver);
	ISInventoryPaneContextMenu.equipWeapon(gun, true, false, playerObj:getPlayerNum())
	
	-- Unload the gun first
	if gun:getMagazineType() and gun:isContainsClip() then 
		ISTimedActionQueue.add(ISEjectMagazine:new(playerObj, gun));
	elseif gun:getAmmoType() and gun:getCurrentAmmoCount() > 0 then 
		ISTimedActionQueue.add(ISUnloadBulletsFromFirearm:new(playerObj, gun, false))
	end
	
    if ISReloadWeaponAction.canRack(gun) then
		ISTimedActionQueue.add(ISRackFirearm:new(playerObj, gun));
	end
	
	-- Remove any upgrades
	if gun:getScope() then
		ISTimedActionQueue.add(ISRemoveWeaponUpgrade:new(playerObj, gun, gun:getScope(), 50));
	end
	--if gun:getClip() then
		--ISTimedActionQueue.add(ISRemoveWeaponUpgrade:new(playerObj, gun, gun:getClip(), 50));
	--end
	if gun:getSling() then
		ISTimedActionQueue.add(ISRemoveWeaponUpgrade:new(playerObj, gun, gun:getSling(), 50));
	end
	if gun:getStock() then
		ISTimedActionQueue.add(ISRemoveWeaponUpgrade:new(playerObj, gun, gun:getStock(), 50));
	end
	if gun:getCanon() then
		ISTimedActionQueue.add(ISRemoveWeaponUpgrade:new(playerObj, gun, gun:getCanon(), 50));
	end
	if gun:getRecoilpad() then
		ISTimedActionQueue.add(ISRemoveWeaponUpgrade:new(playerObj, gun, gun:getRecoilpad(), 50));
	end
	
	-- Disassemble the gun
	ISTimedActionQueue.add(ISUGRDisassembleAction:new(playerObj, gun, screwdriver));
end

ISUniversalGunRepair.CleanContextMenu = function(player, context, items)
	local playerObj = getSpecificPlayer(player)	
	local playerInv = playerObj:getInventory();
	items = ISInventoryPane.getActualItems(items)
	for _, item in ipairs(items) do
		if (item:getType() == "DisassembledGunPartsSmall") or (item:getType() == "DisassembledGunPartsLarge") then
			local kit = playerInv:getFirstTagRecurse("UGRToolClean");
			if kit then
				local solvent = playerInv:getFirstTagRecurse("UGRItemClean");
				local solventFull = playerInv:getFirstTagRecurse("UGRItemCleanFull");
				local cleanRag = playerInv:getFirstTypeRecurse("Base.RippedSheets");
				
				local subMenu = context:getNew(context);
				context:addSubMenu(context:addOption(getText("ContextMenu_UGRClean")), subMenu);
				
				local option1 = subMenu:addOption(getText("ContextMenu_UGRNormal"), playerObj, ISUniversalGunRepair.OnClean, item, kit, solvent, cleanRag, false); 				
				local toolTip1 = nil;
				local newLine = "";
				if predicateCantClean(item) then
					toolTip1 = ISWorldObjectContextMenu.addToolTip();
					toolTip1.description = "<RGB:1,0,0>" .. getText("ContextMenu_UGRTooDamagedCleaning");
					newLine = " <LINE>"
					option1.notAvailable = true;
				end
				if solvent == nil then
					toolTip1 = toolTip1 or ISWorldObjectContextMenu.addToolTip();
					toolTip1.description = toolTip1.description .. newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.CleaningSolvent"));
					newLine = " <LINE>";
					option1.notAvailable = true;
				end
				if cleanRag == nil then
					toolTip1 = toolTip1 or ISWorldObjectContextMenu.addToolTip();
					toolTip1.description = toolTip1.description .. newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.RippedSheets"));
					option1.notAvailable = true;
				end
				if toolTip1 then
					option1.toolTip = toolTip1;
				end				
				
				local option2 = subMenu:addOption(getText("ContextMenu_UGRFull"), playerObj, ISUniversalGunRepair.OnClean, item, kit, solventFull, cleanRag, true); 				
				local toolTip2 = nil;
				newLine = "";
				if predicateCantClean(item) then
					toolTip2 = ISWorldObjectContextMenu.addToolTip();
					toolTip2.description = "<RGB:1,0,0>" .. getText("ContextMenu_UGRTooDamagedCleaning");
					newLine = " <LINE>"
					option2.notAvailable = true;
				end
				if solventFull == nil then
					toolTip2 = toolTip2 or ISWorldObjectContextMenu.addToolTip();
					toolTip2.description = toolTip2.description .. newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.CleaningSolventBlackLabel"));
					newLine = " <LINE>";
					option2.notAvailable = true;
				end
				if cleanRag == nil then
					toolTip2 = toolTip2 or ISWorldObjectContextMenu.addToolTip();
					toolTip2.description = toolTip2.description .. newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.RippedSheets"));
					option2.notAvailable = true;
				end
				if toolTip2 then
					option2.toolTip = toolTip2;
				end
				
				break;
			end
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(ISUniversalGunRepair.CleanContextMenu);

ISUniversalGunRepair.OnClean = function(playerObj, gunParts, kit, solvent, cleanRag, fullRestore)
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, gunParts);
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, kit);
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, solvent);
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, cleanRag);
	ISTimedActionQueue.add(ISUGRCleanAction:new(playerObj, gunParts, kit, solvent, cleanRag, fullRestore));
end

ISUniversalGunRepair.RepairContextMenu = function(player, context, items)
	local playerObj = getSpecificPlayer(player)	
	local playerInv = playerObj:getInventory();
	items = ISInventoryPane.getActualItems(items)
	for _, item in ipairs(items) do
		if (item:getType() == "DisassembledGunPartsSmall") or (item:getType() == "DisassembledGunPartsLarge") then
			local tools = playerInv:getFirstTagRecurse("UGRToolRepair");
			if tools then
				local scrap = playerInv:getFirstTypeRecurse("Base.ScrapMetal");
				
				local option = context:addOption(getText("ContextMenu_UGRRepair"), playerObj, ISUniversalGunRepair.OnRepair, item, tools, scrap); 
				
				local toolTip = nil;
				local newLine = "";
				if predicateCantRepair(item) then
					toolTip = ISWorldObjectContextMenu.addToolTip();
					toolTip.description = "<RGB:1,0,0>" .. getText("ContextMenu_UGRTooDamagedRepairing");
					newLine = " <LINE>"
					option.notAvailable = true;
				end
				if predicateMeetRepairSkill(playerObj) then
					toolTip = toolTip or ISWorldObjectContextMenu.addToolTip();
					toolTip.description = toolTip.description .. newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_UGRNotSkilledEnough");
					newLine = " <LINE>"
					option.notAvailable = true;
				end
				if scrap == nil then
					toolTip = toolTip or ISWorldObjectContextMenu.addToolTip();
					toolTip.description = toolTip.description .. newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.ScrapMetal"));
					newLine = " <LINE>";
					option.notAvailable = true;
				end
				if toolTip then
					option.toolTip = toolTip;
				end
				break;
			end
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(ISUniversalGunRepair.RepairContextMenu);

ISUniversalGunRepair.OnRepair = function(playerObj, gunParts, tools, scrap)
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, gunParts);
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, tools);
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, scrap);
	ISTimedActionQueue.add(ISUGRRepairAction:new(playerObj, gunParts, tools, scrap));
end

ISUniversalGunRepair.ReassembleContextMenu = function(player, context, items)
	local playerObj = getSpecificPlayer(player)	
	local playerInv = playerObj:getInventory();
	items = ISInventoryPane.getActualItems(items)
	for _, item in ipairs(items) do
		if (item:getType() == "DisassembledGunPartsSmall") or (item:getType() == "DisassembledGunPartsLarge") then
			if playerInv:containsTagRecurse("UGRToolClean") or playerInv:containsTagRecurse("UGRToolRepair") then
				local screwdriver = playerObj:getInventory():getFirstTagEvalRecurse("Screwdriver", predicateNotBroken);
				local lubricant = playerInv:getFirstTagRecurse("UGRItemAssemble");
				
				local option = context:addOption(getText("ContextMenu_UGRReassemble"), playerObj, ISUniversalGunRepair.OnReassemble, item, screwdriver, lubricant); 
				
				local toolTip = nil;
				local newLine = "";
				if lubricant == nil then
					toolTip = ISWorldObjectContextMenu.addToolTip();
					toolTip.description = "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.FirearmLubricant"));
					newLine = " <LINE>"
					option.notAvailable = true;
				end
				if screwdriver == nil then
					toolTip = toolTip or ISWorldObjectContextMenu.addToolTip();
					toolTip.description = toolTip.description .. newLine .. "<RGB:1,0,0>" .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Screwdriver"));
					newLine = " <LINE>"
					option.notAvailable = true;
				end
				if toolTip then
					option.toolTip = toolTip;
				end
				break;
			end
		end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(ISUniversalGunRepair.ReassembleContextMenu);

ISUniversalGunRepair.OnReassemble = function(playerObj, gunParts, screwdriver, lubricant)
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, gunParts);
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, screwdriver);
	ISInventoryPaneContextMenu.transferIfNeeded(playerObj, lubricant);
	ISTimedActionQueue.add(ISUGRReassembleAction:new(playerObj, gunParts, screwdriver, lubricant));
end
