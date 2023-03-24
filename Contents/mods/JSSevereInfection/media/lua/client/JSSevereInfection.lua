-- I suck at modding, so if you're using this to learn, please find a better modder to learn from!

-- ! Event Functions ! --

-- Check through all active players, then call our RunInfection method if they are fake infected
-- Also apparently should check if a player isn't dead, since dead players stay available for updates
function JSSevereInfectionEveryOneMinute()

	for i = 0, getNumActivePlayers() - 1 do
	
		local player = getSpecificPlayer(i);
	
		if(player and not player:isDead() and player:getBodyDamage():isIsFakeInfected()) then
		
			JSSevereInfectionRunInfection(player);
		
		end
	
	end

end
	
Events.EveryOneMinute.Add(JSSevereInfectionEveryOneMinute);

-- To make the player turn into a zombie, we need to remove fake infection
-- and set real infection on death, but first we need to check the player
-- actually has a fake infection
function JSSevereInfectionOnPlayerDeath(player)

	local bodyDamage = player:getBodyDamage();

	if(bodyDamage and bodyDamage:IsFakeInfected()) then

		bodyDamage:setIsFakeInfected(false);
		bodyDamage:setInfected(true);
		bodyDamage:setInfectionLevel(100);
		
	end

end

Events.OnPlayerDeath.Add(JSSevereInfectionOnPlayerDeath);
	
-- ! Support Methods ! --

-- This is how quick we lose health at critical infection.
-- Was a sandbox var, but there were too many sandbox vars to parse visually
-- I feel like no one will care about this value, so here it is.
local JSSevereInfectionCriticalInfHealthRate = 0.5;

-- Use these for lethal bite damage, increasing over time
-- We want to kill the player at peak infection, but also don't
-- necessarily want to instantly kill them if bitten at peak infection
-- Rather than another timer, we can just apply damage at them until they die
-- so this ensures the damage is eventually non-survivable
-- again, I don't think this is worth making another sandbox var for
local JSSevereInfectionLethalBiteDamageStart = 0.1;
local JSSevereInfectionLethalBiteDamageIncrease = 1.04;

-- This we use to directly control infection rate, so we can apply our own delta from the previous value
local JSSevereInfectionLastInfLevel = {};

-- This is for multiplying weight loss. We need the previous weight to find the weight delta to modify
local JSSevereInfectionLastWeight = {};

