require('luautils');

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function onRemoveDebrisMenu(worldobjects, square, player)
	local bo = RemoveDebrisCursor:new("", "", player)
	getCell():setDrag(bo, player:getPlayerNum())
end

local function addRemoveDebrisMenu(player, context, worldobjects)
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
            		if object:getTextureName() and luautils.stringStarts(object:getTextureName(), "d_generic_1") then
                		target = object;
            		else
                		local attached = object:getAttachedAnimSprite()
                		if attached then
                    			for n=1,attached:size() do
                        		local sprite = attached:get(n-1)
                        			if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
                            				luautils.stringStarts(sprite:getParentSprite():getName(), "d_generic_1") then
                            				target = sprite
                            			break;
                        			end
                    			end
                		end
            		end
        	end
	end

    if not target then return end
    
    if not inventory:containsTypeRecurse("HandShovel") then return end

    context:addOption(getText('ContextMenu_RemoveDebris'), worldobjects, onRemoveDebrisMenu, square, player);
end

-- ------------------------------------------------
-- Game hooks
-- ------------------------------------------------
Events.OnFillWorldObjectContextMenu.Add(addRemoveDebrisMenu);
