QNW_QNWL_AUtil = QNW_QNWL_AUtil or {}

local this     = QNW_QNWL_AUtil

---将ArrayList转换成table
function QNW_QNWL_AUtil.listToTable(_list)
    local t = {}
    if _list then
        for i = 0, _list:size() - 1 do
            table.insert(t, _list:get(i))
        end
    end
    return t
end

---将table转换成ArrayList
function QNW_QNWL_AUtil.tableToList(_table)
    local list = ArrayList.new()
    if _table then
        for _, v in pairs(_table) do
            list:add(v)
        end
    end
    return list
end

---为菜单选项设置提示
function QNW_QNWL_AUtil.setContextMenuTooltip(_option, _description)
    local tooltip = ISToolTip:new()
    tooltip:initialise()
    tooltip:setVisible(false)
    tooltip.description = _description
    _option.toolTip     = tooltip
end

---获取InventoryItem的IsoWorldInventoryObject
function QNW_QNWL_AUtil.getWorldItemByInventoryItem(_item)
    local worldItem = _item:getWorldItem()
    if not worldItem then
        local container = _item:getOutermostContainer()
        if container then
            local containingItem = container:getContainingItem()
            if containingItem then
                worldItem = containingItem:getWorldItem()
            end
        end
    end
    return worldItem
end

function QNW_QNWL_AUtil.getInventoryItemByObject(_isoObject)
    local items = {}
    for i = 0, _isoObject:getContainerCount() - 1 do
        local container = _isoObject:getContainerByIndex(i)
        if container then
            this.tableInsertAll(items, this.getAllItem(container))
        end
    end
    return items
end

---获取IsoGridSquare的所有InventoryItem
function QNW_QNWL_AUtil.getInventoryItemBySquare(_square)
    local items = {}
    if _square then
        local staticMovingObjects = this.listToTable(_square:getStaticMovingObjects())
        for _, v in pairs(staticMovingObjects) do
            if instanceof(v, "IsoDeadBody") then
                this.tableInsertAll(items, this.getInventoryItemByObject(v))
            end
        end

        local objects = this.listToTable(_square:getObjects())
        for _, object in pairs(objects) do
            if instanceof(object, "IsoWorldInventoryObject") then
                local item = object:getItem()
                table.insert(items, item)
                if instanceof(item, "InventoryContainer") then
                    this.tableInsertAll(items, this.getAllItem(item:getInventory()))
                end
            else
                this.tableInsertAll(items, this.getInventoryItemByObject(object))
            end
        end
    end
    return items
end

---同步InventoryItem的ModData数据
function QNW_QNWL_AUtil.syncItemModData(_item, _key, _player)
    local data = _item:getModData()[_key]
    if not data then
        return
    end
    if _item:isInPlayerInventory() then
        return
    end
    local square = this.getSquareByInventoryItem(_item)
    if square then
        if isServer() then
            QNW_QNWL_SLuaNet.syncServerItemModData(_item, square, _key, _player)
        end
        if isClient() then
            QNW_QNWL_CLuaNet.syncClientItemModData(_item, square, _key)
        end
    end
end

