require "cl_itrk"
local itrk = _G.ITRK
itrk.options = itrk.options or {}

local fields = {}
local options = {
    mod_id="itrk",
    mod_shortname="Alt-Inv Render",
    mod_fullname="Alternative Inventory Rendering",
    options_data={}
}
local function getPrefixedKey(name)
    return "itrk_" .. name
end
local function getPrefixedText(name)
    return "IGUI_CUI_Display_" .. name
end
local function getPrefixedTable(name, _)
    local pname = getPrefixedText(name)
    return {
        name = pname,
        tooltip = pname .. "_Tooltip"
    }
end
local function addMultiOptions(name, ...)
    local tbl = getPrefixedTable(name)
    tbl.default = 1
    for k, v in ipairs({...}) do
        tbl[k] = v
    end
    options.options_data[getPrefixedKey(name)] = tbl
    table.insert(fields, getPrefixedKey(name))
end
local function addSwitch(name, default)
    local tbl = getPrefixedTable(name)
    tbl.default = type(default) == "boolean" and default or false
    options.options_data[getPrefixedKey(name)] = tbl
    table.insert(fields, getPrefixedKey(name))
end

function itrk:getOptionData(key)
    return options.options_data[getPrefixedKey(key)]
end

addMultiOptions(
    "BookMarkStyle",
    "Yellow Bookmark",
    "White Bookmark",
    "Yellow Heart",
    "Red Heart",
    "White Heart",
    "Yellow Star",
    "Red Star",
    "White Star",
    "Vanilla"
)

-- addMultiOptions(
--     "EquipStyle",
--     "Use new icon",
--     "Use vanilla icon",
--     "Highlight Name"
-- )

addMultiOptions(
    "ControllerHighlight",
    "New Highlight",
    "Static Highlight"
    -- "Outlined Highlight"
)

-- addMultiOptions(
--     "BookTrack",
--     "Only Show Readable Books (Fastest)",
--     "Readable Book and Higher (Moderate)",
--     "Show all status (Slowest)"
-- )

addMultiOptions(
    "MaxItemPerGroup",
    "30 (Default)",
    "10 (Optimized)",
    "50 (Vanilla)",
    "100 (LAG)"
)

addMultiOptions(
    "ItemDataUpdateRate",
    "1 second (Fast)",
    "2 seconds (Fastest)",
    "0.5 seconds (500ms) (Slow)",
    "Almost Realtime (Slowest)"
)
addMultiOptions(
    "InventoryUpdateRate",
    "1 second (Fast)",
    "2 seconds (Fastest)",
    "0.5 seconds (500ms) (Slow)",
    "Almost Realtime (Slowest)"
)

addMultiOptions(
    "OpacityPresets",
    "Opaque",
    "Transparent"
)

addSwitch("EnableTrackLitItems", true)
addSwitch("EnableTrackMediaItems", true)
addSwitch("EnableTrackLitItems", true)
addSwitch("EnableDrainableDetail", true)
addSwitch("EnableShowModdedGun", false)
addSwitch("EnableMagazineDetail", false)
addSwitch("EnableEquipmentLine", true)
addSwitch("EnableDelayedItemDataUpdate", true)
addSwitch("EnableDelayedInventoryUpdate", false)
addSwitch("EnableDetailedAttachments", false)
addSwitch("ExperimentalTableWipe", false)

addSwitch("EnableTrackMediaItems", true)

addSwitch("EnableTrackDuplicates", false)
addSwitch("EnableTrackDuplicateLiteratures", true)
addSwitch("EnableTrackDuplicateWeapons", false)
addSwitch("EnableTrackDuplicateWeaponsComparison", false)
addSwitch("EnableTrackDuplicateClothings", false)
addSwitch("EnableTrackDuplicateFoods", false)
addSwitch("EnableTrackDuplicateItems", false)

-- ShowDuplicate
-- ShowDuplicateIncludeFood
-- ShowDuplicateIncludeFood

local settings
local function initialize()
    if ModOptions and ModOptions.getInstance then
        print("Utilizing mod option for Inventory Rendering Configurations")
        settings = ModOptions:getInstance(options)
        function settings:OnApply()
            itrk:applyOption(self)
        end
        function settings:OnApplyInGame()
            itrk:applyOption(self)
        end
        ModOptions:loadFile()
    end
end
Events.OnGameStart.Add(function()
    if ModOptions and settings then
        ModOptions:loadFile()
        settings:OnApply()
    end
end)
-- todo: complete configuration options
initialize()
