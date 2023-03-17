-- Cheat Menu: Rebirth
-- Version: 1.1.0
-- Developer: RelationLife (https://steamcommunity.com/id/relationlife)
-- Original Developer: dude person (https://steamcommunity.com/id/123ii854734653463)


CheatCoreCM = CheatCoreCM or {}
require "CheatMenuRebirth/Terraform/CheatMenuTerraformTiles"


CheatCoreCM.PZVersion = tonumber(string.match(getCore():getVersionNumber(), "%d+")) -- checks game version
CheatCoreCM.MasterKey = false
CheatCoreCM.EventDisableKey = 0

-- Terrain setting initialization-
CheatCoreCM.DoNotFill = false
CheatCoreCM.DeleteWithoutWall = false
CheatCoreCM.DeleteWithoutDoorWindow = false
CheatCoreCM.DeleteWithCorpse = false
CheatCoreCM.DeleteWithZombie = false
CheatCoreCM.DoLuaChecksum = nil
CheatCoreCM.DeathMessage = 0

local Ori_MinDamage, Ori_MaxDamage, Ori_DoorDamage, Ori_TreeDamage, CMWeaponName, CMWeaponOldName, Ori_RecoilDelay

function CheatCoreCM.checkFile(modID, fileName)
	local readFile = getModFileReader(modID, fileName, true)
	local scanLine = readFile:readLine()
    if not scanLine or not readFile then
        local writeFile = getModFileWriter(modID, fileName, true, false)
        writeFile:write("{}")
        writeFile:close()
    end
end


function CheatCoreCM.readFile(modID, fileName)
	local fileTable = {}
	local readFile = getModFileReader(modID, fileName, true)
	local scanLine = readFile:readLine()
	while scanLine do
		fileTable[#fileTable+1] = scanLine
		scanLine = readFile:readLine()
		if not scanLine then break end
	end
	readFile:close()
	return fileTable
end

function CheatCoreCM.writeFile(tableToWrite, modID, fileName)
	local writeFile = getModFileWriter(modID, fileName, true, false)
	for i = 1,#tableToWrite do
		writeFile:write(tableToWrite[i].."\r\n");
	end
	writeFile:close();
end

function CheatCoreCM.doRound(number)
	return number % 1 >= 0.5 and math.ceil(number) or math.floor(number)
end

function CheatCoreCM.enumJavaArray(array)
	local tbl = {}
	for i = array:size() - 1, 0, -1 do
		local obj = array:get(i)
		table.insert(tbl, obj)
	end
	return tbl
end


function CheatCoreCM.HandleToggle(DisplayName, VariableToToggle, ...) 
	if VariableToToggle ~= nil then
		local VariableToToggle = string.gsub(VariableToToggle, "CheatCoreCM.", "") 
		_G.CheatCoreCM[VariableToToggle] = not _G.CheatCoreCM[VariableToToggle]
		--print(VariableToToggle)
		
		local gvar = _G.CheatCoreCM[VariableToToggle]
		if VariableToToggle == "IsGod" or "IsGhost" then 
			--print("is " .. VariableToToggle) -- debug stuff
			_G.getPlayer():getModData()[VariableToToggle] = gvar 
			--print(_G.getPlayer():getModData()[VariableToToggle])
		end
			
		
		
		if DisplayName ~= nil then
			getPlayer():Say(DisplayName.. (gvar == true and getText("UI_CMRB_Message_IsEnabled") or getText("UI_CMRB_Message_IsDisabled")) )
		end
	end
	local args = {...} 
	if #args > 0 then
		for i = 1,#args do
			if type(args[i]) == "string" then
				loadstring(args[i])()
			else
				pcall(args[i])
			end
		end
	end
end

function CheatCoreCM.HandleCheck(variableToCheck, cheatName, optionalSecondVariable, optionalCheatName) 
	local sayString = {}
	if loadstring("return "..variableToCheck)() ~= true then 
		loadstring(variableToCheck.." = true")()
		table.insert(sayString, cheatName)
	end
	if optionalSecondVariable ~= nil then 
		if loadstring("return "..optionalSecondVariable)() ~= true then
			loadstring(optionalSecondVariable.." = true")()
			table.insert(sayString, optionalCheatName)
		end
	end
	if #sayString > 1 then
		getPlayer():Say(cheatName..getText("UI_CMRB_Message_And")..optionalCheatName..getText("UI_CMRB_Message_IsEnabled"))
	elseif #sayString == 1 then
		getPlayer():Say(cheatName..getText("UI_CMRB_Message_IsEnabled"))
	end
end
 

function CheatCoreCM.getMouseCoords()
	local x = getMouseXScaled();
	local y = getMouseYScaled();
	local z, wz = getPlayer():getZ();
	local wx, wy = ISCoordConversion.ToWorld(x, y, z);
	wx = math.floor(wx);
	wy = math.floor(wy);
	return x, y, z, wx, wy
end

function CheatCoreCM.OnClick()
	local mx, my, wz, wx, wy = CheatCoreCM.getMouseCoords()

	if CheatCoreCM.IsSelect == true then
		local player = getPlayer();
		--local vehicle = getNearVehicle()
		local cell = getWorld():getCell();
		local sq = cell:getGridSquare(wx, wy, wz)
		local vehicle = sq:getVehicleContainer()
		if vehicle ~= nil then
			CheatCoreCM.SelectedVehicle = vehicle
			CheatCoreCM.Parts = {}
			for i = vehicle:getPartCount()-1,0,-1 do
				local part = vehicle:getPartByIndex(i)
				local cat = part:getCategory() or "Other"
				local item = part:getId()
				if type(CheatCoreCM.Parts[cat]) ~= "table" then
					CheatCoreCM.Parts[cat] = {}
				end
				CheatCoreCM.Parts[cat][item] = part
				if i == (vehicle:getPartCount() - 1) then
					CheatCoreCM.IsReady = true 
				end
			end
			local name = getText("IGUI_VehicleName" .. vehicle:getScript():getName()) 
            CheatCoreCM.IsSelect = false
			getPlayer():Say(getText("IGUI_VehicleName" .. vehicle:getScript():getName()) .. getText("UI_CMRB_Message_VehicleSelected"))
		end
	end
end


function CheatCoreCM.getSqObjs()
	local mx, my, wz, wx, wy = CheatCoreCM.getMouseCoords()
	--[[
	local mx = getMouseXScaled();
	local my = getMouseYScaled();
	local wz = getPlayer():getZ();
	local wx, wy = ISCoordConversion.ToWorld(mx, my, wz);
	wx = math.floor(wx);
	wy = math.floor(wy);
	--]]
	local cell = getWorld():getCell();
	local sq = cell:getGridSquare(wx, wy, wz);
	if sq == nil then return false; end
	local sqObjs = sq:getObjects();
	local sqSize = sqObjs:size();
	local tbl = {}
	for i = sqSize-1, 0, -1 do -- enumerate square objects and pack them into a table
		local obj = sqObjs:get(i);
		table.insert(tbl, obj)
	end
	return sq, sqObjs, tbl, cell, obj
end


CheatCoreCM.CM_TempCoord = nil;
function CheatCoreCM.OnKeyKeepPressed(_keyPressed)

	if CheatCoreCM.FireBrushEnabled == true then
		local GridToBurn = CheatCoreCM.getSqObjs()
		if _keyPressed == 49 then
			GridToBurn:StartFire();
		elseif _keyPressed == 33 then
			GridToBurn:stopFire()
			if isClient() then
				GridToBurn:transmitStopFire()
			end
		end
	end
   
   
	if CheatCoreCM.IsDelete == true and _keyPressed == 45 then
		local sq, sqObjs, objTbl, cell = CheatCoreCM.getSqObjs()
		
		if not sq then return end
        if CheatCoreCM.DeleteWithCorpse then
            if sq:getDeadBody() then
                sq:removeCorpse(sq:getDeadBody(), false)
            end
        end
        
         if CheatCoreCM.DeleteWithZombie then
         local zombieobject = sq:getZombie()
           if zombieobject then
                zombieobject:removeFromWorld()
                zombieobject:removeFromSquare()
            end
        end
        
		local z = getPlayer():getZ()
		local WindowCheck = 0
		for i = 1, #objTbl do
			local obj = objTbl[i]

            local sprite = obj:getSprite()
            local props = sprite:getProperties()
            local names = props:getPropertyNames()
            
            local WallCheck = tostring(obj:getType()) or nil
            local CustomName = props:Val("CustomName")
            local WindowN = props:Val("WindowN")
            local WindowW = props:Val("WindowW")
            
            if instanceof(obj, "IsoDoor") or instanceof(obj, "IsoWindow") or instanceof(obj, "IsoThumpable") then
                WindowCheck = 1
            else
                WindowCheck = 0
            end
            
            
			if sprite and sprite:getProperties():Is(IsoFlagType.solidfloor) ~= true then 
				local stairObjects = buildUtil.getStairObjects(obj)
				if #stairObjects > 0 then
					for i=1,#stairObjects do
						if isClient() then
							sledgeDestroy(stairObjects[i])
						else
							stairObjects[i]:getSquare():RemoveTileObject(stairObjects[i])
						end
					end
				else
					if isClient() then
                        if (CheatCoreCM.DeleteWithoutWall and WallCheck ~= "wall") and (WindowCheck == 0 and CheatCoreCM.DeleteWithoutDoorWindow) then
                            sledgeDestroy(obj)
                        elseif (CheatCoreCM.DeleteWithoutWall and WallCheck ~= "wall") and not CheatCoreCM.DeleteWithoutDoorWindow then
                            sledgeDestroy(obj)
                        elseif (WindowCheck == 0 and CheatCoreCM.DeleteWithoutDoorWindow) and not CheatCoreCM.DeleteWithoutWall then
                            sledgeDestroy(obj)
                        elseif not CheatCoreCM.DeleteWithoutWall and not CheatCoreCM.DeleteWithoutDoorWindow then
                            sledgeDestroy(obj)
                        end
					else
                      
                        if (CheatCoreCM.DeleteWithoutWall and WallCheck ~= "wall") and (WindowCheck == 0 and CheatCoreCM.DeleteWithoutDoorWindow) then
                            sq:RemoveTileObject(obj);
                            --sq:DeleteTileObject​(obj);
                            sq:getSpecialObjects():remove(obj);
                            sq:getObjects():remove(obj);
                        elseif (CheatCoreCM.DeleteWithoutWall and WallCheck ~= "wall") and not CheatCoreCM.DeleteWithoutDoorWindow then
                            sq:RemoveTileObject(obj);
                            --sq:DeleteTileObject​(obj);
                            sq:getSpecialObjects():remove(obj);
                            sq:getObjects():remove(obj);
                        elseif (WindowCheck == 0 and CheatCoreCM.DeleteWithoutDoorWindow) and not CheatCoreCM.DeleteWithoutWall then
                            sq:RemoveTileObject(obj);
                            --sq:DeleteTileObject​(obj);
                            sq:getSpecialObjects():remove(obj);
                            sq:getObjects():remove(obj);
                        elseif not CheatCoreCM.DeleteWithoutWall and not CheatCoreCM.DeleteWithoutDoorWindow then
                            sq:RemoveTileObject(obj);
                            --sq:DeleteTileObject​(obj);
                            sq:getSpecialObjects():remove(obj);
                            sq:getObjects():remove(obj);
                        end
					end
				end
			end
		end
	end
    
	if CheatCoreCM.IsTerraforming == true and _keyPressed == 45 then
		local sq, sqObjs, objTbl, cell = CheatCoreCM.getSqObjs()

		--[[
		if sq == nil then
			sq = cell:createNewGridSquare(wx, wy, wz)
			cell:ConnectNewSquare(sq, false)
		end
		--]]
		if not sq then
			--print("[CHEAT MENU] Attempted to terraform non-existent square")
			return
		end
        
		local rand;
		if #CheatCoreCM.TerraformRanges > 1 then
			rand = ZombRand(CheatCoreCM.TerraformRanges[1],CheatCoreCM.TerraformRanges[2] + 1)
			if CheatCoreCM.BannedRanges ~= nil then
				for i = 1,#CheatCoreCM.BannedRanges do
					if rand == CheatCoreCM.BannedRanges[i] then
						rand = rand + ZombRand(1,2 + 1) <= CheatCoreCM.TerraformRanges[2] or rand - ZombRand(1,2 + 1)
					end
				end
			end
		else
			rand = CheatCoreCM.TerraformRanges[1]
		end
		
		local generatedTile = CheatCoreCM.Terraform..tostring(rand)
		local obj;
		local sprite;
       
		for i = 1, #objTbl do
			obj = objTbl[i]
			sprite = obj:getSprite()
            local spriteName = objTbl[i]:getTile()
            
			if sprite and sprite:getProperties():Is(IsoFlagType.solidfloor) then
				break
			end
		end
		
        
        local com1 = tostring(generatedTile)
        local com2 = tostring(spriteName)
        
       if sq ~= CheatCoreCM.CM_TempCoord then
		if not (CheatCoreCM.DoNotFill and not sq:getFloor()) then
			sq:addFloor(generatedTile)
            CheatCoreCM.CM_TempCoord = sq
            end
        end
    end
end


function CheatCoreCM.OnKeyPressed (_keyPressed, _key2)

    	if CheatCoreCM.ZombieBrushEnabled == true then
		local player = getPlayer();
        local mx, my, wz, wx, wy = CheatCoreCM.getMouseCoords()

		local versionNumber = tonumber(string.match(getCore():getVersionNumber(), "%d+")) -- saves version number to variable, for checking versions
		--if string.match(getCore():getVersionNumber(),"Vehicle Test") ~= nil then versionNumber = 32 end
        
		if versionNumber >= 41 and _keyPressed == 44 then -- spawnhorde spawns zombies naked on build 41
            if CheatCoreCM.ZombiesToSpawn ~= nil then
                if isClient() then
                    SendCommandToServer(string.format("/createhorde2 -x %d -y %d -z %d -count %d", wx, wy, wz, CheatCoreCM.ZombiesToSpawn))
                else
                    addZombiesInOutfit(wx,wy,wz,CheatCoreCM.ZombiesToSpawn, nil, nil)
                end
            else
                getPlayer():Say(getText("UI_CMRB_Message_NoZombieAmount"))
            end
		elseif versionNumber >= 32 and _keyPressed == 44 then -- zombie spawn function was changed in build 32
            if CheatCoreCM.ZombiesToSpawn ~= nil then
                spawnHorde(wx,wy,wx,wy,wz,CheatCoreCM.ZombiesToSpawn)
            else
                getPlayer():Say(getText("UI_CMRB_Message_NoZombieAmount"))
            end
		elseif versionNumber <= 31 and _keyPressed == 44 then
            if CheatCoreCM.ZombiesToSpawn ~= nil then
                for i = 1,CheatCoreCM.ZombiesToSpawn do
                    getVirtualZombieManager():createRealZombieNow(wx,wy,wz);
                end
            else
                getPlayer():Say(getText("UI_CMRB_Message_NoZombieAmount"))
            end
		end   
	end
    
      
    
	if CheatCoreCM.IsBarricade == true and _keyPressed == 44 then

        local sq, sqObjs = CheatCoreCM.getSqObjs()
		local sqSize = sqObjs:size();
		local planks = {}
		local worldobjects = sq:getWorldObjects()

		for i = sqSize-1, 0, -1 do
			local obj = sqObjs:get(i);
			if instanceof(obj, "BarricadeAble") then
				local barricade = IsoBarricade.AddBarricadeToObject(obj, getPlayer())
				local item; -- declared and defined within the local scope of each if statement, so that a single getPlayer():getInventory():Remove(item) call can be used to remove it.
				local numPlanks = barricade:getNumPlanks()
				
				if CheatCoreCM.BarricadeType == "metal" then
					item = getPlayer():getInventory():AddItem("Base.SheetMetal")
				else
					item = getPlayer():getInventory():AddItem("Base.Plank")
				end
				
				if CheatCoreCM.BarricadeLevel > numPlanks and not barricade:isMetal() then
					if CheatCoreCM.BarricadeType == "metal" then
						if not isClient() then
							barricade:addMetal(getPlayer(),item)
						else
							local args = {x=obj:getX(), y=obj:getY(), z=obj:getZ(), index=obj:getObjectIndex(), isMetal=true, itemID=item:getID(), condition=item:getCondition()}
							sendClientCommand(getPlayer(), 'object', 'barricade', args)
						end
					else
						for i = 1,CheatCoreCM.BarricadeLevel - numPlanks do
							if not isClient() then
								barricade:addPlank(getPlayer(),item)
							else
								local args = {x=obj:getX(), y=obj:getY(), z=obj:getZ(), index=obj:getObjectIndex(), isMetal=barricade:isMetal(), itemID=item:getID(), condition=item:getCondition()}
								sendClientCommand(getPlayer(), 'object', 'barricade', args)
							end
						end
					end
				else
					if barricade:isMetal() then
						barricade:removeMetal(getPlayer())
					else
						for i = 1,numPlanks - CheatCoreCM.BarricadeLevel do
							barricade:removePlank(getPlayer())
						end
					end
				end
				getPlayer():getInventory():Remove(item) -- remove the items used to barricade
                getPlayer():Say(getText("UI_CMRB_Message_BarricadeCreated"))
			end
		end
	end
 

	if CheatCoreCM.IsFly == true or getPlayer():getModData().IsFly == true then
		if CheatCoreCM.FlightHeight == nil then CheatCoreCM.FlightHeight = getPlayer():getZ() end 

		if _keyPressed == 200 and getPlayer():getZ() < 5 then 
			CheatCoreCM.FlightHeight = CheatCoreCM.FlightHeight + 1
		elseif _keyPressed == 208 and getPlayer():getZ() > 0 then
			CheatCoreCM.FlightHeight = CheatCoreCM.FlightHeight - 1
		end
	end
end

function CheatCoreCM.RemoveAllZombiesServer()
	SendCommandToServer(string.format("/removezombies -remove true"))
    getPlayer():Say(getText("UI_CMRB_Message_ZombieRemoveServer"))
end

function CheatCoreCM.RemoveAllZombiesClient()
local count = 0
	local zombies = getCell():getObjectList()
	for i=zombies:size(),1,-1 do
		local zombie = zombies:get(i-1)
		if instanceof(zombie, "IsoZombie") then
            count = count + 1
			zombie:removeFromWorld()
			zombie:removeFromSquare()
		end
	end
    getPlayer():Say(getText("UI_CMRB_Message_ZombieRemove1")..count..getText("UI_CMRB_Message_ZombieRemove2"))
end



function CheatCoreCM.highlightSquare()
	if CheatCoreCM.IsBarricade == true or CheatCoreCM.FireBrushEnabled == true or CheatCoreCM.IsDelete == true or CheatCoreCM.IsSelect == true or CheatCoreCM.FireBrushEnabled == true or CheatCoreCM.IsDelete == true or CheatCoreCM.IsTerraforming == true or CheatCoreCM.ZombieBrushEnabled == true then 
		local mx = getMouseXScaled();
		local my = getMouseYScaled();
		local player = getPlayer();
		local wz = player:getZ();
		local wx, wy = ISCoordConversion.ToWorld(mx, my, wz);
		wx = math.floor(wx);
		wy = math.floor(wy);
		local cell = getWorld():getCell();
		local sq = cell:getGridSquare(wx, wy, wz);
		if sq ~= nil then
			local sqObjs = sq:getObjects();
			local sqSize = sqObjs:size();
			for i = sqSize - 1, 0, -1 do
				local obj = sqObjs:get(i)
				obj:setHighlighted(true)
			end
		end
	end
end


function CheatCoreCM.updateCoords()
	if GPSWindow:getIsVisible() then
        GPSWindow.compassLines[1] = getText("UI_CMRB_GPS_TargetLocation").."<LINE>"..CheatCoreCM.DisplayName.." <LINE> ".."X: "..CheatCoreCM.MarkedX.." Y: "..CheatCoreCM.MarkedY.." <LINE><LINE> "
        GPSWindow.compassLines[2] = getText("UI_CMRB_GPS_CurrentCoord").."<LINE> ".."X: "..CheatCoreCM.doRound(getPlayer():getX()).." Y: "..CheatCoreCM.doRound(getPlayer():getY()).." <LINE><LINE> "
        GPSWindow.compassLines[3] = getText("UI_CMRB_GPS_TargetDistance").." <LINE> ".."X: "..CheatCoreCM.checkCoords(tonumber(CheatCoreCM.MarkedX), getPlayer():getX()).." Y: "..CheatCoreCM.checkCoords(tonumber(CheatCoreCM.MarkedY), getPlayer():getY())..""
		CheatCoreCM.updateCompass()
	end
end


function CheatCoreCM.updateCompass()
	local newText = "";
	for i,v in ipairs(GPSWindow.compassLines) do
		if i == #GPSWindow.compassLines then
			v = string.gsub(v, " <LINE> $", "")
		end
		newText = newText .. v;
	end
	GPSWindow.HomeWindow.text = newText
	GPSWindow.HomeWindow:paginate()
end


function CheatCoreCM.checkCoords(number1, number2)
	local doRound = CheatCoreCM.doRound(number2)
	if doRound >= number1 then
		return doRound - number1
	else
		return number1 - doRound
	end
end


local CMCurrentEquipment = nil
local CMWeaponName = nil
local CMWeaponTrigger = 0

function CheatCoreCM.CheckEquipment()
    local player = getPlayer()
    local weapon = player:getPrimaryHandItem()
    local itemList = getAllItems()
    local itemListSize = itemList:size()
    if weapon ~= nil then
    CMWeaponName = weapon:getFullType()
        for i = itemListSize-1,0,-1 do
            local itemList_items = itemList:get(i)
            --local invItem = instanceItem(itemList_items)
            local itemname = itemList_items:getFullName()
                if CMWeaponName ~= CMWeaponOldName then
                    if string.match (tostring(itemname), tostring(CMWeaponName)) then 
                        Ori_DoorDamage = itemList_items:getDoorDamage()
                        Ori_MaxDamage = itemList_items:getMaxDamage()
                        Ori_MinDamage = itemList_items:getMinDamage()
                        --Ori_RecoilDelay = itemList_items:getRecoilDelay()
                        CMCurrentEquipment = weapon:getID()
                        CMWeaponOldName = CMWeaponName
                        --print (Ori_MinDamage)
                        --print (Ori_MaxDamage)
                    end
                end
           end
    end
    return Ori_DoorDamage, Ori_MaxDamage, Ori_MinDamage, Ori_MinDamage, Ori_RecoilDelay, CMCurrentEquipment, CMWeaponName
end



function CheatCoreCM.DoVehicleGodMode()
	if CheatCoreCM.MasterKey == false then
		if CheatCoreCM.MadMax == true and CheatCoreCM.SelectedVehicle ~= nil then
			CheatCoreCM.SelectedVehicle:repair()
		end

	else
		CheatCoreCM.MadMax = false
	end
end

function CheatCoreCM.DoTickCheats()
    if CheatCoreCM.EventDisableKey == 0 or CheatCoreCM.EventDisableKey == nil then
        if getPlayer():isAlive() then
            CheatCoreCM.DoPreventDeathMode()
            CheatCoreCM.FlyMode()
            CheatCoreCM.FreezeTime()
            CheatCoreCM.DoInfiniteAmmoMode()
            CheatCoreCM.DoInfiniteDurabilityMode()
            CheatCoreCM.DoStatsUpdate()
            CheatCoreCM.DoVehicleGodMode()
            CheatCoreCM.DeathMessage = 0
        elseif CheatCoreCM.DeathMessage == 0 and not getPlayer():isAlive() then
            getPlayer():Say(getText("UI_CMRB_Message_AdminDeath"))
            CheatCoreCM.DeathMessage = 1
            
        end
        
    elseif CheatCoreCM.EventDisableKey == 1 then
        CMAmmoLoopSeq = nil
        CMAmmoFirstLaunch = nil
        CMAmmoMessageTrigger = nil
        CMCurrentEquipment = nil
        CMWeaponTrigger = nil
        Ori_MinDamage, Ori_MaxDamage, Ori_DoorDamage, Ori_TreeDamage, CMWeaponName, CMWeaponOldName, Ori_RecoilDelay = nil
       
        --print ("passed!")
        --CheatCoreCM.MasterKey = true
        CheatCoreCM.DoPreventDeath = false
        CheatCoreCM.IsRepair = false
        CheatCoreCM.IsAmmo = false
        CheatCoreCM.IsFly = false
        CheatCoreCM.IsFreezeTime = false
        --CheatCoreCM.MasterKey = false
        CheatCoreCM.EventDisableKey = 0
    end
    CheatCoreCM.updateCoords()
end

function CheatCoreCM.CheckCheatEnabled()

    if not getPlayer():isGodMod() then
        CheatCoreCM.IsGod = false
    end
    
    -- if not ISHealthPanel.cheat or not getPlayer():isHealthCheat() then
    if not ISHealthPanel.cheat then
        CheatCoreCM.IsHelathCheat = false
    end
    
    -- if not ISBuildMenu.cheat and not ISMoveableDefinitions.cheat or not getPlayer():	isBuildCheat() and getPlayer():isMovablesCheat() then
    if not ISBuildMenu.cheat and not ISMoveableDefinitions.cheat then
        CheatCoreCM.IsCreativeMode = false
    end

    if not getPlayer():isGhostMode() then
        CheatCoreCM.IsGhost = false
    end

    if not getPlayer():isNoClip() then
        CheatCoreCM.IsNoClip = false
    end
    
     -- if not ISVehicleMechanics.cheat or not getPlayer():isMechanicsCheat() then
    if not ISVehicleMechanics.cheat then
        CheatCoreCM.IsMechanicsCheat = false
    end
    
    if not getPlayer():isUnlimitedCarry() then
        CheatCoreCM.IsInfiniteCarryWeight = false
    end
    
    if not getPlayer():isTimedActionInstantCheat() then
        CheatCoreCM.IsActionCheat = false
    end
    
end


function CheatCoreCM.FlyMode()

--print (CheatCoreCM.MasterKey)
    local OldZ = nil
    local wz = math.floor(getPlayer():getZ())
    local wx, wy = math.floor(getPlayer():getX()), math.floor(getPlayer():getY())
    local cell = getWorld():getCell()
    local sq = cell:getGridSquare(wx, wy, wz);

    if wz > 0 then
        if sq == nil then
            sq = IsoGridSquare.new(cell, nil, wx, wy, wz)
            cell:ConnectNewSquare(sq, false)
        end

        sq = cell:getGridSquare(wx + 1, wy + 1, wz);

        if sq == nil then
            sq = IsoGridSquare.new(cell, nil, wx + 1, wy + 1, wz)
            cell:ConnectNewSquare(sq, false)
        end
    end


    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsFly == true and CheatCoreCM.FlightHeight ~= nil or getPlayer():getModData().IsFly and CheatCoreCM.FlightHeight ~= nil then
       
            if CheatCoreCM.FlightHeight ~= OldZ then
                OldZ = CheatCoreCM.FlightHeight
                getPlayer():setZ(CheatCoreCM.FlightHeight)
                getPlayer():setbFalling(false)
                getPlayer():setFallTime(0)
                getPlayer():setLastFallSpeed(0)
            else
                getPlayer():setbFalling(false)
                getPlayer():setFallTime(0)
                getPlayer():setLastFallSpeed(0)
            end
            getPlayer():getModData().IsFly = true
        elseif CheatCoreCM.IsFly == false or getPlayer():getModData().IsFly == false then
            getPlayer():setbFalling(true)
            getPlayer():getModData().IsFly = false
            CheatCoreCM.FlightHeight = getPlayer():getZ()
            getPlayer():getModData().FlightHeight = CheatCoreCM.FlightHeight
        end
    else
    end
end

function CheatCoreCM.FreezeTime()
--print (CheatCoreCM.MasterKey)
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsFreezeTime == true then
            local time = getGameTime()
            if CheatCoreCM.TimeOfDay == nil then
                CheatCoreCM.TimeOfDay = time:getTimeOfDay() -- stores the current time of day
            end
            time:setTimeOfDay(CheatCoreCM.TimeOfDay)
            getPlayer():getModData().IsFreezeTime = true
        else
            CheatCoreCM.TimeOfDay = nil
            getPlayer():getModData().IsFreezeTime = false
        end
    else
        CheatCoreCM.IsFreezeTime = false
    end
end

function CheatCoreCM.DoGhostMode()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsGhost == true then
            CheatCoreCM.IsGhost = true
            getPlayer():setGhostMode(true)
            getPlayer():getModData().IsGhost = true
        else
            CheatCoreCM.IsGhost = false
            getPlayer():setGhostMode(false)
            getPlayer():getModData().IsGhost = false
        end
    else
        CheatCoreCM.IsGhost = false
        getPlayer():setGhostMode(false)
        getPlayer():getModData().IsGhost = false
    end
end

function CheatCoreCM.DoGodMode()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsGod == true then
            CheatCoreCM.IsGod = true
            getPlayer():setGodMod(true)
            getPlayer():getModData().IsGod = true
        else
            CheatCoreCM.IsGod = false
            getPlayer():setGodMod(false)
            -- makes sending a message to the server for enabling god mod. Should be avoid in the feature.
            getPlayer():getModData().IsGod = false
        end
    else
        CheatCoreCM.IsGod = false
        getPlayer():setGodMod(false)
        getPlayer():getModData().IsGod = false
    end
end

function CheatCoreCM.DoCreativeMode()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsCreativeMode == true then
            CheatCoreCM.IsCreativeMode = true
            ISBuildMenu.cheat = true
            ISMoveableDefinitions.cheat = true
            getPlayer():setBuildCheat(true)
            getPlayer():setMovablesCheat(true)
            getPlayer():getModData().IsCreativeMode = true
        else
            CheatCoreCM.IsCreativeMode = false
            ISBuildMenu.cheat = false
            ISMoveableDefinitions.cheat = false
            getPlayer():setBuildCheat(false)
            getPlayer():setMovablesCheat(false)
            getPlayer():getModData().IsCreativeMode = false
        end
    else
        CheatCoreCM.IsCreativeMode = false
        ISBuildMenu.cheat = false
        ISMoveableDefinitions.cheat = false
        getPlayer():setBuildCheat(false)
        getPlayer():setMovablesCheat(false)
        getPlayer():getModData().IsCreativeMode = false
    end
end


function CheatCoreCM.DoHealthCheat()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsHelathCheat == true then
            CheatCoreCM.IsHelathCheat = true
            ISHealthPanel.cheat = true
            getPlayer():setHealthCheat(true)
            getPlayer():getModData().IsHelathCheat = true
        else
            CheatCoreCM.IsHelathCheat = false
            ISHealthPanel.cheat = false
            getPlayer():setHealthCheat(false)
            getPlayer():getModData().IsHelathCheat = false
        end
    else
        CheatCoreCM.IsHelathCheat = false
        ISHealthPanel.cheat = false
        getPlayer():setHealthCheat(false)
        getPlayer():getModData().IsHelathCheat = false
    end
end

       
function CheatCoreCM.DoMechanicsCheat()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsMechanicsCheat == true then
            CheatCoreCM.IsMechanicsCheat = true
            ISVehicleMechanics.cheat = true
            getPlayer():setMechanicsCheat(true)
            getPlayer():getModData().IsMechanicsCheat = true
        else
            CheatCoreCM.IsMechanicsCheat = false
            ISVehicleMechanics.cheat = false
            getPlayer():setMechanicsCheat(false)
            getPlayer():getModData().IsMechanicsCheat = false
        end
    else
        CheatCoreCM.IsMechanicsCheat = false
        ISVehicleMechanics.cheat = false
        getPlayer():setMechanicsCheat(false)
        getPlayer():getModData().IsMechanicsCheat = false
    end
end


function CheatCoreCM.dragDownDisable() 
	if CheatCoreCM.PZVersion >= 41 then
		local sb = SandboxOptions:getInstance()
		if CheatCoreCM.IsGod == true then
			local DragdownCheck = sb:getOptionByName("ZombieLore.ZombiesDragDown"):getValueAsObject()
			if DragdownCheck == true then
				getPlayer():getModData().CMmodifiedSB = true
				sb:set("ZombieLore.ZombiesDragDown", false);
				print("[CHEAT MENU] ZombiesDragDown set to False to prevent God Mode instadeath")
			end
		elseif getPlayer():getModData().CMmodifiedSB == true then
			getPlayer():getModData().CMmodifiedSB = false
			sb:set("ZombieLore.ZombiesDragDown", true)
			print("[CHEAT MENU] God Mode disabled, ZombiesDragDown value restored to True")
		end
	end
end

function CheatCoreCM.DoNoClipMode()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsNoClip == true then
            getPlayer():setNoClip(true)
            CheatCoreCM.IsNoClip = true
            getPlayer():getModData().IsNoClip = true
        else
            getPlayer():setNoClip(false)
            CheatCoreCM.IsNoClip = false
            getPlayer():getModData().IsNoClip = false
        end
    else
        getPlayer():setNoClip(false)
        CheatCoreCM.IsNoClip = false
        getPlayer():getModData().IsNoClip = false
    end
end


function CheatCoreCM.DoCarryWeightCheat()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsInfiniteCarryWeight or getPlayer():getModData().IsInfiniteCarryWeight then
            if getPlayer():isUnlimitedCarry() == false then
                getPlayer():setUnlimitedCarry(true)
            end
            getPlayer():getModData().IsInfiniteCarryWeight = true
        else
            getPlayer():setUnlimitedCarry(false)
            getPlayer():getModData().IsInfiniteCarryWeight = false    
        end
    else
        getPlayer():setUnlimitedCarry(false)
        getPlayer():getModData().IsInfiniteCarryWeight = false 
    end
end



function CheatCoreCM.ToggleInstantActions()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsActionCheat or getPlayer():getModData().IsActionCheat then
            if getPlayer():isTimedActionInstantCheat() == false then
                getPlayer():setTimedActionInstantCheat(true)
            end
            getPlayer():getModData().IsActionCheat = true
        --[[
            ISBaseTimedAction._create = ISBaseTimedAction.create
            function ISBaseTimedAction:create()
                self.maxTime = 0
                self.action = LuaTimedActionNew.new(self, self.character)
            end
            
            if CheatCoreCM.PZVersion >= 41 then -- build 41 compatibility
                ISInventoryTransferAction._new = ISInventoryTransferAction.new
                
                function ISInventoryTransferAction:new (character, item, srcContainer, destContainer)
                    local o = {}
                    setmetatable(o, self)
                    self.__index = self
                    o.character = character;
                    o.item = item;
                    o.srcContainer = srcContainer;
                    o.destContainer = destContainer;
                    if not srcContainer or not destContainer then
                        o.maxTime = 0;
                        return o;
                    end
                    o.stopOnWalk = not o.destContainer:isInCharacterInventory(o.character) or (not o.srcContainer:isInCharacterInventory(o.character))
                    if (o.srcContainer == character:getInventory()) and (o.destContainer:getType() == "floor") then
                        o.stopOnWalk = false
                    end
                    o.stopOnRun = true;
                    o.maxTime = 0;
                    o.jobType = getText("IGUI_JobType_Grabbing", item:getName());
                    if srcContainer == destContainer then
                        o.queueList = {};
                        local queuedItem = {items = {o.item}, time = o.maxTime, type = o.item:getFullType()};
                        table.insert(o.queueList, queuedItem);
                    else
                        o.loopedAction = true;
                        o:checkQueueList();
                    end
                    return o
                end
            end
            --]]
        else
            CheatCoreCM.IsActionCheat = false    
            getPlayer():setTimedActionInstantCheat(false)
            getPlayer():getModData().IsActionCheat = false
        --[[
            ISBaseTimedAction.create = ISBaseTimedAction._create
            if CheatCoreCM.PZVersion >= 41 then
                ISInventoryTransferAction.new = ISInventoryTransferAction._new
            end
            --]]
        end
    else
        CheatCoreCM.IsActionCheat = false 
        getPlayer():setTimedActionInstantCheat(false)
        getPlayer():getModData().IsActionCheat = false
    end
end


function CheatCoreCM.DoSuicide_With_Zombified()
    getPlayer():getBodyDamage():setInfectionLevel(10)
    getPlayer():setHealth(0)
    --getPlayer():becomeCorpse()
end

function CheatCoreCM.DoSuicide_Without_Zombified()
    getPlayer():getBodyDamage():setInfectionLevel(0)
    getPlayer():setHealth(0)
    --getPlayer():becomeCorpse()
end


function CheatCoreCM.DoRepair()
	local ToolToRepairP = getPlayer():getPrimaryHandItem()  
    if ToolToRepairP ~= nil then
        ToolToRepairP:setCondition( getPlayer():getPrimaryHandItem():getConditionMax() )  
        getPlayer():Say(getText("UI_CMRB_Message_RepairedPEquippedItem"))
    else
        getPlayer():Say(getText("UI_CMRB_Message_NoPItems"))
    end
    local ToolToRepairS = getPlayer():getSecondaryHandItem()  
    if ToolToRepairS ~= nil and not ToolToRepairP == ToolToRepairS then
        ToolToRepairS:setCondition( getPlayer():getPrimaryHandItem():getConditionMax() )  
        getPlayer():Say(getText("UI_CMRB_Message_RepairedSEquippedItem"))
    else
        getPlayer():Say(getText("UI_CMRB_Message_NoSItems"))
    end
end



function CheatCoreCM.DoALLRepair()
	local player = getPlayer()
	local InventoryItemList = player:getInventory():getItems()

	if InventoryItemList ~= nil then
	local InventorySize = InventoryItemList:size()
		for i = 0, InventorySize -1 do
			local Inventory_Items = InventoryItemList:get(i)
			Inventory_Items:setCondition(Inventory_Items:getConditionMax())

			if Inventory_Items:IsWeapon() and Inventory_Items:getStringItemType() == "RangedWeapon" then
				Inventory_Items:setCurrentAmmoCount(Inventory_Items:getMaxAmmo())
				Inventory_Items:setContainsClip(true)
				Inventory_Items:setRoundChambered(true)
				Inventory_Items:setJammed(false)
			end

			if Inventory_Items:IsClothing() then
				local ClothingParts = BloodClothingType.getCoveredParts(Inventory_Items:getBloodClothingType())
				for i = 0, ClothingParts:size() - 1 do
					local Parts_Points = ClothingParts:get(i)
					if Parts_Points then
					--print (Parts_Points)
						Inventory_Items:setBlood(Parts_Points, 0)
						Inventory_Items:setDirt(Parts_Points, 0)
					end
				end
				for i = 0, BloodBodyPartType.MAX:index() - 1 do
					Inventory_Items:getVisual():removeHole(i)
				end
				if Inventory_Items:IsClothing() then
					Inventory_Items:setCondition(Inventory_Items:getConditionMax())
					Inventory_Items:setBloodLevel(0)
					Inventory_Items:setDirtyness(0)
					Inventory_Items:finishupdate()
					Inventory_Items:flushWetness()
			   end
			end
		end
		getPlayer():Say(getText("UI_CMRB_Message_RepairedAllItem"))
	else
		getPlayer():Say(getText("UI_CMRB_Message_NoInventoryItems"))
	end
end

function CheatCoreCM.DoWearClothesRepair()
    local player = getPlayer()
    Wearing_Items = getPlayer():getWornItems()
    Wearing_Items_Size = Wearing_Items:size()

    if Wearing_Items ~= nil then
    for i = 0, Wearing_Items_Size - 1 do
        local Current_Item_Parent = Wearing_Items:get(i)
        local Current_Item = Current_Item_Parent:getItem()
        local ClothingParts = BloodClothingType.getCoveredParts(Current_Item:getBloodClothingType())
            for i = 0, ClothingParts:size() - 1 do
                local Parts_Points = ClothingParts:get(i)
                 if Parts_Points then
                    Current_Item:setBlood(Parts_Points, 0)
                    Current_Item:setDirt(Parts_Points, 0)
                    end
                end
        for i = 0, BloodBodyPartType.MAX:index() - 1 do
        Current_Item:getVisual():removeHole(i)
        end
        if Current_Item:IsClothing() then
            Current_Item:setCondition(Current_Item:getConditionMax())
            Current_Item:setBloodLevel(0)
            Current_Item:setDirtyness(0)
            Current_Item:setWetness(0)
       end
    end
        getPlayer():Say(getText("UI_CMRB_Message_RepairedWearingClothes"))
    else
        getPlayer():Say(getText("UI_CMRB_Message_NoWearingClothes"))
    end
       triggerEvent("OnClothingUpdated", player)
       player:resetModel()
end


function CheatCoreCM.DoStatsUpdate()
    --print (CheatCoreCM.MasterKey)
    if CheatCoreCM.MasterKey == false then

        if CheatCoreCM.IsHunger == true then
            getPlayer():getStats():setHunger(0)
        end

        if CheatCoreCM.IsThirst == true then
            getPlayer():getStats():setThirst(0)
        end
        
        if CheatCoreCM.IsPanic == true then
            getPlayer():getStats():setHunger(0)
        end
        
        if CheatCoreCM.IsPanic == true then
            getPlayer():getStats():setPanic(0)
        end
        
        if CheatCoreCM.IsSanity == true then
            getPlayer():getStats():setSanity(1)
        end
        
        if CheatCoreCM.IsStress == true then
            getPlayer():getStats():setStress(0)
        end
        
        if CheatCoreCM.IsFatigue == true then
            getPlayer():getStats():setFatigue(0)
        end
        
        if CheatCoreCM.IsAnger == true then
            getPlayer():getStats():setAnger(0)
        end
        
        if CheatCoreCM.IsPain == true then
            getPlayer():getStats():setPain(0)
        end
        
        if CheatCoreCM.IsSickness == true then
            getPlayer():getStats():setSickness(0)
        end
        
        if CheatCoreCM.IsDrunkenness == true then
            getPlayer():getStats():setDrunkenness(0)
        end
        
        if CheatCoreCM.IsEndurance == true then
            getPlayer():getStats():setEndurance(1)
        end
        
        if CheatCoreCM.IsFitness == true then
            getPlayer():getStats():setFitness(1)
        end
    --
        if CheatCoreCM.IsTemperature == true then
            getPlayer():getBodyDamage():setTemperature(37);
        end

        if CheatCoreCM.IsWet == true then
            getPlayer():getBodyDamage():setWetness(0);
        end

        if CheatCoreCM.IsUnhappy == true then
            getPlayer():getBodyDamage():setUnhappynessLevel(0);
        end
        
        if CheatCoreCM.IsBoredom == true then
            getPlayer():getBodyDamage():setBoredomLevel(0)
        end
        
       
        if CheatCoreCM.IsHunger and CheatCoreCM.IsThirst and CheatCoreCM.IsPanic and CheatCoreCM.IsPanic and CheatCoreCM.IsSanity and CheatCoreCM.IsStress and CheatCoreCM.IsFatigue and CheatCoreCM.IsAnger and CheatCoreCM.IsPain and CheatCoreCM.IsSickness and CheatCoreCM.IsDrunkenness and CheatCoreCM.IsEndurance and CheatCoreCM.IsFitness and CheatCoreCM.IsTemperature and CheatCoreCM.IsWet and  CheatCoreCM.IsUnhappy and CheatCoreCM.IsBoredom then
            CheatCoreCM.IsInfiniteStats = true
        else
            CheatCoreCM.IsInfiniteStats = false
            getPlayer():getModData().IsAllStats = false
        end
        
    else
        CheatCoreCM.AllStatsDisabled()
    end
end



function CheatCoreCM.AllStatsEnabled()
    CheatCoreCM.IsHunger = true
    CheatCoreCM.IsThirst = true
    CheatCoreCM.IsPanic = true
    CheatCoreCM.IsPanic = true
    CheatCoreCM.IsSanity = true
    CheatCoreCM.IsStress = true
    CheatCoreCM.IsFatigue = true
    CheatCoreCM.IsAnger = true
    CheatCoreCM.IsPain = true
    CheatCoreCM.IsSickness = true
    CheatCoreCM.IsDrunkenness = true
    CheatCoreCM.IsEndurance = true
    CheatCoreCM.IsFitness = true
    CheatCoreCM.IsTemperature = true
    CheatCoreCM.IsWet = true
    CheatCoreCM.IsUnhappy = true
    CheatCoreCM.IsBoredom = true
end

function CheatCoreCM.AllStatsDisabled()
    CheatCoreCM.IsHunger = false
    CheatCoreCM.IsThirst = false
    CheatCoreCM.IsPanic = false
    CheatCoreCM.IsPanic = false
    CheatCoreCM.IsSanity = false
    CheatCoreCM.IsStress = false
    CheatCoreCM.IsFatigue = false
    CheatCoreCM.IsAnger = false
    CheatCoreCM.IsPain = false
    CheatCoreCM.IsSickness = false
    CheatCoreCM.IsDrunkenness = false
    CheatCoreCM.IsEndurance = false
    CheatCoreCM.IsFitness = false
    CheatCoreCM.IsTemperature = false
    CheatCoreCM.IsWet = false
    CheatCoreCM.IsUnhappy = false
    CheatCoreCM.IsBoredom = false
end


function CheatCoreCM.AllStatsToggle()

    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsInfiniteStats then
            CheatCoreCM.AllStatsEnabled()
        else
            CheatCoreCM.AllStatsDisabled()
        end
    end
end


--[[
function CheatCoreCM.ToggleInstantCrafting()
	
	if not ISCraftingUI._render then
		ISCraftingUI._render = ISCraftingUI.render
	end
	
	if CheatCoreCM.IsCraftingCheat == true then
    --getPlayer():getModData().IsCraftingCheat = true
		ISCraftingUI._craft = ISCraftingUI.craft
		function ISCraftingUI:craft()		
			local selectedItem = self.panel.activeView.view.recipes.items[self.panel.activeView.view.recipes.selected].item
			local itemType = selectedItem.recipe:getResult():getFullType()
			
			local inventory = getPlayer():getInventory()
			inventory:AddItem( itemType )
		end
		
		RecipeManager._IsRecipeValid = RecipeManager.IsRecipeValid
		function RecipeManager.IsRecipeValid() return true end
		
		function ISCraftingUI:render()
			ISCraftingUI._render( self )
			
			self.craftOneButton.onclick = ISCraftingUI.craftAll
		end
		
	else
    --getPlayer():getModData().IsCraftingCheat = false
		ISCraftingUI.craft = ISCraftingUI._craft
		RecipeManager.IsRecipeValid = RecipeManager._IsRecipeValid
		
		function ISCraftingUI:render()
			ISCraftingUI._render( self )
			self.craftOneButton.onclick = ISCraftingUI.craft
		end
	end
end
--]]

function CheatCoreCM.DoMaxAllSkills()

	getPlayer():Say(getText("UI_CMRB_Message_ChangedLevel"))

	local player = getPlayer():getXp()
	
	local pf = PerkFactory.PerkList
	local pfSize = PerkFactory.PerkList:size()	
	for i = pfSize-1, 0, -1 do -- loop through PerkList and set level to 10
		local obj = pf:get(i)
		local skill = obj:getType()
		
		getPlayer():level0(skill) 
		getPlayer():getXp():setXPToLevel(skill, 0) -- make sure that xp and level is set to 0 first before levelling
		for i = 1,10 do -- then set it
			getPlayer():LevelPerk(skill, false)
		end
	end
end

function CheatCoreCM.DoResetAllSkills()

	getPlayer():Say(getText("UI_CMRB_Message_ResetLevel"))

	local player = getPlayer():getXp()
	
	local pf = PerkFactory.PerkList
	local pfSize = PerkFactory.PerkList:size()	
	for i = pfSize-1, 0, -1 do -- loop through PerkList and set level to 10
		local obj = pf:get(i)
		local skill = obj:getType()
		
		getPlayer():level0(skill) 
		getPlayer():getXp():setXPToLevel(skill, 0) 
	end
end

function CheatCoreCM.DoHeal()
    local Player = getPlayer()
    local PlayerVisual = Player:getHumanVisual()
    local PlayerBodyDmg = Player:getBodyDamage()
	
	PlayerBodyDmg:RestoreToFullHealth();
    PlayerVisual:removeDirt()
    PlayerVisual:removeBlood()
        local PlayerBodyParts = PlayerBodyDmg:getBodyParts()
        for i = 0, PlayerBodyParts:size() - 1 do
            local bodyPart = PlayerBodyParts:get(i)
            --local bloodBodyPartType = BloodBodyPartType.FromIndex(bodyPart:getIndex())
            bodyPart:setStiffness(0)
        end
        --[[
    for k,v in pairs(FitnessExercises.exercisesType) do
        local CR = getPlayer():getFitness():getCurrentExeStiffnessTimer(k)
    end
    --]]
     --getPlayer():getFitness():resetValues()
      
    Player:resetModel()
    Player:resetModelNextFrame()
    getPlayer():Say(getText("UI_CMRB_Message_HealedCharacter"))
end

function CheatCoreCM.DoLearnRecipes()
    local allItems = getScriptManager():getAllItems()
	for i=1, allItems:size() do
		local item = allItems:get(i-1)
        --print (item:getTeachedRecipes())
		if item:getType() == Type.Literature then
            --if SkillBook[item:getSkillTrained()] then
            --getPlayer():getKnownRecipes():add(item:getTeachedRecipes())
            --getPlayer():getAlreadyReadBook():add(item:getFullName())
			if item:getTeachedRecipes() ~= nil then
                TeachedRecipesSize = item:getTeachedRecipes():size()
                getPlayer():getAlreadyReadBook():add(item:getFullName())
                for i=1, TeachedRecipesSize do
                    local TeachedRecipesName = item:getTeachedRecipes():get(i-1)
                    getPlayer():getKnownRecipes():add(TeachedRecipesName)
                end
			end
		end
    end
    getPlayer():Say(getText("UI_CMRB_Message_RecipesLearned"))
end

function CheatCoreCM.DoForgetRecipes()
local allItems = getScriptManager():getAllItems()
	for i=1, allItems:size() do
		local item = allItems:get(i-1)
		if item:getType() == Type.Literature then
			if item:getTeachedRecipes() ~= nil then
                TeachedRecipesSize = item:getTeachedRecipes():size()
                getPlayer():getAlreadyReadBook():remove(item:getFullName())
			end
		end
    end
    getPlayer():getKnownRecipes():clear()
	getPlayer():Say(getText("UI_CMRB_Message_RecipesForgotten"))
end

function CheatCoreCM.DoSkillLevelUp(SkillToSet, ToLevel)
	--[[	
	for i = 1,getPlayer():getPerkLevel(SkillToSet) do -- clear the skill before setting it
		getPlayer():LoseLevel(SkillToSet)
	end
	--]]
	getPlayer():level0(SkillToSet)
	getPlayer():getXp():setXPToLevel(SkillToSet, 0)
	
	
	if ToLevel ~= 0 then
		for i = 1,ToLevel do -- then set it
			getPlayer():LevelPerk(SkillToSet, false)
		end
		getPlayer():getXp():setXPToLevel(SkillToSet, ToLevel)
	end
	
	--getPlayer():getXp():setXPToLevel(SkillToSet, ToLevel);
	--getPlayer():setNumberOfPerksToPick(getPlayer():getNumberOfPerksToPick() + ToLevel);
end



function CheatCoreCM.DoNoReload()


	if CheatCoreCM.IsMelee == true then -- checks to make sure that IsMelee is enabled, and if it is then it disables it.
		CheatCoreCM.DoWeaponDamage()
	end

	local weapon = getPlayer():getPrimaryHandItem()
    if weapon ~= nil then
        if CheatCoreCM.NoReload == true then
            getPlayer():getModData().OriginalRecoilDelay = weapon:getRecoilDelay()
            weapon:setRecoilDelay( 0 ) 
            --getPlayer():getModData().IsNoReload = true
        else
            if getPlayer():getModData().OriginalRecoilDelay then
                weapon:setRecoilDelay( getPlayer():getModData().OriginalRecoilDelay )
            --getPlayer():getModData().IsNoReload = false
            end
        end
    else
        getPlayer():Say(getText("UI_CMRB_Message_NoWeaponEquipped"))
        CheatCoreCM.IsMelee = false
    end
end




-- Trigger Set --
local CMAmmoLoopSeq = 0
local CMAmmoFirstLaunch = 1
local CMAmmoMessageTrigger = 0

function CheatCoreCM.DoInfiniteAmmoMode()
    --print (CheatCoreCM.MasterKey)
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsAmmo == true then
            --getPlayer():getModData().IsInfiniteAmmo = true
            CMAmmoLoopSeq = CMAmmoLoopSeq + 1
            if CMAmmoFirstLaunch == 1 then
                if getPlayer():getPrimaryHandItem() ~= nil then
                        local gun = getPlayer():getPrimaryHandItem()
                        if gun:isRanged() == nil then
                            getPlayer():Say(getText("UI_CMRB_Message_NotRangedWeapon"))
                        elseif gun:isRanged() then
                            gun:setCurrentAmmoCount(gun:getMaxAmmo())
                            gun:setContainsClip(true)
                            gun:setRoundChambered(true)
                            if gun:isJammed() then 
                                gun:setJammed(false) 
                            end
                        end
                elseif getPlayer():getPrimaryHandItem() == nil and CMAmmoMessageTrigger == 0 then
                    getPlayer():Say(getText("UI_CMRB_Message_NoWeaponEquipped_IAM"))
                    CheatCoreCM.IsAmmo = false
                    CMAmmoMessageTrigger = 1
                end
                    CMAmmoFirstLaunch = 0
            elseif CMAmmoFirstLaunch == 0 and CMAmmoLoopSeq == 25 then
             CMAmmoLoopSeq = 0
                if getPlayer():getPrimaryHandItem() ~= nil then
                        local gun = getPlayer():getPrimaryHandItem()
                        if gun:isRanged() == nil then
                            getPlayer():Say(getText("UI_CMRB_Message_NotRangedWeapon"))
                        elseif gun:isRanged() then
                            gun:setClip(gun:getClip())
                            gun:setCurrentAmmoCount(gun:getMaxAmmo())
                            gun:setRoundChambered(true)
                            if gun:isJammed() then 
                                gun:setJammed(false) 
                            end
                        end
                        CMAmmoMessageTrigger = 0
                elseif getPlayer():getPrimaryHandItem() == nil and CMAmmoMessageTrigger == 0 then
                    getPlayer():Say(getText("UI_CMRB_Message_NoWeaponEquipped_IAM"))
                    CheatCoreCM.IsAmmo = false
                    CMAmmoMessageTrigger = 1
                end
            end
            
        else
            --getPlayer():getModData().IsInfiniteAmmo = false
        end
    else
        CMAmmoMessageTrigger = 0
        CheatCoreCM.IsAmmo = false
    end
end


function CheatCoreCM.DoPreventDeathMode()
    BD = getPlayer():getBodyDamage()
    PlayerHealth = BD:getHealth()
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.DoPreventDeath == true then
            getPlayer():getModData().IsPreventDeath = true
            if PlayerHealth <= 15  then
                BD:AddGeneralHealth(100.0)
            end
        else
            CheatCoreCM.DoPreventDeath = false 
            getPlayer():getModData().IsPreventDeath = false        
        end
    else
        CheatCoreCM.DoPreventDeath = false
        getPlayer():getModData().IsPreventDeath = false
    end
end

function CheatCoreCM.DoInfiniteDurabilityMode()
    --print (CheatCoreCM.MasterKey)
    if CheatCoreCM.MasterKey == false then
        if CheatCoreCM.IsRepair == true then
            --getPlayer():getModData().IsInfiniteDurability = true
            if getPlayer():getPrimaryHandItem() ~= nil then
                if getPlayer():getPrimaryHandItem():getCondition() ~= getPlayer():getPrimaryHandItem():getConditionMax() then
                    local ToolToRepair = getPlayer():getPrimaryHandItem()
                    ToolToRepair:setCondition( getPlayer():getPrimaryHandItem():getConditionMax() )
                end
            end
        else
            --getPlayer():getModData().IsInfiniteDurability = false
        end
    else
        --getPlayer():getModData().IsInfiniteDurability = false
        CheatCoreCM.IsRepair = false
    end
end


function CheatCoreCM.DoWeaponDamage()

	local player = getPlayer()
	local weapon = player:getPrimaryHandItem()
	local sWeapon = player:getSecondaryHandItem()
    local InventoryItemList = player:getInventory():getItems()
    local InventorySize = InventoryItemList:size()
    local itemList = getAllItems()
    local itemListSize = itemList:size()

    if CheatCoreCM.IsMelee == true then
        if weapon ~= nil then
            --CMCurrentEquipment = weapon:getID()
            --TargetMinDamage = weapon:getMinDamage()
            --TargetMaxDamage = weapon:getMaxDamage()
            --TargetDoorDamage = weapon:getDoorDamage()
            CMWeaponName = weapon:getFullType()
            
            weapon:setMinDamage(1000)
            weapon:setMaxDamage(1000)
            weapon:setDoorDamage(1000)
            
        else
            getPlayer():Say(getText("UI_CMRB_Message_NotWeapon"))

        end
    else
        if weapon ~= nil then
        CMWeaponTrigger = 0
            --print (weapon:getFullType())
            for i = itemListSize-1,0,-1 do
            local itemList_items = itemList:get(i)
            local itemname = itemList_items:getFullName()

               if string.match (tostring(itemname), tostring(CMWeaponName)) then
                    weapon:setMinDamage(Ori_MinDamage)
                    weapon:setMaxDamage(Ori_MaxDamage)
                    weapon:setDoorDamage(Ori_DoorDamage)
                    --print (Ori_MinDamage)
                    --print (Ori_MaxDamage)
                    CMWeaponTrigger = 1
                end
           end
           if CMWeaponTrigger == 0 then
                getPlayer():Say(getText("UI_CMRB_Message_NotWeapon"))
           end
        else
            getPlayer():Say(getText("UI_CMRB_Message_AttemptTracing"))
            CMWeaponTrigger = 0
            for i = 0, InventorySize -1 do
                local Inventory_Items = InventoryItemList:get(i)
                local Inv_ItemID = Inventory_Items:getID()
                    if Inv_ItemID == CMCurrentEquipment then
                        Inventory_Items:setDoorDamage(Ori_DoorDamage)
                        Inventory_Items:setMaxDamage(Ori_MaxDamage)
                        Inventory_Items:setMinDamage(Ori_MinDamage)
                        --print (Ori_MinDamage)
                        --print (Ori_MaxDamage)
                        CMWeaponTrigger = 1
                        getPlayer():Say(getText("UI_CMRB_Message_RevertedItem"))
                    end
            end
            if CMWeaponTrigger == 0 then 
            getPlayer():Say(getText("UI_CMRB_Message_LostItem"))
            end
    --Events.OnEquipPrimary.Remove(CheatCoreCM.DoWeaponDamage) 
        end
    end
end


function CheatCoreCM.DoRefillAmmo()
    if getPlayer():getPrimaryHandItem() ~= nil then
        local gun = getPlayer():getPrimaryHandItem()
        if gun:isRanged() ~= nil then
            gun:setCurrentAmmoCount(gun:getMaxAmmo())
            gun:setRoundChambered(true)
            if gun:isJammed() then
                gun:setJammed(false) 
            end
            getPlayer():Say(getText("UI_CMRB_Message_RefillAmmoP"))
        else
            getPlayer():Say(getText("UI_CMRB_Message_NotRangedWeapon"))
        end
        if getPlayer():getPrimaryHandItem() ~= getPlayer():getSecondaryHandItem() and getPlayer():getSecondaryHandItem()~= nil then
            local gun_s = getPlayer():getSecondaryHandItem()
            if gun_s:isRanged() ~= nil then
                gun_s:setCurrentAmmoCount(gun_s:getMaxAmmo())
                gun_s:setRoundChambered(true)
                if gun_s:isJammed() then
                    gun_s:setJammed(false) 
                end
                getPlayer():Say(getText("UI_CMRB_Message_RefillAmmoS"))
            else
                getPlayer():Say(getText("UI_CMRB_Message_NotRangedWeapon"))
            end
        end
        
    elseif getPlayer():getSecondaryHandItem() ~= nil then
        local gun_s = getPlayer():getSecondaryHandItem()
        if gun_s:isRanged() ~= nil then
            gun_s:setCurrentAmmoCount(gun_s:getMaxAmmo())
            gun_s:setRoundChambered(true)
            if gun_s:isJammed() then
                gun_s:setJammed(false) 
            end
            getPlayer():Say(getText("UI_CMRB_Message_RefillAmmoS"))
        else
            getPlayer():Say(getText("UI_CMRB_Message_NotRangedWeapon"))
        end
    else
            getPlayer():Say(getText("UI_CMRB_Message_NoWeaponEquipped"))
    end
end


function CheatCoreCM.DisableAllCheat()
    getPlayer():getModData().IsNoClip = false
    getPlayer():getModData().IsCreativeMode = false
    getPlayer():getModData().IsGod = false
    getPlayer():getModData().IsGhost = false
    getPlayer():getModData().IsActionCheat = false
    getPlayer():getModData().IsMechanicsCheat = false
    getPlayer():getModData().IsHelathCheat = false
    --getPlayer():getModData().IsCraftingCheat = false
    getPlayer():getModData().IsPreventDeath = false
    --getPlayer():getModData().IsInfiniteAmmo = false
    --getPlayer():getModData().IsNoReload = false
    --getPlayer():getModData().IsInfiniteDurability = false
    getPlayer():getModData().IsFly = false
    getPlayer():getModData().IsAllStats = false
    
    
    CheatCoreCM.IsAmmo = false
    CheatCoreCM.IsRepair = true
    CheatCoreCM.IsMelee = false
    CheatCoreCM.IsSelect = false 
    CheatCoreCM.FireBrushEnabled = false
    CheatCoreCM.IsTerraforming = false 
    CheatCoreCM.ZombieBrushEnabled = false
    CheatCoreCM.IsDelete = false 
        CheatCoreCM.DeleteWithoutWall = false 
        CheatCoreCM.DeleteWithoutDoorWindow = false 
        CheatCoreCM.DeleteWithZombie = false 
        CheatCoreCM.DeleteWithCorpse = false 
    CheatCoreCM.DoPreventDeath = false
    CheatCoreCM.IsReady = false
    --CheatCoreCM.IsCraftingCheat = false
    
    CheatCoreCM.MasterKey = true
    CheatCoreCM.DoCreativeMode()
    CheatCoreCM.DoGodMode()
    CheatCoreCM.DoNoClipMode()
    CheatCoreCM.DoGhostMode()
    CheatCoreCM.DoMechanicsCheat()
    CheatCoreCM.DoHealthCheat()
    CheatCoreCM.ToggleInstantActions()
    CheatCoreCM.AllStatsDisabled()

    CheatCoreCM.EventDisableKey = 1
    CheatCoreCM.MasterKey = false

    
end

function CheatCoreCM.ObJectDoorLock(door)
    door:setIsLocked(not door:isLocked())
    if door:checkKeyId() ~= -1 then
        door:setLockedByKey(door:isLocked())
    end
    if door:getKeyId() ~= -1 then
        door:setLockedByKey(door:isLocked())
    end
    getPlayer():getMapKnowledge():setKnownBlockedDoor(door, door:isLocked())

    local doubleDoorObjects = buildUtil.getDoubleDoorObjects(door)
    for i=1,#doubleDoorObjects do
        local object = doubleDoorObjects[i]
        object:setLockedByKey(door:isLocked())
    end

    local garageDoorObjects = buildUtil.getGarageDoorObjects(door)
    for i=1,#garageDoorObjects do
        local object = garageDoorObjects[i]
        object:setLockedByKey(door:isLocked())
    end
end
    
function CheatCoreCM.SyncVariables()

    -- Removing unsupported mods events --
	if PLLGhost ~= nil then
		if PLLGhost.setGhost ~= nil then
			Events.OnPlayerUpdate.Remove(PLLGhost.setGhost)
		end
	end

	if not isClient() or isAdmin() or isCoopHost() then
		local notifyPlayer = {}
		local stringNotice = getText("UI_CMRB_Message_EnabledCheat")

        
		if getPlayer():getModData().IsGod == true then
            CheatCoreCM.IsGod = true
            CheatCoreCM.DoGodMode()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_God"))
		else
			CheatCoreCM.IsGod = false
			getPlayer():getModData().IsGod = false
		end

		if getPlayer():getModData().IsGhost == true then 
			CheatCoreCM.IsGhost = true
            CheatCoreCM.DoGhostMode()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_Ghost")) 
		else
            CheatCoreCM.IsGhost = false
			getPlayer():getModData().IsGhost = false
		end

        if getPlayer():getModData().IsCreativeMode == true then
            CheatCoreCM.IsCreativeMode = true
            CheatCoreCM.DoCreativeMode()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_Creative"))
		else
			CheatCoreCM.IsCreativeMode = false
            getPlayer():getModData().IsCreativeMode = false
		end
        
        if getPlayer():getModData().IsHelathCheat == true then
            CheatCoreCM.IsHelathCheat = true
            CheatCoreCM.DoHealthCheat()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_Health"))
		else
			CheatCoreCM.IsHelathCheat = false
            getPlayer():getModData().IsHelathCheat = false
		end
        
        if getPlayer():getModData().IsNoClip == true then
            CheatCoreCM.IsNoClip = true
            CheatCoreCM.DoNoClipMode()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_NoClip"))
		else
			getPlayer():getModData().IsNoClip = false
            CheatCoreCM.IsNoClip = false
		end
        
        if getPlayer():getModData().IsPreventDeath == true then
            CheatCoreCM.DoPreventDeath = true
            --CheatCoreCM.DoPreventDeathMode()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_PreventDeath"))
		else
			getPlayer():getModData().IsPreventDeath = false
            CheatCoreCM.DoPreventDeath = false
		end

--[[
        if getPlayer():getModData().IsCraftingCheat == true then
            CheatCoreCM.IsCraftingCheat = true
            CheatCoreCM.ToggleInstantCrafting()
			table.insert(notifyPlayer, getText("UI_CMRB_Current_CraftingCheat"))
		else
			getPlayer():getModData().IsCraftingCheat = false
            CheatCoreCM.IsCraftingCheat = false
		end
        --]]
        
        if getPlayer():getModData().IsActionCheat == true then
            CheatCoreCM.IsActionCheat = true
            CheatCoreCM.ToggleInstantActions()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_ActionCheat"))
		else
			getPlayer():getModData().IsActionCheat = false
            CheatCoreCM.IsActionCheat = false
		end
        
 --[[
        if getPlayer():getModData().IsInfiniteDurability == true then
            CheatCoreCM.IsRepair = true
			table.insert(notifyPlayer, getText("UI_CMRB_Current_InfiniteDurability"))
		else
			getPlayer():getModData().IsInfiniteDurability = false
            CheatCoreCM.IsRepair = false
		end


        if getPlayer():getModData().IsInfiniteAmmo == true then
            CheatCoreCM.IsAmmo = true
			table.insert(notifyPlayer, getText("UI_CMRB_Current_InfiniteAmmo"))
		else
			getPlayer():getModData().IsInfiniteAmmo = false
            CheatCoreCM.IsAmmo = false
		end        
        
        if getPlayer():getModData().IsNoReload == true then
            CheatCoreCM.NoReload = true
			table.insert(notifyPlayer, getText(""))
		else
			getPlayer():getModData().IsNoReload = false
            CheatCoreCM.NoReload = false
		end        
--]]
        
         if getPlayer():getModData().IsFly == true then
             if getPlayer():getModData().FlightHeight ~= nil then
                CheatCoreCM.FlightHeight = getPlayer():getModData().FlightHeight
             end
            CheatCoreCM.IsFly = true
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_Fly"))
		else
			getPlayer():getModData().IsFly = false
            CheatCoreCM.IsFly = false
		end     
        
        if getPlayer():getModData().IsAllStats == true then
            CheatCoreCM.IsAllStats = true
            CheatCoreCM.AllStatsToggle()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_AllStats"))
		else
			getPlayer():getModData().IsAllStats = false
            CheatCoreCM.IsAllStats = false
            CheatCoreCM.AllStatsToggle()
		end        
        
        if getPlayer():getModData().IsMechanicsCheat == true then
            CheatCoreCM.IsMechanicsCheat = true
            CheatCoreCM.DoMechanicsCheat()
			table.insert(notifyPlayer, getText("UI_CMRB_Message_Current_Mechanics"))
		else
			CheatCoreCM.IsMechanicsCheat = false
            getPlayer():getModData().IsMechanicsCheat = false
		end
        

		if #notifyPlayer > 0 then
			for i = 1,#notifyPlayer do
				if i ~= #notifyPlayer then
					stringNotice = stringNotice..notifyPlayer[i]..","
				else
					local finishedString = string.gsub(notifyPlayer[i], ", ", "") 
					stringNotice = stringNotice..finishedString
				end
			end
			print("[CHEAT MENU] "..stringNotice)
			getPlayer():Say(stringNotice) 
		end
	end
end


function CheatCoreCM.DisableSelectionMode()
    if  CheatCoreCM.IsBarricade or
        CheatCoreCM.FireBrushEnabled or
        CheatCoreCM.IsDelete or
        CheatCoreCM.IsSelect or     
        CheatCoreCM.IsTerraforming or
        CheatCoreCM.ZombieBrushEnabled then

        CheatCoreCM.IsBarricade = false
        CheatCoreCM.IsDelete = false 
        CheatCoreCM.IsSelect = false 
        --CheatCoreCM.IsReady = false
        CheatCoreCM.FireBrushEnabled = false
        CheatCoreCM.IsTerraforming = false 
        CheatCoreCM.ZombieBrushEnabled = false
        getPlayer():Say(getText("UI_CMRB_Message_RightClickDeactivation"))
    end
  
end


function CheatCoreCM.TestObject()
end


Events.OnLoad.Add(CheatCoreCM.SyncVariables);
Events.OnPlayerDeath.Add(CheatCoreCM.DisableAllCheat);
Events.OnEquipPrimary.Add(CheatCoreCM.CheckEquipment);

print("[CHEAT MENU] CheatCore successfully loaded")