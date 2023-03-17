--I Might Need A Lighter Mod by Fingbel

require "TimedActions/ISBaseTimedAction"


IsCarLighting = ISBaseTimedAction:derive('IsCarLighting')

function IsCarLighting:isValid()
	return self.character:getInventory():contains(self.item);
end

function IsCarLighting:start()
	--This bypass the lighter durability drainage
	self.item:setRequireInHandOrInventory(nil)
	
	--Start Audio
	self.character:getEmitter():playSound("CarLighter_PlugIn");
end

function IsCarLighting:stop()
	
	--Start audio
	self.character:getEmitter():playSound("CarLighter_PlugOut");

	--StopTimeBasedAction
	ISBaseTimedAction.stop(self);	
end

function IsCarLighting:perform()
	
	self.character:getEmitter():playSound("CarLighter_PlugOut");
	battery = self.character:getVehicle():getBattery():getInventoryItem()
	battery:setUsedDelta(battery:getUsedDelta() -0.03)

	--FinishTimeBasedAction
	ISBaseTimedAction.perform(self)
end

function IsCarLighting:new (character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.maxTime = time;
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	return o
end