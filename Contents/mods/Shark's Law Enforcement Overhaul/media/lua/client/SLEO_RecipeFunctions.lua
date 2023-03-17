SLEO_Recipe = {}


-- Code by Chuck and written originally for Expanded Helicopter Events

function SLEO_Recipe.CanOpenBoxes(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("CanOpenBoxes"))
end

function SLEO_Recipe.POLICEGOGGLES(recipe, result, player)
	player:getInventory():AddItems("SMUIClothing.Glasses_MilitaryGoggles", 1)
end

SLEO_Recipe.typesThatCanOpenBoxes = SLEO_Recipe.typesThatCanOpenBoxes or {}

---@param list table of type paths
function SLEO_Recipe.addCanOpenBoxTypes(list)
	for _,type in pairs(list) do
		table.insert(SLEO_Recipe.typesThatCanOpenBoxes, type)
	end
end
