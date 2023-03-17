require "ISUI/ISUIElement"

P4WeightIndicator = ISUIElement:derive("P4WeightIndicator")

function P4WeightIndicator:initialise()
	ISUIElement.initialise(self)
	self:setVisible(false)
	self.javaObject:setWantKeyEvents(false)
	self.javaObject:setConsumeMouseEvents(false)
	self:addToUIManager()
end

function P4WeightIndicator:render()
	if self.core:getOptionClockSize() == 1 then
		-- Small
		local x = self.core:getScreenWidth() - 42
		local y = 13
		self:drawRect(x, y + 8, 10, 4, 1.0, 0.0, 0.0, 0.0) -- overwrite am
		self:drawRect(x, y + 13, 10, 4, 1.0, 0.0, 0.0, 0.0) -- overwrite pm
		self:drawTextureScaled(self.wTexture, x + 10, y, self.wTextureSW, self.wTextureSH, 1.0)
		if self.sTexture then
			self:drawTextureScaled(self.sTexture, x, y + 12, self.sTextureSW, self.sTextureSH, 1.0)
		end
		if self.hTexture then
			self:drawTextureScaled(self.hTexture, x, y, self.hTextureSW, self.hTextureSH, 1.0)
		end
		self:drawTextureScaled(self.dTexture1, x, y + 3, self.dTexture1SW, self.dTexture1SH, self.color.a, self.color.r, self.color.g, self.color.b)
		self:drawTextureScaled(self.dTexture2, x + 5, y + 3, self.dTexture2SW, self.dTexture2SH, self.color.a, self.color.r, self.color.g, self.color.b)
		self:drawTextureScaled(self.tTexture, x - 2, y - 1, self.tTextureSW, self.tTextureSH, self.color.a, self.color.r, self.color.g, self.color.b)
	else
		-- Large
		local x = self.core:getScreenWidth() - 68
		local y = 13
		self:drawRect(x - 3, y + 16, 20, 8, 1.0, 0.0, 0.0, 0.0) -- overwrite am
		self:drawRect(x - 3, y + 26, 20, 8, 1.0, 0.0, 0.0, 0.0) -- overwrite pm
		self:drawTexture(self.wTexture, x + 21, y, 1.0)
		if self.sTexture then
			self:drawTexture(self.sTexture, x - 5, y + 24, 1.0)
		end
		if self.hTexture then
			self:drawTexture(self.hTexture, x, y, 1.0)
		end
		self:drawTexture(self.dTexture1, x, y + 8, self.color.a, self.color.r, self.color.g, self.color.b)
		self:drawTexture(self.dTexture2, x + 11, y + 8, self.color.a, self.color.r, self.color.g, self.color.b)
		self:drawTexture(self.tTexture, x - 6, y - 1, self.color.a, self.color.r, self.color.g, self.color.b)
	end
end

function P4WeightIndicator:new(player, x, y,width, height, title)
	local o = {}
	o = ISUIElement:new(x, y, width, height)
	setmetatable(o, self)
	o.core = getCore()
	o.player = player
	o.playerIndex = player:getPlayerNum()
	o.color = { r = 100 / 255, g = 200 / 255, b = 210 / 255, a = 255 / 255 }
	o.textureD00 = getTexture("media/textures/P4AddictedToWeight_D00.png")
	o.textureD01 = getTexture("media/textures/P4AddictedToWeight_D01.png")
	o.textureD02 = getTexture("media/textures/P4AddictedToWeight_D02.png")
	o.textureD03 = getTexture("media/textures/P4AddictedToWeight_D03.png")
	o.textureD04 = getTexture("media/textures/P4AddictedToWeight_D04.png")
	o.textureD05 = getTexture("media/textures/P4AddictedToWeight_D05.png")
	o.textureD06 = getTexture("media/textures/P4AddictedToWeight_D06.png")
	o.textureD07 = getTexture("media/textures/P4AddictedToWeight_D07.png")
	o.textureD08 = getTexture("media/textures/P4AddictedToWeight_D08.png")
	o.textureD08 = getTexture("media/textures/P4AddictedToWeight_D08.png")
	o.textureD09 = getTexture("media/textures/P4AddictedToWeight_D09.png")
	o.textureD0E = getTexture("media/textures/P4AddictedToWeight_D0E.png")
	o.textureW00 = getTexture("media/textures/P4AddictedToWeight_W00.png")
	o.textureW01 = getTexture("media/textures/P4AddictedToWeight_W01.png")
	o.textureW02 = getTexture("media/textures/P4AddictedToWeight_W02.png")
	o.textureW03 = getTexture("media/textures/P4AddictedToWeight_W03.png")
	o.textureW04 = getTexture("media/textures/P4AddictedToWeight_W04.png")
	o.textureW05 = getTexture("media/textures/P4AddictedToWeight_W05.png")
	o.textureW06 = getTexture("media/textures/P4AddictedToWeight_W06.png")
	o.textureW07 = getTexture("media/textures/P4AddictedToWeight_W07.png")
	o.textureW08 = getTexture("media/textures/P4AddictedToWeight_W08.png")
	o.textureW08 = getTexture("media/textures/P4AddictedToWeight_W08.png")
	o.textureW09 = getTexture("media/textures/P4AddictedToWeight_W09.png")
	o.textureW10 = getTexture("media/textures/P4AddictedToWeight_W10.png")
	o.textureHI = getTexture("media/textures/P4AddictedToWeight_HI.png")
	o.textureSL = getTexture("media/textures/P4AddictedToWeight_SL.png")
	o.textureSI = getTexture("media/textures/P4AddictedToWeight_SI.png")
	o.textureSD = getTexture("media/textures/P4AddictedToWeight_SD.png")
	o.textureTD = getTexture("media/textures/P4AddictedToWeight_TD.png")
	o.textureTN = getTexture("media/textures/P4AddictedToWeight_TN.png")
	o.dTexture1 = o.textureD00
	o.dTexture2 = o.textureD00
	o.wTexture = o.textureW00
	o.hTexture = o.textureHI
	o.sTexture = nil
	o.tTexture = o.textureTD
	o.dTexture1SW = o.textureD00:getWidth() / 2
	o.dTexture1SH = o.textureD00:getHeight() / 2
	o.dTexture2SW = o.textureD00:getWidth() / 2
	o.dTexture2SH = o.textureD00:getHeight() / 2
	o.wTextureSW = o.textureW00:getWidth() / 2
	o.wTextureSH = o.textureW00:getHeight() / 2
	o.hTextureSW = o.textureHI:getWidth() / 2
	o.hTextureSH = o.textureHI:getHeight() / 2
	o.sTextureSW = o.textureSI:getWidth() / 2
	o.sTextureSH = o.textureSI:getHeight() / 2
	o.tTextureSW = o.textureTD:getWidth() / 2
	o.tTextureSH = o.textureTD:getHeight() / 2
	return o
