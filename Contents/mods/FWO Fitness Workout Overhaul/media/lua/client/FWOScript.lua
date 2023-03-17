require "TimedAction/ISFitnessAction"

local default_update = ISFitnessAction.update
local default_stop = ISFitnessAction.stop
local currentExercise = nil
local perk_boost_map = {
    [1] = 1.75,
    [2] = 2,
    [3] = 2.25,
}

function ISFitnessAction:update() 
	currentExercise = self.exercise
	default_update(self)
end

function ISFitnessAction:stop()	
	currentExercise = nil
	default_stop(self)
end

local function calcMulExe(player, perkType, perkLvl, PercRegNum)
	local mulXP = 1
	local playerFitness = player:getFitness()
	--print(perkType)
	if SandboxVars.FWOFitness.InitialPerkBonus then
		local perkBoost = player:getXp():getPerkBoost(perkType)

		if perk_boost_map[perkBoost] then
            mulXP = mulXP * perk_boost_map[perkBoost]
        end
		--print("1 InitialPerkBonus xp: ", mulXP)
	end
	if SandboxVars.FWOFitness.currentExerciseRegularityBonus and currentExercise ~= nil then
		mulXP = mulXP + ((playerFitness:getRegularity(currentExercise)-SandboxVars.FWOFitness.currentExerciseOffset)*SandboxVars.FWOFitness.currentExerciseRate)/100
		--print("2 currentExe xp: ", mulXP)
	end
	if SandboxVars.FWOFitness.AverageExerciseRegularityBonus then
		mulXP = mulXP + ((PercRegNum/100) * SandboxVars.FWOFitness.AverageExerciseRegularityBonus)
		--print("3 Average xp: ", mulXP)
	end
	if SandboxVars.FWOFitness.LevelBonus then
		mulXP = mulXP + ((perkLvl) * SandboxVars.FWOFitness.LevelBonus)
		--print("4 LevelBonus xp: ", mulXP)
	end	
	if SandboxVars.FWOFitness.SpaceOutExercise and currentExercise ~= nil then	
		if perkType == Perks.Strength then 		
			if playerFitness:getCurrentExeStiffnessTimer("arms") < 60 and playerFitness:getCurrentExeStiffnessTimer("arms") > 0   then
				mulXP = mulXP * 0.9
				--print("5 tired xp: ", mulXP)
			else
				mulXP = mulXP * 1.4
				--print("5 rested xp: ", mulXP)
			end	
		elseif	perkType == Perks.Fitness then
			if (playerFitness:getCurrentExeStiffnessTimer("legs") < 60 and playerFitness:getCurrentExeStiffnessTimer("legs") > 0) or (playerFitness:getCurrentExeStiffnessTimer("abs") < 60 and playerFitness:getCurrentExeStiffnessTimer("abs") > 0 ) then
				mulXP = mulXP * 0.9
				--print("5 tired xp: ", mulXP)
			else
				mulXP = mulXP * 1.4
				--print("5 rested xp: ", mulXP)
			end
		end
	end
	if SandboxVars.FWOFitness.RestedBonus then
		if playerFitness:onGoingStiffness() then
			mulXP = mulXP * 0.9
			--print("6 stiff xp: ", mulXP)
		else
			mulXP = mulXP * 1.5
			--print("6 not stiff xp: ", mulXP)
		end
	end
	if SandboxVars.FWOFitness.XPMultiplier then
		mulXP = mulXP * SandboxVars.FWOFitness.XPMultiplier
	end

	player:getXp():addXpMultiplier(perkType,mulXP,perkLvl,10)
end
	
local function CheckRegularity ()
	local sumAverage = 0
	--print("CheckRegularity")

	for playerIndex=0,getNumActivePlayers()-1 do
		local character = getSpecificPlayer(playerIndex)
		if character and not character:isDead() then
	
			local count = 0
			for k,v in pairs(FitnessExercises.exercisesType) do
				count = count + 1
				sumAverage = sumAverage + character:getFitness():getRegularity(k)
			end		
			sumAverage = math.ceil(sumAverage*100)/100
			local totAverage = math.ceil((sumAverage/count)*100)/100
		
			calcMulExe(character, Perks.Strength, character:getPerkLevel(Perks.Strength), totAverage)
			calcMulExe(character, Perks.Fitness, character:getPerkLevel(Perks.Fitness), totAverage)
		end--alive
	end--for
end

Events.EveryTenMinutes.Add(CheckRegularity)