require "ISUI/Maps/ISMapDefinitions"

local function overlayPNG(mapUI, x, y, scale, layerName, tex, alpha)
	local texture = getTexture(tex)
	if not texture then return end
	local mapAPI = mapUI.javaObject:getAPIv1()
	local styleAPI = mapAPI:getStyleAPI()
	local layer = styleAPI:newTextureLayer(layerName)
	layer:setMinZoom(0)
	layer:addFill(0, 255, 255, 255, (alpha or 1.0) * 255)
	layer:addTexture(0, tex)
	layer:setBoundsInSquares(x, y, x + texture:getWidth() * scale, y + texture:getHeight() * scale)
end

LootMaps.Init.PaperMap = function(mapUI)
	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	MapUtils.initDefaultStyleV1(mapUI)
	mapAPI:setBoundsInSquares(7900, 11140, 8604, 12139)
	overlayPNG(mapUI, 7900, 11140, 0.666, "badge", "media/textures/worldMap/map_paperbg.png")
	MapUtils.overlayPaper(mapUI)
end