if isClient() then return end

-------------------------------------------------------------------------------
DWF_Walls = {}

local high_wooden_fancy_wall = {}
high_wooden_fancy_wall.start_north = "fencing_01_08"        -- NorthWall
high_wooden_fancy_wall.north = "fencing_01_09"        -- NorthWall
high_wooden_fancy_wall.west =  "fencing_01_10"        -- WestWall
high_wooden_fancy_wall.end_west = "fencing_01_11"       -- WestWall
high_wooden_fancy_wall.north_west_corner = "fencing_01_12"        -- NorthWestCorner
high_wooden_fancy_wall.south_east_corner =  "fencing_01_13"        -- SouthEastCorner
high_wooden_fancy_wall.is_transparent = false
table.insert(DWF_Walls, high_wooden_fancy_wall)


local high_metallic_barbed_fence = {}
high_metallic_barbed_fence.start_north = "fencing_01_48"        -- NorthWall
high_metallic_barbed_fence.north = "fencing_01_49"        -- NorthWall
high_metallic_barbed_fence.west =  "fencing_01_50"        -- WestWall
high_metallic_barbed_fence.end_west = "fencing_01_51"       -- WestWall
high_metallic_barbed_fence.north_west_corner = "fencing_01_52"        -- NorthWestCorner
high_metallic_barbed_fence.is_transparent = true
table.insert(DWF_Walls, high_metallic_barbed_fence)

local high_metallic_fence = {}
high_metallic_fence.start_north = "fencing_01_56"        -- NorthWall
high_metallic_fence.north = "fencing_01_57"        -- NorthWall
high_metallic_fence.west =  "fencing_01_58"        -- WestWall
high_metallic_fence.end_west = "fencing_01_59"       -- WestWall
high_metallic_fence.north_west_corner = "fencing_01_60"        -- NorthWestCorner
high_metallic_fence.is_transparent = true
table.insert(DWF_Walls, high_metallic_fence)

local high_metallic_fancy_fence = {}
high_metallic_fancy_fence.start_north = "fencing_01_64"        -- NorthWall
high_metallic_fancy_fence.north = "fencing_01_65"        -- NorthWall
high_metallic_fancy_fence.west =  "fencing_01_66"        -- WestWall
high_metallic_fancy_fence.end_west = "fencing_01_67"       -- WestWall
high_metallic_fancy_fence.north_west_corner = "fencing_01_68"        -- NorthWestCorner
high_metallic_fancy_fence.is_transparent = true
table.insert(DWF_Walls, high_metallic_fancy_fence)

local high_wooden_wall = {}
high_wooden_wall.north = "fencing_01_73"        -- NorthWall
high_wooden_wall.west =  "fencing_01_72"        -- WestWall
high_wooden_wall.north_west_corner = "fencing_01_75"        -- NorthWestCorner
high_wooden_wall.south_east_corner =  "fencing_01_74"        -- SouthEastCorner
high_wooden_wall.is_transparent = false
table.insert(DWF_Walls, high_wooden_wall)

local high_metallic_military_fence = {}
high_metallic_military_fence.start_north = "fencing_01_80"        -- NorthWall
high_metallic_military_fence.north = "fencing_01_81"        -- NorthWall
high_metallic_military_fence.west =  "fencing_01_82"        -- WestWall
high_metallic_military_fence.end_west = "fencing_01_83"       -- WestWall
high_metallic_military_fence.north_west_corner = "fencing_01_84"        -- NorthWestCorner
high_metallic_military_fence.is_transparent = true
table.insert(DWF_Walls, high_metallic_military_fence)

local high_metallic_military_barbed_fence = {}
high_metallic_military_barbed_fence.start_north = "fencing_01_88"        -- NorthWall
high_metallic_military_barbed_fence.north = "fencing_01_89"        -- NorthWall
high_metallic_military_barbed_fence.west =  "fencing_01_90"        -- WestWall
high_metallic_military_barbed_fence.end_west = "fencing_01_91"       -- WestWall
high_metallic_military_barbed_fence.north_west_corner = "fencing_01_92"        -- NorthWestCorner
high_metallic_military_barbed_fence.is_transparent = true
table.insert(DWF_Walls, high_metallic_military_barbed_fence)









