require "Hotbar/ISHotbar"

local old_ISHotbar_attachItem = ISHotbar.attachItem
function ISHotbar:attachItem (item, slot, slotIndex, slotDef, doAnim)
	-- print("Attach Item " .. tostring(slotDef.type) .. " - " .. tostring(slotIndex))
	local sniper = (  slotIndex ~= 1 )
	if not sniper then
		old_ISHotbar_attachItem(self, item, slot, slotIndex, slotDef, doAnim)
		return
	end
	
	-- print("Sniper " .. tostring(sniper))
	if doAnim then
		if self.replacements and self.replacements[item:getAttachmentType()]
		and not sniper	
		then
			slot = self.replacements[item:getAttachmentType()];
		end
		self:setAttachAnim(item, slotDef);
		ISInventoryPaneContextMenu.transferIfNeeded(self.chr, item)
		-- first remove the current equipped one if needed
		if self.attachedItems[slotIndex] then
			ISTimedActionQueue.add(ISDetachItemHotbar:new(self.chr, self.attachedItems[slotIndex]));
		end
		ISTimedActionQueue.add(ISAttachItemHotbar:new(self.chr, item, slot, slotIndex, slotDef));
	else
		-- add new item
		-- if the item need to be attached elsewhere than its original emplacement because of a bag for example
		if self.replacements and self.replacements[item:getAttachmentType()] 
		and not sniper	
		then
			slot = self.replacements[item:getAttachmentType()];
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