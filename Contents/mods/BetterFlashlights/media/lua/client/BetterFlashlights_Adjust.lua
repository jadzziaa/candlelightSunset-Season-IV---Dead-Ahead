local getActivatedMods = getActivatedMods
local size = size
local get = get

local function isMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
            return true;
        end
    end
    return false;
end

local function Adjust(Name, Property, Value)
	Item = ScriptManager.instance:getItem(Name)
	Item:DoParam(Property.." = "..Value)
end

if isMod("Authentic Z - Backpacks+") or isMod("Authentic Z - Current") then
	Adjust("AuthenticZClothing.Torch2","AttachmentType","Torch")
	Adjust("AuthenticZClothing.HandTorch2","AttachmentType","HandTorchSmall")
end

if isMod("Better Belts") then
	Adjust("Base.HandTorch","AttachmentType","Torchb")
	Adjust("Base.Belt3","DisplayCategory","Accessory")
	Adjust("Base.Belt4","DisplayCategory","Accessory")
	Adjust("Base.Belt3","WorldStaticModel","Belt_Ground")
	Adjust("Base.Belt4","WorldStaticModel","Belt_Ground")
else
	Adjust("Base.HandTorch","AttachmentType","HandTorchSmall")
end