-- Here's where we run our infection effects and try to fight the vanilla infection rate
function JSSevereInfectionRunInfection(player)

	local bodyDamage = player:getBodyDamage();
	local playerID = JSSevereInfectionGetPlayerID(player);

	-- This bit of code stops a small amount of foodSicknessLevel from killing us, which is desirable
	-- basically, the fake infection needs to keep pace with real infection
	-- but we leave it at 90 so really high foodSickness will still kill.
	local fakeInfectionLevel = bodyDamage:getFakeInfectionLevel();
	
	if(fakeInfectionLevel < 1) then
		bodyDamage:setInfectionLevel(0);
	elseif(fakeInfectionLevel < 90) then
		bodyDamage:setInfectionLevel(fakeInfectionLevel);
	else
		bodyDamage:setInfectionLevel(90);
	end
	
	-- Not the best place, but just want to make sure our randomness variables are set here so we can get them into local vars
	-- We'll also affect the severity after this by the infection multi so we can set them in mod data before we get a local copy
	if(player:getModData()["JSSevereInfectionSeverityMod"] == nil or player:getModData()["JSSevereInfectionLengthMod"] == nil) then
	
		player:getModData()["JSSevereInfectionSeverityMod"] = (100 * (1 - SandboxVars.JSSevereInfection.InfTimeRandom) + ZombRand(200 * SandboxVars.JSSevereInfection.InfTimeRandom)) / 100;
		player:getModData()["JSSevereInfectionLengthMod"] = (100 * (1 - SandboxVars.JSSevereInfection.SeverityRandom) + ZombRand(200 * SandboxVars.JSSevereInfection.SeverityRandom)) / 100;
		
	end

	if(SandboxVars.JSSevereInfection.InfectionMulti > 0 and JSSevereInfectionHasInfectionPenalty(player)) then
		player:getModData()["JSSevereInfectionSeverityMod"] = player:getModData()["JSSevereInfectionSeverityMod"] + (SandboxVars.JSSevereInfection.InfectionMulti / 60);
	end
	
	local lengthMod = player:getModData()["JSSevereInfectionLengthMod"];
	local severityMod = player:getModData()["JSSevereInfectionSeverityMod"];
	
	local bandageMulti = 1;
		
	if(SandboxVars.JSSevereInfection.BandageMulti > 1 and JSSevereInfectionHasBandagePenalty(player)) then
		bandageMulti = 1 / SandboxVars.JSSevereInfection.BandageMulti;
	end
	
	-- We'll check here for bites so we can apply the bite severity mulitplier
	-- We also check here if bites are lethal so we can make sure we aren't reducing infection after receiving a bite
	-- Might as well do lethal damage here, also, so we don't have to check bite again later
	if(JSSevereInfectionIsBiteInfected(player)) then
	
		if(SandboxVars.JSSevereInfection.BiteSeverity > 1) then
			severityMod = severityMod * SandboxVars.JSSevereInfection.BiteSeverity;
		end
		
		if(SandboxVars.JSSevereInfection.BitesLethal) then
		
			if(bodyDamage:isReduceFakeInfection()) then
				bodyDamage:setReduceFakeInfection(false);
			end
			
			if(bodyDamage:getFakeInfectionLevel() > 99) then
			
				if(not player:getModData()["JSSevereInfectionLethalDamage"]) then
					player:getModData()["JSSevereInfectionLethalDamage"] = JSSevereInfectionLethalBiteDamageStart;
				end
				
				--print("JSSI - lethal bite damage: " .. player:getModData()["JSSevereInfectionLethalDamage"]);
				bodyDamage:ReduceGeneralHealth(player:getModData()["JSSevereInfectionLethalDamage"]);
				
				player:getModData()["JSSevereInfectionLethalDamage"] = player:getModData()["JSSevereInfectionLethalDamage"] * JSSevereInfectionLethalBiteDamageIncrease;
			
			end
			
		end
	
	end

	-- This block controls the infection rate.
	-- If the flag is set to reduce infection, then we can check if our PeakLeft value is set
	-- If that isn't set, we're at the start of our peak and can reduce PeakLeft until it runs to 0
	-- Once at 0, we're simply slowing the vanilla reduction
	-- If we're not reducing infection, we're slowing the vanilla increase
	if(bodyDamage:isReduceFakeInfection()) then
	
		local peakLeft = player:getModData()["JSSevereInfectionPeakLeft"];

		if(peakLeft == nil) then
		
			player:getModData()["JSSevereInfectionPeakLeft"] = 100;
			bodyDamage:setFakeInfectionLevel(100);
			
			JSSevereInfectionLastInfLevel[playerID] = 100;
			
			if(player:getModData()["JSSevereInfectionPeakAdded"]) then
				player:getModData()["JSSevereInfectionPeakLeft"] = 100 + player:getModData()["JSSevereInfectionPeakAdded"];			
			end

		elseif(peakLeft > 0) then
		
			local peakRate = 100 / (SandboxVars.JSSevereInfection.PeakHours * 60);

			player:getModData()["JSSevereInfectionPeakLeft"] = peakLeft - peakRate * bandageMulti * lengthMod;
			bodyDamage:setFakeInfectionLevel(100);
			
			JSSevereInfectionLastInfLevel[playerID] = 100;

		else
		
			local realInfLevel = bodyDamage:getFakeInfectionLevel();
			local lastInfLevel = JSSevereInfectionLastInfLevel[playerID];
			local decreaseRate = 100 / (SandboxVars.JSSevereInfection.RecoveryHours * 60);
			local targetInfLevel;
			
			if(lastInfLevel == nil) then
				targetInfLevel = realInfLevel;	
			else	
				targetInfLevel = lastInfLevel - decreaseRate * bandageMulti * lengthMod;
			end
			
			if(realInfLevel < 25 and targetInfLevel >= 24.99) then
				bodyDamage:setFakeInfectionLevel(24.99);
			elseif(realInfLevel < 50 and targetInfLevel >= 49.99) then
				bodyDamage:setFakeInfectionLevel(49.99);
			elseif(realInfLevel < 75 and targetInfLevel >= 74.99) then
				bodyDamage:setFakeInfectionLevel(74.99);
			else
				bodyDamage:setFakeInfectionLevel(targetInfLevel);
			end
			
			JSSevereInfectionLastInfLevel[playerID] = targetInfLevel;
	
			-- Gross, but I don't know how to catch when fakeInfection is set to false, so we just want to make sure we reset
			if(bodyDamage:getFakeInfectionLevel() <= 0.75) then
			
				player:getModData()["JSSevereInfectionPeakLeft"] = nil;
				player:getModData()["JSSevereInfectionSeverityMod"] = nil;
				player:getModData()["JSSevereInfectionLengthMod"] = nil;
				player:getModData()["JSSevereInfectionPeakAdded"] = nil;
				player:getModData()["JSSevereInfectionLethalDamage"] = nil;
				JSSevereInfectionLastInfLevel[playerID] = nil;
				JSSevereInfectionLastWeight[playerID] = nil;
				
				bodyDamage:setInfectionLevel(0);
				bodyDamage:setFakeInfectionLevel(0);
				bodyDamage:setIsFakeInfected(false);
				
				return;

			end
		
		end

	else
	
		local realInfLevel = bodyDamage:getFakeInfectionLevel();
		local lastInfLevel = JSSevereInfectionLastInfLevel[playerID];
		local increaseRate = 100 / (SandboxVars.JSSevereInfection.OnsetHours * 60);
		local targetInfLevel;

		if(lastInfLevel == nil) then	
			targetInfLevel = realInfLevel
		else	
			targetInfLevel = lastInfLevel + increaseRate * lengthMod;
		end
		
		if(targetInfLevel > 100) then	
			targetInfLevel = 100;
		end
		
		if(realInfLevel >= 25 and targetInfLevel < 25) then
			bodyDamage:setFakeInfectionLevel(25);
		elseif(realInfLevel >= 50 and targetInfLevel < 50) then
			bodyDamage:setFakeInfectionLevel(50);
		elseif(realInfLevel >= 75 and targetInfLevel < 75) then
			bodyDamage:setFakeInfectionLevel(75);
		else
			bodyDamage:setFakeInfectionLevel(targetInfLevel);
		end
	
		JSSevereInfectionLastInfLevel[playerID] = targetInfLevel;
		
		if(bandageMulti < 1) then
		
			if(player:getModData()["JSSevereInfectionPeakAdded"] == nil) then
				player:getModData()["JSSevereInfectionPeakAdded"] = 0;
			end
			
			local peakDelta = (100 * ((1 / bandageMulti) - 1)) / ((SandboxVars.JSSevereInfection.OnsetHours / lengthMod) * 60);	
			player:getModData()["JSSevereInfectionPeakAdded"] = player:getModData()["JSSevereInfectionPeakAdded"] + peakDelta;

		end
	
	end
	
	-- Here, simply, we add our fatigue, thirst, hunger, and calorie rates to player stats
	-- We also attempt to use the previous weight to modify weight loss, if delta is negative
	-- When setting the weight, have to make sure the combined multiplier is greater than 1, or we're reducing weight loss!
	-- We can ignore this section if the infection is finally at 0
	local stats = player:getStats();
	local infPercent = bodyDamage:getFakeInfectionLevel() / 100;
	
	if(infPercent > 0) then
	
		if(not player:isAsleep()) then
			stats:setFatigue(stats:getFatigue() + (SandboxVars.JSSevereInfection.FatigueRate / 60) * infPercent * severityMod);
		end
		
		stats:setThirst(stats:getThirst() + (SandboxVars.JSSevereInfection.ThirstRate / 60) * infPercent * severityMod);
		stats:setHunger(stats:getHunger() + (SandboxVars.JSSevereInfection.HungerRate / 60) * infPercent * severityMod);

		local nutrition = player:getNutrition();
		
		nutrition:setCalories(nutrition:getCalories() - SandboxVars.JSSevereInfection.CalorieRate * infPercent * severityMod);

		if(JSSevereInfectionLastWeight[playerID] and infPercent * SandboxVars.JSSevereInfection.WeightLossRate > 1) then
			
			local weightDelta = nutrition:getWeight() - JSSevereInfectionLastWeight[playerID];
			local weightAdjust = SandboxVars.JSSevereInfection.WeightLossRate * infPercent * severityMod;
				
			if(weightDelta < 0 and weightAdjust > 1) then

				local targetWeight = JSSevereInfectionLastWeight[playerID] + weightDelta * weightAdjust;
				nutrition:setWeight(targetWeight);
				
			end
			
		end
			
		JSSevereInfectionLastWeight[playerID] = nutrition:getWeight();
		
	end
	
	-- Here we can do our health drop if it's "enabled" and we're at "critical infection"
	if(SandboxVars.JSSevereInfection.CriticalInfHealthMin < 100 and infPercent > SandboxVars.JSSevereInfection.CriticalInfPercent) then
	
		local healthLeft = bodyDamage:getHealth() - SandboxVars.JSSevereInfection.CriticalInfHealthMin;
		
		if(healthLeft > 0) then
		
			local healthLoss = math.min(healthLeft, JSSevereInfectionCriticalInfHealthRate);
			bodyDamage:ReduceGeneralHealth(healthLoss);

		end
	
	end
	
	-- We also need to wake the player up if they're dying of thirst/hunger, as vanilla doesn't do this!
	-- First we check if the player is sleeping, then at critical thirst/hunger, then if they're under the fatigue threshold. 
	if(player:isAsleep()) then
	
		if(player:getMoodleLevel(MoodleType.Hungry) == 4 or player:getMoodleLevel(MoodleType.Thirst) == 4) then
		
			if(stats:getFatigue() <= SandboxVars.JSSevereInfection.MaxWakeFatigue) then
				player:forceAwake();			
			end
		
		end
	
	end

