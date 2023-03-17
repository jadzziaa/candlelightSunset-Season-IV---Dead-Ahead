

function ItemDurabilityVar()
	if SandboxVars.CustomizableClothing.Durability == true then
	else return end
	
	
		local player = getPlayer()
		WItems = getPlayer():getWornItems()
		WItemsSize = WItems:size()
	
		if WItems ~= nil then
			for i = 0, WItemsSize - 1 do
				local WornItems = WItems:get(i)
				local WornItem = WornItems:getItem()
	
				if WornItem:IsClothing() then
					WornItem:setCondition(WornItem:getConditionMax())
					player:resetModel()
					
				end 
			end 
		end
end


	
function ItemDegradationVar()
	if SandboxVars.CustomizableClothing.Degradation == true then
	else return end


	local player = getPlayer()
	WItems = getPlayer():getWornItems()
	WItemsSize = WItems:size()

	if WItems ~= nil then
		for i = 0, WItemsSize - 1 do
			local WornItems = WItems:get(i)
			local WornItem = WornItems:getItem()
			local ClothingParts = BloodClothingType.getCoveredParts(WornItem:getBloodClothingType())

			for i = 0, ClothingParts:size() - 1 do
				local Parts = ClothingParts:get(i)
				
				if Parts then
					WornItem:setBlood(Parts, 0)
					
					WornItem:setDirt(Parts, 0)
				end
			end

				for i = 0, BloodBodyPartType.MAX:index() - 1 do
					WornItem:getVisual():removeHole(i)
				end

				if WornItem:IsClothing() then
					WornItem:setBloodLevel(0)
					WornItem:setDirtyness(0)
					WornItem:setWetness(0)
				end
		end
	end
end


Events.OnLoad.Add(ItemDurabilityVar)
Events.OnPlayerUpdate.Add(ItemDurabilityVar)
Events.OnLoad.Add(ItemDegradationVar)
Events.OnPlayerUpdate.Add(ItemDegradationVar)

	