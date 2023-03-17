Adrenaline = {
    playerUpdateCounters = {}
}

local ADRENALINE_UPDATE_DELAY = 60;

local FATIGUE_ABSORB_RATE = 0.0075;
local FATIGUE_RELEASE_RATE = 0.007;
local FATIGUE_MULTIPLIER = 1.015;

local FATIGUE_MAX_ABSORBED_BY_LEVEL = {
    [0] = 0,
    [1] = 0.05,
    [2] = 0.10,
    [3] = 0.15,
    [4] = 0.2,
    [5] = 0.2
}

function Adrenaline.shouldPlayerUpdate(player)
    local counter = Adrenaline.playerUpdateCounters[player];
    if not counter then
        counter = 0;
    end

    if counter < ADRENALINE_UPDATE_DELAY then
        Adrenaline.playerUpdateCounters[player] = counter + 1;
        return false;
    else
        Adrenaline.playerUpdateCounters[player] = 0;
        return true;
    end
end

function Adrenaline.onPlayerUpdate(player)
    if not Adrenaline.shouldPlayerUpdate(player) then
        return;
    end

    local panicLevel = player:getMoodles():getMoodleLevel(MoodleType.Panic);
    local maxAbsorb = FATIGUE_MAX_ABSORBED_BY_LEVEL[panicLevel];

    local playerData = player:getModData();
    local storedFatigue = playerData.adrenalineFatigue;
    if not storedFatigue then
        storedFatigue = 0;
    end

    --print("Fatigue: "..player:getStats():getFatigue());
    --print("Stored: "..storedFatigue);

    if player:isAsleep() then
        Adrenaline.releaseAllFatigue(player, playerData);
    elseif storedFatigue > maxAbsorb then
        Adrenaline.releaseFatigue(player, playerData);
    else
        Adrenaline.absorbFatigue(player, playerData, panicLevel);
    end
end

function Adrenaline.releaseAllFatigue(player, playerData)
    local storedFatigue = playerData.adrenalineFatigue;
    if not storedFatigue or storedFatigue == 0 then
        return;
    end

    local currentFatigue = player:getStats():getFatigue();
    player:getStats():setFatigue(currentFatigue + (storedFatigue * FATIGUE_MULTIPLIER));
    playerData.adrenalineFatigue = 0;
end

function Adrenaline.releaseFatigue(player, playerData)
    local storedFatigue = playerData.adrenalineFatigue;
    if not storedFatigue or storedFatigue == 0 then
        return;
    end

    local currentFatigue = player:getStats():getFatigue();
    if currentFatigue >= 1 then
        return;
    end

    if storedFatigue <= FATIGUE_RELEASE_RATE then      
        player:getStats():setFatigue(currentFatigue + (storedFatigue * FATIGUE_MULTIPLIER));
        playerData.adrenalineFatigue = 0;
    else
        player:getStats():setFatigue(currentFatigue + (FATIGUE_RELEASE_RATE * FATIGUE_MULTIPLIER));
        playerData.adrenalineFatigue = storedFatigue - FATIGUE_RELEASE_RATE;
    end
end

function Adrenaline.absorbFatigue(player, playerData, panicLevel)
    local storedFatigue = playerData.adrenalineFatigue;
    if not storedFatigue then
        storedFatigue = 0;
    end

    local currentFatigue = player:getStats():getFatigue();
    if currentFatigue < 0.55 then
        return;
    end

    local maxAbsorb = FATIGUE_MAX_ABSORBED_BY_LEVEL[panicLevel];
    if storedFatigue >= maxAbsorb then
        return;
    end

    -- Determine how much fatigue we're going to absorb
    local fatigueToAbsorb = FATIGUE_ABSORB_RATE * panicLevel;
    if fatigueToAbsorb > maxAbsorb - storedFatigue then
        fatigueToAbsorb = maxAbsorb - storedFatigue;
    end
    if fatigueToAbsorb > currentFatigue then
        fatigueToAbsorb = currentFatigue;
    end

    player:getStats():setFatigue(currentFatigue - fatigueToAbsorb);
    playerData.adrenalineFatigue = storedFatigue + fatigueToAbsorb;
end

function Adrenaline.setup()
    if not isClient() or getServerOptions():getBoolean("SleepAllowed") then
        Events.OnPlayerUpdate.Add(Adrenaline.onPlayerUpdate);
    end
end

Events.OnGameStart.Add(Adrenaline.setup);
