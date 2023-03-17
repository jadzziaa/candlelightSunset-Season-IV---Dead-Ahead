compassUI = ISCollapsableWindow:derive("compassUI")
--compassText = ISPanel:derive("compassText")
--compassContext = ISUIElement:derive("compassContext")


function compassUI:initialise()
	ISCollapsableWindow.initialise(self)
end

function compassUI:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.srchString = nil; -- to prevent scoping problems.
	self.curCat = "Dixie"
	local bh = self:titleBarHeight()
	local rh = self:resizeWidgetHeight() or 0
	
	self.catPanel = compassList:new(0,bh,self.width, self.height * 0.05) -- scrollable panel for categories
	self.catPanel.horizontal = true
	self.catPanel:initialise()
	local i = 0
    local margin = 60
    local x = 0
    local precat = 0
    --local w = self.catPanel.width / 3
	for k,v in pairs(compassCore.locations) do
		local cat = k
        local cat_length
        local spaceremove = k:gsub("%s+", "_")
        local convert = "UI_CMRB_TeleportLocation_".. spaceremove
        local textconvert = getText(convert)
        
        if string.len(cat) >= 9 then
        cat_length = (string.len(textconvert) * 7) + margin
        elseif string.len(cat) >= 5 then
        cat_length = (string.len(textconvert) * 5) + margin
        else 
        cat_length = (string.len(textconvert) * 3) + margin
        end
        
		i = i+1
		local pnl = ISButton:new(0 + x, 0, cat_length, self.catPanel.height - 10, textconvert, self, function() self.curCat = cat; self:repopulate() end)
                x = cat_length + precat
        precat = precat + cat_length
		pnl.cat = cat
        
		function pnl:update()
		    breakpoint(); -- I don't know why there's a breakpoint here, but ISButton implements it so I'm assuming it's important
			ISUIElement.update(self)
			
			if self.cat == self.target.curCat then
				self.backgroundColor = {r=0.3, g=0.3, b=0.3, a=0.8}
			else
				self.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.8}
			end
			
		end
		pnl.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.8}
		pnl.borderColor = {r=0.7, g=0.7, b=0.7, a=1}
		self.catPanel:addChild(pnl)
	end
	
	self:addChild(self.catPanel)

	--self.catPanel:setScrollWidth( (#compassCore.categories * (self.catPanel.width * 0.30)) - (self.catPanel.width - self.catPanel.hscroll:getWidth()))
	self.catPanel:setScrollWidth(x)
	self.catPanel.hscroll:setWidth(self.catPanel.width)
	
	self.btmPanel = ISPanel:new(0,compassCore.scale(self.height,0.05,true) - (bh - rh),self.width,self.height * 0.05)
	self.btmPanel:initialise()
	self.btmPanel.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.8}
	self:addChild(self.btmPanel)
	
	self.srchBar = ISTextEntryBox:new("", self.btmPanel.width * 0.05, self.btmPanel.height / 5, self.btmPanel.width * 0.30, compassCore.scale(self.btmPanel.height,0.40,true));
	self.srchBar.borderColor = {r=0.4, g=0.4, b=0.4, a=0.8}
	self.srchBar:initialise()
    
	function self.srchBar.onTextChange()
		self.srchString = string.lower(self.srchBar:getInternalText())
		self.contPanel:clearChildren();
		self.contPanel:populate(self.curCat, self.srchString);
		self.contPanel:createChildren()
	end
	self.srchBar:setAlwaysOnTop(true)
	
	
	self.srchIcon = ISImage:new(self.srchBar.x,self.srchBar.y + 2, 0,0,getTexture("media/UI/crucibleUI/search.png"))
	--self.srchIcon.backgroundColor = {r=0.6, g=0.6, b=0.6, a=1}
	self.srchIcon.scaledWidth = (self.srchBar.height * 0.80)
	self.srchIcon.scaledHeight = (self.srchBar.height * 0.80)
	self.srchIcon:initialise()
	
	self.newCustom = ISButton:new( (self.srchBar.x + self.srchBar.width) + 2, self.btmPanel.height / 5, self.btmPanel.width * 0.30, compassCore.scale(self.btmPanel.height,0.40,true), getText("UI_CMRB_TeleportLocation_NewLocation"), self, function() compassCore:addCustom(); self:repopulate() end)
	self.newCustom.borderColor = {r=0.4, g=0.4, b=0.4, a=0.8}
	self.newCustom:initialise()
	self.newCustom.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.8}
	
	function self.newCustom:update()
		if self.target.curCat ~= "Custom" then
			self:setVisible(false)
		else
			self:setVisible(true)
		end
	end
	
	self.btmPanel:addChild(self.srchIcon)
	self.btmPanel:addChild(self.srchBar)
	self.btmPanel:addChild(self.newCustom)

	self.contPanel = compassList:new(0,bh + self.catPanel.height, self.width, (self.height - rh) - (self.catPanel.height + self.btmPanel.height + bh) )
	self.contPanel.background = true
	self.contPanel.backgroundColor = {r=0.1,g=0.1,b=0.1,a=0.6}

	self.contPanel:initialise()
	self.contPanel:populate(self.curCat)
	self:addChild(self.contPanel)
	
	self.btmBar = ISPanel:new(0, self.height-rh, self.width, rh)
	self.btmBar.backgroundColor = {r=0, g=0, b=0, a=1.0};
	self:addChild(self.btmBar)
	
	
	
	compassCore.debug = self
end


function compassUI:repopulate()
	self.contPanel:clearChildren()
	self.contPanel:populate(self.curCat, self.srchString)
	self.contPanel:createChildren()
end

function compassUI:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = getText("UI_CMRB_Utility_TeleportLocation");
	o.pin = true;
	o.resizable = false;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o:noBackground();
	o.clearStentil = false
	--o.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end