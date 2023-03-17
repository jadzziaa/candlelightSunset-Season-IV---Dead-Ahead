ExtraClothingOptions = { NameSet = {}, Options = {}, CurrentTweakDataOptions = "" }

-- Create a new ExtraClothingOptions object
function ExtraClothingOptions:New()
    local o = {}
    setmetatable(o, {__index = self})
    -- Set of the options name, will be used to efficiently
    -- know if the object already contains an option
    o.NameSet = {}
    -- Table of pairs contains the name of the extra clothing
    -- option and the clothing item it is linked to
    o.Options = {}
    -- We'll keep the last generated TweakData string in a
    -- buffer to check if anything was overridden
    o.CurrentTweakDataOptions = ""
    return o
end

-- Add an clothing option entry to the object
---@param name the name of the option (ClothingItemExtraOption)
---@param item the name of the clothing item attached to it (ClothingItemExtra).
function ExtraClothingOptions:Add(name, item)
    table.insert(self.Options, { Name = name, Item = item })
    self.NameSet[name] = true
end

-- Removes a clothing option entry from the object
---@param name the name of the option (ClothingItemExtraOption)
function ExtraClothingOptions:Remove(name)
    if self:Contains(name) then
        table.remove(self.Options, self:GetIndex(name));
    end
end

-- Checks if the object already contains an entry for the given option name
---@param name the name of the option (ClothingItemExtraOption)
---@return true if the item was found, false otherwise
function ExtraClothingOptions:Contains(name)
    return self.NameSet[name] ~= nil;
end

-- Get the index of the entry with the given name
---@param name the name of the option (ClothingItemExtraOption)
---@return index of the entry if it exists, nil otherwise
function ExtraClothingOptions:GetIndex(name)
    for index, option in ipairs(self.Options) do
        if option["Name"] == name then
            return index
        end
    end
    return nil
end

-- Convert the object into strings usable by the ItemTweakerAPI
---@return table with two keys, ["optionNames"] for the ClothingItemExtraOption
-- field and ["clothingItems"] for the ClothingItemExtra field
function ExtraClothingOptions:ConvertToTweakData()
    local clothingItems = ""
    local optionNames = ""

    for _, option in ipairs(self.Options) do
        clothingItems = clothingItems .. option["Item"] .. ";";
        optionNames = optionNames .. option["Name"] .. ";";
    end

    self.CurrentTweakDataOptions = optionNames:sub(1, -2)

    return
    {
        ["clothingItems"] = clothingItems:sub(1, -2),
        ["optionNames"] = self.CurrentTweakDataOptions
    }

end

-- Prints every entry of the object
function ExtraClothingOptions:Print()
    for _, option in ipairs(self.Options) do
        print("Extra option pair : " .. option["Name"] .. ", " .. option["Item"])
    end
end
