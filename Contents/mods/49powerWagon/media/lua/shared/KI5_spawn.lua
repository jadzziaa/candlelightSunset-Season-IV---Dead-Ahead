--***********************************************************
--**                      bikinihorst                      **
--***********************************************************

KI5 = KI5 or {};

KI5["forcedSpawns"] = KI5["forcedSpawns"] or {};
KI5["forcedSpawnsMDKey"] = KI5["forcedSpawnsMDKey"] or "forced_vehicle_spawns";
--KI5["forcedSpawnBuffer"] = KI5["forcedSpawnBuffer"] or 5;

function KI5:addForcedSpawn(fullScriptName, x, y, options)
    if getScriptManager():getVehicle(fullScriptName)
    then
        if x and y and x > 0 and y > 0
        then
            local xy = tostring(x) .. "_" .. tostring(y);

            options = options or {};

            KI5["forcedSpawns"][xy] = {
                mdKey = xy,
                script = fullScriptName,
                direction = options["direction"] or IsoDirections.S,
                chance = options["chance"] or 100,
                skinIndex = options["skinIndex"] or nil,
                sandboxVar = options["sandboxVar"] or nil,
                modBlacklist = options["modBlacklist"] or {},
                modWhitelist = options["modWhitelist"] or {},
                mapBlacklist = options["mapBlacklist"] or {},
                mapWhitelist = options["mapWhitelist"] or {},
            };

            if options["needsVanillaMap"] ~= false
            then
                table.insert(KI5["forcedSpawns"][xy]["mapWhitelist"], "Muldraugh, KY");
            end
        end
    end
end

function KI5:tryForcedSpawn(square)
    local squareConfig = KI5["forcedSpawns"][tostring(square:getX()) .. "_" .. tostring(square:getY())];

    if squareConfig
    then
        if KI5:vehicleAlreadySpawned(squareConfig)
        then
            return false;
        end

        if KI5:vehicleIsAllowedToSpawn(squareConfig)
        then
            local roll = ZombRandBetween(1, 100);

            if roll <= squareConfig["chance"]
            then
                if not KI5:vehicleSpawnIsBlocked(square)
                then
                    addVehicleDebug(squareConfig["script"], squareConfig["direction"], squareConfig["skinIndex"], square);
                else
                    return false;
                end
            end

            KI5:rememberForcedSpawn(squareConfig);
        end
    end

    return true;
end

function KI5:rememberForcedSpawn(squareConfig)
    ModData.getOrCreate(KI5["forcedSpawnsMDKey"])[squareConfig["mdKey"]] = Calendar.getInstance():getTimeInMillis();
    ModData.transmit(KI5["forcedSpawnsMDKey"]);
end

-- checks

function KI5:vehicleAlreadySpawned(squareConfig)
    return ModData.getOrCreate(KI5["forcedSpawnsMDKey"])[squareConfig["mdKey"]];
end

function KI5:vehicleIsAllowedToSpawn(squareConfig)
    if squareConfig["sandboxVar"] and not SandboxVars["DAMN"][squareConfig["sandboxVar"]]
    then
        return false;
    end

    if #squareConfig["modBlacklist"] > 0 or #squareConfig["modWhitelist"] > 0
    then
        local modList = getActivatedMods();

        if #squareConfig["modBlacklist"]
        then
            local failed = {};

            for i, modId in ipairs(squareConfig["modBlacklist"])
            do
                if modList:contains(modId)
                then
                    table.insert(failed, modId);
                end
            end

            if #failed > 0
            then
                return false;
            end
        end

        if #squareConfig["modWhitelist"] > 0
        then
            local failed = {};

            for i, modId in ipairs(squareConfig["modWhitelist"])
            do
                if not modList:contains(modId)
                then
                    table.insert(failed, modId);
                end
            end

            if #failed > 0
            then
                return false;
            end
        end
    end

    if #squareConfig["mapBlacklist"] > 0 or #squareConfig["mapWhitelist"] > 0
    then
        local maps = string.split(getServerOptions():getOptionByName("Map"):getValue(), ";") or {};

        if #squareConfig["mapBlacklist"] > 0
        then
            local failed = {};

            for i, map in ipairs(maps)
            do
                if KI5:itemInArray(squareConfig["mapBlacklist"], map)
                then
                    table.insert(failed, map);
                end
            end

            if #failed > 0
            then
                return false;
            end
        end

        if #squareConfig["mapWhitelist"] > 0
        then
            local failed = {};

            for i, map in ipairs(squareConfig["mapWhitelist"])
            do
                if not KI5:itemInArray(maps, map)
                then
                    table.insert(failed, map);
                end
            end

            if #failed > 0
            then
                return false;
            end
        end
    end
    
    return true;
end

function KI5:vehicleSpawnIsBlocked(square)
    if square:isVehicleIntersecting()
    then
        return true;
    end

    return false;
end

-- helpers

function KI5:itemInArray(array, searchItem)
    for i, item in ipairs(array)
    do
        if string.trim(tostring(item)) == string.trim(tostring(searchItem))
        then
            return true;
        end
    end

    return false;
end

function KI5:printList(list, tpl)
    for i, item in ipairs(list)
    do
        PARP:log(string.format(tpl or "%s", tostring(item)));
    end
end

-- this will later on be in another file, but for now it is here and will only execute on the server side

if isClient()
then
    return;
end

Events.OnInitGlobalModData.Add(function() -- need global moddata to remember spawns
    Events.LoadGridsquare.Add(function(square)
        KI5:tryForcedSpawn(square);
    end);
end)