--I Might Need A Lighter Mod by Fingbel

require "TimedActions/ISBaseTimedAction"

IsCarSmoking = ISBaseTimedAction:derive('IsCarSmoking')

function IsCarSmoking:isValid()
	return self.character:getInventory():contains(self.item);
end

function IsCarSmoking:update()

	--Make progress bar move
	self.item:setJobDelta(self:getJobDelta());
	
     if self.eatAudio ~= 0 and not self.character:getEmitter():isPlaying(self.eatAudio) then
         self.eatAudio = self.character:getEmitter():playSound(self.eatSound);
     end
end

function IsCarSmoking:start()
	--This bypass the lighter durability drainage
	self.item:setRequireInHandOrInventory(nil)
	
	--Start Audio
	if self.eatSound ~= '' then
         self.eatAudio = self.character:getEmitter():playSound(self.eatSound);
	end
	self.item:setJobDelta(0.0);
	
	end

function IsCarSmoking:stop()
    --Stop Audio
   		if self.eatAudio ~= 0 and self.character:getEmitter():isPlaying(self.eatAudio) then
		self.character:stopOrTriggerSound(self.eatAudio);
	end
	
	--Reset Progress Bar
	self.item:setJobDelta(0.0);
	
	--StopTimeBasedAction
	ISBaseTimedAction.stop(self);
	
	end

function IsCarSmoking:perform()
	--Stop Audio
	if self.eatAudio ~= 0 and self.character:getEmitter():isPlaying(self.eatAudio) then
        self.character:stopOrTriggerSound(self.eatAudio);
    end
	
	--Reset Progress Bar
	self.item:setJobDelta(0.0);
	self.character:Eat(self.item, 1)
	
	--FinishTimeBasedAction
	ISBaseTimedAction.perform(self)
	
end

function IsCarSmoking:new (character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.maxTime = time;
	o.eatSound ="Smoke";
	o.eatAudio = 0;
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	return o
end