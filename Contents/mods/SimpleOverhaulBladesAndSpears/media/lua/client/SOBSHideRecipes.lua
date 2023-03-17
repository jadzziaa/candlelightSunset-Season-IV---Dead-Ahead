local recipes = getAllRecipes()

local function HideDisabledModRecipes()

	if recipes then
	for i = 0, recipes:size() - 1 do
	local recipe = recipes:get(i)

	-- ScrapWeapons
	if getActivatedMods():contains("ScrapWeapons(new version)") == false then
		if recipe:getModule():getName() == "SWeapons" then
			recipe:setIsHidden(true)
		end
	end
	-- Bushcraft Gear - Tools
	if getActivatedMods():contains("BCGTools") == false then
		if recipe:getModule():getName() == "BCGTools" then
		recipe:setIsHidden(true)
		end
	end				
	-- Tactical Weapons [41.65+]
	if getActivatedMods():contains("Tactical Weapons") == false then
		if recipe:getModule():getName() == "TWeapons" then
			recipe:setIsHidden(true)
		end
	end		
	-- Glass Shiv
	if getActivatedMods():contains("SilentsGlassShiv") == false then
		if recipe:getModule():getName() == "SilentsGlassShiv" then
			recipe:setIsHidden(true)
		end
	end		

	-- More Pole Weapons
	if getActivatedMods():contains("MorePoleWeapons") == false then
		if recipe:getModule():getName() == "MorePoleWeapons" then
			recipe:setIsHidden(true)
		end
	end	

	-- Snake mod pack AliceSPack
	if getActivatedMods():contains("AliceSPack") == false then
		if recipe:getModule():getName() == "AliceBP" then
			recipe:setIsHidden(true)
		end
	end					
				
	end
	end	

end

Events.OnGameStart.Add(HideDisabledModRecipes);