-- A popup window that allows the user to manually enter a number to sort by.

require "ISUI/ISPanel"

ReorderContainers_ManualPopup = ISPanel:derive("ReorderContainers_ManualPopup")

function ReorderContainers_ManualPopup:initialise()
    ISPanel.initialise(self)
end

function ReorderContainers_ManualPopup:createChildren()
    local y = 0
    
    if self.isLootWindow then
        y = y + 10

        local onLootCheckboxChange = function(self)
            local player = getSpecificPlayer(self.inventoryPage.player)
            ReorderContainers_Mod.setSortLootWindow(player, self.lootCheckbox.selected[1])
        end

        self.lootCheckbox = ISTickBox:new(15, y, 20, 20, "", self, onLootCheckboxChange)
        self.lootCheckbox:initialise()
        self.lootCheckbox:addOption("Sort Loot Window?", true)
        self.lootCheckbox:setSelected(1, ReorderContainers_Mod.getSortLootWindow(getSpecificPlayer(self.inventoryPage.player)))
        self:addChild(self.lootCheckbox)

        y = y + 20
    end

    y = y + 10
    self.label = ISLabel:new(0, y, 10, self:getTargetName(), 1, 1, 1, 1, UIFont.Small, true)
    self.label:initialise()
    self.label:instantiate()
    self.label:setX(self:getWidth() / 2 - self.label:getWidth() / 2)
    self:addChild(self.label)

    y = y + 25
    self.infoLabel = ISLabel:new(0, y, 10, "Sorting Priority", 1, 1, 1, 0.7, UIFont.Small, true)
    self.infoLabel:initialise()
    self.infoLabel:instantiate()
    self.infoLabel:setX(self:getWidth() / 2 - self.infoLabel:getWidth() / 2)
    self:addChild(self.infoLabel)

    local player = getSpecificPlayer(self.inventoryPage.player)
    local currentValue = ReorderContainers_Mod.getSortPriority(player, self.inventory, self.inventoryPage)

    y = y + 25
    self.entry = ISTextEntryBox:new(tostring(currentValue), 0, y, 100, 20)
    self.entry:initialise()
    self.entry:instantiate()
    self.entry:setOnlyNumbers(true)
    self.entry:setTooltip("Enter a number to sort by.")
    self.entry:setX(self:getWidth() / 2 - self.entry:getWidth() / 2)
    self:addChild(self.entry)

    y = y + 55
    if y > self:getHeight() then
        self:setHeight(y)
    end

    self.okButton = ISButton:new(self:getWidth() / 2 - 100, self:getHeight() - 25, 100, 25, getText("UI_Ok"), self, self.onOK)
    self.okButton:initialise()
    self.okButton:instantiate()
    self:addChild(self.okButton)

    self.cancelButton = ISButton:new(self:getWidth() / 2, self:getHeight() - 25, 100, 25, getText("UI_Cancel"), self, self.onCancel)
    self.cancelButton:initialise()
    self.cancelButton:instantiate()
    self:addChild(self.cancelButton)

    self:bringToTop()
end

function ReorderContainers_ManualPopup:getTargetName()
    local player = getSpecificPlayer(self.inventoryPage.player)

    if self.inventory == player:getInventory() then
        return getText("IGUI_InventoryName", player:getDescriptor():getForename(), player:getDescriptor():getSurname())
    else
        local item = self.inventory:getContainingItem()
        if item then
            return item:getName()
        else
            return getTextOrNull("IGUI_ContainerTitle_" .. self.inventory:getType()) or ""
        end
    end
end

function ReorderContainers_ManualPopup:onOK()
    local player = getSpecificPlayer(self.inventoryPage.player)
    local number = tonumber(self.entry:getText())
    if number then
        ReorderContainers_Mod.setSortPriority(player, self.inventory, number, true)
    else
        ReorderContainers_Mod.setSortPriority(player, self.inventory, nil, false)
    end

    self.inventoryPage:refreshBackpacks()
    self:removeFromUIManager()

    self.inventoryPage:updateReorderContainersLock()
end

function ReorderContainers_ManualPopup:onCancel()
    self:removeFromUIManager()
end

function ReorderContainers_ManualPopup:new(x, y, inventoryPage, inventory)
    local o = ISPanel:new(x, y, 200, 120)
    setmetatable(o, self)
    self.__index = self

    o.backgroundColor.a = 0.9
    
    o.inventoryPage = inventoryPage
    o.inventory = inventory

    local lootPage = getPlayerLoot(inventoryPage.player)
    if lootPage == inventoryPage then
        o.isLootWindow = true
    end

    return o
end