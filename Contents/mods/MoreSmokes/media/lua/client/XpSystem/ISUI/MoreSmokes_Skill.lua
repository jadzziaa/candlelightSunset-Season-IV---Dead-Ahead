if getCore():getVersionNumber() == "41.50 - IWBUMS" then
	require 'XpSystem/ISUI/extraskills'

	--table.insert(extraskills.PerkCat, "Others"); To add a new category
	--extraskills.PerkList["Others"] = {}; Add new skills to this category in this table
	--extraskills.PerkName["Others"] = "ContextMenu_Others"; text entry for the category's name

	--To add your skill in an existing category change "Misc" for the internal name i.e. "Crafting" or "Survivalist"
	table.insert(extraskills.PerkList["Crafting"], "Cultivation");

	extraskills.skills["Cultivation"] = {};
	extraskills.skills["Cultivation"].name = "ContextMenu_Cultivation_Skill";
	extraskills.skills["Cultivation"].level = 0; --Starting level
	extraskills.skills["Cultivation"].xp = 0;    --Starting XP
	extraskills.skills["Cultivation"].boost = 0.75;
	extraskills.skills["Cultivation"].multiplier = 0; --Standard multiplier for skills
end