-- ************************************************
-- ******** ON DISPLAY CONTAINER CONTENTS *********
-- ************************************************
-- REGISTRATION
local isInitiated_OnDisplayContainerContents = false
local isInitiated_OnDisplayInventoryContainerContents = false
local isInitiated_OnDisplayLootContainerContentsInitiated = false

local lastInventoryContainer = nil
local lastLootContainer = nil

local initiateEventHandler = function()
    if
        not isInitiated_OnDisplayContainerContents and not isInitiated_OnDisplayInventoryContainerContents and
            not isInitiated_OnDisplayLootContainerContentsInitiated
     then
        -- STORE VANILLA TRANSFER FUNCTION IN NEW VARIABLE
        ISInventoryPage.EMU_Store_render = ISInventoryPage.render
        -- OVERWRITE THE VANILLA FUNCTION WITH INTERCEPTOR
        ISInventoryPage.render = function(self)
            self:EMU_Store_render()
            if self.onCharacter then
                if self.inventory ~= lastInventoryContainer then
                    -- print("Displayed inventory container")
                    if isInitiated_OnDisplayContainerContents then
                        triggerEvent("OnDisplayContainerContents", self.inventory)
                    end
                    if isInitiated_OnDisplayInventoryContainerContents then
                        triggerEvent("OnDisplayInventoryContainerContents", self.inventory)
                    end
                    lastInventoryContainer = self.inventory
                end
            else
                if self.inventory ~= lastLootContainer then
                    -- print("Displayed loot container ")
                    if isInitiated_OnDisplayContainerContents then
                        triggerEvent("OnDisplayContainerContents", self.inventory)
                    end
                    if isInitiated_OnDisplayLootContainerContentsInitiated then
                        triggerEvent("OnDisplayLootContainerContents", self.inventory)
                    end
                    lastLootContainer = self.inventory
                end
            end
        end
    end
end
if EggonsMU then
    EggonsMU.enableEvent.OnDisplayContainerContents = function()
        if not isInitiated_OnDisplayContainerContents then
            -- print("Entered enabler")
            LuaEventManager.AddEvent("OnDisplayContainerContents")
            initiateEventHandler()
            -- EggonsMU.config.initiateEventHandler()
            isInitiated_OnDisplayContainerContents = true
            -- REGISTER NEW EVENT
            print("Registering OnDisplayContainerContents")
        end
    end
    EggonsMU.enableEvent.OnDisplayInventoryContainerContents = function()
        if not isInitiated_OnDisplayInventoryContainerContents then
            LuaEventManager.AddEvent("OnDisplayInventoryContainerContents")
            initiateEventHandler()
            isInitiated_OnDisplayInventoryContainerContents = true
            -- REGISTER NEW EVENT
            print("Registering OnDisplayInventoryContainerContents")
        end
    end
    EggonsMU.enableEvent.OnDisplayLootContainerContents = function()
        if not isInitiated_OnDisplayLootContainerContentsInitiated then
            LuaEventManager.AddEvent("OnDisplayLootContainerContents")
            initiateEventHandler()
            isInitiated_OnDisplayLootContainerContentsInitiated = true
            -- REGISTER NEW EVENT
            print("Registering OnDisplayLootContainerContents")
        end
    end
else
    print("ERROR! EggonsMU not present!")
end
