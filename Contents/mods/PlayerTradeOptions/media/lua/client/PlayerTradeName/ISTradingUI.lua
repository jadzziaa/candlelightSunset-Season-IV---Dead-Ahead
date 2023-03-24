local function getCharacterName(player)
    return player:getDescriptor():getForename() .. " " .. player:getDescriptor():getSurname();
end

local ISTradingUI_update = ISTradingUI.update
function ISTradingUI:update()
    ISTradingUI_update(self)

    if SandboxVars.PlayerTradeOptions.useCharacterName then
        if self.blockingMessage == getText("IGUI_TradingUI_WaitingAnswer", self.otherPlayer:getDisplayName()) then
            self.blockingMessage = getText("IGUI_TradingUI_WaitingAnswer", getCharacterName(self.otherPlayer))
        end

        if self.blockingMessage == getText("IGUI_TradingUI_ClosedTrade", self.otherPlayer:getDisplayName()) then
            self.blockingMessage = getText("IGUI_TradingUI_ClosedTrade", getCharacterName(self.otherPlayer))
        end

        if self.blockingMessage == getText("IGUI_TradingUI_RefusedTrade", self.otherPlayer:getDisplayName()) then
            self.blockingMessage = getText("IGUI_TradingUI_RefusedTrade", getCharacterName(self.otherPlayer))
        end

        if self.blockingMessage2 == getText("IGUI_TradingUI_TooFarAway", self.otherPlayer:getDisplayName()) then
            self.blockingMessage2 = getText("IGUI_TradingUI_TooFarAway", getCharacterName(self.otherPlayer))
        end
    end
end

