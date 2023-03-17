local itrk  = require "cl_itrk"
local utils = require "cl_itrk_utils"
itrk.ad     = {}
local iad   = itrk.ad
iad.invs    = {}
local checkType = utils.checkType
local ItemTypes = utils.Types

function iad:isValid(player)
    return player and not player:isDead()
end

function iad:get(charID)
    if charID == nil then return {} end

    self.invs[charID] = self.invs[charID] or {}
    return self.invs[charID]
end

function iad:reset(charID, alternative)
    if charID == nil then return end
    if not self.invs then return end
    self.invs[charID] = self.invs[charID] or {}

    if alternative then
        self.invs[charID] = {}
    else
        table.wipe(self.invs[charID])
    end
end

function iad:remember(charID, container, optionValues)
    if not container then return end
    local items = container.getItems and container:getItems() or nil
    if not items then return end
    local cache = self:get(charID)
    local len = items.size and items:size() or 0

    for i = 1, len do
        local item = items:get(i - 1)

        if checkType(item, ItemTypes.Bag) and item:isEquipped() then
            self:remember(charID, item:getInventory(), optionValues)
        else
            local ft = item.getFullType and item:getFullType() or item:getType()
            if (optionValues.itrk_EnableTrackDuplicateWeapons and checkType(item, ItemTypes.Weapon)) or
                (optionValues.itrk_EnableTrackDuplicateClothings and checkType(item, ItemTypes.Clothing)) then
                local srcTarget = cache[ft]

                if srcTarget then
                    if srcTarget:getCondition() < item:getCondition() then
                        self:get(charID)[ft] = item
                    end
                else
                    self:get(charID)[ft] = item
                end
            else
                self:get(charID)[ft] = item
            end
        end
    end
end

function iad:rememberInventory(player, optionValues)
    if not self:isValid(player) then return end
    local charID = player:getPlayerNum()
    self:reset(charID)
    self:remember(charID, player:getInventory(), optionValues)
end

function iad:findDuplicate(player, item)
    if not self:isValid(player) then return end
    local ft = item:getFullType()
    return self:get(player:getPlayerNum())[ft]
end

return iad