---将InventoryItem转换成table
function QNW_QNWL_AUtil.inventoryItemToTable(_item)
    local map              = {}
    map.fullType           = _item:getFullType()
    map.modData            = _item:getModData()
    map.broken             = _item:isBroken()
    map.condition          = _item:getCondition()
    map.haveBeenRepaired   = _item:getHaveBeenRepaired()
    map.customName         = _item:isCustomName()
    map.name               = _item:getDisplayName()
    map.colorR             = _item:getR()
    map.colorG             = _item:getG()
    map.colorB             = _item:getB()
    map.colorA             = _item:getA()
    map.colorRed           = _item:getColorRed()
    map.colorGreen         = _item:getColorGreen()
    map.colorBlue          = _item:getColorBlue()
    map.keyId              = _item:getKeyId()
    map.remoteControlID    = _item:getRemoteControlID()
    map.remoteRange        = _item:getRemoteRange()
    map.favorite           = _item:isFavorite()
    map.taintedWater       = _item:isTaintedWater()
    map.activated          = _item:isActivated()
    map.currentAmmoCount   = _item:getCurrentAmmoCount()
    map.attachedSlot       = _item:getAttachedSlot()
    map.attachedSlotType   = _item:getAttachedSlotType()
    map.attachedToModel    = _item:getAttachedToModel()
    map.maxCapacity        = _item:getMaxCapacity()
    map.recordedMediaIndex = _item:getRecordedMediaIndex()
    map.extraItems         = this.listToTable(_item:getExtraItems())
    map.isCustomWeight     = _item:isCustomWeight()
    if map.isCustomWeight then
        map.actualWeight = _item:getActualWeight()
    end
    if _item:IsDrainable() then
        map.usedDelta = _item:getUsedDelta()
    end
    if instanceof(_item, "AlarmClock") or instanceof(_item, "AlarmClockClothing") then
        map.alarmHour    = _item:getHour()
        map.alarmMinutes = _item:getMinute()
        map.alarmSet     = _item:isAlarmSet()
    end
    if _item:IsClothing() then
        map.spriteName           = _item:getSpriteName()
        map.dirtyness            = _item:getDirtyness()
        map.bloodLevel           = _item:getBloodlevel()
        map.wetness              = _item:getWetness()
        map.patches              = {}
        map.patches.Hole         = {}
        map.patches.BasicPatch   = {}
        map.patches.DenimPatch   = {}
        map.patches.LeatherPatch = {}
        local parts              = this.listToTable(_item:getCoveredParts())
        for _, v in pairs(parts) do
            local visual                    = _item:getVisual()
            local index                     = v:index()
            map.patches.Hole[index]         = visual:getHole(v)
            map.patches.BasicPatch[index]   = visual:getBasicPatch(v)
            map.patches.DenimPatch[index]   = visual:getDenimPatch(v)
            map.patches.LeatherPatch[index] = visual:getLeatherPatch(v)
        end
    end
    if _item:IsFood() then
        map.calories             = _item:getCalories()
        map.proteins             = _item:getProteins()
        map.lipids               = _item:getLipids()
        map.carbohydrates        = _item:getCarbohydrates()
        map.hungChange           = _item:getHungChange()
        map.baseHunger           = _item:getBaseHunger()
        map.unhappyChange        = _item:getUnhappyChangeUnmodified()
        map.boredomChange        = _item:getBoredomChangeUnmodified()
        map.thirstChange         = _item:getThirstChangeUnmodified()
        map.heat                 = _item:getHeat()
        map.lastCookMinute       = _item:getLastCookMinute()
        map.cookingTime          = _item:getCookingTime()
        map.cooked               = _item:isCooked()
        map.burnt                = _item:isBurnt()
        map.isCookable           = _item:isIsCookable()
        map.bDangerousUncooked   = _item:isbDangerousUncooked()
        map.poisonDetectionLevel = _item:getPoisonDetectionLevel()
        map.spices               = this.listToTable(_item:getSpices())
        map.poisonPower          = _item:getPoisonPower()
        map.chef                 = _item:getChef()
        map.offAge               = _item:getOffAge()
        map.offAgeMax            = _item:getOffAgeMax()
        map.painReduction        = _item:getPainReduction()
        map.fluReduction         = _item:getFluReduction()
        map.reduceFoodSickness   = _item:getReduceFoodSickness()
        map.useForPoison         = _item:getUseForPoison()
        map.freezingTime         = _item:getFreezingTime()
        map.isFrozen             = _item:isFrozen()
        map.rottenTime           = _item:getRottenTime()
        map.compostTime          = _item:getCompostTime()
        map.cookedInMicrowave    = _item:isCookedInMicrowave()
        map.fatigueChange        = _item:getFatigueChange()
        map.endChange            = _item:getEnduranceChangeUnmodified()
    end
    if _item:IsLiterature() then
        map.numberOfPages    = _item:getNumberOfPages()
        map.alreadyReadPages = _item:getAlreadyReadPages()
        map.canBeWrite       = _item:canBeWrite()
        map.lockedBy         = _item:getLockedBy()
        if map.canBeWrite then
            map.customPages = {}
            for i = 1, _item:getPageToWrite() do
                map.customPages[i] = _item:seePage(i)
            end
        end
    end
    if _item:IsWeapon() then
        map.maxRange       = _item:getMaxRange()
        map.minRangeRanged = _item:getMinRangeRanged()
        map.clipSize       = _item:getClipSize()
        map.minDamage      = _item:getMinDamage()
        map.maxDamage      = _item:getMaxDamage()
        map.recoilDelay    = _item:getRecoilDelay()
        map.aimingTime     = _item:getAimingTime()
        map.reloadTime     = _item:getReloadTime()
        map.hitChance      = _item:getHitChance()
        map.minAngle       = _item:getMinAngle()
        if _item:getScope() then
            map.scope = _item:getScope():getFullType()
        end
        if _item:getClip() then
            map.clip = _item:getClip():getFullType()
        end
        if _item:getRecoilpad() then
            map.recoilpad = _item:getRecoilpad():getFullType()
        end
        if _item:getSling() then
            map.sling = _item:getSling():getFullType()
        end
        if _item:getStock() then
            map.stock = _item:getStock():getFullType()
        end
        if _item:getCanon() then
            map.canon = _item:getCanon():getFullType()
        end
        map.explosionTimer = _item:getExplosionTimer()
        map.maxAngle       = _item:getMaxAngle()
        map.bloodLevel     = _item:getBloodLevel()
        map.containsClip   = _item:isContainsClip()
        map.roundChambered = _item:isRoundChambered()
        map.isJammed       = _item:isJammed()
        map.weaponSprite   = _item:getWeaponSprite()
    end
    if instanceof(_item, "Moveable") then
        map.worldSprite = _item:getWorldSprite()
    end
    return map
