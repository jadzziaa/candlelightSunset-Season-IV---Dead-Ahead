local function onGameStart()
    local player = getPlayer()
    local container = player:getInventory()
    for j=1,container:getItems():size() do
        local item = container:getItems():get(j-1)
        local type = item:getType()
        print(type)

        if type == "Shotgun" then
            if item:getStock() ~= nil and item:getStock():getType() == "FiberglassStock" then
                item:setWeaponSprite("ShotgunFGS")
            end
        elseif type == "ShotgunSawnoff" then
            if item:getStock() ~= nil and item:getStock():getType() == "FiberglassStock" then
                item:setWeaponSprite("ShotgunSawnoffFGS")
            end
        end
    end
    player:resetEquippedHandsModels()
end

Events.OnGameStart.Add(onGameStart)


local function onEquipPrimary(player, item)
    if item == nil then return end
    local type = item:getType()
    if type == "Shotgun" then
        if item:getStock() ~= nil and item:getStock():getType() == "FiberglassStock" then
            item:setWeaponSprite("ShotgunFGS")
        end
    elseif type == "ShotgunSawnoff" then
        if item:getStock() ~= nil and item:getStock():getType() == "FiberglassStock" then
            item:setWeaponSprite("ShotgunSawnoffFGS")
        end
    end
    player:resetEquippedHandsModels()
end

Events.OnEquipPrimary.Add(onEquipPrimary)