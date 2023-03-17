-- big thanks to bikinihorst for this epic feature

local modList = getActivatedMods();

if not modList:contains("FuelAPI") and not modList:contains("FRUsedCarsFT") -- these modify the vanilla actions so they can't be hooked into properly anymore
then
    require "Vehicles/TimedActions/ISAddGasolineToVehicle";
    require "Vehicles/TimedActions/ISTakeGasolineFromVehicle";
    require "Vehicles/TimedActions/ISRefuelFromGasPump";

    -- toggle-o that legg-o

    function setLegUp(player, vehicle, isUp)
        if vehicle and vehicle:getScript():getFullName() == "Base.86fordE150dnd"
        then
            local leg = vehicle:getPartById("E150FurRearLeg");

            if leg and not leg:getDoor():isLocked() and not leg:getDoor():isLockBroken()
            then
                sendClientCommand(player, "vehicle", "setDoorOpen", {
                    vehicle = vehicle:getId(),
                    part = leg:getId(),
                    open = isUp
                });
                leg:getDoor():setOpen(isUp);

                local animation = isUp
                    and "Open"
                    or "Close";

                vehicle:playPartAnim(leg, animation);
                vehicle:playPartSound(leg, player, animation);
                vehicle:playActorAnim(leg, animation, player);
            end
        end
    end

    -- auto wiring


    for i, action in ipairs({
        "ISAddGasolineToVehicle", "ISTakeGasolineFromVehicle", "ISRefuelFromGasPump"
    })
    do
        for j, fnName in ipairs({
            "perform", "stop", "start",
        })
        do
            local vanillaFn = _G[action][fnName];

            _G[action][fnName] = function(self)
                vanillaFn(self);
                setLegUp(self.character, self.vehicle, fnName == "start");
            end
        end
    end
end