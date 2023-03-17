
if EggonsMU then
    local CoffeeBagSeedMimicCfg = {
      { "farming.RedRadishBagSeed", "CoffeeBagSeed", 1, {skipAllVehicles = true} }
    }
    EggonsMU.mimicDistribution(CoffeeBagSeedMimicCfg)
    -- print ("Load EggonsMU.mimicDistribution for CoffeeBagSeedMimicCfg")
else
    -- print ("Does not load EggonsMU.mimicDistribution for CoffeeBagSeedMimicCfg")
end
