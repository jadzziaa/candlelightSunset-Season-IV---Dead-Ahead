--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISPaintBus = ISBaseTimedAction:derive("ISPaintBus")

function ISPaintBus:isValid()
	return self.vehicle:isInArea(self.area, self.character)
end

function ISPaintBus:waitToStart()
	self.character:faceThisObject(self.vehicle)
	return self.character:shouldBeTurning()
end

function ISPaintBus:update()
	
end

function ISPaintBus:start()
	self:setActionAnim(CharacterActionAnims.Paint)
    self:setOverrideHandModels("PaintBrush", nil)
end

function ISPaintBus:stop()
	ISBaseTimedAction.stop(self)
end

function ISPaintBus:perform()
	self.vehicle:setSkinIndex(self.skinIndex)
    sendClientCommand(self.character, 'commonlib', 'updatePaintVehicle', {vehicle = self.vehicle:getId(),})
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISPaintBus:new(character, vehicle, area, skinIndex)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = vehicle
	o.area = area
	o.skinIndex = skinIndex
	o.maxTime = 200
	return o
end

