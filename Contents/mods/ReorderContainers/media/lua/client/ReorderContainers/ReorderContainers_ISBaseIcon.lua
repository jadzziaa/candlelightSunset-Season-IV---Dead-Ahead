-- Applies the reordering of backpacks to the context menu of ISBaseIcon
ISBaseIcon.pre_reorder_doContextMenu = ISBaseIcon.doContextMenu
ISBaseIcon.doContextMenu = function(self, _context)
    local playerInv = getPlayerInventory(self.player)

    local originalOrder = {};
    local bpList = nil;

    -- Sort the backpacks by their Y position
    -- Makes the context menu appear in the same order as the backpacks
    if playerInv then
        bpList = playerInv.backpacks;

        for i = 1, #bpList do
            originalOrder[i] = bpList[i];
        end

        table.sort(bpList, function(a, b)
            return a:getY() < b:getY();
        end);
    end

    local retVal = ISBaseIcon.pre_reorder_doContextMenu(self, _context)

    -- Restore the original order so other mods don't get confused
    if playerInv then
        for i = 1, #bpList do
            bpList[i] = originalOrder[i];
        end
    end

    return retVal;
end