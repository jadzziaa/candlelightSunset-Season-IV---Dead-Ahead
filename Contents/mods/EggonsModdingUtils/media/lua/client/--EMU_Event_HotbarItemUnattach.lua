-- ************************************************
-- ********** HOTBAR ITEM UNATTACH EVENT **********
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnHotbarItemUnattachInitiated = false

if EggonsMU then
    EggonsMU.config.enableHotbarItemUnattachEvent = function()
        if not OnHotbarItemUnattachInitiated then -- prevent multiple registrations
            OnHotbarItemUnattachInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnHotbarItemUnattach")
            LuaEventManager.AddEvent("OnHotbarItemUnattach")

            -- STORE VANILLA TRANSFER FUNCTION IN NEW VARIABLE
            ISHotbar.EMU_Store_removeItem = ISHotbar.removeItem

            -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR
            function ISHotbar:removeItem(item)
                -- print("OnHotbarItemUnattach triggered")
                triggerEvent("OnHotbarItemUnattach", item)
                self:EMU_Store_removeItem(item)
            end

            -- THIS WOULD WORK ONLY FOR DETACHES WITH DOANIM, BUT NOT ALL ARE SUCH
            -- LuaEventManager.AddEvent("OnHotbarItemDetached")
            -- ISDetachItemHotbar.EMU_Store_perform = ISDetachItemHotbar.perform
            -- function ISDetachItemHotbar:perform()
            --     -- print("OnHotbarItemAttach triggered, real? ", doAnim)
            --     print('Detached called');
            --     self:EMU_Store_perform()
            --     local eventData = {
            --         character = self.character,
            --         item = self.item,
            --         hotbar = self.hotbar
            --     }
            --     triggerEvent("OnHotbarItemDetached", eventData)
            -- end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
