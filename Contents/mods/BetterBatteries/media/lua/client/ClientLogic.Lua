require "TimedActions/ISChargeBattery"

function BetterBatteries.doChargeAction(item, player)
    local char = getSpecificPlayer(player)
    ISWorldObjectContextMenu.equip(char, char:getPrimaryHandItem(), item, true, false);
    ISTimedActionQueue.add(ISChargeBattery:new(getSpecificPlayer(player), item));
end

function BetterBatteries.doChargeMenu(player, context, items)
    for i,v in ipairs(items) do
        local item = v;
        if not instanceof(v, "InventoryItem") then
            item = v.items[1];
        end

        if item:hasTag("HandCrank") then
            local chargeOption = context:addOption(getText("ContextMenu_Crank_ChargeWith").." "..item:getDisplayName(), item, BetterBatteries.doChargeAction, player);
            local batteryRemoved = item:getModData().batteryRemoved
            local fullBattery = item:getUsedDelta() >= SandboxVars.BetterBatteries.MaximumCharge
            local isExhausted = getSpecificPlayer(player):getMoodles():getMoodleLevel(MoodleType.Endurance) >= 4
            if batteryRemoved or fullBattery or isExhausted then
                chargeOption.notAvailable = true;

                local chargeTooltip = ISInventoryPaneContextMenu.addToolTip()
                chargeTooltip.description =  batteryRemoved and getText("ContextMenu_Crank_NeedBattery") or (getText(fullBattery and "ContextMenu_Crank_FullBattery" or "ContextMenu_Crank_LowStam"))
                chargeOption.toolTip = chargeTooltip
            end
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(BetterBatteries.doChargeMenu);