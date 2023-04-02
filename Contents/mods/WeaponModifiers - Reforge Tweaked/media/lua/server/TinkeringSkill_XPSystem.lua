
WeaponModifiersManager = WeaponModifiersManager or {}

local function addTinkeringSkillBooks()

    SkillBook["Tinkering"] = {};
    SkillBook["Tinkering"].perk = Perks.Tinkering;
    SkillBook["Tinkering"].maxMultiplier1 = 3;
    SkillBook["Tinkering"].maxMultiplier2 = 5;
    SkillBook["Tinkering"].maxMultiplier3 = 8;
    SkillBook["Tinkering"].maxMultiplier4 = 12;
    SkillBook["Tinkering"].maxMultiplier5 = 16;
end


function WeaponModifiersManager.awardTinkeringXP(_player, _modifier, multiplier)
    local xp = 1
    if RarityColors.common and _modifier.fontColor == RarityColors.common then
        xp = 8
	elseif RarityColors.good and _modifier.fontColor == RarityColors.good then
        xp = 15
	elseif RarityColors.great and _modifier.fontColor == RarityColors.great then
        xp = 30
	elseif RarityColors.epic and _modifier.fontColor == RarityColors.epic then
        xp = 60
	elseif RarityColors.insane and _modifier.fontColor == RarityColors.insane then
        xp = 100
	elseif RarityColors.legendary and _modifier.fontColor == RarityColors.legendary then
        xp = 150
	elseif RarityColors.bad and _modifier.fontColor == RarityColors.bad then
        xp = 3
	elseif RarityColors.shitty and _modifier.fontColor == RarityColors.shitty then
        xp = 1
	elseif RarityColors.rare and _modifier.fontColor == RarityColors.rare then
        xp = 100
    else
        xp = 10
    end

    xp = xp * multiplier * SandboxVars.WeaponModifiers.TinkeringSkillXpMultiplier

    _player:getXp():AddXP(Perks.Tinkering, xp)

	if _modifier.statsMultipliers["durability"] and _modifier.statsMultipliers["durability"] > 1 then
		_player:getXp():AddXP(Perks.Maintenance, 10*multiplier)
	end

	if WeaponModifiersManager.testMode then
		print("Awarded "..xp.." tinkering xp")
	end
    
    return xp
end

    
Events.OnGameStart.Add(addTinkeringSkillBooks);