end

-- Use this to get player id, checking whether we're multiplayer or not
function JSSevereInfectionGetPlayerID(player)

	if(isClient() or isServer()) then
	
		return player:getOnlineID();
		
	else
	
		return player:getID();
		
	end
		
end

-- This method finds any wound with a non-lethal infection that does not have a clean bandage
function JSSevereInfectionHasBandagePenalty(player)

	local bodyDamage = player:getBodyDamage();
	local bodyPart = nil;
	
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Hand_L);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end

	bodyPart = bodyDamage:getBodyPart(BodyPartType.Hand_R);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
	
	bodyPart = bodyDamage:getBodyPart(BodyPartType.ForeArm_L);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.ForeArm_R);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperArm_L);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperArm_R);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Torso_Upper);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Torso_Lower);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Head);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Neck);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Groin);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperLeg_L);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperLeg_R);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.LowerLeg_L);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.LowerLeg_R);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Foot_L);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Foot_R);
	if(bodyPart:IsFakeInfected() and (bodyPart:isBandageDirty() or not bodyPart:bandaged())) then return true end
	
	return false;

end

-- This method finds any wound with a non-lethal infection that also is an infected wound
function JSSevereInfectionHasInfectionPenalty(player)

	local bodyDamage = player:getBodyDamage();
	local bodyPart = nil;
	
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Hand_L);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end

	bodyPart = bodyDamage:getBodyPart(BodyPartType.Hand_R);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
	
	bodyPart = bodyDamage:getBodyPart(BodyPartType.ForeArm_L);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.ForeArm_R);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperArm_L);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperArm_R);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Torso_Upper);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Torso_Lower);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Head);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Neck);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Groin);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperLeg_L);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperLeg_R);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.LowerLeg_L);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.LowerLeg_R);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Foot_L);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Foot_R);
	if(bodyPart:IsFakeInfected() and bodyPart:isInfectedWound()) then return true end
	
	return false;

end

function JSSevereInfectionIsBiteInfected(player)

	local bodyDamage = player:getBodyDamage();
	local bodyPart = nil;
	
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Hand_L);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end

	bodyPart = bodyDamage:getBodyPart(BodyPartType.Hand_R);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
	
	bodyPart = bodyDamage:getBodyPart(BodyPartType.ForeArm_L);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.ForeArm_R);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperArm_L);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperArm_R);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Torso_Upper);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Torso_Lower);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Head);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Neck);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Groin);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperLeg_L);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.UpperLeg_R);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.LowerLeg_L);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.LowerLeg_R);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Foot_L);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
		
	bodyPart = bodyDamage:getBodyPart(BodyPartType.Foot_R);
	if(bodyPart:IsFakeInfected() and bodyPart:getBiteTime() > 0) then return true end
	
	return false;

end