end

---将table转换成InventoryItem
function QNW_QNWL_AUtil.tableToInventoryItem(_table, _player)
    local item = InventoryItemFactory.CreateItem(_table.fullType)
    if _table.modData ~= nil then
        item:copyModData(_table.modData)
    end
    if _table.broken ~= nil then
        item:setBroken(_table.broken)
    end
    if _table.condition ~= nil then
        item:setCondition(_table.condition)
    end
    if _table.haveBeenRepaired ~= nil then
        item:setHaveBeenRepaired(_table.haveBeenRepaired)
    end
    if _table.colorR ~= nil and _table.colorG ~= nil and _table.colorB ~= nil and _table.colorA ~= nil then
        local color = Color.new(_table.colorR, _table.colorG, _table.colorB, _table.colorA)
        item:setColor(color)
    end
    if _table.colorRed ~= nil and _table.colorGreen ~= nil and _table.colorBlue ~= nil then
        item:setColorRed(_table.colorRed)
        item:setColorGreen(_table.colorGreen)
        item:setColorBlue(_table.colorBlue)
    end
    if _table.keyId ~= nil then
        item:setKeyId(_table.keyId)
    end
    if _table.remoteControlID ~= nil and _table.remoteRange then
        item:setRemoteControlID(_table.remoteControlID)
        item:setRemoteRange(_table.remoteRange)
    end
    if _table.favorite ~= nil then
        item:setFavorite(_table.favorite)
    end
    if _table.taintedWater ~= nil then
        item:setTaintedWater(_table.taintedWater)
    end
    if _table.activated ~= nil then
        item:setActivated(_table.activated)
    end
    if _table.itemCapacity ~= nil then
        item:setItemCapacity(_table.itemCapacity)
    end
    if _table.currentAmmoCount ~= nil then
        item:setCurrentAmmoCount(_table.currentAmmoCount)
    end
    if _table.attachedSlot ~= nil then
        item:setAttachedSlot(_table.attachedSlot)
    end
    if _table.attachedSlotType ~= nil then
        item:setAttachedSlotType(_table.attachedSlotType)
    end
    if _table.attachedToModel ~= nil then
        item:setAttachedToModel(_table.attachedToModel)
    end
    if _table.maxCapacity ~= nil then
        item:setMaxCapacity(_table.maxCapacity)
    end
    if _table.recordedMediaIndex ~= nil then
        item:setRecordedMediaIndexInteger(_table.recordedMediaIndex)
    end
    if _table.customName ~= nil then
        item:setCustomName(_table.customName)
    end
    if _table.name ~= nil then
        item:setName(_table.name)
    end
    if _table.usedDelta ~= nil then
        item:setUsedDelta(_table.usedDelta)
    end
    if _table.alarmHour ~= nil then
        item:setHour(_table.alarmHour)
    end
    if _table.alarmMinutes ~= nil then
        item:setMinute(_table.alarmMinutes)
    end
    if _table.alarmSet ~= nil then
        item:setAlarmSet(_table.alarmSet)
    end
    if _table.spriteName ~= nil then
        item:setSpriteName(_table.spriteName)
    end
    if _table.dirtyness ~= nil then
        item:setDirtyness(_table.dirtyness)
    end
    if _table.bloodLevel ~= nil then
        item:setBloodLevel(_table.bloodLevel)
    end
    if _table.wetness ~= nil then
        item:setWetness(_table.wetness)
    end
    if _table.patches ~= nil then
        local visual = item:getVisual()
        for k, v in pairs(_table.patches.Hole) do
            if v == 1 then
                visual:setHole(BloodBodyPartType.FromIndex(k))
            end
        end
        if _player then
            for k, v in pairs(_table.patches.BasicPatch) do
                if v == 1 then
                    item:addPatch(_player, BloodBodyPartType.FromIndex(k), InventoryItemFactory.CreateItem("Base.RippedSheets"))
                end
            end
            for k, v in pairs(_table.patches.DenimPatch) do
                if v == 1 then
                    item:addPatch(_player, BloodBodyPartType.FromIndex(k), InventoryItemFactory.CreateItem("Base.DenimStrips"))
                end
            end
            for k, v in pairs(_table.patches.LeatherPatch) do
                if v == 1 then
                    item:addPatch(_player, BloodBodyPartType.FromIndex(k), InventoryItemFactory.CreateItem("Base.LeatherStrips"))
                end
            end
        end
    end
    if _table.calories ~= nil then
        item:setCalories(_table.calories)
    end
    if _table.proteins ~= nil then
        item:setProteins(_table.proteins)
    end
    if _table.lipids ~= nil then
        item:setLipids(_table.lipids)
    end
    if _table.carbohydrates ~= nil then
        item:setCarbohydrates(_table.carbohydrates)
    end
    if _table.hungChange ~= nil then
        item:setHungChange(_table.hungChange)
    end
    if _table.baseHunger ~= nil then
        item:setBaseHunger(_table.baseHunger)
    end
    if _table.unhappyChange ~= nil then
        item:setUnhappyChange(_table.unhappyChange)
    end
    if _table.boredomChange ~= nil then
        item:setBoredomChange(_table.boredomChange)
    end
    if _table.thirstChange ~= nil then
        item:setThirstChange(_table.thirstChange)
    end
    if _table.heat ~= nil then
        item:setHeat(_table.heat)
    end
    if _table.lastCookMinute ~= nil then
        item:setLastCookMinute(_table.lastCookMinute)
    end
    if _table.cookingTime ~= nil then
        item:setCookingTime(_table.cookingTime)
    end
    if _table.cooked ~= nil then
        item:setCooked(_table.cooked)
    end
    if _table.burnt ~= nil then
        item:setBurnt(_table.burnt)
    end
    if _table.isCookable ~= nil then
        item:setIsCookable(_table.isCookable)
    end
    if _table.bDangerousUncooked ~= nil then
        item:setbDangerousUncooked(_table.bDangerousUncooked)
    end
    if _table.poisonDetectionLevel ~= nil then
        item:setPoisonDetectionLevel(_table.poisonDetectionLevel)
    end
    if _table.poisonPower ~= nil then
        item:setPoisonPower(_table.poisonPower)
    end
    if _table.chef ~= nil then
        item:setChef(_table.chef)
    end
    if _table.offAge ~= nil then
        item:setOffAge(_table.offAge)
    end
    if _table.offAgeMax ~= nil then
        item:setOffAgeMax(_table.offAgeMax)
    end
    if _table.painReduction ~= nil then
        item:setPainReduction(_table.painReduction)
    end
    if _table.fluReduction ~= nil then
        item:setFluReduction(_table.fluReduction)
    end
    if _table.reduceFoodSickness ~= nil then
        item:setReduceFoodSickness(_table.reduceFoodSickness)
    end
    if _table.useForPoison ~= nil then
        item:setUseForPoison(_table.useForPoison)
    end
    if _table.freezingTime ~= nil then
        item:setFreezingTime(_table.freezingTime)
    end
    if _table.isFrozen ~= nil then
        item:setFrozen(_table.isFrozen)
    end
    if _table.rottenTime ~= nil then
        item:setRottenTime(_table.rottenTime)
    end
    if _table.compostTime ~= nil then
        item:setCompostTime(_table.compostTime)
    end
    if _table.cookedInMicrowave ~= nil then
        item:setCookedInMicrowave(_table.cookedInMicrowave)
    end
    if _table.fatigueChange ~= nil then
        item:setFatigueChange(_table.fatigueChange)
    end
    if _table.endChange ~= nil then
        item:setEndChange(_table.endChange)
    end
    if _table.spices ~= nil then
        item:setSpices(this.tableToList(_table.spices))
    end
    if _table.extraItems then
        for _, v in pairs(_table.extraItems) do
            item:addExtraItem(v)
        end
    end
    if _table.numberOfPages ~= nil then
        item:setNumberOfPages(_table.numberOfPages)
    end
    if _table.alreadyReadPages ~= nil then
        item:setAlreadyReadPages(_table.alreadyReadPages)
    end
    if _table.canBeWrite ~= nil then
        item:setCanBeWrite(_table.canBeWrite)
    end
    if _table.lockedBy ~= nil then
        item:setLockedBy(_table.lockedBy)
    end
    if _table.customPages ~= nil then
        for k, v in pairs(_table.customPages) do
            item:addPage(k, v)
        end
    end
    if _table.maxRange ~= nil then
        item:setMaxRange(_table.maxRange)
    end
    if _table.minRangeRanged ~= nil then
        item:setMinRangeRanged(_table.minRangeRanged)
    end
    if _table.clipSize ~= nil then
        item:setClipSize(_table.clipSize)
    end
    if _table.minDamage ~= nil then
        item:setMinDamage(_table.minDamage)
    end
    if _table.maxDamage ~= nil then
        item:setMaxDamage(_table.maxDamage)
    end
    if _table.recoilDelay ~= nil then
        item:setRecoilDelay(_table.recoilDelay)
    end
    if _table.aimingTime ~= nil then
        item:setAimingTime(_table.aimingTime)
    end
    if _table.reloadTime ~= nil then
        item:setReloadTime(_table.reloadTime)
    end
    if _table.hitChance ~= nil then
        item:setHitChance(_table.hitChance)
    end
    if _table.minAngle ~= nil then
        item:setMinAngle(_table.minAngle)
    end
    if _table.scope ~= nil then
        item:setScope(InventoryItemFactory.CreateItem(_table.scope))
    end
    if _table.clip ~= nil then
        item:setClip(InventoryItemFactory.CreateItem(_table.clip))
    end
    if _table.recoilpad ~= nil then
        item:setRecoilpad(InventoryItemFactory.CreateItem(_table.recoilpad))
    end
    if _table.sling ~= nil then
        item:setSling(InventoryItemFactory.CreateItem(_table.sling))
    end
    if _table.stock ~= nil then
        item:setStock(InventoryItemFactory.CreateItem(_table.stock))
    end
    if _table.canon ~= nil then
        item:setCanon(InventoryItemFactory.CreateItem(_table.canon))
    end
    if _table.explosionTime ~= nil then
        item:setExplosionTimer(_table.explosionTimer)
    end
    if _table.maxAngle ~= nil then
        item:setMaxAngle(_table.maxAngle)
    end
    if _table.bloodLevel ~= nil then
        item:setBloodLevel(_table.bloodLevel)
    end
    if _table.containsClip ~= nil then
        item:setContainsClip(_table.containsClip)
    end
    if _table.roundChambered ~= nil then
        item:setRoundChambered(_table.roundChambered)
    end
    if _table.isJammed ~= nil then
        item:setJammed(_table.isJammed)
    end
    if _table.weaponSprite ~= nil then
        item:setWeaponSprite(_table.weaponSprite)
    end
    if _table.isCustomWeight ~= nil then
        item:setCustomWeight(_table.isCustomWeight)
    end
    if _table.actualWeight ~= nil then
        item:setActualWeight(_table.actualWeight)
        item:setWeight(_table.actualWeight)
    end
    if _table.worldSprite then
        item:ReadFromWorldSprite(_table.worldSprite)
    end
    return item
