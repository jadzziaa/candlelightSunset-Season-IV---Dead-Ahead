--[[
		Developed by Codename280
		Working Bench press & Treadmill 41.78+
]]
require "TimedActions/ISFitnessAction"

local default_stop = ISFitnessAction.stop
local default_start = ISFitnessAction.start
local default_update = ISFitnessAction.update
local default_waitToStart = ISFitnessAction.waitToStart
local default_perform = ISFitnessAction.perform
local default_isValid = ISFitnessAction.isValid
local default_exeLooped = ISFitnessAction.exeLooped
	
local currentDelta = nil
local deltaIncrease = nil
local player = nil	
local soundFileBenchpress = "FWObench"
local soundFileTreadmill = "FWOtreadmillrun"
local soundEnd = "FWOtreadmillend"
local soundFile = nil
local gameSound = 0
FWOObject = nil

function ISFitnessAction:waitToStart()
	if self.exercise == "benchpress" then
		soundFile = soundFileBenchpress
	--[[
		--animation offset fix attempt
		if(FWOObject:getSprite():getProperties():Val("Facing") == "W") then
			self.character:setX(FWOObject:getX()+0.02)
			self.character:setY(FWOObject:getY()+0.60)	
		end
		if(FWOObject:getSprite():getProperties():Val("Facing") == "E") then
			self.character:setX(FWOObject:getX()+1.5)
			self.character:setY(FWOObject:getY()+1.0)	
		end]]
	elseif self.exercise == "treadmill" then
		soundFile = soundFileTreadmill	
	end
	self.character:faceThisObject(FWOObject);
	return self.character:shouldBeTurning();
end

local function addXP()
	local strengthXPMultiply = SandboxVars.FWOWorkingTreadmill.StrengthXPMultiply
	local sprintingXPMultiply = SandboxVars.FWOWorkingTreadmill.SprintingXPMultiply
	
	local sprintingXp = (0.185 * sprintingXPMultiply) 
	local strenghtXp = (1.5 * strengthXPMultiply) 
	
	player:getXp():AddXP(Perks.Sprinting, sprintingXp);
	if player:getInventoryWeight() > player:getMaxWeight() * 0.5 then
		player:getXp():AddXP(Perks.Strength, strenghtXp);
	end
end



function ISFitnessAction:exeLooped()
	player=self.character;
	--bugfix work around for animation not triggering
	if self.character:getCurrentState() ~= FitnessState.instance() then
		self.character:setVariable("ExerciseType", self.exercise);
		self.character:reportEvent("EventFitness");
		self.character:clearVariable("ExerciseStarted");
		self.character:clearVariable("ExerciseEnded");
		
		self.character:reportEvent("EventUpdateFitness");
	end
	
	if self.exercise == "treadmill" then
		addXP()		
	end
	default_exeLooped(self)
end

local function FWOEndOfAction(self)
	if self.exercise == "treadmill" then
		-- Make sure game sound has stopped
		if gameSound and
			gameSound ~= 0 and
			self.character:getEmitter():isPlaying(gameSound) then
			self.character:getEmitter():stopSound(gameSound);
		end
		self.character:getEmitter():stopSound(gameSound);


		local soundRadius = 15
		local volume = 6

		-- Use the emitter because it emits sound in the world (zombies can hear)
		gameSound = self.character:getEmitter():playSound(soundEnd);
			
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
		
	elseif self.exercise == "benchpress" then
	--[[Make sure game sound has stopped]]
		if gameSound and
			gameSound ~= 0 and
			self.character:getEmitter():isPlaying(gameSound) then
			self.character:getEmitter():stopSound(gameSound);
		end

		local soundRadius = 13
		local volume = 6
			
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
	
	end	

end

function ISFitnessAction:update()
	
	if self.exercise == "treadmill" or self.exercise == "benchpress" then
		local isPlaying = gameSound
			and gameSound ~= 0
			and self.character:getEmitter():isPlaying(gameSound)

		if not isPlaying then
			local soundRadius = 13
			local volume = 6

			-- Use the emitter because it emits sound in the world (zombies can hear)
			gameSound = self.character:getEmitter():playSound(soundFile);
			
			addSound(self.character,
					 self.character:getX(),
					 self.character:getY(),
					 self.character:getZ(),
					 soundRadius,
					 volume)
		end
	end	
	

	default_update(self)	
end

function ISFitnessAction:stop()
	FWOEndOfAction(self);
	default_stop(self)
end

function ISFitnessAction:perform()
	FWOEndOfAction(self);
	default_perform(self)
end

