require "Definitions/ContainerButtonsIcons"

ContainerButtonIcons = ContainerButtonIcons or {}

local t = {}
t.PaperTray = getTexture("media/ui/Container_PaperTray.png")
t.EmergencyAxe = getTexture("media/ui/Container_EmergencyAxe.png")

ContainerButtonIcons.PaperTray = t.PaperTray
ContainerButtonIcons.EmergencyAxe = t.EmergencyAxe
