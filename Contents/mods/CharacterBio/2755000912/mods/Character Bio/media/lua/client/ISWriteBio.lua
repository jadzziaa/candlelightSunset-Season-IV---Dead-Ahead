
local ISWriteBio = ISPanel:derive("ISWriteBio")

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_SCALE = FONT_HGT_SMALL / 14
local function ltrim(s)
  return s:match'^%s*(.*)';
end

function ISWriteBio:setVisible(visible)
  self.javaObject:setVisible(visible)
end

function ISWriteBio:render()
  local z = 15 * FONT_SCALE

  self:drawTextCentre(ltrim(self.targetPlayerName) .. "'s Bio", self.width/2, z, 1,1,1,1, UIFont.Medium)
end

function ISWriteBio.onLoad(args)
  ISWriteBio.instance.entry:setText(args and args.description or "No Bio Set.")
end
function ISWriteBio.onLoadPortrait(args)
  ISWriteBio.instance.portraitUrl = args and args.description or "No Portrait."
end


local function OnServerCommand(module, command, args)
  if module == "CharacterBio" and command == "load" then
    Events.OnServerCommand.Remove(OnServerCommand)
    ISWriteBio.onLoad(args)
  end
  if module == "CharacterBio" and command == "loadportrait" then
    Events.OnServerCommand.Remove(OnServerCommand)
    ISWriteBio.onLoadPortrait(args)
  end
end

function ISWriteBio:createChildren()
  local btnWid = 150 * FONT_SCALE
  local btnHgt = FONT_HGT_SMALL + 5 * 2 * FONT_SCALE
  local padBottom = 10 * FONT_SCALE
  local height = 35 * FONT_HGT_SMALL + 4

  self.portraitEntry = ISButton:new(padBottom, self.height - padBottom - btnHgt - 50, btnWid, btnHgt, "View Portrait", self, ISWriteBio.openPortrait)
  self.portraitEntry:initialise()
  self.portraitEntry:instantiate()
  self:addChild(self.portraitEntry)

  self.entry = ISTextEntryBox:new("Loading...", padBottom, 30 * FONT_SCALE + FONT_HGT_MEDIUM, self.width - 20 * FONT_SCALE, height-100)
  self.entry:initialise()
  self.entry:instantiate()
  self.entry:setMultipleLine(true)
  self.entry.javaObject:setMaxLines(35)
  self:addChild(self.entry)
  Events.OnServerCommand.Add(OnServerCommand)
  sendClientCommand("CharacterBio", "load", {self.targetPlayerUsername})
  Events.OnServerCommand.Add(OnServerCommand)
  sendClientCommand("CharacterBio", "loadportrait", {self.targetPlayerUsername})

  if self.canEdit then
    self.portraitEntryEdit = ISButton:new(self.width - btnWid - padBottom, self.height - padBottom - btnHgt - 50, btnWid, btnHgt, "Edit Portrait", self, ISWriteBio.setPortrait)
    self.portraitEntryEdit:initialise()
    self.portraitEntryEdit:instantiate()
    self:addChild(self.portraitEntryEdit)
    self.save = ISButton:new(padBottom, self.height - padBottom - btnHgt, btnWid, btnHgt, "SAVE", self, ISWriteBio.onSave)
    self.save:initialise()
    self.save.borderColor = self.buttonBorderColor
    self:addChild(self.save)
  else
    self.entry:setEditable(false)
  end

  self.cancel = ISButton:new(self.width - btnWid - padBottom, self.height - padBottom - btnHgt, btnWid, btnHgt, getText("UI_btn_close"), self, ISWriteBio.close)
  self.cancel:initialise()
  self.cancel.borderColor = self.buttonBorderColor
  self:addChild(self.cancel)
end
local onSave = ISChat.initialise
function ISChat:initialise()
  onSave(self)
    if not ISChat.instance.rpName then
	  ISChat.rpName = getPlayer():getDescriptor():getForename();
	  ISChat.instance.rpName = getPlayer():getDescriptor():getForename();
  end
end

