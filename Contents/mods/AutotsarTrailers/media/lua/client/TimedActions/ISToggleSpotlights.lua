require "TimedActions/ISBaseTimedAction"

ISToggleSpotlights = ISBaseTimedAction:derive("ISToggleSpotlights");

function ISToggleSpotlights:isValid()
    return true;
end

function ISToggleSpotlights:start()
end

function ISToggleSpotlights:stop()
    ISBaseTimedAction.stop(self);
end

function ISToggleSpotlights:perform()
    --self.item:ToggleWindow(self.character);
	sendClientCommand(self.character, 'trailer', 'setHeadlightsOn', {trailer = self.trailer:getId(), on = not self.trailer:getHeadlightsOn() })
	self.trailer:getSquare():playSound("LightSwitch")
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISToggleSpotlights:new(character, trailer, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.trailer = trailer;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
    return o;
end
