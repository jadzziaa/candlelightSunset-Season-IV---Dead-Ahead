--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************
RepairRoadCursor = ISBuildingObject:derive("RepairRoadCursor")

local function predicateNotBroken(item)
    return not item:isBroken()
end

local function doRepairRoadMenu(player, square)
    local inventory = player:getInventory()
    if luautils.walkAdj(player, square) then
        local item = inventory:getFirstTypeRecurse("HandShovel");
        local concrete = inventory:getFirstTypeRecurse("BucketConcreteFull");
        ISWorldObjectContextMenu.transferIfNeeded(player, item)
        ISWorldObjectContextMenu.transferIfNeeded(player, concrete)
        luautils.equipItems(player, item)
        ISTimedActionQueue.add(RepairRoadAction:new(player, square, 150));
    end
end

function RepairRoadCursor:create(x, y, z, north, sprite)
    local square = getWorld():getCell():getGridSquare(x, y, z)
    doRepairRoadMenu(self.character, square)
end

function RepairRoadCursor:isValid(square)
    local inventory = self.character:getInventory()
    
    for i = 0, square:getObjects():size() - 1 do
        local object = square:getObjects():get(i);
        local attached = object:getAttachedAnimSprite()
        if attached then
            for n = 1, attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and
                    (luautils.stringStarts(sprite:getParentSprite():getName(), "d_streetcrack") or
                    luautils.stringStarts(sprite:getParentSprite():getName(), "floors_overlay_street")) then
                    return inventory:contains("BucketConcreteFull") and (inventory:contains("HandShovel"));
                end
            end
        end
    end
    
    return false
end

function RepairRoadCursor:render(x, y, z, square)
    if not RepairRoadCursor.floorSprite then
        RepairRoadCursor.floorSprite = IsoSprite.new()
        RepairRoadCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
    end
    local r, g, b, a = 0.0, 1.0, 0.0, 0.8
    if self:isValid(square) == false then
        r = 1.0
        g = 0.0
    end
    RepairRoadCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
end

function RepairRoadCursor:new(sprite, northSprite, character)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o:init()
    o:setSprite(sprite)
    o:setNorthSprite(northSprite)
    o.character = character
    o.player = character:getPlayerNum()
    o.noNeedHammer = true
    o.skipBuildAction = true
    return o
end