function ISWriteBio:onSave(button, x, y)
  sendClientCommand("CharacterBio", "save", {description = self.entry:getText()})
  processSayMessage(getPlayer():getDescriptor():getForename().." updated their description.");
  if SandboxVars.CharacterBio.shortDescriptions then
	  getPlayer():addLineChatElement("Remember to always re-save your description after setting your /name!", 1, 0, 0);
    local function lines(str)
      local result = {}
      for line in str:gmatch '[^\n]+' do
        table.insert(result, line)
      end
      return result
    end
    local foreName = ltrim(ISChat.instance.rpName) or ltrim(getPlayer():getDescriptor():getForename());
    local surName = getPlayer():getDescriptor():getSurname();
    local txt = self.entry:getText() or " "
    local newLine = "";
    if lines(string.sub(txt,1,50))[1] == nil then txt = " "; end
    local shortDescription = lines(string.sub(txt,1,50))[1];
    if string.len(shortDescription) > 29 and not luautils.stringEnds(shortDescription, " ") and not luautils.stringEnds(shortDescription, ".") then --add our ... at the end because it exceeds our limit and will be cutoff otherwise
      shortDescription = shortDescription.."...";
    end
    if string.len(shortDescription) > 2 then --add a newline only if they have something set here
      newLine = "\n "
    end
    local halfShortDescriptionlen = round((string.len(shortDescription) / 2) - (string.len(foreName)),1) * 2 + 8;
    local space = " ";
    for i=1, halfShortDescriptionlen do
      space = space .. " ";
    end
    print("forename length: "..string.len(foreName))
    print("surname length: "..string.len(surName))
    print("halfway point identified at character "..halfShortDescriptionlen)
    print("spacer: "..string.len(space));

  CharacterBioSpacer = space
	CharacterBioForename = space..foreName
	CharacterBioShortDescription = newLine..shortDescription
  getPlayer():getModData()['_CharacterBioSpacer'] = space
	getPlayer():getModData()['_CharacterBioShortDescription'] = CharacterBioShortDescription
	getPlayer():getModData()['_CharacterBioForename'] = CharacterBioForename
  getPlayer():getDescriptor():setForename(CharacterBioForename);
  getPlayer():getDescriptor():setSurname(CharacterBioShortDescription);
  end
  sendPlayerStatsChange(getPlayer())
  self:close()
end
local onRefreshContainers = ISInventoryPage.refreshBackpacks
function ISInventoryPage:refreshBackpacks()
  if ISChat.instance then 
    local charName = ltrim(ISChat.instance.rpName) or ltrim(getPlayer():getDescriptor():getForename())
    if not CharacterBioSpacer then
      CharacterBioSpacer = getPlayer():getModData()['_CharacterBioSpacer'] or " "
    end
    if not CharacterBioForename then
      CharacterBioForename = getPlayer():getModData()['_CharacterBioForename'] or ltrim(getPlayer():getDescriptor():getForename());
    end
    if not CharacterBioShortDescription then
      CharacterBioShortDescription = getPlayer():getModData()['_CharacterBioShortDescription'] or " ";
    end
    getPlayer():getDescriptor():setForename(ltrim(charName))
    getPlayer():getDescriptor():setSurname(" ")
  end
  onRefreshContainers(self)
  if ISChat.instance then
    local charName = ltrim(ISChat.instance.rpName) or ltrim(getPlayer():getDescriptor():getForename())
    getPlayer():getDescriptor():setForename(CharacterBioSpacer..ltrim(charName))
    getPlayer():getDescriptor():setSurname(CharacterBioShortDescription)
  end
end



function ISWriteBio:setPortrait()
  if not self.portraitUrl then self.portraitUrl = "Use an imgur link for best results."; end
  local playerObj = getSpecificPlayer(0)
  if not playerObj then return end -- player hasn't been encountered yet
  local modal = ISTextBox:new(0, 0, 520, 180, "Enter a url: \n ", ISWriteBio.instance.portraitUrl, nil, ISWriteBio.setPortraitConfirm, nil)
  modal:initialise()
  modal:addToUIManager()
end

function ISWriteBio:setPortraitConfirm(button, value)
  if button.internal == "OK" then
    local txt = button.parent.entry:getText()
    if not txt or txt == "" or not string.find(txt,SandboxVars.CharacterBio.portraitWhitelist) then
        print("user forgot to enter a url")
        getPlayer():addLineChatElement("Please specify a "..SandboxVars.CharacterBio.portraitWhitelist.." url to use as your character portrait.", 1, 0, 0);
        return
    end
    ISWriteBio.instance.portraitUrl = txt
    sendClientCommand("CharacterBio", "saveportrait", {description = txt})
    processSayMessage(getPlayer():getDescriptor():getForename().." updated their portrait.")
  end
end

function ISWriteBio:openPortrait()
  print(ISWriteBio.instance.portraitUrl)
  if ISWriteBio.instance.portraitUrl == nil or ISWriteBio.instance.portraitUrl == "" or ISWriteBio.instance.portraitUrl == "No Portrait." then
    getPlayer():addLineChatElement("No portrait found.", 1, 0, 0);
  else
    if isSteamOverlayEnabled() then
      activateSteamOverlayToWebPage(ISWriteBio.instance.portraitUrl)
    else
      openUrl(ISWriteBio.instance.portraitUrl)
    end
  end
end

function ISWriteBio:close()
  self:setVisible(false)
  self:removeFromUIManager()
  ISWriteBio.instance = nil
end

function ISWriteBio:new(x, y, width, height, targetPlayer, canEdit)
  local o = ISPanel:new(x, y, width, height)
  setmetatable(o, self)
  self.__index = self
  o.variableColor = {r=0.9, g=0.55, b=0.1, a=1}
  o.borderColor = {r=0.4, g=0.4, b=0.4, a=1}
  o.backgroundColor = {r=0, g=0, b=0, a=0.8}
  o.buttonBorderColor = {r=0.7, g=0.7, b=0.7, a=0.5}
  o.moveWithMouse = true
  o.targetPlayerName = targetPlayer:getDescriptor():getForename()
  o.targetPlayerUsername = targetPlayer:getUsername()
  o.portraitUrl = ""
  o.canEdit = canEdit
  ISWriteBio.instance = o
  return o
end

return ISWriteBio
