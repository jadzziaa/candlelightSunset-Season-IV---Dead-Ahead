require "ISUI/ISPanel"
require "ISUI/ISButton"
require "ISUI/ISMouseDrag"
require "ISUI/ISInventoryPage"

local SET_MANUALLY = "ReorderContainers_SetManually"

ISInventoryPage.pre_reorder_addContainerButton = ISInventoryPage.addContainerButton
function ISInventoryPage:addContainerButton(container, texture, name, tooltip)
    local button = self.pre_reorder_addContainerButton(self, container, texture, name, tooltip)

    -- Buttons can be reused, so we need to make sure we don't overwrite the original functions

    if not button.pre_reorder_onMouseDown then
        button.pre_reorder_onMouseDown = button.onMouseDown
    end
    button.onMouseDown = ReorderContainers_Mod.onMouseDown
    
    if not button.pre_reorder_onMouseMove then
        button.pre_reorder_onMouseMove = button.onMouseMove
    end
    button.onMouseMove = ReorderContainers_Mod.onMouseMove

    if not button.pre_reorder_onMouseMoveOutside then
        button.pre_reorder_onMouseMoveOutside = button.onMouseMoveOutside
    end
    button.onMouseMoveOutside = ReorderContainers_Mod.onMouseMoveOutside

    if not button.pre_reorder_onMouseUp then
        button.pre_reorder_onMouseUp = button.onMouseUp
    end
    button.onMouseUp = ReorderContainers_Mod.onMouseUp

    return button
end

ISInventoryPage.pre_reorder_createChildren = ISInventoryPage.createChildren
ISInventoryPage.createChildren = function(self)
    self.pre_reorder_createChildren(self)

    self:createReorderContainersSortButton()
    self:createReorderContainersLockButton()
end

ISInventoryPage.createReorderContainersSortButton = function(self)
    local reorderButton = ISButton:new(self:getWidth() - self.buttonSize/2, self:getHeight() - self.buttonSize*0.75, self.buttonSize/2, self.buttonSize/2, "", self)
    reorderButton:setImage(getTexture("media/ui/ReorderContainers/reorder-icon.png"))

    reorderButton.anchorLeft = false
    reorderButton.anchorRight = true
    reorderButton.anchorTop = false
    reorderButton.anchorBottom = true

    reorderButton.onMouseDown = function(self, x, y)
        local selectedButton = self:getParent().selectedButton
        if selectedButton then
            local x = getCore():getScreenWidth() / 2
            local y = getCore():getScreenHeight() / 2
            local popup = ReorderContainers_ManualPopup:new(x - 100, y - 60, self:getParent(), selectedButton.inventory)
            popup:initialise()
            popup:setAlwaysOnTop(true)
            popup:setCapture(true)
            popup:addToUIManager()
        end
    end

    reorderButton:initialise()
    reorderButton:instantiate()
    self:addChild(reorderButton)
    self.reorderOptionsButton = reorderButton
end

local function updateLock(self, lockButton)
    local newState = nil
    if self.onCharacter then
        newState = ReorderContainers_Mod.toggleInventoryLock(getSpecificPlayer(self.player))
    else
        newState = ReorderContainers_Mod.toggleLootLock(getSpecificPlayer(self.player))
    end
    
    if newState or not ReorderContainers_Mod.canReorderBackpacks(self) then 
        lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-locked.png"))        
    else
        lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-unlocked.png"))
    end
end

ISInventoryPage.updateReorderContainersLock = function(self)
    if self.onCharacter then
        return
    end

    ReorderContainers_Mod.toggleLootLock(getSpecificPlayer(self.player))
    updateLock(self, self.reorderLockButton)
end

ISInventoryPage.createReorderContainersLockButton = function(self)
    local player = getSpecificPlayer(self.player)
    local onCharacter = self.onCharacter

    local lockButton = ISButton:new(self:getWidth() - self.buttonSize, self:getHeight() - self.buttonSize * 0.75, self.buttonSize/2, self.buttonSize/2, "", self)
    if ReorderContainers_Mod.isLocked(self) or not ReorderContainers_Mod.canReorderBackpacks(self) then
        lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-locked.png"))
    else
        lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-unlocked.png"))
    end

    lockButton.anchorLeft = false
    lockButton.anchorRight = true
    lockButton.anchorTop = false
    lockButton.anchorBottom = true

    -- Toggle the lock state and update the button image
    lockButton:setOnClick(function()
        if not ReorderContainers_Mod.canReorderBackpacks(self) then
            self.reorderOptionsButton:onMouseDown(0,0)
            return
        end

        updateLock(self, lockButton)
    end)

    lockButton:initialise()
    lockButton:instantiate()
    self:addChild(lockButton)
    self.reorderLockButton = lockButton
end

local function isButtonValid(invPage, button)
    return button:getIsVisible() and invPage.children[button.ID]
end

