require('luautils');

local function predicateNotBroken(item)
    return not item:isBroken()
end

local function onRepairRoadMenu(worldobjects, square, player)
    local bo = RepairRoadCursor:new("", "", player)
    getCell():setDrag(bo, player:getPlayerNum())
end

local function addRepairRoadMenu(player, context, worldobjects)
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
                    (luautils.stringStarts(sprite:getParentSprite():getName(), "d_streetcrack") or
                    luautils.stringStarts(sprite:getParentSprite():getName(), "floors_overlay_street")) then
                    animsprite = sprite
                    break;
                end
            end
        end
    end
    
    if not animsprite then return end
    
    if not inventory:containsTypeRecurse("BucketConcreteFull") then return end
    
    if not (inventory:containsTypeRecurse("HandShovel")) then return end
    
    context:addOption(getText('ContextMenu_RepairRoad'), worldobjects, onRepairRoadMenu, square, player);
end

-- ------------------------------------------------
-- Game hooks
-- ------------------------------------------------
Events.OnFillWorldObjectContextMenu.Add(addRepairRoadMenu);
