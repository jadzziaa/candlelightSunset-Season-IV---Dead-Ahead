
require "TimedActions/ISBaseTimedAction"

ISUnHotwireVehicle = ISBaseTimedAction:derive("ISUnHotwireVehicle")

function ISUnHotwireVehicle:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
		vehicle:isDriver(self.character) and
		not vehicle:isEngineRunning() and
		not vehicle:isEngineStarted() and
    vehicle:isHotwired()
end

function ISUnHotwireVehicle:update()
    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISUnHotwireVehicle:start()
	self.sound = self.character:getEmitter():playSound("unlockDoor")
end

function ISUnHotwireVehicle:stop()
	self:stopSound()
	ISBaseTimedAction.stop(self)
end

function ISUnHotwireVehicle:perform()
	self:stopSound()

  local vehicle = self.character:getVehicle()
  sendClientCommand(self.character, "vehicle", "cheatHotwire", {vehicle = vehicle:getId(), hotwired = false, broken = false})

	ISBaseTimedAction.perform(self)
end

function ISUnHotwireVehicle:stopSound()
	if self.sound and self.character:getEmitter():isPlaying(self.sound) then
		self.character:stopOrTriggerSound(self.sound);
	end
end

function ISUnHotwireVehicle:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = SandboxVars.ExpandedHotwire.UnHotwireBaseDuration - (character:getPerkLevel(Perks.Electricity) * SandboxVars.ExpandedHotwire.UnHotwireElectricityScalar) - (character:getPerkLevel(Perks.Mechanics) * SandboxVars.ExpandedHotwire.UnHotwireMechanicsScalar);
	return o
end
