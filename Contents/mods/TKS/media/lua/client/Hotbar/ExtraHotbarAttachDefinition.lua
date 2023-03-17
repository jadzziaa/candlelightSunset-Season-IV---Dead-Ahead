require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local KnifeSheathBack = {
	type = "KnifeSheathBack",
	name = "KnifeSheathBack",
	animset = "belt right",
	attachments = {
		Knife = "Knife in Sheath (Back)",
	},
}
table.insert(ISHotbarAttachDefinition, KnifeSheathBack);

local KnifeSheathLeg = {
	type = "KnifeSheathLeg",
	name = "KnifeSheathLeg",
	animset = "belt right",
	attachments = {
		Knife = "Knife in Sheath (Leg)",
	},
}
table.insert(ISHotbarAttachDefinition, KnifeSheathLeg);

local KatanaSheath = {
	type = "KatanaSheath",
	name = "KatanaSheath",
	animset = "back",
	attachments = {
		Katana = "Katana in Sheath",
	},
}
table.insert(ISHotbarAttachDefinition, KatanaSheath);