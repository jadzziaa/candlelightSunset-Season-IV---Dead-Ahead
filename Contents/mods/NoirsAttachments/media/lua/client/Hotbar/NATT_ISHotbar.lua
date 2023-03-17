local sleepingbags = {
    Sleepingbag = "SleepingbagRolled",
    SleepingbagG = "SleepingbagGRolled",
    SleepingbagR = "SleepingbagRRolled",
    SleepingbagO = "SleepingbagORolled",
    SleepingbagBK = "SleepingbagBKRolled",
    SleepingbagLB = "SleepingbagLBRolled",
    SleepingbagP = "SleepingbagPRolled",
}

local function getNATTBackpackSlotsList(item)
	local slots = {
		[NATTgetSlotName("Weapon",item)] = true,
		[NATTgetSlotName("ShortWeapon",item)] = true,
		[NATTgetSlotName("UtilityLeft",item)] = true,
		[NATTgetSlotName("UtilityRight",item)] = true,
		[NATTgetSlotName("Left",item)] = true,
		[NATTgetSlotName("Right",item)] = true,
		[NATTgetSlotName("Container",item)] = true,
		[NATTgetSlotName("ContainerSmallLeft",item)] = true,
		[NATTgetSlotName("ContainerSmallRight",item)] = true,
		[NATTgetSlotName("Flashlight",item)] = true,
		[NATTgetSlotName("Bedroll",item)] = true,
	}
	return slots
end

local function getDefaultSlots(item)
	local modSlots = getNATTBackpackSlotsList(item)
	local attsList = ArrayList.new();
	local attachmentsProvided = item:getAttachmentsProvided()
	if attachmentsProvided then
		for i=0, attachmentsProvided:size() - 1 do
			if not modSlots[attachmentsProvided:get(i)]  then
				attsList:add(attachmentsProvided:get(i))
			end
		end
	end
	return attsList
end

local function loadAttachmentsProvided(chr)
	local item = chr:getClothingItem_Back()
	if not item then return end
	local modData = item:getModData()
	if not modData.NATTattachments then return end
	local getDefaultSlots = getDefaultSlots(item)
	item:setAttachmentsProvided(ArrayList.new())
	for k,v in pairs(modData.NATTattachments) do
		if v then 
			item:getAttachmentsProvided():add(k)
		end
	end
	item:getAttachmentsProvided():addAll(getDefaultSlots)
end

local function setSleepingBag(item,chr)
	local itemType = item:getType()
	local newType = sleepingbags[itemType]
	if not newType then return item end
	local container = item:getContainer()
	if container:getType() == "floor" then 
		item:getWorldItem():getSquare():transmitRemoveItemFromSquare(item:getWorldItem());
		item:getWorldItem():getSquare():removeWorldObject(item:getWorldItem());
		item:setWorldItem(nil);
	elseif container then
		container:Remove(item)
	else
		chr:getInventory():Remove(itemType);
	end
	local sleepingbag = InventoryItemFactory.CreateItem(newType)
	chr:getInventory():AddItem(sleepingbag);
	return sleepingbag;
end

function ISHotbar:activateSlot(slotIndex)
	local item = self.attachedItems[slotIndex]
	if not item then return end
	if item:getAttachedSlot() ~= slotIndex then
		return
	end

	if item:getCategory() == "Clothing" then
		if item:isEquipped() then
			ISTimedActionQueue.add(ISUnequipAction:new(self.chr, item, 50))
		else
			ISTimedActionQueue.add(ISWearClothing:new(self.chr, item, 50))
		end
		return
	end

	if item:canBeActivated() then
		item:setActivated(not item:isActivated())
		return
	end

	local scriptItem = item:getScriptItem()
	if instanceof(item, "HandWeapon") or item:IsInventoryContainer() or scriptItem:getType() == Type.Radio then
		self:equipItem(item)
	end
	
end

function ISHotbar.doMenuFromInventory(playerNum, item, context)
	local self = getPlayerHotbar(playerNum);
	if self == nil then return end
	if self:isInHotbar(item) and item:getAttachmentType() and item:getAttachedSlot() ~= -1 then
		local slot = self.availableSlot[item:getAttachedSlot()]
		local slotName = getTextOrNull("IGUI_HotbarAttachment_" .. slot.slotType) or slot.name;
		context:addOptionOnTop(getText("ContextMenu_RemoveFromHotbar", self.attachedItems[item:getAttachedSlot()]:getDisplayName(), slotName), self, ISHotbar.removeItem, self.attachedItems[item:getAttachedSlot()], true);
	end
	if item:getAttachmentType() and not self:isInHotbar(item) and not item:isBroken() and self.replacements[item:getAttachmentType()] ~= "null" then
		local subOption = context:addOptionOnTop(getText("ContextMenu_Attach"), nil);
		local subMenuAttach = context:getNew(context);
		context:addSubMenu(subOption, subMenuAttach);
		
		local found = false;
		for slotIndex, slot in pairs(self.availableSlot) do
			local slotDef = slot.def;
			for i, v in pairs(slotDef.attachments) do
				if item:getAttachmentType() == i then
					local doIt = true;
					local name = getTextOrNull("IGUI_HotbarAttachment_" .. slot.slotType) or slot.name;
					if self.replacements and self.replacements[item:getAttachmentType()] then
						slot = self.replacements[item:getAttachmentType()];
						if slot == "null" then
							doIt = false;
						end
					end
					if doIt then
						local option = subMenuAttach:addOption(name, self, ISHotbar.attachItem, item, v, slotIndex, slotDef, true);
						if self.attachedItems[slotIndex] then
							local tooltip = ISWorldObjectContextMenu.addToolTip();
							tooltip.description = tooltip.description .. getText("Tooltip_ReplaceWornItems") .. " <LINE> <INDENT:20> "
							tooltip.description = tooltip.description .. self.attachedItems[slotIndex]:getDisplayName()
							option.toolTip = tooltip
						end 
						found = true;
					end
				end
			end
		end
		if not found then
			subOption.notAvailable = true;
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			local text = getText("Tooltip_CanBeAttached") .. " <LINE> <INDENT:20> ";
			local typeText = "";
			for i,v in pairs(ISHotbarAttachDefinition) do
				if v.attachments then
					for type,atch in pairs(v.attachments) do
						if type == item:getAttachmentType() then
							typeText = NATTSlotsName[v.type]
							if not typeText then
								typeText = getText("IGUI_HotbarAttachment_" .. v.type)
							end
							if not (string.find(text,typeText.." <LINE> "))  then 
								text = text .. typeText .. " <LINE> "
							end
						end
					end
				end
			end
			subOption.subOption = nil;
			tooltip.description = text;
			subOption.toolTip = tooltip;
		end
	end
