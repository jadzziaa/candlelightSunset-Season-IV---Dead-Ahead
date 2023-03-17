require('luautils');

local function predicateNotBroken(item)
    return not item:isBroken()
end

local function onRepairWallCrackMenu(worldobjects, square, player)
    local bo = RepairWallCrackCursor:new("", "", player)
    getCell():setDrag(bo, player:getPlayerNum())
end

local function addRepairWallCrackMenu(player, context, worldobjects)
    local player = getSpecificPlayer(player);
    local inventory = player:getInventory();
    local square;
    local animsprite;
    
    if player:getVehicle() then return end
    
    for i, v in ipairs(worldobjects) do
        square = v:getSquare();
    end
    
    if not square then return end
    
    for i = 0, square:getObjects():size() - 1 do
        local object = square:getObjects():get(i);
        local attached = object:getAttachedAnimSprite()
        if attached then
            for n = 1, attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and
                    (luautils.stringStarts(sprite:getParentSprite():getName(), "d_wallcrack")) then
                    animsprite = sprite
                    break;
                end
            end
        end
    end
    
    if not animsprite then return end
    
    if not inventory:containsTypeRecurse("BucketPlasterFull") then return end
    
    if not (inventory:containsTypeRecurse("HandShovel")) then return end
    
    context:addOption(getText('ContextMenu_RepairWallCrack'), worldobjects, onRepairWallCrackMenu, square, player);
end

-- ------------------------------------------------
-- Game hooks
-- ------------------------------------------------
Events.OnFillWorldObjectContextMenu.Add(addRepairWallCrackMenu);
