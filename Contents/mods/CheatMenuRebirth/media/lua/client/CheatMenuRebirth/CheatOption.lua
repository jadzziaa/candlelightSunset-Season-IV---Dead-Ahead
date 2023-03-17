-- Cheat Menu: Rebirth
-- Version: 1.1.0
-- Developer: RelationLife (https://steamcommunity.com/id/relationlife)
-- Original Developer: dude person (https://steamcommunity.com/id/123ii854734653463)
-- Special Thanks: Rezistor (https://steamcommunity.com/profiles/76561198031442339) & 
--                     NoctisFalco (https://steamcommunity.com/id/NoctisFalco)

require  "CheatMenuRebirth/CheatCore"

CheatOption = CheatOption or {};
local pageElement = nil
local FILE_SETTINGS = "CMRBOption.ini"
local WarningMessageTrigger = 0

local versionNumber = tonumber(string.match(getCore():getVersionNumber(), "%d+"))

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local ALL_FONT_LIST = {'Small', 'Medium', 'Large', 'Massive', 'MainMenu1', 'MainMenu2', 'Cred1', 'Cred2', 'NewSmall', 'NewMedium', 'NewLarge', 'Code', 'MediumNew', 'AutoNormSmall', 'AutoNormMedium', 'AutoNormLarge', 'Dialogue', 'Intro', 'Handwritten', 'DebugConsole', 'Title'}
local TabName = getText("UI_CMRB_Menu_Title")

local DefaultOption = {
    Main = {
        Integrity = true
    }
}


function CheatOption.Initialization()
    local file = getFileReader(FILE_SETTINGS, true)
    local scanLine = file:readLine()
    if not scanLine or not file then
            local fileOutput = getFileWriter(FILE_SETTINGS, true, false)
            for k, v in pairs(DefaultOption) do
                if DefaultOption[k] ~= nil then
                    if type(v) == "table" then
                        fileOutput:write("\r\n[" .. k .. "]\r\n")
                        for tk, tv in pairs(v) do
                            if DefaultOption[k][tk] ~= nil then
                                fileOutput:write(tk .. '=' .. tostring(tv) .. "\r\n")
                            end
                        end
                    else
                        fileOutput:write(k .. '=' .. tostring(v) .. "\r\n")
                    end
                end
            end
            fileOutput:close()
        print ("[CHEAT MENU] No setting file (".. FILE_SETTINGS .. ") found. Restoring default setting")
    else
        print ("[CHEAT MENU] Existing setting file (".. FILE_SETTINGS .. ") found. Skipping this step.")
    end
end

local CurrentOption = {}
function CheatOption:LoadSettings()
local category = ""
    local file = getFileReader(FILE_SETTINGS, true)
    local line = file:readLine()
    while line ~= nil do
            line = line:trim()
            if not string.match(line, "^#") then
                if line ~= "" then
                    local k, v = line:match("^([^=%[]+)=([^=]+)$")
                    if k then
                        k, v = k:trim(), v:trim()
                        if v == "true" then
                            v = true
                        elseif v == "false" then
                            v = false
                        end
                        if category ~= "" then
                            CurrentOption[category][k] = v
                        else
                            CurrentOption[k] = v
                        end
                    else
                        local t = line:match("^%[([^%[%]%%]+)%]$")
                        if t then
                            category = t:trim()
                            if not CurrentOption[category] then
                                CurrentOption[category] = {}
                            end
                        end
                    end
                end
            end
        line = file:readLine()
    end
    file:close()
print ("[CHEAT MENU] Existing setting file (".. FILE_SETTINGS .. ") has been loaded.")
end


function CheatOption.StatusCheck()
    if CheatCoreCM.DoLuaChecksum then
        return true
    else
        return false
    end
end



local CMRBOption = ISBaseObject:derive("GameOption")
local CMRBOptions = ISBaseObject:derive("GameOptions")

function CMRBOption:new(name, control, arg1, arg2)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.name = name
	o.control = control
	o.arg1 = arg1
	o.arg2 = arg2
	if control.isCombobox then
		control.onChange = self.onChangeComboBox
		control.target = o
	end
	if control.isTickBox then
		control.changeOptionMethod = self.onChangeTickBox
		control.changeOptionTarget = o
	end
	if control.isSlider then
		control.targetFunc = self.onChangeVolumeControl
		control.target = o
	end
	return o
end


function CMRBOption:onChangeComboBox(box)
	self.gameOptions:onChange(self)
	if self.onChange then
		self:onChange(box)
	end
end

function CMRBOption:onChangeTickBox(index, selected)
	self.gameOptions:onChange(self)
	if self.onChange then
		self:onChange(index, selected)
	end
    
    if selected == false and WarningMessageTrigger == 0 then
        WaringBox = ISModalDialog:new(getCore():getScreenWidth() / 2 - 250, getCore():getScreenHeight() / 2 - 75, 500, 150, getText("UI_CMRB_Warning_IntegrityCheck"), false, self, nil)
        WaringBox:initialise()
        WaringBox:setAlwaysOnTop(true)
        WaringBox:bringToTop(true)
        WaringBox:addToUIManager()
        WarningMessageTrigger = 1
    --elseif selected == true then
        --WarningMessageTrigger = 0
    end    
    
end

function CMRBOption:onChangeVolumeControl(control, volume)
	self.gameOptions:onChange(self)
	if self.onChange then
		self:onChange(control, volume)
	end
end



---------------------------

function CMRBOptions:add(option)
    option.gameOptions = self
    table.insert(self.options, option)
end

function CMRBOptions:get(optionName)
    for _,option in ipairs(self.options) do
        if option.name == optionName then
            return option
        end
    end
    return nil
end

function CMRBOptions:apply()
    for _,option in ipairs(self.options) do
        option:apply()
    end
    self.changed = false
end

function CMRBOptions:toUI()
    for _,option in ipairs(self.options) do
        option:toUI()
    end
    self.changed = false
end

function CMRBOptions:onChange(option)
    self.changed = true
end

function CMRBOptions:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.options = {}
    o.changed = false
    return o
end

--------------------------------------------


local HorizontalLine = ISPanel:derive("HorizontalLine")

function HorizontalLine:prerender()
end

function HorizontalLine:render()
	self:drawRect(0, 0, self.width, 1, 1.0, 0.5, 0.5, 0.5)
end

function HorizontalLine:new(x, y, width)
	local o = ISPanel.new(self, x, y, width, 2)
	return o
end

------------------------------------------------


local CMRBModOptionCreate = MainOptions.create
local CMRBModOptionApply = MainOptions.apply

function MainOptions:CMRBOption()

	local hLine = HorizontalLine:new(50, self.addY - 8, self.width - 50 * 2)
	hLine.anchorRight = true
	self.mainPanel:addChild(hLine)
    
	local label = ISLabel:new(100, self.addY, FONT_HGT_MEDIUM, getText('UI_CMRB_Options_Title'), 1, 1, 1, 1, UIFont.Medium);
	label:setX(50);
	label:initialise();
	label:setAnchorRight(true);
    
    self.mainPanel:addChild(label);
    local IntegrityCheck = self:addYesNo(self:getWidth()/3, 20, 300, 20, getText("UI_CMRB_Options_IntegrityCheck"))
    Integrity = CMRBOption:new('Integrity', IntegrityCheck)
    
	function Integrity.toUI(self)
		local box = self.control
		box:setSelected(1, CurrentOption["Main"]["Integrity"])
	end
	function Integrity.apply(self)
		local box = self.control
		CurrentOption["Main"]["Integrity"] = box:isSelected(1)
	end
    self.gameOptions:add(Integrity)

	self.addY = self.addY + FONT_HGT_MEDIUM + 10
    
end


function CMRBModOption(_self)
		_self:addPage(TabName);
		_self.addY = 40;
		_self.mainPanel:setScrollHeight(_self.addY + 50);
        _self:CMRBOption()

end

function SaveSettings(_self)
    local file = getFileWriter(FILE_SETTINGS, true, false)
    for k, v in pairs(CurrentOption) do
        if CurrentOption[k] ~= nil then
            if type(v) == "table" then
                file:write("\r\n[" .. k .. "]\r\n")
                for tk, tv in pairs(v) do
                    if CurrentOption[k][tk] ~= nil then
                        file:write(tk .. '=' .. tostring(tv) .. "\r\n")
                    end
                end
            else
                file:write(k .. '=' .. tostring(v) .. "\r\n")
            end
        end
    end
    file:close()
end


function MainOptions:create()
	CMRBModOptionCreate(self);
	local status, err = pcall(CMRBModOption, self);
	if not status then
		print('pcall error')
	end
end

function MainOptions:apply(closeAfter)
	CMRBModOptionApply(self, closeAfter)
    --MainOptions.saveKeys()
	local status, err = pcall(SaveSettings, self);
	if not status then
		print('pcall error')
	end
end


function MainOptions:new (x, y, width, height)
    local o = {}
    --o.data = {}
    o = ISPanelJoypad:new(x, y, width, height);
    setmetatable(o, self)
    self.__index = self
    o.x = x;
    o.y = y;
    o.backgroundColor = {r=0, g=0, b=0, a=0.3};
    o.borderColor = {r=1, g=1, b=1, a=0.2};
    o.width = width;
    o.height = height;
    o.anchorLeft = true;
    o.anchorRight = false;
    o.anchorTop = true;
    o.anchorBottom = false;
    o.addY = 0;
    o.gameOptions = CMRBOptions:new()
    MainOptions.instance = o;
    return o
end
CheatOption.OptionTrigger = nil
function CheatOption.SettingUpdate()
    CheatCoreCM.DoLuaChecksum = CurrentOption["Main"]["Integrity"]
    if CheatCoreCM.DoLuaChecksum then
        CheatOption.OptionTrigger = 1
        else
        CheatOption.OptionTrigger = 0
    end
ISUICheatMenu.PrivilegeCheck()
end

function CheatOption.Setop()
end

CheatOption.Initialization()
CheatOption:LoadSettings()


Events.OnPlayerUpdate.Add(CheatOption.SettingUpdate)
--Events.OnPlayerUpdate.Add(ISUICheatMenu.PrivilegeCheck)

print("[CHEAT MENU] CMRB Mod Option has been successfully loaded")