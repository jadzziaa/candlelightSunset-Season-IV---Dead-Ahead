local _original_animEvent = ISChopTreeAction.animEvent

function ISChopTreeAction:animEvent(event, parameter)
	if event == 'ChopTree' then
    -- modded line | gets initial weapon condition to be used later on
    local condition = self.axe:getCondition()

		self.tree:WeaponHit(self.character, self.axe)
		self:useEndurance()

    -- modded line | removes 2nd roll for lowering weapon condition
		-- if ZombRand(self.axe:getConditionLowerChance() * 2 + self.character:getMaintenanceMod() * 2) == 0 then
			-- self.axe:setCondition(self.axe:getCondition() - 1)
			-- ISWorldObjectContextMenu.checkWeapon(self.character);
		-- else
			-- self.character:getXp():AddXP(Perks.Maintenance, 1)
		-- end
    
    -- modded line | does a comparison to see if condition was lowered, then calls one of the previously commented lines.
    if condition > self.axe:getCondition() then
      ISWorldObjectContextMenu.checkWeapon(self.character);
    else
      -- If no damage to weapon was done, reward Maintenance XP
      self.character:getXp():AddXP(Perks.Maintenance, 1)
    end
    
		if self.tree:getObjectIndex() == -1 then
			self:forceComplete()
		end
	end
end