ISUIRustWindow = ISCollapsableWindow:derive("ISUIRustWindow")
ISUIRustSlider = ISPanel:derive("ISUIRustSlider")
ISUIRustWindow.IDs = nil


function ISUIRustWindow:initialise()
	ISCollapsableWindow.initialise(self);
	self:makeChildren()
end


function ISUIRustWindow:SetRust()
	local pos = self.rSlider.hscroll.pos
    print (pos)
	if CheatCoreCM.SelectedVehicle then
    local vehicle = CheatCoreCM.SelectedVehicle
        if isClient() then
            sendClientCommand(getSpecificPlayer(getPlayer():getPlayerNum()), "vehicle", "setRust", { vehicle = vehicle:getId(), rust = pos })
        else
			vehicle:setRust(pos)
        end
        getPlayer():Say(getText("UI_CMRB_Message_VehicleRustChanged"))
	end
end



function ISUIRustWindow:makeChildren()
	
	self.rSlider = ISUIRustSlider:new(self.width - self.width / 1.2, self:titleBarHeight(), self.width / 1.2, 16, self, nil)
	self.rSlider:initialise()
	self.rSlider.borderColor = {r=0,g=0,b=0,a=0}
	self:addChild(self.rSlider)
	
    self.InpButton = ISButton:new(0, self.rSlider:getHeight() + self:titleBarHeight()+20, self:getWidth(), self:getHeight() / 3, getText("UI_CMRB_Window_Set"), self, self.SetRust); 
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
	self.RustSquare = ISPanel:new((self.width / 2) - self.width / 8, self.bSlider.y + (self.height / 4), self.width / 4, self.height / 4)
	self.RustSquare:initialise()
	self.RustSquare.backgroundRust = {r=0.1,g=0.1,b=0.1,a=1}
	self.RustSquare.borderRust = {r=1,g=1,b=1,a=1}
	self:addChild(self.RustSquare)
	--]]
	--self.rSlider:setScrollWithParent(false)
	--self.rSlider:setScrollChildren(true)
end


function ISUIRustWindow:prerender()
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
		self:drawText(getText("UI_CMRB_VehicleControl_Rust"), 3, self.rSlider.y, 1, 1, 1, 1, UIFont.Medium)
	end
end


function ISUIRustWindow:destroy()
	self:setVisible(false)
	self:removeFromUIManager()
    ISUIRustWindow.IDs = nil
end


function ISUIRustWindow:close()
	self:setVisible(false)
	self:removeFromUIManager()
    ISUIRustWindow.IDs = nil
end



function ISUIRustWindow:new(x, y, width, height)
	local o = {}
	o = ISCollapsableWindow:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self
	o.title = getText("UI_CMRB_VehicleControl_RustEditorWindow")
	o.resizable = false
	o.pin = true;
	o.isCollapsed = false;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
    ISUIRustWindow.IDs = "Rust"
	--o:noBackground();
	--o.clearStentil = false
	--o.borderRust = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end


function ISUIRustWindow.makeWindow()
	local window = ISUIRustWindow:new(200,200,370,80)
	window:initialise()
	window:addToUIManager()
end




function ISUIRustSlider:initialise()
	ISPanel.initialise(self);
	self:createChildren()
end


function ISUIRustSlider:createChildren()
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


function ISUIRustSlider:new(x, y, width, height, target, func)
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
	--o.borderRust = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end




--Events.OnLoad.Add(ISUIRustWindow.makeWindow)