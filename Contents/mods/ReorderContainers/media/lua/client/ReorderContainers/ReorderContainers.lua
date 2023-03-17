local SORT_KEY = "ReorderContainers_Sort"
local SET_MANUALLY = "ReorderContainers_SetManually"
local INV_LOCK = "ReorderContainers_InvLock"
local LOOT_LOCK = "ReorderContainers_LootLock"
local LOOT_SORT = "ReorderContainers_LootSort"

-- For special containers that aren't "real"
local SPECIAL_SORT_KEYS_BY_INV_TYPE = {
    ["floor"] = "ReorderContainers_Sort_Floor",

    -- SpiffUI
    ["SpiffBodies"] = "Reorder_SpiffBodies",
    ["SpiffContainer"] = "Reorder_SpiffContainer",
    ["SpiffPack"] = "Reorder_SpiffPack",
    ["SpiffEquip"] = "Reorder_SpiffEquip",
}

ReorderContainers_Mod = {}

ReorderContainers_Mod.isLocked = function(inventoryPage)
    local player = getSpecificPlayer(inventoryPage.player)
    if inventoryPage.onCharacter then
        return player:getModData()[INV_LOCK]
    else
        return player:getModData()[LOOT_LOCK]
    end
end

ReorderContainers_Mod.onMouseDown = function(self, x, y)
    self.pre_reorder_onMouseDown(self, x, y)
    self.reorderStartMouseY = getMouseY()
    self.reorderStartY = self:getY()

    self.canDragToReorder = not ReorderContainers_Mod.isLocked(self:getParent()) and ReorderContainers_Mod.canReorderBackpacks(self:getParent())
end

ReorderContainers_Mod.onMouseMove = function(self, dx, dy, skipOgMouseMove)
    if not skipOgMouseMove then -- skipOgMouseMove is true when we're calling this from onMouseMoveOutside
        self.pre_reorder_onMouseMove(self, dx, dy)
    end

    if self.pressed and self.canDragToReorder then
        local parent = self:getParent()

        if math.abs(self.reorderStartMouseY - getMouseY()) > parent.buttonSize/2 then
            self.draggingToReorder = true
        end

        if self.draggingToReorder then
            local x = getMouseX()
            local y = getMouseY()
            local parentY = parent:getAbsoluteY()
            local newY = y - parentY - self:getHeight() / 2
            
            newY = math.max(parent:titleBarHeight() - 16, newY)

            self:setY(newY)
            self:bringToTop()
    
            self.draggingToReorder = true
        end
    end
end

ReorderContainers_Mod.onMouseMoveOutside = function(self, dx, dy)
    self.pre_reorder_onMouseMoveOutside(self, dx, dy)
    ReorderContainers_Mod.onMouseMove(self, dx, dy, true)

    -- if the mouse is no longer down, we missed the mouse up event
    if self.draggingToReorder and not isMouseButtonDown(0) then
        ReorderContainers_Mod.onMouseUp(self, 0, 0)
    end
end

ReorderContainers_Mod.onMouseUp = function(self, x, y)
    local page = self:getParent()
    if self.draggingToReorder then
        self.pressed = false;
        self.draggingToReorder = false
        page:reorderContainerButtons(self)
        page:refreshBackpacks()
    else
        self.pre_reorder_onMouseUp(self, x, y)
    end
end

ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject = function(player, inventory)
    local playerKey = player:getUsername()
    local sortKey = SORT_KEY
    local parentObject = nil

    if inventory == player:getInventory() then
        sortKey = SORT_KEY
        targetModData = player:getModData()
    elseif SPECIAL_SORT_KEYS_BY_INV_TYPE[inventory:getType()] then
        sortKey = SPECIAL_SORT_KEYS_BY_INV_TYPE[inventory:getType()]
        targetModData = player:getModData()
    else
        sortKey = playerKey..SORT_KEY

        local item = inventory:getContainingItem()
        local isoObject = inventory:getParent()
        if item then
            targetModData = item:getModData()
            parentObject = item
        elseif isoObject then
            targetModData = isoObject:getModData()
            parentObject = isoObject
        end
    end

    return targetModData, sortKey, parentObject
end

ReorderContainers_Mod.getSortPriority = function(player, inventory, inventoryPage)
    local targetModData, sortKey = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(player, inventory)
    if targetModData then
        return targetModData[sortKey] or ReorderContainers_Mod.getDefaultSortPriority(inventory, inventoryPage)
    end
    return ReorderContainers_Mod.getDefaultSortPriority(inventory, inventoryPage)
end

ReorderContainers_Mod.getDefaultSortPriority = function(inventory, inventoryPage)
    local index = 0
    for i, backpack in ipairs(inventoryPage.backpacks) do
        if backpack.inventory == inventory then
            index = i
            break
        end
    end
    return 1000 + index
end

ReorderContainers_Mod.setSortPriority = function(player, inventory, priority, isManual)
    local targetModData, sortKey = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(player, inventory)
    if targetModData then
        targetModData[sortKey] = priority
        targetModData[SET_MANUALLY] = isManual
    end
end

ReorderContainers_Mod.isManual = function(player, inventory)
    local targetModData, sortKey = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(player, inventory)
    return targetModData and targetModData[SET_MANUALLY]
end

ReorderContainers_Mod.getSortLootWindow = function(playerObj)
    return playerObj:getModData()[LOOT_SORT]
end

ReorderContainers_Mod.setSortLootWindow = function(playerObj, value)
    playerObj:getModData()[LOOT_SORT] = value
end

ReorderContainers_Mod.canReorderBackpacks = function(inventoryPage)
    return inventoryPage ~= getPlayerLoot(inventoryPage.player) or ReorderContainers_Mod.getSortLootWindow(getSpecificPlayer(inventoryPage.player))
end

ReorderContainers_Mod.toggleLootLock = function(playerObj)
    local modData = playerObj:getModData()
    modData[LOOT_LOCK] = not modData[LOOT_LOCK]
    return modData[LOOT_LOCK]
end

ReorderContainers_Mod.toggleInventoryLock = function(playerObj)
    local modData = playerObj:getModData()
    modData[INV_LOCK] = not modData[INV_LOCK]
    return modData[INV_LOCK]
end