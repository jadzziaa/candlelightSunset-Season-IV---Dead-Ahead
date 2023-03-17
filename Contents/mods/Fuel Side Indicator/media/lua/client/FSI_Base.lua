-- made by photoshoplol#5731


local iconLeft = getTexture("media/ui/ArrowLeft.png")
local iconRight = getTexture("media/ui/ArrowRight.png")


ISVehicleDashboard._createChildren = ISVehicleDashboard.createChildren;
function ISVehicleDashboard:createChildren()
    local ret = self:_createChildren()
  
    self.gasLeftTex = ISImage:new(0,0, iconLeft:getWidthOrig(), iconLeft:getHeightOrig(), iconLeft);
	self.gasLeftTex:initialise();
	self.gasLeftTex:instantiate();
	self.gasLeftTex.onclick = ISVehicleDashboard.noActionOnClick;
	self.gasLeftTex.target = self;
	self:addChild(self.gasLeftTex);

    self.gasRightTex = ISImage:new(0,0, iconRight:getWidthOrig(), iconRight:getHeightOrig(), iconRight);
	self.gasRightTex:initialise();
	self.gasRightTex:instantiate();
	self.gasRightTex.onclick = ISVehicleDashboard.noActionOnClick;
	self.gasRightTex.target = self;
	self:addChild(self.gasRightTex);

    return ret
end

ISVehicleDashboard._setVehicle = ISVehicleDashboard.setVehicle
function ISVehicleDashboard:setVehicle(vehicle)
    local ret = self:_setVehicle(vehicle)

    if not vehicle then
		self:removeFromUIManager()
		return
	end

    if vehicle then
        local fuelX = (self.backgroundTex:getWidth()/2)
        local fuelY = (self.fuelGauge:getCentreY() + 30)

        self.gasRightTex:setX(fuelX + 10)
        self.gasRightTex:setY(fuelY)

        self.gasLeftTex:setX(fuelX - 20)
        self.gasLeftTex:setY(fuelY)

        -- jank but this is the best thing i could think of since there is no BaseVehicle param for gas tank side
        -- this may break if the car doesn't have a left & right rear tire. shit. -- TODO: FIXTHIS -- DONE & FIXED!
        local gasArea = vehicle:getAreaCenter("GasTank")
        local leftTire, rightTire
        if vehicle:getAreaCenter("TireRearLeft") then leftTire = vehicle:getAreaCenter("TireRearLeft") else leftTire = vehicle:getAreaCenter("TireFrontLeft") end
        if vehicle:getAreaCenter("TireRearRight") then rightTire = vehicle:getAreaCenter("TireRearRight") else rightTire = vehicle:getAreaCenter("TireFrontRight") end

        if (gasArea and leftTire and rightTire) then 

            local gasLeft = gasArea:distanceTo(vehicle:getAreaCenter("TireRearLeft"))
            local gasRight = gasArea:distanceTo(vehicle:getAreaCenter("TireRearRight"))

            if gasLeft > gasRight then
                self.gasRightTex:setVisible(true)
                self.gasLeftTex:setVisible(false)
            elseif gasLeft < gasRight then
                self.gasRightTex:setVisible(false)
                self.gasLeftTex:setVisible(true)
            end

        else
            self.gasRightTex:setVisible(false)
            self.gasLeftTex:setVisible(false)
        end

    end

    return ret
end

function ISVehicleDashboard:noActionOnClick(d)
    return false
end