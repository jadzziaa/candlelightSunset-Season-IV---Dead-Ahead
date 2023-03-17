EggonsMU.config.enableEvent("OnBeforeOpenHood")

local function onOpenVehicleHood(vehicle, player, usedHood)
    EWC_2_0.reset()
    local sandboxVars = SandboxVars.eggonsWorthwileCars2
    local possiblyConfig = EWC_2_0.updateVehicleTrunkIfRequiredFromHood(vehicle)
    possiblyConfig = EWC_2_0.updateEngineForceIfRequired(vehicle, sandboxVars, possiblyConfig)
end

Events.OnBeforeOpenHood.Add(onOpenVehicleHood)
