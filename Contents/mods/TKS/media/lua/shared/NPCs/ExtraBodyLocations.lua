--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Locations must be declared in render-order.
-- Location IDs must match BodyLocation= and CanBeEquipped= values in items.txt.
local group = BodyLocations.getGroup("Human")

group:getOrCreateLocation("KnifeSheathLeg")

group:setExclusive("KnifeSheathLeg", "KnifeSheathLeg")

group:getOrCreateLocation("KnifeSheathBack")

group:setExclusive("KnifeSheathBack", "KnifeSheathBack")

group:getOrCreateLocation("KatanaSheath")

group:setExclusive("KatanaSheath", "KatanaSheath")
