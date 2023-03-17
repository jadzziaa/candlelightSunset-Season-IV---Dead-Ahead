require "cl_itrk_defs"
require "ISUI/ISInventoryPane"
local itrk = _G.ITRK

do
    local function shallowcopy(orig)
        local orig_type = type(orig)
        local copy
        if orig_type == 'table' then
            copy = {}
            for orig_key, orig_value in pairs(orig) do
                copy[orig_key] = orig_value
            end
        else -- number, string, boolean, etc
            copy = orig
        end
        return copy
    end

    itrk.ShallowCopyRefs = itrk.ShallowCopyRefs or {}
    local function tryCopy(id, ref)
        if itrk.ShallowCopyRefs[id] then
            return
        end

        itrk.ShallowCopyRefs[id] = shallowcopy(ref)
    end

    local function getRef(id)
        if not itrk.ShallowCopyRefs[id] then
            return
        end

        return itrk.ShallowCopyRefs[id]
    end

    itrk.RefHooked = {}
    local function tryHook(id, key, callback, preFix, replace)
        if not id or not key or not callback then return end

        local compKey = id .. "_" .. key
        if itrk.RefHooked[compKey] then return end

        local ref = getRef(id)
        if not ref then return end
        local func = ref[key]

        if func then
            if replace then
                _G[id][key] = function(...) (_G[callback] or func)(...) end
                return
            end

            _G[id][key] = function(...)
                local cb = _G[callback]

                if cb then
                    if preFix then
                        func(...)

                        local r = cb(...)
                        if r ~= nil then return r end
                    else
                        local r = cb(...)
                        if r ~= nil then return r end

                        func(...)
                    end
                else
                    func(...)
                end
            end
        end

        itrk.RefHooked[compKey] = callback
    end

    -- deferred function to clear all the references
    local function clearRef()
        table.wipe(itrk.ShallowCopyRefs)
        table.wipe(itrk.RefHooked)
    end

    Events.OnGameBoot.Add(clearRef)

    Events.OnGameStart.Add(function()
        -- todo: make this as shared library: well, when i make more than 3-5 mods.
        tryCopy("ISInventoryPane", ISInventoryPane)
        tryHook("ISInventoryPane", "renderdetails", "__AlternativeItemRender", false, true)
        tryHook("ISInventoryPane", "rendericons", "__AlternativeIconRender", false, true)
        -- tryHook("ISVehicleMechanics", "doPartContextMenu", "__QuickActionRightContextMenuPrefix")
        -- tryHook("ISHealthPanel", "doBodyPartContextMenu", "__QuickActionRightContextMenuBodyPart")
    end)
end

return itrk
