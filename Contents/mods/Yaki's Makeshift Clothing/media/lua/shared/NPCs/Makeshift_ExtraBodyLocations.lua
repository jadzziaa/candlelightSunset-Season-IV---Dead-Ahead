--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Locations must be declared in render-order.
-- Location IDs must match BodyLocation= and CanBeEquipped= values in items.txt.
local group = BodyLocations.getGroup("Human")



group:getOrCreateLocation("SwordSheath")
group:getOrCreateLocation("ShieldSlot")
group:getOrCreateLocation("TorsoRig")
group:getOrCreateLocation("TorsoRig2")
group:getOrCreateLocation("waistbags")
group:getOrCreateLocation("UpperArmLeft")
group:getOrCreateLocation("UpperArmRight")
group:getOrCreateLocation("ThighLeft")
group:getOrCreateLocation("ThighRight")
group:getOrCreateLocation("LowerBody")
group:getOrCreateLocation("Pauldrons")
group:getOrCreateLocation("HandPlateLeft")
group:getOrCreateLocation("HandPlateRight")
group:getOrCreateLocation("ShinPlateLeft")
group:getOrCreateLocation("ShinPlateRight")
group:getOrCreateLocation("SpecialMask")

group:setExclusive("SwordSheath", "Back")
group:setExclusive("ShieldSlot", "Back")