end

---获取InventoryItem的IsoGridSquare
function QNW_QNWL_AUtil.getSquareByInventoryItem(_item)
    if _item:isInPlayerInventory() then
        return _item:getOutermostContainer():getParent():getSquare()
    end
    local worldItem = this.getWorldItemByInventoryItem(_item)
    local container = _item:getOutermostContainer()
    local square
    if worldItem then
        square = worldItem:getSquare()
    else
        if container then
            local parent = container:getParent()
            if parent then
                square = parent:getSquare()
            end
        end
    end
    return square
end

---ItemContainer删除InventoryItem
function QNW_QNWL_AUtil.itemRemoveFromContainer(_item, _container)
    local worldItem = _item:getWorldItem()
    if worldItem then
        worldItem:getSquare():transmitRemoveItemFromSquare(worldItem)
        worldItem:removeFromWorld()
        worldItem:removeFromSquare()
        worldItem:setSquare(nil)
        return
    end
    if _container then
        _container:Remove(_item)
        if isClient() and _container:getType() ~= "TradeUI" and not _container:isInCharacterInventory(getPlayer()) and _container:getType() ~= "floor" then
            _container:removeItemOnServer(_item)
        end
    end
end

---ItemContainer添加InventoryItem
function QNW_QNWL_AUtil.itemAddFromContainer(_item, _container, _square)
    if _container then
        if _container:getType() == "floor" then
            _square:AddWorldInventoryItem(_item, 0.01, 0.01, 0)
        else
            _container:AddItem(_item)
            if isClient() and _container:getType() ~= "TradeUI" and not _container:isInCharacterInventory(getPlayer()) and _container:getType() ~= "floor" then
                _container:addItemOnServer(_item)
            end
        end
    end
