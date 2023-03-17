QNW_QNWL_CLuaNet = LuaNet:getInstance().getModule(QNWL_AConfig.id, QNWL_AConfig.debug)

local this       = QNW_QNWL_CLuaNet
local util       = QNW_QNWL_AUtil

this.addCommandHandler("syncServerItemModData", function(_player, _id, _x, _y, _z, _key, _data, _playerNum)
    if getPlayer():getPlayerNum() == _playerNum then
        return
    end

    local test   = function(_item)
        if _item:getID() == _id then
            _item:getModData()[_key] = _data
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

function QNW_QNWL_CLuaNet.syncClientItemModData(_item, _square, _key)
    if LuaNet:getInstance().isRunning() then
        this.send("syncClientItemModData", _item:getID(), _square:getX(), _square:getY(), _square:getZ(), _key, _item:getModData()[_key])
    end
end