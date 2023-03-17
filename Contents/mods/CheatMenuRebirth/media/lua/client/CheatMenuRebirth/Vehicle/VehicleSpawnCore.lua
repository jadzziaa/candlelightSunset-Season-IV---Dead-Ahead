require "CheatMenuRebirth/Vehicle/VehicleSpawnList"
require "CheatMenuRebirth/Vehicle/VehicleSpawnDeploy"
require "CheatMenuRebirth/Vehicle/VehicleSpawnMain"

VehicleSpawnCore = {}
-- width/height modifiers, used during main window creation
VehicleSpawnCore.Wmod = 0.70 
VehicleSpawnCore.Hmod = 1
VehicleSpawnCore.IDs = {}


function VehicleSpawnCore.makeWindow()
	if VehicleSpawnCore.mainWindow == nil then
		local sw = getCore():getScreenWidth()
		local sh = getCore():getScreenHeight()
		local w = (sw / 3.8) * VehicleSpawnCore.Wmod <= sw and (sw / 3.8) * VehicleSpawnCore.Wmod or sw -- window will not be larger than the display area
		local h = (sh / 1.3) * VehicleSpawnCore.Hmod <= sh and (sh / 1.3) * VehicleSpawnCore.Hmod or sh
		local window = VehicleSpawnUI:new(50,50, w,h) -- original design is scaled on getScreenWidth() / 3.8, old height is 1.3
		window:setVisible(true)
		window:addToUIManager()
		local mt = getmetatable(VehicleSpawnCore.debug)
		VehicleSpawnCore.mainWindow = window
        VehicleSpawnCore.IDs = "VehicleSpawn"
		setmetatable(VehicleSpawnCore.mainWindow, mt)
	else
		VehicleSpawnCore.mainWindow:setVisible(true)
	end
end

function VehicleSpawnCore.removeWindow() -- may replace with close() or destroy()
	local window = VehicleSpawnCore.mainWindow
	window:setVisible(false)
    VehicleSpawnCore.IDs = nil
	window:removeFromUIManager()
end

function VehicleSpawnCore.scale(num,percentage, subt)
	if subt then
		return num - (num * percentage)
	else
		return num + (num * percentage)
	end
end



