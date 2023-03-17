require 'NPCs/BodyLocations'
--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Locations must be declared in render-order.
-- Location IDs must match BodyLocation= and CanBeEquipped= values in items.txt.
local group = BodyLocations.getGroup("Human")


group:getOrCreateLocation("SMUIWebbingPlus")
group:getOrCreateLocation("SMUITorsoRigPlus")
group:getOrCreateLocation("SMUILeftArmPlus")
group:getOrCreateLocation("SMUIRightArmPlus")

group:getOrCreateLocation("SMUICosmeticOne")
group:getOrCreateLocation("SMUICosmeticTwo")
group:getOrCreateLocation("SMUICosmeticThree")

group:getOrCreateLocation("SMUIGlovesPlus")
group:getOrCreateLocation("SMUIBootsPlus")

group:getOrCreateLocation("SMUIJumpsuitPlus")

group:setExclusive("SMUIJumpsuitPlus", "Boilersuit")
group:setExclusive("SMUIJumpsuitPlus", "Sweater")
group:setExclusive("SMUIJumpsuitPlus", "SweaterHat")
group:setExclusive("SMUIJumpsuitPlus", "Jacket")
group:setExclusive("SMUIJumpsuitPlus", "Jacket_Down")
group:setExclusive("SMUIJumpsuitPlus", "JacketSuit")
group:setExclusive("SMUIJumpsuitPlus", "JacketHat")
group:setExclusive("SMUIJumpsuitPlus", "Jacket_Bulky")
group:setExclusive("SMUIJumpsuitPlus", "JacketHat_Bulky")
group:setExclusive("SMUIJumpsuitPlus", "Dress")
group:setExclusive("SMUIJumpsuitPlus", "Pants")
group:setExclusive("SMUIJumpsuitPlus", "Skirt")
group:setExclusive("SMUIJumpsuitPlus", "BathRobe")
group:setExclusive("SMUIJumpsuitPlus", "FullSuitHead")
group:setExclusive("SMUIJumpsuitPlus", "FullTop")
group:setExclusive("SMUIJumpsuitPlus", "BodyCostume")
group:setExclusive("SMUIJumpsuitPlus", "FullSuit")
group:setExclusive("SMUIJumpsuitPlus", "FullTop")