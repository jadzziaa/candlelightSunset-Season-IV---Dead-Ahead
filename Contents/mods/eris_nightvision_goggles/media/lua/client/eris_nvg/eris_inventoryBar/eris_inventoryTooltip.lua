----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- eris_inventoryTooltip
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 1.0;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if eris_inventoryTooltip then
	if eris_inventoryTooltip.versionNumber >= versionNumber then
		return;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryTooltip = {
	versionNumber = versionNumber,
	drawForItems = {},
};

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryTooltip.registerItem = function(_itemFullType, _modData, _label)
	eris_inventoryTooltip.drawForItems[_itemFullType] = {
		modData = _modData,
		label = _label,
	};
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local fontsLookup = {};

fontsLookup["Small"] = UIFont.NewSmall;
fontsLookup["Medium"] = UIFont.NewMedium;
fontsLookup["Large"] = UIFont.NewLarge;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local function drawProgressBar(_panel, _x, _y, _w, _h, _f, _fg)
	if _f < 0.0 then _f = 0.0; end;
	if _f > 1.0 then _f = 1.0; end;
	local done = math.floor(_w * _f);
	if _f > 0 then done = math.max(done, 1) end;
	_panel:drawRect(_x, _y, done, _h, _fg.a, _fg.r, _fg.g, _fg.b);
	local bg = {r=0.25, g=0.25, b=0.25, a=1.0};
	_panel:drawRect(_x + done, _y, _w - done, _h, bg.a, bg.r, bg.g, bg.b);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local function drawDetailsTooltip(_panel, _text, _fraction, _xoff, _top, _length, _fgText, _fgBar, _drawfont)
	local textWidth = getTextManager():MeasureStringX(_drawfont, _text);
	local lineHeight = getTextManager():getFontFromEnum(_drawfont):getLineHeight();
	local barLength = _length > 0 and _length or 100;
	_panel:drawText(_text, _xoff, _top + (15 - lineHeight) / 2, _fgText.a, _fgText.r, _fgText.g, _fgText.b, _drawfont);
	drawProgressBar(_panel, textWidth + _xoff + 5, _top + (7.5)-1, barLength - textWidth - 5, 2, _fraction, _fgBar);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryTooltip.doOverride = function()

	local callback_ISToolTipInv_render = ISToolTipInv.render;

	ISToolTipInv.render = function(self)
		callback_ISToolTipInv_render(self);
		if not ISContextMenu.instance or not ISContextMenu.instance.visibleCheck then
			local itemObj = self.item;
			if itemObj then
				local drawItem = eris_inventoryTooltip.drawForItems[itemObj:getFullType()];
				if drawItem then
					local font = getCore():getOptionTooltipFont();
					local drawFont = fontsLookup[font] or UIFont.Medium;
					local toolwidth = self.tooltip:getWidth() + 11;
					local lineHeight = getTextManager():getFontFromEnum(drawFont):getLineHeight();
					local toolheight = self.tooltip:getHeight();
					self:setX(self.tooltip:getX() - 11);
					if self.x > 1 and self.y > 1 then
						local yoff = toolheight + 2;
						local value = itemObj:getModData()[drawItem.modData] or 0;
						local percent = value / 1;
						local fgBar = {r=1 - percent, g=percent, b=0, a=1};
						local fgText = {r=1, g=1, b=0.8, a=1};
						self:drawRect(0, toolheight, toolwidth, lineHeight + 8, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
						self:drawRectBorder(0, toolheight, toolwidth, lineHeight + 8, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
						drawDetailsTooltip(self, drawItem.label, percent / 1.0, 5, yoff, toolwidth - 10, fgText, fgBar, drawFont);
						yoff = yoff + 12;
					end;
				end;
			end;
		end;
	end;

end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryTooltip.init = function()
	eris_inventoryTooltip.doOverride();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Events.OnGameStart.Add(eris_inventoryTooltip.init);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------