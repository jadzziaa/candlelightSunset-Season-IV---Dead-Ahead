MoreSmokes = MoreSmokes or {}; 

local sVars = SandboxVars.MoreSmokes;
sVars.Munchies = sVars.Munchies or 2; 
sVars.StonerPerk = sVars.StonerPerk or 2; 
sVars.Paranoid = sVars.Paranoid or 2;

if not getActivatedMods():contains("MoodleFramework")
then
    return;
else
    Events.OnGameStart.Add(function()
        -- events
        Events.OnPlayerUpdate.Add(function(player)
            MoreSmokes.updateStonedMoodle(player);
        end);

        Events.EveryOneMinute.Add(function()
            local moodleLevel = MF.getMoodle("Stoned") and MF.getMoodle("Stoned"):getLevel();
            local player = getPlayer();

            if moodleLevel > 0
            then
                local stats = player:getStats();
                local bodyDamage = player:getBodyDamage();
                local stonerPerk = player:HasTrait("Stoner") and (0.6 * sVars.StonerPerk) or 1;
                local munchiesMod = moodleLevel >= 0.2 and (0.0025 * sVars.Munchies) or moodleLevel > 0.6 and (0.005 * sVars.Munchies) or 0;
                if stats:getHunger() < 0.35 then
                    stats:setHunger(math.min(stats:getHunger() + (munchiesMod / stonerPerk), 0.35));
                end
                if stats:getThirst() < 0.35 then
                    stats:setThirst(math.min(stats:getThirst() + (munchiesMod / stonerPerk), 0.35));
                end
                if stats:getPain() >= 10.1 then
                    stats:setPain(math.max(stats:getPain() - (munchiesMod * stonerPerk * 2000), 0));
                end
                if bodyDamage:getBoredomLevel() > 10 then
                    bodyDamage:setBoredomLevel(bodyDamage:getBoredomLevel() - (munchiesMod * stonerPerk * 150));
                end
                if bodyDamage:getUnhappynessLevel() > 10 then
                    bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - (munchiesMod * stonerPerk * 150));
                end
                if not player:HasTrait("ParanoidToker") and stats:getStress() > 0.1 then
                    stats:setStress(math.max(stats:getStress() - (munchiesMod * (1.5 * sVars.Paranoid)), 0));
                end
                if player:HasTrait("ParanoidToker") and stats:getPanic() >= 0.1 and stats:getPanic() < 0.8 then
                    stats:setPanic(math.max(stats:getPanic() - (munchiesMod * (0.6 * sVars.Paranoid)), 0));
                end
            end    
            MoreSmokes.stonedDecrease(player);
        end);
    end);
end

require "MF_ISMoodle"

-- Creates custom moodle
MF.createMoodle("Stoned");

local isPlayerValid = false

--Thresholds for if the moodle shows up and what happens when moodle option is turned off
local function setThreshold()
    if sVars.Moodle == true then 
        MF.getMoodle("Stoned"):setThresholds(nil, nil, nil, nil, 0.2, 0.4, 0.6, 0.8);
	else
        MF.getMoodle("Stoned"):setThresholds(nil, nil, nil, nil, nil, nil, nil, nil);
	end
end

-- added based on mod comments
local function validPlayer(playerIndex, player)
	if player == getPlayer() then
		isPlayerValid = true
		setThreshold()
	else
		print("Player is not valid")
	end
end

-- The values of being stoned go from 0-100 and varying levels of the moodle show up after each increase of 20
function MoreSmokes.updateStonedMoodle(player)
    local modData = player:getModData()
    
    modData.StonedChange = modData.StonedChange or 0
    
    if isPlayerValid and modData.StonedChange > 80 then
        MF.getMoodle("Stoned"):setValue(0.8)
    elseif isPlayerValid and modData.StonedChange > 60 then
        MF.getMoodle("Stoned"):setValue(0.6)
    elseif isPlayerValid and modData.StonedChange > 40 then
        MF.getMoodle("Stoned"):setValue(0.4)
    elseif isPlayerValid and modData.StonedChange >= 20 then
        MF.getMoodle("Stoned"):setValue(0.2)
    elseif isPlayerValid then
        MF.getMoodle("Stoned"):setValue(0.0)
    end
end     

Events.OnCreatePlayer.Add(validPlayer);