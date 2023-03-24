RewardingNightCombat = RewardingNightCombat or {};
RewardingNightCombat.server = {};
RewardingNightCombat.constants = {};
RewardingNightCombat.sandboxSettings = {};

RewardingNightCombat.constants.multipliers = {0, 0.1, 0.15, 0.25, 0.5, 0.75, 1, 1.5, 2, 3, 4, 6.5, 9};
RewardingNightCombat.constants.hours = {24, 1, 2, 3, 4 ,5, 6, 7, 8, 9, 10 , 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};

RewardingNightCombat.Status = {
    ["INACTIVE"] = 1,
    ["STARTED"] = 2,
    ["DURING"] = 3,
    ["ENDED"] = 4,
}

RewardingNightCombat.server.fetchSandboxVars = function()
    RewardingNightCombat.sandboxSettings.enableIndicator = SandboxVars.RewardingNightCombat.enableIndicator;
    RewardingNightCombat.sandboxSettings.draggableIndicator = SandboxVars.RewardingNightCombat.draggableIndicator;
    RewardingNightCombat.sandboxSettings.indicatorColor = SandboxVars.RewardingNightCombat.indicatorColor;

    RewardingNightCombat.sandboxSettings.enableTriggerSound = SandboxVars.RewardingNightCombat.enableTriggerSound;
    RewardingNightCombat.sandboxSettings.triggerProbability = SandboxVars.RewardingNightCombat.triggerProbability;
    RewardingNightCombat.sandboxSettings.startAfterXDays = SandboxVars.RewardingNightCombat.startAfterXDays;

    RewardingNightCombat.sandboxSettings.startSummer = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.startTimeSummer];
    RewardingNightCombat.sandboxSettings.endSummer = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.endTimeSummer];
    RewardingNightCombat.sandboxSettings.startAutumn = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.startTimeAutumn];
    RewardingNightCombat.sandboxSettings.endAutumn = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.endTimeAutumn];
    RewardingNightCombat.sandboxSettings.startWinter = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.startTimeWinter];
    RewardingNightCombat.sandboxSettings.endWinter = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.endTimeWinter];
    RewardingNightCombat.sandboxSettings.startSpring = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.startTimeSpring];
    RewardingNightCombat.sandboxSettings.endSpring = RewardingNightCombat.constants.hours[SandboxVars.RewardingNightCombat.endTimeSpring];

    RewardingNightCombat.sandboxSettings.axeMultiplier = RewardingNightCombat.constants.multipliers[SandboxVars.RewardingNightCombat.axeBonusMultiplier];
    RewardingNightCombat.sandboxSettings.longBluntMultiplier = RewardingNightCombat.constants.multipliers[SandboxVars.RewardingNightCombat.longBluntBonusMultiplier];
    RewardingNightCombat.sandboxSettings.shortBluntMultiplier = RewardingNightCombat.constants.multipliers[SandboxVars.RewardingNightCombat.shortBluntBonusMultiplier];
    RewardingNightCombat.sandboxSettings.longBladeMultiplier = RewardingNightCombat.constants.multipliers[SandboxVars.RewardingNightCombat.longBladeBonusMultiplier];
    RewardingNightCombat.sandboxSettings.shortBladeMultiplier = RewardingNightCombat.constants.multipliers[SandboxVars.RewardingNightCombat.shortBladeBonusMultiplier];
    RewardingNightCombat.sandboxSettings.spearMultiplier = RewardingNightCombat.constants.multipliers[SandboxVars.RewardingNightCombat.spearBonusMultiplier];
    RewardingNightCombat.sandboxSettings.aimingMultiplier = RewardingNightCombat.constants.multipliers[SandboxVars.RewardingNightCombat.aimingBonusMultiplier];
    RewardingNightCombat.sandboxSettings.ignoreAimingXPNerf = SandboxVars.RewardingNightCombat.ignoreAimingXPNerf;
end

