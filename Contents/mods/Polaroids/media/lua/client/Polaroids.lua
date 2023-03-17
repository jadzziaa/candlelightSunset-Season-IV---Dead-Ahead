Polaroids = Polaroids or {}

function Polaroids.TakePhoto(playerObj, item)
    ISTimedActionQueue.add(Polaroids.TakePhotoAction:new(playerObj, item))
end

function Polaroids.PrintPolaroid(player, item)
    local width = 280
    local height = 180
    local modal = ISTextBox:new(0, 0, width, height, getText("ContextMenu_Polaroids_EnterPhotoUrl"), "", nil, Polaroids.PrintPolaroidSubmit, player, getSpecificPlayer(player), item)
    modal:setValidateFunction(nil, Polaroids.PrintPolaroidValidate)
    modal:setValidateTooltipText(getText("ContextMenu_Polaroids_EnterPhotoUrl_Invalid"))
    
    modal.x = (getCore():getScreenWidth() / 2) - (width / 2)
    modal:setX(modal.x)
    modal.y = (getCore():getScreenHeight() / 2) - (height / 2)
    modal:setY(modal.y)
    modal:initialise()
    modal:addToUIManager()
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end

function Polaroids.PrintPolaroidValidate(target, text)
    return text ~= nil and (text:sub(1, 7) == "http://" or text:sub(1, 8) == "https://")
end

function Polaroids.PrintPolaroidSubmit(target, button, playerObj, item)
    local player = playerObj:getPlayerNum()
    if button.internal == "OK" then
        playerObj:playSound("PrintPhoto");
        local text = button.parent.entry:getText()
        if text and text ~= "" then
            local polaroid = InventoryItemFactory.CreateItem("Polaroids.Polaroid")
            polaroid:getModData()["url"] = text
            playerObj:getInventory():AddItem(polaroid)
        end
    end
    if JoypadState.players[player+1] then
        setJoypadFocus(player, getPlayerInventory(player))
    end
end

function Polaroids.ViewPhoto(playerObj, item)
    local url = item:getModData()["url"]
    if url and url ~= "" then
        if isSteamOverlayEnabled() then
            activateSteamOverlayToWebPage(url)
        elseif isDesktopOpenSupported() then
            openUrl(url)
        else
            Clipboard.setClipboard(url)
            playerObj:setHaloNote("Photo URL copied to clipboard", 220, 220, 220, 100)
        end
    end
end

function Polaroids.RenamePhoto(player, item)
    local width = 280
    local height = 180
    local modal = ISTextBox:new(0, 0, width, height, getText("ContextMenu_Polaroids_NameThisPhoto"), item:getName(), nil, Polaroids.RenamePhotoSubmit, player, getSpecificPlayer(player), item);
    modal.x = (getCore():getScreenWidth() / 2) - (width / 2)
    modal:setX(modal.x)
    modal.y = (getCore():getScreenHeight() / 2) - (height / 2)
    modal:setY(modal.y)
    modal:initialise()
    modal:addToUIManager()
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end

function Polaroids.RenamePhotoSubmit(target, button, playerObj, item)
    local player = playerObj:getPlayerNum()
    if button.internal == "OK" then
        local text = button.parent.entry:getText()
        if text and text ~= "" then
            item:setName(text)
            local pdata = getPlayerData(player)
            pdata.playerInventory:refreshBackpacks()
            pdata.lootInventory:refreshBackpacks()
        end
    end
    if JoypadState.players[player+1] then
        setJoypadFocus(player, getPlayerInventory(player))
    end
end

function Polaroids.PolaroidItemOptions(player, context, items)
    local playerObj = getSpecificPlayer(player)
    local polaroidCamera = nil
    local polaroid = nil
    local camera = nil
    local c = 0
    items = ISInventoryPane.getActualItems(items)
    for i,item in ipairs(items) do
        if item:getType() == "PolaroidCamera" then
            polaroidCamera = item
            camera = item
        elseif item:getType() == "Polaroid" then
            polaroid = item
        elseif item:getType() == "Camera" or item:getType() == "CameraDisposable" or item:getType() == "CameraExpensive" then
            camera = item
        end
        if c > 0 then
            polaroid = nil
        end
        c = c + 1
    end

    if camera then
        context:addOption(getText("ContextMenu_Polaroids_TakePhoto"), playerObj, Polaroids.TakePhoto, camera)
    end
    if polaroidCamera then
        context:addOption(getText("ContextMenu_Polaroids_PrintPolaroid"), player, Polaroids.PrintPolaroid, polaroidCamera)
    end
    if polaroid then
        context:addOption(getText("ContextMenu_Polaroids_ViewPhoto"), playerObj, Polaroids.ViewPhoto, polaroid)
        context:addOption(getText("ContextMenu_Polaroids_RenamePhoto"), player, Polaroids.RenamePhoto, polaroid);
    end
end

Events.OnFillInventoryObjectContextMenu.Add(Polaroids.PolaroidItemOptions)