local oldISTakePillAction_perform = ISTakePillAction.perform
function ISTakePillAction:perform()
    local bodyDamage = self.character:getBodyDamage()
    local playerStats = self.character:getStats()
    
    if self.item:getType() == "PillsCommercialPainkillers" then
        -- обезболивание 50% от ванильных
        if (self.character:getStats():getDrunkenness() > 10.0f) then
            self.character:PainMeds(0.15f * 0.5f);
            self.character:setPainEffect(5400f * 4); -- эффект 4 часа
        else
            self.character:PainMeds(0.45f * 0.5f);
        end
        -- лечение гриппа 5%
        if bodyDamage:getColdStrength() <= 5 then
            bodyDamage:setColdStrength(0.0f)
            bodyDamage:setHasACold(false)
            bodyDamage:setCatchACold(0.0f)
        else
            bodyDamage:setColdStrength(bodyDamage:getColdStrength() - 5.0);
        end
        -- отравление 5%
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 5)
        
    elseif self.item:getType() == "PillsPrescriptionPainkillers" then
        -- обезболивание 90% от ванильных
        if (playerStats:getDrunkenness() > 10.0f) then
            self.character:PainMeds(0.15f * 0.9f);
            self.character:setPainEffect(5400f * 6); -- эффект 6 часов
        else
            self.character:PainMeds(0.45f * 0.9f);
        end
        -- отравление +25%
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 10) -- +15 = 40%
        
    elseif self.item:getType() == "PillsCaffeine" then
        -- сонливость -30%
        playerStats:setFatigue(playerStats:getFatigue() - 0.3)
        -- отравление 5%
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 5)
        
    elseif self.item:getType() == "PillsCommercialAntibiotic" then
        -- инфекция -25%
        bodyDamage:setFakeInfectionLevel(bodyDamage:getFakeInfectionLevel() - 25)
        -- отравление +25%
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 15)

    elseif self.item:getType() == "PillsAntiPoisoning" then
        -- отравление 0
        bodyDamage:setPoisonLevel(0)
        -- боль +50
        self.character:setPainEffect(self.character:getPainEffect() + 25) -- TODO
        -- голод/жажда + 50
        playerStats:setHunger(playerStats:getHunger() + 0.5)
        playerStats:setThirst(playerStats:getThirst() + 0.5)
        -- сонливость +15%
        playerStats:setFatigue(playerStats:getFatigue() + 0.15)
        
    elseif self.item:getType() == "PillsCommercialSedative" then
        -- убрать панику 50% от ванили
        if (playerStats:getDrunkenness() > 10.0f) then
            self.character:BetaBlockers(0.075f);
        else
            self.character:BetaBlockers(0.15f);
        end
        -- убрать стресс до 25%
        if playerStats:getStress() <= 0.25 then
            playerStats:setStress(0)
        else
            playerStats:setStress(playerStats:getStress() - 0.25)
        end
        -- несчастье +5%
        bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() + 5)
        -- отравление +5%
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 5)
        -- сонливость +10%
        playerStats:setFatigue(playerStats:getFatigue() + 0.1)
        
    elseif self.item:getType() == "PillsPharmacyPrescription" then
        -- отравление +10%
        bodyDamage:setPoisonLevel(bodyDamage:getPoisonLevel() + 10)
    end
    
    oldISTakePillAction_perform(self)
    self.item:Use()
end


-- if (this.getParentChar() != null && this.getParentChar().getStats().Drunkenness > 10.0f) {
                -- this.getParentChar().BetaBlockers(0.15f);
            -- }
            -- else {
                -- this.getParentChar().BetaBlockers(0.3f);
            -- }