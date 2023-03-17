local function onCreatePlayer(_, character)

	local ticks_to_pass = 3

	local function badCoderzWillBurnInHell()

		if ticks_to_pass > 0 then

			ticks_to_pass = ticks_to_pass - 1

			return

		else

			Events.OnTickEvenPaused.Remove(fuckBadCoderz)

		end

		local mod_data = character:getModData()
		mod_data["ExpRecovery"] = mod_data["ExpRecovery"] or {}

		local tbl = PerkFactory.PerkList

		for i = 0, tbl:size() - 1 do

			local perk = tbl:get(i)

			if ExpRecovery:GetSkillBookByPerk(perk) then

				local perk_id = perk:getId()
			
				mod_data["ExpRecovery"][perk_id] = mod_data["ExpRecovery"][perk_id] or {
					[1] = 0,
					[2] = 0,
					[3] = 0,
					[4] = 0,
					[5] = 0,
				}

				local exp_obj = character:getXp()
				
				ExpRecovery.LastPerkInfo[perk] = {
					Exp = exp_obj:getXP(perk),
					Multiplier = math.max(1, exp_obj:getMultiplier(perk)),
					Level = character:getPerkLevel(perk) + 1,
				}
				
			end

		end

	end
	Events.OnTickEvenPaused.Add(badCoderzWillBurnInHell)

end
Events.OnCreatePlayer.Add(onCreatePlayer)

local function addXP(character, perk, exp)

	if ExpRecovery:IsBlocked() then
		return ExpRecovery:UpdateLastPerkInfo(character, perk)
	end
		
	local skill_book = ExpRecovery:GetSkillBookByPerk(perk)

	if not skill_book then
		return ExpRecovery:UpdateLastPerkInfo(character, perk)
	end

	local perk_level = character:getPerkLevel(perk)

	if perk_level >= 10 then
		return ExpRecovery:UpdateLastPerkInfo(character, perk)
	end

	local exp_data = character:getModData()["ExpRecovery"][perk:getId()]

	if not exp_data then
		return ExpRecovery:UpdateLastPerkInfo(character, perk)
	end

	local last_perk_info = ExpRecovery:GetLastPerkInfo(perk)

	local exp_before = last_perk_info.Exp
	local skill_mult = last_perk_info.Multiplier
	
	exp = exp / skill_mult * SandboxVars.ExpRecovery.ExpSaveMultiplier
	
	local total_exp_prev_stage
	for perk_stage = math.ceil(last_perk_info.Level / 2), 5 do

		local _exp = exp

		local skill_mult_max = ExpRecovery:GetSkillBookMaxMultByPerkStage(skill_book, perk_stage)

		local total_exp_for_stage = perk:getTotalXpForLevel(perk_stage * 2)
		total_exp_prev_stage = total_exp_prev_stage or perk:getTotalXpForLevel((perk_stage - 1) * 2)

		local exp_on_stage = exp_before - math.min(exp_before, total_exp_prev_stage)

		local exp_for_stage = total_exp_for_stage - total_exp_prev_stage
		
		local available_exp_data_cup_for_stage = math.max(0, exp_for_stage / skill_mult_max * (skill_mult_max - skill_mult) - exp_data[perk_stage])
		
		if skill_mult < skill_mult_max then

			local missed_exp = exp * (skill_mult_max - skill_mult)
			local missed_exp_on_stage = math.min(missed_exp, available_exp_data_cup_for_stage)

			exp_data[perk_stage] = exp_data[perk_stage] + missed_exp_on_stage

			exp = (missed_exp - missed_exp_on_stage) / (skill_mult_max - skill_mult)

		else

			exp = exp - (exp_for_stage - exp_on_stage) / skill_mult

		end

		if exp <= 0 then
			break
		end

		total_exp_prev_stage = total_exp_for_stage

	end

	ExpRecovery:UpdateLastPerkInfo(character, perk)

end
Events.AddXP.Add(addXP)