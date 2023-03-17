local oldStart= ISMoveablesAction.start;
function ISMoveablesAction:start()
	if self.origSpriteName and string.find(self.origSpriteName,"sleepingbag") then 
        self:setActionAnim("Loot")
        self.character:SetVariable("LootPosition", "Low")
        self:setOverrideHandModels(nil, nil)
    end
	oldStart(self)
end