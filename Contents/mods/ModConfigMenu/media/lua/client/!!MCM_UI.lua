UINumberSlider = ISUIElement:derive("UINumberSlider")

function UINumberSlider:new(x,y, width, min, max, step, bShowLabel)
	local o = ISUIElement:new(x, y, width, 20)
    setmetatable(o, self)
    self.__index = self

	-- value stuff
	o.bShouldSlide = false
	o.CurrSliderPos = 0
	o.VisualSliderPos = 0

	o.RealValue = min
	o.OnSetValue = nil

	o.min = min or 0
	o.max = max or 1
	o.step = step

	-- render stuff
	o.Thickness = 1
	o.ThicknessChevron = 5
	o.ThicknessStartEnd = 1

	o.StartEndHeightScale = 0.5

	return o
end

function UINumberSlider:SetSliderPos(Pos)
	self.CurrSliderPos = Pos

	-- transform slider space to value space,
	-- snap to grid, then transform back
	local RealValue = MCM_Helpers.Lerp(self.min, self.max, Pos)
	RealValue = MCM_Helpers.GetSnappedToGrid(RealValue, self.step, self.min, self.max)

	self.RealValue = RealValue
	if self.OnSetValue then self.OnSetValue(RealValue) end

	self.VisualSliderPos = (RealValue - self.min) / (self.max - self.min)
end

function UINumberSlider:GetValue()
	return self.RealValue
end

function UINumberSlider:prerender()
	if self.bShouldSlide then
		local pos = math.max(0, math.min(1, self:getMouseX() / self.width))
		self:SetSliderPos(pos)
	end
end

function UINumberSlider:render()
	-- main line
	self:drawRect(0, (self.height * 0.5) - (self.Thickness * 0.5), self.width, self.Thickness, 1, 1, 1, 1)

	-- start, end and mid chevrons
	local function DrawVert(x, thickness, scale_h, brightness)
		local AbsolutePos = x * self.width

		self:drawRect(AbsolutePos - (thickness * 0.5), (1 - scale_h) * self.height * 0.5, thickness, self.height * scale_h, 1, brightness, brightness, brightness)
	end

	DrawVert(0, self.ThicknessStartEnd, self.StartEndHeightScale, 1)
	DrawVert(1, self.ThicknessStartEnd, self.StartEndHeightScale, 1)
	DrawVert(self.VisualSliderPos, self.ThicknessChevron, 1, 0.3)
end

-- ui interaction events
function UINumberSlider:onMouseDown()
	self.bShouldSlide = true
end

function UINumberSlider:onMouseUp(x, y)
	ISUIElement.onMouseUp(self, x, y)

	self.bShouldSlide = false
end

function UINumberSlider:onMouseUpOutside(x, y)
	ISUIElement.onMouseUpOutside(self, x, y)

	self.bShouldSlide = false
end
