-- Variables that we will manipulate
local BoxEnable = true

local BoxText = "MCM Example Mod"

local BoxWidth = 10
local BoxHeight = 10
local BoxScale = 1

local BoxR, BoxG, BoxB = 1, 0, 0.5
local BoxAlpha = 0.5

local FontIndex = 1
local Fonts = { "Small", "Medium", "Large", "Massive", "MainMenu1", "MainMenu2", "Cred1", "Cred2", "NewSmall", "NewMedium", "NewLarge", "Code", "MediumNew", "AutoNormSmall", "AutoNormMedium", "AutoNormLarge", "Dialogue", "Intro", "Handwritten", "DebugConsole", "Title" }

local CharSayWords = { "What", "a", "beautiful", "box", "!"}
local CharSayWordsAlt = { "Where", "is", "the", "box", "?"}
local CharSaySwitch = {true, true, true, true, true}

-- Drawing code, you can ignore this entirely
Events.OnCreateUI.Add(function()
	local Box = ISUIElement:new(0,0,0,0)

	Box.render = function(self)
		if not BoxEnable then return end

		local font = UIFont[Fonts[FontIndex]]

		local Width = BoxWidth * BoxScale
		local Height = BoxHeight * BoxScale

		local HalfWidth = 0.5 * Width
		local HalfHeight = 0.5 * Height

		local x,y = getMouseX() - HalfWidth, getMouseY() - HalfHeight
		local TextWidth = getTextManager():MeasureStringX(font, BoxText)

		self:drawRect(x, y, Width, Height, BoxAlpha, BoxR, BoxG, BoxB)
		self:drawText(BoxText, x + HalfWidth - (0.5 * TextWidth), y + Height, BoxR, BoxG, BoxB, BoxAlpha, font)
	end

	Box:initialise()
	Box:setVisible(true)
	Box:clearMaxDrawHeight()
	Box:addToUIManager()
end)

-- The MCM configuration
-- If MCM isn't installed, this block will never run,
-- and the variables will simply remain at their default value
if Mod.IsMCMInstalled_v1 then
	local ExampleOptionTable = ModOptionTable:New("MCM_ExampleMod", "MCM Example Mod", false)

	ExampleOptionTable:AddModOption("BoxEnable", "checkbox", BoxEnable, nil, "Enable", nil, function(value)
		BoxEnable = value
	end)

	ExampleOptionTable:AddModOption("BoxText", "text", BoxText, nil, "Text to render", "This string will appear under the box", function(value)
		BoxText = value
	end)

	ExampleOptionTable:AddModOption("BoxWidth", "number", BoxWidth, {step = 1}, "Width", "How far will the box stretch from left to right", function(value)
		BoxWidth = value
	end)

	ExampleOptionTable:AddModOption("BoxHeight", "number", BoxHeight, {step = 1}, "Height", "How far will the box stretch from up to down", function(value)
		BoxHeight = value
	end)

	ExampleOptionTable:AddModOption("BoxScale", "number_slider", BoxScale, { min = 1, max = 20, step = 0.5 }, "Scale", "The box will be sized up entirely by this factor", function(value)
		BoxScale = value
	end)

	ExampleOptionTable:AddModOption("BoxColor", "color", {r=BoxR, g=BoxG, b=BoxB}, nil, "Color", "The color the box will appear as", function(value)
		BoxR, BoxG, BoxB = value.r, value.g, value.b
	end)

	ExampleOptionTable:AddModOption("BoxAlpha", "number_slider", BoxAlpha, { min = 0, max = 1, step = 0.1 }, "Opacity", "At 1 box is fully solid, at 0 it is invisible", function(value)
		BoxAlpha = value
	end)

	ExampleOptionTable:AddModOption("FontIndex", "combobox", FontIndex, Fonts, "Font", "The font to draw the text in", function(value)
		FontIndex = value
	end)

	ExampleOptionTable:AddModOption("CharSayKey", "keybind", 49, nil, "Box admiration button", "When pressed, your character will exclaim profound joy over the presence of the box", function()
		local Words = CharSayWords

		if not BoxEnable then
			Words = CharSayWordsAlt
		end

		local str = ""
		for k, v in ipairs(Words) do
			if CharSaySwitch[k] then
				str = str .. " " .. v
			end
		end

		getPlayer():Say(str)
	end)

	ExampleOptionTable:AddModOption("CharSaySwitch", "checkbox_multi", CharSaySwitch, CharSayWords, "Admiration words", "Only the ticked words will be said in admiration", function(value)
		CharSaySwitch = value
	end)
end