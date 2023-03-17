--- THIS IS AN EXAMPLE OF THE API'S USE AS WELL AS WHAT SUPPORTS THE FOLLOWING THREE MODS:
-- Shark's (and Peach's) Military Uniform Improvements
-- Brita's Armor Pack
-- Paw Low Loot (41.50)

--- This line is required to ensure proper loading regardless of the which method is selected:
if getActivatedMods():contains("NightVisionChucked") then require("eris_nvg/eris_nvg/eris_nvg") else return end

--- ALL ITEMS THAT ARE APPLIED NEED TO BE "CLOTHING" TYPE ITEMS.

--- { SINGLE METHOD } Adds a single type at a time, similar to itemTweaker.
-- This method is ideal if you don't have that many items or are not comfortable with Lua.
applyNVGchucked_ModuleType("Base.Animask23")
applyNVGchucked_ModuleType("Base.Mask_HECU") --PAW LOW LOOT:


--- { BATCH METHOD } Adds multiple types through a provided lua table, otherwise the same as above.
-- This method is ideal if you have a lot of items (probably a rare instance.)
for _,type in pairs({

    "Base.Hat_PVS15_ON",
    "Base.Hat_PVS15_Harness_ON",

    "Base.Hat_Sam_NV",

    "Base.Hat_NV18_ON",
    "Base.Hat_NV18_Harness_ON",

    "Base.NV_PVS5",
    "Base.NV_PNV_57",
    "Base.NV_PVS7",
    "Base.NV_PVS21",


}) do applyNVGchucked_ModuleType(type) end --BRITA


---{ SCRIPT METHOD } Adds the functionality through script using `Tags`.
--This method can be easiest if you are the one who made the items to begin with and are not comfortable with Lua.
--Other modders may use this tag method if I am not available to add them here.
--[[
module EXAMPLE_MODULE
{
    item EXAMPLE_TYPE
    {
        Type = Clothing,
        Tags = NVGchucked,
        /* Type=Clothings, and Tags=NVGchucked are both required for the API to apply, everything else can be what ever you want. */
    }
}
--]] --SMUI (SMUI has elected to use the tags method in their own code base.)

