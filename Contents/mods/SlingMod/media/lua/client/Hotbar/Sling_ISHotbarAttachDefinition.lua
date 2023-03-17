if not ISHotbarAttachDefinition then return end

local slot = {
	type = "Sling",
	name = "Sling",
	animset = "belt left",
	attachments = {
		Rifle = "SlingRifle",
		BigBlade = "SlingWeapon",
		BigBonk = "SlingWeapon",
		BigWeapon = "SlingWeapon",
		Shovel = "SlingShovel",
	},
}
table.insert(ISHotbarAttachDefinition, slot);

slot = {
	type = "SlingAlt",
	name = "Sling",
	animset = "belt left",
	attachments = {
		Rifle = "SlingRifle2",
		BigBlade = "SlingWeapon2",
		BigBonk = "SlingWeapon2",
		BigWeapon = "SlingWeapon2",
		Shovel = "SlingShovel2",
	},
}
table.insert(ISHotbarAttachDefinition, slot);

slot = {
	type = "SlingAlt2",
	name = "Sling",
	animset = "belt left",
	attachments = {
		Rifle = "SlingRifle3",
		BigBlade = "SlingWeapon3",
		BigBonk = "SlingWeapon3",
		BigWeapon = "SlingWeapon3",
		Shovel = "SlingShovel3",
	},
}
table.insert(ISHotbarAttachDefinition, slot);

slot = {
	type = "SlingAlt3",
	name = "Sling",
	animset = "back",
	attachments = {
		Rifle = "SlingRifle Back",
		Shovel = "SlingShovel Back",
		BigBlade = "SlingWeapon Back",
		BigBonk = "SlingWeapon Back",
		BigWeapon = "SlingWeapon Back",
	},
}
table.insert(ISHotbarAttachDefinition, slot);

local replacements = {
	RifleSling = "SlingRifleBag",
	ShovelSling = "SlingShovelBag",
	BigWeaponSling = "SlingWeaponBag",
	BigBladeSling = "SlingBladeBag",
	BigBonkSling = "SlingBladeBag",
}

for k,v in pairs(replacements) do 
	ISHotbarAttachDefinition.replacements[1].replacement[k]=v
end