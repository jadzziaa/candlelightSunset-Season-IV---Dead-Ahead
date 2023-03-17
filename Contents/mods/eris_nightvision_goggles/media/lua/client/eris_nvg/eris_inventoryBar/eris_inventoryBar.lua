----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- eris_inventoryBar
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 1.0;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if eris_inventoryBar then
	if eris_inventoryBar.versionNumber >= versionNumber then
		return;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryBar = {
	versionNumber = versionNumber,
	drawForItems = {},
};

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryBar.registerItem = function(_itemFullType, _modData, _label)
	eris_inventoryBar.drawForItems[_itemFullType] = {
		modData = _modData,
		label = _label,
	};
end

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

local function drawDetails(_panel, _text, _fraction, _xoff, _top, _fgText, _fgBar)
	local textWidth = getTextManager():MeasureStringX(_panel.font, _text);
	local textHeight = getTextManager():MeasureStringY(_panel.font, _text);
	local itemHeight = _panel.itemHgt or textHeight;
	_panel:drawText(_text, 40 + 30 + _xoff, _top + (itemHeight - textHeight) / 2, _fgText.a, _fgText.r, _fgText.g, _fgText.b, _panel.font);
	drawProgressBar(_panel, 40 + math.max(120, 30 + textWidth + 20) + _xoff, _top + (itemHeight / 2) - 1, 100, 2, _fraction, _fgBar);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryBar.doOverride = function()

	local callback_drawItemDetails = ISInventoryPane.drawItemDetails;

	ISInventoryPane.drawItemDetails = function(self, _item, _y, _xoff, _yoff, _red)
		if _item then
			local drawItem = eris_inventoryBar.drawForItems[_item:getFullType()];
			if drawItem then
				local hdrHgt = self.headerHgt or 16;
				local itemHgt = self.itemHgt or 16;
				local top = hdrHgt + _y * itemHgt + _yoff;
				local value = _item:getModData()[drawItem.modData] or 0;
				local percent = value / 1;
				local fgBar = {r=1 - percent, g=percent, b=0.0, a=0.7};
				local fgText = {r=0.6, g=0.8, b=0.5, a=0.6};
				if _red then fgText = {r=0.0, g=0.0, b=0.5, a=0.7}; end;
				drawDetails(self, drawItem.label, percent / 1.0, _xoff, top + 3, fgText, fgBar);
				return callback_drawItemDetails(self, _item, _y, _xoff, _yoff - (self.fontHgt / 2) , _red);
			end;
		end;
		return callback_drawItemDetails(self, _item, _y, _xoff, _yoff, _red);
	end;
end;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_inventoryBar.init = function()
	eris_inventoryBar.doOverride();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

Events.OnGameStart.Add(eris_inventoryBar.init);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------