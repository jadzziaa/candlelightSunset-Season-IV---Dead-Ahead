-- This file handles the specifics of the various
-- different input types and UI

-- Can be expanded by third parties, simply by subclassing
-- MCMModOptions.base and implementing the necessary methods

local EmptyTable = {}

local function CopyTable(t)
	local ret = {}
	for k, v in pairs(t) do
		ret[k] = v
	end

	return ret
end

MCMModOptions = {}

MCMModOptions.base = {}
MCMModOptions.base.bRunCommitFunc = true

function MCMModOptions.base:New(Option_id, Option_type, DefaultValue, OptionData, DisplayStr, TooltipStr, CommitValueFunc)
	local NewOption = MCM_Helpers.MakeChildTable(self)
	NewOption.Option_id = Option_id					-- id of option, links with option from files
	NewOption.Option_type = Option_type
	NewOption.DefaultValue = DefaultValue
	NewOption.OptionData = OptionData or EmptyTable	-- custom data, thats can finetune how ui behaves
	NewOption.DisplayStr = DisplayStr
	NewOption.TooltipStr = TooltipStr
	NewOption.CommitValueFunc = CommitValueFunc		-- function that gets called when new value is set

	return NewOption
end

function MCMModOptions.base:SetValue(Value, bUpdateUI, bIgnoreDirty)
	if bUpdateUI == nil then bUpdateUI = false end
	if bIgnoreDirty == nil then bIgnoreDirty = false end


	if not bIgnoreDirty and self.Value ~= Value then
		MainOptions.instance.gameOptions.changed = true
	end

	self.Value = Value

	if bUpdateUI then
		self:SetValueUI(Value)
	end
end

function MCMModOptions.base:ValueToSerial()
	return tostring(self.Value)
end

function MCMModOptions.base:IsValueSetToDefault()
	return self.Value == self.DefaultValue
end

-- text input
MCMModOptions.text = MCM_Helpers.MakeChildTable(MCMModOptions.base)
function MCMModOptions.text:MakeNewUI(splitpoint, CurrY, Panel, width)
	local tb = ISTextEntryBox:new("", splitpoint, CurrY, width, 20)

	tb:initialise()
	tb:instantiate()

	local prerender = tb.prerender
	tb.prerender = function(_)
		if not tb:isFocused() then
			self:SetValue(tb:getInternalText(), true)
		end

		prerender(tb)
	end

	local onCommandEntered = tb.onCommandEntered
	tb.onCommandEntered = function(_)
		self:SetValue(tb:getInternalText(), true)

		onCommandEntered()
	end

	return tb
end

function MCMModOptions.text:SetValueUI(value)
	self.ui:setText(tostring(value))
end

function MCMModOptions.text:SerialToValue(SerialString)
	return SerialString
end

-- number
MCMModOptions.number = MCM_Helpers.MakeChildTable(MCMModOptions.text)

function MCMModOptions.number:New(Option_id, Option_type, DefaultValue, OptionData, DisplayStr, TooltipStr, CommitValueFunc)
	local NewOption = MCMModOptions.base.New(self, Option_id, Option_type, DefaultValue, OptionData, DisplayStr, TooltipStr, CommitValueFunc)

	local od = NewOption.OptionData

	-- normalize min and max values to step value, if present
	if od.step then
		if od.min then od.min = MCM_Helpers.GetSnappedToGrid(od.min, od.step, od.min) end
		if od.max then od.max = MCM_Helpers.GetSnappedToGrid(od.max, od.step, nil, od.max) end
	end

	return NewOption
end

function MCMModOptions.number:GetNormalizedValue(n)
	local od = self.OptionData

	if od.step then n = MCM_Helpers.GetSnappedToGrid(n, od.step) end
	if od.min then n = math.max(od.min, n) end
	if od.max then n = math.min(od.max, n) end

	return n
end

