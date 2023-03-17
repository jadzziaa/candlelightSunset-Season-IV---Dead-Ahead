-- ************************************************
-- *********** HOTBAR ITEM USE EVENT **************
-- ************************************************

-- WARNING - TRIGGERS TOO OFTEN!

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnHotbarItemUseInitiated = false

if EggonsMU then
    EggonsMU.config.enableHotbarItemUseEvent = function()
        if not OnHotbarItemUseInitiated then
            OnHotbarItemUseInitiated = true
            -- REGISTER NEW EVENT
            LuaEventManager.AddEvent("OnHotbarItemUse")

            -- STORE VANILLA TRANSFER FUNCTION IN NEW VARIABLE
            ISHotbar.EMU_Store_equipItem = ISHotbar.equipItem

            -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR
            function ISHotbar:equipItem(item)
                -- print("OnHotbarItemUse triggered")
                local decision = {cancel = false} -- variable allows to pass instruction from event handler to cancel trasfer
                triggerEvent("OnHotbarItemUse", item)
                if decision.cancel then
                    return
                else -- EXECUTE THE VANILLA FUNCTION
                    self:EMU_Store_equipItem(item)
                end
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
