local P4AddictedToWeight = {}
local self = P4AddictedToWeight
self.player = nil
self.clock = nil
self.isDisplayed = false
self.currentWeight = nil
self.currentStatus = nil
self.indicator = nil

-- *****************************************************************************
-- * Options
-- *****************************************************************************

self.options = {
	showHumanIcon = true,
	weightChangeNotification = false,
}

SetModOptions = function(options)
	self.options = options
end

ReflectModOptions = function()
	self.indicator:setHTexture(self.options.showHumanIcon)
end

-- *****************************************************************************
-- * Event trigger functions
-- *****************************************************************************

self.OnLoad = function()
	ReflectModOptions()
end
Events.OnLoad.Add(self.OnLoad)

self.OnCreatePlayer = function(index, player)
	self.player = player
	self.clock = UIManager.getClock()
	self.indicator = P4WeightIndicator:new(player, 0, 0, 0, 0, "P4WeightIndicator")
	self.indicator:initialise()
end
Events.OnCreatePlayer.Add(self.OnCreatePlayer)

self.OnPlayerUpdate = function(player)
	if self.player ~= player then
		-- This function is called not necessarily just own updates.
		return
	end
	if self.clock and self.clock:isDateVisible() then
		if not self.isDisplayed then
			self.setDisplayOn()
		end
	else
		if self.isDisplayed then
			self.setDisplayOff()
		end
	end
	if self.isDisplayed then
		local nutrition = player:getNutrition()
		local weight = math.floor(nutrition:getWeight() * 10) / 10
		if self.currentWeight ~= weight then
			if self.currentWeight and self.options.weightChangeNotification then
				if self.currentWeight < weight then
					getSoundManager():playUISound("P4AddictedToWeight_up")
				else
					getSoundManager():playUISound("P4AddictedToWeight_down")
				end
			end
			self.currentWeight = weight
			local digit0 = math.floor(weight / 100)
			local digit1 = math.floor(weight / 10)
			local digit2 = math.floor(weight) - (digit1 * 10)
			local digit3 = math.floor(weight * 10) - (math.floor(weight) * 10)
			self.indicator:setDigit1(digit1 - (digit0 * 10))
			self.indicator:setDigit2(digit2)
			self.indicator:setWTexture(digit3)
		end
		local status = "n"
		if nutrition:isIncWeightLot() then
			status = "l"
		elseif nutrition:isIncWeight() then
			status = "i"
		elseif nutrition:isDecWeight() then
			status = "d"
		end
		if self.currentStatus ~= status then
			self.currentStatus = status
			self.indicator:setSTexture(status)
		end
	end
end
Events.OnPlayerUpdate.Add(self.OnPlayerUpdate)

self.OnPlayerDeath = function(player)
	self.setDisplayOff()
end
Events.OnPlayerDeath.Add(self.OnPlayerDeath)

self.EveryHours = function()
	if self.isDisplayed then
		self.indicator:setTTexture()
	end
end
Events.EveryHours.Add(self.EveryHours)

-- *****************************************************************************
-- * AddictedToWeight functions
-- *****************************************************************************

self.setDisplayOn = function()
	self.isDisplayed = true
	self.indicator:setTTexture()
	self.indicator:setVisible(true)
end

self.setDisplayOff = function()
	self.isDisplayed = false
	self.indicator:setVisible(false)
end
