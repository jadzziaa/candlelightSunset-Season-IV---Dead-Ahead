-- This file handles the high level tasks of processing
-- option tables from mods and loading the correct values
-- aswell as the basic layout of the MCM page

-- TODO (eventually): code cleanup pass over all UI drawing code

local function RunSafely(f)
	local bSuccess, ErrorMessage = pcall(f)

	if not bSuccess then print(ErrorMessage) end
end

-- formatting
local DefaultLabelFormat = {}
DefaultLabelFormat.font = UIFont.Small
DefaultLabelFormat.color = {1, 1, 1, 1}

local CategoryLabelFormat = MCM_Helpers.MakeChildTable(DefaultLabelFormat)
CategoryLabelFormat.font = UIFont.Medium

local OptionLabelFormat = MCM_Helpers.MakeChildTable(DefaultLabelFormat)
OptionLabelFormat.color = {0.9, 0.9, 0.9, 1}


-- Main table that contains configurable options
-- These methods are supposed to be used by mods
local ModOptionTables = {}

ModOptionTable = {}

-- Spawn new ModOptio
function ModOptionTable:New(Mod_id, DisplayStr, bExtraTab)
	local NewModOptionTable = MCM_Helpers.MakeChildTable(self)
	NewModOptionTable.Mod_id = Mod_id			-- id of the mod, used to associate with filename
	NewModOptionTable.DisplayStr = DisplayStr
	NewModOptionTable.bExtraTab = bExtraTab

	NewModOptionTable.Options = {}

	table.insert(ModOptionTables, NewModOptionTable)

	return NewModOptionTable
end

-- Add a configurable option, both of these are functionally equivalent,
-- just different forms of providing the same data
function ModOptionTable:AddModOptionTable(t)
	self:AddModOption(t.Option_id, t.Option_type, t.DefaultValue, t.OptionData, t.DisplayStr, t.TooltipStr, t.CommitValueFunc)
end

function ModOptionTable:AddModOption(Option_id, Option_type, DefaultValue, OptionData, DisplayStr, TooltipStr, CommitValueFunc)
	local NewOption = MCMModOptions[Option_type]:New(Option_id, Option_type, DefaultValue, OptionData, DisplayStr, TooltipStr, CommitValueFunc)

	table.insert(self.Options, NewOption)
end

-- Saving and loading options from files
function ModOptionTable:GetOptionFilePath()
	return "MCM/" .. self.Mod_id .. ".txt"
end

function ModOptionTable:SaveOptionsToFile()
	local fw = getFileWriter(self:GetOptionFilePath(), true, false)
	for _, Option in ipairs(self.Options) do
		if not Option:IsValueSetToDefault() then
			fw:write(Option.Option_id .. "=" .. Option:ValueToSerial() .. "\n")
		end
	end

	fw:close()
end

function ModOptionTable:LoadOptionsFromFile()
	local fr = getFileReader(self:GetOptionFilePath(), false)
	if not fr then return end

	-- read all contents and save to temp table
	local FileContents = {}
	local StartToFirstEqualsPattern = "^[^=]+"

	while true do
		local CurrentLine = fr:readLine()
		if not CurrentLine then break end

		RunSafely(function()
			local OptionName = CurrentLine:match(StartToFirstEqualsPattern)
			local OptionValueString = CurrentLine:gsub(StartToFirstEqualsPattern .. "=", "")

			FileContents[OptionName] = OptionValueString
		end)
	end

	fr:close()

	-- assign contents to Options
	for _, Option in ipairs(self.Options) do
		local OptionString = FileContents[Option.Option_id]

		if OptionString then
			RunSafely(function()
				local Value = Option:SerialToValue(OptionString)
				Option:SetValue(Value, true, true)
			end)
		end
	end
end

-- Event for firing keybind actions
local KeysToOptionList = {}

Events.OnKeyPressed.Add(function(Key)
	if not KeysToOptionList[Key] then return end

	for _, Option in pairs(KeysToOptionList[Key]) do
		Option.CommitValueFunc()
	end
end)

