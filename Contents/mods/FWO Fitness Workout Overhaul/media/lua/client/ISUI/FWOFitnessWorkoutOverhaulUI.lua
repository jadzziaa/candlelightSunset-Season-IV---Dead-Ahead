-- equip needed items for fitness (dumbbell..) and unequip unwanted items (weapons, bags..)
function ISFitnessUI:equipItems()
	if self.exeData.item and not self.player:getInventory():contains(self.exeData.item, true) then
		return false;
	end
	if not self.exeData.prop then
		ISInventoryPaneContextMenu.unequipItem(self.player:getPrimaryHandItem(), self.player:getPlayerNum())
		ISInventoryPaneContextMenu.unequipItem(self.player:getSecondaryHandItem(), self.player:getPlayerNum())
	end
	if self.exeData.prop == "twohands" then
		ISWorldObjectContextMenu.equip(self.player, self.player:getPrimaryHandItem(), self.exeData.item, true, true);
	end
	if self.exeData.prop == "primary" then
		ISWorldObjectContextMenu.equip(self.player, self.player:getPrimaryHandItem(), self.exeData.item, true, false);
		self.player:setSecondaryHandItem(nil);
	end
	if self.exeData.prop == "switch" then
		ISWorldObjectContextMenu.equip(self.player, self.player:getPrimaryHandItem(), self.exeData.item, true, false);
		self.player:setSecondaryHandItem(nil);
	end
	if not SandboxVars.FWOFitness.KeepBagsOn then
		for i=0,self.player:getWornItems():size()-1 do
			local item = self.player:getWornItems():get(i):getItem();
			if item and instanceof(item, "InventoryContainer") then
				ISTimedActionQueue.add(ISUnequipAction:new(self.player, item, 50));
			end
		end
	end

	return true;
end