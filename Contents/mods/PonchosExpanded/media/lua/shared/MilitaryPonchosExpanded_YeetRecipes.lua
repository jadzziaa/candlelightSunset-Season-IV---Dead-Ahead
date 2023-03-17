--[[
	YeetRecipes.lua Written By UdderlyEvelyn 9/9/22
	
	Feel free to use this, retain credit to me please. :)
	
	If you only need to replace *one* recipe with a given 
	name, it is more efficient to use overrides/etc.! If
	you're already using this, though, might as well
	use it for all recipes to be removed.
]]
local modName = "MilitaryPonchosExpanded"

local recipesToYeet = {}
recipesToYeet["Make Military Poncho (Green)"] = true
recipesToYeet["Make Military Poncho (Yellow)"] = true
recipesToYeet["Make Military Poncho (Black)"] = true
recipesToYeet["Paint Military Poncho Green"] = true
recipesToYeet["Paint Military Poncho Black"] = true

local calendar = Calendar.getInstance()
local yeeted = 0
local start = calendar:getTimeInMillis()
local recipes = getScriptManager():getAllRecipes()
for i = 1, recipes:size() do
	local recipe = recipes:get(i - 1)
	local name = recipe:getName()
	if recipesToYeet[name] then
		recipe:setNeedToBeLearn(true)
		recipe:setIsHidden(true)
		yeeted = yeeted + 1
		print ("["..modName.."] Yeeted \""..name.."\"..")
	end
end
local stop = calendar:getTimeInMillis()

print("["..modName.."] Yeeted "..yeeted.." recipes in "..(stop - start).."ms!")