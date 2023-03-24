
local function OnFillWorldObjectContextMenu(player, context, worldobjects, test)
    local playerObj = getSpecificPlayer(player)

    if clickedPlayer and clickedPlayer ~= playerObj then
        local optionName = getText("ContextMenu_Trade", clickedPlayer:getDisplayName());
        local optionTrade = context:getOptionFromName(optionName);
        
        if SandboxVars.PlayerTradeOptions.useCharacterName then
            local characterName = clickedPlayer:getDescriptor():getForename() .. " " .. clickedPlayer:getDescriptor():getSurname();
            optionTrade.name = getText("ContextMenu_Trade", characterName);
            if optionTrade.toolTip then
                optionTrade.toolTip.description = getText("ContextMenu_GetCloserToTrade", characterName);
            end
        end

        if SandboxVars.PlayerTradeOptions.disabled then
            optionTrade.name = getText("ContextMenu_PlayerTradeOptions_Disabled")
            optionTrade.onSelect = nil;
            optionTrade.notAvailable = true;
            optionTrade.toolTip = nil
        end
    end
end
Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)
