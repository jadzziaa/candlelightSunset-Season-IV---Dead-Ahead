


local function getTinkeringItem(player, item)

    -- print(FixingManager.getFixes(getPlayer():getPrimaryHandItem()):get(0):getFixers():size())
    local fixingList = FixingManager.getFixes(item)
    local tinkerCost = SandboxVars.WeaponModifiers.TinkerCost
    if fixingList then
        for i=0,fixingList:size()-1 do
            local fixing = fixingList:get(i)
            for j=0,fixing:getFixers():size()-1 do
                local fixer = fixing:getFixers():get(j);
                
                if fixer then 
                    local fixerItems = player:getInventory():getItemsFromType(fixer:getFixerName())
                    if fixerItems and fixerItems:size()>0 then
                        for k=0,fixerItems:size()-1 do
                            local fixerItem = fixerItems:get(k)
                            local fixerItemType = fixerItem:getType()
                            local itemCost = 1
                            if fixerItemType == item:getType() then break; end
                            if TinkerItemQuantityNecessary[fixerItemType] then
                                itemCost = TinkerItemQuantityNecessary[fixerItemType]*tinkerCost
                            else
                                itemCost = tinkerCost
                            end
                            if (fixerItem:IsDrainable() and fixerItem:getDrainableUsesInt() >= itemCost) then
                                return fixerItem; 
                            elseif (not fixerItem:IsDrainable() and player:getInventory():getItemCount(fixerItemType) >= itemCost) then
                                return fixerItem; 
                            end
                        end
                    end
                end
            end
        end
    end
    -- if no fixer item found : use ducttape, scotchtape, wood glue or glue.
    local tinkeringItem
    for k, v in pairs(PossibleTinkeringItems) do
        tinkeringItem = player:getInventory():getItemFromType(v)
        if tinkeringItem then 
            local tinkeringItemType = tinkeringItem:getType()
            local itemCost = 1
            if TinkerItemQuantityNecessary[tinkeringItemType] then
                itemCost = TinkerItemQuantityNecessary[tinkeringItemType]*tinkerCost
            else
                itemCost = tinkerCost
            end
            if (tinkeringItem:IsDrainable() and tinkeringItem:getDrainableUsesInt() >= itemCost) then
                return tinkeringItem; 
            elseif (not tinkeringItem:IsDrainable() and player:getInventory():getItemCount(tinkeringItemType) >= itemCost) then
                return tinkeringItem; 
            end
        end
    end

    return nil;
end

ISInventoryPaneContextMenu.onReforge = function (playerObj, item, tinkeringItem)

    local playerInventory = playerObj:getInventory()
    
    -- local tinkeringItem = getTinkeringItem(playerInventory)

    if tinkeringItem then
        ISInventoryPaneContextMenu.equipWeapon(item, true, false, playerObj:getPlayerNum())
        ISInventoryPaneContextMenu.transferIfNeeded(playerObj, tinkeringItem)
        ISTimedActionQueue.add(ISReforgeAction:new(playerObj, item, tinkeringItem));
    else
        return;
    end
end

local function addReforgeOption(playerNum, context, items)
    local player = getSpecificPlayer(playerNum)
    local item
    local tinkerOption = nil
    if items[1].items then
        item = items[1].items[1]
    else -- if right-clicked in hotbar
        item = items[1]
    end
    if instanceof(item, "HandWeapon") and (not SandboxVars.WeaponModifiers.IgnoreIrrelevantWeapons or not WeaponModifiersManager.IrrelevantWeapons[item:getScriptItem():getFullName()])
    and (not item:isRanged() or (SandboxVars.WeaponModifiers.RangedWeaponsTinkerable and not getActivatedMods():contains("WeaponModifiersRealistic")))
        then
        local playerInventory = player:getInventory()
        local tinkeringItem = getTinkeringItem(player, item)
        -- local tooltip = ISInventoryPaneContextMenu.addToolTip();
        -- tooltip:setName("Tinker weapon")
        -- tooltip.texture = item:getTex();



        if  not tinkeringItem or not (player:isRecipeKnown("Tinker") or ( player:getPerkLevel(Perks.Tinkering) > 2 and player:getPerkLevel(Perks.Maintenance) > 2)) then
            tinkerOption = context:addOption(getText("ContextMenu_Tinker"), player, ISInventoryPaneContextMenu.onReforge, item)
            tinkerOption.notAvailable = true
            -- tooltip.description = "Needs a Tinkering Item"
        else
            local tinkeringItemType = tinkeringItem:getType()
            if TinkerItemQuantityNecessary[tinkeringItemType] then
                tinkerOption = context:addOption(getText("ContextMenu_TinkerWith").." "..TinkerItemQuantityNecessary[tinkeringItemType]*SandboxVars.WeaponModifiers.TinkerCost.." "..tinkeringItem:getName(), player, ISInventoryPaneContextMenu.onReforge, item, tinkeringItem)
            else
                tinkerOption = context:addOption(getText("ContextMenu_TinkerWith").." "..SandboxVars.WeaponModifiers.TinkerCost.." "..tinkeringItem:getName(), player, ISInventoryPaneContextMenu.onReforge, item, tinkeringItem)
            end
            
            tinkerOption.notAvailable = false
            -- tooltip.description = "Consumes a Tinkering Item"
        end

        -- tinkerOption.tooltip = tooltip

    end
end
Events.OnFillInventoryObjectContextMenu.Add(addReforgeOption)

