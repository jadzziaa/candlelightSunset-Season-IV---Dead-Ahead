if getActivatedMods():contains("ItemTweakerAPI") then
	require("ItemTweaker_Core");
else return end

require("Delran_Utils")

-- Include the extra option class
require("ExtraClothingOptions")

local ClothingOptions = {}

local extraClothingStr = "ClothingItemExtra";
local extraOptionStr = "ClothingItemExtraOption";

local function CheckIfOptionExists(itemName, extraOptionClothingItem, extraOptionName)
	local currentItemTweakData = TweakItemData[itemName]
	local itemClothingOptions = ClothingOptions[itemName]

	if not currentItemTweakData then
		TweakItemData[itemName] = {};
		ClothingOptions[itemName] = ExtraClothingOptions:New()
		itemClothingOptions = ClothingOptions[itemName]

	elseif not itemClothingOptions then
		ClothingOptions[itemName] = ExtraClothingOptions:New()
		itemClothingOptions = ClothingOptions[itemName]

		-- The item was modified using the ItemTweaker API,
		-- we'll check if an extra clothing option was added
		local currentItemOptionName = currentItemTweakData[extraOptionStr]
		if currentItemOptionName then
			-- if an extra clothing option was indeed added, keep it before continuing
			local currentItemOptionClothing = currentItemTweakData[extraClothingStr]
			itemClothingOptions:Add(currentItemOptionName, currentItemOptionClothing)
		end

		-- Check if the tweak data has changed
	elseif itemClothingOptions.CurrentTweakDataOptions ~= currentItemTweakData[extraOptionStr] then
		-- If the tweaked data has changed, this mean that the options were overridden
		-- by an external use of the IteamTweaker Core API, we can add the options
		local extraOptionToAdd = currentItemTweakData[extraClothingStr]
		local extraOptionNamesToAdd = currentItemTweakData[extraOptionStr]

		local optionClothes = DelranUtils.Split(extraOptionToAdd)
		local optionNames = DelranUtils.Split(extraOptionNamesToAdd)

		for index, optioName in ipairs(optionNames) do
			if not itemClothingOptions:Contains(optioName) then
				itemClothingOptions:Add(optioName, optionClothes[index])
			end
		end

	end

	-- Don't do anything is the given option name is already in the set
	if itemClothingOptions:Contains(extraOptionName) then
		return true;
	end

	itemClothingOptions:Add(extraOptionName, extraOptionClothingItem)

	return false
end

local function SetTweakedData(itemName)
	local ItemData = TweakItemData[itemName];

	local tweakDatas = ClothingOptions[itemName]:ConvertToTweakData()

	ItemData[extraOptionStr] = tweakDatas["optionNames"];
	ItemData[extraClothingStr] = tweakDatas["clothingItems"];
end

function ItemTweaker.AddClothingOptionIfDoesntExists(itemName, extraOptionClothingItem, extraOptionName)

	if not CheckIfOptionExists(itemName, extraOptionClothingItem, extraOptionName) then
		SetTweakedData(itemName)
	end
end

function ItemTweaker.AddOrReplaceClothingOption(itemName, extraOptionClothingItem, extraOptionName)

	local entryExists = CheckIfOptionExists(itemName, extraOptionClothingItem, extraOptionName)

	local itemClothingOptions = ClothingOptions[itemName]

	if entryExists then
		itemClothingOptions:Remove(extraOptionName)
		itemClothingOptions:Add(extraOptionName, extraOptionClothingItem)
	end
	SetTweakedData(itemName)
end

function ItemTweaker.RemoveClothingOption(itemName, extraOptionName)
	ClothingOptions[itemName]:Remove(extraOptionName)
	SetTweakedData(itemName)
end

-- Dev functions
function ItemTweaker.GetClothingOption(itemName)
	return ClothingOptions[itemName]
end

--[[

This function is taking advantage of the fact that the DoParam() function of Project's Zomboid Item
class (used by the ItemTweakerAPI) can take multiple parameters separated by a semicolon for the fields
ClothingItemExtra and ClothingItemExtraOption.

This function is usefull to avoid overriding other mods that adds extra clothing option.

!!! Note that this will still override the fields that were set inside of the item's script

Usage is simple, just call the function with the name of the item to modify, the name of the linked
item and the name of the option
e.g.

local currentItem = "Base.Hoodie_Down";
ItemTweaker.AddClothingOptionIfDoesntExists(currentItem, "Base.Hoodie_Up", "UpHoodie")
ItemTweaker.AddClothingOptionIfDoesntExists(currentItem, "Base.Hoodie_Tied", "TieAroundWaist")
]]

--------------- TESTS ----------------
--[[

ItemTweaker.AddOrReplaceClothingOption("Delran.HoodieUp", "Delran.HoodieTied", "TieOnWaist")
ItemTweaker.AddOrReplaceClothingOption("Delran.HoodieUp", "Should replace previous", "HoodieDown")
ItemTweaker.AddOrReplaceClothingOption("Delran.HoodieUp", "Delran.HoodieTroussed", "TroussHoodie")
ItemTweaker.AddOrReplaceClothingOption("Delran.HoodieUp", "MUST NOT APPEAR", "ToBeRemoved")
ItemTweaker.RemoveClothingOption("Delran.HoodieUp", "ToBeRemoved")
ClothingOptions["Delran.HoodieUp"]:Print()

ItemTweaker.AddClothingOptionIfDoesntExists("Delran.HoodieUp", "Should appear", "HoodieDown")
ItemTweaker.AddClothingOptionIfDoesntExists("Delran.HoodieUp", "MUST NOT APPEAR", "HoodieDown")
ItemTweaker.AddClothingOptionIfDoesntExists("Delran.HoodieUp", "Delran.HoodieTroussed", "TroussHoodie")
ClothingOptions["Delran.HoodieUp"]:Print()

ItemTweaker.AddClothingOptionIfDoesntExists("Delran.HoodieUp", "Delran.HoodieTied", "TieOnWaist")
ItemTweaker.AddClothingOptionIfDoesntExists("Delran.HoodieTied", "Delran.HoodieUp", "UpHoodie")
ClothingOptions["Delran.HoodieUp"]:Print()
ClothingOptions["Delran.HoodieTied"]:Print()
onGameBootFunc[1]()
]]
--------------- TESTS ----------------
