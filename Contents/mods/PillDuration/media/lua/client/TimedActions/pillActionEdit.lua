--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISTakePillAction"
require "floatingInfoWindow"

local oldISTakePillAction_perform = ISTakePillAction.perform
function ISTakePillAction:perform()
    --self.item:getContainer():setDrawDirty(true);
    --self.item:setJobDelta(0.0);
    --self.character:getBodyDamage():JustTookPill(self.item);
	--ISBaseTimedAction.perform(self);
	oldISTakePillAction_perform(self)
	updatePillInfoWindow();
end