require "TimedActions/ISBaseTimedAction"

EmptyGasCanActionAnim = ISBaseTimedAction:derive("ISEmptyGasCan")

function EmptyGasCanActionAnim:isValid()
	return true
end

function EmptyGasCanActionAnim:update()
	self.item:setJobDelta(self:getJobDelta())
	self.item:setJobType(getText("ContextMenu_Pour_on_Ground"))
	self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function EmptyGasCanActionAnim:start()
	self.action:setTime(self.item:getUsedDelta() * 300)
	self:setActionAnim("refuelgascan")
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self.sound = self.character:playSound("VehicleAddFuelFromCanister")
end

function EmptyGasCanActionAnim:stop()
	self.character:stopOrTriggerSound(self.sound)
	self.item:setJobDelta(0)
	ISBaseTimedAction.stop(self);
end

function EmptyGasCanActionAnim:perform()
	self.character:stopOrTriggerSound(self.sound)
	self.item:setJobDelta(0)
	self.item:setUsedDelta(0)
	if self.item:getUsedDelta() <= 0 then
		self.item:Use()
	end
	ISBaseTimedAction.perform(self)
end

function EmptyGasCanActionAnim:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.item = item
	o.maxTime = time
	return o
end




