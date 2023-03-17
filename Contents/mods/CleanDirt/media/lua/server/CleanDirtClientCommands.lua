require('luautils');

local function onCleanDirtCommand(module, command, player, args)
    if module == 'CleanDirt' then
        if command == 'CleanDirtCommand' then
            local sq = getCell():getGridSquare(args.x, args.y, args.z)
        
            if not sq then return end
            
            for i=0,sq:getObjects():size()-1 do
                local object = sq:getObjects():get(i);
                
                if object then
                    if object:getTextureName() and luautils.stringStarts(object:getTextureName(), "overlay_graffiti") then
                        sq:RemoveTileObject(object);
                    else
                        local attached = object:getAttachedAnimSprite()
                        if attached then
                            for n = attached:size(), 1, -1 do
                                local sprite = attached:get(n-1)
                                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
                                    (luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
                                    luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti")) then
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
end

Events.OnClientCommand.Add(onCleanDirtCommand)