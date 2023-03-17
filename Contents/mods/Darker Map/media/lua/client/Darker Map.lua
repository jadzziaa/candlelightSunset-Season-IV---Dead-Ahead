function DarkerMap_InitWorldMap()
	local INSET = 0
	local playerNum = getPlayer():getPlayerNum()
	ISWorldMap_instance = ISWorldMap:new(INSET, INSET, getCore():getScreenWidth() - INSET * 2, getCore():getScreenHeight() - INSET * 2)
	ISWorldMap_instance:initialise()
	ISWorldMap_instance:instantiate()
--		ISWorldMap_instance:setAlwaysOnTop(true) -- Breaks context menu
	ISWorldMap_instance.character = getSpecificPlayer(playerNum)
	ISWorldMap_instance.playerNum = playerNum
	ISWorldMap_instance.symbolsUI.character = getSpecificPlayer(playerNum)
	ISWorldMap_instance.symbolsUI.playerNum = playerNum
	ISWorldMap_instance.symbolsUI:checkInventory()
	ISWorldMap_instance:initDataAndStyle()
	ISWorldMap_instance:setHideUnvisitedAreas(ISWorldMap_instance.hideUnvisitedAreas)
	ISWorldMap_instance:setShowPlayers(ISWorldMap_instance.showPlayers)
	ISWorldMap_instance:setShowRemotePlayers(ISWorldMap_instance.showRemotePlayers)
	ISWorldMap_instance:setShowPlayerNames(ISWorldMap_instance.showPlayerNames)
	ISWorldMap_instance:setShowCellGrid(ISWorldMap_instance.showCellGrid)
	ISWorldMap_instance:setShowTileGrid(ISWorldMap_instance.showTileGrid)
	ISWorldMap_instance:setIsometric(ISWorldMap_instance.isometric)
	ISWorldMap_instance.mapAPI:resetView()
	if ISWorldMap_instance.character then
		ISWorldMap_instance.mapAPI:centerOn(ISWorldMap_instance.character:getX(), ISWorldMap_instance.character:getY())
		ISWorldMap_instance.mapAPI:setZoom(18.0)
	end
	ISWorldMap_instance:restoreSettings()
	ISWorldMap_instance:addToUIManager()
	ISWorldMap_instance.getJoypadFocus = true
	for i=1,getNumActivePlayers() do
		if getSpecificPlayer(i-1) then
			getSpecificPlayer(i-1):setBlockMovement(true)
		end
	end
	ISWorldMap_instance.symbolsUI:undisplay()
	ISWorldMap_instance:setVisible(false)
	ISWorldMap_instance:removeFromUIManager()
end

function DarkerMap_UpdatePencilRGB()
	for i, colorBtn in ipairs(ISWorldMap_instance.symbolsUI.colorButtons) do
		if colorBtn.buttonInfo.tooltip == getText("Tooltip_Map_NeedPencil") then
			colorBtn.buttonInfo.colorInfo:set(0.1,0.1,0.1,1)
			colorBtn.backgroundColor.r = 0.1
			colorBtn.backgroundColor.g = 0.1
			colorBtn.backgroundColor.b = 0.1
		end
	end
end

