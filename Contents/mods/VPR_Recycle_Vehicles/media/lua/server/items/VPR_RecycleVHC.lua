--recycle vehicle items
function Recipe.OnCreate.RecycleToScrapMetalVHC(items, result, player)
    local weight = 0
    for i = 0, items:size()-1 do
        local item = items:get(i)
        if item and item:getType() ~= "WeldingMask" and item:getType() ~= "BlowTorch" then
            weight = weight + item:getWeight()
        end
    end

    local scrapQuantity = math.floor(weight*10*0.25)

        player:getInventory():AddItems("Base.ScrapMetal", scrapQuantity*0.6)
        player:getXp():AddXP(Perks.MetalWelding, scrapQuantity*4)
		player:getXp():AddXP(Perks.Mechanics, scrapQuantity*2)
		player:getXp():AddXP(Perks.Strength, scrapQuantity*8)
end

