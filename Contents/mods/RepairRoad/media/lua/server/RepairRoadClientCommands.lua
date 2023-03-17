require('luautils');

local function onRepairRoadCommand(module, command, player, args)
    if module == 'RepairRoad' then
        if command == 'RepairRoadCommand' then
            local sq = getCell():getGridSquare(args.x, args.y, args.z)
            
            if not sq then return end
            
            for i = 0, sq:getObjects():size() - 1 do
                local object = sq:getObjects():get(i);
                local attached = object:getAttachedAnimSprite()
                if attached then
                    for n = attached:size(), 1, -1 do
                        local sprite = attached:get(n - 1)
                        if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and
                            (luautils.stringStarts(sprite:getParentSprite():getName(), "d_streetcrack") or
                            luautils.stringStarts(sprite:getParentSprite():getName(), "floors_overlay_street")) then
                            object:RemoveAttachedAnim(n - 1)
                            object:transmitUpdatedSpriteToClients()
                        end
                    end
                end
            end
        end
    end
end

Events.OnClientCommand.Add(onRepairRoadCommand)
