if ModOptions.wasClient then
	return
end
ModOptions.wasClient = true

local core = getCore()
if not core.getVersionNumber and core.getVersion then -- Patch the game after 41.77.6+ if beeded
	--local ver = core:getGameVersion():getInt() if ver >= 41077 then -- 
	local m = getmetatable(core).__index
	m.getVersionNumber = m.getVersion
end



----- Check game version -----
local is_build_41 = false
do
	local core = getCore()
	local ver_str = core:getVersionNumber()
	local num1, num2 = ver_str:match("(%d+)%.(%d+)")
	if num1 then
		num1 = tonumber(num1)
		if num1 >= 41 then
			is_build_41 = true
		else
			local function showInfo(err_cnt)
				if not ISModalRichText then
					return
				end
				local txt = 'MOD OPTIONS mod is disabled, because version of Project Zomboid is outdated. <LINE> <LINE> Compatible version: <LINE> <RGB:0,1,0> 41+ <RGB:1,1,1> <LINE> <LINE> Your version: <LINE> <RGB:1,0,0> ' .. num1 .. '.' .. num2 .. ' <RGB:1,1,1> <LINE> <LINE>'
				local infoRichText = ISModalRichText:new(core:getScreenWidth()/2-300,core:getScreenHeight()/2-100,600,200,txt, false);
				infoRichText:initialise();
				infoRichText.backgroundColor = {r=0, g=0, b=0, a=0.9};
				infoRichText.chatText:paginate();
				infoRichText:setHeightToContents()
				infoRichText:setY(math.floor(core:getScreenHeight() / 2 - (infoRichText:getHeight() + 20)));
				infoRichText:setVisible(true);
				infoRichText:addToUIManager();
				--infoRichText:removeFromUIManager()
			end

			Events.OnMainMenuEnter.Add(function()
				showInfo(err)
			end)
		end
	else
		print("ERROR(options): Can't detect game version.")
		is_build_41 = true
	end
end

if not is_build_41 then
	print('ERROR(options): Only build 41 is compatible.')
	return print('Your version: ',getCore():getVersionNumber())
end



local GameOption, is_changed
local is_ingame_LOADED = nil --double check that options are loaded

local TM = getTextManager()
print('TM=',tostring(TM))
print("fn=",tostring(TM.getFontHeight))
local FONT_HGT_SMALL = TM:getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = TM:getFontHeight(UIFont.Medium)

