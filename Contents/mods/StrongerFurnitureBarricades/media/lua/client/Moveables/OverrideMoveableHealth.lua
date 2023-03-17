local ISMoveableSpriteProps_getObjectHealth_og = ISMoveableSpriteProps.getObjectHealth

function ISMoveableSpriteProps:getObjectHealth()
    local ogHealth = ISMoveableSpriteProps_getObjectHealth_og(self)
    return ogHealth * SandboxVars.MHM.HealthMultiplier
end