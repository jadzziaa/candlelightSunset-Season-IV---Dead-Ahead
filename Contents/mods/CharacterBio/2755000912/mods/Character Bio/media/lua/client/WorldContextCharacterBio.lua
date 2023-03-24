
local ISWriteBio = require "ISWriteBio"

local function onBioMenu(player, canEdit)
  local FONT_SCALE = getTextManager():getFontHeight(UIFont.Small) / 14
  local core = getCore()
  local width = 400 * FONT_SCALE
  local height = 600 * FONT_SCALE
  local ui =ISWriteBio:new((core:getScreenWidth() - width)/2, (core:getScreenHeight() - height)/2, width, height, player, canEdit)

  ui:initialise()
  ui:addToUIManager()
end

Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldObjects, test)
  if test then return true end
  local playerObj = getSpecificPlayer(player)

  local clickedPlayer
  print("Number of Objects: " .. #worldObjects)
  for i, v in ipairs(worldObjects) do
    local movingObjects = v:getSquare():getMovingObjects()
    for i = 0, movingObjects:size() - 1 do
      local o = movingObjects:get(i)
      if instanceof(o, "IsoPlayer") then
        clickedPlayer = o
        break
      end
    end
  end

  if clickedPlayer then
    if clickedPlayer ~= playerObj then
      local option = context:addOption("View Bio", clickedPlayer, onBioMenu, false)
    else
      local option = context:addOption("Edit Bio", clickedPlayer, onBioMenu, true)
    end
  end

end)