function MCMModOptions.number:MakeNewUI(splitpoint, CurrY, Panel, width)
	local nb = MCMModOptions.text.MakeNewUI(self, splitpoint, CurrY, Panel, width)

	nb:setOnlyNumbers(true)

	return nb
end

function MCMModOptions.number:SetValue(Value, bUpdateUI, bIgnoreDirty)
	Value = self:GetNormalizedValue(tonumber(Value))

	MCMModOptions.base.SetValue(self, Value, bUpdateUI, bIgnoreDirty)
end

function MCMModOptions.number:SerialToValue(SerialString)
	return tonumber(SerialString)
end

-- number slider
MCMModOptions.number_slider = MCM_Helpers.MakeChildTable(MCMModOptions.number)
function MCMModOptions.number_slider:MakeNewUI(splitpoint, CurrY, Panel, width)
	local slider_width = 0.75 * width
	local margin = 20

	local panel = ISPanel:new(splitpoint, CurrY, width, 20)

	local slider = UINumberSlider:new(0, 0, slider_width, self.OptionData.min, self.OptionData.max, self.OptionData.step)
	panel:addChild(slider)

	local label = ISLabel:new(width, 0, 20, "", 1,1,1,1)

	panel:addChild(label)

	slider.OnSetValue = function(value)
		local str = tostring(value)
		label:setName(str)

		label.x = width - getTextManager():MeasureStringX(label.font, str)

		self:SetValue(value)
	end

	panel.slider = slider

	panel.prerender = function() end

	return panel
end

function MCMModOptions.number_slider:SetValueUI(value)
	local ValueToSliderRange = (value - self.OptionData.min) / (self.OptionData.max - self.OptionData.min)
	self.ui.slider:SetSliderPos(ValueToSliderRange)
end


-- checkbox
MCMModOptions.checkbox = MCM_Helpers.MakeChildTable(MCMModOptions.base)
function MCMModOptions.checkbox:MakeNewUI(splitpoint, CurrY, Panel, width)
	local tb = ISTickBox:new(splitpoint, CurrY, width, 20, "HELLO?")
	tb:initialise()
	tb.choicesColor = {r=1, g=1, b=1, a=1}
	tb:addOption("")

	tb.changeOptionMethod = function(_, index, value)
		self:SetValue(value)
	end

	return tb
end

function MCMModOptions.checkbox:SetValueUI(value)
	self.ui:setSelected(1, value)
end

function MCMModOptions.checkbox:SerialToValue(SerialString)
	return SerialString == "true"
end

-- checkbox multi
MCMModOptions.checkbox_multi = MCM_Helpers.MakeChildTable(MCMModOptions.base)
function MCMModOptions.checkbox_multi:MakeNewUI(splitpoint, CurrY, Panel, width)
	local tb = ISTickBox:new(splitpoint, CurrY, width, 20, "HELLO?")
	tb:initialise()
	tb.choicesColor = {r=1, g=1, b=1, a=1}

	for _, displaystr in ipairs(self.OptionData) do
		tb:addOption(displaystr)
	end

	tb.changeOptionMethod = function(_, index, value)
		self:SetValue(CopyTable(tb.selected))
	end

	return tb
end

function MCMModOptions.checkbox_multi:SetValueUI(value)
	self.ui.selected = CopyTable(value)
end

function MCMModOptions.checkbox_multi:ValueToSerial()
	local str = ""

	for i, Value in pairs(self.Value) do
		str = str .. tostring(Value)

		if i ~= #self.Value then
			str = str .. ","
		end
	end

	return str
end

function MCMModOptions.checkbox_multi:SerialToValue(SerialString)
	local Value = {}

	for substr in SerialString:gmatch("[^,]+") do
		table.insert(Value, substr == "true")
	end

	return Value
end

-- color
MCMModOptions.color = MCM_Helpers.MakeChildTable(MCMModOptions.base)

function MCMModOptions.color:SetButtonColor(color)
	self.ui.backgroundColor = { r = color.r, g = color.g, b = color.b, a = 1}
end

