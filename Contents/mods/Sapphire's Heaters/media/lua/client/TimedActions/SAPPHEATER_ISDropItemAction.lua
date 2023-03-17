require "HeaterSettings"
require "TimedActions/ISGrabItemAction"
require "TimedActions/ISDropWorldItemAction"

local isGrabItemAction_transferItem = ISGrabItemAction.transferItem -- Original Behavior
function ISGrabItemAction:transferItem(item)

    local invItem = item:getItem()
    if invItem:getType() == SmallHeaterObject.itemType or invItem:getType() == OutdoorHeaterObject.itemType or invItem:getType() == ElectricHeaterObject.itemType then

        local sq = item:getSquare()
        if not sq then return end

        local heaters = ModData.getOrCreate("SAPPHEATER")
        local args = heaters[invItem:getID()]

        if args then
            invItem:setDelta(args.battery)
            sendClientCommand(self.character, 'heater', 'pickup', args)
        end
    end

    isGrabItemAction_transferItem(self, item) -- Call Original Behavior
end

local isDropWorldItemAction_perform = ISDropWorldItemAction.perform -- Original Behavior
function ISDropWorldItemAction:perform()
    isDropWorldItemAction_perform(self) -- Call Original Behavior

    if self.item:getType() == SmallHeaterObject.itemType or self.item:getType() == OutdoorHeaterObject.itemType or self.item:getType() == ElectricHeaterObject.itemType then
        local worldItem = self.item:getWorldItem()
        if worldItem then

            local sq = worldItem:getSquare()
            if not sq then return end

            local args = {x = sq:getX(), y = sq:getY(), z = sq:getZ(), itemType = self.item:getType(), id = self.item:getID(), battery = self.item:getDelta(), rate = self.item:getUseDelta(), state = "Off"}
            sendClientCommand(self.character, 'heater', 'placed', args)

        end
    end
end

local iSInventoryTransferAction_perform = ISInventoryTransferAction.perform
function ISInventoryTransferAction:perform()

    if self.item:getType() == SmallHeaterObject.itemType or self.item:getType() == OutdoorHeaterObject.itemType or self.item:getType() == ElectricHeaterObject.itemType then

        if self.srcContainer:getType() == "floor" then -- pickup

            local sq = self.item:getWorldItem():getSquare()
            if not sq then return end

            local heaters = ModData.getOrCreate("SAPPHEATER")
            local args = heaters[self.item:getID()]

            if args then
                self.item:setDelta(args.battery)
                sendClientCommand(self.character, 'heater', 'pickup', args)
            end

        else if self.destContainer:getType() == "floor" then -- Drop

            local sq = self.character:getSquare()
            if not sq then return end

            local args = {x = sq:getX(), y = sq:getY(), z = sq:getZ(), itemType = self.item:getType(), id = self.item:getID(), battery = self.item:getDelta(), rate = self.item:getUseDelta(), state = "Off"}
            sendClientCommand(self.character, 'heater', 'placed', args)
            end

        end

    end

    iSInventoryTransferAction_perform(self)
end