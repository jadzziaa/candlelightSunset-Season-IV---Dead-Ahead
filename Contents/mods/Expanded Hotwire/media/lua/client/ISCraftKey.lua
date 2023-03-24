
require "TimedActions/ISBaseTimedAction"

ISCraftKey = ISBaseTimedAction:derive("ISCraftKey")

function ISCraftKey:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
		vehicle:isDriver(self.character) and
		not vehicle:isEngineRunning() and
		not vehicle:isEngineStarted()
end

function ISCraftKey:update()
    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISCraftKey:start()
	self.sound = self.character:getEmitter():playSound("PZ_MetalSnap")
end

function ISCraftKey:stop()
	self:stopSound()
	ISBaseTimedAction.stop(self)
end

function ISCraftKey:perform()
	self:stopSound()

  local vehicle = self.character:getVehicle()
  sendClientCommand(self.character, "vehicle", "getKey", {vehicle = vehicle:getId()})

	ISBaseTimedAction.perform(self)
end

function ISCraftKey:stopSound()
	if self.sound and self.character:getEmitter():isPlaying(self.sound) then
		self.character:stopOrTriggerSound(self.sound);
	end
end

function ISCraftKey:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = SandboxVars.ExpandedHotwire.KeyCraftingBaseDuration - (character:getPerkLevel(Perks.Electricity) * SandboxVars.ExpandedHotwire.KeyCraftingElectricityScalar)
              - (character:getPerkLevel(Perks.Mechanics) * SandboxVars.ExpandedHotwire.KeyCraftingMechanicsScalar)
              - (character:getPerkLevel(Perks.MetalWelding) * SandboxVars.ExpandedHotwire.KeyCraftingMetalWeldingScalar);
	return o
end
