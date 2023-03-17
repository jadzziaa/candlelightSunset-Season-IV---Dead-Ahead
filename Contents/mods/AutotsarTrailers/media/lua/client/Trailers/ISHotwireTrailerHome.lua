require "TimedActions/ISBaseTimedAction"

ISHotwireTrailerHome = ISBaseTimedAction:derive("ISHotwireTrailerHome")

function hotwireTrailerHomeEngine(player, args)
	local electricSkill = args.electricSkill;
	player:getVehicle():tryHotwire(electricSkill);
end

function ISHotwireTrailerHome:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
		not vehicle:isEngineRunning() and 
		not vehicle:isEngineStarted()
end

function ISHotwireTrailerHome:update()
    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISHotwireTrailerHome:start()
end

function ISHotwireTrailerHome:stop()
	ISBaseTimedAction.stop(self)
end

function ISHotwireTrailerHome:perform()
--	local vehicle = self.character:getVehicle()
	hotwireTrailerHomeEngine (self.character,  {electricSkill=self.character:getPerkLevel(Perks.Electricity)})
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISHotwireTrailerHome:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 200 - (character:getPerkLevel(Perks.Electricity) * 3);
	return o
end