require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"

local proceduresCount = 0
local procedures = {}
local containersLists = {}
local mimicData = {}
local distributionsTable = Distributions[1]
local PDL = ProceduralDistributions.list
local registeredProcedures = {}

local printO = function(uselessAndPatheticLuaTable, message)
    message = message or ""
    if type(uselessAndPatheticLuaTable) ~= "table" then
        print("Not a table: " .. message .. ", but " .. type(uselessAndPatheticLuaTable))
        print(uselessAndPatheticLuaTable)
        return
    end
    local result = "\n "
    if message then
        result = result .. "******** " .. message .. " ***********"
    end
    result = result .. "\n{"
    for key, value in pairs(uselessAndPatheticLuaTable) do
        result = result .. "\n    " .. tostring(key) .. ": " .. tostring(value) .. ","
    end
    result = result .. "\n}"
    print(result)
end

local function isEntryValid(entry)
    if not type(entry) == "table" then
        return false
    elseif not entry[1] or not type(entry[1]) == "string" then
        -- ITEM
        return false
    elseif not entry[2] or not type(entry[2]) == "string" then
        -- ROOM
        return false
    elseif not entry[3] or not type(entry[3]) == "string" then
        -- CONTAINER
        return false
    elseif not entry[4] or not type(entry[4]) == "number" or entry[4] < 0 then
        -- CHANCE
        return false
    elseif entry[5] ~= nil and (not type(entry[5]) == "number" or entry[5] < 0) then
        -- ROLLS
        return false
    elseif entry[6] ~= nil and (not type(entry[6]) == "number" or entry[6] < 0) then
        -- MIN
        return false
    elseif entry[7] ~= nil and (not type(entry[7]) == "number" or entry[7] < 0) then
        -- MAX
        return false
    elseif entry[8] ~= nil and (not type(entry[8]) == "number" or entry[8] < 0) then
        -- PROCEDURE WEIGHT
        return false
    end
    return true
end

local function buildContainersList(DT_room, room)
    local output = {}
    for possiblyContainer, _ in pairs(DT_room) do
        if type(possiblyContainer) == "table" then
            output[possiblyContainer] = true
        end
    end
    containersLists[room] = output
    return output
end

local function processEntry(entry)
    if not isEntryValid(entry) then
        print("ERROR: Invalid entry ", entry[1])
        return
    end
    local item = entry[1]
    local room = entry[2]
    local container = entry[3]
    local chance = entry[4]
    local rolls = entry[5] or 1
    local min = entry[6] or 0
    local max = entry[7] or 1
    local procedureWeight = entry[8] or 100

    local DT_room = distributionsTable[room]
    local allContainersList

    if not DT_room then
        print("ERROR: Invalid entry - room not found in distributionsTable: ", room)
        return
    end
    local DT_container = DT_room[container]
    if not DT_container and container ~= "all" then
        -- print("No DT_container")
        DT_room[container] = {procedural = true, procList = {}}
        allContainersList = {[container] = true}
    elseif container == "all" then
        -- print("Conteiner == all")
        -- avoid duplication of iterations if list already exists for room
        allContainersList = containersLists[room] or buildContainersList(DT_room, room)
    else
        -- print("DT_Container found")
        allContainersList = {[container] = true}
    end

    local procedureName =
        "EggonsDistribution_" ..
        tostring(min) .. "_" .. tostring(max) .. "_" .. tostring(procedureWeight) .. "_" .. tostring(rolls)
    -- print("procedureName = ", procedureName)
    local distributionsEntry = {name = procedureName, min = min, max = max, weightChance = procedureWeight}
    local procedureRequiresRegistering = false
    local itemsTable
    -- printO(allContainersList, "allContainersList")
    -- printO(distributionsEntry, "distributionsEntry")
    for containerName, _ in pairs(allContainersList) do
        -- print("containerName: ", containerName)
        DT_container = DT_room[containerName]
        if DT_container.procedural then
            -- printO(DT_container.procList, "DT_container.procList after")
            -- print("Is procedural")
            procedureRequiresRegistering = true
            -- printO(DT_container.procList, "DT_container.procList before")
            table.insert(DT_container.procList, distributionsEntry)
        else
            -- printO(DT_container.items, "DT_container.items after")
            -- print("Is NOT procedural")
            itemsTable = DT_container.items
            -- printO(DT_container.items, "DT_container.items before")
            table.insert(itemsTable, item)
            table.insert(itemsTable, chance)
        end
    end
    if procedureRequiresRegistering then
        if not PDL[procedureName] then
            PDL[procedureName] = {rolls = rolls, items = {}}
            registeredProcedures[procedureName] = {}
        end
        -- printO(ProceduralDistributions.list[procedureName], "PDL[procedureName]")
        -- PREVENTS ITEMS FROM BEING ADDED TO SAME PROCEDURE MULTIPLE TIMES
        if not registeredProcedures[procedureName][item] then
            itemsTable = PDL[procedureName].items
            table.insert(itemsTable, item)
            table.insert(itemsTable, chance)
            registeredProcedures[procedureName][item] = true
        end
    -- printO(ProceduralDistributions.list[procedureName].items, "itemsTable in procedureRequiringReg")
    end
