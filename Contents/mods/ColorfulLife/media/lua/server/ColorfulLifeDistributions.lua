--[[
  v0.2
--]]

require "Items/ProceduralDistributions"

--##
--Increase the occurrence of light bulbs in certain areas.
--##
local coloredLightBulbsItems = {
    "LightBulbBlue",
    "LightBulbCyan",
    "LightBulbGreen",
    "LightBulbMagenta",
    "LightBulbOrange",
    "LightBulbPink",
    "LightBulbPurple",
    "LightBulbRed",
    "LightBulbYellow",
}
-- local coloredLightBulbsMainTargets = {
--     ElectronicStoreLights = 100,
--     GigamartLightbulb = 100,
-- }
local coloredLightBulbsTargets = {
    ArmyStorageElectronics = 1.5, -- +++
    ControlRoomCounter = 2,       -- +++
    ElectronicStoreLights = 22,   -- 9xcolored (0.01) + 4xdef (20,20,10,10)
    ElectronicStoreMusic = 10,    -- +++
    ElectronicStoreMisc = 4,      -- +++
    ElectronicStoreHAMRadio = 20, -- +++
    GigamartHouseElectronics = 6, -- +++
    GigamartLightbulb = 16,       -- 9xcolored (0.01) + 4xdef (8)
    GigamartToys = 6,             -- +++
    EngineerTools = 4,            -- 2xcolored (10)
    CrateToys = 6,                -- +++
    CrateMechanics = 1,           -- +++ 2xdef (10)
    CrateRandomJunk = 1,          -- +++ 1xdef (1)
    CrateElectronics = 3,         -- +++
    MechanicShelfElectric = 4,    -- +++
    GarageMechanics = 1,          -- +++ 1xdef (10)
    GasStorageMechanics = 2,      -- +++ 2xdef (20,10)    
    StoreShelfMechanics = 2,      -- +++ 2xdef (4)
    JanitorTools = 3,             -- +++ 2xdef (20,10)
    JanitorCleaning = 5,          -- +++
    MusicStoreSpeaker = 10,       -- +++
    MusicStoreCDs = 12,           -- +++
    DrugShackMisc = 4,            -- +++ 1xdef (8)
    KitchenRandom = 4,            -- 9xcolored (0.01) + 1xdef (1)
    RandomFiller = 2,             -- 1xdef (10)
    RadioFactoryComponents = 6,   -- 2xcolored (10)
}
local function coloredLightBulbsNewDistributions()
    --Items distribution
    for k,l in pairs(coloredLightBulbsTargets) do
        for j,h in ipairs(coloredLightBulbsItems) do
            table.insert(ProceduralDistributions.list[k].items, h)
            table.insert(ProceduralDistributions.list[k].items, l)
        end
    end
    --Junk items distribution
    -- for m,n in pairs(coloredLightBulbsMainTargets) do
    --     local color = ZombRand(1, 10)
    --     table.insert(ProceduralDistributions.list[m].junk.items, coloredLightBulbsItems[color])
    --     table.insert(ProceduralDistributions.list[m].junk.items, 100)
    -- end
end

--##
--Reduce the occurrence of light bulbs in certain areas.
--##
local lightBulbsItem = "LightBulb"
local lightBulbsTargets = {
    CrateMechanics = -10,        -- 2x10
    ElectronicStoreLights = -36, -- 2x20 + 2x10
    GasStorageMechanics = -20,   -- 1x20 + 1x10
    GigamartLightbulb = -22,     -- 4x8
    JanitorTools = -20,          -- 1x20 + 1x10
    RandomFiller = -2,           -- 1x10
}
local function lightBulbsNewDistributions()
    for k,l in pairs(lightBulbsTargets) do
        table.insert(ProceduralDistributions.list[k].items, lightBulbsItem)
        table.insert(ProceduralDistributions.list[k].items, l)
    end
end

--##
--Send to events
--##
Events.OnPreDistributionMerge.Add(lightBulbsNewDistributions)
Events.OnPreDistributionMerge.Add(coloredLightBulbsNewDistributions)
