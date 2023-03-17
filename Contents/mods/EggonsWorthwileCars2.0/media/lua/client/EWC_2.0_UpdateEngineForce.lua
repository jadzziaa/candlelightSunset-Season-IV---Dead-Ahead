EWC_2_0 = EWC_2_0 or {}

function EWC_2_0.updateEngineForce(vehicle, sandboxVars, possiblyConfig)
    local vehicleConfig = possiblyConfig or EWC_2_0.getAndStoreVehicleConfig(vehicle)

    if not vehicleConfig or not vehicleConfig.engineForce then
        return vehicleConfig
    end

    local engineForce = vehicleConfig.engineForce

    -- get current values to re-set
    local engineQuality = vehicle:getEngineQuality()
    local initialVehicleLoudness = vehicle:getEngineLoudness()

    -- calculate error ratio for loudness
    vehicle:setEngineFeature(engineQuality, 1000, engineForce)
    local firstAttemptLoudness = vehicle:getEngineLoudness()
    local ratio = 1000 / firstAttemptLoudness

    -- attempt to set new value
    vehicle:setEngineFeature(engineQuality, initialVehicleLoudness * ratio, engineForce)
    local secondAttemptLoudness = vehicle:getEngineLoudness()

    -- calculate difference
    local diff = (secondAttemptLoudness - initialVehicleLoudness)
    if dif ~= 0 then
        -- apply corrected value
        vehicle:setEngineFeature(engineQuality, (initialVehicleLoudness - diff) * ratio, engineForce)
    end
    vehicle:transmitEngine()
    return vehicleConfig
end

function EWC_2_0.updateEngineForceIfRequired(vehicle, sandboxVars, possiblyConfig)
    if sandboxVars.ApplyPowerBalance then
        return EWC_2_0.updateEngineForce(vehicle, sandboxVars, possiblyConfig)
    end
    return possiblyConfig
end
