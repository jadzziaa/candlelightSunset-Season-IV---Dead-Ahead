local function WeaponLightBeam()

	local attacker	= getSpecificPlayer(0)
	local weapon	= nil

	if attacker ~= nil then				
		weapon	= attacker:getPrimaryHandItem()
	end
	
		if attacker:isAiming() and attacker:getPrimaryHandItem() and (string.find(weapon:getType(), "CAR15D")) then
			weapon:setTorchCone(true)
				weapon:setLightDistance(10)
				weapon:setLightStrength(1.5)
				end
		if not attacker:isAiming() and attacker:getPrimaryHandItem() and (string.find(weapon:getType(), "CAR15D")) then
		 weapon:setTorchCone(false)
				weapon:setLightDistance(0.0)
				weapon:setLightStrength(0.0)
			end
			end
			

Events.OnPlayerUpdate.Add(WeaponLightBeam)