crucibleItem = ISUIElement:derive("crucibleItem")

function crucibleItem:initialise()
	ISUIElement.initialise(self)
end

function crucibleItem:makeChildren()
	self.made = true
	
	--self:setOnMouseDoubleClick(self, function() self:addItem() end)
	
	self.panel = ISPanel:new(self.width * 0.05, self.height / 4, self.width * 0.10, self.height / 2)
	self.panel.borderColor = {r=0.4, g=0.4, b=0.4, a=1}
	--self.panel:noBackground()
	self.panel:initialise()
	self:addChild(self.panel)
	
	
	local tex = self.texture
	local tw = tex:getWidth() + tex:getOffsetX()
    if tw > 40 then
        tw = 32
    end
	local th = tex:getHeight() + tex:getOffsetY()
    if th > 40 then
        th = 32
    end
    
	local pa = self.panel.width * self.panel.height
	local pw = self.panel.width - tw
	local ph = self.panel.height - th
	--if pa < tw * th then print(pa, tw * th) end
	--self.texture:setWidth(self.texture:getWidthOrig() * crucibleCore.Wmod) -- for UI scaling
	--self.texture:setHeight(self.texture:getHeightOrig() * crucibleCore.Wmod)
	--[[
	self.temp = ISPanel:new(0,0,tw,th) -- for debugging, used to visualize texture size
	self.temp.backgroundColor = {r=1, g=0.4, b=0.4, a=0.5}
	self.temp:initialise()
	--]]

	self.image = ISImage:new(pw / 2,ph / 2,pw / 2,ph / 2,tex)

	self.image.ph = self.panel.height
	self.image.pw = self.panel.width
	function self.image:prerender()
		self:drawTextureScaledAspect(self.texture,0,0,self.ph >= 32 and 32 or self.ph * 0.80 , self.pw >= 32 and 32 or self.pw * 0.80,1,1,1,1)
	end
	--self.image.scaledWidth = self.panel.width * 0.60
	--self.image.scaledHeight = self.panel.height * 0.60
	--self.image.borderColor = {r=0.4, g=0.4, b=1, a=1}
	--self.image.backgroundColor = {r=1, g=0.1, b=0.1, a=1}
	self.image:initialise()
	--self.image:addChild(self.temp)
	self.panel:addChild(self.image)
end

function crucibleItem:onMouseDown()
	self:addItem()
end

function crucibleItem:onRightMouseDown() -- placeholder
	
end

function crucibleItem:prerender()
	if self:checkIfVisible() then
	
		if not self.made then self:makeChildren() end
		
		if self.background then
			self.fade:setFadeIn(self:isMouseOver() or false)
			self.fade:update()
			local f = 1 - self.fade:fraction()
			self:drawRectStatic(0, 0, self.width, self.height, self.backgroundColor.a * f, self.backgroundColor.r * f, self.backgroundColor.g * f, self.backgroundColor.b * f);
		end
		
		if self.border then
			self:drawRectBorderStatic(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
		end
		
		self:drawText(self.invItem:getName(), (self.width * 0.05) + crucibleCore.scale(self.panel.width,0.05), (self.height - self.fontHgt) / 2, 1, 1, 1, 1, UIFont.Small)
		
		--[[
		if self:isMouseOver() then
			--print(f)
			self:drawRect(0, 0, self.width, self.height,
			self.backgroundColor.a * f,
			self.backgroundColor.r * f,
			self.backgroundColor.g * f,
			self.backgroundColor.b * f)
		end
		--]]
	else
		self:clearChildren()
		self.made = false
	end
		
end

function crucibleItem:checkIfVisible() -- the game renders UI objects even if they're outside the stencil zone, which can cause severe amounts of lag in large lists. 
	local y = self:getAbsoluteY()
	local sh = getCore():getScreenHeight()
	if y < (0 - sh) or y > sh then
		return false
	else
		return true
	end
end

function crucibleItem:addItem()
	--[[
	if self.debug == true then
		print(self:getYScroll())
		print(self.item:getType())
		print(self.item:getTypeString())
		print(self.item:getCategories():size())
		print(self.item:getDisplayCategory())
		local test = instanceItem(self.item:getFullName())
		if test then
			print("fulltype:", test:getFullType())
			print("category", test:getCategory())
			print("cat", test:getCat())
			print("displaycategory", test:getDisplayCategory())
			print("displayname", test:getDisplayName())
			print("id", test:getID())
			print("name", test:getName())
			print("type", test:getType())
			print("icon", self.item:getIcon())
			print("invItem icon", test:getTexture())
			local icons = test:getIconsForTexture()
			if icons then
				for i = icons:size() - 1,0,-1 do
					--print(icons:get(i))
				end
			end
		end
	end
	--]]
	getPlayer():getInventory():AddItems(self.item:getFullName(), crucibleCore.amount)
	self.doFade = true
    getPlayer():Say(getText("UI_CMRB_Message_ItemSpawned", self.item:getDisplayName(), crucibleCore.amount))
end

function crucibleItem:new(x,y,width,height,item)
	local o = {};
	o = ISUIElement:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.background = true
	o.border = true
	o.debug = false
	o.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.6};
	o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
	o.item = item
	o.invItem = instanceItem(o.item:getFullName())
	o.texture = crucibleCore.resolveTexture(o.item,o.invItem)
	o.font = UIFont.Small
	o.fontHgt = getTextManager():getFontFromEnum(o.font):getLineHeight()
	o.fade = UITransition.new()
	o.backgroundColorMouseOver = {r=0.3, g=0.3, b=0.3, a=1.0}
	o.doFade = false
	--print(item:getTypeString())
	--print(item:getType())
	--print(o.texture:getHeight())
	return o;
end