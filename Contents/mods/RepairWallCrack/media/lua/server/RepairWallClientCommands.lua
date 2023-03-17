require('luautils');

local function onRepairWallCrackCommand(module, command, player, args)
    if module == 'RepairWallCrack' then
        if command == 'RepairWallCrackCommand' then
            local sq = getCell():getGridSquare(args.x, args.y, args.z)
            
            if not sq then return end
            
            for i = 0, sq:getObjects():size() - 1 do
                local object = sq:getObjects():get(i);
                local attached = object:getAttachedAnimSprite()
                if attached then
                    for n = attached:size(), 1, -1 do
                        local sprite = attached:get(n - 1)
                        if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and
                            (luautils.stringStarts(sprite:getParentSprite():getName(), "d_wallcrack")) then
                            object:RemoveAttachedAnim(n - 1)
                            object:transmitUpdatedSpriteToClients()
                            if isClient() then object:transmitUpdatedSpriteToServer() end
                        end
                    end
                end
            end
        end
    end
end

Events.OnClientCommand.Add(onRepairWallCrackCommand)
