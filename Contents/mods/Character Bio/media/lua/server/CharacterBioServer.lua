
if not isServer() then return end

local Json = require("json")

local CharacterBioStorage
local CharacterPortraitStorage


----------------------------------- loading -----------------------------------
local function Load()
  local fileReaderObj = getFileReader("CharacterBioStorage.json", true)
  local json = ""
  local line = fileReaderObj:readLine()
  while line ~= nil do
    json = json .. line
    line = fileReaderObj:readLine()
  end
  fileReaderObj:close()
  if json and json ~= "" then
    CharacterBioStorage = Json.Decode(json)
    local fileWriterObj = getFileWriter("CharacterBioStorage.json", true, false)
    fileWriterObj:write("")
    fileWriterObj:close()
  end
end

local function LoadPortrait()
  local fileReaderObj = getFileReader("CharacterPortraitStorage.json", true)
  local json = ""
  local line = fileReaderObj:readLine()
  while line ~= nil do
    json = json .. line
    line = fileReaderObj:readLine()
  end
  fileReaderObj:close()
  if json and json ~= "" then
    CharacterPortraitStorage = Json.Decode(json)
    local fileWriterObj = getFileWriter("CharacterPortraitStorage.json", true, false)
    fileWriterObj:write("")
    fileWriterObj:close()
  end
end


Events.OnInitGlobalModData.Add(function()
  Load()
  LoadPortrait()
  local newStorage = ModData.getOrCreate("CharacterBioStorage")
  local portraitStorage = ModData.getOrCreate("CharacterPortraitStorage")
  if CharacterBioStorage then
    for k, v in pairs(CharacterBioStorage) do
      newStorage[k] = {description = v}
    end
  end

  CharacterBioStorage = newStorage

  if CharacterPortraitStorage then
    for k, v in pairs(CharacterPortraitStorage) do
      portraitStorage[k] = {description = v}
    end
  end

  CharacterPortraitStorage = portraitStorage
end)
-------------------------------------------------------------------------------

Events.OnClientCommand.Add(function(module, command, player, args)
  if module == "CharacterBio" then
    if command == "save" then
      CharacterBioStorage[player:getUsername()] = args
    elseif command == "load" then
      sendServerCommand(player, module, command, CharacterBioStorage[args[1]])
    elseif command == "saveportrait" then
      CharacterPortraitStorage[player:getUsername()] = args
    elseif command == "loadportrait" then
      sendServerCommand(player, module, command, CharacterPortraitStorage[args[1]])
    end
  end
end)
