local vanilla_createChildren = ISInventoryPage.createChildren
function ISInventoryPage:createChildren()
    vanilla_createChildren(self)

    local weightWid = getTextManager():MeasureStringX(UIFont.Small, "99.99 / 99")
	weightWid = math.max(90, weightWid + 10)
    local titleBarHeight = self:titleBarHeight()

    self.titleButton = ISButton:new(self.width - 20 - weightWid, 0, 0, titleBarHeight, "", self, ISInventoryPage.renameContainer)
    self.titleButton:initialise()
    self.titleButton.borderColor.a = 0.0
    self.titleButton.backgroundColor.a = 0.0
    self.titleButton.backgroundColorMouseOver.a = 0.7
    self.titleButton:setTooltip(getText("IGUI_RenameContainers_RenameTooltip"))
    self:addChild(self.titleButton)
    self.titleButton:setVisible(false)

end

local vanilla_prerender = ISInventoryPage.prerender
function ISInventoryPage:prerender()
    -- change title to moddata title (if applicable) so we can rename it
    -- check if not character inventory, not the floor and the container is an IsoObject (has a parent)
    if self.title and not self.onCharacter and self.inventory:getType() ~= "floor" and self.inventory:getParent() then
        local modData = self.inventory:getParent():getModData()
        if modData.RenameContainer_CustomName and modData.RenameContainer_CustomName ~= "" then
            self.title = modData.RenameContainer_CustomName
        end
    end
    
    vanilla_prerender(self)

    -- render a button over the default title text
    if self.title and not self.onCharacter and self.inventory:getType() ~= "floor" and self.inventory:getParent() then
        local weightWid = getTextManager():MeasureStringX(UIFont.Small, "99.99 / 99")
        weightWid = math.max(90, weightWid + 10)
        local textWidth = getTextManager():MeasureStringX(UIFont.Small, self.title)
        local x = self.width - 25 - weightWid - textWidth;

        -- render title bar texture over the default text to hide it
        self:drawTextureScaled(self.titlebarbkg, x, 1, textWidth + 10, self:titleBarHeight() - 2, 1, 1, 1, 1);

        -- update button
        self.titleButton:setVisible(true)
        self.titleButton:setX(x)
        self.titleButton:setTitle(self.title)
        self.titleButton:setWidthToTitle()
    else
        self.titleButton:setVisible(false)
    end
end

function ISInventoryPage:renameContainer() 
    local modal = ISTextBox:new(0, 0, 280, 180, getText("IGUI_RenameContainers_RenameModal"), self.title, nil, ISInventoryPage.onRenameContainerClick, self.player, self.inventory)
    modal:initialise()
    modal:addToUIManager()
    if JoypadState.players[self.player+1] then
        setJoypadFocus(self.player, modal)
    end
end

function ISInventoryPage:onRenameContainerClick(button, inventory)
    if button.internal == "OK" then
        if button.parent.entry:getText() and button.parent.entry:getText() ~= "" then
            print("rename container to " .. button.parent.entry:getText())
            inventory:getParent():getModData().RenameContainer_CustomName = button.parent.entry:getText()
            inventory:getParent():transmitModData() -- sync moddata for MP
        end
    end
end