local ISTradingUI_prerender = ISTradingUI.prerender
function ISTradingUI:prerender()
    if SandboxVars.PlayerTradeOptions.useCharacterName then
        local z = 15;
        local splitPoint = 100;
        local x = 10;
        self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
        self:drawText(getText("IGUI_TradingUI_Title"), self.width/2 - (getTextManager():MeasureStringX(UIFont.Medium, getText("IGUI_TradingUI_Title")) / 2), z, 1,1,1,1, UIFont.Medium);
        self:drawText(getText("IGUI_TradingUI_YourOffer"), self.yourOfferDatas.x, self.yourOfferDatas.y - 32, 1,1,1,1, UIFont.Small);
        self:drawText(getText("IGUI_TradingUI_HisOffer", getCharacterName(self.otherPlayer)), self.hisOfferDatas.x, self.hisOfferDatas.y - 32, 1,1,1,1, UIFont.Small);
        local yourItems = getText("IGUI_TradingUI_Items", #self.yourOfferDatas.items, ISTradingUI.MaxItems);
        self:drawText(yourItems, self.yourOfferDatas.x, self.yourOfferDatas.y - 20, 1,1,1,1, UIFont.Small);
        local hisItems = getText("IGUI_TradingUI_Items", #self.hisOfferDatas.items, ISTradingUI.MaxItems);
        self:drawText(hisItems, self.hisOfferDatas.x, self.hisOfferDatas.y - 20, 1,1,1,1, UIFont.Small);

        if self.otherSealedOffer then
            self:drawText(getText("IGUI_TradingUI_OtherPlayerSealedOffer", getCharacterName(self.otherPlayer)), self.sealOffer.x, self.sealOffer.y + self.sealOffer.height + 5, 0.2,1,0.2,1, UIFont.Small);
        end
        z = z + 30;
    else
        ISTradingUI_prerender(self)
    end
end

-- someone ask us to trade
local ISTradingUI_ReceiveTradeRequest = ISTradingUI.ReceiveTradeRequest
Events.RequestTrade.Remove(ISTradingUI.ReceiveTradeRequest)
function ISTradingUI.ReceiveTradeRequest(requester)
    if SandboxVars.PlayerTradeOptions.useCharacterName then
        local modal = ISModalDialog:new(getCore():getScreenWidth() / 2 - 175,getCore():getScreenHeight() / 2 - 75, 350, 150, getText("IGUI_TradingUI_RequestTrade", getCharacterName(requester)), true, nil, ISTradingUI.onAnswerTradeRequest);
        modal:initialise()
        modal:addToUIManager()
        modal.requester = requester;
        modal.moveWithMouse = true;
        ISTradingUI.tradeQuestionUI = modal;
    else
        ISTradingUI_ReceiveTradeRequest(requester)
    end
end
Events.RequestTrade.Add(ISTradingUI.ReceiveTradeRequest)

-- the other player accepted the trade!
local ISTradingUI_AcceptedTrade = ISTradingUI.AcceptedTrade
Events.AcceptedTrade.Remove(ISTradingUI.AcceptedTrade)
function ISTradingUI.AcceptedTrade(accepted)
    ISTradingUI_AcceptedTrade(accepted)

    if SandboxVars.PlayerTradeOptions.useCharacterName and ISTradingUI.instance.blockingMessage then
        ISTradingUI.instance.blockingMessage = getText("IGUI_TradingUI_RefusedTrade", getCharacterName(ISTradingUI.instance.otherPlayer));
    end
end
Events.AcceptedTrade.Add(ISTradingUI.AcceptedTrade)

-- other player has added a new item to his offer
local ISTradingUI_OtherAddNewItem = ISTradingUI.OtherAddNewItem
Events.TradingUIAddItem.Remove(ISTradingUI.OtherAddNewItem)
function ISTradingUI.OtherAddNewItem(player, item)
    if SandboxVars.PlayerTradeOptions.useCharacterName then
        if ISTradingUI.instance and ISTradingUI.instance:isVisible() then
            ISTradingUI.instance.hisOfferDatas:addItem(item:getName(), item);
            ISTradingUI.instance:setHistoryMessage(getText("IGUI_TradingUI_AddedItem", getCharacterName(player), item:getName()), true, true, false);
            ISTradingUI.instance.sealOffer.selected[1] = false;
            ISTradingUI.instance.otherSealedOffer = false;
        end
    else
        ISTradingUI_OtherAddNewItem(player, item)
    end
end
Events.TradingUIAddItem.Add(ISTradingUI.OtherAddNewItem)

-- other player removed an item from his offer
local ISTradingUI_RemoveItem = ISTradingUI.RemoveItem
Events.TradingUIRemoveItem.Remove(ISTradingUI.RemoveItem)
function ISTradingUI.RemoveItem(player, index)
    if SandboxVars.PlayerTradeOptions.useCharacterName then
        if ISTradingUI.instance and ISTradingUI.instance:isVisible() then
            local itemRemoved = ISTradingUI.instance.hisOfferDatas.items[index];
            ISTradingUI.instance.hisOfferDatas:removeItemByIndex(index);
            ISTradingUI.instance:setHistoryMessage(getText("IGUI_TradingUI_RemovedItem", getCharacterName(player), itemRemoved.item:getName()), true, false, true);
            ISTradingUI.instance.sealOffer.selected[1] = false;
            ISTradingUI.instance.otherSealedOffer = false;
        end
    else
        ISTradingUI_RemoveItem(player, index)
    end
end
Events.TradingUIRemoveItem.Add(ISTradingUI.RemoveItem)

-- other player did something on his tradeUI (closed, seal his offer, finalize deal...)
local ISTradingUI_UpdateState = ISTradingUI.UpdateState
Events.TradingUIUpdateState.Remove(ISTradingUI.UpdateState)
function ISTradingUI.UpdateState(player, state)
    if SandboxVars.PlayerTradeOptions.useCharacterName then
        if state == ISTradingUI.States.PlayerClosedWindow then
            if ISTradingUI.tradeQuestionUI and ISTradingUI.tradeQuestionUI:isVisible() then
                ISTradingUI.tradeQuestionUI:setVisible(false);
                ISTradingUI.tradeQuestionUI:removeFromUIManager();
            elseif ISTradingUI.instance and ISTradingUI.instance:isVisible() and ISTradingUI.instance.otherPlayer == player then
                ISTradingUI.instance.blockingMessage = getText("IGUI_TradingUI_ClosedTrade", getCharacterName(player));
            end
        end
        if ISTradingUI.instance and ISTradingUI.instance:isVisible() then
            if state == ISTradingUI.States.SealOffer then
                ISTradingUI.instance.otherSealedOffer = true;
                ISTradingUI.instance:setHistoryMessage(getText("IGUI_TradingUI_OtherPlayerSealedOffer", getCharacterName(ISTradingUI.instance.otherPlayer)), true, false, false);
            end
            if state == ISTradingUI.States.UnSealOffer then
                ISTradingUI.instance.otherSealedOffer = false;
                ISTradingUI.instance:setHistoryMessage(getText("IGUI_TradingUI_OtherPlayerUnSealedOffer", getCharacterName(ISTradingUI.instance.otherPlayer)), true, false, false);
            end
            if state == ISTradingUI.States.FinalizeDeal then
                ISTradingUI.instance:finalizeDeal();
            end
        end
    else
        ISTradingUI_UpdateState(player, state)
    end
end
Events.TradingUIUpdateState.Add(ISTradingUI.UpdateState)
