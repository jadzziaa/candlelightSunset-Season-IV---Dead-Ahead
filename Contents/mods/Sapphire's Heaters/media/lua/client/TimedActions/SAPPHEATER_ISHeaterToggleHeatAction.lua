require "HeaterSettings"

require "TimedActions/ISBaseTimedAction"

ISHeaterToggleHeatAction = ISBaseTimedAction:derive("ISHeaterToggleHeatAction");

function ISHeaterToggleHeatAction:isValid()
	return true
end

function ISHeaterToggleHeatAction:update()
end

function ISHeaterToggleHeatAction:start()
	self.character:faceThisObject(self.object)

	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
end

function ISHeaterToggleHeatAction:stop()
	ISBaseTimedAction.stop(self)
end

function ISHeaterToggleHeatAction:perform()

	local sq = self.object:getSquare()
	if not sq then return end
	sq:playSound("LightSwitch") -- change this to update the sound it plays on toggling

	local invItem = self.object:getItem()
	local heaters = ModData.getOrCreate("SAPPHEATER")
	local args = heaters[invItem:getID()]

	--print(sq:haveElectricity())
	--print(invItem:getType())
	--print(args)

	if args then
		if args.state == "On" then
			sendClientCommand(self.character, 'heater', 'turnOff', args)
		else
			if invItem:getType() == ElectricHeaterObject.itemType then
				if sq:haveElectricity() then
					sendClientCommand(self.character, 'heater', 'turnOn', args)
				else
					getPlayer():Say("I should probably have a generator nearby to power it.")
				end
			else
				sendClientCommand(self.character, 'heater', 'turnOn', args)
			end
		end
	end

	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISHeaterToggleHeatAction:new(character, object)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.stopOnWalk = false
	o.stopOnRun = false
	o.maxTime = 0
	-- custom fields
	o.object = object
	return o
end


--if args then
--	if args.state == "On" then
--		sendClientCommand(self.character, 'heater', 'turnOff', args)
--	else
--		sendClientCommand(self.character, 'heater', 'turnOn', args)
--	end
--end