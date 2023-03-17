require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

------------------- Prepper Vest -------------------

local PrepperVestFlashlight = {
	type = "PrepperVestFlashlight",-- Name shown in the slot icon
	name = "Vest Flashlight", 
	animset = "back", -- Animation name 
	attachments = {
		PrepperFlashlight = "PrepperFlashlight",
	},
}
table.insert(ISHotbarAttachDefinition, PrepperVestFlashlight);

local PrepperVestKnife = {
	type = "PrepperVestKnife",-- Name shown in the slot icon
	name = "Vest Knife", 
	animset = "back", -- Animation name 
	attachments = {
		Screwdriver = "PrepperKnife",
		Knife = "PrepperKnife",
	},
}
table.insert(ISHotbarAttachDefinition, PrepperVestKnife);

local PrepperGunMagazine1 = {
	type = "PrepperGunMagazine1",-- Name shown in the slot icon
	name = "Gun Magazine 1", 
	animset = "back", -- Animation name 
	attachments = {
		GunMagazine = "GunMagazine1",
	},
}
table.insert(ISHotbarAttachDefinition, PrepperGunMagazine1);

local PrepperGunMagazine2 = {
	type = "PrepperGunMagazine2",-- Name shown in the slot icon
	name = "Gun Magazine 2", 
	animset = "back", -- Animation name 
	attachments = {
		GunMagazine = "GunMagazine2",
	},
}
table.insert(ISHotbarAttachDefinition, PrepperGunMagazine2);

local PrepperGunMagazine3 = {
	type = "PrepperGunMagazine3",-- Name shown in the slot icon
	name = "Gun Magazine 3", 
	animset = "back", -- Animation name 
	attachments = {
		GunMagazine = "GunMagazine3",
	},
}
table.insert(ISHotbarAttachDefinition, PrepperGunMagazine3);

local PrepperGunMagazine4 = {
	type = "PrepperGunMagazine4",-- Name shown in the slot icon
	name = "Gun Magazine 4", 
	animset = "back", -- Animation name 
	attachments = {
		GunMagazine = "GunMagazine4",
	},
}
table.insert(ISHotbarAttachDefinition, PrepperGunMagazine4);

local PrepperHolster = {
	type = "PrepperHolster",-- Name shown in the slot icon
	name = "Prepper Trousers Holster", 
	animset = "back", -- Animation name 
	attachments = {
		Holster = "PrepperHolster",
	},
}
table.insert(ISHotbarAttachDefinition, PrepperHolster);



