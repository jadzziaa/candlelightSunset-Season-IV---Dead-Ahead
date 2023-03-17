-- Cheat Menu: Rebirth
-- Version: 1.1.0
-- Developer: RelationLife (https://steamcommunity.com/id/relationlife)
-- Original Developer: dude person (https://steamcommunity.com/id/123ii854734653463)

require "CheatMenuRebirth/CheatCore"
require "CheatMenuRebirth/ItemSpawner/crucibleCore"
require "CheatMenuRebirth/Teleport/compassCore"
require "CheatMenuRebirth/Teleport/GPSWindow"
require "CheatMenuRebirth/Teleport/TeleportWindow"
require "CheatMenuRebirth/Vehicle/VehicleControlBox"
require "CheatMenuRebirth/Vehicle/VehicleSpawnCore"
require "CheatMenuRebirth/Lua/LuaInterpreter"
require "CheatMenuRebirth/Times/GenericInputWindow"
require "CheatMenuRebirth/Times/SkillInputWindow"

ISUICheatMenu = ISUICheatMenu or {};
ISUICheatMenu._index = ISUICheatMenu
ISUICheatMenu.ReloadedCount = 0

local versionNumber = tonumber(string.match(getCore():getVersionNumber(), "%d+"))

function ISUICheatMenu.CurrentObjects(worldobjects, subMenuObject)
    local x = getMouseX()
    local y = getMouseY()
    local NoDoor, NoWindow

    local function removeDuplicates(list)
        local result = {}
        local seen = {}
        for _,item in ipairs(list) do
            if not seen[item] then
                seen[item] = true
                table.insert(result, item)
            end
        end
        return result
    end

    local window = IsoObjectPicker.Instance:PickWindow(x, y)
    worldobjects = removeDuplicates(worldobjects)

    if instanceof(window, "IsoWindow") then
        if not window:isSmashed() and not window:isGlassRemoved() then
            if window:isLocked() then
                subMenuObject:addOption(getText("UI_CMRB_Object_WindowUnlock"), worldobjects, function() window:setIsLocked(false); getPlayer():Say(getText("UI_CMRB_Message_WindowUnlocked")) end)
            else
                subMenuObject:addOption(getText("UI_CMRB_Object_WindowLock"), worldobjects, function() window:setIsLocked(true); getPlayer():Say(getText("UI_CMRB_Message_WindowLocked")) end)
            end
            if window:isPermaLocked() then
                subMenuObject:addOption(getText("UI_CMRB_Object_WindowPremaUnlock"), worldobjects, function() window:setPermaLocked(false); getPlayer():Say(getText("UI_CMRB_Message_WindowPermaUnlocked")) end)
            else
                subMenuObject:addOption(getText("UI_CMRB_Object_WindowPremaLock"), worldobjects, function() window:setPermaLocked(true); getPlayer():Say(getText("UI_CMRB_Message_WindowPermaLocked")) end)
            end
                NoWindow = 0
        else
            subMenuObject:addOption(getText("UI_CMRB_Object_RestoreWindowGlass"), worldobjects, function() window:setSmashed(false); window:setGlassRemoved(false); getPlayer():Say(getText("UI_CMRB_Message_WindowGlassRestored")) end)
        end
    else
        NoWindow = 1
    end

	for _,obj in ipairs(worldobjects) do
		if instanceof(obj, "IsoDoor") or (instanceof(obj, "IsoThumpable") and obj:isDoor()) then
			local doorkey = obj:getKeyId()
            if doorkey == -1 then
               NoKeyRequired = subMenuObject:addOption(getText("UI_CMRB_Object_NoKeyRequired"), worldobjects, nil)
               NoKeyRequired.notAvailable = true
            else
                subMenuObject:addOption(getText("UI_CMRB_Object_SpawnDoorKey"), worldobjects, function() getSpecificPlayer(getPlayer():getPlayerNum()):getInventory():AddItem("Base.Key1"):setKeyId(doorkey); getPlayer():Say(getText("UI_CMRB_Message_DoorKeySpawned")) end)
            end
            
            if obj:isLocked() and doorkey ~= -1 then
                subMenuObject:addOption(getText("UI_CMRB_Object_DoorUnlock"), worldobjects, function() CheatCoreCM.ObJectDoorLock(obj); getPlayer():Say(getText("UI_CMRB_Message_DoorUnlocked")) end)
            elseif not obj:isLocked() and doorkey ~= -1 then
                subMenuObject:addOption(getText("UI_CMRB_Object_DoorLock"), worldobjects, function() CheatCoreCM.ObJectDoorLock(obj); getPlayer():Say(getText("UI_CMRB_Message_DoorLocked")) end)
            end
            NoDoor = 0
        else
            NoDoor = 1
        end
	end
    

    if NoDoor == 1 and NoWindow == 1 then
       NoObjectFound = subMenuObject:addOption(getText("UI_CMRB_Object_NoObjectFound"), worldobjects, nil)
       NoObjectFound.notAvailable = true
    end

end

function ISUICheatMenu:ObjectCheatMenu(worldobjects)

	local context, subMenu = self.context, self.subMenu
       
	local ObjectCheatOption = subMenu:addOption(getText("UI_CMRB_Menu_ObjectCheat"), worldobjects, nil);
	local subMenuObject = subMenu:getNew(subMenu);
    subMenuObject.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
 	context:addSubMenu(ObjectCheatOption, subMenuObject);
    
    ISUICheatMenu.CurrentObjects(worldobjects, subMenuObject)
    
end


function ISUICheatMenu:createTerraformMenu(subMenu)
	local context = self.context
    
    subMenu.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
	local TerraformOption = subMenu:addOption(getText("UI_CMRB_Terrain_Terraforming"), worldobjects)
    if CheatCoreCM.IsTerraforming then
        TerraformOption.checkMark = true
    else
        TerraformOption.checkMark = false
    end
    
    local subMenuTerraform = subMenu:getNew(subMenu)
	context:addSubMenu(TerraformOption, subMenuTerraform)
	subMenuTerraform.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    
	if CheatCoreCM.IsTerraforming then
		subMenuTerraform:addOption(getText("UI_CMRB_Terrain_TDisable"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_TerrainTerraforming"), "CheatCoreCM.IsTerraforming") CheatCoreCM.DoNotFill = false end)
	end
    
	local DoNotFill = subMenuTerraform:addOption(getText("UI_CMRB_Terrain_NoFillEmpty"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Terrain_NoFillEmpty"), "CheatCoreCM.DoNotFill") end)
    if CheatCoreCM.DoNotFill then
        DoNotFill.checkMark = true
    else
        DoNotFill.checkMark = false
    end
	
	local tileTable = {
	optionTable = {},
	subMenuTable = {},
	categoryKey = {}
	} -- creates a table of sub menus.
	
	for k1,v1 in pairs(CheatCoreCM.TerraformTiles.MenuCategories) do 
		tileTable.optionTable[v1] = subMenuTerraform:addOption(v1, worldobjects)
		tileTable.subMenuTable[v1] = subMenuTerraform:getNew(subMenuTerraform)
		tileTable.categoryKey[v1] = v1
		context:addSubMenu(tileTable.optionTable[v1], tileTable.subMenuTable[v1])
	end


	for k,v in pairs(CheatCoreCM.TerraformTiles.TileTypes) do
		if v["Category"] == tileTable.categoryKey[v["Category"]] then 
			local ranges
			if #v["Ranges"] > 1 then
				ranges = "{"..v["Ranges"][1]..","..v["Ranges"][2].."}"
			else
				ranges = "{"..v["Ranges"][1].."}"
			end
			tileTable.subMenuTable[v["Category"]]:addOption(v["Name"], worldobjects, function() CheatCoreCM.HandleToggle(nil, nil, "CheatCoreCM.HandleCheck('CheatCoreCM.IsTerraforming', getText('UI_CMRB_Message_TerrainTerraforming'))", "CheatCoreCM.Terraform = '"..v["Tileset"].."'; CheatCoreCM.TerraformRanges = "..ranges) end)
		end
	end


end


function ISUICheatMenu:createDeleteMenu(subMenu)
	local context = self.context
    
    subMenu.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    
    local DeletionOption = subMenu:addOption(getText("UI_CMRB_Terrain_Delete"), worldobjects)
     if CheatCoreCM.IsDelete then
        DeletionOption.checkMark = true
    else
        DeletionOption.checkMark = false
    end
    
    local subMenuDeletion = subMenu:getNew(subMenu)
	context:addSubMenu(DeletionOption, subMenuDeletion)
	subMenuDeletion.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    
    subMenuDeletion:addOption(getText("UI_CMRB_Terrain_DToggle"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_TerrainDelete"), "CheatCoreCM.IsDelete") end)
    
    local DeleteWithoutWall = subMenuDeletion:addOption(getText("UI_CMRB_Terrain_DeleteWithoutWall"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Terrain_DeleteWithoutWall"), "CheatCoreCM.DeleteWithoutWall") end)
    if CheatCoreCM.DeleteWithoutWall then
        DeleteWithoutWall.checkMark = true
    else
        DeleteWithoutWall.checkMark = false
    end
    
    local DeleteWithoutDoorWindow = subMenuDeletion:addOption(getText("UI_CMRB_Terrain_DeleteWithoutDoorWindow"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Terrain_DeleteWithoutDoorWindow"), "CheatCoreCM.DeleteWithoutDoorWindow") end)
    if CheatCoreCM.DeleteWithoutDoorWindow then
        DeleteWithoutDoorWindow.checkMark = true
    else
        DeleteWithoutDoorWindow.checkMark = false
    end
    
     local DeleteWithCorpse = subMenuDeletion:addOption(getText("UI_CMRB_Terrain_DeleteWithCorpse"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Terrain_DeleteWithCorpse"), "CheatCoreCM.DeleteWithCorpse") end)
    if CheatCoreCM.DeleteWithCorpse then
        DeleteWithCorpse.checkMark = true
    else
        DeleteWithCorpse.checkMark = false
    end
    
   
    local DeleteWithZombie = subMenuDeletion:addOption(getText("UI_CMRB_Terrain_DeleteWithZombie"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Terrain_DeleteWithZombie"), "CheatCoreCM.DeleteWithZombie") end)
    if CheatCoreCM.DeleteWithZombie then
        DeleteWithZombie.checkMark = true
    else
        DeleteWithZombie.checkMark = false
    end

     if isClient() then
        DeleteWithZombie.notAvailable = true
     end

    
    --[[ -Support Yet-
    local DeleteWithTerrain = subMenuDeletion:addOption("UI_CMRB_Terrain_DeleteWithTerrain", worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Terrain_DeleteWithTerrain"), "CheatCoreCM.DeleteWithTerrain") end)
    if CheatCoreCM.DeleteWithZombie then
        DeleteWithTerrain.checkMark = true
    else
        DeleteWithTerrain.checkMark = false
    end
    --]]
    
end




function ISUICheatMenu:createBarricadeMenu(subMenu)
	local context = self.context
    
	subMenu.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
	local BarricadeOption = subMenu:addOption(getText("UI_CMRB_Terrain_Barricade"), worldobjects, nil)
    if CheatCoreCM.IsBarricade then
        BarricadeOption.checkMark = true
    else
        BarricadeOption.checkMark = false
    end
	local subMenuBarricade = subMenu:getNew(subMenu);
	context:addSubMenu(BarricadeOption, subMenuBarricade);
	
	local BarricadeToggle = subMenuBarricade:addOption(getText("UI_CMRB_Terrain_BToggle"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_TerrainBarricade"), "CheatCoreCM.IsBarricade", "CheatCoreCM.BarricadeType = 'wood'; CheatCoreCM.BarricadeLevel = 4") end)
	
    
	local PlankTypeOption = subMenuBarricade:addOption(getText("UI_CMRB_Terrain_BarricadeMaterial"), worldobjects)
	local subMenuPlankType = subMenuBarricade:getNew(subMenuBarricade)
	context:addSubMenu(PlankTypeOption, subMenuPlankType)
	subMenuPlankType.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    
	local Wood = subMenuPlankType:addOption(getText("UI_CMRB_Terrain_BarricadeWood"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_TerrainBarricade"), nil, "CheatCoreCM.HandleCheck('CheatCoreCM.IsBarricade', getText('UI_CMRB_Message_TerrainBarricade'))", "CheatCoreCM.BarricadeType = 'wood'; CheatCoreCM.BarricadeLevel = CheatCoreCM.BarricadeLevel or 4") end)
	local Metal = subMenuPlankType:addOption(getText("UI_CMRB_Terrain_BarricadeMetal"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_TerrainBarricade"), nil, "CheatCoreCM.HandleCheck('CheatCoreCM.IsBarricade', getText('UI_CMRB_Message_TerrainBarricade'))", "CheatCoreCM.BarricadeType = 'metal'; CheatCoreCM.BarricadeLevel = CheatCoreCM.BarricadeLevel or 4") end)
    if CheatCoreCM.BarricadeType == "wood" then
        Wood.checkMark = true
    elseif CheatCoreCM.BarricadeType == "metal" then
        Metal.checkMark = true
    else
        Wood.checkMark = false
        Metal.checkMark = false
    end


	local PlankAmountOption = subMenuBarricade:addOption(getText("UI_CMRB_Terrain_BarricadeNoB"), worldobjects)
	local subMenuPlankAmount = subMenuBarricade:getNew(subMenuBarricade)
	context:addSubMenu(PlankAmountOption, subMenuPlankAmount)
	subMenuPlankAmount.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
	--populate subMenuPlankAmount--
	for i = 4,0,-1 do
		local stringName;
		if i == 0 then -- Setting the planks to 0 removes them
			stringName = getText("UI_CMRB_Terrain_BarricadeRAll")
		else
			stringName = getText("UI_CMRB_Terrain_BarricadeWith")..tostring(i)..getText("UI_CMRB_Terrain_BarricadeInstall")
		end
		local PlankAmount = subMenuPlankAmount:addOption(stringName, worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_TerrainBarricade"), nil, "CheatCoreCM.HandleCheck('CheatCoreCM.IsBarricade', getText('UI_CMRB_Message_TerrainBarricade'))", "CheatCoreCM.BarricadeLevel = "..tostring(i)) end)
        if CheatCoreCM.BarricadeLevel == i then
            PlankAmount.checkMark = true
        else
            PlankAmount.checkMark = false
        end
	end
end

function ISUICheatMenu:createXPMenu(subMenu)
	local context = self.context
	
	local XPOption = subMenu:addOption(getText("UI_CMRB_MoodAndXP_SkillSet"), worldobjects, nil);
	local subMenuXP = subMenu:getNew(subMenu);
	context:addSubMenu(XPOption, subMenuXP);

	local MaxOption = subMenuXP:addOption(getText("UI_CMRB_MoodAndXP_SkillMax"), worldobjects, CheatCoreCM.DoMaxAllSkills);
    local ResetOption = subMenuXP:addOption(getText("UI_CMRB_MoodAndXP_SkillReset"), worldobjects, CheatCoreCM.DoResetAllSkills);
	
	local masterTable = {}
	
	local pf = PerkFactory.PerkList
	local pfSize = pf:size()
	
	for i = pfSize-1, 0, -1 do
		local obj = pf:get(i)
		local par = PerkFactory.getPerkName(obj:getParent())
		if obj and obj:getParent() ~= Perks.None then
			if masterTable[par] == nil then masterTable[par] = {} end
			masterTable[par][obj:getName()] = obj:getType()
		end
	end
	
	for k,v in pairs(masterTable) do
		local option = subMenuXP:addOption(tostring(k));
		local subMenuOption = subMenuXP:getNew(subMenuXP);
		context:addSubMenu(option, subMenuOption);
		
		for key,val in pairs(v) do
        local inputUI = SkillInputWindow:checkExists(getText("UI_CMRB_MoodAndXP_SkillWindow"), "XP_Value", function() print("[Cheat Menu] Error generating inputUI") end, nil)
			subMenuOption:addOption(key, worldobjects, function() inputUI.title = tostring(key).. " " .. getText("UI_CMRB_MoodAndXP_SkillWindow") inputUI:setVisible(true); inputUI.func = function(val2) CheatCoreCM.DoSkillLevelUp(val, tonumber(val2)) end end)
		end
	end
end
--[[
function ISUICheatMenu:createWeatherMenu()
	local context, subMenu = self.context, self.subMenu
	
	if versionNumber <= 39 then -- only appears in versions with legacy weather system
		local WeatherOption = subMenu:addOption("Change Weather...", worldobjects, nil);
		
		local subMenuWeather = subMenu:getNew(subMenu)
		context:addSubMenu(WeatherOption, subMenuWeather)
		
		local weatherTable = {
			thunder = {"Thunder", "thunder"}, -- Name, string that IsoWorld recognizes
			rain = {"Rain", "rain"},
			clear = {"Sunny", "sunny"},
			cloudy = {"Cloudy", "cloud"}
		}
		
		for k,v in pairs(weatherTable) do -- Generate the submenus instead of manually writing each one.
			subMenuWeather:addOption("Toggle "..v[1], worldobjects, function() CheatCoreCM.SetWeather(v[2]) end)
		end
	end
end
--]]


function ISUICheatMenu:createTimeMenu(subMenu)
	local context = self.context
	
	local TimeOption = subMenu:addOption(getText("UI_CMRB_Utility_Time"), worldobjects, nil);
	local subMenuTime = subMenu:getNew(subMenu);
	context:addSubMenu(TimeOption, subMenuTime);
	subMenuTime.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)

    if isClient() then
        local NotSupported = subMenuTime:addOption(getText("UI_CMRB_Menu_NotSupportedMP"), worldobjects)
        NotSupported.notAvailable = true
        NotSupported.tooltip = getText("UI_CMRB_Tooltip_NotSupported")
    else
        subMenuTime:addOption(getText("UI_CMRB_Utility_TimeWarp"), worldobjects, function() ISUICheatMenu.TimeWindowCheck() end);
        local TimeFreeze = subMenuTime:addOption(getText("UI_CMRB_Utility_TimeFreeze"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Utility_TimeFreeze"), "CheatCoreCM.IsFreezeTime") end);
        if CheatCoreCM.IsFreezeTime then
            TimeFreeze.checkMark = true
        else
            TimeFreeze.checkMark = false
        end
     end
end



function ISUICheatMenu.TimeWindowCheck()
    if TimesWindow.IDs == nil then
        TimesWindow.makeWindow()
    else
        getPlayer():Say(getText("UI_CMRB_Message_AlreadyExistWindow"))
    end
end

function ISUICheatMenu:createZombieMenu(subMenu)
	local context = self.context
    
	subMenu.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
	local ZombieOption = subMenu:addOption(getText("UI_CMRB_Terrain_ZombieSpawn"), worldobjects, nil);
    
    if CheatCoreCM.ZombieBrushEnabled then
        ZombieOption.checkMark = true
    else
        ZombieOption.checkMark = false
    end
    
	local subMenuZombie = subMenu:getNew(subMenu);
	context:addSubMenu(ZombieOption, subMenuZombie);
    
	--[[
	local zombUI = ISUIGenericWindow.IDs["Zombie"] -- returns ISUIGenericWindow(). used to get the input window (or create if nil) without creating a new UI instance every time the context menu is opened
		f zombUI == nil then -- the window isn't expected to exist at startup, if zombUI returns nil then that means it's the first time the context menu has been opened.
		local newUI = ISUIGenericWindow:new("Zombie Amount", "Zombie", function(val) CheatCoreCM.HandleToggle('Zombie Brush', nil, "CheatCoreCM.HandleCheck('CheatCoreCM.ZombieBrushEnabled', 'Zombie Brush')", "CheatCoreCM.ZombiesToSpawn = "..tostring(val) ); end)
		zombUI = ISUIGenericWindow.IDs["Zombie"]
		newUI:initialise()
		newUI:addToUIManager()
		newUI:setVisible(false)
	end
	--]]
	
	local zombUI = ISUIGenericWindow:checkExists(getText("UI_CMRB_Terrain_ZombieSpawnSetAmount"), "Zombie", function(val) CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_ZombieSpawn"), nil, "CheatCoreCM.HandleCheck('CheatCoreCM.ZombieBrushEnabled', getText('UI_CMRB_Message_ZombieSpawn'))", "CheatCoreCM.ZombiesToSpawn = "..tostring(val)); end, nil)
	
	local ZombieSpawn = subMenuZombie:addOption(getText("UI_CMRB_Terrain_ZToggle"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Message_ZombieSpawn"), "CheatCoreCM.ZombieBrushEnabled") CheatCoreCM.ZombiesToSpawn = 1 end);

	subMenuZombie:addOption(getText("UI_CMRB_Terrain_ZombieSpawnSetAmount"), worldobjects, function() zombUI:setVisible(true) end);
    
    
    if isClient() then
		subMenuZombie:addOption(getText("UI_CMRB_Terrain_ZombieRemoveAll"), worldobjects, CheatCoreCM.RemoveAllZombiesServer)
	else
		subMenuZombie:addOption(getText("UI_CMRB_Terrain_ZombieRemoveAll"), worldobjects, CheatCoreCM.RemoveAllZombiesClient)
	end
    
    
end

function ISUICheatMenu:createStatsMenu(subMenu)
	local context = self.context
	
	local StatOption = subMenu:addOption(getText("UI_CMRB_MoodAndXP_Stats"), worldobjects, nil); 
	local subMenuStats = subMenu:getNew(subMenu); 
	context:addSubMenu(StatOption, subMenuStats);
	subMenuStats.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    
    local AllStatsToggle = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_AllStats"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_AllStats"), "CheatCoreCM.IsInfiniteStats") CheatCoreCM.AllStatsToggle() end)
    if CheatCoreCM.IsInfiniteStats or getPlayer():getModData().IsAllStats then
        AllStatsToggle.checkMark = true
    else
        AllStatsToggle.checkMark = false
    end

	local Hungriness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsHunger") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsHunger") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsHunger") end);
    if CheatCoreCM.IsHunger then
        Hungriness.checkMark = true
    else
        Hungriness.checkMark = false
    end
    
	local Thirstiness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsThirst") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsThirst") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsThirst") end);
    if CheatCoreCM.IsThirst then
        Thirstiness.checkMark = true
    else
        Thirstiness.checkMark = false
    end
    
	local Panic = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsPanic") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsPanic") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsPanic") end);
    if CheatCoreCM.IsPanic then
        Panic.checkMark = true
    else
        Panic.checkMark = false
    end
    
	local Sanity = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsSanity") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsSanity") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsSanity") end);
    if CheatCoreCM.IsSanity then
        Sanity.checkMark = true
    else
        Sanity.checkMark = false
    end
    
    local Happiness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsUnhappy") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsUnhappy") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsUnhappy") end);
    if CheatCoreCM.IsUnhappy then
        Happiness.checkMark = true
    else
        Happiness.checkMark = false
    end

    
	local Stress = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsStress") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsStress") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsStress") end);
    if CheatCoreCM.IsStress then
        Stress.checkMark = true
    else
        Stress.checkMark = false
    end
    
	local Listlessness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsBoredom") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsBoredom") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsBoredom") end);
    if CheatCoreCM.IsBoredom then
        Listlessness.checkMark = true
    else
        Listlessness.checkMark = false
    end

	local Fatigue = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsFatigue") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsFatigue") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsFatigue") end);
    if CheatCoreCM.IsFatigue then
        Fatigue.checkMark = true
    else
        Fatigue.checkMark = false
    end
    
	local Angriness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsAnger") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsAnger") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsAnger") end);
    if CheatCoreCM.IsAnger then
        Angriness.checkMark = true
    else
        Angriness.checkMark = false
    end
    
	local Pain = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsPain") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsPain") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsPain") end);
    if CheatCoreCM.IsPain then
        Pain.checkMark = true
    else
        Pain.checkMark = false
    end
    
	local Sickness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsSickness") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsSickness") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsSickness") end);
    if CheatCoreCM.IsSickness then
        Sickness.checkMark = true
    else
        Sickness.checkMark = false
    end
    
	local Drunkenness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsDrunk") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsDrunk") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsDrunkenness") end);
    if CheatCoreCM.IsDrunkenness then
        Drunkenness.checkMark = true
    else
        Drunkenness.checkMark = false
    end
    
	local Endurance = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsEndurance") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsEndurance") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsEndurance") end);
    if CheatCoreCM.IsEndurance then
        Endurance.checkMark = true
    else
        Endurance.checkMark = false
    end
    
	local Wetness = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsWet") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsWet") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsWet") end);
    if CheatCoreCM.IsWet then
        Wetness.checkMark = true
    else
        Wetness.checkMark = false
    end
    
	local Temperature = subMenuStats:addOption(getText("UI_CMRB_MoodAndXP_StatsTemperature") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_StatsTemperature") .. getText("UI_CMRB_MoodAndXP_StatsFixed"), "CheatCoreCM.IsTemperature") end);
    if CheatCoreCM.IsTemperature then
        Temperature.checkMark = true
    else
        Temperature.checkMark = false
    end
end


function ISUICheatMenu:createVehicleMenu(subMenu)
	local context = self.context
    
	
	local VehicleOption = subMenu:addOption(getText("UI_CMRB_Utility_Vehicles"), worldobjects, nil);
    
	local subMenuVehicle = subMenu:getNew(subMenu);
	context:addSubMenu(VehicleOption, subMenuVehicle);
    subMenuVehicle.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    
    local MechanicsCheat = subMenuVehicle:addOption(getText("UI_CMRB_Utility_VehicleMechanicsCheat"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Utility_VehicleMechanicsCheat"), "CheatCoreCM.IsMechanicsCheat") CheatCoreCM.DoMechanicsCheat() end, nil );
    

    if ISVehicleMechanics.cheat or getPlayer():isMechanicsCheat() then
        if CheatCoreCM.IsMechanicsCheat then
            MechanicsCheat.checkMark = true
        else
            CheatCoreCM.IsMechanicsCheat = true
            MechanicsCheat.checkMark = true
        end
    else
        if CheatCoreCM.IsMechanicsCheat then
            CheatCoreCM.IsMechanicsCheat = false
            MechanicsCheat.checkMark = false
        else
            MechanicsCheat.checkMark = false
        end
    end
    
    local SelectVehicleOption = subMenuVehicle:addOption(getText("UI_CMRB_Utility_VehicleSpawnerWindow"), worldobjects, VehicleSpawnCore.makeWindow);
    
    vehicleControl = VehicleControlWindow:checkExists(getText("UI_CMRB_VehicleControlWindow"), "Vehicle_Control", function() getPlayer():Say(getText("UI_CMRB_Message_AlreadyExistWindow")); print("[Cheat Menu] Error generating inputUI") end, nil)
    local VehicleControlOption = subMenuVehicle:addOption(getText("UI_CMRB_Utility_VehicleControl"), worldobjects, function() vehicleControl:setVisible(true) end)
    

	local carTable = {}
	if CheatCoreCM.IsReady == true then
		
 		local bodyOption = subMenuVehicle:addOption(getText("UI_CMRB_Utility_VehicleParts"), worldobjects, nil);
		local subMenuBody = subMenuVehicle:getNew(subMenuVehicle);
		context:addSubMenu(bodyOption, subMenuBody)
		
		local car = CheatCoreCM.SelectedVehicle
		local script = car:getScript();
		local deselect = function() 
            CheatCoreCM.IsReady = false; 
            CheatCoreCM.SelectedVehicle = nil; 
            for i = 2,#subMenuVehicle.options do
                subMenuVehicle.options[i] = nil 
            end 
        end
		local inputUI = ISUIGenericWindow:checkExists(getText("UI_CMRB_Utility_VehicleSetValueWindow"), "Vehicle_Value", function() print("[Cheat Menu] Error generating inputUI") end, nil)
		
		-- FIXME: spaghetti
		for k,v in pairs(CheatCoreCM.Parts) do
			if k ~= "nodisplay" then
			
				local catOption = subMenuBody:addOption(getText("IGUI_VehiclePartCat" .. k), worldobjects, nil);
				local subMenuCat = subMenuBody:getNew(subMenuBody);
				context:addSubMenu(catOption, subMenuCat)
				--print(k)
				
				
				for k,v in pairs(v) do
                --print(k)
                --print(v)
					local modOption = subMenuCat:addOption(getText("IGUI_VehiclePart" .. k), worldobjects, nil);
					local subMenuMod = subMenuCat:getNew(subMenuCat)
					context:addSubMenu(modOption, subMenuMod)
					local repair = subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Repair"), worldobjects, function() v:setCondition(100) end)
					local setCondition = subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Durability"), worldobjects, function() inputUI:setVisible(true); inputUI.func = function(val) v:setCondition(tonumber(val)) end end)
					--if v:getCategory() == "tire" then
						--subMenuMod:addOption("Set Pressure", worldobjects, function() inputUI:setVisible(true); inputUI.func = function(val) v:setContainerContentAmount(tonumber(val), false, false) end end)
					if v:isContainer() == true then
						subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_SetResource"), worldobjects, function() inputUI:setVisible(true); inputUI.func = function(val) v:setContainerContentAmount(tonumber(val), false, false) end end)
					elseif k == "Engine" then
						subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Quality"), worldobjects, function() inputUI:setVisible(true); inputUI.func = function(val) car:setEngineFeature(tonumber(val), car:getEngineLoudness(), car:getEnginePower()) end end)
						subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Loudness"), worldobjects, function() inputUI:setVisible(true); inputUI.func = function(val) car:setEngineFeature(car:getEngineQuality(), tonumber(val), car:getEnginePower()) end end)
						subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Power"), worldobjects, function() inputUI:setVisible(true); inputUI.func = function(val) car:setEngineFeature(car:getEngineQuality(), car:getEngineLoudness(), tonumber(val)) end end)
						local RPMOption = subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_RPM"), worldobjects, nil)
						local subMenuRPM = subMenuMod:getNew(subMenuMod)
						context:addSubMenu(RPMOption,subMenuRPM)
						local tbl = {{"firebird","Sport"},{"van","Heavy-Duty"},{"jeep","Standard"}} -- RPM types
						for i = 1,#tbl do
							subMenuRPM:addOption(tbl[i][2], worldobjects, function() car:getScript():setEngineRPMType(tbl[i][1]) end)
						end
						--subMenuMod:addOption("Set Max Speed", worldobjects, function() inputUI:setVisible(true); inputUI.func = function(val) car:setMaxSpeed(tonumber(val)) end end) -- chokes acceleration for some reason
					elseif v:getDoor() ~= nil then
						local door = v:getDoor()
						subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Lock"), worldobjects, function() if door:isLocked() then door:setLocked(false) else door:setLocked(true) end end)
					end
					local uninstall = subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Uninstall"), worldobjects, function() v:setInventoryItem(nil); car:update() end)
					
					if v:getItemType() ~= nil then
						local changeOption = subMenuMod:addOption(getText("UI_CMRB_Utility_VehicleParts_Change"))
						local subMenuChange = subMenuMod:getNew(subMenuMod)
						context:addSubMenu(changeOption, subMenuChange)
						
						
						for i = 0, v:getItemType():size() - 1 do
							local obj = v:getItemType():get(i)
                            --print(instanceItem(obj):getName())
							if v:isContainer() == true then
								--print(v:getContainerContentType())
								subMenuChange:addOption(instanceItem(obj):getName(), worldobjects, function() v:setInventoryItem(instanceItem(obj), 10); v:setContainerContentAmount(999, false, false); car:update() end) -- every container has a maximum amount that it cant exceed so the value I set it to doesnt really matter, I set it to 999 to ensure it'll be full
							else
								subMenuChange:addOption(instanceItem(obj):getName(), worldobjects, function() v:setInventoryItem(instanceItem(obj), 10); car:update() end)
							end
						end
					end
				end
				
			end
		end
		
		local selectOption = subMenuVehicle:addOption(getText("UI_CMRB_VehicleControl_DeselectVehicle"), worldobjects, deselect);
	else
    --[[
		local selectOption = subMenuVehicle:addOption(getText("UI_CMRB_Select_Existing_Vehicle"), worldobjects, function() CheatCoreCM.HandleToggle(nil, "CheatCoreCM.IsSelect", function() getPlayer():Say(getText("UI_CMRB_Selection_Mode") .. ( CheatCoreCM.IsSelect and getText("UI_CMRB_Enabled") .. getText("UI_CMRB_Vehicles_Selection") or getText("UI_CMRB_Disabled"))) end) end)
        ]]--
	end
end

ISUICheatMenu.MenuTexture = {
on = "media/ui/cm_on.png",
off = "media/ui/cm_off.png",
logo = "media/ui/cm_logo.png",
checkmark = "media/ui/checkmark-xxl.png"
}


function ISUICheatMenu.createMenuEntries(_player, _context, _worldObjects)

	local CM_Main_context = _context;
	local worldobjects = _worldObjects; 
	
	
	local CheatOption = CM_Main_context:addOption(getText("UI_CMRB_Menu_Title"), worldobjects);
	local subMenu = ISContextMenu:getNew(CM_Main_context);
    --print (ISUICheatMenu.MenuTexture.checkmark)
    CM_Main_context.tickTexture = getTexture(ISUICheatMenu.MenuTexture.logo)
    CheatOption.checkMark = true
    --CheatOption.tickTexture = getTexture(ISUICheatMenu.MenuTexture.checkmark)
    CheatOption.background = true
	CM_Main_context:addSubMenu(CheatOption, subMenu);
	

	ISUICheatMenu.context = CM_Main_context
	ISUICheatMenu.subMenu = subMenu
    
   
	ISUICheatMenu:CharacterCheatMenu()
    ISUICheatMenu:CombatCheatMenu()
    ISUICheatMenu:ItemCheatMenu()
    ISUICheatMenu:UtilityCheatMenu()
    ISUICheatMenu:TerrainCheatMenu()
    ISUICheatMenu:ObjectCheatMenu(worldobjects)
    ISUICheatMenu:MoodAndXPCheatMenu()
	


end


function ISUICheatMenu:CharacterCheatMenu()

	local context, subMenu = self.context, self.subMenu
    
    local DisableAllCheat = subMenu:addOption(getText("UI_CMRB_Menu_DisableAll"), worldobjects, function() CheatCoreCM.DisableAllCheat(); getPlayer():Say(getText("UI_CMRB_Message_DisableAll")) end);
    
    
	local CharacterCheatOption = subMenu:addOption(getText("UI_CMRB_Menu_Catagory_Character"), worldobjects, nil);
	local subMenuCharacter = subMenu:getNew(subMenu);
    subMenuCharacter.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
 	context:addSubMenu(CharacterCheatOption, subMenuCharacter);
    

    --subMenuCharacter:addOption(getText("UI_CMRB_Test_Object"), worldobjects, CheatCoreCM.TestObject)
    subMenuCharacter:addOption(getText("UI_CMRB_Character_Heal"), worldobjects, CheatCoreCM.DoHeal);
	
    local God = subMenuCharacter:addOption(getText("UI_CMRB_Character_God"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_God"), "CheatCoreCM.IsGod", CheatCoreCM.dragDownDisable) CheatCoreCM.DoGodMode() end, nil );

    if getPlayer():isGodMod() then
        if CheatCoreCM.IsGod then
            God.checkMark = true
        else
            CheatCoreCM.IsGod = true
            God.checkMark = true
        end
    else
        if CheatCoreCM.IsGod then
            CheatCoreCM.IsGod = false
            God.checkMark = false
        else
            God.checkMark = false
        end
    end
 
 
      local CreativeMode = subMenuCharacter:addOption(getText("UI_CMRB_Character_Creative"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_Creative"), "CheatCoreCM.IsCreativeMode") CheatCoreCM.DoCreativeMode() end)
    
     if ISBuildMenu.cheat and ISMoveableDefinitions.cheat then
        if CheatCoreCM.IsCreativeMode then
            CreativeMode.checkMark = true
        else
            CheatCoreCM.IsCreativeMode = true
            CreativeMode.checkMark = true
        end
    else
        if CheatCoreCM.IsCreativeMode then
            CheatCoreCM.IsCreativeMode = false
            CreativeMode.checkMark = false
        else
            CreativeMode.checkMark = false
        end
    end
    
    
    local Ghost = subMenuCharacter:addOption(getText("UI_CMRB_Character_Ghost"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_Ghost"), "CheatCoreCM.IsGhost") CheatCoreCM.DoGhostMode() end)
    
     if getPlayer():isGhostMode() then
        if CheatCoreCM.IsGhost then
            Ghost.checkMark = true
        else
            CheatCoreCM.IsGhost = true
            Ghost.checkMark = true
        end
    else
        if CheatCoreCM.IsGhost then
            CheatCoreCM.IsGhost = false
            Ghost.checkMark = false
        else
            Ghost.checkMark = false
        end
    end
    
        
    local NoClip = subMenuCharacter:addOption(getText("UI_CMRB_Character_Noclip"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_Noclip"), "CheatCoreCM.IsNoClip") CheatCoreCM.DoNoClipMode() end);

     if getPlayer():isNoClip() then
        if CheatCoreCM.IsNoClip then
            NoClip.checkMark = true
        else
            CheatCoreCM.IsNoClip = true
            NoClip.checkMark = true
        end
    else
        if CheatCoreCM.IsNoClip then
            CheatCoreCM.IsNoClip = false
            NoClip.checkMark = false
        else
            NoClip.checkMark = false
        end
    end
    
    
    local PreventDeath = subMenuCharacter:addOption(getText("UI_CMRB_Character_PreventDeath"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_PreventDeath"), "CheatCoreCM.DoPreventDeath") CheatCoreCM.DoPreventDeathMode() end);
    
    if CheatCoreCM.DoPreventDeath then
        PreventDeath.checkMark = true
    else
        PreventDeath.checkMark = false
    end
    
    
    --[[
    local CraftingCheat = subMenuCharacter:addOption(getText("UI_CMRB_Character_InstantCrafting"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_InstantCrafting"), "CheatCoreCM.IsCraftingCheat", "CheatCoreCM.ToggleInstantCrafting()") end);
    
    if CheatCoreCM.IsCraftingCheat then
        CraftingCheat.checkMark = true
    else
        CraftingCheat.checkMark = false
    end
    --]]
    
    
        local HealthPanelCheat = subMenuCharacter:addOption(getText("UI_CMRB_Character_HealthPanelCheat"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_HealthPanelCheat"), "CheatCoreCM.IsHelathCheat") CheatCoreCM.DoHealthCheat() end, nil );

     if ISHealthPanel.cheat or getPlayer():isHealthCheat() then
        if CheatCoreCM.IsHelathCheat then
            HealthPanelCheat.checkMark = true
        else
            CheatCoreCM.IsHelathCheat = true
            HealthPanelCheat.checkMark = true
        end
    else
        if CheatCoreCM.IsHelathCheat then
            CheatCoreCM.IsHelathCheat = false
            HealthPanelCheat.checkMark = false
        else
            HealthPanelCheat.checkMark = false
        end
    end    
    
    
    local InstantActions = subMenuCharacter:addOption(getText("UI_CMRB_Character_InstantActions"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Character_InstantActions"), "CheatCoreCM.IsActionCheat", "CheatCoreCM.ToggleInstantActions()") end) 
    
     if getPlayer():isTimedActionInstantCheat() then
        if CheatCoreCM.IsActionCheat then
            InstantActions.checkMark = true
        else
            CheatCoreCM.IsActionCheat = true
            InstantActions.checkMark = true
        end
    else
        if CheatCoreCM.IsActionCheat then
            CheatCoreCM.IsActionCheat = false
            InstantActions.checkMark = false
        else
            InstantActions.checkMark = false
        end
    end
    
    
    subMenuCharacter:addOption(getText("UI_CMRB_Character_ZombifiedSuicide"), worldobjects, function() CheatCoreCM.DoSuicide_With_Zombified() end);
    subMenuCharacter:addOption(getText("UI_CMRB_Character_Suicide"), worldobjects, function() CheatCoreCM.DoSuicide_Without_Zombified() end);
end


function ISUICheatMenu.WeaponCheck()
    local PrimaryHandItem = getPlayer():getPrimaryHandItem()
    local SecondaryHandItem = getPlayer():getSecondaryHandItem()
    if PrimaryHandItem ~= nil and SecondaryHandItem ~= nil and PrimaryHandItem == SecondaryHandItem then
        if PrimaryHandItem:IsWeapon() == SecondaryHandItem:IsWeapon() then
            if PrimaryHandItem:getStringItemType() == "RangedWeapon" then
                return 2
            else
                return 1
            end
        else
            return 0
        end
    else
        if PrimaryHandItem ~= nil then
            if PrimaryHandItem:IsWeapon() then
                if PrimaryHandItem:getStringItemType() == "RangedWeapon" then
                    return 2
                else
                    return 1
                end
            else
                return 0
            end
        elseif SecondaryHandItem ~= nil then
            if SecondaryHandItem:IsWeapon() then
                if SecondaryHandItem:getStringItemType() == "RangedWeapon" then
                    return 2
                else
                    return 1
                end
            else
                return 0
            end
        else
            return 0
        end
    end
end



function ISUICheatMenu:CombatCheatMenu()

    local WeaponCheck = ISUICheatMenu.WeaponCheck()

    local context, subMenu = self.context, self.subMenu

    local CombatCheatOption = subMenu:addOption(getText("UI_CMRB_Menu_Catagory_Combat"), worldobjects, nil);
    local subMenuCombat = subMenu:getNew(subMenu);
    subMenuCombat.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    context:addSubMenu(CombatCheatOption, subMenuCombat);

    if WeaponCheck == 2 then
        subMenuCombat:addOption(getText("UI_CMRB_Combat_RefillAmmo"), worldobjects, CheatCoreCM.DoRefillAmmo);

        local InfiniteAmmo = subMenuCombat:addOption(getText("UI_CMRB_Combat_InfiniteAmmo"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Combat_InfiniteAmmo"), "CheatCoreCM.IsAmmo") CheatCoreCM.DoInfiniteAmmoMode() end);
        if CheatCoreCM.IsAmmo then
            InfiniteAmmo.checkMark = true
        else
            InfiniteAmmo.checkMark = false
        end

        local NoReload = subMenuCombat:addOption(getText("UI_CMRB_Combat_NoDelayShots"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Combat_NoDelayShots"), "CheatCoreCM.NoReload", "CheatCoreCM.DoNoReload()") end); 
        if CheatCoreCM.NoReload then
            NoReload.checkMark = true
        else
            NoReload.checkMark = false
        end
    elseif WeaponCheck == 1 then
        subMenuCombat:addOption(getText("UI_CMRB_Combat_InstaKill"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Combat_InstaKill"), "CheatCoreCM.IsMelee", "CheatCoreCM.DoWeaponDamage()") end);

        local InfiniteDurability = subMenuCombat:addOption(getText("UI_CMRB_Combat_InfiniteItemDurability"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Combat_InfiniteItemDurability"), "CheatCoreCM.IsRepair") end);
        if CheatCoreCM.IsRepair then
            InfiniteDurability.checkMark = true
        else
            InfiniteDurability.checkMark = false
        end
    else
        local NoItems = subMenuCombat:addOption(getText("UI_CMRB_Combat_NotFoundItem"), worldobjects)
        NoItems.notAvailable = true
    end
end
    
    
function ISUICheatMenu:ItemCheatMenu()

	local context, subMenu = self.context, self.subMenu
    
	local ItemCheatOption = subMenu:addOption(getText("UI_CMRB_Menu_Catagory_Item"), worldobjects, nil);
	local subMenuItemC = subMenu:getNew(subMenu);
	context:addSubMenu(ItemCheatOption, subMenuItemC);
    subMenuItemC:addOption(getText("UI_CMRB_Item_ItemSpawnerWindow"), worldobjects, function() if crucibleCore.mainWindow == nil then crucibleUI.makeWindow() else crucibleCore.mainWindow:setVisible(true) end end)
    subMenuItemC:addOption(getText("UI_CMRB_Item_RepairEquippedItems"), worldobjects, function() CheatCoreCM.DoRepair() end);
    subMenuItemC:addOption(getText("UI_CMRB_Item_RepairWearingClothes"), worldobjects, function() CheatCoreCM.DoWearClothesRepair() end);
    subMenuItemC:addOption(getText("UI_CMRB_Item_RepairInventoryItems"), worldobjects, function() CheatCoreCM.DoALLRepair() end);
	
end
    
    
    
   
function ISUICheatMenu:UtilityCheatMenu()

	local context, subMenu = self.context, self.subMenu
    
	local UtilityCheatOption = subMenu:addOption(getText("UI_CMRB_Menu_Catagory_Utility"), worldobjects, nil);
	local subMenuUtility = subMenu:getNew(subMenu);
	context:addSubMenu(UtilityCheatOption, subMenuUtility);
    subMenuUtility.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    
	ISUICheatMenu:createTimeMenu(subMenuUtility)
    ISUICheatMenu:createVehicleMenu(subMenuUtility)
    
    subMenuUtility:addOption(getText("UI_CMRB_Utility_Weather"), worldobjects, function() local ui = ISAdminWeather.OnOpenPanel(); ui:onMadeActive() end);
	
	subMenuUtility:addOption(getText("UI_CMRB_Utility_TeleportLocation"), worldobjects, compassCore.makeWindow);
    subMenuUtility:addOption(getText("UI_CMRB_Utility_TeleportCoord"), worldobjects, TeleportWindow.makeWindow);
    
	subMenuUtility:addOption(getText("UI_CMRB_Utility_LuaEditor"), worldobjects, function() ISUILuaWindow.SetupBar() end);
    local Fly = subMenuUtility:addOption(getText("UI_CMRB_Utility_Fly"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Utility_Fly_Message"), "CheatCoreCM.IsFly") end);
        if CheatCoreCM.IsFly then
            Fly.checkMark = true
        else
            Fly.checkMark = false
        end

end

function ISUICheatMenu:TerrainCheatMenu()

	local context, subMenu = self.context, self.subMenu
	
	local TerrainCheatOption = subMenu:addOption(getText("UI_CMRB_Menu_Catagory_Terrain"), worldobjects, nil);

	local subMenuTerrain = subMenu:getNew(subMenu);
	context:addSubMenu(TerrainCheatOption, subMenuTerrain);
	subMenuTerrain.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)
    ISUICheatMenu:createTerraformMenu(subMenuTerrain)
    
    ISUICheatMenu:createDeleteMenu(subMenuTerrain)
    
    local FireBrush = subMenuTerrain:addOption(getText("UI_CMRB_Terrain_Fire"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_Terrain_Fire_Message"), "CheatCoreCM.FireBrushEnabled") end);
	if CheatCoreCM.FireBrushEnabled then
        FireBrush.checkMark = true
    else
        FireBrush.checkMark = false
    end
    
	ISUICheatMenu:createBarricadeMenu(subMenuTerrain)
    
	ISUICheatMenu:createZombieMenu(subMenuTerrain)

end


function ISUICheatMenu:MoodAndXPCheatMenu()

	local context, subMenu = self.context, self.subMenu
	
	local MoodAndXPCheatOption = subMenu:addOption(getText("UI_CMRB_Menu_Catagory_MoodAndXP"), worldobjects, nil);
	local subMenuMoodAndXP = subMenu:getNew(subMenu);
	context:addSubMenu(MoodAndXPCheatOption, subMenuMoodAndXP);
    subMenuMoodAndXP.tickTexture = getTexture(ISUICheatMenu.MenuTexture.on)

	ISUICheatMenu:createStatsMenu(subMenuMoodAndXP)
    local InfiniteCarryWeight = subMenuMoodAndXP:addOption(getText("UI_CMRB_MoodAndXP_InfiniteCarryweight"), worldobjects, function() CheatCoreCM.HandleToggle(getText("UI_CMRB_MoodAndXP_InfiniteCarryweight"), "CheatCoreCM.IsInfiniteCarryWeight") CheatCoreCM.DoCarryWeightCheat() end);
    
     if getPlayer():isUnlimitedCarry() then
        if CheatCoreCM.IsInfiniteCarryWeight then
            InfiniteCarryWeight.checkMark = true
        else
            CheatCoreCM.IsInfiniteCarryWeight = true
            InfiniteCarryWeight.checkMark = true
        end
    else
        if CheatCoreCM.IsInfiniteCarryWeight then
            CheatCoreCM.IsInfiniteCarryWeight = false
            InfiniteCarryWeight.checkMark = false
        else
            InfiniteCarryWeight.checkMark = false
        end
    end
    
    
	ISUICheatMenu:createXPMenu(subMenuMoodAndXP)
	subMenuMoodAndXP:addOption(getText("UI_CMRB_MoodAndXP_LearnRecipes"), worldobjects, function() CheatCoreCM.DoLearnRecipes() end)
    subMenuMoodAndXP:addOption(getText("UI_CMRB_MoodAndXP_ForgetRecipes"), worldobjects, function() CheatCoreCM.DoForgetRecipes() end)
    
end


function ISUICheatMenu.CoreEvents()       
    ISUICheatMenu.PrivilegeCheck()
    Events.OnAddMessage.Add(ISUICheatMenu.PrivilegeCheck)
end

ISUICheatMenu.AdminTrigger = 0
ISUICheatMenu.RevokeTrigger = 0
ISUICheatMenu.WarningMessageTrigger = 0

function ISUICheatMenu.AdminCheck()
    if string.match(tostring(getPlayer():getAccessLevel()), "Admin") or string.match(tostring(getPlayer():getAccessLevel()), "GM") or string.match(tostring(getPlayer():getAccessLevel()), "Moderator") or isAdmin() or isCoopHost() then
        return true
    else
        return false
    end
end

function ISUICheatMenu.ModIntegrityCheck()
    if tostring(getServerOptions():getOption("DoLuaChecksum")) == "true" then
        return true
    else
        return false
    end
end

function ISUICheatMenu.PrivilegeCheck()
    if isClient() then
        if ISUICheatMenu.AdminCheck() then
            if ISUICheatMenu.ModIntegrityCheck() and CheatCoreCM.DoLuaChecksum then
                if ISUICheatMenu.AdminTrigger == 0 then
                    ISUICheatMenu.EventsRemove() -- Reload duplicate prevention
                    getPlayer():Say(getText("UI_CMRB_Message_AdminGrant"))
                    ISUICheatMenu.EventsAdd()
                    CheatCoreCM.SyncVariables()
                    local Username = getOnlineUsername()
                    if Username ~= nil then
                        print("[CHEAT MENU] User "..Username.." is authorized! This message will appear the next time the client connects.")
                    end
                    ISUICheatMenu.AdminTrigger = 1
                end
                ISUICheatMenu.RevokeTrigger = 0
                ISUICheatMenu.WarningMessageTrigger = 0
                
            elseif ISUICheatMenu.ModIntegrityCheck() and not CheatCoreCM.DoLuaChecksum then
                if ISUICheatMenu.AdminTrigger == 0 then
                    ISUICheatMenu.EventsRemove() -- Reload duplicate prevention
                    getPlayer():Say(getText("UI_CMRB_Message_ServerChecksModIntegrity"))
                    getPlayer():Say(getText("UI_CMRB_Message_AdminGrant"))
                    ISUICheatMenu.EventsAdd()
                    CheatCoreCM.SyncVariables()
                    local Username = getOnlineUsername()
                    if Username ~= nil then
                        print("[CHEAT MENU] User "..Username.." is authorized! This message will appear the next time the client connects.")
                    end
                    ISUICheatMenu.AdminTrigger = 1
                end
                ISUICheatMenu.RevokeTrigger = 0
                ISUICheatMenu.WarningMessageTrigger = 0
                
            elseif not ISUICheatMenu.ModIntegrityCheck() and CheatCoreCM.DoLuaChecksum then
                if ISUICheatMenu.WarningMessageTrigger == 0 then
                    WaringBox = ISModalDialog:new(getCore():getScreenWidth() / 2 - 250, getCore():getScreenHeight() / 2 - 75, 500, 150, getText("UI_CMRB_Warning_ServerSetting"), false, self, nil)
                    WaringBox:initialise()
                    WaringBox:setAlwaysOnTop(true)
                    WaringBox:bringToTop(true)
                    WaringBox:addToUIManager()
                    ISUICheatMenu.WarningMessageTrigger = 1
                end
                CheatCoreCM.DisableAllCheat()
                ISUICheatMenu.EventsRemove()
                ISUICheatMenu.AdminTrigger = 0
                
            elseif not ISUICheatMenu.ModIntegrityCheck() and not CheatCoreCM.DoLuaChecksum then
                if ISUICheatMenu.AdminTrigger == 0  then
                    ISUICheatMenu.EventsRemove() -- Reload duplicate prevention
                    getPlayer():Say(getText("UI_CMRB_Message_AdminGrant"))
                    ISUICheatMenu.EventsAdd()
                    CheatCoreCM.SyncVariables()
                    local Username = getOnlineUsername()
                    if Username ~= nil then
                        print("[CHEAT MENU] User "..Username.." is authorized! This message will appear the next time the client connects.")
                    end
                    ISUICheatMenu.AdminTrigger = 1
                    CheatOption.OptionTrigger = 1
                end
                ISUICheatMenu.RevokeTrigger = 0
                ISUICheatMenu.WarningMessageTrigger = 0
            end 
        else
            if ISUICheatMenu.RevokeTrigger == 0 then
                CheatCoreCM.DisableAllCheat()
                ISUICheatMenu.EventsRemove()
                getPlayer():Say(getText("UI_CMRB_Message_AdminRevoke"))
                ISUICheatMenu.RevokeTrigger = 1
            end
            ISUICheatMenu.AdminTrigger = 0
            ISUICheatMenu.WarningMessageTrigger = 0
        end
    else
        if ISUICheatMenu.AdminTrigger == 0 then
            ISUICheatMenu.EventsRemove()  -- Reload duplicate prevention
            ISUICheatMenu.EventsAdd()
            local Username = getOnlineUsername()
            if Username ~= nil then
                print("[CHEAT MENU] User "..Username.." is authorized! This message will appear the next time the client connects.")
            end
            ISUICheatMenu.AdminTrigger = 1
        end
    end
end

function ISUICheatMenu.EventsAdd()
    Events.OnFillWorldObjectContextMenu.Add(ISUICheatMenu.createMenuEntries)
    Events.OnFillWorldObjectContextMenu.Add (CheatCoreCM.DisableSelectionMode);
    Events.OnTick.Add(CheatCoreCM.DoTickCheats);
    Events.OnTick.Add(CheatCoreCM.CheckCheatEnabled);
    Events.OnMouseDown.Add(CheatCoreCM.OnClick);
    Events.OnKeyKeepPressed.Add(CheatCoreCM.OnKeyKeepPressed);
    Events.OnKeyPressed.Add(CheatCoreCM.OnKeyPressed);
    Events.OnPlayerMove.Add(CheatCoreCM.updateCoords);
    Events.OnMouseMove.Add(CheatCoreCM.highlightSquare);
end

function ISUICheatMenu.EventsRemove()
    Events.OnFillWorldObjectContextMenu.Remove(ISUICheatMenu.createMenuEntries)
    Events.OnFillWorldObjectContextMenu.Remove (CheatCoreCM.DisableSelectionMode);
    Events.OnTick.Remove(CheatCoreCM.DoTickCheats);
    Events.OnTick.Remove(CheatCoreCM.CheckCheatEnabled);
    Events.OnMouseDown.Remove(CheatCoreCM.OnClick);
    Events.OnKeyKeepPressed.Remove(CheatCoreCM.OnKeyKeepPressed);
    Events.OnKeyPressed.Remove(CheatCoreCM.OnKeyPressed);
    Events.OnPlayerMove.Remove(CheatCoreCM.updateCoords);
    Events.OnMouseMove.Remove(CheatCoreCM.highlightSquare);
end

Events.OnLoad.Add(ISUICheatMenu.CoreEvents)

print("[CHEAT MENU] ISUICheatMenu successfully loaded")