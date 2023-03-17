if getActivatedMods():contains("nattachments") then return end

function ISHotbar:attachItem (item, slot, slotIndex, slotDef, doAnim)
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