require 'NATT_SupportedMods'

NATTModsRecipes = {
	[NATTmods.SnakeAlice] = {"Add Frame SnakeAlice","Remove Frame SnakeAlice","Add Pouch SnakeAlice",
							 "Remove Pouch SnakeAlice"}
}

local function loadRecipes(recipes, learn)
	local player = getPlayer()
	for _,recipe in ipairs(recipes) do
		if learn then
			if not player:isRecipeKnown(recipe) then
				player:getKnownRecipes():add(recipe);
			end
		else
			player:getKnownRecipes():remove(recipe);
		end	
	end
end

local function removeSnakeAliceRecipes()
	local snakeRecipes = {
		["Agregar soporte a mochila Alice"] = true,
		["Agregar bolsa de almacenaje a mochila Alice"] = true,
		["Quitar bolsa de almacenaje a mochila Alice"] = true,
		["Quitar soporte a mochila Alice"] = true,
	}

	local allRecipes = getAllRecipes()
	if not allRecipes then return end
	for i=0,allRecipes:size()-1 do
		local recipe = allRecipes:get(i)
		if snakeRecipes[recipe:getOriginalname()] then
			recipe:setNeedToBeLearn(true)
		end
	end
	
end

local function checkRecipes()
	for k,_ in pairs(NATTModsRecipes) do
		local active = isModActivated(k)
		loadRecipes(NATTModsRecipes[k],active)
	end
	if isModActivated(NATTmods.SnakeAlice) then
		removeSnakeAliceRecipes()
	end
end

Events.OnGameStart.Add(checkRecipes)