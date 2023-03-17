-- ************************************************
-- ************* ITEM TRANSFER EVENT **************
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local isInitiated_OnItemTransfer = false

if EggonsMU then
    EggonsMU.enableEvent.OnItemTransfer = function()
        if not isInitiated_OnItemTransfer then
            isInitiated_OnItemTransfer = true
            -- REGISTER NEW EVENT
            print("Registering OnItemTransfer")
            LuaEventManager.AddEvent("OnItemTransfer")

            -- STORE VANILLA TRANSFER FUNCTION IN NEW VARIABLE
            ISInventoryTransferAction.EMU_Store_TransferAction = ISInventoryTransferAction.new

            -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR
            function ISInventoryTransferAction:new(character, item, srcContainer, destContainer, time)
                -- print("OnItemTransfer triggered")
                local decision = {cancel = false} -- variable allows to pass instruction from event handler to cancel trasfer
                triggerEvent("OnItemTransfer", item, srcContainer, destContainer, decision)
                local newDestination
                if decision.cancel then -- action is 'cancelled' by destination container being same as source one
                    newDestination = srcContainer
                else
                    newDestination = decision.destContainer or destContainer
                end

                -- EXECUTE THE VANILLA FUNCTION
                return ISInventoryTransferAction:EMU_Store_TransferAction(
                    character,
                    item,
                    srcContainer,
                    newDestination,
                    time
                )
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
