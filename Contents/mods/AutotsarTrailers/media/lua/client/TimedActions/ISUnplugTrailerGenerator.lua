--***********************************************************
--**                    	 iBrRus                        **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISUnplugTrailerGenerator = ISBaseTimedAction:derive("ISUnplugTrailerGenerator");

function ISUnplugTrailerGenerator:isValid()
	return true
end

function ISUnplugTrailerGenerator:waitToStart()
	self.character:faceThisObject(self.trailer)
	return self.character:shouldBeTurning()
end

function ISUnplugTrailerGenerator:update()
	self.character:faceThisObject(self.trailer)
end

function ISUnplugTrailerGenerator:start()
	-- print("ISUnplugTrailerGenerator")
	-- self.generator = self.trailer:getModData()["generatorObject"]
	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
end

function ISUnplugTrailerGenerator:stop()
    ISBaseTimedAction.stop(self);
end

function ISUnplugTrailerGenerator:perform()
	-- self.trailer:setMass(1000)
	sendClientCommand(self.character, 'trailer', 'deleteGenerator', {trailer = self.trailer:getId(), })
	ISBaseTimedAction.perform(self);
end

function ISUnplugTrailerGenerator:new(character, trailer, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.trailer = trailer;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end
