crucibleUI = ISCollapsableWindow:derive("crucibleUI")
--crucibleText = ISPanel:derive("crucibleText")
--crucibleContext = ISUIElement:derive("crucibleContext")

local sortoption = {"Name", "Weight"}

function crucibleUI:initialise()
	ISCollapsableWindow.initialise(self)
end

function crucibleUI:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.srchString = nil; 
	self.curCat = "Normal"
	local bh = self:titleBarHeight()
	local rh = self:resizeWidgetHeight() or 0
	
	self.catPanel = crucibleList:new(0,bh,self.width, self.height * 0.05) -- scrollable panel for categories
	self.catPanel.horizontal = true
	self.catPanel:initialise()
	local i = 0
    local margin = 60
    local x = 0
    local precat = 0
    --local w = self.catPanel.width / 2.5
	for k,v in pairs(crucibleCore.items) do
        local cat = k
        local cat_length
        if string.len(cat) >= 7 then
        cat_length = (string.len(cat) * 5) + margin
        else 
        cat_length = (string.len(cat) * 3) + margin
        end
        
		i = i+1
		local pnl = ISButton:new(0 + x, 0, cat_length, self.catPanel.height - 13, cat, self, function() self.curCat = cat; self:repopulate(); end)
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
		pnl.borderColor = {r=0.4, g=0.4, b=0.4, a=1}
		self.catPanel:addChild(pnl)
	end
	
	--self.catPanel:setScrollWidth(i * (self.catPanel.width * 0.30))
	self:addChild(self.catPanel)
	
	--self.catPanel:setScrollWidth( (#crucibleCore.categories * (self.catPanel.width * 0.30)) - (self.catPanel.width - self.catPanel.hscroll:getWidth()))
	self.catPanel:setScrollWidth(x)
	self.catPanel.hscroll:setWidth(self.catPanel.width)
	
	self.btmPanel = ISPanel:new(0,crucibleCore.scale(self.height,0.05,true) - (bh - rh),self.width,self.height * 0.05)
	self.btmPanel:initialise()
	self.btmPanel.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.8}
	self:addChild(self.btmPanel)
	
	self.srchBar = ISTextEntryBox:new("", self.btmPanel.width * 0.05, self.btmPanel.height / 5, self.btmPanel.width * 0.30, crucibleCore.scale(self.btmPanel.height,0.40,true));
	self.srchBar:initialise()
	function self.srchBar.onTextChange()
		self.srchString = string.lower(self.srchBar:getInternalText())
		self.contPanel:clearChildren();
		self.contPanel:populate(self.srchString:len() > 0 and "All" or self.curCat, self.srchString);
		self.contPanel:createChildren()
	end
	--self.srchBar:setAlwaysOnTop(true)
	
	
	self.srchIcon = ISImage:new(self.srchBar.x,self.srchBar.y + 2, 0,0,getTexture("media/UI/crucibleUI/search.png"))
	--self.srchIcon.backgroundColor = {r=0.6, g=0.6, b=0.6, a=1}
	self.srchIcon.scaledWidth = (self.srchBar.height * 0.80)
	self.srchIcon.scaledHeight = (self.srchBar.height * 0.80)
	self.srchIcon:initialise()
	
	self.btmPanel:addChild(self.srchIcon)
	self.btmPanel:addChild(self.srchBar)
	
	
	self.sortBtn = ISComboBox:new(self.srchBar.x + self.srchBar.width, self.srchBar.y, self.btmPanel.width * 0.12, self.srchBar.height)
	self.sortBtn.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.1}
	self.sortBtn.borderColor = {r=0.4, g=0.4, b=0.4, a=1}
	self.sortBtn:initialise()
   

    for k, v in pairs (sortoption) do
		self.sortBtn:addOption(v);
	end

    function self.sortBtn.onChange()
        if self.sortBtn.selected == 1 then
            crucibleCore.sort(function (a, b) return string.lower(a:getDisplayName()) < string.lower(b:getDisplayName()) end); 
            self:repopulate();
        elseif self.sortBtn.selected == 2 then
            crucibleCore.sort(function (a, b) return (a:getActualWeight() or 0) < (b:getActualWeight() or 0) end); 
            self:repopulate(); 
        end
    end


