require "TimedActions/ISBaseTimedAction"

ISShutOffTrailerHomeEngine = ISBaseTimedAction:derive("ISShutOffTrailerHomeEngine")

function ISShutOffTrailerHomeEngine:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
		vehicle:isEngineRunning()
end

function ISShutOffTrailerHomeEngine:update()
	self:forceComplete()
end

function ISShutOffTrailerHomeEngine:start()
end

function ISShutOffTrailerHomeEngine:stop()
	ISBaseTimedAction.stop(self)
end

function ISShutOffTrailerHomeEngine:perform()
	local vehicle = self.character:getVehicle()
	sendClientCommand(self.character, 'trailer', 'startGeneratorEngine', {trailer=vehicle:getId(), activate = false})
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISShutOffTrailerHomeEngine:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = -1
	return o
end