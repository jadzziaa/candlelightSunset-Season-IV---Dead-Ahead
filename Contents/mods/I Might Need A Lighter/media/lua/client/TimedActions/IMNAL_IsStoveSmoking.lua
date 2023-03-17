--I Might Need A Lighter Mod by Fingbel

require "TimedActions/ISBaseTimedAction"
IsStoveSmoking = ISBaseTimedAction:derive('IsStoveSmoking')

function IsStoveSmoking:isValid()
	return self.character:getInventory():contains(self.item);
end

function IsStoveSmoking:update()

	--Make progress bar move
	self.item:setJobDelta(self:getJobDelta());
	
end

function IsStoveSmoking:start()
	
	--This bypass the lighter durability drainage
	self.item:setRequireInHandOrInventory(nil)
	--Start Audio
	self.character:getEmitter():playSound("NoLighterSmoke");

	self:setAnimVariable("FoodType", self.item:getEatType());
	self.item:setJobDelta(0.0);

	self:setActionAnim("Eat");
	
	--TODO : Add an option to allow the automatic turn off of self.stove after the animation started
	
	end

function IsStoveSmoking:stop()
     self.character:getEmitter():stopAll()
	
	--Reset Progress Bar
	self.item:setJobDelta(0.0);
	
	--StopTimeBasedAction
	ISBaseTimedAction.stop(self);
	
	end

function IsStoveSmoking:perform()
	
	--Reset Progress Bar
	self.item:setJobDelta(0.0);
	
	--Eat the cigarette
	self.character:Eat(self.item, 1)
		
	--FinishTimeBasedAction
	ISBaseTimedAction.perform(self)
	
end

function IsStoveSmoking:new (character, worldobject, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.stats = character:getStats();
	o.worldobject = worldobject;
	o.item = item;
	o.maxTime = time;
	o.eatAudio = 0
	 o.eatSound = item:getCustomEatSound() or "Eating";
	o.eatType = 'cigarette'
	o.stopOnWalk = false;
	o.stopOnRun = true;
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	return o
end