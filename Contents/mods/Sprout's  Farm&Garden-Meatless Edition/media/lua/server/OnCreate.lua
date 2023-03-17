function Recipe.OnCreate.OpenFood(items, result, player)
    player:getInventory():AddItem("Base.EmptyJar");
    player:getInventory():AddItem("Base.JarLid");
end