end

-- local configTemplate = {
--     {item, room, container, chance, rolls, min, max, procedureWeight},
--     {item, room, container, chance, rolls, min, max, procedureWeight}
-- }

function EggonsMU.registerDistributions(distributionData)
    if not type(distributionData) == "table" then
        print("ERROR: distributionData is not a table!")
        return
    end
    for i, config in ipairs(distributionData) do
        processEntry(config)
    end
end

local function insertMimicData(items, mimicingItem, chance, modifier)
    table.insert(items, mimicingItem)
    table.insert(items, chance * modifier)
end

local function shouldSkipStandard(skipCFG, roomBagOrProfession, container)
    local S = skipCFG.standard
    if S[roomBagOrProfession] then -- roomBagOrProfession found
        if not container or S[roomBagOrProfession] == true then -- this is a bag or room to be skipped completely
            return true
        elseif S[roomBagOrProfession][container] then -- not bag and container found
            return true
        else -- not bag but container not found, do not skip
            return false
        end
    else -- roomBagOrProfession not found, do not skip
        return false
    end
end
local function shouldSkipProcedural(skipCFG, procedureName)
    return skipCFG.procedural[procedureName]
end
local function shouldSkipVehicle(skipCFG, container)
    return skipCFG.vehicle[container]
end

local function buildAndApplyMimicDataForItem(mimicedItem, mimicingItem, modifier, skipCFG)
    local mimicCFG = {procedural = {}, standard = {}, vehicle = {}}
    if not skipCFG.skipAllProcedural then
        for procedureName, procedureCFG in pairs(PDL) do
            for i, entry in ipairs(procedureCFG.items) do
                if entry == mimicedItem then
                    local items = procedureCFG.items
                    local chance = items[i + 1]
                    if not shouldSkipProcedural(skipCFG, procedureName) then
                        insertMimicData(items, mimicingItem, chance, modifier)
                    end
                    -- print("Adding procedure to mimicCFG: ", procedureName .. ", chance " .. tostring(chance))
                    mimicCFG.procedural[procedureName] = chance
                    -- print("mimicCFG.procedural[procedureName]: ", mimicCFG.procedural[procedureName])
                    break
                end
            end
        end
    end
    if not skipCFG.skipAllStandard then
        for roomBagOrProfession, roomCFG in pairs(distributionsTable) do
            if roomBagOrProfession.items then -- It is bag
                local items = roomBagOrProfession.items
                for i, entry in ipairs(items) do
                    if entry == mimicedItem then
                        local chance = items[i + 1]
                        if not shouldSkipStandard(skipCFG, roomBagOrProfession, nil) then
                            insertMimicData(items, mimicingItem, chance, modifier)
                        end
                        -- print("Adding bag to mimicCFG: ", roomBagOrProfession .. ", chance " .. tostring(chance))
                        -- mimicCFG.standard[roomBagOrProfession] = {}
                        mimicCFG.standard[roomBagOrProfession] = chance
                        break
                    end
                end
            else -- room or profession
                for possiblyContainer, possiblyContainerCFG in pairs(roomCFG) do
                    if type(possiblyContainerCFG) == "table" and possiblyContainerCFG.items then
                        local items = possiblyContainerCFG.items
                        for i, entry in ipairs(items) do
                            if entry == mimicedItem then
                                local chance = items[i + 1]
                                if not shouldSkipStandard(skipCFG, roomBagOrProfession, container) then
                                    insertMimicData(items, mimicingItem, chance, modifier)
                                end
                                -- print(
                                --     "Adding roomOrProfession to mimicCFG: ",
                                --     roomBagOrProfession .. ", chance " .. tostring(chance)
                                -- )
                                mimicCFG.standard[roomBagOrProfession] = {}
                                mimicCFG.standard[roomBagOrProfession][possiblyContainer] = chance
                                break
                            end
                        end
                    end
                end
            end
        end
    end
    if not skipCFG.skipAllVehicles then
        for container, containerCFG in pairs(VehicleDistributions) do
            local items = containerCFG.items
            if items then
                for i, entry in ipairs(items) do
                    if entry == mimicedItem then
                        local chance = items[i + 1]
                        if not shouldSkipVehicle(skipCFG, container) then
                            insertMimicData(items, mimicingItem, chance, modifier)
                        end
                        mimicCFG.vehicle[container] = chance
                        break
                    end
                end
            end
        end
    end
    mimicData[mimicedItem] = mimicCFG