function VehicleSpawnCore.processJson()
    local mods = getActivatedMods()
    local scripts = getScriptManager():getAllVehicleScripts()
    local v_table = {
    Standards = {["type"]={}, ["name"]={}, ["spawnname"]={}, ["fullname"]={}},
    Sports = {["type"]={}, ["name"]={}, ["spawnname"]={}, ["fullname"]={}},
    Heavy_Duty = {["type"]={}, ["name"]={}, ["spawnname"]={}, ["fullname"]={}},
    Trailer = {["type"]={}, ["name"]={}, ["spawnname"]={}, ["fullname"]={}},
    Smashed = {["type"]={}, ["name"]={}, ["spawnname"]={}, ["fullname"]={}},
    Burnt = {["type"]={}, ["name"]={}, ["spawnname"]={}, ["fullname"]={}}
    }
    

     if string.find (tostring(mods), "AquatsarYachtClub") then   
        v_table["Boats"] = {["type"]={}, ["name"]={}, ["spawnname"]={}, ["fullname"]={}}
    end

   local splitStr = " ";
   local temp_name = nil
    for i = 1, scripts:size() do
        local script = scripts:get(i - 1)
        
        
        local name = script:getName()
        local oname = script:getFileName()
        local fname = script:getFullName()
        local v_type = script:getMechanicType()
        --[[
        local mname = script:getModel()
        print (name)
        print (oname)
        print (fname)
        print ("=====")
        print (mname)
        local target_type = nil
        print (oname)
        --]]
        
        local fullname = getText("IGUI_VehicleName" .. name);
        --print ("Original")
        --print (fullname)
        if string.match(name, "Burnt") then
            local unburnt = string.gsub(name, "Burnt", "");
            if getTextOrNull("IGUI_VehicleName" .. unburnt) then
                fullname = getText("IGUI_VehicleName" .. unburnt);
                --print ("Converted")
                --print (fullname)
            end
            
            fullname = getText("IGUI_VehicleNameBurntCar", fullname);
            --print ("Converted_2")
            --print (fullname)
            
        elseif string.match(name, "SmashedLeft") then
            local unburnt = string.gsub(name, "SmashedLeft", "");
            if getTextOrNull("IGUI_VehicleName" .. unburnt) then
                fullname = getText("IGUI_VehicleName" .. unburnt);
                --print ("Converted")
                --print (fullname)
            end
            
            fullname = getText("IGUI_VehicleNameBurntCar", fullname);
            --print ("Converted_2")
            --print (fullname)
            
        elseif string.match(name, "SmashedRight") then
            local unburnt = string.gsub(name, "SmashedRight", "");
            if getTextOrNull("IGUI_VehicleName" .. unburnt) then
                fullname = getText("IGUI_VehicleName" .. unburnt);
                --print ("Converted")
                --print (fullname)
            end
            
            fullname = getText("IGUI_VehicleNameBurntCar", fullname);
            --print ("Converted_2")
            --print (fullname)
            
        elseif string.match(name, "SmashedRear") then
            local unburnt = string.gsub(name, "SmashedRear", "");
            if getTextOrNull("IGUI_VehicleName" .. unburnt) then
                fullname = getText("IGUI_VehicleName" .. unburnt);
                --print ("Converted")
                --print (fullname)
            end
            
            fullname = getText("IGUI_VehicleNameBurntCar", fullname);
            --print ("Converted_2")
            --print (fullname)
            
        elseif string.match(name, "BurntClassic") then
            local unburnt = string.gsub(name, "BurntClassic", "");
            if getTextOrNull("IGUI_VehicleName" .. unburnt) then
                fullname = getText("IGUI_VehicleName" .. unburnt);
                --print ("Converted")
                --print (fullname)
            end
            
            fullname = getText("IGUI_VehicleNameBurntCar", fullname);
            --print ("Converted_2")
            --print (fullname)
        end


        if name ~= temp_name then
            temp_name = name
            


             if string.match (fname, "wreck") or string.match (fname, "Wreck") then
                    if string.find (tostring(mods), "AquatsarYachtClub") then
                        v_type = 0
                        table.insert (v_table["Burnt"]["type"], v_type)
                        table.insert (v_table["Burnt"]["name"], name)
                        table.insert (v_table["Burnt"]["spawnname"], fname)
                        table.insert (v_table["Burnt"]["fullname"], fullname)
                    end
            
            elseif string.match (fname, "Boat") and not string.match (fname, "Trailer") then
                if string.find (tostring(mods), "AquatsarYachtClub") then
                    v_type = 5 
                    table.insert (v_table["Boats"]["type"], v_type)
                    table.insert (v_table["Boats"]["name"], name)
                    table.insert (v_table["Boats"]["spawnname"], fname)
                    table.insert (v_table["Boats"]["fullname"], fullname)
                end
                
            elseif string.match (fname, "Trailer") then
                v_type = 4
                table.insert (v_table["Trailer"]["type"], v_type)
                table.insert (v_table["Trailer"]["name"], name)
                table.insert (v_table["Trailer"]["spawnname"], fname)
                table.insert (v_table["Trailer"]["fullname"], fullname)
            
            elseif string.match (oname, "CrashedBurnt") then
                v_type = 0
                table.insert (v_table["Smashed"]["type"], v_type)
                table.insert (v_table["Smashed"]["name"], name)
                table.insert (v_table["Smashed"]["spawnname"], fname)
                table.insert (v_table["Smashed"]["fullname"], fullname)
                
                
            elseif string.match (fname, "smashed") or string.match (fname, "Smashed") then
                v_type = 0
                table.insert (v_table["Smashed"]["type"], v_type)
                table.insert (v_table["Smashed"]["name"], name)
                table.insert (v_table["Smashed"]["spawnname"], fname)
                table.insert (v_table["Smashed"]["fullname"], fullname)
                
            elseif string.match (fname, "burnt") or string.match (fname, "Burnt") then
                v_type = 0
                table.insert (v_table["Burnt"]["type"], v_type)
                table.insert (v_table["Burnt"]["name"], name)
                table.insert (v_table["Burnt"]["spawnname"], fname)
                table.insert (v_table["Burnt"]["fullname"], fullname)
            
            --[[
            elseif v_type == 0 then
                table.insert (v_table["Unusable"]["type"], v_type)
                table.insert (v_table["Unusable"]["name"], name)
                table.insert (v_table["Unusable"]["fullname"], fullname)
            --]]
            
            elseif v_type == 1 then
                table.insert (v_table["Standards"]["type"], v_type)
                table.insert (v_table["Standards"]["name"], name)
                table.insert (v_table["Standards"]["spawnname"], fname)
                table.insert (v_table["Standards"]["fullname"], fullname)

            elseif v_type == 2 then
                table.insert (v_table["Heavy_Duty"]["type"], v_type)
                table.insert (v_table["Heavy_Duty"]["name"], name)
                table.insert (v_table["Heavy_Duty"]["spawnname"], fname)
                table.insert (v_table["Heavy_Duty"]["fullname"], fullname)
            
            elseif v_type == 3 then
                table.insert (v_table["Sports"]["type"], v_type)
                table.insert (v_table["Sports"]["name"], name)
                table.insert (v_table["Sports"]["spawnname"], fname)
                table.insert (v_table["Sports"]["fullname"], fullname)
            end
        end
    end
   VehicleSpawnCore.v_types = v_table
end




--[[
function VehicleSpawnCore:updateCustom()
	local proxy = {}
	local v_types = self.v_types["Custom"]["spawnname"]
	
	for i = 1,#v_types do -- convert table to string
		local str = "{"
		for k,v in pairs(v_types[i]) do
			str = str .. "['" .. k .. "'] = "  .. (type(v) == "string" and "'" .. v  .. "'" or v) .. ";"
		end
		str = str .. ( i == #v_types and "}" or "}, ")
		table.insert(proxy, str)
	end
	local str = "{"
	for i = 1,#proxy do
		str = str .. proxy[i]
	end
	str = str .. "}"
	CheatCoreCM.writeFile({str}, "cheatmenu", "VehicleSpawns_list/customv_types.txt")
end
--]]

--[[
function VehicleSpawnCore:addCustom()
	local custom = {["name"] = "Custom Location"; ["x"] = getPlayer():getX(); ["y"] = getPlayer():getY(); ["z"] = getPlayer():getZ()}
	table.insert(self.v_types["Custom"]["pois"], custom)
	self:updateCustom()
end
--]]

function VehicleSpawnCore.sort(func) -- Not yet
	for k,v in pairs(VehicleSpawnCore.v_types) do
		table.sort(VehicleSpawnCore.v_types[k], func) -- sort alphabetically
	end
end



VehicleSpawnCore.processJson()

--Events.OnLoad.Add(VehicleSpawnCore.makeWindow)