require "Definitions/ContainerButtonsIcons"

ContainerButtonIcons = ContainerButtonIcons or {}

local t = {}
t.BulletinBoard = getTexture("media/ui/bulletinboardicon.png")

ContainerButtonIcons.BulletinBoard = t.BulletinBoard

--PaperTray is the custom container name
--t.PaperTray is only used in this LUA file to define location
--Container_PaperTray.png is the name of the icon