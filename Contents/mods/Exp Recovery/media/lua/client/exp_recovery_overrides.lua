local player_base = __classmetatables[IsoPlayer.class].__index
ExpRecovery.Say = ExpRecovery.Say or player_base.Say
player_base.Say = function(...)

	local text = {...}
	text = text[2]

	if text then

		local tbl = {
			[getText("IGUI_PlayerText_KnowSkill")] = true,
			[getText("IGUI_PlayerText_BookObsolete")] = true,
		}

		if tbl[text] then

			local reading_info = ExpRecovery.ReadingInfo

			if reading_info then

				if ExpRecovery:GetMissedExpForSkillBook(reading_info.Item, reading_info.Character, reading_info.Perk) > 0 then
					
					return
					
				end

			end

		end

	end

	return ExpRecovery.Say(...)

end