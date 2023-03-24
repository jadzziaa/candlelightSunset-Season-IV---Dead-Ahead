Darkvision = Darkvision or {}

-- Darkvision Trait

Darkvision.trait = function()
    TraitFactory.addTrait("Darkvision", "Darkvision", 4, "See at night like you were born to live in darkness.", false)
end

Events.OnGameBoot.Add(Darkvision.trait) 