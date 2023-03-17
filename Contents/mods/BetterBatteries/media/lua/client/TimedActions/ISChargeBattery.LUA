--***********************************************************
--**                 PWRCOSMIC (NIKKI)                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISChargeBattery = ISBaseTimedAction:derive("ISChargeBattery");

function ISChargeBattery:isValid()
	return self.character:isPrimaryHandItem(self.handCrank) and self.handCrank:getUsedDelta() < 1 and self.character:getMoodles():getMoodleLevel(MoodleType.Endurance) < 4
end

function ISChargeBattery:waitToStart()
	return false
end

function ISChargeBattery:update()
	local currEnduranceLevel = self.character:getMoodles():getMoodleLevel(MoodleType.Endurance)
	local currentJobDelta = self:getJobDelta()
	local jobDeltaElapsed = currentJobDelta - (self.lastJobDelta or 0)
	local actionCurrent = self.startingCharge + (self.targetCharge - self.startingCharge) * currentJobDelta

	if currEnduranceLevel ~= self.endurance and SandboxVars.BetterBatteries.EndurancePenalty or currEnduranceLevel >= 4 then
		self:forceComplete()
		ISTimedActionQueue.add(ISChargeBattery:new(self.character, self.handCrank))
	end

	if self:isValid() then
		self.handCrank:setUsedDelta(actionCurrent * self.handCrank:getUseDelta())
		self.handCrank:setJobDelta(actionCurrent * self.handCrank:getUseDelta())
		self.character:getStats():setEndurance(self.character:getStats():getEndurance() - (0.0001 * (jobDeltaElapsed * self.timeLength)))
	end

	self.lastJobDelta = currentJobDelta
	self.character:setMetabolicTarget(Metabolics.LightWork);
end

function ISChargeBattery:start()
	local strength = self.character:getPerkLevel(Perks.Strength)

	local moodles = self.character:getMoodles()
	local unhappiness = moodles:getMoodleLevel(MoodleType.Unhappy)
	self.endurance = moodles:getMoodleLevel(MoodleType.Endurance)

	local currentCharge = self.handCrank:getUsedDelta() / self.handCrank:getUseDelta()
	local maxCharge = 1 / self.handCrank:getUseDelta()
	local take = maxCharge - currentCharge
	self.startingCharge = currentCharge
	self.targetCharge = currentCharge + take

	self.handCrank:setJobDelta(0.0)
	self.timeLength = (SandboxVars.BetterBatteries.CrankTime * 60) * (1 - self.handCrank:getUsedDelta()) * (SandboxVars.BetterBatteries.StrengthBuff and (1 - 0.05 * strength) or 1) * (SandboxVars.BetterBatteries.UnhappinessPenality and (1 + 0.125 * unhappiness) or 1 )* (SandboxVars.BetterBatteries.EndurancePenalty and (1 + 0.25 * self.endurance) or 1)
	self.action:setTime(self.character:isTimedActionInstant() and 1 or math.max(self.timeLength, 1)) -- math.max prevents stupid small time values from borking the entire TimeAction system and causing an infinite loop. Yay!

	-- Don't call setOverrideHandModels() with self.petrol, the right-hand mask
	-- will bork the animation.
	self:setOverrideHandModels(self.handCrank:getStaticModel(), nil)
	self:setActionAnim("Craft")
	self.sound = self.character:playSound("GeneratorRepair")
end

function ISChargeBattery:stop()
	print("Done")
	self.character:stopOrTriggerSound(self.sound)
	self.handCrank:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function ISChargeBattery:perform()
	self.character:stopOrTriggerSound(self.sound)
	-- needed to remove from queue / start next.
	self.handCrank:setJobDelta(0.0)
	ISBaseTimedAction.perform(self);
end

function ISChargeBattery:new(character, handCrank)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.handCrank = handCrank;
	o.stopOnWalk = false;
	o.stopOnRun = true;

	o.maxTime = 600; -- Will be overwritten.
	return o;
end