end

---ItemContainer是否包含满足条件的的InventoryItem
function QNW_QNWL_AUtil.containsItemByFunction(_function, _container, _recurse)
    if not _container then
        return false
    end
    if _recurse == nil then
        _recurse = true
    end
    if _recurse then
        return _container:containsEvalRecurse(_function)
    else
        return _container:containsEval(_function)
    end
end

---ItemContainer是否包含指定type的InventoryItem
function QNW_QNWL_AUtil.containsItemByType(_type, _container, _recurse)
    if instanceof(_type, "InventoryItem") then
        _type = _type:getFullType()
    end
    if type(_type) == "string" then
        return this.containsItemByFunction(function(_item)
            return _item:getFullType() == _type
        end, _container, _recurse)
    end
end

---ItemContainer是否包含指定tag的InventoryItem
function QNW_QNWL_AUtil.containsItemByTag(_tag, _container, _recurse)
    if not _container then
        return false
    end
    if type(_tag) == "string" then
        if _recurse == nil then
            _recurse = true
        end
        if _recurse then
            return _container:containsTagRecurse(_tag)
        else
            return _container:containsTag(_tag)
        end
    end
end

---玩家库存+战利品是否包含指定tag的InventoryItem
function QNW_QNWL_AUtil.getPlayerInventoryAndLootContainsItemByTag(_player, _tag)
    for _, v in pairs(this.getPlayerInventoryAndLootContainers(_player)) do
        if this.containsItemByTag(_tag, v) then
            return true
        end
    end
    return false
