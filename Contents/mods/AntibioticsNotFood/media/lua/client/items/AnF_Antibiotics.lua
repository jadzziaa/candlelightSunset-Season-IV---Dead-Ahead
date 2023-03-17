require "ISUI/ISToolTip"
require "TimedActions/ISBaseTimedAction"

local transferIfNeeded = function(playerObj, item)
    if instanceof(item, "InventoryItem") then
        if luautils.haveToBeTransfered(playerObj, item) then
            if not luautils.walkToContainer(item:getContainer(), playerObj:getPlayerNum()) then
                return
            end
            ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
        end
    elseif instanceof(item, "ArrayList") then
        local items = item;
        for i=1,items:size() do
            local item = items:get(i-1)
            if luautils.haveToBeTransfered(playerObj, item) then
                if not luautils.walkToContainer(item:getContainer(), playerObj:getPlayerNum()) then
                    return;
                end
                ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
            end
        end
    end
end

local isAntibiotics = function(item)
    local itemType = item:getType();

    if not itemType then
        return false;
    end

    if itemType == "Antibiotics" then
        return true;
    end

    return false;
end

local takePills = function(playerObj, item)
    transferIfNeeded(playerObj, item)
    local takePillsAction = ISTakePillAction:new(playerObj, item, 165);
    ISTimedActionQueue.add(takePillsAction);
end

local addContext = function(playerObj, context, item)
    local option = context:addOption(getText("ContextMenu_Take_pills"), playerObj, takePills, item);
end

local onTakePillActionCompleted = function (playerObj, item)
    if not item then return end;
    if item:getReduceInfectionPower() > 0 then
        playerObj:setReduceInfectionPower(item:getReduceInfectionPower());
    end
    if item:getType() == "Antibiotics" then
        item:Use();
    end
end

local onFillInventoryObjectContextMenu = function(_playerNum, context, items)
	local playerObj = getSpecificPlayer(_playerNum);
    local mostUsedAntibiotics = nil;

    -- TODO: refactor this shitty loop.
    for _, v in pairs(items) do
        if instanceof(v, "InventoryItem") then
            if isAntibiotics(v) then
                if not mostUsedAntibiotics then
                    mostUsedAntibiotics = v;
                elseif v:getDrainableUsesInt() < mostUsedAntibiotics:getDrainableUsesInt() then
                    mostUsedAntibiotics = v;
                end
            end
        elseif not instanceof(v, "InventoryItem") and v.items
                and #v.items > 1 then
            for _, j in pairs(v.items) do
                if isAntibiotics(j) then
                    if not mostUsedAntibiotics then
                        mostUsedAntibiotics = j;
                    elseif j:getDrainableUsesInt() < mostUsedAntibiotics:getDrainableUsesInt() then
                        mostUsedAntibiotics = j;
                    end
                end
            end
        end
    end

    if mostUsedAntibiotics then
        addContext(playerObj, context, mostUsedAntibiotics);
    end
    
end

Events.OnTakePillActionCompleted.Add(onTakePillActionCompleted)
Events.OnFillInventoryObjectContextMenu.Add(onFillInventoryObjectContextMenu);