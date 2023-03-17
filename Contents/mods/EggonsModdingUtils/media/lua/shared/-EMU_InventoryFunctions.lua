-- GENERAL VALIDATORS
local function isFloor(container)
    return container:getType() == "floor"
end
local function isKeyRing(container)
    return container:getType() == "KeyRing"
end
local function isMainInventory(container)
    return container:getType() == "none"
end
EggonsMU.functions.isEquippedPrimary = function(item)
    local player = getPlayer()
    local output
    if not item then
        output = false
    else
        output = player:getPrimaryHandItem() == item
    end
    return output
end
EggonsMU.functions.isACarriedContainer = function(verifiedContainer)
    local buttons = EggonsMU.functions.getInventoryContainerButtons()
    local output = false
    for i, preContainer in ipairs(buttons) do
        if preContainer.inventory == verifiedContainer then
            output = true
            break
        end
    end
    return output
end

-- GENERAL GETTERS
EggonsMU.functions.getInventory = function()
    return getPlayerInventory(getPlayer():getPlayerNum())
end
EggonsMU.functions.getLoot = function()
    return getPlayerLoot(getPlayer():getPlayerNum())
end
EggonsMU.functions.getActiveInventoryContainer = function()
    return getPlayerInventory(getPlayer():getPlayerNum()).inventoryPane.inventory
end
function EggonsMU.functions.getCarriedContainers()
    local backpacks = getPlayerInventory(getPlayer():getPlayerNum()).backpacks
    local output = {}
    for i, carriedContainer in ipairs(backpacks) do
        if carriedContainer.inventory:getType() ~= "KeyRing" then
            table.insert(output, carriedContainer.inventory)
        end
    end
    return output
end
function EggonsMU.functions.getLootContainers()
    local backpacks = getPlayerLoot(getPlayer():getPlayerNum()).backpacks
    local output = {}
    for i, lootContainer in ipairs(backpacks) do
        if lootContainer.inventory:getType() ~= "KeyRing" then
            table.insert(output, lootContainer.inventory)
        end
    end
    return output
end
function EggonsMU.functions.getAllAccessibleContainers()
    local containers = EggonsMU.functions.getCarriedContainers()
    local lootContainers = EggonsMU.functions.getLootContainers()
    for i, container in pairs(lootContainers) do
        table.insert(containers, container)
    end
    return containers
end

-- CONTAINERS GETTERS
EggonsMU.functions.getBackPack = function()
    local backpack = getPlayer():getClothingItem_Back()
    if backpack then
        return backpack:getItemContainer()
    else
        return nil
    end
end
EggonsMU.functions.getFannyPack = function(type)
    local player = getPlayer()
    local fannyPack
    if type == "front" then
        fannyPack = player:getWornItem("FannyPackFront")
    elseif type == "back" then
        fannyPack = player:getWornItem("FannyPackBack")
    else
        fannyPack = player:getWornItem("FannyPackFront") or player:getWornItem("FannyPackBack")
    end
    if fannyPack and instanceof(fannyPack, "InventoryContainer") then
        return fannyPack:getItemContainer()
    else
        return nil
    end
end
EggonsMU.functions.getKeyRing = function()
    local buttons = EggonsMU.functions.getInventoryContainerButtons()
    local keyRing
    for i, button in ipairs(buttons) do
        if isKeyRing(button.inventory) then
            keyRing = button.inventory
            break
        end
    end
    return keyRing
end
EggonsMU.functions.getMainInventory = function()
    local buttons = EggonsMU.functions.getInventoryContainerButtons()
    local output
    for i, preContainer in ipairs(buttons) do
        if preContainer.inventory:getType() == "none" then
            output = preContainer.inventory
            break
        end
    end
    return output
end

-- ITEMS GETTERS

EggonsMU.functions.getBackPackItems = function()
    local backpack = getPlayer():getClothingItem_Back()
    if backpack then
        return backpack:getItemContainer():getItems()
    else
        return nil
    end
end

EggonsMU.functions.getHotbarItems = function()
    local hotbar = getPlayerHotbar(getPlayer():getPlayerNum())
    local output = {}
    if hotbar then
        output = hotbar.attachedItems or {}
    end
    return output
