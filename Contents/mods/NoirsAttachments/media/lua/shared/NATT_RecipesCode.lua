local function keepProperties(item,result)
	local backpackVisual = item:getVisual()
	local resultVisual = result:getVisual()
	result:getItemContainer():setItems(item:getItemContainer():getItems());
	if backpackVisual and resultVisual then
		resultVisual:setTextureChoice(backpackVisual:getTextureChoice());
		result:synchWithVisual();
	end
	local modData = item:getModData()
	if modData.NATTattachments then
		result:getModData().NATTattachments = modData.NATTattachments
	end
end

function NATTcheckIsEquipped(item,result)
	return not (item:IsInventoryContainer() and item:isEquipped())
end

local function transferItemsToInventory(container,player)
	local items = container:getItemContainer():getItems()
	if not items then return end
	local playerInv = player:getInventory()
	for i=1,items:size() do
		playerInv:addItem(items:get(i-1))
	end
end

local snakeBackpacksFrame = {
    AlicePack = "AliceBP.UpgradedAlicePack1",
    UpgradedAlicePack3 = "AliceBP.UpgradedAlicePack2",
    UpgradedAlicePack3b = "AliceBP.UpgradedAlicePack2b",
    UpgradedAlicePack1 = "AliceBP.AlicePack",
    UpgradedAlicePack2 = "AliceBP.UpgradedAlicePack3",
    UpgradedAlicePack2b = "AliceBP.UpgradedAlicePack3b",
}

function NATTsnakeAddFrameBackpack(items,result,player)
	local backpack = items:get(0)
	local newType = snakeBackpacksFrame[backpack:getType()]
	local newBackpack = InventoryItemFactory.CreateItem(newType)
	keepProperties(backpack,newBackpack)
	player:getInventory():AddItem(newBackpack);
end

function NATTsnakeRemoveFrameBackpack(items,result,player)
	local backpack = items:get(0)
	local newType = snakeBackpacksFrame[backpack:getType()]
	local newBackpack = InventoryItemFactory.CreateItem(newType)
	keepProperties(backpack,newBackpack)	
	player:getInventory():AddItem(newBackpack);
	player:getInventory():AddItem("AliceBP.SupportBackpack");
end

local snakeBackpacksPouch = {
    UpgradedAlicePack1 = {
        MilitiaPouch1 = "AliceBP.UpgradedAlicePack2",
        MilitiaPouch2 = "AliceBP.UpgradedAlicePack2b"
    },
    AlicePack = {
        MilitiaPouch1 = "AliceBP.UpgradedAlicePack3",
        MilitiaPouch2 = "AliceBP.UpgradedAlicePack3b"
    },
    UpgradedAlicePack3 = {
        backpack = "AliceBP.AlicePack",
        pouch = "AliceBP.MilitiaPouch1"
    },
    UpgradedAlicePack3b = {
        backpack = "AliceBP.AlicePack",
        pouch = "AliceBP.MilitiaPouch2"
    },
    UpgradedAlicePack2 = {
        backpack = "AliceBP.UpgradedAlicePack1",
        pouch = "AliceBP.MilitiaPouch1"
    },
    UpgradedAlicePack2b = {
        backpack = "AliceBP.UpgradedAlicePack1",
        pouch = "AliceBP.MilitiaPouch2"
    },
}

function NATTsnakeAddPouchBackpack(items,result,player)
	local backpack = items:get(0)
	local backpackType = backpack:getType()
	local pouch = items:get(1)
	local pouchType = pouch:getType()
	local newType = snakeBackpacksPouch[backpackType][pouchType]
	local newBackpack = InventoryItemFactory.CreateItem(newType)
	keepProperties(backpack,newBackpack)
	transferItemsToInventory(pouch,player)
	player:getInventory():AddItem(newBackpack)
end

