NATT = {}

local NATTSettings = {
	options = { 
	  backpackWR = true,
	},
	names = {
		backpackWR = "IGUI_NATT_BackpackWR",
	},
	mod_shortname = "Noir's Attachments",
  }
  
if ModOptions and ModOptions.getInstance then
	local settings = ModOptions:getInstance(NATTSettings)
	local backpackWR = settings:getData("backpackWR")
	backpackWR.tooltip = "IGUI_NATT_BackpackWR_tooltip"
	function backpackWR:OnApplyInGame(val) end
end

local attachmentsProvided = {}
local function getAttachmentsProvided(item)
	local itemType = item:getType()
	attachmentsProvided[itemType] = {}
	local backpackAttachmentsProvided = item:getAttachmentsProvided()
	if not backpackAttachmentsProvided then return end
	for i=0, backpackAttachmentsProvided:size()-1 do
		local attachment = backpackAttachmentsProvided:get(i)
		attachmentsProvided[itemType][attachment] = true
	end
end

local function excludeItem(item)
	if item:IsClothing() or 
	item:isWaterSource() or 
	item:IsFood() or
	item:isCustomWeight()
	then return true end
	return false
end

local function newReducedWeight(itemWeight,backpackWR)
	local defaultWR = 0.7
	return (itemWeight * (100-backpackWR)/100) / defaultWR
end

local function applyBackpackWRtoContainerItems(item,backpackWR)
	local container = item:getItemContainer()
	local containerItems = container:getItems()
	if not containerItems then return end
	for i=0,containerItems:size()-1 do
		local itemInContainer = containerItems:get(i)
		if not excludeItem(itemInContainer) then
			local itemInContainerWeight = itemInContainer:getWeight()
			local newWeight = newReducedWeight(itemInContainerWeight,backpackWR)
			itemInContainer:setActualWeight(newWeight)
		end
	end
end

local function restoreWeightToContainerItems(item)
	local container = item:getItemContainer()
	local containerItems = container:getItems()
	if not containerItems then return end
	for i=0,containerItems:size()-1 do
		local itemInContainer = containerItems:get(i)
		if not excludeItem(itemInContainer) then
			local itemInContainerWeight = itemInContainer:getWeight()
			itemInContainer:setActualWeight(itemInContainerWeight)
		end
	end
end

NATT.applyBackpackWR = function(chr,item)
	if not NATTSettings.options.backpackWR then return end;
	if excludeItem(item) then return end;
	local slotType = item:getAttachedSlotType()
	if not slotType then return end
	local backpack = chr:getClothingItem_Back() 
	if backpack then 
		getAttachmentsProvided(backpack)
		local backpackType = backpack:getType()
		if not attachmentsProvided[backpackType][slotType] then return end
		local backpackWR = backpack:getWeightReduction()
		local itemWeight = item:getWeight()
		if item:IsInventoryContainer() then
			applyBackpackWRtoContainerItems(item,backpackWR)
		end
		local newWeight = newReducedWeight(itemWeight,backpackWR)
		item:setActualWeight(newWeight)
	end
end

NATT.restoreWeight = function (item)
	if not item then return end;
	if excludeItem(item) then return end;
	item:setActualWeight(item:getWeight())
	if item:IsInventoryContainer() then
		restoreWeightToContainerItems(item)
	end
end

local lastEquippedItem
local function onEquip(chr,item)
	if item and item:IsInventoryContainer() then
		item:getInventory():setParent(nil)
	end
	if item then
        lastEquippedItem = item
        NATT.restoreWeight(item)
        return
    end
    if lastEquippedItem and lastEquippedItem:getAttachedSlotType() then
        NATT.applyBackpackWR(chr,lastEquippedItem)
   		return
 	end
end

NATT.equipPrimary = function (chr, item)
	onEquip(chr, item)
end

NATT.equipSecondary = function (chr, item)
	onEquip(chr, item)
end

NATT.OnClothingUpdated = function(chr)
	local hotbar = getPlayerHotbar(chr:getPlayerNum());
	if not hotbar then return end;
	for _,item in pairs(hotbar.attachedItems) do
		if chr:isEquipped(item) then
			NATT.restoreWeight(item)
		end
	end
end

function ISInventoryTransferAction:waitToStart()
    NATT.restoreWeight(self.item)
    return false
end

local oldISInventoryTransferActionStop = ISInventoryTransferAction.stop
function ISInventoryTransferAction:stop()
	oldISInventoryTransferActionStop(self)
	NATT.restoreWeight(self.item)
	NATT.applyBackpackWR(self.character,self.item)
end

function ISDetachItemHotbar:waitToStart()
    NATT.restoreWeight(self.item)
    return false
end

function ISAttachItemHotbar:waitToStart()
	self.item:setAttachedSlotType(self.slotDef.type)
    NATT.applyBackpackWR(self.character,self.item)
    return false
end

local oldISAttachItemHotbarStop = ISAttachItemHotbar.stop
function ISAttachItemHotbar:stop()
	oldISAttachItemHotbarStop(self)
	NATT.restoreWeight(self.item)
end

local oldISInventoryPaneGetActualItems = ISInventoryPane.getActualItems
function ISInventoryPane.getActualItems(items)
	local itemsTmp = oldISInventoryPaneGetActualItems(items)
	for _,item in ipairs(itemsTmp) do
		if not item:getAttachedSlotType() then
			NATT.restoreWeight(item)
		end
	end
	return itemsTmp
end

local oldISInventoryPaneDraggedItemsReset = ISInventoryPaneDraggedItems.reset
function ISInventoryPaneDraggedItems:reset()
    if self.items then
        for _,item in ipairs(self.items) do
            if item:getAttachedSlotType() then
                local chr = getSpecificPlayer(self.playerNum)
                NATT.applyBackpackWR(chr,item)
			else
				NATT.restoreWeight(item)
			end
        end
    end
    oldISInventoryPaneDraggedItemsReset(self)
end

Events.OnClothingUpdated.Add(NATT.OnClothingUpdated)
Events.OnEquipPrimary.Add(NATT.equipPrimary)
Events.OnEquipSecondary.Add(NATT.equipSecondary)