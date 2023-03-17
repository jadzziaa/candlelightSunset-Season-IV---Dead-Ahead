-- Jump Through Windows Like a Badass
-- Author: Jay
-- Special Thanks to AbraxasDus for developing the original mod
-- Version: 1.0.3

local localPlayerObjectIndex;

local function playBlockAnim(player)
	local playerWeapon = player:getPrimaryHandItem()
	if (not playerWeapon) or not instanceof(playerWeapon, "HandWeapon") then return true end
	if player:getSecondaryHandItem() == playerWeapon then
		return false
	else
		return true
	end
	
end

local function delayFunc(func, delay)

    delay = delay or 1;
    local ticks = 0;
    local canceled = false;

    local function onTick()

        if not canceled and ticks < delay then
            ticks = ticks + 1;
            return;
        end

        Events.OnTick.Remove(onTick);
        if not canceled then func(); end
    end

    Events.OnTick.Add(onTick);
    return function()
        canceled = true;
    end
end

local function getDefenses(player, hole_index)
	local biteDefense = luautils.round(player:getBodyPartClothingDefense(hole_index, true, false));
	local scratchDefense = luautils.round(player:getBodyPartClothingDefense(hole_index, false, false));
	biteDefense = math.floor(biteDefense);
	scratchDefense = math.floor(scratchDefense);
	return biteDefense, scratchDefense
end

local function dealGlassDamage(player, heavyImpact)
	local hole_index = ZombRand(BloodBodyPartType.MAX:index())
	local coveredPart = BloodBodyPartType.FromIndex(hole_index)
	
	local heavyCanInjureLegs = false
	if SandboxVars.DiveThruWindows.CanInjureLegs then
		heavyCanInjureLegs = SandboxVars.DiveThruWindows.CanInjureLegs
	end
	
	local fails = 0
	-- too lazy to make sure illegal bodyparts dont get picked so let the player off scot free if theyre lucky
	while coveredPart == BloodBodyPartType.Back or (heavyImpact ~= true and coveredPart == BloodBodyPartType.Neck) or 
		(heavyImpact == true and coveredPart == BloodBodyPartType.Neck and ZombRand(2) == 0) or 
		((not heavyCanInjureLegs) and heavyImpact == true and (
			coveredPart == BloodBodyPartType.Foot_L  or coveredPart == BloodBodyPartType.Foot_R or
			coveredPart == BloodBodyPartType.LowerLeg_L  or coveredPart == BloodBodyPartType.LowerLeg_R or
			coveredPart == BloodBodyPartType.UpperLeg_L  or coveredPart == BloodBodyPartType.UpperLeg_R
		)) do
		
		if fails > 2 then
			print('got lucky')
			return
		end
		hole_index = ZombRand(BloodBodyPartType.MAX:index())
		coveredPart = BloodBodyPartType.FromIndex(hole_index)
		fails = fails + 1
	end
	
	biteDefense, scratchDefense = getDefenses(player, hole_index)
	
	
	local bodyDamage = player:getBodyDamage()
	local bodyPart = bodyDamage:getBodyPart(BodyPartType.FromIndex(hole_index))

	local doShardWound = ZombRand(0, 5)
	
	local skinModifier = 5
	if player:HasTrait("ThickSkinned") then
		skinModifier = 20
	end
	if player:HasTrait("ThinSkinned") then
		skinModifier = -10
	end
	
	local armorMulti = (SandboxVars.DiveThruWindows.ArmorEffectiveness or 100) / 100
	
	local penetrated = false
	if (heavyImpact == true and doShardWound <= 2) or doShardWound == 0 then
		local r = ZombRand(0, 100) + 1
	
		if (r >= math.floor( (scratchDefense * 2 + biteDefense + skinModifier * 2)/3 * armorMulti ) ) then
			bodyPart:generateDeepShardWound()
			player:addHole(coveredPart)
			penetrated = true
		end
	else
		local r = ZombRand(0, 100) + 1
		
		local denom = 1
		if heavyImpact then
			denom = 2
		end
		if (r >= math.floor( (scratchDefense/denom + skinModifier)*2 * armorMulti ) ) then
			bodyPart:SetScratchedWeapon(true)
			player:addHole(coveredPart)
			penetrated = true
		end
	end
	
	local denom = 5
	if heavyImpact then
		denom = 7
	end
		
	local r = ZombRand(0, 100) + 1
	if penetrated or r >= math.floor( (biteDefense + 2 * scratchDefense + skinModifier * 2)/denom * armorMulti ) then
		print('Added hole to: ' .. tostring(coveredPart))
		player:addHole(coveredPart)
	end
		
		
		
end

local function shuffle(x)
	for i = #x, 2, -1 do
		local j = math.random(i)
		x[i], x[j] = x[j], x[i]
	end
end

-- Get local player objectIndex for comparison.
local function OnCreatePlayer(playerIndex, player)

    localPlayerObjectIndex = player:getObjectIndex();

end


local lastCollided = nil

