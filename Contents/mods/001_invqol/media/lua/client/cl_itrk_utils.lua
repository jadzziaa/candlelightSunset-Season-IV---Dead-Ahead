local utils = {}

local typeCache = {}
local itof = instanceof
utils.checkType = function(item, t)
    local tt = item
    typeCache[t] = (typeCache[t] or {})
    local ttt = typeCache[t][tt]
    if ttt == nil then
        local r = itof(item, t)
        typeCache[t][tt] = r and true or false
        return r
    else
        return typeCache[t][tt]
    end
end

utils.Types = {
    Clothing = "Clothing",
    Inventory = "InventoryItem",
    Literature = "Literature",
    Weapon = "HandWeapon",
    Food = "Food",
    Combo = "DrainableComboItem",
    GenericCombo = "ComboItem",
    Bag = "InventoryContainer",
    Drain = "Drainable",
}

utils.GUIPrefix = "IGUI_ItemCat_"

return utils
