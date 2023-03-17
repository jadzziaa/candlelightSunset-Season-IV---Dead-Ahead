MoreSmokesxpUpdate = MoreSmokesxpUpdate or {};

MoreSmokesxpUpdate.levelPerk = function(owner, perk, level)
	if perk == Perks.Cultivation then
		if not owner:HasTrait("ParanoidSmoker") and not owner:HasTrait("Stoner") then
			owner:getTraits():remove("Stoner");
        	if level >= 10 and level <= 10 then
            owner:getTraits():add("Stoner");
       		end
		else
			return owner:HasTrait("Stoner");
		end
	end
end

-- get xp when you craft something
MoreSmokesxpUpdate.onMakeItem = function(item, resultItem, recipe)
	if Item:getType():contains("Cannabis") then
		getPlayer():getXp():AddXP(Perks.Cultivation, 10);
	end
end

-- Add Cultivation Skill books to the game
function addSkillBooks()

	SkillBook["Cultivation"] = {};
	SkillBook["Cultivation"].perk = Perks.Cultivation;
	SkillBook["Cultivation"].maxMultiplier1 = 2;
	SkillBook["Cultivation"].maxMultiplier2 = 4;
	SkillBook["Cultivation"].maxMultiplier3 = 6;
	SkillBook["Cultivation"].maxMultiplier4 = 8;
	SkillBook["Cultivation"].maxMultiplier5 = 10;
end

Events.LevelPerk.Add(MoreSmokesxpUpdate.levelPerk);
Events.OnMakeItem.Add(MoreSmokesxpUpdate.onMakeItem);
Events.OnGameStart.Add(addSkillBooks);