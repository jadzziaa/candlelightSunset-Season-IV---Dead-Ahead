ExpRecovery.LastPerkInfo = {}

function ExpRecovery:SetLastPerkInfo(perk, exp, mult, level)

	self.LastPerkInfo[perk] = {
		Exp = exp,
		Multiplier = mult,
		Level = level,
	}
	
end

function ExpRecovery:GetLastPerkInfo(perk)

	return self.LastPerkInfo[perk]
	
end

function ExpRecovery:UpdateLastPerkInfo(character, perk)

	local exp_obj = character:getXp()
	
	self.LastPerkInfo[perk] = {
		Exp = exp_obj:getXP(perk),
		Multiplier = math.max(1, exp_obj:getMultiplier(perk)),
		Level = character:getPerkLevel(perk) + 1,
	}
	
end