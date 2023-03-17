-- ************************************************
-- ********* HOTBAR ITEM ATTACH EVENT *************
-- ************************************************

-- EVENT REGISTERED ONLY IF MOD TURNS IT ON FIRST
local OnBeforeFirstInventoryTooltipDisplayInitiated = false

if EggonsMU then
    EggonsMU.config.enableBeforeFirstInventoryTooltipDisplayEvent = function()
        if not OnBeforeFirstInventoryTooltipDisplayInitiated then -- prevent multiple registrations
            OnBeforeFirstInventoryTooltipDisplayInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnBeforeFirstInventoryTooltipDisplay")
            LuaEventManager.AddEvent("OnBeforeFirstInventoryTooltipDisplay")

            -- STORE VANILLA TRANSFER FUNCTION IN NEW VARIABLE
            ISToolTipInv.EMU_Store_render = ISToolTipInv.render

            -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR

            function ISToolTipInv:render()
                -- print("OnBeforeInventoryTooltipDisplay triggered")
                if (self.lastItem ~= self.item) then -- ensures the event is not retriggered unnecessarily as the render() is constantly recalled
                    self.lastItem = self.item
                    triggerEvent("OnBeforeFirstInventoryTooltipDisplay", self.item, self)
                end
                self:EMU_Store_render()
            end
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
