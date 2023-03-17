require "recipecode"

function BetterBatteries.itemHasBatteryRemoved(item)
    local modData = item:getModData().batteryRemoved
    local isBool = type(modData) == "boolean"
    local isString = type(modData) == "string"
    return isBool and modData or (isString and string.lower(modData) == "true")
end

function Recipe.OnCreate.HandCrankCreation(items, result, player)
    result:setUsedDelta(0)
    result:getModData().batteryRemoved = true
end

function Recipe.OnTest.BBItemBatteryRemoval(sourceItem, result)
    return not BetterBatteries.itemHasBatteryRemoved(sourceItem)
end
 
function Recipe.OnCreate.BBItemBatteryRemoval(items, result, player)
    local item = items:get(0)
    local currSlot = item:getAttachedSlot()
    local modData = item:getModData()
    local replacementItem = modData.BetterBatteriesDepleteData -- getReplaceOnDeplete is overwritten in this mod for items in support.
    result:setUsedDelta(item:getUsedDelta())

    local indexedItem = player:getInventory():AddItem(replacementItem or item)
    if not replacementItem then
        item:setUsedDelta(0)
        modData.batteryRemoved = true
    else
        if instanceof(indexedItem, "Drainable") then
            indexedItem:setUsedDelta(0)
        end

        indexedItem:setFavorite(item:isFavorite())
        indexedItem:copyModData(item:getModData())
        indexedItem:getModData().batteryRemoved = true
    end

    indexedItem:setAttachedSlot(currSlot)
end

function Recipe.OnTest.BBItemBatteryInsertInvert(sourceItem, result)
    if sourceItem:hasTag("BatteryItem") then
		return BetterBatteries.itemHasBatteryRemoved(sourceItem) -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return sourceItem:hasTag("Battery") and sourceItem:getUsedDelta() < SandboxVars.BetterBatteries.MaximumCharge
end
 
function Recipe.OnTest.BBItemBatteryInsert(sourceItem, result)
    if sourceItem:hasTag("BatteryItem") then
		return BetterBatteries.itemHasBatteryRemoved(sourceItem) -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return sourceItem:hasTag("Battery") and sourceItem:getUsedDelta() > 0 -- the battery
end

function Recipe.OnCreate.BBItemBatteryInsert(items, result, player)
    local oldItem = nil
    local battery = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:hasTag("Battery") then
            battery = item
        elseif item:hasTag("BatteryItem") then
            oldItem = item
        end
	end

    if battery then
        local oldIsSame = oldItem and oldItem:getFullType() == result:getFullType()
        print(oldIsSame)
        local indexedItem = player:getInventory():AddItem(oldIsSame and oldItem or result)
        indexedItem:setUsedDelta(battery:getUsedDelta())
        indexedItem:getModData().batteryRemoved = nil
        player:getInventory():Remove(battery) -- Failsafe just in case battery isn't removed in the recipe for some unknown reason.

        if oldItem and not oldIsSame then
            indexedItem:setFavorite(oldItem:isFavorite())
            indexedItem:setAttachedSlot(oldItem:getAttachedSlot())
       --[[ else
            print("Attempting to remove..")
            player:getInventory():Remove(result)]]
        end
    end
end
 
function Recipe.OnCreate.BBDismantleItem(items, result, player)
    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item:getTags():contains("BatteryItem") and not item:getModData().batteryRemoved then
            local battery = player:getInventory():AddItem("Base.Battery")
            if battery then -- TIS is drunk, this is for some godforsaken reason required.
                battery:setUsedDelta(item:getUsedDelta())
            end
        end
    end
end