function MCMModOptions.color:MakeNewUI(splitpoint, CurrY, Panel, width)
	local btn_height = (getTextManager():getFontHeight(UIFont.Small) + 3)
	local btn_color = ISButton:new(splitpoint, CurrY, width, btn_height, "")

	local cp = ISColorPicker:new(btn_color.x,btn_color.y)

	cp:setPickedFunc(function(_, color, mouseUp)
		self:SetButtonColor(color)
		self:SetValue(color)
	end)
	cp:initialise()

	btn_color.onclick = function() Panel:addChild(cp) end

	return btn_color
end

function MCMModOptions.color:SetValueUI(color)
	self:SetButtonColor(color)
end

function MCMModOptions.color:ValueToSerial()
	local c = self.Value
	return c.r .. "," .. c.g .. "," .. c.b
end

function MCMModOptions.color:SerialToValue(SerialString)
	local ckeys = { "r", "g", "b"}
	local i = 1
	local c = {}
	for substr in SerialString:gmatch("[^,]+") do
		c[ckeys[i]] = tonumber(substr)
		i = i + 1
	end

	return c
end

function MCMModOptions.color:IsValueSetToDefault()
	local Keys = {"r", "g", "b"}

	for _, Key in pairs(Keys) do
		if self.Value[Key] ~= self.DefaultValue[Key] then return false end
	end

	return true
end

-- combobox
MCMModOptions.combobox = MCM_Helpers.MakeChildTable(MCMModOptions.base)
function MCMModOptions.combobox:MakeNewUI(splitpoint, CurrY, Panel, width)
	local cb = ISComboBox:new(splitpoint, CurrY, width, 20, nil, function(_, combobox, arg1, arg2)
		self:SetValue(combobox.selected)
	end)

	cb:initialise()

	for i, k in ipairs(self.OptionData) do
		cb:addOption(tostring(k))
	end

	return cb
end

function MCMModOptions.combobox:SetValueUI(value)
	self.ui.selected = value
end

MCMModOptions.combobox.ValueToSerial = MCMModOptions.number.ValueToSerial
MCMModOptions.combobox.SerialToValue = MCMModOptions.number.SerialToValue

-- keybind
MCMModOptions.keybind = MCM_Helpers.MakeChildTable(MCMModOptions.base)
MCMModOptions.keybind.bRunCommitFunc = false

function MCMModOptions.keybind:SetValue(Value, bUpdateUI)
	MCMModOptions.base.SetValue(self, Value, bUpdateUI)

	-- Set up keybind manager table entry
end

function MCMModOptions.keybind:SetValueUI(Value)
	self.ui.title = getKeyName(Value)
end

function MCMModOptions.keybind:MakeNewUI(splitpoint, CurrY, Panel, width)
	local kb = ISButton:new(splitpoint, CurrY, width, getTextManager():getFontHeight(UIFont.Small) + 2, "");

	kb.onclick = function()
		local modal = ISSetKeybindDialog:new(self.Option_id)
		modal:initialise()
		modal:instantiate()
		modal:setCapture(true)
		modal:setAlwaysOnTop(true)
		modal:addToUIManager()
		GameKeyboard.setDoLuaKeyPressed(false)

		local DestroyDialog = function()
			modal:setVisible(false)
			modal:removeFromUIManager()
			GameKeyboard.setDoLuaKeyPressed(true)
		end

		modal.onKeyRelease = function(_, key)
			self:SetValue(key, true)
			DestroyDialog()
		end

		modal.cancel.onclick = function(_)
			DestroyDialog()
		end

		modal.default.onclick = function(_)
			self:SetValue(self.DefaultValue, true)
			DestroyDialog()
		end

		modal.clear.onclick = function(_)
			self:SetValue(0, true)
			DestroyDialog()
		end
	end

	return kb
end

MCMModOptions.keybind.ValueToSerial = MCMModOptions.number.ValueToSerial
MCMModOptions.keybind.SerialToValue = MCMModOptions.number.SerialToValue
