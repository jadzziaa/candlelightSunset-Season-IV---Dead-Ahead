EWC_2_0 = EWC_2_0 or {}
EWC_2_0.JointCarsConfigs = {}
EWC_2_0.LoudnessConfigs = {}
EWC_2_0.EngineForceConfigs = {}

local EWC_SandboxVars = SandboxVars.eggonsWorthwileCars2

function EWC_2_0.addSingleCarConfigDictionary(configDictionary)
    for carFullName, carConfig in pairs(configDictionary) do
        EWC_2_0.JointCarsConfigs[carFullName] = carConfig
    end
end

function EWC_2_0.addMultipleCarConfigDictionaries(configDictionaries)
    EWC_2_0.JointCarsConfigs = EWC_2_0.VanillaCarsConfigs
    for dictionaryName, configDictionary in pairs(configDictionaries) do
        print("EWC 2.0 - Adding dictionary: ", dictionaryName)
        EWC_2_0.addSingleCarConfigDictionary(configDictionary)
    end
end

-- local gameVer = getCore():getGameVersion():getInt()
-- if gameVer < 41073 then
--     getSandboxOptions():loadCurrentGameBinFile()
-- end

getSandboxOptions():load()

-- copy mod car configs to common dictionary
EWC_2_0.addMultipleCarConfigDictionaries(EWC_2_0.ModdedCarsConfigs)

if getActivatedMods():contains("VehicleTweakerAPI") then
    require("VehicleTweaker_Core")

    function applyLoudness(scriptFullName, carConfig)
        TweakVehicle(scriptFullName, "engineLoudness", carConfig.engineLoudness)
    end

    if EWC_SandboxVars.ApplyLoudnessBalance then
        local scripts = ScriptManager.instance:getAllVehicleScripts()
        for i = 0, scripts:size() - 1 do
            local script = scripts:get(i)
            local scriptFullName = script:getFullName()
            local carConfig = EWC_2_0.getVehicleScriptConfig(script)
            if carConfig then
                -- carConfig.engineLoudness = 50000 -- 10400
                applyLoudness(scriptFullName, carConfig)
            end
        end
    end
end
