--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISActivateTrailerGenerator = ISBaseTimedAction:derive("ISActivateTrailerGenerator");

function ISActivateTrailerGenerator:isValid()
	if self.activate == self.generator:isActivated() then return false end
	if self.activate and not self.generator:isConnected() then
		return false
	end
	return self.generator:getObjectIndex() ~= -1
end

function ISActivateTrailerGenerator:waitToStart()
	self.character:faceThisObject(self.generator)
	return self.character:shouldBeTurning()
end

function ISActivateTrailerGenerator:update()
	self.character:faceThisObject(self.generator)
end

function ISActivateTrailerGenerator:start()
	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
end

function ISActivateTrailerGenerator:stop()
    ISBaseTimedAction.stop(self);
end

function ISActivateTrailerGenerator:perform()
	local fuelAmount = self.trailer:getPartById("GasTank"):getContainerContentAmount()/self.trailer:getPartById("GasTank"):getContainerCapacity() * 100
	self.generator:setFuel(fuelAmount)
	if self.generator:getCondition() < 1 or self.generator:getFuel() <= 0 or self.activate and self.generator:getCondition() <= 50 and ZombRand(3) == 0 then
		self.generator:failToStart()
	else
		-- self.generator:setActivated(self.activate)
		sendClientCommand(self.character, 'trailer', 'startGeneratorEngine', {trailer=self.trailer:getId(), activate = self.activate})
		-- if self.activate then
			-- self.trailer:engineDoRunning()
		-- else
			-- self.trailer:shutOff()
		-- end	
	end

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISActivateTrailerGenerator:new(character, trailer, generator, activate, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = getSpecificPlayer(character);
	o.activate = activate;
	o.trailer = trailer;
	o.generator = generator;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	if o.character:isTimedActionInstant() then
		o.maxTime = 1
	end
	return o;
end
