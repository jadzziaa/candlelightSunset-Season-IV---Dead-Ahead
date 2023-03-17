-- ************************************************
-- ********** AFTER ITEM TRANSFER EVENT ***********
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnAfterItemTransferInitiated = false

if EggonsMU then
    EggonsMU.config.enableAfterItemTransferEvent = function()
        if not OnAfterItemTransferInitiated then
            OnAfterItemTransferInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnAfterItemTransfer")
            LuaEventManager.AddEvent("OnAfterItemTransfer")

            -- STORE VANILLA TRANSFER FUNCTION IN NEW VARIABLE
            ISInventoryTransferAction.EMU_Store_perform = ISInventoryTransferAction.perform

            -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR
            function ISInventoryTransferAction:perform()
                if #self.queueList > 0 then -- perform() removes item from the beginning of queue and runs one emty perform at the end
                    local itemsStack = self.queueList[1].items
                    -- if #self.queueList[1].items > 1 then
                    --     EggonsMU.printFuckingNormalObject(self.queueList[1].items, "items")
                    -- end
                    self:EMU_Store_perform()
                    -- print("OnAfterItemTransfer triggered")
                    if not self.hasBeenCancelled then -- prevents from triggering if cancelled by the BeforeItemTransfer
                        for i, item in ipairs(itemsStack) do
                            -- print("TRIGGERING, item type ", item:getType(), " ref ", item)
                            triggerEvent(
                                "OnAfterItemTransfer",
                                self.character,
                                item,
                                self.srcContainer,
                                self.destContainer
                            )
                        end
                    end
                else
                    self:EMU_Store_perform()
                end
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
