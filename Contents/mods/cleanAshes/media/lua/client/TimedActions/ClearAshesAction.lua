--Replacer for part of vanilla clear ashes action. In theory this is overkill, I think you can't get here without having a broom in hand, and can't interrupt the timed action queue to drop the broom in between sweeping.

local function predicateClearAshes(item)
	return not item:isBroken() and item:hasTag("ClearAshes")
end

function ISClearAshes:isValid()
	local playerObj = self.character
	local playerInv = playerObj:getInventory()
    return playerInv:containsEvalRecurse(predicateClearAshes)
end

function ISClearAshes:start()
    local playerObj = self.character
	local playerInv = playerObj:getInventory()
    if playerInv:containsEvalRecurse(predicateClearAshes) then 
        local handItem = self.character:getPrimaryHandItem()
        if handItem then
            local anim = ISFarmingMenu.getShovelAnim(handItem)
            if handItem:getType() == "Broom" or handItem:getType() == "Mop" then
                anim = "Rake"
            end
            self:setActionAnim(anim)
        else
            self:setActionAnim("Loot")
            self.character:SetVariable("LootPosition", "Low")
        end
    end
end

function ISClearAshes:perform()
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self)
    local playerObj = self.character
	local playerInv = playerObj:getInventory()
    if playerInv:containsEvalRecurse(predicateClearAshes) then 
        self.ashes:getSquare():transmitRemoveItemFromSquare(self.ashes)
        self.ashes:getSquare():getObjects():remove(self.ashes)
    end
end