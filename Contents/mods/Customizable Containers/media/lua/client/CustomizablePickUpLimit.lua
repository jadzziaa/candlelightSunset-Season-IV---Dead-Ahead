

function CustomizablePickUpLimit()
    if SandboxVars.CustomizablePickUp.Limit == true then

        require 'ISUI/ISInventoryPaneContextMenu'
        require 'TimedActions/ISInventoryTransferAction'

        local WornBy = {}
        local modId = "CustomizableBackpacks"
        local WearItem = ISInventoryPaneContextMenu.wearItem
        local IsValid = ISInventoryTransferAction.isValid
        local TransferAction = ISInventoryTransferAction.new


        ISInventoryPaneContextMenu.wearItem = function(item, player, ...)
            local playerObj = getSpecificPlayer(player)
            local inventory = playerObj:getInventory()

            WornBy[playerObj:getID()] = ((inventory:getCapacityWeight() - inventory:getCapacityWeight() + item:getEquippedWeight() - item:getEquippedWeight()) <= inventory:getCapacity())

            return WearItem(item, player, ...)
        end


        function ISInventoryTransferAction:isValid(...)
            if self[modId]["items"] == true then
                local metatable = getmetatable(self.destContainer)
                local iHasRoomFor = metatable.__index.hasRoomFor

                metatable.__index.hasRoomFor = function(destContainer, character, item, ...)

                    return true
                end

                local transfer = IsValid(self, ...)

                metatable.__index.hasRoomFor = iHasRoomFor

                return transfer
            else
                return IsValid(self, ...)
            end
        end


        function ISInventoryTransferAction:new(character, item, srcContainer, destContainer, time, ...)
            local player = character:getID()

            self[modId] = {["items"] = WornBy[player]}

            WornBy[player] = nil

            return TransferAction(self, character, item, srcContainer, destContainer, time, ...)
        end
    elseif SandboxVars.CustomizablePickUp.Limit == false then
        return end
end


Events.OnLoad.Add(CustomizablePickUpLimit)