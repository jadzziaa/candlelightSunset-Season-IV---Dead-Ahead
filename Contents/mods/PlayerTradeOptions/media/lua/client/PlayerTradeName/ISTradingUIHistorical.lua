local function getCharacterName(player)
    return player:getDescriptor():getForename() .. " " .. player:getDescriptor():getSurname();
end

local ISTradingUIHistorical_prerender = ISTradingUIHistorical.prerender
function ISTradingUIHistorical:prerender()
    if SandboxVars.PlayerTradeOptions.useCharacterName then
        local z = 10;
        local splitPoint = 100;
        local x = 10;
        self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
        self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
        self:drawText(getText("IGUI_ISTradingUIHistorical_Title", getCharacterName(self.otherPlayer)), self.width/2 - (getTextManager():MeasureStringX(UIFont.Medium, getText("IGUI_ISTradingUIHistorical_Title")) / 2), z, 1,1,1,1, UIFont.Medium);
    else
        ISTradingUIHistorical_prerender(self)
    end
end
