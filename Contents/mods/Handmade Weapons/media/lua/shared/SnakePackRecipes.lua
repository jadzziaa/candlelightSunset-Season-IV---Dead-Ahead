--THIS HIDE TWO RECIPES FROM SNAKE's MOD: "TABLE SAW" THAT ARE SIMILAR TO RECIPES FROM THIS MOD
if getActivatedMods():contains("TableSaw") then
	local scriptManager = getScriptManager()
	local recipes = scriptManager:getAllRecipes()
    for i = 0, recipes:size() - 1 do
		local k = 0
        local recipe = recipes:get(i)
		if (recipe:getOriginalname() == "Make Wooden Club" or recipe:getOriginalname() == "Build Baseball Wire Bat") and recipe:getResult():getModule() == "TableSaw" then
			recipe:setNeedToBeLearn(true)
			recipe:setIsHidden(true)
			k = k + 1
			if k == 2 then
				break
			end
		end
    end
end