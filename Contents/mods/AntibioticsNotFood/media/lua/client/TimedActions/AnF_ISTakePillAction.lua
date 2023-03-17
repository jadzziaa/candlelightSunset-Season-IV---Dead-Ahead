require "TimedActions/ISBaseTimedAction"

-- I decided to put the logic into an event to avoid multiple calls
-- to the "self.item:Use()" method due to override this method by other mods.
-- But, you can now use this event if you wish.
local old_ISTakePillAction_Perform = ISTakePillAction.perform;
function ISTakePillAction:perform()
    old_ISTakePillAction_Perform(self);
    LuaEventManager.triggerEvent("OnTakePillActionCompleted", self.character, self.item);
end