require('luautils');

local function onFixFloorCommand(module, command, player, args)
    if module == 'FixFloor' then
        if command == 'FixFloorCommand' then
            local sq = getCell():getGridSquare(args.x, args.y, args.z)
        
            if not sq then return end
            
            for i=0,sq:getObjects():size()-1 do
                local object = sq:getObjects():get(i);
                
                if object then
                    local attached = object:getAttachedAnimSprite()
                    if attached then
                        for n = attached:size(), 1, -1 do
                            local sprite = attached:get(n-1)
                            if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
                                (luautils.stringStarts(sprite:getParentSprite():getName(), "floors_overlay_tiles") or
                                luautils.stringStarts(sprite:getParentSprite():getName(), "floors_overlay_wood")) then
                                object:RemoveAttachedAnim(n-1)
                                object:transmitUpdatedSpriteToClients()
                            end
                        end
                    end
                end
            end
        end
    end
end

Events.OnClientCommand.Add(onFixFloorCommand)