if getActivatedMods():contains("nattachments") then return end

function ISAttachItemHotbar:perform()
	local attachmentType = isSling(self.item:getAttachmentType(),self.slot)
	if self.hotbar.attachedItems[self.slotIndex] then
		self.hotbar.chr:removeAttachedItem(self.hotbar.attachedItems[self.slotIndex]);
		self.hotbar.attachedItems[self.slotIndex]:setAttachedSlot(-1);
		self.hotbar.attachedItems[self.slotIndex]:setAttachedSlotType(nil);
		self.hotbar.attachedItems[self.slotIndex]:setAttachedToModel(nil);
	end
	if self.hotbar.replacements and self.hotbar.replacements[attachmentType] and isBack(self.slot) then
		self.slot = self.hotbar.replacements[attachmentType];
		if self.slot == "null" then
			self.hotbar:removeItem(self.item);
			return;
		end
	end
	
	self.hotbar.chr:setAttachedItem(self.slot, self.item);
	self.item:setAttachedSlot(self.slotIndex);
	self.item:setAttachedSlotType(self.slotDef.type);
	self.item:setAttachedToModel(self.slot);
	
	self.hotbar:reloadIcons();

	ISInventoryPage.renderDirty = true
	ISBaseTimedAction.perform(self);
end