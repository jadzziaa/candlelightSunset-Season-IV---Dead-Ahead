require "ISUI/ISInventoryPaneContextMenu"

local function getWornMask(playerObj, isWashing)
    local wornMask = nil
    if playerObj:getWornItem("MaskEyes") then
        wornMask = playerObj:getWornItem("MaskEyes")
    elseif playerObj:getWornItem("Mask") then
        local mask = playerObj:getWornItem("Mask")
        if isWashing then
            wornMask = mask
        else
            if mask:getType() ~= "Hat_BalaclavaFace" and mask:getType() ~= "Hat_BalaclavaFull" then wornMask = mask end
        end
    elseif playerObj:getWornItem("MaskFull") then
        wornMask = playerObj:getWornItem("MaskFull")
    elseif playerObj:getWornItem("Hat") then
        local hat = playerObj:getWornItem("Hat")
        if hat:getType() == "Hat_CrashHelmetFULL" or hat:getType() == "WeldingMask" then wornMask = hat end
    elseif playerObj:getWornItem("FullHat") then
        local fullhat = playerObj:getWornItem("FullHat")
        if fullhat:getType() ~= "Hat_SPHhelmet" then wornMask = fullhat end
    end
    return wornMask
end

local function unequipMask(playerObj, isWashing)
    local mask = getWornMask(playerObj, isWashing)
    if mask then
        if not playerObj:isEquipped(mask) then return end
        ISTimedActionQueue.add(ISUnequipAction:new(playerObj, mask, 40))
        return mask
        --playerObj:Say(getText("IGUI_PlayerText_NeedTakeOffMask"))
    end
end

local function unequipHands(playerObj)
    local gloves = playerObj:getWornItem("Hands")
    if gloves then
        if not playerObj:isEquipped(gloves) then return end
        ISTimedActionQueue.add(ISUnequipAction:new(playerObj, gloves, 40))
        return gloves
    end
end

local function equipMask(playerObj, mask)
    if mask then
        ISTimedActionQueue.add(ISWearClothing:new(playerObj, mask, 50));
    end
end

local function equipHands(playerObj, gloves)
    if gloves then
        ISTimedActionQueue.add(ISWearClothing:new(playerObj, gloves, 50));
    end
end

local eatFunc = ISInventoryPaneContextMenu.eatItem
ISInventoryPaneContextMenu.eatItem = function(item, percentage, player)
    local playerObj = getSpecificPlayer(player)
    ISTimedActionQueue.clear(playerObj)
    local mask = unequipMask(playerObj, false)
    eatFunc(item, percentage, player)
    if mask then
        equipMask(playerObj, mask)
    end
end

local worldDrinkFunc = ISWorldObjectContextMenu.onDrink
ISWorldObjectContextMenu.onDrink = function(worldobjects, waterObject, player)
    local playerObj = getSpecificPlayer(player)
    ISTimedActionQueue.clear(playerObj)
    local mask = unequipMask(playerObj, false)
    worldDrinkFunc(worldobjects, waterObject, player)
    if mask then
        equipMask(playerObj, mask)
    end
end

local contextDrinkFunc = ISInventoryPaneContextMenu.onDrink
ISInventoryPaneContextMenu.onDrink = function(items, waterContainer, percentage, player)
    local playerObj = getSpecificPlayer(player)
    ISTimedActionQueue.clear(playerObj)
    local mask = unequipMask(playerObj, false)
    contextDrinkFunc(items, waterContainer, percentage, player)
    if mask then
        equipMask(playerObj, mask)
    end
end

local contextDrinkForThirstFunc = ISInventoryPaneContextMenu.onDrinkForThirst
ISInventoryPaneContextMenu.onDrinkForThirst = function(waterContainer, playerObj)
    ISTimedActionQueue.clear(playerObj)
    local mask = unequipMask(playerObj, false)
    contextDrinkForThirstFunc(waterContainer, playerObj)
    if mask then
        equipMask(playerObj, mask)
    end
end

local takePillFunc = ISInventoryPaneContextMenu.takePill
ISInventoryPaneContextMenu.takePill = function(item, player)
    local playerObj = getSpecificPlayer(player)
    ISTimedActionQueue.clear(playerObj)
    local mask = unequipMask(playerObj, false)
    takePillFunc(item, player)
    if mask then
        equipMask(playerObj, mask)
    end
end

local onWashYourselfFunc = ISWorldObjectContextMenu.onWashYourself
ISWorldObjectContextMenu.onWashYourself = function(playerObj, sink, soapList)
    ISTimedActionQueue.clear(playerObj)
    local mask = unequipMask(playerObj, true)
    local gloves = unequipHands(playerObj)
    onWashYourselfFunc(playerObj, sink, soapList)
    if mask then
        equipMask(playerObj, mask)
    end
    if gloves then
        equipHands(playerObj, gloves)
    end
end