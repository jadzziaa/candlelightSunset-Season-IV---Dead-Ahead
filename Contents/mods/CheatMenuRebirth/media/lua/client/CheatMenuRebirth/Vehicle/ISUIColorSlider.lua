ISUIColorWindow = ISCollapsableWindow:derive("ISUIColorWindow")
ISUIColorSlider = ISPanel:derive("ISUIColorSlider")
ISUIColorWindow.IDs = nil


function ISUIColorWindow:initialise()
	ISCollapsableWindow.initialise(self);
	self:makeChildren()
end


        
function ISUIColorWindow:changeColor()
	local rpos = self.rSlider.hscroll.pos
    local gpos = self.gSlider.hscroll.pos
    local bpos = self.bSlider.hscroll.pos
	
	if CheatCoreCM.SelectedVehicle then
		local script = CheatCoreCM.SelectedVehicle:getScript()
			script:setForcedVal(rpos)
			script:setForcedSat(gpos)
			script:setForcedHue(bpos)
        CheatCoreCM.SelectedVehicle:setColorHSV(script:getForcedHue(), script:getForcedSat(), script:getForcedVal())        
	   getPlayer():Say(getText("UI_CMRB_Message_VehicleColorChanged"))
    end
 
end



function ISUIColorWindow:makeChildren()

	self.rSlider = ISUIColorSlider:new(self.width - self.width / 1.3, self.height / 4, self.width / 1.3, 16, self, nil)
	self.rSlider:initialise()
	self.rSlider.borderColor = {r=0,g=0,b=0,a=0}
	self:addChild(self.rSlider)
	
	self.gSlider = ISUIColorSlider:new(self.width - self.width / 1.3, self.rSlider.y + 16, self.width / 1.3, 16, self, nil)
	self.gSlider:initialise()
	self.gSlider.borderColor = {r=0,g=0,b=0,a=0}
	self:addChild(self.gSlider)
	
	self.bSlider = ISUIColorSlider:new(self.width - self.width / 1.3, self.gSlider.y + 16, self.width / 1.3, 16, self, nil)
	self.bSlider:initialise()
	self.bSlider.borderColor = {r=0,g=0,b=0,a=0}
	self:addChild(self.bSlider)
	
    self.InpButton = ISButton:new(0, self.bSlider:getHeight() *4 + self:titleBarHeight(), self:getWidth(), self:getHeight() / 3, getText("UI_CMRB_Window_Set"), self, self.changeColor); 
	self.InpButton:initialise();
	self.InpButton:instantiate();
	self.InpButton.borderColor = {r=0.4, g=0.4, b=0.4, a=1.0};
	self:addChild(self.InpButton);
    
	--[[
	if CheatCoreCM.SelectedVehicle then
		local script = CheatCoreCM.SelectedVehicle:getScript()
		self.rSlider.hscroll.pos = script:getForcedHue() > 0 and script:getForcedHue() or 0
		self.gSlider.hscroll.pos = script:getForcedSat() > 0 and script:getForcedSat() or 0
		self.bSlider.hscroll.pos = script:getForcedVal() > 0 and script:getForcedVal() or 0
	end
	--]]
	--[[
	self.ColorSquare = ISPanel:new((self.width / 2) - self.width / 8, self.bSlider.y + (self.height / 4), self.width / 4, self.height / 4)
	self.ColorSquare:initialise()
	self.ColorSquare.backgroundColor = {r=0.1,g=0.1,b=0.1,a=1}
	self.ColorSquare.borderColor = {r=1,g=1,b=1,a=1}
	self:addChild(self.ColorSquare)
	--]]
	--self.rSlider:setScrollWithParent(false)
	--self.rSlider:setScrollChildren(true)
end


function ISUIColorWindow:prerender()
	local height = self:getHeight();
	local th = self:titleBarHeight()
	if self.isCollapsed then
		height = th;
    end
    if self.drawFrame then
        self:drawRect(0, 0, self:getWidth(), th, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
        self:drawTextureScaled(self.titlebarbkg, 2, 1, self:getWidth() - 4, th - 2, 1, 1, 1, 1);
        self:drawRectBorder(0, 0, self:getWidth(), th, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    end
    if self.background and not self.isCollapsed then
		local rh = self:resizeWidgetHeight()
		if not self.resizable or not self.resizeWidget:getIsVisible() then rh = 0 end
        self:drawRect(0, th, self:getWidth(), self.height - th - rh, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    end

    
	if self.clearStentil then
		self:setStencilRect(0,0,self.width, height);
	end

	if self.title ~= nil and self.drawFrame then
		self:drawTextCentre(self.title, self:getWidth() / 2, 1, 1, 1, 1, 1, self.titleBarFont);
	end
	if self.rSlider ~= nil then
		self:drawText(getText("UI_CMRB_VehicleControl_ColorBrightness"), 3, self.rSlider.y, 1, 1, 1, 1, UIFont.Small)
		self:drawText(getText("UI_CMRB_VehicleControl_ColorSaturation"), 3, self.gSlider.y, 1, 1, 1, 1, UIFont.Small)
		self:drawText(getText("UI_CMRB_VehicleControl_ColorHue"), 3, self.bSlider.y, 1, 1, 1, 1, UIFont.Small)
	end
end


function ISUIColorWindow:destroy()
	self:setVisible(false)
	self:removeFromUIManager()
    ISUIColorWindow.IDs = nil
end

function ISUIColorWindow:close()
	self:setVisible(false)
	self:removeFromUIManager()
    ISUIColorWindow.IDs = nil
end

function ISUIColorWindow:new(x, y, width, height)
	local o = {}
	o = ISCollapsableWindow:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self
	o.title = getText("UI_CMRB_VehicleControl_ColorEditorWindow")
	o.resizable = false
	o.pin = true;
	o.isCollapsed = false;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
    ISUIColorWindow.IDs = "VehicleColor"
	--o:noBackground();
	--o.clearStentil = false
	--o.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end


function ISUIColorWindow.makeWindow()
	local window = ISUIColorWindow:new(50,50,370,120)
	window:initialise()
	window:addToUIManager()
end




function ISUIColorSlider:initialise()
	ISPanel.initialise(self);
	self:createChildren()
end


function ISUIColorSlider:createChildren()
	self:addScrollBars(true)
	self:setScrollWidth(1000)
	self.hscroll:setWidth(self.width - 1)
	--self.hscroll:setHeight(self.height)
	self.hscroll:setAlwaysOnTop(true)
	self.hscroll.target, self.hscroll.func = self.target, self.func
	

	function self.hscroll:onMouseMove(dx, dy)
		if self.scrolling then
			local sw = self.parent:getScrollWidth()
			if sw > self.parent:getScrollAreaWidth() then
				local del = self:getWidth() / sw
				local boxheight = del * (self:getWidth()- (20 * 2))
				local dif = self:getWidth() - (20 * 2) - boxheight
				self.pos = self.pos + (dx / dif)
				if self.pos < 0 then
					self.pos = 0
				end
				if self.pos > 1 then
					self.pos = 1
				end
				self.parent:setXScroll(-(self.pos * (sw - self.parent:getScrollAreaWidth())))
			end
			if self.func then
				pcall(self.func)
			end
		end
	end
	
end


function ISUIColorSlider:new(x, y, width, height, target, func)
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.target = target
	o.func = func
	--o:noBackground();
	--o.clearStentil = false
	--o.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end




--Events.OnLoad.Add(ISUIColorWindow.makeWindow)