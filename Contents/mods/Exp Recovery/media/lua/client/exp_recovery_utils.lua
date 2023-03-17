function ExpRecovery:Round(num, idp)

	local mult = 10 ^ (idp or 0)

	return math.floor(num * mult + 0.5) / mult

end

function ExpRecovery:GetSkillBookByPerk(perk)

	for _, skill_book in pairs(SkillBook) do
		
		if skill_book.perk == perk then
		
			return skill_book
			
		end
		
	end

end

function ExpRecovery:GetSkillBookMaxMultByPerkStage(skill_book, perk_stage)

	return skill_book["maxMultiplier" .. perk_stage]

end

local blocked = false

function ExpRecovery:SetBlocked(blocked_val)

	blocked = blocked_val

end

function ExpRecovery:IsBlocked(char)

	return blocked

end

function ExpRecovery:GiveMissedExpForPerk(character, perk, perk_stage)

	local exp_data = character:getModData()["ExpRecovery"]

	if not exp_data then
		return
	end

	exp_data = exp_data[perk:getId()]

	if not exp_data or not exp_data[perk_stage] then
		return
	end

	local exp_obj = character:getXp()

	blocked = true

	local previous_exp = exp_obj:getXP(perk)
	
	exp_obj:AddXP(perk, 1)

	exp_obj:AddXP(perk, exp_data[perk_stage] / (exp_obj:getXP(perk) - previous_exp) - 1)

	exp_data[perk_stage] = 0

	blocked = false

end

function ExpRecovery:GetMissedExpForSkillBook(item, character, perk)

	return character:getModData()["ExpRecovery"][perk:getId()][math.ceil(item:getLvlSkillTrained() / 2)]

end