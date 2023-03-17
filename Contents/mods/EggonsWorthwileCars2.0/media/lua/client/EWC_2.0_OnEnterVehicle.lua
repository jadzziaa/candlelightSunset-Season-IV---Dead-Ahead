local function onEnterVehicle(player)
    local vehicle = player:getVehicle()
    local sandboxVars = SandboxVars.eggonsWorthwileCars2
    EWC_2_0.updateEngineForceIfRequired(vehicle, sandboxVars, possiblyConfig)
end
Events.OnEnterVehicle.Add(onEnterVehicle)
