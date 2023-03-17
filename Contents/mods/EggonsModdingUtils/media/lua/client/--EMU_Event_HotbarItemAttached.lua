-- ************************************************
-- ******** HOTBAR ITEM ATTACHED EVENT ************
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnHotbarItemAttachedInitiated = false

if EggonsMU then
    EggonsMU.config.enableHotbarItemAttachedEvent = function()
        if not OnHotbarItemAttachedInitiated then -- prevent multiple registrations
            OnHotbarItemAttachedInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnHotbarItemAttached")
            LuaEventManager.AddEvent("OnHotbarItemAttached")

            ISAttachItemHotbar.EMU_Store_perform = ISAttachItemHotbar.perform
            function ISAttachItemHotbar:perform()
                -- print("OnHotbarItemAttach triggered, real? ", doAnim)
                self:EMU_Store_perform()
                local eventData = {
                    character = self.character,
                    item = self.item,
                    slot = self.slot,
                    slotIndex = self.slotIndex,
                    hotbar = self.hotbar
                }
                triggerEvent("OnHotbarItemAttached", eventData)
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