function NATTsnakeRemovePounchBackpack(items,result,player)
	local backpack = items:get(0)
	local backpackType = backpack:getType()
	local newType = snakeBackpacksPouch[backpackType].backpack
	local pouch = snakeBackpacksPouch[backpackType].pouch
	local newBackpack = InventoryItemFactory.CreateItem(newType)
	keepProperties(backpack,newBackpack)	
	player:getInventory():AddItem(newBackpack)
	player:getInventory():AddItem(pouch)
end

function NATTgetSlotName(baseWord,item)
	local prefix = string.gsub(item:getFullType(),"Base.","")
	return NATTBackpacks[prefix]..baseWord
end

local function slotHandler(items,result,prefix,player,add)
	local resultType = result:getType()
	local baseWord = string.gsub(resultType,prefix,"")
	local item = items:get(0)
	local attachmentName = NATTgetSlotName(baseWord,item)
	local modData = item:getModData()
	if not modData.NATTattachments then	
		modData.NATTattachments= {}
	end
	modData.NATTattachments[attachmentName] = add
	player:getInventory():AddItem(item)
end

local function checkIsValid(item,result,prefix,add)
	if item:IsInventoryContainer() then 
		if item:isEquipped() then return false end
		local modData = item:getModData()
		local attachments = modData.NATTattachments
		if not attachments then return add end
		local resultType = result:getType()
		local baseWord = string.gsub(resultType,prefix,"")
		local attachmentName = NATTgetSlotName(baseWord,item)
		if not add then
			return attachments[attachmentName]
		end
		return not attachments[attachmentName]
	end
	return true
end

local function setRecipeItems(scriptItems,item)
	local scriptItem = getScriptManager():FindItem(item)
	if scriptItem then 
		scriptItems:add(scriptItem)
	end
end

local function setBackpacksRecipeItems(slot,include,scriptItems)
	for k,v in pairs(NATTBackpacks) do
		local isBlackListed = NATTBackpacksBlacklistSlots[slot][v]
		if include then 
			if isBlackListed then setRecipeItems(scriptItems,k) end
		else
			if not isBlackListed then setRecipeItems(scriptItems,k) end
		end
	end
end

function NATTcheckIsValidAdd(item,result)
	return checkIsValid(item,result,"NATT_",true)
end

function NATTcheckIsValidRemove(item,result)
	return checkIsValid(item,result,"NATT_Remove_",false)
end

function NATTAddAttachmentSlot(items,result,player)
	slotHandler(items,result,"NATT_",player,true)
end

function NATTRemoveAttachmentSlot(items,result,player)
	slotHandler(items,result,"NATT_Remove_",player,false)
end

function NATTWeaponSlotBackpacks(scriptItems)
	setBackpacksRecipeItems("Weapon",false,scriptItems)
end

function NATTShortWeaponSlotBackpacks(scriptItems) 
	setBackpacksRecipeItems("Weapon",true,scriptItems)
end

function NATTRightSlotBackpacks(scriptItems) 
	setBackpacksRecipeItems("Right",false,scriptItems)
end

function NATTLeftSlotBackpacks(scriptItems) 
	setBackpacksRecipeItems("Left",false,scriptItems)
end

function NATTUtilityLeftSlotBackpacks(scriptItems)
	setBackpacksRecipeItems("UtilityLeft",false,scriptItems)
end

function NATTUtilityRightSlotBackpacks(scriptItems) 
	setBackpacksRecipeItems("UtilityRight",false,scriptItems)
end

function NATTBedrollSlotBackpacks(scriptItems)
	setBackpacksRecipeItems("Bedroll",false,scriptItems)
end

function NATTFlashlightSlotBackpacks(scriptItems)
	setBackpacksRecipeItems("Flashlight",false,scriptItems)
end

function NATTContainerSlotBackpacks(scriptItems)
	setBackpacksRecipeItems("Container",false,scriptItems)
end

function NATTSmallContainerLeftSlotBackpacks(scriptItems)
	setBackpacksRecipeItems("SmallContainerLeft",false,scriptItems)
end

function NATTSmallContainerRightSlotBackpacks(scriptItems)
	setBackpacksRecipeItems("SmallContainerRight",false,scriptItems)
end