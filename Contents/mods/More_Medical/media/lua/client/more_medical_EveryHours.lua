function more_medical_EveryHours()
    -- print("more_medical_EveryHours")
    player = getPlayer()
    if player:getModData()["mmSneezeTimerMin"] then
    -- print(player:getModData()["mmSneezeTimerMin"])
        if player:getModData()["mmSneezeTimerMin"] <= 0 then
            player:getBodyDamage():setNastyColdSneezeTimerMin(200)
            player:getBodyDamage():TriggerSneezeCough()
            player:getBodyDamage():setSneezeCoughActive(1)
            player:getModData()["mmSneezeTimerMin"] = nil
        else
            player:getModData()["mmSneezeTimerMin"] = player:getModData()["mmSneezeTimerMin"] - 1
        end
    end
    if player:getModData()["mmMorphine"] then
        if player:getModData()["mmMorphine"] <= 0 then
            player:getModData()["mmMorphine"] = nil
        else
            player:getModData()["mmMorphine"] = player:getModData()["mmMorphine"] - 1
        end
    end
    if player:getModData()["mmBurnTreatment"] then
        if player:getModData()["mmBurnTreatment"] <= 0 then
            player:getModData()["mmBurnTreatment"] = nil
        else
            player:getModData()["mmBurnTreatment"] = player:getModData()["mmBurnTreatment"] - 1
        end
    end
    if player:getModData()["mmAdrenalin"] then
        if player:getModData()["mmAdrenalin"] <= 0 then
            player:getModData()["mmAdrenalin"] = nil
            player:getStats():setFatigue(1)
            player:getStats():setHunger(player:getStats():getHunger() + 0.2)
        else
            player:getModData()["mmAdrenalin"] = player:getModData()["mmAdrenalin"] - 1
        end
    end
end

Events.EveryHours.Add(more_medical_EveryHours)