TeleportWindow = ISCollapsableWindow:derive("TeleportWindow")
TeleportBox = ISPanel:derive("TeleportBox")

TeleportWindow.IDs = nil
TeleportWindow.Trigger = 0
TeleportWindow.OldCoordTrigger = 0


function CheckNumeric(value)
if value == tostring(tonumber(value)) then
    return true
elseif value == "" then
    return true
else
    return false
end
end


function TeleportWindow:initialise()
	ISCollapsableWindow.initialise(self);
	self:makeChildren()
end

function TeleportWindow.Teleport(Teleport_X, Teleport_Y, Teleport_Z)
	if isClient() then
		SendCommandToServer("/teleportto " .. Teleport_X .. "," .. Teleport_Y .. ","..Teleport_Z);
	else
		getPlayer():setX(Teleport_X)
		getPlayer():setY(Teleport_Y)
		getPlayer():setZ(Teleport_Z)
		getPlayer():setLx(getPlayer():getX())
		getPlayer():setLy(getPlayer():getY())
		getPlayer():setLz(getPlayer():getZ())
		getWorld():update()
	end
end

function TeleportWindow:SetLocation()

    if self.XInput:getText() == "" then
        X = math.floor(getPlayer():getX())
        TeleportWindow.OldCoordTrigger = TeleportWindow.OldCoordTrigger + 1
    elseif CheckNumeric(self.XInput:getText()) == false then 
        X = nil
    else
        X = tonumber(self.XInput:getText())
    end
    
    if self.YInput:getText() == "" then
        Y = math.floor(getPlayer():getY())
        TeleportWindow.OldCoordTrigger = TeleportWindow.OldCoordTrigger + 1
    elseif CheckNumeric(self.YInput:getText()) == false then
        Y = nil
    else
        Y = tonumber(self.YInput:getText())
    end    
    
    if self.ZInput:getText() == "" then 
        Z = math.floor(getPlayer():getZ())
        TeleportWindow.OldCoordTrigger = TeleportWindow.OldCoordTrigger + 1
    elseif CheckNumeric(self.ZInput:getText()) == false then
        Z = nil
    else
        Z = tonumber(self.ZInput:getText())
    end    

    if X ~= nil and Y ~= nil and Z ~= nil then
        --local old_X, old_Y, old_Z = math.floor(getPlayer():getX()), math.floor(getPlayer():getY()), math.floor(getPlayer():getZ())
    
      if getWorld():isValidSquare(X, Y ,Z) == false then
        getPlayer():Say(getText("UI_CMRB_Teleport_Unsafe_OuterBorder"))
        --TeleportWindow.Teleport(old_X, old_Y, old_Z)
        getWorld():update()
        TeleportWindow.Trigger = 0
	  elseif getWorld():getMetaGrid():isValidChunk(X/10,Y/10) == false then
        getPlayer():Say(getText("UI_CMRB_Teleport_Unsafe_NoChunkData"))
        --TeleportWindow.Teleport(old_X, old_Y, old_Z)
        getWorld():update()
        TeleportWindow.Trigger = 0
      else
        if Z > 0 then
            if TeleportWindow.OldCoordTrigger == 3 then
                TeleportWindow.Teleport(X, Y, Z)
                getPlayer():Say(getText("UI_CMRB_Message_TeleportChange", X, Y, Z))
                getWorld():update()
                TeleportWindow.OldCoordTrigger = 0
            else
            if TeleportWindow.Trigger == 1 then
                    TeleportWindow.Teleport(X, Y, Z)
                    getPlayer():Say(getText("UI_CMRB_Message_TeleportChange", X, Y, Z))
                    getWorld():update()
                    TeleportWindow.Trigger = 0
            else
                getPlayer():Say(getText("UI_CMRB_Message_TeleportMayUnsafe_1"))
                getPlayer():Say(getText("UI_CMRB_Message_TeleportMayUnsafe_2"))
                TeleportWindow.Trigger = TeleportWindow.Trigger + 1   
            end
            end
         else
            TeleportWindow.Teleport(X, Y, Z)
            getPlayer():Say(getText("UI_CMRB_Message_TeleportChange", X, Y, Z))
            getWorld():update()
            TeleportWindow.Trigger = 0
         end    
      end
    else
        getPlayer():Say(getText("UI_CMRB_Message_CannotTeleport"))
    end