end

---玩家库存+战利品是否包含指定type的InventoryItem
function QNW_QNWL_AUtil.getPlayerInventoryAndLootContainsItemByType(_player, _type)
    for _, v in pairs(this.getPlayerInventoryAndLootContainers(_player)) do
        if this.containsItemByType(_type, v) then
            return true
        end
    end
    return false
end

---ItemContainer所有满足条件的InventoryItem
function QNW_QNWL_AUtil.getAllItemByFunction(_function, _container, _recurse)
    if not _container then
        return {}
    end
    if _recurse == nil then
        _recurse = true
    end
    if _recurse then
        return this.listToTable(_container:getAllEvalRecurse(_function))
    else
        return this.listToTable(_container:getAllEval(_function))
    end
end

---ItemContainer所有InventoryItem
function QNW_QNWL_AUtil.getAllItem(_container, _recurse)
    return this.getAllItemByFunction(function(_)
        return true
    end, _container, _recurse)
end

---ItemContainer所有指定type的InventoryItem
function QNW_QNWL_AUtil.getAllItemByType(_type, _container, _recurse)
    if instanceof(_type, "InventoryItem") then
        _type = _type:getFullType()
    end
    if type(_type) == "string" then
        return this.getAllItemByFunction(function(_item)
            return _item:getFullType() == _type
        end, _container, _recurse)
    end
end

---ItemContainer所有是否损坏的InventoryItem
function QNW_QNWL_AUtil.getAllItemByBroken(_broken, _container, _recurse)
    return this.getAllItemByFunction(function(_item)
        return _item:isBroken() == _broken
    end, _container, _recurse)
