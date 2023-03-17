function Recipe.GetItemTypes.VacsDrinksCan(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("VacsDrinksCan"));
end

function Recipe.OnCreate.VacsDrinksRecycleCan(items, result, player)
	if(ZombRand(0,100) < 30) then
		player:getXp():AddXP(Perks.MetalWelding, 5);
		if(ZombRand(0,100) < 50) then
			player:getInventory():AddItem("Base.ScrapMetal");
		else
			player:getInventory():AddItem("Base.Aluminum");
		end
	end
end