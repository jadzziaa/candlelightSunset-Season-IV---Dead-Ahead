EggonsMU = EggonsMU or {}
EggonsMU.config = {}
EggonsMU.enableEvent = {}
EggonsMU.functions = {}

EggonsMU.config.enableEvent = function(eventName)
    local config = {
        OnAfterItemTransfer = "enableAfterItemTransferEvent",
        OnBeforeFirstInventoryTooltipDisplay = "enableBeforeFirstInventoryTooltipDisplayEvent",
        OnBeforeItemTransfer = "enableBeforeItemTransferEvent",
        OnBeforeOpenHood = "enableBeforeOpenHoodEvent",
        OnHotbarItemAttach = "enableHotbarItemAttachEvent",
        OnHotbarItemAttached = "enableHotbarItemAttachedEvent",
        OnHotbarItemUnattach = "enableHotbarItemUnattachEvent"
        -- OnItemTransfer = "enableItemTransferEvent"
    }
    local enableFuntionName = config[eventName]
    if enableFuntionName then
        EggonsMU.config[enableFuntionName]()
    else
        EggonsMU.enableEvent[eventName]()
    end
end