TeleportWindow.OldCoordTrigger = 0
end


function TeleportWindow:makeChildren()
	
	self.XInput = ISTextEntryBox:new("", 0, self:titleBarHeight()+20, self:getWidth() / 3, self:getHeight() / 3);
	self.XInput:initialise();
	self.XInput:instantiate();
	self.XInput:setMultipleLine(false)
	self.XInput.javaObject:setMaxLines(1);
	self:addChild(self.XInput); -- to center, set border pixel and multiply by border pixel / 2
    
    
    self.YInput = ISTextEntryBox:new("", self:getWidth() / 3, self:titleBarHeight()+20, self:getWidth() / 3, self:getHeight() / 3);
	self.YInput:initialise();
	self.YInput:instantiate();
	self.YInput:setMultipleLine(false)
	self.YInput.javaObject:setMaxLines(1);
	self:addChild(self.YInput); -- to center, set border pixel and multiply by border pixel / 2
    
    
    self.ZInput = ISTextEntryBox:new("", (self:getWidth() / 3) * 2, self:titleBarHeight()+20, self:getWidth() / 3, self:getHeight() / 3);
	self.ZInput:initialise();
	self.ZInput:instantiate();
	self.ZInput:setMultipleLine(false)
	self.ZInput.javaObject:setMaxLines(1);
	self:addChild(self.ZInput); -- to center, set border pixel and multiply by border pixel / 2
    
   
   
	self.InpButton = ISButton:new(0, self.XInput:getHeight() + self:titleBarHeight()+20, self:getWidth(), self:getHeight() / 3, getText("UI_CMRB_TeleportLocation_Teleport"), self, self.SetLocation); 
	self.InpButton:initialise();
	self.InpButton:instantiate();
	self.InpButton.borderColor = {r=0.4, g=0.4, b=0.4, a=1.0};
	self:addChild(self.InpButton);
	
	--self:setHeight(self:getHeight() - (self:titleBarHeight() / 2)) 
end


function TeleportWindow:prerender()
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
        self:drawTextCentre(getText("UI_CMRB_TeleportWindow_X"), (self.XInput.x + self.YInput.x) / 2, self:titleBarHeight()+2, 1, 1, 1, 1, UIFont.Small)
		self:drawTextCentre(getText("UI_CMRB_TeleportWindow_Y"), (self.YInput.x + self.ZInput.x) / 2, self:titleBarHeight()+2, 1, 1, 1, 1, UIFont.Small)
		self:drawTextCentre(getText("UI_CMRB_TeleportWindow_Z"), (self.ZInput.x + self:getWidth()) / 2, self:titleBarHeight()+2, 1, 1, 1, 1, UIFont.Small)
end


function TeleportWindow:destroy()
	self:setVisible(false)
	self:removeFromUIManager()
    TeleportWindow.IDs = nil
end

function TeleportWindow:close()
	self:setVisible(false)
	self:removeFromUIManager()
    TeleportWindow.IDs = nil
end

function TeleportWindow:new(x, y, width, height)
	local o = {}
	o = ISCollapsableWindow:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self
	o.title = getText("UI_CMRB_Utility_TeleportCoord")
	o.resizable = false
	o.pin = true;
	o.isCollapsed = false;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
    TeleportWindow.IDs = "Teleport"
	--o:noBackground();
	--o.clearStentil = false
	--o.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end


function TeleportWindow.makeWindow()
	local window = TeleportWindow:new(100,100,370,100)
    -- Change the window's width, height << later job.
	window:initialise()
	window:addToUIManager()
end


function TeleportBox:initialise()
	ISPanel.initialise(self);
	self:createChildren()
end


function TeleportBox:createChildren()
	--self:addScrollBars(true)
	--self:setScrollWidth(1000)
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


function TeleportBox:new(x, y, width, height, target, func)
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