-- To make it faster, make another table with a clear reference to each fencing so that we can link it easier to the correct tile
DWF_CheckTable = {}


local high_wooden_fancy_wall_check = {
    fencing_01_08 = true,        -- NorthWall
    fencing_01_09 = true,        -- NorthWall
    fencing_01_10 = true,        -- WestWall
    fencing_01_11 = true,        -- WestWall
    fencing_01_12 = true,        -- NorthWestCorner
    fencing_01_13 = true,        -- SouthEastCorner
	parameters = {
		health =  SandboxVars.DWF.HealthHighWoodenFancyWall,
	}
}
table.insert(DWF_CheckTable, high_wooden_fancy_wall_check)

local high_metallic_barbed_fence_check = {
	fencing_01_48 = true,      -- NorthWallTrans
    fencing_01_49 = true,        -- NorthWallTrans
    fencing_01_50 = true,        -- WestWallTrans
    fencing_01_51 = true,        -- WestWallTrans
    fencing_01_52 = true,        -- NorthWestCornerTrans
    fencing_01_53 = true,        -- None
	parameters = {
		health = SandboxVars.DWF.HealthHighMetallicBarbedFence,
		sound_thump_string = "ZombieThumpMetal"
	}
}
table.insert(DWF_CheckTable, high_metallic_barbed_fence_check)


local high_metallic_fence_check = {
	fencing_01_56 = true,      -- NorthWallTrans
    fencing_01_57 = true,        -- NorthWallTrans
    fencing_01_58 = true,        -- WestWallTrans
    fencing_01_59 = true,        -- WestWallTrans
    fencing_01_60 = true,        -- NorthWestCornerTrans
    fencing_01_61 = true,        -- None
	parameters = {
		health = SandboxVars.DWF.HealthHighMetallicFence,
		sound_thump_string = "ZombieThumpMetal"
	}
}
table.insert(DWF_CheckTable, high_metallic_fence_check)


local high_metallic_fancy_fence_check = {
	fencing_01_64 = true,      -- NorthWallTrans
    fencing_01_65 = true,        -- NorthWallTrans
    fencing_01_66 = true,        -- WestWallTrans
    fencing_01_67 = true,        -- WestWallTrans
    fencing_01_68 = true,        -- NorthWestCornerTrans
    fencing_01_69 = true,        -- None
	parameters = {
		health = SandboxVars.DWF.HealthHighMetallicFancyFence,
		sound_thump_string = "ZombieThumpMetal"
	}
}
table.insert(DWF_CheckTable, high_metallic_fancy_fence_check)

local high_wooden_wall_check = {
	fencing_01_72 = true,
    fencing_01_73 = true,
    fencing_01_74 = true,
    fencing_01_75 = true,
	parameters = {
		health = SandboxVars.DWF.HealthHighWoodenWall,
	}
}
table.insert(DWF_CheckTable, high_wooden_wall_check)

local high_metallic_military_fence_check = {
	fencing_01_80 = true,
    fencing_01_81 = true,
    fencing_01_82 = true,
    fencing_01_83 = true,
    fencing_01_84 = true,
	parameters = {
		health = SandboxVars.DWF.HealthHighMetallicMilitaryFence,
		sound_thump_string = "ZombieThumpMetal"
	}
}
table.insert(DWF_CheckTable, high_metallic_military_fence_check)

local high_metallic_military_barbed_fence_check = {
	fencing_01_88 = true,
    fencing_01_89 = true,
    fencing_01_90 = true,
    fencing_01_91 = true,
    fencing_01_92 = true,
	parameters = {
		health = SandboxVars.DWF.HealthHighMetallicMilitaryBarbedFence,
		sound_thump_string = "ZombieThumpMetal"
	}
}
table.insert(DWF_CheckTable, high_metallic_military_barbed_fence_check)

----------------------------------------------------------------------------------

local function GetWallSprites(wall_def)
	local sprites = {}
	table.insert(sprites, wall_def.sprite)

	if wall_def.start_north then table.insert(sprites, wall_def.start_north) end
	if wall_def.north then table.insert(sprites, wall_def.north) end
    if wall_def.west then table.insert(sprites, wall_def.west) end
    if wall_def.end_west then table.insert(sprites, wall_def.end_west) end
    if wall_def.north_west_corner then table.insert(sprites, wall_def.north_west_corner) end
    if wall_def.south_east_corner then table.insert(sprites, wall_def.south_east_corner) end

	return sprites
