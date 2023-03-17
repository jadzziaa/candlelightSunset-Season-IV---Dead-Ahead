
function OnEat_SyretteHighGradePainkillers(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    -- обезболивание 1500% от ванильных
    character:PainMeds(0.45f * 1.5f);
    character:setPainEffect(5400f * 3); -- эффект 3 часа
    playerStats:setPain(10);
    -- отравление +50%
    if character:getModData()["mmMorphine"] then
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 50)
    else
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 5)
        character:getModData()["mmMorphine"] = 5
    end
    -- сонливость +40%
    playerStats:setFatigue(playerStats:getFatigue() + 0.4)
end

function OnEat_SyretteAdrenalin(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    -- сонливость -100%
    playerStats:setFatigue(0)
    -- выносливость +30%
    playerStats:setEndurance(playerStats:getEndurance() + 0.3)
    character:getModData()["mmAdrenalin"] = 2
    -- паника +50%
    playerStats:setPanic(playerStats:getPanic() + 50)
    -- стресс +25%
    playerStats:setStress(playerStats:getStress() + 25)
    -- отравление +25%
    bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 15)
end

function OnEat_SyrettePrescriptionAntibiotic(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    -- инфекция -50%
    bodyDamage:setFakeInfectionLevel(bodyDamage:getFakeInfectionLevel() - 50)
    -- отравление +25%
    bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 15)
    -- сонливость +10%
    playerStats:setFatigue(playerStats:getFatigue() + 0.1)
end

function OnEat_SyrettePrescriptionSedatives(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    -- паника 0
    playerStats:setPanic(0)
    -- стресс 0
    playerStats:setStress(0)
    -- несчастье -50%
    bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - 50)
    -- сонливость +50%
    playerStats:setFatigue(playerStats:getFatigue() + 0.5)
    -- отравление +25%
    bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 15)
end

function OnEat_BottleFluMedication(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    
    -- лечение гриппа 20%
    if bodyDamage:getColdStrength() <= 20 then
        bodyDamage:setColdStrength(0.0f)
        bodyDamage:setHasACold(false)
        bodyDamage:setCatchACold(0.0f)
    else
        bodyDamage:setColdStrength(bodyDamage:getColdStrength() - 20.0);
    end
    -- сонливость +10%
    playerStats:setFatigue(playerStats:getFatigue() + 0.1)
    -- отравление +10%
    bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 10)
end

function OnEat_HotDrinkFluMedication(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    if food:getHeat() > 1.3f then
        -- лечение гриппа 20%
        if bodyDamage:getColdStrength() <= 20 then
            bodyDamage:setColdStrength(0.0f)
            bodyDamage:setHasACold(false)
            bodyDamage:setCatchACold(0.0f)
        else
            bodyDamage:setColdStrength(bodyDamage:getColdStrength() - 20.0);
        end
        -- обезболивание 40% от ванильных
        if (character:getStats():getDrunkenness() > 10.0f) then
            character:PainMeds(0.15f * 0.4f);
        else
            character:PainMeds(0.45f * 0.4f);
        end
    else
        -- неэффективное лечение гриппа 20%
        bodyDamage:setColdStrength(bodyDamage:getColdStrength() - 20.0);
        -- обезболивание 10% от ванильных
        if (character:getStats():getDrunkenness() > 10.0f) then
            character:PainMeds(0.15f * 0.1f);
        else
            character:PainMeds(0.45f * 0.1f);
        end
    end
    -- сонливость +10%
    playerStats:setFatigue(playerStats:getFatigue() + 0.1)
    -- отравление +10%
    bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 10)
end

function OnEat_BottleCoughSyrup(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    
    bodyDamage:setNastyColdSneezeTimerMin((getSandboxOptions():getDayLengthMinutes() / 4) * 60 * 100)
    character:getModData()["mmSneezeTimerMin"] = 5
    -- сонливость +5%
    playerStats:setFatigue(playerStats:getFatigue() + 0.05)
    -- отравление +5%
    bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 5)
end

function OnEat_NasalSpray(food, character, percent)
    local bodyDamage = character:getBodyDamage()
    local playerStats = character:getStats()
    
    bodyDamage:setNastyColdSneezeTimerMin((getSandboxOptions():getDayLengthMinutes() / 4) * 60 * 100)
    character:getModData()["mmSneezeTimerMin"] = 5
end




