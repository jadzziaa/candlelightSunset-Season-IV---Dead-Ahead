
local function registerTinkererTraitInForageSkills()
    forageSkills.tinkerer = {
		name                    = "Tinkerer",
		type                    = "trait",
		visionBonus             = 0,
		weatherEffect           = 0,
		darknessEffect          = 0,
		specialisations         = {
			["Trash"]               = 30,
			["Junk"]                = 30,
            ["JunkWeapons"]         = 30,
		},
	}
end

Events.preAddSkillDefs.Add(registerTinkererTraitInForageSkills)