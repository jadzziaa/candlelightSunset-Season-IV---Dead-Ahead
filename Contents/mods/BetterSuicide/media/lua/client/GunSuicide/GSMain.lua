local oneHandAnims = {
    "Suicide_OneHand_1",
    "Suicide_OneHand_2",
    "Suicide_OneHand_3",
}

local function actionTwoHandWeaponStart(dummy, button, playerObj, item)
    if button.internal == "NO" then return end

    ISInventoryPaneContextMenu.equipWeapon(item, true, true, playerObj:getPlayerNum())
    ISTimedActionQueue.add(SuicideActionAnim:new(playerObj, item, "Suicide_TwoHand", 0.5, 120))
end

local function actionTwoHandWeaponFunc(playerObj, item)
    local playerNum = playerObj:getPlayerNum()
	local modal = ISModalDialog:new(getCore():getScreenWidth()/2 - 350/2, getCore():getScreenHeight()/2 - 150/2, 350, 150, getText("UI_suicide_are_you_sure"),
		true, nil, actionTwoHandWeaponStart, playerNum, playerObj, item)
	modal:initialise()
	modal.prevFocus = getPlayerMechanicsUI(playerNum)
	modal.moveWithMouse = true
	modal:addToUIManager()
	if JoypadState.players[playerNum+1] then
		setJoypadFocus(playerNum, modal)
	end
end

local function actionOneHandWeaponStart(dummy, button, playerObj, item)
    if button.internal == "NO" then return end

    ISInventoryPaneContextMenu.equipWeapon(item, true, false, playerObj:getPlayerNum())
    ISTimedActionQueue.add(SuicideActionAnim:new(playerObj, item, oneHandAnims[1 + ZombRand(3)], 0.35, 100))
end

local function actionOneHandWeaponFunc(playerObj, item)
    local playerNum = playerObj:getPlayerNum()
	local modal = ISModalDialog:new(getCore():getScreenWidth()/2 - 350/2, getCore():getScreenHeight()/2 - 150/2, 350, 150, getText("UI_suicide_are_you_sure"),
		true, nil, actionOneHandWeaponStart, playerNum, playerObj, item)
	modal:initialise()
	modal.prevFocus = getPlayerMechanicsUI(playerNum)
	modal.moveWithMouse = true
	modal:addToUIManager()
	if JoypadState.players[playerNum+1] then
		setJoypadFocus(playerNum, modal)
	end
end

--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 

local function addNoAmmoTooltip(option)
    local toolTip = ISToolTip:new();
    toolTip:initialise();
    --toolTip:setVisible(false);
    option.toolTip = toolTip;
    toolTip:setName(getText("UI_Suicide"));
    toolTip.description = getText("UI_no_Ammo")
end

local function suicideContextMenu(player, context, items)
    local playerObj = getSpecificPlayer(player)

    items = ISInventoryPane.getActualItems(items)
    for _, item in ipairs(items) do
        if instanceof(item, "HandWeapon") and item:isAimedFirearm() then
            local option = nil
            if item:isRequiresEquippedBothHands() then
                option = context:addOption(getText("UI_Suicide"), playerObj, actionTwoHandWeaponFunc, item); 
            else
                option = context:addOption(getText("UI_Suicide"), playerObj, actionOneHandWeaponFunc, item);   
            end

            if item:haveChamber() and not item:isRoundChambered() then
                addNoAmmoTooltip(option)
                option.notAvailable = true;
            end
            if not item:haveChamber() and item:getCurrentAmmoCount() == 0 then
                addNoAmmoTooltip(option)
                option.notAvailable = true;
            end
        end
	end
end
Events.OnFillInventoryObjectContextMenu.Add(suicideContextMenu);
