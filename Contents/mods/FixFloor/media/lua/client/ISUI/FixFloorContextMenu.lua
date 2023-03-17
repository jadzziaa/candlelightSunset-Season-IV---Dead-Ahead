require('luautils');

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function onFixFloorMenu(worldobjects, square, player)
	local bo = FixFloorCursor:new("", "", player)
	getCell():setDrag(bo, player:getPlayerNum())
end

local function addFixFloorMenu(player, context, worldobjects)
    local player = getSpecificPlayer(player);
    local inventory = player:getInventory();
    local square;
    local target;

    if player:getVehicle() then return end

    for i,v in ipairs(worldobjects) do
        square = v:getSquare();
    end
  
	if not square then return end
     
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
        
        if object then
            local attached = object:getAttachedAnimSprite()
            if attached then
                for n=1,attached:size() do
                    local sprite = attached:get(n-1)
                    if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
                        (luautils.stringStarts(sprite:getParentSprite():getName(), "floors_overlay_tiles") or
                        luautils.stringStarts(sprite:getParentSprite():getName(), "floors_overlay_wood")) then
                        target = sprite
                        break;
                    end
                end
            end
        end
	end

    if not target then return end

    if not inventory:containsTypeEvalRecurse("Hammer", predicateNotBroken) then return end
    
    if not player:HasTrait("Handy") and player:getPerkLevel(Perks.Woodwork) < 5 then return end

    context:addOption(getText('ContextMenu_FixFloor'), worldobjects, onFixFloorMenu, square, player);
end

-- ------------------------------------------------
-- Game hooks
-- ------------------------------------------------
Events.OnFillWorldObjectContextMenu.Add(addFixFloorMenu);