end

local function mimicDataForItemFromExistingData(mimicCFG, mimicingItem, modifier, skipCFG)
    local P = mimicCFG.procedural
    local S = mimicCFG.standard
    local V = mimicCFG.vehicle
    -- print("Initiated mimicDataForItemFromExistingData")
    -- EggonsMU.printFuckingNormalObject(mimicCFG, "mimicCFG")
    -- EggonsMU.printFuckingNormalObject(P, "mimicCFG P")
    -- EggonsMU.printFuckingNormalObject(S, "mimicCFG S")
    if not skipCFG.skipAllProcedural then
        -- print("Entered procedural for: ", mimicingItem)
        for procedureName, chance in pairs(P) do
            -- print("Looping procedural entries, ", tostring(procedureName) .. " chance " .. tostring(chance))
            if not shouldSkipProcedural(skipCFG, procedureName) then
                local items = PDL[procedureName].items
                -- print("Inserting mimiced distr data for: ", mimicingItem)
                insertMimicData(items, mimicingItem, chance, modifier)
            end
        end
    end
    if not skipCFG.skipAllStandard then
        -- print("Entered standard for: ", mimicingItem)
        for room, roomCFG in pairs(S) do
            -- print("Looping rooms. Room: ", room)
            for container, chance in pairs(roomCFG) do
                -- print("Looping containers. Container, chance: ", tostring(container) .. ", " .. tostring(chance))
                if not shouldSkipStandard(skipCFG, room, container) then
                    local items = distributionsTable[room][container].items
                    -- print("Inserting mimiced procedural data for: ", mimicingItem)
                    insertMimicData(items, mimicingItem, chance, modifier)
                end
            end
        end
    end
    if not skipCFG.skipAllVehicles then
        for container, chance in pairs(V) do
            if not shouldSkipVehicle(skipCFG, container) then
                local items = VehicleDistributions[container].items
                insertMimicData(items, mimicingItem, chance, modifier)
            end
        end
    end
end

function EggonsMU.mimicEntry(mimicedItem, mimicingItem, modifier, skipCFG)
    modifier = modifier or 1
    skipCFG = skipCFG or {}
    skipCFG.standard = skipCFG.standard or {}
    skipCFG.procedural = skipCFG.procedural or {}
    skipCFG.vehicle = skipCFG.vehicle or {}
    local mimicCFG = mimicData[mimicedItem]
    if mimicCFG then
        -- print("MimicCFG found for: ", mimicingItem)
        mimicDataForItemFromExistingData(mimicCFG, mimicingItem, modifier, skipCFG)
    else
        -- print("MimicCFG NOT found for: ", mimicingItem)
        buildAndApplyMimicDataForItem(mimicedItem, mimicingItem, modifier, skipCFG)
    end
end
function EggonsMU.mimicDistribution(mimicInput)
    for i, entryCFG in ipairs(mimicInput) do
        EggonsMU.mimicEntry(entryCFG[1], entryCFG[2], entryCFG[3], entryCFG[4])
    end
end

-- HOW IT LOOKS
-- PROCEDURAL
-- locations = {
--     room = {
--         container = {
--             procedural = true,
--             procList = {
--                 {name="MagazineRackMaps", min=0, max=1, weightChance=50},
--             }
--         }
--     }
-- }
-- NON PROCEDURAL
-- locations = {
-- room = {
--    cashregister = {
--       rolls = 4,
--       items = {
--           "Money", 2,
--           "Money", 100,
--           "Money", 100,
--       }
-- },
-- ProceduralDistributions.list.MagazineRackMaps = {
--     rolls = 4,
--     items = {
--         "MuldraughMap", 10,
--     }
-- }
