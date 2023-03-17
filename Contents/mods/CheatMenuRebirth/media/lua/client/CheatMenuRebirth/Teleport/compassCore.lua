require "CheatMenuRebirth/Teleport/compassMain"
require "CheatMenuRebirth/Teleport/compassList"
require "CheatMenuRebirth/Teleport/compassPOI"
require "CheatMenuRebirth/CheatCore"

compassCore = {}
compassCore.categories = {}
compassCore.Wmod = 0.70
compassCore.Hmod = 1

function compassCore.makeWindow()
	if compassCore.mainWindow == nil then
		local sw = getCore():getScreenWidth()
		local sh = getCore():getScreenHeight()
		local w = (sw / 3.8) * compassCore.Wmod <= sw and (sw / 3.8) * compassCore.Wmod or sw
		local h = (sh / 1.3) * compassCore.Hmod <= sh and (sh / 1.3) * compassCore.Hmod or sh
		local window = compassUI:new(50,50, w,h)
		window:setVisible(true)
		window:addToUIManager()
		local mt = getmetatable(compassCore.debug)
		compassCore.mainWindow = window
		setmetatable(compassCore.mainWindow, mt)
	else
		compassCore.mainWindow:setVisible(true)
	end
end

function compassCore.removeWindow()
	local window = compassCore.mainWindow
	window:setVisible(false)
	window:removeFromUIManager()
end

function compassCore.scale(num,percentage, subt)
	if subt then
		return num - (num * percentage)
	else
		return num + (num * percentage)
	end
end

function compassCore.processJson(update)
	local mapFile = {}
	compassCore.locations = {}
	local mapString = ""
	local strm = getModFileReader("CheatMenuRB", "teleport_locations/maplocations.txt", true)
	--local strm = update and getUrlInputStream("https://raw.githubusercontent.com/ethanwdp/Mod-Versions/master/PZ%20map%20locations") or getModFileReader("cheatmenu", "teleport_locations/maplocations.txt", true) -- old version

	while true do
		local line = strm:readLine()
		if line == nil then break
		else
			mapString = mapString .. line .. "\r\n"
		end
	end

	--print (mapString)
	loadstring("compassCore.mapTbl = " .. mapString)()
	local a = compassCore.mapTbl

	local inc = 0

	for i = 1,#a["areas"] do
		inc = inc+1
		local t = a["areas"][i]
		compassCore.locations[t["name"]] = t
		compassCore.locations[t["name"]]["pois"] = t["pois"]
	end


	setmetatable(compassCore.locations, { ["__index"] = {["size"] = inc + 1} })
	--compassCore.sort()
    
    local customsFileCheck = CheatCoreCM.checkFile("CheatMenuRB", "teleport_locations/customlocations.txt")
    
	local customs = CheatCoreCM.readFile("CheatMenuRB", "teleport_locations/customlocations.txt")

   
	compassCore.locations["Custom"] = {}
	compassCore.locations["Custom"]["pois"] = loadstring("return " .. customs[1] or "{}")()
end

function compassCore:updateCustom()
	local proxy = {}
	local locations = self.locations["Custom"]["pois"]

	for i = 1,#locations do
		local str = "{"
		for k,v in pairs(locations[i]) do
			str = str .. "['" .. k .. "'] = "  .. (type(v) == "string" and "'" .. v  .. "'" or v) .. ";"
		end
		str = str .. ( i == #locations and "}" or "}, ")
		table.insert(proxy, str)
	end
	local str = "{"
	for i = 1,#proxy do
		str = str .. proxy[i]
	end
	str = str .. "}"
	CheatCoreCM.writeFile({str}, "CheatMenuRB", "teleport_locations/customlocations.txt")
	--compassCore.sort()
end

function compassCore:addCustom()
	local custom = {["name"] = "Custom Location"; ["x"] = getPlayer():getX(); ["y"] = getPlayer():getY(); ["z"] = getPlayer():getZ()}
	table.insert(self.locations["Custom"]["pois"], custom)
	self:updateCustom()
end

--[[
Could not solve the sort algorithm, will figure out later.
function compassCore.sort()
	for k,v in pairs(compassCore.locations) do
        --print (k)
    for a,b in pairs(v) do
        --print (a, b)
        if tostring(a) == "pois" then
            for c,d in pairs (b) do
            --print (k, a, c)
                table.sort(compassCore.locations[k][a][c])

                for e, f in pairs (d) do
                    print (e, f)
                end

			end
		end
	end
	end
end
--]]

compassCore.processJson()

--Events.OnLoad.Add(compassCore.makeWindow)