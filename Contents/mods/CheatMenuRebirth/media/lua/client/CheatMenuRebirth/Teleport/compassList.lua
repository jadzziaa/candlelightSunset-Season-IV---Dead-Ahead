compassList = ISPanel:derive("compassList")

function compassList:initialise()
	ISPanel.initialise(self)
end

function compassList:createChildren()
	self:addScrollBars(self.horizontal)
	self:setScrollWithParent(false)
	self:setScrollChildren(true)
end

function compassList:prerender()
	self:setStencilRect(0,0,self.width, self.height);
	if self.background then
		self:drawRectStatic(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	end
	if self.border then
		self:drawRectBorderStatic(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
	end
end

function compassList:render()
	self:clearStencilRect()
end

function compassList:populate(category, srchString)

	local locations = compassCore.locations
	local i = 0
	local h = math.floor(self.height / 16)
	
	for x = 1,#locations[category]["pois"] do
		local v = locations[category]["pois"][x]
		if not srchString or ( srchString and string.find(string.lower(v["name"]), string.lower(srchString)) ~= nil ) then
			local y = i > 0 and h * i or 0
			local newPOI = compassPOI:new(2,i > 0 and y or 0, self.width - 16, h,v, category == "Custom" and x or false) --(self.contPanel.height / 3) * #self.items,
			i = i + 1
			newPOI:initialise()
			self:addChild(newPOI)
		end
	end
    self:setYScroll(0)
	local listH = i > 0 and h * i or 0
	--self:setScrollHeight((i - 1) * (self.height / 8))
	self:setScrollHeight(listH > self.height and listH or self.height + 1)
	--]]
	
end

function compassList:onMouseWheel(dir)
    local h = math.floor(self.height / 16)
	dir = dir * -1 -- invert scroll direction, for some reason down is +1 and up is -1
    dir = h * dir
    --dir = (self:getScrollHeight() / 50) * dir
	dir = self:getYScroll() + dir
	self:setYScroll(dir)
    return true
end

function compassList:new(x, y, width, height)
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
	o.horizontal = false
	self.backgroundColor = {r=0.1,g=0.1,b=0.1,a=0.8}
	self.borderColor = {r=0.4,g=0.4,b=0.4,a=1}
	return o;
end