--require "OptionScreens/MainOptions"
local old_options_create = MainOptions.create
function MainOptions:create() --print('MainOptions injected!')
	old_options_create(self)
	
	local OPTIONS_CHUNKS = ModOptions.OPTIONS_CHUNKS
	
	if #OPTIONS_CHUNKS == 0 then
		return --print('no mods with options')
	end
	--print('chunks ',#OPTIONS_CHUNKS)
	
	if not (self.gameOptions and self.addPage and MainScreen.instance) then
		print('ERROR(options): lack of functions!')
		print(self.gameOptions, self.addPage, MainScreen.instance)
		return
	end

	--print('self.gameOptions ',self.gameOptions)
	--ModOptions.loadFile()
	is_changed = false

	local fontHgtSmall = FONT_HGT_SMALL
	local fontHgtMedium = FONT_HGT_MEDIUM

	local buttonHgt = math.max(25, fontHgtSmall + 4 * 2)
	local topHgt = math.max(48, 10 + FONT_HGT_MEDIUM + 10)
	local bottomHgt = math.max(48, 5 + buttonHgt + 5)
	
	local splitpoint = self:getWidth() * 0.3333;

	do
		local opt = self.gameOptions:get('vsync') or self.gameOptions:get('resolution')
			or self.gameOptions:get('soundVolume') or self.gameOptions:get('language')
		if not opt then
			tt = self.gameOptions
			return print('ERROR(options): no base option!','vsync')
		end
		GameOption = getmetatable(opt)
	end

	local input_count = 0
	
	--load options when menu appears on screen
	local old_toUI = self.gameOptions.toUI
	self.gameOptions.toUI = function(self)
		ModOptions:loadFile()
		ModOptions:TrySave() --reset save function
		--print('--gameOptions.toUI()')
		--print_r(OPTIONS_CHUNKS,4)
		for _,c in pairs(OPTIONS_CHUNKS) do
			for _,v in pairs(c.options_data) do
				v._before = nil
			end
		end
		return old_toUI(self)
	end
	
	-----------------
	local is_ingame = MainScreen.instance.inGame
	--print('CHECK INGAME: ',is_ingame)
	if is_ingame then
		ModOptions:loadFile()
		is_ingame_LOADED = true
	end
	
	local function TryApplyOpt(data)
		local val = data.value
		data.settings.options[data.id] = val --or use :setRaw(val)
		--print('Option set ['..data.id..'] = ',val,is_ingame,data.onUpdateIngame,data.is_buggy)
		if not data.is_buggy then
			if data.OnApply then
				data.is_buggy = true
				data:OnApply(val)
				data.is_buggy = nil
			end
			if is_ingame then
				if data.OnApplyInGame then
					data.is_buggy = true
					data:OnApplyInGame(val)
					data.is_buggy = nil
				end
			elseif data.OnApplyMainMenu then
				data.is_buggy = true
				data:OnApplyMainMenu(val)
				data.is_buggy = nil
			end
		end
		is_changed = true
	end
	
	local MODOPTIONS_TAB_NAME = is_ingame and "("..getText("UI_NewGame_Mods")..")" or getText("UI_NewGame_Mods")
	self:addPage(MODOPTIONS_TAB_NAME)
	local y = 20;
	self.addY = 0

	--local comboWidth = self:getWidth()-splitpoint - 100
	local comboWidth = 300


	local function makeNewModSeparator(txt)
		local label = ISLabel:new(splitpoint, self.addY + y + 3, fontHgtMedium, txt, 1, 1, 1, 1, UIFont.Medium)
		label:setX(splitpoint - 25);
		label:initialise();
		label:setAnchorRight(true);
		self.mainPanel:addChild(label);
		self.addY = self.addY + 25
	end

	local function makeNewCheckBox(data)
		local yesno = self:addYesNo(splitpoint, y, comboWidth, 20, getText(data.name));
		if data.tooltip then
			yesno.tooltip = getText(data.tooltip)
		end
		local gameOption = GameOption:new(data.name, yesno)
		data.gameOption = gameOption
		function gameOption:toUI() --print('toUI ',data.id,' ',data.name)
			data.ui = self
			local box = self.control
			if data._before == nil then
				data._before = data.value
			end
			box:setSelected(1, data._before)
		end
		function gameOption:apply() --print('apply ',data.name)
			local val = self.control:isSelected(1)
			if val ~= data.value then
				data._before = val
				data.value = val
				TryApplyOpt(data)
			end
			--ModOptions:TrySave(input_count)
		end
		ModOptions._last_apply = gameOption.apply
		function gameOption:onChange(index, selected)
			if data.onUpdate then
				data:onUpdate(selected)
			end
		end
		self.gameOptions:add(gameOption)
		input_count = input_count + 1
	end
	
	local function makeNewCombo(data)
		local options = {}
		for i,v in ipairs(data) do
			table.insert(options, v)
		end
		local combo = self:addCombo(splitpoint, y, comboWidth, 20, getText(data.name), options, 1)
		if data.tooltip then
			local map = {}
			map["defaultTooltip"] = getText(data.tooltip)
			combo:setToolTipMap(map)
		end

		local gameOption = GameOption:new(data.name, combo)
		data.gameOption = gameOption
		function gameOption.toUI(self)
			local box = self.control
			if data._before == nil then
				data._before = tonumber(data.value) or 1
			end
			box.selected = data._before
		end
		function gameOption.apply(self)
			local box = self.control
			local val = box.selected
			--print("box_selected",val)
			if box.options[val] and val ~= data.value then
				data._before = val
				data.value = val
				TryApplyOpt(data)
			end
			--ModOptions:TrySave(input_count)
		end
		self.gameOptions:add(gameOption)
		input_count = input_count + 1
	end
	
	--print('TEST SETTINGS')
	--print_r(OPTIONS_CHUNKS,4)
	ModOptions.prepareCustomData()
	--print_r(OPTIONS_CHUNKS,4)
	
	for i,settings in ipairs(OPTIONS_CHUNKS) do
		--print_r(OPTIONS_CHUNKS[1],2)
		local no_separator = true
		for k,data in pairs(settings.options_data) do
			if not data.sandbox_path then --ignore mod's sandbox settings
				if no_separator then
					no_separator = false
					makeNewModSeparator(settings.mod_fullname or getText("UI_CO_UnknownMod"))
				end
				if type(data.default) == 'boolean' then --checkbox
					makeNewCheckBox(data)
				elseif data[1] then --list
					makeNewCombo(data)
				end
			end
		end
	end
	
	--self:centerTabChildrenX(MODOPTIONS_TAB_NAME)
	self.mainPanel:setScrollHeight(y + self.addY + 30)
	
end

Events.OnGameStart.Add(function() --jj: only client side! :\
	--Must be started AFTER MainOptions.create
	if not is_ingame_LOADED then
		ModOptions:loadFile() --just for sure
		
	end
end)


--OnApply
do
	local old_apply = MainOptions.apply
	function MainOptions.apply(...)
		old_apply(...)
		ModOptions:_OnApply()
	end
end


--Update Key Bindings
do
	local old_load = MainOptions.loadKeys
	MainOptions.loadKeys = function(...)
		local result = old_load(...)
		ModOptions:_OnLoadKeys()
		return result
	end
end

--Inject into sandbox options
do
	--print('ServerSettingsScreen=',ServerSettingsScreen)
	local old_create = ServerSettingsScreen.create
	function ServerSettingsScreen:create() --print('BEFORE_CREATE')
		--[[local set = ModOptions.SettingsTable[2].pages[2].settings
		table.insert(set, {
			name = "MySandboxOption",
			translatedName = "Translated MySandboxOption",
			tooltip = nil,
			type = 'enum',
			values = {"aaa","bbb","ccc"},
			default = 2,
		})--]]
		return old_create(self)
	end
	
	
	--Fill the default sandbox options table (on demand, once)
	local is_MO_prepared = false
	local old_get_sandbox = ServerSettingsScreen.getSandboxSettingsTable
	function ServerSettingsScreen.getSandboxSettingsTable(...)
		--[[local set = ModOptions.SettingsTable[2].pages[2].settings
		table.insert(set, {
			name = "MySandboxOption",
			translatedName = "Translated MySandboxOption",
			tooltip = "abrakadabra",
			type = 'enum',
			values = {"aaa","bbb","ccc"},
			default = 2,
		})--]]
		if not is_MO_prepared then --print_r(ModOptions.SettingsTable,4)
			is_MO_prepared = true
			local pages = ModOptions.SettingsTable[2].pages
			if not pages then
				print("ERROR! Can't get SettingsTable!")
			else
				ModOptions:_SearchAndPrepareSandboxOptions()
				local keyd_pages = {} --Different structure of SettingsTable: [page_id = settings]
				for i,page in pairs(pages) do
					if page.__name then
						keyd_pages[page.__name] = page.settings
					end
				end
				--print_r(ModOptions._sandbox_struct,2)
				for path,t in pairs(ModOptions._sandbox_struct) do
					local settings = keyd_pages[path]
					if not settings then
						settings = {}
						table.insert(pages, {
							name = getText("IGUI_Sandbox_" .. path),
							settings = settings,
						});
						keyd_pages[path] = settings
					end
					for id,opt in pairs(t) do
						 local data = {
							name = id,
							translatedName = getText(opt.name),
							tooltip = opt.tooltip and getText(opt.tooltip),
							type = opt:getType(),
						}
						if opt.is_integer then
							data.onlyNumbers = true
						end
						if data.type == 'enum' then
							local values = {}
							for i,v in ipairs(opt) do
								table.insert(values,v)
							end
							data.values = values
							data.default = opt.default
						elseif data.type == 'checkbox' then
							data.default = opt.default
						else
							data.text = tostring(opt.default)
						end
						table.insert(settings, data)
					end
				end
			end --print_r(ModOptions.SettingsTable,4)
		end
		
		return old_get_sandbox(...)
	end
	
	--SandboxOptionsScreen:setSandboxVars()
	
	
	--Выполняется каждый тик во время открытых настроек песочницы.
	--Не выполняется при загрузке игры, создании нового перса и т.п.
	local old_settingsFromUI = SandboxOptionsScreen.settingsFromUI
	function SandboxOptionsScreen:settingsFromUI(options)
		--При первом запуске сбрасываем на дефолтные.
		--Постоянно обновляем в локальную таблицу (раз уж такая система).
		--При последнем запуске ничего не делаем.
		--После загрузки мира сохраняем инфу в GameTime. Либо настройки, либо запись об их отсутствии, чтобы не перезаписывать.
		if not ModOptions.was_SandboxOptions then --first time
			
		end
		ModOptions.was_SandboxOptions = true
		if self.controls then
			local opt_arr = ModOptions._sandbox_vars
			for id,opt in pairs(opt_arr) do
				local control = self.controls[id]
				if control then
					local typ = type(opt._sandbox)
					if typ == 'boolean' then
						opt._sandbox = (control.selected[1] == true)
					elseif typ == "number" then
						opt._sandbox = control.selected
					else --if typ == "string" then
						opt._sandbox = control:getText()
					end
				end
			end
		end
		return old_settingsFromUI(self, options)
	end

	Events.OnGameTimeLoaded.Add(function()
		ModOptions:_SearchAndPrepareSandboxOptions()
		local gameTime = GameTime:getInstance();
		local data = gameTime:getModData();
		local vars = ModOptions._sandbox_vars
		if data.ModSandboxOptions then
			--Restore options from modData
			for id,val in pairs(data.ModSandboxOptions) do
				local opt = vars[id]
				if opt then
					if type(val) == type(opt.default) then
						opt:setRaw(val)
					else
						print("WARNING! Type mismatch in option: ",id)
					end
				end
			end
			return --no need to rewrite if once is saved.
		end
		if isClient() then
			return --no need to save sandbox options on client
		end
		--Save options to modData
		local new_data = {}
		--print("ModOptions.was_SandboxOptions = ",ModOptions.was_SandboxOptions)
		--print("gameTime:getWorldAgeHours() = ",gameTime:getWorldAgeHours())
		if ModOptions.was_SandboxOptions and gameTime:getWorldAgeHours() < 24 then --jj: getWorldAgeHours is buggy!
			for id,opt in pairs(vars) do
				local _sandbox = opt._sandbox
				local typ_var = type(_sandbox)
				local typ_opt = type(opt.default)
				if typ_opt == typ_var then
					new_data[id] = _sandbox
					opt:setRaw(_sandbox)
				elseif typ_var == 'string' then
					if opt[1] then
						local selected = tonumber(_sandbox)
						if selected and round(selected) == selected and opt[selected] then
							new_data[id] = selected
							opt:setRaw(selected)
						end
					elseif typ_opt == 'number' then
						local num = tonumber(_sandbox)
						if num then
							new_data[id] = num
							opt:setRaw(num)
						end
					end
				end
			end
		end
		data.ModSandboxOptions = new_data
	end)

end


