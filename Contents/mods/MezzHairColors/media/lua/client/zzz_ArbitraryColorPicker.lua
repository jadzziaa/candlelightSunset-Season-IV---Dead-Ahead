local OldISColorPicker = ISColorPicker

-- HSB to RGB funcs
local function HSB2RGB(H, S, B)
	local HueSegment = 60
	local SixHueSegments = 6*HueSegment

	local function GetColorChannelValue(Offset)
		local function Hue2Color(Offset)
			local ChannelValue = (-math.abs(H-Offset) / HueSegment) + 2
			return math.max(math.min(ChannelValue, 1), 0)
		end

		local Color = math.max(Hue2Color(Offset), Hue2Color(Offset + SixHueSegments)) -- Base hue color
		Color = 1 - ((1 - Color) * S) -- Saturation
		Color = Color * B -- Brightness

		return Color
	end

	local R = GetColorChannelValue(0)
	local G = GetColorChannelValue(2*HueSegment)
	local B = GetColorChannelValue(4*HueSegment)

	return R,G,B
end

local function HSB2RGBTable(H, S, B)
	local R,G,B = HSB2RGB(H,S,B)
	return {r = R, g = G, b = B}
end

-- Helper class
local ISColorPickerArbitraryChildPicker = OldISColorPicker:derive("ISColorPickerArbitraryChildPicker")

function ISColorPickerArbitraryChildPicker:onMouseDownOutside(x, y) return true end
function ISColorPickerArbitraryChildPicker:removeSelf() self.parent:removeSelf() end

-- Main window class
ISColorPickerArbitrary = ISColorPicker:derive("ISColorPickerArbitrary")

function ISColorPickerArbitrary:onMouseDownOutside(x, y)
	local x = self:getMouseX()
	local y = self:getMouseY()

	if x < 0 or y < 0 or x > self.width or y > self.height then
		self:removeSelf()
	end

	return true
end

function ISColorPickerArbitrary:initialise()
	local function NewPicker()
		local Picker = ISColorPickerArbitraryChildPicker:new(0, 0)
		Picker:initialise()
		self:addChild(Picker)

		return Picker
	end

	self.DefaultPicker = NewPicker()
	self.HuePicker = NewPicker()
	self.SatBrightPicker = NewPicker()

	-- Remove generic color list for default picker
	self.DefaultPicker:setColors({}, 0, 0)
	self.DefaultPicker:setWidth(0)
	self.DefaultPicker:setHeight(0)

	-- don't close window when picking a hue
	function self.HuePicker:picked(hide) OldISColorPicker.picked(self, false) end
	function self.HuePicker:picked2(hide) OldISColorPicker.picked2(self, false) end

	-- Basic Hue color table
	local Hues = {}
	local HueCount = 20
	for i=0,HueCount-1 do
		table.insert(Hues, HSB2RGBTable(i / HueCount * 360, 1, 1))
	end

	--[[local Hues = {}
	local HueCount = 10
	for i=0,HueCount-1 do
		table.insert(Hues, HSB2RGBTable(i / HueCount * 360, 1, 1))
	end

	Hues[3] = HSB2RGBTable(60, 1, 1)	-- yellow
	Hues[8] = HSB2RGBTable(270, 1, 1)	-- purple]]

	-- Update function when hue is picked
	local function OnHueUpdate(self, color, mouseUp)
		local VarCount = 10
		local SatBrightVariants = {}

		local function ApplySatBrightToChannel(Base, S, B)
			return B * (1 - ((1 - Base) * S))
		end

		for SatLevelIndex = 0, VarCount-1 do
			for BrightLevelIndex = 0, VarCount-1 do
				local SatLevel = SatLevelIndex / VarCount
				local BrightLevel = BrightLevelIndex / VarCount

				local NewVariant = {}
				NewVariant.r = ApplySatBrightToChannel(color.r, SatLevel, BrightLevel)
				NewVariant.g = ApplySatBrightToChannel(color.g, SatLevel, BrightLevel)
				NewVariant.b = ApplySatBrightToChannel(color.b, SatLevel, BrightLevel)

				table.insert(SatBrightVariants, NewVariant)
			end
		end

		self.SatBrightPicker:setColors(SatBrightVariants, VarCount, VarCount)
	end

	-- Satbright dimension
	self.SatBrightPicker.buttonSize = self.SatBrightPicker.buttonSize * 1

	-- Hue events
	self.HuePicker:setColors(Hues, math.min(HueCount, 10), math.floor(HueCount / 10))
	self.HuePicker.pickedTarget = self
	self.HuePicker:setPickedFunc(OnHueUpdate)
	OnHueUpdate(self, {r=1,g=0,b=0}, false)

	self:AdjustSize()

	-- Default and SatBright events
	local function CommitColor(self, color, mouseUp)
		if self.pickedFunc then
			self.pickedFunc(self.pickedTarget, color, false, self.pickedArgs[1], self.pickedArgs[2], self.pickedArgs[3], self.pickedArgs[4])
		end
	end

	local function AssignCommitColorFunc(Picker)
		Picker.pickedTarget = self
		Picker:setPickedFunc(CommitColor)
	end

	AssignCommitColorFunc(self.DefaultPicker)
	AssignCommitColorFunc(self.SatBrightPicker)
end

ISColorPickerArbitrary.removeSelf = OldISColorPicker.removeSelf -- Why isnt this just a regular panel method

function ISColorPickerArbitrary:AdjustSize()
	-- set width
	self:setWidth(math.max(self.DefaultPicker.width, self.HuePicker.width, self.SatBrightPicker.width))

	-- set height and move children
	self.DefaultPicker:setY(0)
	self.HuePicker:setY( self.DefaultPicker.y + self.DefaultPicker.height)
	self.SatBrightPicker:setY(self.HuePicker.y + self.HuePicker.height)
	self:setHeight(self.DefaultPicker:getHeight() + self.HuePicker:getHeight() + self.SatBrightPicker:getHeight())
end

ISColorPickerArbitrary.setPickedFunc = OldISColorPicker.setPickedFunc

-- reroutes to defaultpicker
function ISColorPickerArbitrary:setInitialColor(initial)
	self.DefaultPicker:setInitialColor(initial)
end

function ISColorPickerArbitrary:setColors(colors, columns, rows)
	self.DefaultPicker:setColors(colors, columns, rows)

	self:AdjustSize()
end

ISColorPickerArbitrary.render = ISPanelJoypad.render

ISColorPicker = ISColorPickerArbitrary

-- revert skin color picker back to default, it will break otherwise
local OldcreateChestTypeBtn = CharacterCreationMain.createChestTypeBtn

CharacterCreationMain.createChestTypeBtn = function(self)
	OldcreateChestTypeBtn(self)

	self.colorPickerSkin = OldISColorPicker:new(0, 0, nil)
	self.colorPickerSkin:initialise()
	self.colorPickerSkin.keepOnScreen = true
	self.colorPickerSkin.pickedTarget = self
	self.colorPickerSkin.resetFocusTo = self.characterPanel
	self.colorPickerSkin:setColors(self.skinColors, #self.skinColors, 1)
end