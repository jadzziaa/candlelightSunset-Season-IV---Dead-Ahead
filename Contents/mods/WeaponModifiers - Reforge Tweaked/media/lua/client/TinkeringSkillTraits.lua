
local function initTinkeringSkillTraits()
    local tinkererTrait = TraitFactory.addTrait("Tinkerer", getText("UI_trait_tinkerer"), 7, getText("UI_trait_tinkererdesc"), false, false);
    tinkererTrait:addXPBoost(Perks.Tinkering, 1);
    tinkererTrait:addXPBoost(Perks.Maintenance, 1);
	tinkererTrait:getFreeRecipes():add("Tinker");
    forageSkills = forageSkills or {}
    forageSkills.Tinkerer = {
		name                    = "Tinkerer",
		type                    = "trait",
		visionBonus             = 0,
		weatherEffect           = 0,
		darknessEffect          = 0,
		specialisations         = {
			["Trash"]               = 20,
			["Junk"]                = 20,
            ["JunkWeapons"]         = 20,
		},
	}

    TraitFactory.sortList();
    BaseGameCharacterDetails.SetTraitDescription(tinkererTrait)

	local repairman = ProfessionFactory.getProfession("repairman")
	repairman:addXPBoost(Perks.Tinkering, 1);
	BaseGameCharacterDetails.SetProfessionDescription(repairman)

	local engineer = ProfessionFactory.getProfession("engineer")
	engineer:addXPBoost(Perks.Tinkering, 1);
	BaseGameCharacterDetails.SetProfessionDescription(engineer)
	
end

Events.OnGameBoot.Add(initTinkeringSkillTraits);



local function checkTinkererOnSkillUp(player, perk, perkLevel, addBuffer)
	if player:HasTrait("Tinkerer") or not SandboxVars.WeaponModifiers.DynamicTinkerer then
		return;
	end
	if perk == Perks.Maintenance or perk == Perks.Tinkering then
		if player:getPerkLevel(Perks.Tinkering) + player:getPerkLevel(Perks.Maintenance) >=8 then
			local itemsTinkered = player:getModData().itemsTinkered
			if itemsTinkered and itemsTinkered >= 15 then
				player:getTraits():add("Tinkerer");
			end
		end
	end
end

Events.LevelPerk.Add(checkTinkererOnSkillUp);