ISInventoryPage.reorderContainerButtons = function(self, draggedButton)
    -- Don't reorder if the button hasn't moved far enough
    if draggedButton and math.abs(draggedButton:getY() - draggedButton.reorderStartY) <= 32 then
        draggedButton:setY(draggedButton.reorderStartY)
        return
    end

    local playerObj = getSpecificPlayer(self.player)

    local inventoriesAndY = {}
    for index, button in ipairs(self.backpacks) do
        if isButtonValid(self, button) then
            table.insert(inventoriesAndY, {inventory = button.inventory, y = button:getY()})
        end
    end
    table.sort(inventoriesAndY, function(a, b) return a.y < b.y end)

    local seenObjs = {}
    local lastSort = 0
    for index, data in ipairs(inventoriesAndY) do
        local targetModData, sortKey, parent = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(playerObj, data.inventory)
        local isManual = targetModData and targetModData[SET_MANUALLY]
        local isDraggedButton = data.inventory == draggedButton.inventory

        if not isDraggedButton and parent and seenObjs[parent] then
            -- Skip this button, some IsoObjects have multiple inventories
        else
            if parent then
                seenObjs[parent] = true
            end

            if not isManual or isDraggedButton then
                lastSort = lastSort + 10
                targetModData[sortKey] = lastSort
                targetModData[SET_MANUALLY] = nil
            else
                lastSort = targetModData[sortKey]
                -- Look back one button
                if index > 1 then
                    local prevInventory = inventoriesAndY[index - 1].inventory
                    local prevSort = ReorderContainers_Mod.getSortPriority(playerObj, prevInventory)
                    if prevSort >= lastSort then
                        ReorderContainers_Mod.setSortPriority(playerObj, prevInventory, lastSort - 1, false)
                    end
                end
            end
        end
    end
end

ISInventoryPage.applyBackpackOrder = function(self)
    local playerObj = getSpecificPlayer(self.player)

    local buttonsAndSort = {}
    for index, button in ipairs(self.backpacks) do
        if isButtonValid(self, button) then
            local sort = 1000 + index
            local targetModData, sortKey, parent = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(playerObj, button.inventory)
            if targetModData then
                sort = targetModData[sortKey] or (1000 + index)
            end
            table.insert(buttonsAndSort, {button = button, sort = sort})
        end
    end

    table.sort(buttonsAndSort, function(a, b) return a.sort < b.sort end)

    for index, data in ipairs(buttonsAndSort) do
        data.button:setY((index - 1) * self.buttonSize + self:titleBarHeight() - 1)
    end
end

ISInventoryPage.pre_reorder_refreshBackpacks = ISInventoryPage.refreshBackpacks
ISInventoryPage.refreshBackpacks = function(self)
    if self.killTheChoice then -- Makes controller work...?
        self.backpackChoice = nil
        self.killTheChoice = false
    end
    
    self:pre_reorder_refreshBackpacks()
    if ReorderContainers_Mod.canReorderBackpacks(self) then
        self:applyBackpackOrder()
    end
    self.pendingReorder = false
end

ISInventoryPage.pre_reorder_onMouseWheel = ISInventoryPage.onMouseWheel
ISInventoryPage.onMouseWheel = function(self, del)
    -- Store the original order of the backpacks
    local originalOrder = {}
    for index, button in ipairs(self.backpacks) do
        originalOrder[button] = index
    end

    -- Sort the backpacks by their Y position so that scrolling works as expected
    table.sort(self.backpacks, function(a, b) return a:getY() < b:getY() end)
    
    -- The backpacks *might* get refreshed by the mousescroll, so we track that
    self.pendingReorder = true

    local retVal = self:pre_reorder_onMouseWheel(del)

    -- The backpacks were not refreshed, so we need to restore the original order
    if self.pendingReorder then
        table.sort(self.backpacks, function(a, b) return originalOrder[a] < originalOrder[b] end)
        self.pendingReorder = false
    end

    return retVal
end

local function handleJoypadDown(self, target, button)
    -- Store the original order of the backpacks
    local originalOrder = {}
    for index, button in ipairs(target.backpacks) do
        originalOrder[button] = index
    end

    -- Sort the backpacks by their Y position so that scrolling works as expected
    table.sort(target.backpacks, function(a, b) return a:getY() < b:getY() end)

    -- Clear the 'backpackChoice', not sure what its actually for, but we stop it from existing on bumper inputs
    target.killTheChoice = true

    local retVal = self:pre_reorder_onJoypadDown(button)
    table.sort(target.backpacks, function(a, b) return originalOrder[a] < originalOrder[b] end)
    return retVal
end

ISInventoryPage.pre_reorder_onJoypadDown = ISInventoryPage.onJoypadDown
ISInventoryPage.onJoypadDown = function(self, button)
    if button == Joypad.LBumper then
        return handleJoypadDown(self, getPlayerInventory(self.player), button)
    end

    if button == Joypad.RBumper then
        local lootPage = getPlayerLoot(self.player)
        if ReorderContainers_Mod.canReorderBackpacks(lootPage) then
            return handleJoypadDown(self, lootPage, button)
        end
    end

    return self:pre_reorder_onJoypadDown(button)
end
