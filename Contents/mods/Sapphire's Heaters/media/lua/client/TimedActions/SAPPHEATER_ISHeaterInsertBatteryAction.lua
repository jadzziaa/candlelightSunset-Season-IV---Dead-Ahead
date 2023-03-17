require "TimedActions/ISBaseTimedAction"

ISHeaterInsertBatteryAction = ISBaseTimedAction:derive("ISHeaterInsertBatteryAction");

function ISHeaterInsertBatteryAction:isValid()
    return true
end

function ISHeaterInsertBatteryAction:update()
end

function ISHeaterInsertBatteryAction:start()
    self.character:faceThisObject(self.object)

    self:setActionAnim("Loot")
    self.character:SetVariable("LootPosition", "Low")
end

function ISHeaterInsertBatteryAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISHeaterInsertBatteryAction:perform()
    self.item:setJobDelta(0.0);

    local sq = self.object:getSquare()
    if not sq then return end

    --local args = { id = self.item:getID(), battery = self.battery:getDelta(), x = sq:getX(), y = sq:getY(), z = sq:getZ() }
    --sendClientCommand(self.character, 'lantern', 'updateBattery', args)

    local heaters = ModData.getOrCreate("SAPPHEATER")
    local args = heaters[self.item:getID()]

    if args then
        args.battery =  self.battery:getDelta()

        sendClientCommand(self.character, 'heater', 'updateBattery', args)
        self.character:getInventory():Remove(self.battery)
    end

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISHeaterInsertBatteryAction:new(character, heater, battery)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = 0;
    -- custom fields
    o.object = heater
    o.item = heater:getItem()
    o.battery = battery
    return o;
end