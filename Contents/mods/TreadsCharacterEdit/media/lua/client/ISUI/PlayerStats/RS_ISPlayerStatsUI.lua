--
-- Created by IntelliJ IDEA.
-- User: RJ
-- Date: 21/09/16
-- Time: 10:19
-- To change this template use File | Settings | File Templates.
--

--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "ISUI/ISPanel"
require "ISUI/PlayerStats/ISPlayerStatsUI"

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

function ISPlayerStatsUI:render()
    ISPlayerStatsUI.instance = self -- to support reloading in lua debugger

    local z = 20

    self:updateButtons();

    self:drawText(getText("IGUI_PlayerStats_PlayerStats"), self.width/2 - (getTextManager():MeasureStringX(UIFont.Cred1, getText("IGUI_PlayerStats_PlayerStats")) / 2), 10, 1,1,1,1, UIFont.Cred1);

    self:setStencilRect(0,60,self:getWidth(),self:getHeight()-60);

    local items = {
        getText("IGUI_PlayerStats_Username"), self.char:getUsername(), nil,
        getText("IGUI_PlayerStats_DisplayName"), self.char:getDisplayName(), self.changeUsernameBtn,
        getText("UI_characreation_forename") .. ":", self.char:getDescriptor():getForename(), self.changeForename,
        getText("UI_characreation_surname") .. ":", self.char:getDescriptor():getSurname(), self.changeSurname,
        getText("IGUI_PlayerStats_Profession"), getText("IGUI_PlayerStats_Profession"), self.changeProfession,
        getText("IGUI_char_Survived_For") .. ":", self.char:getTimeSurvived(), self.editHoursSurvived,	--- added button- Tread
        getText("IGUI_char_Zombies_Killed") .. ":", tostring(self.char:getZombieKills()), self.editKills	--- added button- Tread
    }

    local labelWidMax = 0
    local valueWidMax = 0
    local buttonMaxWid = 0
    for i=1,#items,3 do
        local labelWid = getTextManager():MeasureStringX(UIFont.Small, items[i])
        labelWidMax = math.max(labelWidMax, labelWid)
        local valueWid = getTextManager():MeasureStringX(UIFont.Small, items[i+1])
        valueWidMax = math.max(valueWidMax, valueWid)
        local button = items[i+2]
        if button then
            buttonMaxWid = math.max(buttonMaxWid, button.width)
        end
    end

    local btnPadY = self.buttonPadY
    z = 0;
    for i=1,#items,3 do
        self.mainPanel:drawText(items[i], 10, z + btnPadY, self.variableColor.r,self.variableColor.g,self.variableColor.b,self.variableColor.a, UIFont.Small)
        self.mainPanel:drawText(items[i+1], 10 + labelWidMax + 10, z + btnPadY, 1,1,1,1, UIFont.Small)
        local button = items[i+2]
        if button then
            button:setX(10 + labelWidMax + 10 + valueWidMax + 10)
            button:setY(z)
        end
        z = z + self.buttonHeight + 1
    end

    local nextColumnX = 10 + labelWidMax + 10 + valueWidMax + 10 + buttonMaxWid + 40
    local nextColumnZ = 0
    
    local chatMuted = getText("Sandbox_ThumpNoChasing_option1");
    if not self.char:isAllChatMuted() then
        chatMuted = getText("Sandbox_ThumpNoChasing_option2")
    end
    items = {
        getText("IGUI_PlayerStats_AccessLevel"), self.char:getAccessLevel(), self.changeAccessLvlBtn,
        getText("IGUI_PlayerStats_ChatMuted"), chatMuted, self.muteAllBtn,
        getText("IGUI_PlayerStats_UserLogs"), tostring(#self.userlogs), self.userlogBtn,
        getText("IGUI_PlayerStats_WarningPts"), tostring(self.warningPoint), self.warningPointsBtn,
    }

    labelWidMax = 0
    valueWidMax = 0
    for i=1,#items,3 do
        local labelWid = getTextManager():MeasureStringX(UIFont.Small, items[i])
        labelWidMax = math.max(labelWidMax, labelWid)
        local valueWid = getTextManager():MeasureStringX(UIFont.Small, items[i+1])
        valueWidMax = math.max(valueWidMax, valueWid)
    end

    for i=1,#items,3 do
        self.mainPanel:drawText(items[i], nextColumnX, nextColumnZ + btnPadY, self.variableColor.r,self.variableColor.g,self.variableColor.b,self.variableColor.a, UIFont.Small)
        self.mainPanel:drawText(items[i+1], nextColumnX + labelWidMax + 10, nextColumnZ + btnPadY, 1,1,1,1, UIFont.Small)
        local button = items[i+2]
        if button then
            button:setX(nextColumnX + labelWidMax + 10 + valueWidMax + 10)
            button:setY(nextColumnZ)
        end
        nextColumnZ = nextColumnZ + self.buttonHeight + 1
    end


    nextColumnZ = nextColumnZ + self.buttonHeight + 1
    self.manageInvBtn:setX(nextColumnX);
    self.manageInvBtn:setY(nextColumnZ);

    z = z + 20;
    self.mainPanel:drawText(getText("IGUI_char_Traits") .. ":", 10, z, self.variableColor.r,self.variableColor.g,self.variableColor.b,self.variableColor.a, UIFont.Small);
    z = z + FONT_HGT_SMALL + 4
    if #self.traits > 0 then
        local traitWidMax = 0
        local buttonWidMax = 0
        for i,v in ipairs(self.traits) do
            traitWidMax = math.max(traitWidMax, 25 + getTextManager():MeasureStringX(UIFont.Small, v.label))
            buttonWidMax = self.traitsRemoveButtons[v.label].width
        end
        local x = 25;
        local y = z + 10;
        local rowHgt = math.max(self.buttonHeight, 18 + 2)
        local dyTex = (rowHgt - 18) / 2
        for i,v in ipairs(self.traits) do
            v:setY(y + dyTex);
            v:setX(x);
            v:setVisible(true);
            self.mainPanel:drawText(v.label, 25 + x, y, 1,1,1,1, UIFont.Small)
            self.traitsRemoveButtons[v.label]:setY(y)
            self.traitsRemoveButtons[v.label]:setX(x + traitWidMax + 10)
            if x + 40 + (traitWidMax + 10 + buttonWidMax) * 2 <= self.width - 10 - 30 then
                x = x + 40 + traitWidMax + 10 + buttonWidMax;
            else
                x = 25;
                if i < #self.traits then
                    y = y + rowHgt
                end
            end
        end
        x = 25;
        y = y + rowHgt + 10;
        self.mainPanel:drawRectBorder(10, z, self.width - 30, y + self.buttonHeight + 10 - z, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
        z = y;
        self.addTraitBtn:setY(z);
        self.addTraitBtn:setX(x);
    else
        self.mainPanel:drawRectBorder(10, z, self.width - 30, 10 + self.buttonHeight + 10, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
        z = z + 10;
        self.addTraitBtn:setY(z);
        self.addTraitBtn:setX(25);
    end

    z = z + self.buttonHeight + 10 + 20

    z = z + self.xpListBox.itemheight -- column titles
    self.xpListBox:setY(z);
    self.addXpBtn:setY(self.xpListBox:getY() + self.xpListBox.height + 3);
    self.addXpBtn:setX(self.xpListBox:getX());
    self.addLvlBtn:setY(self.addXpBtn:getY());
    self.addLvlBtn:setX(self.addXpBtn:getRight() + 5);
    self.loseLvlBtn:setY(self.addXpBtn:getY());
    self.loseLvlBtn:setX(self.addLvlBtn:getRight() + 5);

    local yoff = 0;
    local columnLeft = self.xpListBox.columnLeft
    local columnWidth = self.xpListBox.columnWidth
    self.mainPanel:drawRectBorder(self.xpListBox.x, self.xpListBox.y - self.xpListBox.itemheight + yoff, self.xpListBox:getWidth(), self.xpListBox.itemheight + 1, 1, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    self.mainPanel:drawRect(self.xpListBox.x, 1 + self.xpListBox.y - self.xpListBox.itemheight + yoff, self.xpListBox.width, self.xpListBox.itemheight,self.listHeaderColor.a,self.listHeaderColor.r, self.listHeaderColor.g, self.listHeaderColor.b);
    self.mainPanel:drawRect(self.xpListBox.x + columnLeft[2], 1 + self.xpListBox.y - self.xpListBox.itemheight + yoff, 1, self.xpListBox.itemheight,1,self.borderColor.r, self.borderColor.g, self.borderColor.b);
    self.mainPanel:drawRect(self.xpListBox.x + columnLeft[3], 1 + self.xpListBox.y - self.xpListBox.itemheight + yoff, 1, self.xpListBox.itemheight,1,self.borderColor.r, self.borderColor.g, self.borderColor.b);
    self.mainPanel:drawRect(self.xpListBox.x + columnLeft[4], 1 + self.xpListBox.y - self.xpListBox.itemheight + yoff, 1, self.xpListBox.itemheight,1,self.borderColor.r, self.borderColor.g, self.borderColor.b);
    self.mainPanel:drawRect(self.xpListBox.x + columnLeft[5], 1 + self.xpListBox.y - self.xpListBox.itemheight + yoff, 1, self.xpListBox.itemheight,1,self.borderColor.r, self.borderColor.g, self.borderColor.b);
    self.mainPanel:drawRect(self.xpListBox.x + columnLeft[5] + columnWidth[5], 1 + self.xpListBox.y - self.xpListBox.itemheight + yoff, 1, self.xpListBox.itemheight,1,self.borderColor.r, self.borderColor.g, self.borderColor.b);

    yoff = yoff + (self.xpListBox.itemheight - FONT_HGT_SMALL) / 2
    self.mainPanel:drawText(self.xpListBox.columnLabel[1], self.xpListBox.x + 5, self.xpListBox.y - self.xpListBox.itemheight + yoff, 1,1,1,1,UIFont.Small);
    self.mainPanel:drawText(self.xpListBox.columnLabel[2], self.xpListBox.x + columnLeft[2] + 10, self.xpListBox.y - self.xpListBox.itemheight + yoff, 1,1,1,1,UIFont.Small);
    self.mainPanel:drawText(self.xpListBox.columnLabel[3], self.xpListBox.x + columnLeft[3] + 10, self.xpListBox.y - self.xpListBox.itemheight + yoff, 1,1,1,1,UIFont.Small);
    self.mainPanel:drawText(self.xpListBox.columnLabel[4], self.xpListBox.x + columnLeft[4] + 10, self.xpListBox.y - self.xpListBox.itemheight + yoff, 1,1,1,1,UIFont.Small);
    self.mainPanel:drawText(self.xpListBox.columnLabel[5], self.xpListBox.x + columnLeft[5] + 10, self.xpListBox.y - self.xpListBox.itemheight + yoff, 1,1,1,1,UIFont.Small);

    self.mainPanel:setScrollHeight(self.addXpBtn:getBottom() + 20)

    local panelHeight = self.mainPanel.y + self.mainPanel:getScrollHeight()
    self:setHeight(math.min(panelHeight, getCore():getScreenHeight() - 40))
--    self:setHeight(600)

    self:clearStencilRect();
end



local ISPlayerStatsUI_updateButtons = ISPlayerStatsUI.updateButtons;
function ISPlayerStatsUI:updateButtons()
    ISPlayerStatsUI_updateButtons(self)
	
	local buttonEnable = canModifyPlayerStats() and self:canModifyThis();
	self.editKills.enable = buttonEnable;
	self.editHoursSurvived.enable = buttonEnable;
end

local ISPlayerStatsUI_create = ISPlayerStatsUI.create
function ISPlayerStatsUI:create()

	ISPlayerStatsUI_create(self);

    self.editKills = ISButton:new(self.buttonOffset, self.height - 30, self.buttonWidth, self.buttonHeight, getText("IGUI_PlayerStats_Change"), self, self.onOptionMouseDown);
    self.editKills.internal = "EDITKILLS";
    self.editKills:initialise();
    self.editKills:instantiate();
    self.editKills:setAnchorLeft(true);
    self.editKills:setAnchorTop(false);
    self.editKills:setAnchorBottom(true);
    self.editKills.borderColor = self.buttonBorderColor;
    self.mainPanel:addChild(self.editKills);
	
	self.editHoursSurvived = ISButton:new(self.buttonOffset, self.height - 30, self.buttonWidth, self.buttonHeight, getText("IGUI_PlayerStats_Change"), self, self.onOptionMouseDown);
    self.editHoursSurvived.internal = "EDITHOURSSURVIVED";
    self.editHoursSurvived:initialise();
    self.editHoursSurvived:instantiate();
    self.editHoursSurvived:setAnchorLeft(true);
    self.editHoursSurvived:setAnchorTop(false);
    self.editHoursSurvived:setAnchorBottom(true);
    self.editHoursSurvived.borderColor = self.buttonBorderColor;
    self.mainPanel:addChild(self.editHoursSurvived);

end

local ISPlayerStatsUI_onOptionMouseDown = ISPlayerStatsUI.onOptionMouseDown;
function ISPlayerStatsUI:onOptionMouseDown(button, x, y)
	
	ISPlayerStatsUI_onOptionMouseDown(self, button, x, y); --- Run Vanilla function

    if button.internal == "EDITKILLS" then
        local modal = RS_ISPlayerStatsAddKillsUI:new(self.x + 200, self.y + 200, 300, 250, nil, self.char)
        modal:initialise();
        modal:addToUIManager();
        table.insert(ISPlayerStatsUI.instance.windows, modal);
    end
	
	   if button.internal == "EDITHOURSSURVIVED" then
        local modal = RS_ISPlayerStatsHoursSurvivedUI:new(self.x + 200, self.y + 200, 300, 250, nil, self.char)
        modal:initialise();
        modal:addToUIManager();
        table.insert(ISPlayerStatsUI.instance.windows, modal);
    end
 
end