end

---玩家库存+战利品所有的InventoryItem
function QNW_QNWL_AUtil.getPlayerInventoryAndLootAllItem(_player)
    local items = {}
    if not _player then
        return items
    end

    for _, v in pairs(this.getPlayerInventoryAndLootContainers(_player)) do
        this.tableInsertAll(items, this.getAllItem(v))
    end
    return items
end

---玩家库存+战利品所有指定type的InventoryItem
function QNW_QNWL_AUtil.getPlayerInventoryAndLootAllItemByType(_player, _type)
    local items = {}
    if not _player then
        return items
    end
    for _, v in pairs(this.getPlayerInventoryAndLootContainers(_player)) do
        this.tableInsertAll(items, this.getAllItemByType(_type, v))
    end
    return items
end

---玩家库存+战利品所有是否损坏的InventoryItem
function QNW_QNWL_AUtil.getPlayerInventoryAndLootAllItemByBroken(_player, _broken)
    local items = {}
    if not _player then
        return items
    end
    for _, v in pairs(this.getPlayerInventoryAndLootContainers(_player)) do
        this.tableInsertAll(items, this.getAllItemByBroken(_broken, v))
    end
    return items
end

---table插入
function QNW_QNWL_AUtil.tableInsert(_table, _value)
    table.insert(_table, _value)
end

---table插入所有
function QNW_QNWL_AUtil.tableInsertAll(_table, _values)
    for _, v in pairs(_values) do
        table.insert(_table, v)
    end
end

---table过滤
function QNW_QNWL_AUtil.tableFilter(_table, _filter)
    local t = {}
    for _, v in pairs(_table) do
        if _filter(v) then
            table.insert(t, v)
        end
    end
    return t
end

---table过滤第一个
function QNW_QNWL_AUtil.tableFilterFirst(_table, _filter)
    for _, v in pairs(_table) do
        if _filter(v) then
            return v
        end
    end
end

---table截取
function QNW_QNWL_AUtil.tableCut(_table, _length)
    local t = {}
    local l = 0
    for _, v in pairs(_table) do
        if l < _length then
            table.insert(t, v)
            l = l + 1
        end
    end
    return t
end

---table长度
function QNW_QNWL_AUtil.tableLength(_table)
    local count = 0
    for _, _ in pairs(_table) do
        count = count + 1
    end
    return count
end

---table包含
function QNW_QNWL_AUtil.tableContains(_table, _value, _function)
    for _, v in pairs(_table) do
        if _function then
            if _function(v, _value) then
                return true
            end
        else
            if _value == v then
                return true
            end
        end
    end
    return false
end

---table包含Key
function QNW_QNWL_AUtil.tableContainsKey(_table, _key, _function)
    for k, _ in pairs(_table) do
        if _function then
            if _function(k, _key) then
                return true
            end
        else
            if _key == k then
                return true
            end
        end
    end
    return false
end

---table复制
function QNW_QNWL_AUtil.tableCopy(_table, _deep)
    local new = {}
    for k, v in pairs(_table) do
        if type(v) == "table" and _deep then
            new[k] = this.tableCopy(v)
        else
            new[k] = v
        end
    end
    return new
end

---table获得第几个
function QNW_QNWL_AUtil.tableIndex(_table, _index)
    local num = 1
    for _, v in pairs(_table) do
        if num == _index then
            return v
        end
        num = num + 1
    end
end

---获取玩家战利品容器
function QNW_QNWL_AUtil.getPlayerLootContainers(_player)
    local containers = {}
    if not _player then
        return containers
    end
    for _, v in pairs(getPlayerLoot(_player:getPlayerNum()).inventoryPane.inventoryPage.backpacks) do
        table.insert(containers, v.inventory)
    end
    return containers
end

---获取玩家库存容器
function QNW_QNWL_AUtil.getPlayerInventoryContainers(_player)
    local containers = {}
    if not _player then
        return containers
    end
    for _, v in pairs(getPlayerInventory(_player:getPlayerNum()).inventoryPane.inventoryPage.backpacks) do
        table.insert(containers, v.inventory)
    end
    return containers
end