--[[
	function self.sortBtn:onMouseDown()
        --local crucibleAmountUI = crucibleAmountWindow:checkExists(getText("UI_CMRB_ItemSpawner_AmountWindow"), "ItemSpawner_AmountWindow", function() print("[Cheat Menu] Error generating inputUI") end, nil)
        --crucibleAmountUI:setVisible(true)
	end
--]]

	self.btmPanel:addChild(self.sortBtn)
	
	self.amountBtn = ISComboBox:new(self.srchBar.x + self.srchBar.width + self.sortBtn.width, self.srchBar.y, self.btmPanel.width * 0.12, self.srchBar.height)
	self.amountBtn.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.1}
	self.amountBtn.borderColor = {r=0.4, g=0.4, b=0.4, a=1}
	self.amountBtn:initialise()
    for i = 0, 50, 5 do
        if i == 0 then
            self.amountBtn:addOption(tostring(i+1))
        else
            self.amountBtn:addOption(tostring(i))
        end
	end

function self.amountBtn.onChange()
    if self.amountBtn.selected == 1 then
        crucibleCore.amount = 1
    else
        crucibleCore.amount = (self.amountBtn.selected - 1) * 5
    end
end
    
	self.btmPanel:addChild(self.amountBtn)
	

	--self.sortList:setVisible(false)
	


	self.contPanel = crucibleList:new(0,bh + self.catPanel.height, self.width, (self.height - rh) - (self.catPanel.height + self.btmPanel.height + bh) )
	self.contPanel.background = true
	self.contPanel.backgroundColor = {r=0.1,g=0.1,b=0.1,a=0.6}

	self.contPanel:initialise()
	self.contPanel:populate(self.curCat)
	self:addChild(self.contPanel)
	
	self.btmBar = ISPanel:new(0, self.height-rh, self.width, rh)
	self.btmBar.backgroundColor = {r=0, g=0, b=0, a=1.0};
	self:addChild(self.btmBar)
	
	crucibleCore.debug = self -- used for debugging with CheatCore's lua interpreter
end


function crucibleUI:repopulate()
	self.contPanel:clearChildren()
	self.contPanel:populate(self.curCat, self.srchString)
	self.contPanel:createChildren()
end

function crucibleUI:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = getText("UI_CMRB_Item_ItemSpawnerWindow");
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o:noBackground();
	o.clearStentil = false
	--o.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end




function crucibleUI.makeWindow()
	if crucibleCore.mainWindow == nil then
		crucibleCore.getItems()
		local sw = getCore():getScreenWidth()
		local sh = getCore():getScreenHeight()
		local w = (sw / 3.8) * crucibleCore.Wmod <= sw and (sw / 3.8) * crucibleCore.Wmod or sw -- window will not be larger than the display area
		local h = (sh / 1.3) * crucibleCore.Hmod <= sh and (sh / 1.3) * crucibleCore.Hmod or sh
		local window = crucibleUI:new(100,100, w, h) -- original design is scaled on getScreenWidth() / 3.8, old height is 1.3
		window:setVisible(true)
		window:addToUIManager()
        window.pin = true;
        window.resizable = true;
		local mt = getmetatable(crucibleCore.debug)
		crucibleCore.mainWindow = window
		setmetatable(crucibleCore.mainWindow, mt)
	else
		crucibleCore.mainWindow:setVisible(true)
	end
end

function crucibleUI.removeWindow()
	local window = crucibleCore.mainWindow
	window:setVisible(false)
	window:removeFromUIManager()
end

--[[
function crucibleText:new(x,y,width,height,text)
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.text = text
	o.background = true
	o.border = true
	o.font = UIFont.Small
	o.fontHgt = getTextManager():getFontFromEnum(o.font):getLineHeight()
	o.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.6};
	o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
	return o;
end

function crucibleText:prerender()
	if self.background then
		self:drawRectStatic(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	end
	if self.border then
		self:drawRectBorderStatic(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
	end
	self:drawTextCentre(self.text, self.width / 2, self.height / 2 - (self.fontHgt / 2), 1, 1, 1, 1, self.font);
end
--]]



--[[
function crucibleContext:new(x,y,width,height)
	local o = {};
	o = ISUIElement:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.horizontal = false
	o.backgroundColor = {r=0.1,g=0.1,b=0.1,a=0.8}
	o.borderColor = {r=0.4,g=0.4,b=0.4,a=1}
	o.menus = {}
	return o;
end

function crucibleContext:addNew(x,y,width,height)
	table.insert(ISButton:new(0, h * (i - 1), self.sortMenu.width, h, "TEST", self.sortMenu, function() print("TEST") end))
	self.menus[#self.menus]:instantiate()
	self.addChild(self.menus[#self.menus])
end
--]]





