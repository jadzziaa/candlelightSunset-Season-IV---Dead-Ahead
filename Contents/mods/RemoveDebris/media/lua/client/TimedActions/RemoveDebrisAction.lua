require('TimedActions/ISBaseTimedAction');

RemoveDebrisAction = ISBaseTimedAction:derive("RemoveDebrisAction");

function RemoveDebrisAction:isValid()
	local playerInv = self.character:getInventory()
	return playerInv:contains("HandShovel");
end

function RemoveDebrisAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function RemoveDebrisAction:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	self.spriteFrame = self.character:getSpriteDef():getFrame()
    	self.character:setMetabolicTarget(Metabolics.DiggingSpade);
end

function RemoveDebrisAction:start()
	self:setActionAnim(ISFarmingMenu.getShovelAnim(self.character:getPrimaryHandItem()))
    	self.sound = self.character:getEmitter():playSound("Shoveling")
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)
	self.character:reportEvent("EventRemoveDebris");
end

function RemoveDebrisAction:stop()
    if self.sound ~= 0 and self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound);
    end
    ISBaseTimedAction.stop(self);
end

function RemoveDebrisAction:perform()
	if self.sound ~= 0 and self.character:getEmitter():isPlaying(self.sound) then
        	self.character:getEmitter():stopSound(self.sound);
	end		
	local sq = self.square;
	local args = { x = self.square:getX(), y = self.square:getY(), z = self.square:getZ() }
    	sendClientCommand(self.character, 'RemoveDebris', 'RemoveDebrisCommand', args)
    	    
	ISBaseTimedAction.perform(self);
end

function RemoveDebrisAction:new(character, square, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.square = square
	o.stopOnWalk = true
	o.stopOnRun = true
	o.maxTime = 100
	o.caloriesModifier = 5;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end