end

local function removeExistingLuaObject(square)
	local luaObject = DWF_WallSystem.instance:getLuaObjectOnSquare(square)
	if luaObject then
		DWF_WallSystem.instance:removeLuaObject(luaObject)
	end
end

-- Returns def and if is north faced
local function GetWallDefFromSprite(spriteName)

	-- TODO do we need this?
	if not spriteName then return nil end
	for _, wall_def in pairs(DWF_Walls) do
		if wall_def.west == spriteName or
			wall_def.end_west == spriteName or
			wall_def.south_east_corner == spriteName then
			return wall_def, false
		end
		if wall_def.north == spriteName or
			wall_def.north_west_corner == spriteName or
			wall_def.start_north == spriteName then
			return wall_def, true
		end
	end
	return nil,false
end


---@param sprite_name string
---@param java_object IsoThumpable
local function SetSpecificAttributes(sprite_name, java_object)
	for _, v in pairs(DWF_CheckTable) do
        if v[sprite_name] then
			if v.parameters.health then
				java_object:setMaxHealth(v.parameters.health)
				java_object:setHealth(v.parameters.health)
			end

			if v.parameters.sound_thump_string then
				java_object:setThumpSound(v.parameters.sound_thump_string)
			end

			break
			
        end
    end
end


---@param sprite_name string
---@param north boolean
local function CreateWall(sq, sprite_name, north)
	local modData = {}
	
	local cell = getWorld():getCell()
	--local north = false
	local javaObject = IsoThumpable.new(cell, sq, sprite_name, north, modData)

	javaObject:setCanPassThrough(false)
	javaObject:setCanBarricade(false)
	javaObject:setIsContainer(false)
	javaObject:setIsDoor(false)
	javaObject:setIsDoorFrame(false)
	javaObject:setCrossSpeed(1.0)				-- maybe we should get the og object and reassign it?
	javaObject:setBlockAllTheSquare(false)		-- Really important
	javaObject:setName("Wall")
	javaObject:setIsDismantable(true)			-- probably overwritten elsewhere, who cares again
	javaObject:setCanBePlastered(false)

	-- FIXME if is hoppable it'll break thupmable... and it doesnt overwrite anyway so who cares
	javaObject:setIsHoppable(false)			-- TODO Make exception for barbed wire fences
	javaObject:setIsThumpable(true)
	javaObject:setModData(copyTable(modData))



	javaObject:setThumpDmg(1)
	SetSpecificAttributes(sprite_name, javaObject)



	javaObject:setSpecialTooltip(false)
	
    triggerEvent("OnObjectAdded", javaObject)

	return javaObject
end


local function NewWall(isoObject)
	local sprite_name = isoObject:getSprite():getName()
    local wall_def, north = GetWallDefFromSprite(sprite_name)

	if not wall_def then return end
	if north == nil then return end

	local sq = isoObject:getSquare()
	removeExistingLuaObject(sq)
	
	local javaObject = CreateWall(sq, isoObject:getSprite():getName(), north)
	local index = isoObject:getObjectIndex()
	sq:transmitRemoveItemFromSquare(isoObject)
	sq:AddSpecialObject(javaObject, index)
	
	--initObjectModData(javaObject, wall_def, north)

	javaObject:transmitCompleteItemToClients()
	return javaObject
end

local PRIORITY = 5			-- TODO not sure about this, maybe priority = 1 causes more stutters?

local function LoadWall(isoObject)
	local spriteName = isoObject:getSprite():getName()
	local wall_def = GetWallDefFromSprite(spriteName)
	if not wall_def then return end
	if not instanceof(isoObject, "IsoThumpable") then
		isoObject = NewWall(isoObject)
	end
	DWF_WallSystem.instance:loadIsoObject(isoObject)
end



-- Run in background when loading chunks
for _, wall_def in pairs(DWF_Walls) do
	local sprites = GetWallSprites(wall_def)

	MapObjects.OnNewWithSprite(sprites, NewWall, PRIORITY)
	MapObjects.OnLoadWithSprite(sprites, LoadWall, PRIORITY)
end