end

function P4WeightIndicator:setDigit1(digit)
	if digit == 0 then
		self.dTexture1 = self.textureD00
	elseif digit == 1 then
		self.dTexture1 = self.textureD01
	elseif digit == 2 then
		self.dTexture1 = self.textureD02
	elseif digit == 3 then
		self.dTexture1 = self.textureD03
	elseif digit == 4 then
		self.dTexture1 = self.textureD04
	elseif digit == 5 then
		self.dTexture1 = self.textureD05
	elseif digit == 6 then
		self.dTexture1 = self.textureD06
	elseif digit == 7 then
		self.dTexture1 = self.textureD07
	elseif digit == 8 then
		self.dTexture1 = self.textureD08
	elseif digit == 9 then
		self.dTexture1 = self.textureD09
	else
		self.dTexture1 = self.textureD0E
	end
end

function P4WeightIndicator:setDigit2(digit)
	if digit == 0 then
		self.dTexture2 = self.textureD00
	elseif digit == 1 then
		self.dTexture2 = self.textureD01
	elseif digit == 2 then
		self.dTexture2 = self.textureD02
	elseif digit == 3 then
		self.dTexture2 = self.textureD03
	elseif digit == 4 then
		self.dTexture2 = self.textureD04
	elseif digit == 5 then
		self.dTexture2 = self.textureD05
	elseif digit == 6 then
		self.dTexture2 = self.textureD06
	elseif digit == 7 then
		self.dTexture2 = self.textureD07
	elseif digit == 8 then
		self.dTexture2 = self.textureD08
	elseif digit == 9 then
		self.dTexture2 = self.textureD09
	else
		self.dTexture2 = self.textureD0E
	end
end

function P4WeightIndicator:setWTexture(weight)
	if weight == 0 then
		self.wTexture = self.textureW00
	elseif weight == 1 then
		self.wTexture = self.textureW01
	elseif weight == 2 then
		self.wTexture = self.textureW02
	elseif weight == 3 then
		self.wTexture = self.textureW03
	elseif weight == 4 then
		self.wTexture = self.textureW04
	elseif weight == 5 then
		self.wTexture = self.textureW05
	elseif weight == 6 then
		self.wTexture = self.textureW06
	elseif weight == 7 then
		self.wTexture = self.textureW07
	elseif weight == 8 then
		self.wTexture = self.textureW08
	elseif weight == 9 then
		self.wTexture = self.textureW09
	else
		self.wTexture = self.textureW10
	end
end

function P4WeightIndicator:setSTexture(status)
	if status == "l" then
		self.sTexture = self.textureSL
	elseif status == "i" then
		self.sTexture = self.textureSI
	elseif status == "d" then
		self.sTexture = self.textureSD
	else
		self.sTexture = nil
	end
end

function P4WeightIndicator:setTTexture()
	local hour = getGameTime():getHour()
	if 6 <= hour and hour < 18 then
		self.tTexture = self.textureTD
	else
		self.tTexture = self.textureTN
	end
end

function P4WeightIndicator:setHTexture(value)
	if value then
		self.hTexture = self.textureHI
	else
		self.hTexture = nil
	end
end

function P4WeightIndicator:setEnabled(value)
	self.enabled = value
end

function P4WeightIndicator:onMouseMove(d)
	return false
end

function P4WeightIndicator:onMouseUp(d)
	return false
end

function P4WeightIndicator:onRightMouseUp(d)
	return false
end

function P4WeightIndicator:onMouseDown(d)
	return false
end

function P4WeightIndicator:onRightMouseDown(d)
	return false
end

function P4WeightIndicator:onRightMouseDownOutside(d)
	return false
end

function P4WeightIndicator:onRightMouseUpOutside(d)
	return false
end