RewardingNightCombat.server.decideStatus = function(curr_hour, target_hour_start, target_hour_end)
    local mod_state = ModData.getOrCreate("RNC_state");
    local math_floor = math.floor;
    local rand = ZombRand;
    local curr_hour = math_floor(curr_hour);
    if getGameTime():getNightsSurvived() >= RewardingNightCombat.sandboxSettings.startAfterXDays
            and ((curr_hour >= target_hour_start or curr_hour <= target_hour_end) and target_hour_start > target_hour_end)
            or (curr_hour >= target_hour_start and curr_hour <= target_hour_end and target_hour_start ~= target_hour_end) then
        if curr_hour == target_hour_start then
            local prob = rand(100); -- outputs between 0 and 99
            if prob < RewardingNightCombat.sandboxSettings.triggerProbability then
                mod_state.skipping = false;
                return RewardingNightCombat.Status.STARTED;
            else
                if target_hour_start == target_hour_end then
                    mod_state.skipping = false;
                else
                    mod_state.skipping = true;
                end
            end
        elseif mod_state.skipping == false then
            if RewardingNightCombat.status == RewardingNightCombat.Status.INACTIVE then
                local prob = rand(100); -- outputs between 0 and 99
                if prob >= RewardingNightCombat.sandboxSettings.triggerProbability then
                    return RewardingNightCombat.Status.INACTIVE;
                end
            end
            if curr_hour == (target_hour_end) then
                mod_state.skipping = false;
                return RewardingNightCombat.Status.ENDED;
            else
                return RewardingNightCombat.Status.DURING;
            end
        end
    end
    return RewardingNightCombat.Status.INACTIVE;
end

RewardingNightCombat.server.getStatus = function(sandboxSettings)
    local game_time = getGameTime();
    local curr_month = game_time:getMonth();
    local curr_hour = game_time:getTimeOfDay();
    if curr_month >= 5 and curr_month <= 7 then --summer
        return RewardingNightCombat.server.decideStatus(curr_hour, sandboxSettings.startSummer, sandboxSettings.endSummer);
    elseif curr_month >= 8 and curr_month <= 10 then --autumn
        return RewardingNightCombat.server.decideStatus(curr_hour, sandboxSettings.startAutumn, sandboxSettings.endAutumn);
    elseif curr_month == 11 or curr_month <= 1 then --winter
        return RewardingNightCombat.server.decideStatus(curr_hour, sandboxSettings.startWinter, sandboxSettings.endWinter);
    elseif curr_month >= 2 and curr_month <= 4 then --spring
        return RewardingNightCombat.server.decideStatus(curr_hour, sandboxSettings.startSpring, sandboxSettings.endSpring);
    end
    return RewardingNightCombat.Status.INACTIVE; -- just in case
end

RewardingNightCombat.server.check = function()
    RewardingNightCombat.status = RewardingNightCombat.server.getStatus(RewardingNightCombat.sandboxSettings);
    if isServer() == true then
        sendServerCommand("RewardingNightCombat", "RNCStatus", {RewardingNightCombat.status});
    else
        RewardingNightCombat.client.updatePlayer();
    end

    local mod_state = ModData.getOrCreate("RNC_state");
    mod_state.status = RewardingNightCombat.status;
    --print("status: " ..tostring(mod_state.status).. " skipped_today" ..tostring(mod_state.skipping));
end

