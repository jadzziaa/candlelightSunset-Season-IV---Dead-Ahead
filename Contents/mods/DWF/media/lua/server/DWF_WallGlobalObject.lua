if isClient() then return end

DWF_WallGlobalObject = SGlobalObject:derive("DWS_WallGlobalObject")


function DWF_WallGlobalObject:new(luaSystem, globalObject)
    local o = SGlobalObject.new(self, luaSystem, globalObject)
    return o
end

function DWF_WallGlobalObject.SpawnDestroyItems(trapType, square, object)
    -- if square then
    --     local item = "Base.UnusableWood";

    --     --traptype might be nil, in that case check isoobject
    --     if (not trapType) and object and object:hasModData() then
    --         trapType = object:getModData()["trapType"];
    --     end

    --     if trapType then
    --         for i,v in ipairs(Traps) do
    --             if v.type == trapType and v.destroyItem then
    --                 item = v.destroyItem;
    --                 break;
    --             end
    --         end
    --     end

    --     if type(item)=="table" then
    --         for i,v in ipairs(item) do
    --             local spawnItem = square:AddWorldInventoryItem(v, ZombRand(0.1, 0.5), ZombRand(0.1, 0.5), 0);
    --             if v=="Base.Twine" then
    --                 spawnItem:setUsedDelta(spawnItem:getUseDelta());
    --             end
    --         end
    --     else
    --         local spawnItem = square:AddWorldInventoryItem(item, ZombRand(0.1, 0.5), ZombRand(0.1, 0.5), 0);
    --         if item=="Base.Twine" then
    --             spawnItem:setUsedDelta(spawnItem:getUseDelta());
    --         end
    --     end
    -- else
    --     print("no square for spawnDestroyItems");
    -- end
end
