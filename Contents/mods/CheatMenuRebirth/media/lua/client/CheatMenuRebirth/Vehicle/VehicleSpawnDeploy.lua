VehicleSpawnDeploy = ISUIElement:derive("VehicleSpawnDeploy")
--VehicleSpawnDeploy.vehicle = nil

function VehicleSpawnDeploy:initialise()
	ISUIElement.initialise(self)
	self:makeChildren()
end

function VehicleSpawnDeploy:makeChildren()
	self.made = true

	self.createBtn = ISButton:new(self.width - (self.width / 4) - 1, 0, self.width / 4, self.height, getText("UI_CMRB_VehicleSpawner_Create"), self, function() self:createVehicleSpawn() end)
	self.createBtn.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.6};
	self.createBtn.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
	self.createBtn:initialise()
	self:addChild(self.createBtn)

end

function VehicleSpawnDeploy:createVehicleSpawn()
	local player = getPlayer();
	local x = player:getX()
	local y = player:getY()
	local z = player:getZ()
	local VehicleStatus = 0


	if isClient() then
		--There is no addVehicleDebug command in server command. If devs expanded it in the feature, I will try add it.
		--local command = string.format("/addVehicleDebug %s, %s, %d, (%d, %d, %d)", tostring(self.deploy1), tostring(player:getDir()), tonumber(VehicleStatus), x, y, z)
		local command = string.format("/addVehicle %s", tostring(self.deploy1))
		--print (tostring(command))
		SendCommandToServer(command)
		--SendCommandToServer(command:repair())
	else
		vehicle = addVehicleDebug(tostring(self.deploy1), player:getDir(), VehicleStatus, getCell():getGridSquare(x, y, z))
        if string.match(tostring(self.deploy2), "Smash") or string.match(tostring(self.deploy2), "Burnt") or string.match(tostring(self.deploy2), "wreck") then
            getPlayer():Say(getText("UI_CMRB_Message_VehicleKeyUnnecessary"))
            else
            vehicle:repair()
            if vehicle:getCurrentKey() ~= nil then 
                getPlayer():getInventory():AddItem(vehicle:getCurrentKey()) 
            else 
                getPlayer():getInventory():AddItem(vehicle:createVehicleKey()) 
            end
        end
	end

end


function VehicleSpawnDeploy:prerender()
	if self:checkIfVisible() then -- culling

		if not self.made then self:makeChildren() end -- recreates culled children when element is made visible again

		if self.background then
			self.fade:setFadeIn(self:isMouseOver() or false)
			self.fade:update()
			local f = 1 - self.fade:fraction()
			self:drawRectStatic(0, 0, self.width, self.height, self.backgroundColor.a * f, self.backgroundColor.r * f, self.backgroundColor.g * f, self.backgroundColor.b * f);
		end

		if self.border then
			self:drawRectBorderStatic(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
		end

		self:drawText(self.deploy, ( self.width / 10 ) , self.fontHgt/2, 1, 1, 1, 1, UIFont.Small)
        self:drawText("("..self.deploy1..")", ( self.width / 10 ) , (self.fontHgt / 2)+self.fontHgt, 0.5, 0.5, 0.5, 1, UIFont.Small)
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

function VehicleSpawnDeploy:checkIfVisible() 
	local y = self:getAbsoluteY()
	local sh = getCore():getScreenHeight()
	if y < (0 - sh) or y > sh then
		return false
	else
		return true
	end
end


function VehicleSpawnDeploy:new(x, y, width, height, deploy, deploy2, customID)
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
	o.moveWithMouse = true;
	o.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.6};
	o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
	o.deploy = deploy
	o.deploy1 = deploy1
	o.deploy1 = deploy2
	o.font = UIFont.Small
	o.fontHgt = getTextManager():getFontFromEnum(o.font):getLineHeight()
	o.fontWdth = function(str) return getTextManager():getFontFromEnum(o.font):getWidth(str) end
	o.fade = UITransition.new()
	o.backgroundColorMouseOver = {r=0.3, g=0.3, b=0.3, a=1.0}
	o.doFade = false
	o.customID = customID
	return o;
end