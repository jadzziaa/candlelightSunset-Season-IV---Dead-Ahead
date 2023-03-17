-- TODO: groupbox?

SandboxOption = {}

SandboxOption.base = {}
function SandboxOption.base:GetSettingsTable()
	local st = {}
	st.name = self.Option_id
	st.translatedName = self.DisplayStr
	st.tooltip = self.TooltipStr

	return st
end

SandboxOption.text = MCM_Helpers.MakeChildTable(SandboxOption.base)
function SandboxOption.text:GetSettingsTable()
	local st = SandboxOption.base.GetSettingsTable(self)
	st.type = "entry"
	st.text = tostring(self.DefaultValue)
	st.onlyNumbers = false

	return st
end

function SandboxOption.text:GetValueFromUI(ui)
	return ui:getText()
end

SandboxOption.number = MCM_Helpers.MakeChildTable(SandboxOption.base)
function SandboxOption.number:GetSettingsTable()
	local st = SandboxOption.text.GetSettingsTable(self)
	st.onlyNumbers = true

	return st
end

function SandboxOption.number:GetValueFromUI(ui)
	return tonumber(ui:getText())
end

SandboxOption.combobox = MCM_Helpers.MakeChildTable(SandboxOption.base)
function SandboxOption.combobox:GetSettingsTable()
	local st = SandboxOption.base.GetSettingsTable(self)
	st.type = "enum"
	st.default = self.DefaultValue
	st.values = self.OptionData

	return st
end

function SandboxOption.combobox:GetValueFromUI(ui)
	return tonumber(ui.selected)
end

SandboxOption.checkbox = MCM_Helpers.MakeChildTable(SandboxOption.base)
function SandboxOption.checkbox:GetSettingsTable()
	local st = SandboxOption.base.GetSettingsTable(self)
	st.type = "checkbox"
	st.default = self.DefaultValue

	return st
end

function SandboxOption.checkbox:GetValueFromUI(ui)
	return ui.selected[1]
end

-- Sandbox Options, this is largely separate from the other mod options
local SandboxOptionTables = {}

local function ForEachOption(f)
	for _, OptionTable in ipairs(SandboxOptionTables) do
		for _, Option in pairs(OptionTable.Options) do
			f(Option)
		end
	end
end

SandboxOptionTable = {}
function SandboxOptionTable:New(Mod_id)
	local NewSandboxOptionTable = MCM_Helpers.MakeChildTable(self)
	NewSandboxOptionTable.Mod_id = Mod_id

	NewSandboxOptionTable.Options = {}

	table.insert(SandboxOptionTables, NewSandboxOptionTable)

	return NewSandboxOptionTable
end

function SandboxOptionTable:AddSandboxOption(Option_id, option_type, DefaultValue, CategoryName, OptionData, DisplayStr, TooltipStr, CommitValueFunc)
	local NewOption = MCM_Helpers.MakeChildTable(SandboxOption[option_type])
	NewOption.Option_id = Option_id
	NewOption.CategoryName = CategoryName
	NewOption.DefaultValue = DefaultValue
	NewOption.OptionData = OptionData
	NewOption.DisplayStr = DisplayStr
	NewOption.TooltipStr = TooltipStr
	NewOption.CommitValueFunc = CommitValueFunc

	table.insert(self.Options, NewOption)
end

-- Make UI elements for options appear
local ServerSettingsScreen_getSandboxSettingsTable = ServerSettingsScreen.getSandboxSettingsTable
ServerSettingsScreen.getSandboxSettingsTable = function(self)
	local SandboxSettings = ServerSettingsScreen_getSandboxSettingsTable(self)

	-- Category Name to index, for easier assigning
	local CategoryToIndex = {}

	for k,v in pairs(SandboxSettings) do
		CategoryToIndex[v.name] = k
	end

	ForEachOption(function(Option)
		-- TODO: dynamically add new categories

		local CatName = Option.CategoryName
		local CatId = CategoryToIndex[CatName]

		if not CatId then
			local NewCategory = {}
			NewCategory.name = CatName
			NewCategory.settings = {}

			table.insert(SandboxSettings, NewCategory)
			CatId = #SandboxSettings
			CategoryToIndex[CatName] = CatId
		end

		local Settings = SandboxSettings[CatId].settings

		table.insert(Settings, Option:GetSettingsTable())
	end)

	return SandboxSettings
end

local SandboxValues = {}

-- Save values from options after created in UI
local SandboxOptionsScreen_settingsFromUI = SandboxOptionsScreen.settingsFromUI
SandboxOptionsScreen.settingsFromUI = function(self, SandBoxOptions)
	SandboxOptionsScreen_settingsFromUI(self, SandBoxOptions)

	-- extract custom sandbox options into temp table
	ForEachOption(function(Option)
		local id = Option.Option_id
		local ui = self.controls[id]
		if ui then
			SandboxValues[id] = Option:GetValueFromUI(ui)
		end
	end)
end

-- Send the values on map load
Events.OnGameTimeLoaded.Add(function()
	local GlobalModData = GameTime:getInstance():getModData()

	GlobalModData.SandboxValues = GlobalModData.SandboxValues or SandboxValues

	ForEachOption(function(Option)
		local Value = GlobalModData.SandboxValues[Option.Option_id]

		if Option.CommitValueFunc and Value then
			Option.CommitValueFunc(Value)
		end
	end)
end)