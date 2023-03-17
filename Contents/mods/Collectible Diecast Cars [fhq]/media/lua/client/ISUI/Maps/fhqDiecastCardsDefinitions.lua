require "ISMapDefinitions"

local MINZ = 2
local MAXZ = 2

local PNGX = 1022
local PNGY = 469

local NULLX = 1
local NULLY = 1

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


local function overlayPNG2(mapUI, x, y, scaleX, scaleY, tex)
    local mapAPI = mapUI.javaObject:getAPIv1()
    local styleAPI = mapAPI:getStyleAPI()
    local layer = styleAPI:newTextureLayer("lootMapPNG")
    layer:setMinZoom(MINZ)
    local texture = getTexture(tex)
    layer:addFill(MINZ, 255, 255, 255, 128)
    layer:addTexture(MINZ, tex)
    layer:setBoundsInSquares(x, y, x + texture:getWidth() * scaleX, y + texture:getHeight() * scaleY)
end

LootMaps.Init.fhqHQSandmanCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqHQSandmanCard.png", 1.0)
	MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqMiataCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqMiataCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhq240SXCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhq240SXCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqAZ1Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqAZ1Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqBeatCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqBeatCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqCappuccinoCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqCappuccinoCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqCountachCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqCountachCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqF1Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqF1Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqGT40Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqGT40Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqImprezaCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqImprezaCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqLM002Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqLM002Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqLS400Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqLS400Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqR32GTRCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqR32GTRCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqR32GTSCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqR32GTSCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqSC400Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqSC400Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqStratosCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqStratosCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqSupraCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqSupraCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqWRXCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqWRXCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqZeroRCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqZeroRCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqM715Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqM715Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqDeltaCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqDeltaCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqE36Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqE36Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqDiabloCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqDiabloCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqZ32Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqZ32Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqBelAirCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqBelAirCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqCelicaGT4Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqCelicaGT4Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqGinettaG4Card = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10, 10, 10 + PNGX, 10 + PNGY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqGinettaG4Card.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end

LootMaps.Init.fhqDCNullCard = function(mapUI)
    local mapAPI = mapUI.javaObject:getAPIv1()
    MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(1, 1, 1 + NULLX, 1 + NULLY)
    MapUtils.initDefaultStyleV1(mapUI)
    overlayPNG(mapUI, 10, 10, 1, "lootMapPNG", "media/ui/LootableMaps/fhqNullCard.png", 1.0)
    MapUtils.overlayPaper(mapUI)
end