---获取玩家库存+战利品容器
function QNW_QNWL_AUtil.getPlayerInventoryAndLootContainers(_player)
    local containers = {}
    if not _player then
        return containers
    end
    this.tableInsertAll(containers, this.getPlayerInventoryContainers(_player))
    this.tableInsertAll(containers, this.getPlayerLootContainers(_player))
    return containers
end

---刷新玩家库存+战利品容器
function QNW_QNWL_AUtil.refreshPlayerBackpacks(_player)
    getPlayerInventory(_player:getPlayerNum()):refreshBackpacks()
    getPlayerLoot(_player:getPlayerNum()):refreshBackpacks()
end

---为物品指定与某物品刷新一致
function QNW_QNWL_AUtil.copyProceduralDistributions(_source, _target)
    for k1, v1 in pairs(ProceduralDistributions.list) do
        if v1 and v1.items then
            local temp  = {}
            local temp2 = {}
            for i2, v2 in ipairs(v1.items) do
                if v2 == _target then
                    table.insert(temp, k1)
                    table.insert(temp2, v1.items[i2 + 1])
                end
            end
            for i3, v3 in pairs(temp) do
                table.insert(ProceduralDistributions.list[v3].items, _source)
                table.insert(ProceduralDistributions.list[v3].items, temp2[i3])
            end
        end
    end
end

---获取当前鼠标位置坐标
function QNW_QNWL_AUtil.getCoordsByMouse()
    local x      = getMouseXScaled()
    local y      = getMouseYScaled()
    local z      = getPlayer():getZ()
    local wx, wy = ISCoordConversion.ToWorld(x, y, z)
    wx           = math.floor(wx)
    wy           = math.floor(wy)
    return x, y, z, wx, wy, z
end

---获得指定位置IsoCell、IsoGridSquare、IsoObject
function QNW_QNWL_AUtil.getCellAndSquareAndObjects(_wx, _wy, _wz)
    local cell = getWorld():getCell()
    local sq   = cell:getGridSquare(_wx, _wy, _wz)
    if not sq then
        return cell, sq, {}
    end
    return cell, sq, this.listToTable(sq:getObjects())
end

---获得鼠标位置IsoCell、IsoGridSquare、IsoObject
function QNW_QNWL_AUtil.getCellAndSquareAndObjectsByMouse()
    local _, _, _, wx, wy, wz = this.getCoordsByMouse()
    return this.getCellAndSquareAndObjects(wx, wy, wz)
end

---点是否在多边形内
function QNW_QNWL_AUtil.isInPolygon(_point, _points)
    if #_points < 3 then
        return false
    end
    local j         = #_points
    local crossings = 0
    for i = 1, #_points do
        local pi    = _points[i]
        local pj    = _points[j]

        local cond1 = (_point.x > pi.x) and (_point.x <= pj.x)
        local cond2 = (_point.x > pj.x) and (_point.x <= pi.x)
        if cond1 or cond2 then
            local slope = (pj.y - pi.y) / (pj.x - pi.x)
            local above = (_point.y < slope * (_point.x - pi.x) + pi.y)
            if above then
                crossings = crossings + 1
            end
        end
        j = i
    end
    return crossings % 2 ~= 0
end

---传送到坐标
function QNW_QNWL_AUtil.deliver(_player, _x, _y, _z)
    print(_x)
    print(_y)
    print(_z)
    _player:setX(_x)
    _player:setY(_y)
    _player:setZ(_z)
    _player:setLx(_player:getX())
    _player:setLy(_player:getY())
    _player:setLz(_player:getZ())
end

---传送到IsoGridSquare
function QNW_QNWL_AUtil.deliverBySquare(_player, _square)
    this.deliver(_player, _square:getX() + 0.5, _square:getY() + 0.5, _square:getZ())
end

---获取IsoGridSquare通过IsoGridSquare和偏移
function QNW_QNWL_AUtil.getSquareByOffset(_square, _offsetX, _offsetY, _offsetZ)
    local _, square = this.getCellAndSquareAndObjects(_square:getX() + _offsetX, _square:getY() + _offsetY, _square:getZ() + _offsetZ)
    return square
end

function QNW_QNWL_AUtil.squareEquals(_square1, _square2)
    if not _square1 or not _square2 then
        return false
    end
    if _square1:getX() ~= _square2:getX() then
        return false
    end
    if _square1:getY() ~= _square2:getY() then
        return false
    end
    if _square1:getZ() ~= _square2:getZ() then
        return false
    end
    return true
end
