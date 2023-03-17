--***********************************************************
--** PseudonymousEd, the Dev
--** Playable Arcade Machines 41
--** Arcade machines relieve boredom/stress/unhappiness
--***********************************************************

require "TimedActions/ISBaseTimedAction"

PAMPlayGame = ISBaseTimedAction:derive("PAMPlayGame");

local function adjustStats(bodyDamage, stats, currentDelta, deltaIncrease, boredomReduction, stressReduction)
	--print("PseudoEdPAM: ADJUSTING stats")
	--print("PseudoEdPAM: currentdelta = " .. currentDelta)
	--print("Initial Boredom: " .. initialBoredom)
	--print("Initial Unhappiness: " .. initialUnhappiness)
	--print("Initial Stress: " .. initialStress)
		
	local boredomChange = currentDelta * boredomReduction

	bodyDamage:setBoredomLevel(initialBoredom - boredomChange)
	local stressChange = currentDelta * stressReduction

	bodyDamage:setUnhappynessLevel(initialUnhappiness - stressChange)

	stats:setStress(initialStress - stressChange)

	--print("PseudoEdPAM: Stats after adjustStats " .. deltaIncrease);
	--print("Boredom: " .. bodyDamage:getBoredomLevel())
	--print("Unhappiness: " .. bodyDamage:getUnhappynessLevel())
	--print("Stress: " .. stats:getStress())
end

function PAMPlayGame:isValid()
	return true;
end

function PAMPlayGame:waitToStart()
	self.character:faceThisObject(self.machine);
	return self.character:shouldBeTurning();
end

function PAMPlayGame:update()
	local isPlaying = self.gameSound
		and self.gameSound ~= 0
		and self.character:getEmitter():isPlaying(self.gameSound)

	if not isPlaying then
		-- Some examples of radius and volume found in PZ code:
		-- Fishing (20,1)
		-- Remove Grass (10,5)
		-- Remove Glass (20,1)
		-- Destroy Stuff (20,10)
		-- Remove Bush (20,10)
		-- Move Sprite (10,5)
		local soundRadius = 20
		local volume = 7

		-- Use the emitter because it emits sound in the world (zombies can hear)
		self.gameSound = self.character:getEmitter():playSound(self.soundFile);
		
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
	end

	local currentDelta = self:getJobDelta()
	local deltaIncrease = currentDelta - self.deltaTabulated
	
	-- Update at every 0.05 delta milestone
	if deltaIncrease > 0.05 then
		
		local bodyDamage = self.character:getBodyDamage()

		--print("PseudoEdPAM: Adjusting stats for UPDATE")
		adjustStats(bodyDamage, self.character:getStats(), currentDelta, deltaIncrease, self.boredomReduction, self.stressReduction)

		self.deltaTabulated = currentDelta
	end
	
	self.character:faceThisObject(self.machine);
end

function PAMPlayGame:start()

	local actionType = self.actionType
	--print("PseudoEdPAM: Programmed action " .. actionType)

	self:setActionAnim(actionType)
	-- Loot is used as a backup action, so keep this
	self.character:SetVariable("LootPosition", "Mid")

	-- Some notes to begin
	local seconds = self.maxTime / 48
	--print("PseudoEdPAM Playing an arcade machine")	
	--print("length seconds = " .. seconds)
	--print("Boredom Reduction = " .. self.boredomReduction)
	--print("Stress reduction = " .. self.stressReduction)
	
	local bodyDamage = self.character:getBodyDamage()
	initialBoredom = bodyDamage:getBoredomLevel()
	initialUnhappiness = bodyDamage:getUnhappynessLevel()
	initialStress = self.character:getStats():getStress()
	
	self:setOverrideHandModels(nil, nil)
end

function PAMPlayGame:stop()
	-- Make sure game sound has stopped
	if self.gameSound and
		self.gameSound ~= 0 and
		self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	local soundRadius = 20
	local volume = 7

	-- Use the emitter because it emits sound in the world (zombies can hear)
	self.gameSound = self.character:getEmitter():playSound(self.soundEnd);
		
	addSound(self.character,
			 self.character:getX(),
			 self.character:getY(),
			 self.character:getZ(),
			 soundRadius,
			 volume)

	-- Based on the Delta and piece level
	-- calculate Boredom/Unhappiness/Stress changes	
	local currentDelta = self:getJobDelta()
	local deltaIncrease = currentDelta - self.deltaTabulated
	local bodyDamage = self.character:getBodyDamage()

	--print("PseudoEdPAM: Adjusting stats for STOP")
	adjustStats(bodyDamage, self.character:getStats(), currentDelta, deltaIncrease, self.boredomReduction, self.stressReduction)

	self.deltaTabulated = currentDelta
		
	-- Adjust stats to 0 if levels went below 0
	if (bodyDamage:getBoredomLevel() < 0) then
		bodyDamage:setBoredomLevel(0)
	end
	if (bodyDamage:getUnhappynessLevel() < 0) then
		bodyDamage:setUnhappynessLevel(0)
	end
	if (self.character:getStats():getStress() < 0) then
		self.character:getStats():setStress(0)
	end
		
	-- needed to remove from queue / start next.
	ISBaseTimedAction.stop(self);
end

function PAMPlayGame:perform()
	-- Make sure game sound has stopped
	if self.gameSound and
		self.gameSound ~= 0 and
		self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	local soundRadius = 20
	local volume = 7

	-- Use the emitter because it emits sound in the world (zombies can hear)
	self.gameSound = self.character:getEmitter():playSound(self.soundEnd);
		
	addSound(self.character,
			 self.character:getX(),
			 self.character:getY(),
			 self.character:getZ(),
			 soundRadius,
			 volume)

	-- Based on the Delta and piece level
	-- calculate Boredom/Unhappiness/Stress changes
	local currentDelta = self:getJobDelta()
	local deltaIncrease = currentDelta - self.deltaTabulated
	local bodyDamage = self.character:getBodyDamage()

	--print("PseudoEdPAM: Adjusting stats for PERFORM")
	adjustStats(bodyDamage, self.character:getStats(), currentDelta, deltaIncrease, self.boredomReduction, self.stressReduction)

	self.deltaTabulated = currentDelta

	-- Adjust stats to 0 if levels went below 0
	if (bodyDamage:getBoredomLevel() < 0) then
		bodyDamage:setBoredomLevel(0)
	end
	if (bodyDamage:getUnhappynessLevel() < 0) then
		bodyDamage:setUnhappynessLevel(0)
	end
	if (self.character:getStats():getStress() < 0) then
		self.character:getStats():setStress(0)
	end

	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function PAMPlayGame:new(character, machine, sound, soundEnd, actionType, length, boredomReduction, stressReduction)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.machine = machine
	o.soundFile = sound
	o.soundEnd = soundEnd
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = length
	o.gameSound = 0
	o.actionType = actionType
	o.boredomReduction = boredomReduction
	o.stressReduction = stressReduction
	o.deltaTabulated = 0
	return o;
end
