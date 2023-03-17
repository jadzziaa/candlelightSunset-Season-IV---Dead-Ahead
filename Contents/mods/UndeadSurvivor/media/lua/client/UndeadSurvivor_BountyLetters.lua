--This piece of code i have took and modified from the mod "PKMN Trading Cards" by Duchess


require 'Maps/ISMapDefinitions'

local MINZ = 0
local MAXZ = 24

local function overlayPNG(mapUI, x, y, scale, layerName, tex, alpha)
	local texture = getTexture(tex)
	if not texture then return end
	local mapAPI = mapUI.javaObject:getAPIv1()
	local styleAPI = mapAPI:getStyleAPI()
	local layer = styleAPI:newTextureLayer(layerName)
	layer:setMinZoom(MINZ)
	layer:addFill(MINZ, 255, 255, 255, (alpha or 1.0) * 255)
	layer:addTexture(MINZ, tex)
	layer:setBoundsInSquares(x, y, x + texture:getWidth() * scale, y + texture:getHeight() * scale)
end

LootMaps.Init.Bounty01 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty01.png", 1.0)
	
end
	
	LootMaps.Init.Bounty02 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty02.png", 1.0)
	
end
	
	LootMaps.Init.Bounty03 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty03.png", 1.0)
	
end
	
	LootMaps.Init.Bounty04 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty04.png", 1.0)
	
end
	
	LootMaps.Init.Bounty05 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty05.png", 1.0)
	
end
	
	LootMaps.Init.Bounty06 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty06.png", 1.0)
	
end
	
	LootMaps.Init.Bounty07 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty07.png", 1.0)
	
end
	
	LootMaps.Init.Bounty08 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty08.png", 1.0)
	
end
	
	LootMaps.Init.Bounty09 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty09.png", 1.0)
	
end
	
	LootMaps.Init.Bounty10 = function(mapUI)

	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10000, 9000, 10128, 9128)
	overlayPNG(mapUI, 10000, 9000, 1.0, "Bounty01", "media/ui/LootableMaps/Bounty10.png", 1.0)

end