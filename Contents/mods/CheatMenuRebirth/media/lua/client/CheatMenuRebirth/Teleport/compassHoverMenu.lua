compassHoverMenu = ISPanel:derive("compassHoverMenu")

function compassHoverMenu:initialise()
	ISPanel.initialise(self)
end

function compassHoverMenu:prerender()
	if self.background then
		self:drawRectStatic(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	end
	if self.border then
		self:drawRectBorderStatic(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
	end
	
	for i = 1,#self.items do
		self.items[i].y = self:getAbsoluteY() + (self.origHeight * (i - 1))
		self:drawRectStatic(0, self.origHeight * (i - 1), self.width, self.origHeight, 1, 0.1, 0.1, 0.1);
		self:drawRectBorderStatic(0, self.origHeight * (i - 1), self.width, self.origHeight, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
		self:drawTextCentre(self.items[i][1], self.width / 2, (self.origHeight * (i - 1)) + (getTextManager():MeasureStringY(self.font, self.items[i][1]) / 2), 1, 1, 1, 1, self.font);
	end
	if self.moused then
		for i = 1,#self.items do
			local mx = getMouseX()
			local my = getMouseY()
			if my > self.items[i].y and (i == #self.items or my < self.items[i+1].y) then -- determines which menu item is being hovered over
				self.selected = self.items[i]
				self:drawRectStatic(0, self.items[i].y - self:getAbsoluteY(), self.width, self.origHeight, 0.3, 0.1, 1, 0.1);
			end
		end
	end	
end

function compassHoverMenu:getNew(txt, func)
	table.insert(self.items, {txt, func})
	if #self.items > 1 then self:setHeight(self:getHeight() + self.origHeight) end
	self:bringToTop()
end

function compassHoverMenu:fixY() -- hack
	self:setY(self:getY() - self:getHeight())
end

function compassHoverMenu:onMouseMove()
	self.moused = true
end

function compassHoverMenu:onMouseMoveOutside()
	self.moused = false
	local mx = getMouseX()
	local my = getMouseY() --  mx - self:getAbsoluteX() > 100 and
	local ay = self:getAbsoluteY()
	local ax = self:getAbsoluteX()
	if self:getIsVisible() then
		if (my < ay - 25 or my > ay + 25 + self.height) or (mx < ax - 25 or mx > ax + 25 + self.width) then -- hides menu if mouse moves away
			self:setVisible(false)
		end
	end
		
end

function compassHoverMenu:onMouseDown()
	pcall(self.selected[2])
	self:setVisible(false)
end


function compassHoverMenu:new(x,y,width,height)
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.origHeight = o.height
	o.background = true
	o.border = true
	o.moused = false
	o.func = nil
	o.backgroundColor = {r=0.1,g=0.1,b=0.1,a=0.8}
	o.borderColor = {r=0.4,g=0.4,b=0.4,a=1}
	o.font = UIFont.Small
	o.fontHgt = getTextManager():getFontFromEnum(o.font):getLineHeight()
	o.items = {}
	return o;
end
