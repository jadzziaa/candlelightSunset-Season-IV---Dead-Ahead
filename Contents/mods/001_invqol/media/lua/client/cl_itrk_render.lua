local itrk = require "cl_itrk"
itrk.rnd = {}
local irnd  = itrk.rnd

function irnd:updateInventoryRenderContext(inv)
end


-- Item Render Context Cache that Retains the value within Item Render Iteration
do
function irnd:cacheItemWeaponData(itemRenderContext, item)
    itemRenderContext.isRanged = item:isRanged()
    if not itemRenderContext.isRanged then return false end

    itemRenderContext.atScope = item:getScope()
    itemRenderContext.atClip = item:getClip()
    itemRenderContext.atSling = item:getSling()
    itemRenderContext.atStock = item:getStock()
    itemRenderContext.atRecPad = item:getRecoilpad()
    itemRenderContext.atCanon = item:getCanon()
    itemRenderContext.atAny = itemRenderContext.atScope or
        itemRenderContext.atClip or
        itemRenderContext.atSling or
        itemRenderContext.atStock or
        itemRenderContext.atRecPad or
        itemRenderContext.getCanon
    return itemRenderContext.atAny
end
end

function irnd:renderWeapon(item, isMain)
end

return irnd