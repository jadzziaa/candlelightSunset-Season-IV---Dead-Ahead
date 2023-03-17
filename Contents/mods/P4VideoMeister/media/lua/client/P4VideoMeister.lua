require "P4RecordedMedia"

local P4VideoMeister = {}

P4VideoMeister.tooltipPrefix = getText("UI_P4VideoMeister_Tooltip_Prefix")
P4VideoMeister.tooltipTarget = nil

P4VideoMeister.options = {
	showText = true,
	showIcon = true,
	showTooltip = true,
}

SetModOptions = function(options)
	P4VideoMeister.options = options
end

P4VideoMeister.original_doDrawItem = ISLiteratureMediaList.doDrawItem
function ISLiteratureMediaList:doDrawItem(y, item, alt)
	local result
	result = P4VideoMeister.original_doDrawItem(self, y, item, alt)
	if P4VideoMeister.options.showText then
		local skillNames = P4RecordedMedia.getSkillNames(item.item:getId())
		if skillNames then
			local skillName = table.concat(skillNames, " / ")
			self:drawText("[" .. skillName .. "]", 43, y, 1, 1, 1, 1, UIFont.Small)
		end
	end
	if P4VideoMeister.options.showIcon then
		local textures = P4RecordedMedia.getSkillTextures(item.item:getId())
		if textures then
			local x = self:getWidth() - (20 * (#textures + 1))
			for _,texture in ipairs(textures) do
				self:drawTexture(texture, x, y+2, 1, 1, 1, 1)
				x = x + 20
			end
		end
	end
	return result
end

P4VideoMeister.original_render = ISToolTipInv.render
function ISToolTipInv:render()
	if P4VideoMeister.options.showTooltip then
		local hashCode = self.item:hashCode()
		if P4VideoMeister.tooltipTarget ~= hashCode then
			local mediaData = self.item:getMediaData()
			if mediaData then
				local skillNames = P4RecordedMedia.getSkillNames(mediaData:getId())
				if skillNames then
					local tooltip = self.item:getTooltip()
					local newLine = P4VideoMeister.tooltipPrefix .. " (" .. table.concat(skillNames, " / ") .. ")"
					if tooltip then
						if not string.find(tooltip, newLine, 1, true) then
							tooltip = newLine .. "\n" .. tooltip
						end
					else
						tooltip = newLine
					end
					self.item:setTooltip(tooltip);
				end
			end
		end
		P4VideoMeister.tooltipTarget = hashCode
	end
	P4VideoMeister.original_render(self)
end
