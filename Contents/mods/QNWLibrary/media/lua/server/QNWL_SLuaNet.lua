QNW_QNWL_SLuaNet = LuaNet:getInstance().getModule(QNWL_AConfig.id, QNWL_AConfig.debug)

local this       = QNW_QNWL_SLuaNet
local util       = QNW_QNWL_AUtil

this.addCommandHandler("syncClientItemModData", function(_player, _id, _x, _y, _z, _key, _data)
    local test   = function(_item)
        if _item:getID() == _id then
            _item:getModData()[_key] = _data
            util.syncItemModData(_item, _key, _player)
        end
    end
    local square = getWorld():getCell():getGridSquare(_x, _y, _z)
    if square then
        local items = util.getInventoryItemBySquare(square)
        for _, v in pairs(items) do
            test(v)
        end
    end
end)

function QNW_QNWL_SLuaNet.syncServerItemModData(_item, _square, _key, _player)
    local playerNum = -1
    if _player then
        playerNum = _player:getPlayerNum()
    end
    if LuaNet:getInstance().isRunning() then
        this.send("syncServerItemModData", _item:getID(), _square:getX(), _square:getY(), _square:getZ(), _key, _item:getModData()[_key], playerNum)
    end
end