end

function ISHotbar:attachItem (item, slot, slotIndex, slotDef, doAnim)
	item = setSleepingBag(item,self.chr)
	local attachmentType = isSling(item:getAttachmentType(),slot)
	if doAnim then
		if self.replacements and self.replacements[attachmentType] and isBack(slot) then
			slot = self.replacements[attachmentType];
		end
		self:setAttachAnim(item, slotDef);
		ISInventoryPaneContextMenu.transferIfNeeded(self.chr, item)
		if self.attachedItems[slotIndex] then
			ISTimedActionQueue.add(ISDetachItemHotbar:new(self.chr, self.attachedItems[slotIndex]));
		end
		ISTimedActionQueue.add(ISAttachItemHotbar:new(self.chr, item, slot, slotIndex, slotDef));
	else
		if self.replacements and self.replacements[attachmentType] and isBack(slot) then
			slot = self.replacements[attachmentType];
			if slot == "null" then
				self:removeItem(item, false);
				return;
			end
		end
		self.chr:setAttachedItem(slot, item);
		item:setAttachedSlot(slotIndex);
		item:setAttachedSlotType(slotDef.type);
		item:setAttachedToModel(slot);
		
		self:reloadIcons();
		NATT.applyBackpackWR(self.chr,item)
	end
end

function isBack(slot)
	if not slot then return false end
	return string.find(slot," Back");
end

function isSling(attachmentType,slot)
	if slot and (string.find(slot,"Sling")) then
		return attachmentType.."Sling"
	end
	return attachmentType
end

local function isSlotAvailable(item,hotbar)
	local slotIndex = item:getAttachedSlot()
	local slotType = item:getAttachedSlotType()
	local slot = hotbar.availableSlot[slotIndex]
	if not slot then return false end
	if not (slot.slotType == slotType) then return false end
	return true
end

local function findReplacementItem(chr,itemType)
	local items = chr:getInventory():getItemsFromType(itemType, true)
	for i=0, items:size() - 1 do
        local item = items:get(i)
		if item:getAttachedSlotType() == nil then
			return item
		end
	end
	return nil
end

local function setReplacementItem(item,hotbar)
	if item:IsWeapon() then return end;
	if not item:canStoreWater() then return end
	if not isSlotAvailable(item,hotbar) then return end
	local chr = hotbar.chr
	local replacementType = nil
	if instanceof(item, "ComboItem") then
		replacementType = string.gsub(item:getReplaceOnUseOn(),"WaterSource%-","")
	else
		replacementType = item:getReplaceOnDeplete()
	end

	if not replacementType then return end
	replacementType = moduleDotType(item:getModule(), replacementType)
	local replacementItem = findReplacementItem(chr,replacementType);
	if not replacementItem then return end
	
	chr:setAttachedItem(item:getAttachedToModel(), replacementItem);
	replacementItem:setAttachedSlot(item:getAttachedSlot());
	replacementItem:setAttachedSlotType(item:getAttachedSlotType());
	replacementItem:setAttachedToModel(item:getAttachedToModel());
end

local checkReplacement = false
function ISHotbar:removeItem(item, doAnim)
	if item and item:IsInventoryContainer() then
		item:getInventory():setParent(nil)
	end
	NATT.restoreWeight(item)
	if doAnim then
		self:setAttachAnim(item);
		ISTimedActionQueue.add(ISDetachItemHotbar:new(self.chr, item));
	else
		self.chr:removeAttachedItem(item);
		if checkReplacement then
			setReplacementItem(item,self)
		end
		item:setAttachedSlot(-1);
		item:setAttachedSlotType(nil);
		item:setAttachedToModel(nil);

		self:reloadIcons();
	end
end

local originalRefresh = ISHotbar.refresh;
function ISHotbar:refresh()
	checkReplacement = false
	loadAttachmentsProvided(self.chr)
	originalRefresh(self)
	checkReplacement = true
end