end
EggonsMU.functions.getItemsInHotbar = function()
    return EggonsMU.functions.getHotbarItems()
    -- getPlayerHotbar(getPlayer():getPlayerNum()).attachedItems
end

EggonsMU.functions.getWornItems = function()
    return getPlayerHotbar(getPlayer():getPlayerNum()).wornItems
end
EggonsMU.functions.getMainInventoryItems = function(includeWornItems, includeHotbarItems)
    includeWornItems = includeWornItems or false
    includeHotbarItems = includeHotbarItems or false
    local pseudoinventory = EggonsMU.functions.getMainInventory():getItems()
    local hotbar = getPlayerHotbar(getPlayer():getPlayerNum())
    local output = {}
    for i = 0, pseudoinventory:size() - 1 do
        local item = pseudoinventory:get(i)
        if
            (includeWornItems or not item:isEquipped()) and (includeHotbarItems or not hotbar:isInHotbar(item)) and
                item:getType() ~= "KeyRing"
         then
            table.insert(output, item)
        -- print("type: ", item:getType(), " is equipped ", item:isEquipped())
        end
    end
    -- EggonsMU.printFuckingNormalObject(output, "output")
    return output
end

EggonsMU.functions.getPrimaryBag = function()
    local PHI = getPlayer():getPrimaryHandItem()
    if PHI and instanceof(PHI, "InventoryContainer") then
        return PHI:getItemContainer()
    else
        return nil
    end
end
EggonsMU.functions.getSecondaryBag = function()
    local SHI = getPlayer():getSecondaryHandItem()
    if SHI and instanceof(SHI, "InventoryContainer") then
        return SHI:getItemContainer()
    else
        return nil
    end
end

-- OTHER GETTERS

EggonsMU.functions.findContainerButton = function(buttonsList, container)
    -- print("Sought container ", container)
    local output
    for i, button in ipairs(buttonsList) do
        -- print("Current button: ", button)
        -- print("Current button inventory: ", button.inventory)
        if button.inventory == container then
            -- print("Found container")
            output = button
            break
        end
    end
    return output
end
EggonsMU.functions.getInventoryContainerButtons = function()
    return EggonsMU.functions.getInventory().backpacks
end
EggonsMU.functions.getLootContainerButtons = function()
    return EggonsMU.functions.getLoot().backpacks
end
EggonsMU.functions.getSelectedLootItems = function()
    local pane = EggonsMU.functions.getLoot().inventoryPane
    local selected = pane.selected
    local output = {}
    for k, selectedRow in pairs(selected) do
        local items = selectedRow.items
        if items then
            -- EggonsMU.printFuckingNormalObject(items, "slected row items")
            for i = 2, #items do
                table.insert(output, items[i])
            end
        end
    end
    return output
end

-- UTILITY FUNCTIONS

function EggonsMU.functions.performActionOnItems(itemsList, actionFunction)
    for i, item in pairs(itemsList) do
        actionFunction(item)
    end
end
function EggonsMU.functions.performActionOnItemsInContainers(containersList, actionFunction)
    for i, container in pairs(containersList) do
        EggonsMU.functions.performActionOnItems(container:getItems(), actionFunction)
    end
end

EggonsMU.functions.transferItem = function(player, item, targetContainer, srcContainer)
    srcContainer = srcContainer or item:getContainer()
    local transferItem = ISInventoryTransferAction:new(player, item, srcContainer, targetContainer)
    ISTimedActionQueue.add(transferItem)
end

EggonsMU.functions.transferItems = function(selectedItems, targetContainer)
    local player = getPlayer()
    if instanceof(selectedItems, "ArrayList") then
        print("ArryList")
        for i = 0, selectedItems:size() - 1 do
            local item = selectedItems:get(i)
            EggonsMU.functions.transferItem(player, item, targetContainer)
        end
    else
        print("Hopefully table")
        for i, item in ipairs(selectedItems) do
            EggonsMU.functions.transferItem(player, item, targetContainer)
        end
    end
end
