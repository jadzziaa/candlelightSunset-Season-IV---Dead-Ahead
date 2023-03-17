local BodyLocationsGetGroupCallLog
--[[
local function applyPatchOverride()
    local class, methodName = zombie.characters.WornItems.BodyLocations.class, "getGroup"
    local createPatch = function(original_fn)
        return function(self,...)

            local coroutine = getCurrentCoroutine()
            local count = getCallframeTop(coroutine)
            local printText
            for i= count - 1, 0, -1 do
                local o = getCoroutineCallframeStack(coroutine,i)
                if o ~= nil then
                    local s = KahluaUtil.rawTostring2(o)
                    if s then
                        printText = s
                        --local modFile = s:match(".* -- file: (.*)")
                        --if modFile then
                        --    printText = modFile
                        --end
                    end
                end
            end
            if printText then BodyLocationsGetGroupCallLog = (BodyLocationsGetGroupCallLog or "").." "..printText.."\n" end

            return original_fn(self,...)
        end
    end
    local metatable = __classmetatables[class]
    local metatable__index = metatable.__index
    local originalMethod = metatable__index[methodName]
    metatable__index[methodName] = createPatch(originalMethod)
end
applyPatchOverride()
--]]

require "ISUI/ISToolTipInv"
require "NPCs/BodyLocations"

local BLGroup = BodyLocations.getGroup("Human")
local ISToolTipInv_prerender = ISToolTipInv.prerender
function ISToolTipInv:prerender()

    ---@type InventoryItem
    local item = self.item
    local bodyLoc = item:getBodyLocation()
    if bodyLoc and bodyLoc~="" and not BLGroup:getLocation(bodyLoc) then
        print("ERROR: tooltipUnbreaker: invalid/missing bodyLocation needed to be created: "..bodyLoc)
        print("WARN: item triggering the catch was:"..item:getFullType().." this item may not be related. Look for mods that add/change BodyLocations.")
        if BodyLocationsGetGroupCallLog then
            print("WARN: BodyLocations.getGroup called: If errors are occurring the mod author should use (require \"NPCs/BodyLocations\"):\n"..BodyLocationsGetGroupCallLog)
        end
        BLGroup:getOrCreateLocation(bodyLoc)
    end

    ISToolTipInv_prerender(self)
end