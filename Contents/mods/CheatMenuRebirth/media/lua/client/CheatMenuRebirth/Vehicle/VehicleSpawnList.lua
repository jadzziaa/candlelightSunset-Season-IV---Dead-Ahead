VehicleSpawnList = ISPanel:derive("VehicleSpawnList")

function VehicleSpawnList:initialise()
	ISPanel.initialise(self)
end

function VehicleSpawnList:createChildren()
	self:addScrollBars(self.horizontal)
	self:setScrollWithParent(false)
	self:setScrollChildren(true)
end

function VehicleSpawnList:prerender()
	self:setStencilRect(0,0,self.width, self.height);
	if self.background then
		self:drawRectStatic(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	end
	if self.border then
		self:drawRectBorderStatic(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
	end
end

function VehicleSpawnList:render()
	self:clearStencilRect()
end

function VehicleSpawnList:populate(category, srchString)

	--local v_types = VehicleSpawnCore.v_types
    
	local h = math.floor(self.height / 16)
    local i = 0
    local index = 1
    local x = 100
	for k,v in pairs(VehicleSpawnCore.v_types[category]["fullname"]) do

	local v_name = VehicleSpawnCore.v_types[category]["name"][k]
    local v_fullname = VehicleSpawnCore.v_types[category]["fullname"][k]
	local v_spawnname = VehicleSpawnCore.v_types[category]["spawnname"][k]
	if not srchString or ( srchString and string.find(string.lower(v_name), string.lower(srchString)) ~= nil ) then
		local y = i > 0 and h * i or 0
		if v_fullname ~= nil and v_spawnname ~= nil then
			local deploying = VehicleSpawnDeploy:new(2, i > 0 and y or 0, self.width - 16, h, v_fullname, v_spawnname, v_name, x)
			i = i + 1
			x = x + 1
			index = index + 1
			deploying:initialise()
			self:addChild(deploying)
		end
	end
	end
	self:setYScroll(0)

	local listH = i > 0 and h * i or 0
	--self:setScrollHeight((i - 1) * (self.height / 8))
	self:setScrollHeight(listH > self.height and listH or self.height + 1)
end

function VehicleSpawnList:onMouseWheel(dir)
	local h = math.floor(self.height / 16)
	dir = dir * -1 -- invert scroll direction, for some reason down is +1 and up is -1
	dir = h * dir
	dir = self:getYScroll() + dir
	self:setYScroll(dir)
    return true
end

function VehicleSpawnList:new(x, y, width, height)
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.x = x
	o.y = y
	o.width = width
	o.height = height
    o.setCapture = true
	o.horizontal = true
	self.backgroundColor = {r=0.1,g=0.1,b=0.1,a=0.8}
	self.borderColor = {r=0.4,g=0.4,b=0.4,a=1}
	return o;
end
