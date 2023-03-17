-- ************************************************
-- ********** AFTER ITEM TRANSFER EVENT ***********
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnBeforeItemTransferInitiated = false

if EggonsMU then
    EggonsMU.config.enableBeforeItemTransferEvent = function()
        if not OnBeforeItemTransferInitiated then
            OnBeforeItemTransferInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnBeforeItemTransfer")
            LuaEventManager.AddEvent("OnBeforeItemTransfer")

            -- VANILLA OBJECT DOES NOT HAVE waitToStart - NO NEED TO STORE IT
            function ISInventoryTransferAction:waitToStart()
                local eventData = {
                    cancel = false,
                    character = self.character,
                    destContainer = self.destContainer,
                    item = self.item,
                    srcContainer = self.srcContainer
                }
                triggerEvent(
                    "OnBeforeItemTransfer",
                    eventData
                )
                if eventData.cancel then
                    self.maxTime = -1
                    self.destContainer = self.srcContainer
                    self.hasBeenCancelled = true
                    return false
                end
                self.destContainer = eventData.destContainer or self.destContainer
                -- print("OnBeforeItemTransfer triggered")
                return false
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
