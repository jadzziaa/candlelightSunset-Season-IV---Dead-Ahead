local function onDumpTruck(player, vehicle)
    --player:Say("welp, it's all gone now!")
	local TrashBox = vehicle:getPartById("TruckBed"):getItemContainer()
	
	--see if there's a zombie in there.
	local hasZed = TrashBox:contains("CorpseMale", true)
	local Boxtype = ""
	-- set up which box were doing.
	if hasZed then
		Boxtype = tostring("TrashCubes_3")
	else
		Boxtype = tostring("TrashCubes_0")
	end

    local CurrentWeight = TrashBox:getCapacityWeight()
    local MaxWeight = TrashBox:getMaxWeight()/2
    if CurrentWeight > MaxWeight then
        vehicle:playSound("TrashCubePoop")
        local square = getPlayer():getSquare()
        local sprite_type = Boxtype 
        if not sprite_type then
            print("NO SPRITE TYPE!")
            return false
        end        
        local newSprite = (IsoObject.new(getCell(), square, sprite_type))    
        if not newSprite then
            print("NO NEW SPRITE!")
            return false
        end    
        if newSprite and newSprite:getProperties() then 
            if newSprite:getProperties():Val("ContainerType") or newSprite:getProperties():Val("container") then
                newSprite:createContainersFromSpriteProperties()                
            end
        end
        square:getObjects():add(newSprite)
        square:RecalcProperties()
    end
    local items = TrashBox:getItems()

    for item_id = items:size() - 1, 0, -1 do
        local item = items:get(item_id)
        TrashBox:Remove(item)
        TrashBox:removeItemOnServer(item)
    end
end

local function onSubmenu(menu, args)
    menu:addSlice("Yes", getTexture("media/ui/emotes/thumbup_green.png"), onDumpTruck, args[1], args[2]) 
end

VehicleMenuAPI.registerSliceOutside("EmptyTrash", function(menu, player, vehicle)
    if vehicle:getScript() and vehicle:getScriptName() == "Base.GarbageTruck" then
        if not vehicle:getPartById("TruckBed"):getItemContainer():getItems():isEmpty()  then
            menu:addSlice("Destroy Trash", getTexture("media/ui/icons/emptytruck.png"), ISRadialMenu.createSubMenu, menu, onSubmenu, {player, vehicle}) 
        end
    end
end)