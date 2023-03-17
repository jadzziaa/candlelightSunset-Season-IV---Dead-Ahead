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

RS_ISPlayerStatsAddKillsUI = ISPanel:derive("ISPlayerStatsAddXPUI");

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)

--************************************************************************--
--** ISPanel:initialise
--**
--************************************************************************--

function RS_ISPlayerStatsAddKillsUI:initialise()
    ISPanel.initialise(self);
    self:create();
end


function RS_ISPlayerStatsAddKillsUI:setVisible(visible)
    --    self.parent:setVisible(visible);
    self.javaObject:setVisible(visible);
end

function RS_ISPlayerStatsAddKillsUI:render()
    local z = 20;

    self:drawText("Set Zombie Kills", self.width/2 - (getTextManager():MeasureStringX(UIFont.Medium, "Set Zombie Kills") / 2), z, 1,1,1,1, UIFont.Medium);
end

function RS_ISPlayerStatsAddKillsUI:create()

    local amountLbl = ISLabel:new(10, 20 + FONT_HGT_MEDIUM + 20, FONT_HGT_SMALL, "Zombie Kills", 1, 1, 1, 1, UIFont.Small, true)
    amountLbl:initialise()
    amountLbl:instantiate()
    self:addChild(amountLbl)
	
	local boxHgt = FONT_HGT_SMALL + 3 * 2
    self.entry = ISTextEntryBox:new(tostring(self.playerObj:getZombieKills()), 10, amountLbl:getBottom(), 100, boxHgt);
    self.entry.font = UIFont.Small;
    self.entry:initialise();
    self.entry:instantiate();
    self.entry:setOnlyNumbers(true);
    self:addChild(self.entry);

    local btnWid = 100
    local btnHgt = math.max(25, FONT_HGT_SMALL + 3 * 2)
    local padBottom = 10

    self.ok = ISButton:new((self:getWidth() / 2) - 100 - 5, self.entry:getBottom() + padBottom, btnWid, btnHgt, getText("UI_Ok"), self, RS_ISPlayerStatsAddKillsUI.onOptionMouseDown);
    self.ok.internal = "OK";
    self.ok:initialise();
    self.ok:instantiate();
    self.ok.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.ok);

    self.cancel = ISButton:new((self:getWidth() / 2) + 5, self.ok:getY(), btnWid, btnHgt, getText("UI_Cancel"), self, RS_ISPlayerStatsAddKillsUI.onOptionMouseDown);
    self.cancel.internal = "CANCEL";
    self.cancel:initialise();
    self.cancel:instantiate();
    self.cancel.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.cancel);

    self:setHeight(self.cancel:getBottom() + padBottom)
end

function RS_ISPlayerStatsAddKillsUI:onOptionMouseDown(button, x, y)
    if button.internal == "OK" then
        self:setVisible(false);
        self:removeFromUIManager();
		
		local value = tonumber(self.entry:getText())
		local playerCurrent = getPlayer();
		
		if playerCurrent == self.playerObj then
			self.playerObj:setZombieKills(value);
		else
			local args = { player = self.playerObj:getUsername(), amount = value }
			sendClientCommand(playerCurrent, 'RS_Server', 'RS_Server_EditKillCount', args)
			self.playerObj:setZombieKills(value);
		end

    end
    if button.internal == "CANCEL" then
        self:setVisible(false);
        self:removeFromUIManager();
    end
end

function RS_ISPlayerStatsAddKillsUI:new(x, y, width, height, target, playerObj)
    local o = {};
    o = ISPanel:new(x, y, width, height * 2);
    setmetatable(o, self);
    self.__index = self;
    o.variableColor={r=0.9, g=0.55, b=0.1, a=1};
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    o.backgroundColor = {r=0, g=0, b=0, a=0.8};
    o.target = target;
	o.playerObj = playerObj;
    o.zOffsetSmallFont = math.max(25, FONT_HGT_SMALL);
    o.moveWithMouse = true;

    return o;
end
