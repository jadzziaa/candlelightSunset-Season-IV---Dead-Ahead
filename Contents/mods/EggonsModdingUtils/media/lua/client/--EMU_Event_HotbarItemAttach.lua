-- ************************************************
-- ********* HOTBAR ITEM ATTACH EVENT *************
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnHotbarItemAttachInitiated = false

if EggonsMU then
    EggonsMU.config.enableHotbarItemAttachEvent = function()
        if not OnHotbarItemAttachInitiated then -- prevent multiple registrations
            OnHotbarItemAttachInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnHotbarItemAttach")
            LuaEventManager.AddEvent("OnHotbarItemAttach")

            -- STORE VANILLA TRANSFER FUNCTION IN NEW VARIABLE
            ISHotbar.EMU_Store_attachItem = ISHotbar.attachItem

            -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR

            function ISHotbar:attachItem(item, slot, slotIndex, slotDef, doAnim)
                -- print("OnHotbarItemAttach triggered, real? ", doAnim)
                self:EMU_Store_attachItem(item, slot, slotIndex, slotDef, doAnim)
                triggerEvent("OnHotbarItemAttach", item, slot, slotIndex, slotDef, doAnim)
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