RewardingNightCombat.server.onWeaponHitXp = function(player, weapon, _, damage)
    if RewardingNightCombat.status == RewardingNightCombat.Status.STARTED
            or RewardingNightCombat.status == RewardingNightCombat.Status.DURING then
        local min_fn = math.min;
        local original_exp = 0.0;
        local xp = 0.0;
        if weapon:isRanged() and RewardingNightCombat.sandboxSettings.aimingMultiplier ~= 0 then
            if player:getPerkLevel(Perks.Aiming) < 5 or RewardingNightCombat.sandboxSettings.ignoreAimingXPNerf then
                original_exp = player:getLastHitCount() * 2.7;
                xp = original_exp * RewardingNightCombat.sandboxSettings.aimingMultiplier;
                player:getXp():AddXP(Perks.Aiming, xp);
            else
                original_exp = player:getLastHitCount();
                xp = original_exp * RewardingNightCombat.sandboxSettings.aimingMultiplier;
                player:getXp():AddXP(Perks.Aiming, xp);
            end
        else
            if weapon:getCategories():contains("Axe") and RewardingNightCombat.sandboxSettings.axeMultiplier ~= 0 then
                original_exp =  min_fn(damage * 0.9, 3);
                xp = original_exp * RewardingNightCombat.sandboxSettings.axeMultiplier;
                player:getXp():AddXP(Perks.Axe, xp);
            elseif weapon:getCategories():contains("Blunt") and RewardingNightCombat.sandboxSettings.longBluntMultiplier ~= 0 then
                original_exp =  min_fn(damage * 0.9, 3);
                xp = original_exp * RewardingNightCombat.sandboxSettings.longBluntMultiplier;
                player:getXp():AddXP(Perks.Blunt, xp);
            elseif weapon:getCategories():contains("Spear") and RewardingNightCombat.sandboxSettings.spearMultiplier ~= 0 then
                original_exp =  min_fn(damage * 0.9, 3);
                xp = original_exp * RewardingNightCombat.sandboxSettings.spearMultiplier;
                player:getXp():AddXP(Perks.Spear, xp);
            elseif weapon:getCategories():contains("LongBlade") and RewardingNightCombat.sandboxSettings.longBladeMultiplier ~= 0 then
                original_exp =  min_fn(damage * 0.9, 3);
                xp = original_exp * RewardingNightCombat.sandboxSettings.longBladeMultiplier;
                player:getXp():AddXP(Perks.LongBlade, xp);
            elseif weapon:getCategories():contains("SmallBlade") and RewardingNightCombat.sandboxSettings.shortBladeMultiplier ~= 0 then
                original_exp =  min_fn(damage * 0.9, 3);
                xp = original_exp * RewardingNightCombat.sandboxSettings.shortBladeMultiplier;
                player:getXp():AddXP(Perks.SmallBlade, xp);
            elseif weapon:getCategories():contains("SmallBlunt") and RewardingNightCombat.sandboxSettings.shortBluntMultiplier ~= 0 then
                original_exp =  min_fn(damage * 0.9, 3);
                xp = original_exp * RewardingNightCombat.sandboxSettings.shortBluntMultiplier;
                player:getXp():AddXP(Perks.SmallBlunt, xp);
            end
        end
        --print("org xp: " ..original_exp.. " - bonus exp: " ..xp.. " ratio: " ..tostring((xp + original_exp)/original_exp))
    end
end

--RewardingNightCombat.server.onClientCommand = function(module, command, player, args)
--    if command == "RNCStatusRequest" then
--        print("RNCStatusRequest"..tostring(player))
--        sendServerCommand(player,"RewardingNightCombat", "RNCStatus", {RewardingNightCombat.status});
--    end
--end

RewardingNightCombat.server.setup = function()
    RewardingNightCombat.server.fetchSandboxVars();
    RewardingNightCombat.status = RewardingNightCombat.Status.INACTIVE;
    RewardingNightCombat.status = RewardingNightCombat.server.getStatus(RewardingNightCombat.sandboxSettings);
end

RewardingNightCombat.server.onInitGlobalModData = function(isNewGame)
    local mod_state = ModData.getOrCreate("RNC_state");
    if mod_state.status == nil then
        mod_state.status = RewardingNightCombat.status;
    end
    if mod_state.skipping == nil then
        mod_state.skipping = false;
    end
end

Events.OnInitGlobalModData.Add(RewardingNightCombat.server.onInitGlobalModData);

Events.OnGameStart.Add(RewardingNightCombat.server.setup);
Events.OnGameTimeLoaded.Add(RewardingNightCombat.server.setup);

if isClient() == false then
    Events.EveryHours.Add(RewardingNightCombat.server.check);
end

--if isServer() == true then
--    Events.OnClientCommand.Add(RewardingNightCombat.server.onClientCommand);
--end

if isServer() == false then
    Events.OnWeaponHitXp.Add(RewardingNightCombat.server.onWeaponHitXp);
    if getWorld():getGameMode() ~= "Multiplayer" then
        Events.OnGameStart.Add(RewardingNightCombat.client.updatePlayer);
    end
end