-- Main options hook
local MainOptions_create = MainOptions.create
function MainOptions:create()
	local splitpoint = self:getWidth() * 0.3333
	local uiwidth = 150
	local uiheight = 20
	local margin = 5

	local leftlabel_offset = 16

	local function MakeLabel(x, y, str, options)
		options = options or DefaultLabelFormat

		local TextHeight = getTextManager():MeasureStringY(options.font, str)

		local c = options.color
		local label = ISLabel:new(x, y + (uiheight - TextHeight) * 0.5, TextHeight, str, c[1],c[2],c[3],c[4], options.font, false)
		label:initialise()
		label:setAnchorRight(true)
		self.mainPanel:addChild(label)

		return label
	end

	local function AdvanceLine(Distance)
		Distance = Distance or 25
		self.CurrY = self.CurrY + Distance
	end

	local function NewOptionCategory(str)
		MakeLabel(splitpoint - leftlabel_offset, self.CurrY, str, CategoryLabelFormat)

		AdvanceLine()
	end

	local function NewOption(Option)
		-- Description label
		local label = MakeLabel(splitpoint - leftlabel_offset, self.CurrY, Option.DisplayStr, OptionLabelFormat)
		label.tooltip = Option.TooltipStr

		-- option input
		Option.ui = Option:MakeNewUI(splitpoint, self.CurrY, self.mainPanel, uiwidth)
		Option.ui.mod_option = Option
		Option:SetValue(Option.DefaultValue, true)

		self.mainPanel:addChild(Option.ui)

		-- reset button
		local btn_height = (getTextManager():getFontHeight(UIFont.Small) + 3)
		local btn_reset = ISButton:new(splitpoint + uiwidth + margin, self.CurrY, 45, btn_height, "Reset")
		btn_reset.onclick = function()
			Option:SetValue(Option.DefaultValue, true)
		end

		self.mainPanel:addChild(btn_reset)

		-- new line
		AdvanceLine(Option.ui.height + margin)
	end

	local function CommitAllOptions()
		for _, OptionTable in pairs(ModOptionTables) do
			for _, Option in pairs(OptionTable.Options) do
				if Option.bRunCommitFunc and Option.CommitValueFunc then
					Option.CommitValueFunc(Option.Value)
				end
			end
		end
	end

	local function RefreshHotkeyBindings()
		KeysToOptionList = {}

		for _, OptionTable in pairs(ModOptionTables) do
			for _, Option in pairs(OptionTable.Options) do
				if Option.Option_type == "keybind" then
					local Key = Option.Value
					KeysToOptionList[Key] = KeysToOptionList[Key] or {}

					table.insert(KeysToOptionList[Key], Option)
				end
			end
		end
	end

	local function AddPage(pagestr)
		self:addPage(pagestr)
		self.CurrY = 23		-- Mhmmm, tasty

		self:addScrollBars(true)
	end

	local function ClosePage()
		local BottomPageMargin = 100
		self.mainPanel:setScrollHeight(self.CurrY + BottomPageMargin)
	end

	local function LoadOptionTable(OptionTable)
		NewOptionCategory(OptionTable.DisplayStr)

		for _, Option in ipairs(OptionTable.Options) do
			NewOption(Option)
		end

		OptionTable:LoadOptionsFromFile()
	end

	-- extend options page
    MainOptions_create(self)

	-- Prep tables and create UI elements
	table.sort(ModOptionTables, function(a,b) return a.Mod_id < b.Mod_id end)

	-- Load all mod-tab mods first
	AddPage("MCM")

	for _, OptionTable in ipairs(ModOptionTables) do
		if not OptionTable.bExtraTab then
			LoadOptionTable(OptionTable)
		end
	end

	ClosePage()

	-- Load all extra tab mods
	for _, OptionTable in ipairs(ModOptionTables) do
		if OptionTable.bExtraTab then
			AddPage(OptionTable.DisplayStr)
			LoadOptionTable(OptionTable)
			ClosePage()
		end
	end

	-- send values of all options
	CommitAllOptions()

	-- prep hotkey table
	RefreshHotkeyBindings()

	-- override apply to save and commit our values
	local OldApply = self.apply
    self.apply = function(self, closeAfter)
		OldApply(self, closeAfter)

		for _, OptionTable in pairs(ModOptionTables) do
			OptionTable:SaveOptionsToFile()
		end

		CommitAllOptions()
		RefreshHotkeyBindings()
	end
end