-- If the character is sprinting and enters a collision,  
-- check if the character is colliding with a window and jump out.
function jumpThroughWindow(character, collider)

    -- Check if this is a collision for the current player.
	-- dont make the player jump thru on an accidental tap of the sprint button
    if instanceof(character, 'IsoPlayer') and character:isSprinting() then
		local sprintTime = character:getBeenSprintingFor()
	
		if character:getBumpType() == "stagger" or sprintTime <= 7 then
			return
		end
		
		local BaseDodge = SandboxVars.DiveThruWindows.BaseDodge or 100
		
		--[[
		print('testing')
		if collider:getType() == 'wall' then
			if collider:getSprite():getProperties():Is(IsoFlagType.WindowN) then
				if hasWindow(collider) then
					return
				end
				
			elseif collider:getSprite():getProperties():Is(IsoFlagType.WindowW) then
				
				if hasWindow(collider) then
					return
				end
			end
			
		end
		]]

        -- Check if this is a collision with a window.
		local isWindow = instanceof(collider, 'IsoWindow') 
		local isThumpable = instanceof(collider, 'IsoThumpable') and ( collider:getSprite():getProperties():Is(IsoFlagType.WindowN) or collider:getSprite():getProperties():Is(IsoFlagType.WindowW) )
		local isWindowFrame = IsoWindowFrame.isWindowFrame(collider) 
        if isWindow or isWindowFrame or isThumpable then

			local isNorthFacing = collider:getSprite():getProperties():Is(IsoFlagType.WindowN) == true
			
			--make sure the player is running fairly perpendicular to the window
			playerDir = IsoDirections.fromAngle(character:getLastAngle())
			if string.len(tostring(playerDir)) > 1 then
				if isNorthFacing then
					playerDir = IsoDirections[string.sub(tostring(playerDir), 1, 1)]
				else
					playerDir = IsoDirections[string.sub(tostring(playerDir), -1, -1)]
				end
			end
			
			-- do not hop perpendicular to the window
			if (tostring(playerDir) == 'N' or tostring(playerDir) == 'S') and not isNorthFacing then
				return
			end
			if (tostring(playerDir) == 'E' or tostring(playerDir) == 'W') and isNorthFacing then
				return
			end
			
			--print('playerDir ' .. tostring(playerDir))
			
			
			
			local runLvl = character:getPerkLevel(Perks.Sprinting);
			local nimbleLvl = character:getPerkLevel(Perks.Nimble);
			--15 is about one tile on a standard character
			local minRunTime = 30
			if character:HasTrait("Emaciated") then
				minRunTime = minRunTime + 30
			elseif character:HasTrait("Very Underweight") then
				minRunTime = minRunTime + 15
			elseif character:HasTrait("Underweight") then
				minRunTime = minRunTime + 7
			elseif character:HasTrait("Very Overweight") then
				minRunTime = minRunTime - 3
			elseif character:HasTrait("Obese") then
				minRunTime = minRunTime - 7
			end
			minRunTime = minRunTime / (1 + .05 * runLvl)
			minRunTime = minRunTime - 2
			
			local traitBonus = 0
			local heavyMulti = 1
			if character:HasTrait("Obese") then
				traitBonus = traitBonus - 4
				heavyMulti = 2
			elseif character:HasTrait("Very Overweight") then
				traitBonus = traitBonus - 2
				heavyMulti = 2
			end
			if character:HasTrait("Clumsy") then
				traitBonus = traitBonus - 2
			elseif character:HasTrait("Graceful") then
				traitBonus = traitBonus + 4
				heavyMulti = 1
			end
			
			--drunk
			local drunkPenalty = 0
			local drunkness = character:getStats():getDrunkenness()
			if drunkness > 70 then
				drunkPenalty = -8
			elseif drunkness > 50 then
				drunkPenalty = -4
			elseif drunkness > 30 then
				drunkPenalty = -2
			end
			
			--tired
			local fatigue = character:getStats():getFatigue()
			if fatigue > 80 then
				drunkPenalty = drunkPenalty - 4
			elseif fatigue > 70 then
				drunkPenalty = drunkPenalty - 2
			end
			
			--heavy
			local heavyLvl = character:getMoodles():getMoodleLevel(MoodleType.HeavyLoad)
			if heavyLvl >= 1 then
				drunkPenalty = drunkPenalty - 2
			end
			
			--pain
			local painLvl = character:getMoodles():getMoodleLevel(MoodleType.Pain)
			if painLvl >= 1 then
				drunkPenalty = drunkPenalty - math.ceil(painLvl/2)
			end
			
			--panic
			local panicLvl = character:getMoodles():getMoodleLevel(MoodleType.Panic)
			if panicLvl >= 4 then
				drunkPenalty = drunkPenalty - 1
			end
			
			--print('PanicLvl: ' .. panicLvl)
			
			
					
            -- Make sure the window isn't barricaded.
            if (isWindow and (collider:canClimbThrough(character) or (not collider:isInvincible() and not collider:isBarricaded()) ) ) 
				or (isWindowFrame and IsoWindowFrame.canClimbThrough(collider, character)) 
				or (isThumpable and collider:canClimbThrough(character)) 
				then
				
				
				local tookDiveDmg = false
			 
                -- If the window is closed, try to smash it.
                -- chance to damage/lodge glass on unprotected areas
				local didSmash = false
				local smashFail = false
				local bonusSmashFailChance = SandboxVars.DiveThruWindows.BaseFailDiveChance or 45
				bonusSmashFailChance = math.max(1, bonusSmashFailChance)
                if isWindow and not collider:IsOpen() and not collider:isSmashed() then
					didSmash = true
					if ZombRand(0, 100) < math.max(1, bonusSmashFailChance - (nimbleLvl*4 + drunkPenalty*2 + traitBonus*5) ) then
						smashFail = true
					end
					--smashFail = false
					
                    collider:smashWindow();
                    collider:update();
					
					local buildUpBonus = 0
					if sprintTime > minRunTime * 2 then
						buildUpBonus = 5
					end
					
					local baseGlassChance = SandboxVars.DiveThruWindows.DiveClosedWindowInjuryChance or 50
					
					local extraInjuryRolls = 0
					if SandboxVars.DiveThruWindows.ExtraInjuryRolls and SandboxVars.DiveThruWindows.ExtraInjuryRolls > 0 then
						extraInjuryRolls = SandboxVars.DiveThruWindows.ExtraInjuryRolls
					end
					for i = 0, extraInjuryRolls do
						if ZombRand(0, math.max(1, BaseDodge + 5*(runLvl + math.floor(nimbleLvl/2) + traitBonus * heavyMulti + buildUpBonus + drunkPenalty) )) < baseGlassChance then
							dealGlassDamage(character, true)
							tookDiveDmg = true
							
							print('player took glass damage from smashing window')
						end
					end
	
					-- faceplant against the glass and flop over if you didn't get a good start
					if sprintTime < minRunTime then
						character:setSprinting(true);
						character:setBumpType("stagger");
						character:setVariable("BumpDone", false);
						character:setVariable("BumpFall", true);
						character:setVariable("BumpFallType", "pushedFront");
						
						return;
					end
                end
				
				if sprintTime < minRunTime then
					-- original animation for slow approaches
					character:setSprinting(false); -- must set false to enable window climb.
					if isWindowFrame then
						character:climbThroughWindowFrame(collider);
					else
						character:climbThroughWindow(collider);
					end
				else
					-- TODO: try to use remotes to make the dive anim play
				
					-- use the window climb event to prevent desync (for some reason fence hopping doesnt sync to other players)
					--character:setSprinting(false)
					--character:climbThroughWindow(collider)
					
					-- make the player dive using the fence hop anims
					if didSmash then
						if playBlockAnim(character) then
							character:setVariable("DiveThruWindow", true);
						end
						if smashFail then
							character:setSprinting(false)
							delayFunc(function() 
								--prevent the player from rolling out a higher floor and landing on air
								if character:getVariableString("ClimbFenceOutcome") == 'falling' then
									
								else
									character:setVariable("ClimbFenceOutcome", "fall")
								end
							end, 1)
						end
					end
					character:setSprinting(true)
					character:climbOverFence(playerDir)
					if didSmash then
						local delay = 100
						--character:setVariable("DiveThruWindow", false);
						delayFunc(function() 
							character:setVariable("DiveThruWindow", false)
						end, delay)
					end
					
					
					-- lower endurance
					--playing the fence climb anim already drains endurance
					local currentEndurance = character:getStats():getEndurance();
					character:getStats():setEndurance(currentEndurance - 0.01);
					if character:getStats():getEndurance() < 0 then
						character:getStats():setEndurance(0);
					end
					
					
					local args_to_send = {player = character:getUsername(), playerDir=playerDir:index(), x=character:getX(), y=character:getY(), z=character:getZ(), ang=character:getDirectionAngle(), didSmash = didSmash, smashFail = smashFail}
					sendClientCommand('DiveThruWindows', 'hopWindow', args_to_send)
					
					
					local baseGlassChance = SandboxVars.DiveThruWindows.DiveBrokenWindowInjuryChance or 30
					
					local alrDamagedBonus = 0
					if tookDiveDmg == true then
						alrDamagedBonus = 8
					end
					if isWindow and not collider:isGlassRemoved() and ZombRand(0,math.max(1, BaseDodge + 10*(nimbleLvl + traitBonus + alrDamagedBonus + drunkPenalty) )) <= baseGlassChance then
						

						if lastCollided == collider and (character:getVariableBoolean("VaultOverSprint") == true or character:getVariableBoolean("ClimbFenceStarted") == true) then
							print('prevented over-damage')
						else
							dealGlassDamage(character, false)
						end
					end
					
					lastCollided = collider
					
				end
				
				
            else
			
				--faceplant against the barricade
				character:setBumpType("stagger");
				character:setVariable("BumpDone", false);
				character:setVariable("BumpFall", true);
				character:setVariable("BumpFallType", "pushedFront");
				return;
			
			end

            return;

        end

    end

end



Events.OnCreatePlayer.Add(OnCreatePlayer)
Events.OnObjectCollide.Add(jumpThroughWindow);