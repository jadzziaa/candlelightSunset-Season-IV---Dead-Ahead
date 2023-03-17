-- ************************************************
-- ****************** OPEN HOOD EVENT *************
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnBeforeOpenHoodInitiated = false

if EggonsMU then
    EggonsMU.config.enableBeforeOpenHoodEvent = function()
        if not OnBeforeOpenHoodInitiated then -- prevent multiple registrations
            OnBeforeOpenHoodInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnBeforeOpenHood")
            LuaEventManager.AddEvent("OnBeforeOpenHood")

            -- STORE VANILLA PERFORM FUNCTION IN NEW VARIABLE
            ISOpenMechanicsUIAction.EMU_Store_perform = ISOpenMechanicsUIAction.perform

            -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR
            function ISOpenMechanicsUIAction:perform()
                -- print("OnBeforeInventoryTooltipDisplay triggered")
                triggerEvent("OnBeforeOpenHood", self.vehicle, self.character, self.usedHood)
                self:EMU_Store_perform()
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
