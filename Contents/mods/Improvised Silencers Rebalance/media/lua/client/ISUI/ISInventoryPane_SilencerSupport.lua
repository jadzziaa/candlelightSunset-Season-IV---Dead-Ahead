require "ISUI/ISInventoryPane"
local silencerParams = require "ImprovisedSilencerParams"

local function drawProgressBarEx(self, fraction, xoff, top, pbWidth, fgBar)
	self:drawProgressBar(xoff, top + (self.itemHgt / 2) - 1, pbWidth, 2, fraction, fgBar)
end

local function drawTextAndProgressBarEx(self, text, fraction, xoff, top, pbWidth, fgText, fgBar)
	self:drawText(text, xoff, top + (self.itemHgt - self.fontHgt) / 2, fgText.a, fgText.r, fgText.g, fgText.b, self.font)
	local textWid = getTextManager():MeasureStringX(self.font, text)
	local pbOff = math.max(90, textWid + 20) + xoff
	drawProgressBarEx(self, fraction, pbOff, top, pbWidth, fgBar)
	return pbOff + pbWidth
end

local function getSilencerConditionFraction(item, weapon)
	local maxDamage = silencerParams[item:getFullType()].maxDamage
	local damage = item:getModData().damage or (weapon and weapon:hasModData() and weapon:getModData().canonDamage) or 0
	return (maxDamage - damage) / maxDamage
end

local function isSilencer(item)
	return silencerParams[item:getFullType()] ~= nil
end

function ISInventoryPane:drawItemDetails(item, y, xoff, yoff, red)

    if item == nil then
        return;
    end

--~ 	print("renderdetail");
--~ 	print(red);
	local hdrHgt = self.headerHgt
	local top = hdrHgt + y * self.itemHgt + yoff
    local hc = getCore():getGoodHighlitedColor()
    local fgBar = {r=hc:getR(), g=hc:getG(), b=hc:getB(), a=1}
	local fgText = {r=0.6, g=0.8, b=0.5, a=0.6}
	if red then fgText = {r=0.0, g=0.0, b=0.5, a=0.7} end
	
	-- change by phobos2077 BEGIN
	if instanceof(item, "HandWeapon") then
		local text = getText("IGUI_invpanel_Condition") .. ":"
		local canon = item:getCanon()
		if canon and isSilencer(canon) then
			local imageOff = drawTextAndProgressBarEx(self, text, item:getCondition() / item:getConditionMax(), xoff + 30, top, 100, fgText, fgBar)
				+ 20
			local imageSize = self.itemHgt - 4
			self:drawTextureScaled(canon:getTex(), imageOff, top + 2, imageSize, imageSize, 1, 1, 1, 1)
			drawProgressBarEx(self, getSilencerConditionFraction(canon, item), imageOff + imageSize + 10, top, 50, fgBar)
		else
			self:drawTextAndProgressBar(text, item:getCondition() / item:getConditionMax(), xoff, top, fgText, fgBar)
		end
	elseif instanceof(item, "WeaponPart") and isSilencer(item) then
		local text = getText("IGUI_invpanel_Condition") .. ":"
		self:drawTextAndProgressBar(text, getSilencerConditionFraction(item), xoff, top, fgText, fgBar)
	-- change by phobos2077 END
	
	elseif instanceof(item, "Drainable") then
		local text = getText("IGUI_invpanel_Remaining") .. ":"
		self:drawTextAndProgressBar(text, item:getUsedDelta(), xoff, top, fgText, fgBar)
    elseif item:getMeltingTime() > 0 then
		local text = getText("IGUI_invpanel_Melting") .. ":"
		self:drawTextAndProgressBar(text, item:getMeltingTime() / 100, xoff, top, fgText, fgBar)
	elseif instanceof(item, "Food") then
		if item:isIsCookable() and not item:isFrozen() and item:getHeat() > 1.6 then
			local ct = item:getCookingTime()
			local mtc = item:getMinutesToCook()
			local mtb = item:getMinutesToBurn()
			local f = ct / mtc;
			local s = getText("IGUI_invpanel_Cooking") .. ":"
			if ct > mtb then
				s = getText("IGUI_invpanel_Burnt") .. ":"
			elseif ct > mtc then
				s = getText("IGUI_invpanel_Burning") .. ":"
				f = (ct - mtc) / (mtb - mtc);
                fgBar.r = getCore():getBadHighlitedColor():getR()
                fgBar.g = getCore():getBadHighlitedColor():getG()
                fgBar.b = getCore():getBadHighlitedColor():getB()
			end	
			self:drawText(s, 40 + 30 + xoff, top + (self.itemHgt - self.fontHgt) / 2, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
			if item:isBurnt() then return end
			local textWid = getTextManager():MeasureStringX(self.font, s)
			self:drawProgressBar(40 + math.max(120, 30 + textWid + 20) + xoff, top+(self.itemHgt/2)-1, 100, 2, f, fgBar);
        elseif item:getFreezingTime() > 0 then
			local text = getText("IGUI_invpanel_FreezingTime") .. ":"
			self:drawTextAndProgressBar(text, item:getFreezingTime() / 100, xoff, top, fgText, fgBar)
		else
			local hunger = item:getHungerChange();
			if(hunger ~= 0) then
				local text = getText("IGUI_invpanel_Nutrition") .. ":"
				self:drawTextAndProgressBar(text, (-hunger) / 1.0, xoff, top, fgText, fgBar)
			else
				self:drawText(item:getName(), 40 + 30 + xoff, top + (self.itemHgt - self.fontHgt) / 2, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
			end
		end
   else
		self:drawText(item:getName(), 40 + 30 + xoff, top + (self.itemHgt - self.fontHgt) / 2, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
   end
end