function DarkerMap_UpdateStyle()
	local mapUI = ISWorldMap_instance
	local MINZ = 0
	local MAXZ = 24
	local mapAPI = mapUI.javaObject:getAPIv1()
	local styleAPI = mapAPI:getStyleAPI()
	
	local r,g,b = 219/255, 215/255, 192/255
	local brightnessfactor = 0.8
	local undiscovereddiv = 3
	mapAPI:setBackgroundRGBA(r * brightnessfactor, g * brightnessfactor, b * brightnessfactor, 1.0)
	mapAPI:setUnvisitedRGBA((r/undiscovereddiv) * 0.915 * brightnessfactor, (g/undiscovereddiv) * 0.915 * brightnessfactor, (b/undiscovereddiv) * 0.915 * brightnessfactor, 1.0)
	
	-- OLD: mapAPI:setUnvisitedGridRGBA((r/undiscovereddiv) * 0 * brightnessfactor, (g/undiscovereddiv) * 0 * brightnessfactor, (b/undiscovereddiv) * 0 * brightnessfactor, .05)
	-- this fixes the black grid around the edges, instead we'll use a super transparent white grid instead of a very faint darker one that is fully opaque.
	mapAPI:setUnvisitedGridRGBA(1,1,1,.03)
	
	styleAPI:clear()

	local layer = styleAPI:newPolygonLayer("forest")
	layer:setMinZoom(13.5)
	layer:setFilter("natural", "forest")
	if true then
		layer:addFill(MINZ, 189 * brightnessfactor, 197 * brightnessfactor, 163 * brightnessfactor, 0)
		layer:addFill(13.5, 189 * brightnessfactor, 197 * brightnessfactor, 163 * brightnessfactor, 0)
		layer:addFill(14, 189 * brightnessfactor, 197 * brightnessfactor, 163 * brightnessfactor, 255)
		layer:addFill(MAXZ, 189 * brightnessfactor, 197 * brightnessfactor, 163 * brightnessfactor, 255)
	else
		layer:addFill(MINZ, 255 * brightnessfactor, 255 * brightnessfactor, 255 * brightnessfactor, 255)
		layer:addFill(MAXZ, 255 * brightnessfactor, 255 * brightnessfactor, 255 * brightnessfactor, 255)
		layer:addTexture(MINZ, "media/textures/worldMap/Grass.png")
		layer:addTexture(MAXZ, "media/textures/worldMap/Grass.png")
		layer:addScale(13.5, 4.0)
		layer:addScale(MAXZ, 4.0)
	end

	layer = styleAPI:newPolygonLayer("water")
	layer:setMinZoom(MINZ)
	layer:setFilter("water", "river")
	if not WATER_TEXTURE then
		layer:addFill(MINZ, 59 * brightnessfactor, 141 * brightnessfactor, 149 * brightnessfactor, 255)
		layer:addFill(MAXZ, 59 * brightnessfactor, 141 * brightnessfactor, 149 * brightnessfactor, 255)
	else
		layer:addFill(MINZ, 59 * brightnessfactor, 141 * brightnessfactor, 149 * brightnessfactor, 255)
		layer:addFill(14.5, 59 * brightnessfactor, 141 * brightnessfactor, 149 * brightnessfactor, 255)
		layer:addFill(14.5, 255 * brightnessfactor, 255 * brightnessfactor, 255 * brightnessfactor, 255)
		layer:addTexture(MINZ, nil)
		layer:addTexture(14.5, nil)
		layer:addTexture(14.5, "media/textures/worldMap/Water.png")
		layer:addTexture(MAXZ, "media/textures/worldMap/Water.png")
	--		layer:addScale(MINZ, 4.0)
	--		layer:addScale(MAX, 4.0)
	end

	layer = styleAPI:newPolygonLayer("road-trail")
	layer:setMinZoom(12.0)
	layer:setFilter("highway", "trail")
	layer:addFill(12.25, 185 * brightnessfactor, 122 * brightnessfactor, 87 * brightnessfactor, 0)
	layer:addFill(13, 185 * brightnessfactor, 122 * brightnessfactor, 87 * brightnessfactor, 255)
	layer:addFill(MAXZ, 185 * brightnessfactor, 122 * brightnessfactor, 87 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("road-tertiary")
	layer:setMinZoom(11.0)
	layer:setFilter("highway", "tertiary")
	layer:addFill(11.5, 171 * brightnessfactor, 158 * brightnessfactor, 143 * brightnessfactor, 0)
	layer:addFill(13, 171 * brightnessfactor, 158 * brightnessfactor, 143 * brightnessfactor, 255)
	layer:addFill(MAXZ, 171 * brightnessfactor, 158 * brightnessfactor, 143 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("road-secondary")
	layer:setMinZoom(11.0)
	layer:setFilter("highway", "secondary")
	layer:addFill(MINZ, 134 * brightnessfactor, 125 * brightnessfactor, 113 * brightnessfactor, 255)
	layer:addFill(MAXZ, 134 * brightnessfactor, 125 * brightnessfactor, 113 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("road-primary")
	layer:setMinZoom(11.0)
	layer:setFilter("highway", "primary")
	layer:addFill(MINZ, 134 * brightnessfactor, 125 * brightnessfactor, 113 * brightnessfactor, 255)
	layer:addFill(MAXZ, 134 * brightnessfactor, 125 * brightnessfactor, 113 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("railway")
	layer:setMinZoom(14.0)
	layer:setFilter("railway", "*")
	layer:addFill(MINZ, 200 * brightnessfactor, 191 * brightnessfactor, 231 * brightnessfactor, 255)
	layer:addFill(MAXZ, 200 * brightnessfactor, 191 * brightnessfactor, 231 * brightnessfactor, 255)

	-- Default, same as building-Residential
	layer = styleAPI:newPolygonLayer("building")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "yes")
	layer:addFill(13.0, 210 * brightnessfactor, 158 * brightnessfactor, 105 * brightnessfactor, 0)
	layer:addFill(13.5, 210 * brightnessfactor, 158 * brightnessfactor, 105 * brightnessfactor, 255)
	layer:addFill(MAXZ, 210 * brightnessfactor, 158 * brightnessfactor, 105 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("building-Residential")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Residential")
	layer:addFill(13.0, 210 * brightnessfactor, 158 * brightnessfactor, 105 * brightnessfactor, 0)
	layer:addFill(13.5, 210 * brightnessfactor, 158 * brightnessfactor, 105 * brightnessfactor, 255)
	layer:addFill(MAXZ, 210 * brightnessfactor, 158 * brightnessfactor, 105 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("building-CommunityServices")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "CommunityServices")
	layer:addFill(13.0, 139 * brightnessfactor, 117 * brightnessfactor, 235 * brightnessfactor, 0)
	layer:addFill(13.5, 139 * brightnessfactor, 117 * brightnessfactor, 235 * brightnessfactor, 255)
	layer:addFill(MAXZ, 139 * brightnessfactor, 117 * brightnessfactor, 235 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("building-Hospitality")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Hospitality")
	layer:addFill(13.0, 127 * brightnessfactor, 206 * brightnessfactor, 225 * brightnessfactor, 0)
	layer:addFill(13.5, 127 * brightnessfactor, 206 * brightnessfactor, 225 * brightnessfactor, 255)
	layer:addFill(MAXZ, 127 * brightnessfactor, 206 * brightnessfactor, 225 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("building-Industrial")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Industrial")
	layer:addFill(13.0, 56 * brightnessfactor, 54 * brightnessfactor, 53 * brightnessfactor, 0)
	layer:addFill(13.5, 56 * brightnessfactor, 54 * brightnessfactor, 53 * brightnessfactor, 255)
	layer:addFill(MAXZ, 56 * brightnessfactor, 54 * brightnessfactor, 53 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("building-Medical")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "Medical")
	layer:addFill(13.0, 229 * brightnessfactor, 128 * brightnessfactor, 151 * brightnessfactor, 0)
	layer:addFill(13.5, 229 * brightnessfactor, 128 * brightnessfactor, 151 * brightnessfactor, 255)
	layer:addFill(MAXZ, 229 * brightnessfactor, 128 * brightnessfactor, 151 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("building-RestaurantsAndEntertainment")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "RestaurantsAndEntertainment")
	layer:addFill(13.0, 245 * brightnessfactor, 225 * brightnessfactor, 60 * brightnessfactor, 0)
	layer:addFill(13.5, 245 * brightnessfactor, 225 * brightnessfactor, 60 * brightnessfactor, 255)
	layer:addFill(MAXZ, 245 * brightnessfactor, 225 * brightnessfactor, 60 * brightnessfactor, 255)

	layer = styleAPI:newPolygonLayer("building-RetailAndCommercial")
	layer:setMinZoom(13.0)
	layer:setFilter("building", "RetailAndCommercial")
	layer:addFill(13.0, 184 * brightnessfactor, 205 * brightnessfactor, 84 * brightnessfactor, 0)
	layer:addFill(13.5, 184 * brightnessfactor, 205 * brightnessfactor, 84 * brightnessfactor, 255)
	layer:addFill(MAXZ, 184 * brightnessfactor, 205 * brightnessfactor, 84 * brightnessfactor, 255)
end

function DarkerMap_DarkenMap(key)
	if not ISWorldMap.checkKey(key) then return end
		
	if not ISWorldMap_instance then --initialize it
		DarkerMap_InitWorldMap()
	end
	
	DarkerMap_UpdatePencilRGB()
	
	DarkerMap_UpdateStyle()
	
end

Events.OnKeyPressed.Add(DarkerMap_DarkenMap)