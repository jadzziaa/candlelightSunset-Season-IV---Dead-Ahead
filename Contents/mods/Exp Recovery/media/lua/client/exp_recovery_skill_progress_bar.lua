-- ExpRecovery.ISSkillProgressBar_updateTooltip = ExpRecovery.ISSkillProgressBar_updateTooltip or ISSkillProgressBar.updateTooltip
-- local old_updateTooltip = ExpRecovery.ISSkillProgressBar_updateTooltip

-- function ISSkillProgressBar:updateTooltip(selected_level)

-- 	old_updateTooltip(self, selected_level)

-- 	local mod_data = self.char:getModData()["ExpRecovery"]

-- 	local perk_missed_exp = mod_data[self.perk:getId()]

-- 	if not perk_missed_exp then
-- 		return
-- 	end

-- 	local missed_exp_on_selected_level = perk_missed_exp[math.ceil((selected_level + 1) / 2)]

-- 	if missed_exp_on_selected_level <= 0 then
-- 		return
-- 	end

-- 	local int, decimal = math.modf(missed_exp_on_selected_level)

-- 	-- self.message = self.message .. " <LINE> " .. getText("IGUI_Easy_Literature_Missed_Exp", missed_exp_on_selected_level) .. "%"
-- 	self.message = string.format("%s <LINE> %." .. (decimal == 0 and 0 or math.min(2, string.len(tostring(decimal)))) .. "f", self.message, round(missed_exp_on_selected_level, 2))
	
-- end

ExpRecovery.ISSkillProgressBar_renderPerkRect = ExpRecovery.ISSkillProgressBar_renderPerkRect or ISSkillProgressBar.renderPerkRect
local old_renderPerkRect = ExpRecovery.ISSkillProgressBar_renderPerkRect

local width = 18

function ISSkillProgressBar:renderPerkRect()

	old_renderPerkRect(self)

	if self.level == 10 then
		return
	end

	local exp_data = self.char:getModData()["ExpRecovery"]

	if not exp_data then
		return
	end

	exp_data = exp_data[self.perk:getId()]

	if not exp_data then
		return
	end

	local total_missed_exp = exp_data[1] + exp_data[2] + exp_data[3] + exp_data[4] + exp_data[5]

	local x = self.level * 20
	local y = 0
	
	local missed_exp_on_current_level = math.min(self.xpForLvl - self.xp, total_missed_exp)
	local missed_exp_progress = (missed_exp_on_current_level / self.xpForLvl)
	
	self:drawTextureScaled(self.UnlockedSkill, x + width * (self.xp / self.xpForLvl), y, width * missed_exp_progress, 18, 0.9, .1, .4, 1)

	total_missed_exp = total_missed_exp - missed_exp_on_current_level

	for level = self.level + 2, 10 do

		if total_missed_exp <= 0 then
			break
		end

		x = x + 20

		local exp_for_level = self.perk:getXpForLevel(level)

		local missed_exp_progress = math.min(1, total_missed_exp / exp_for_level)

		self:drawTextureScaled(self.UnlockedSkill, x, y, width * missed_exp_progress, 18, 0.9, .1, .4, 1)

		total_missed_exp = total_missed_exp - exp_for_level

	end

end