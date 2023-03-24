Events.OnInitGlobalModData.Add(function()
    if SandboxVars.PompsItems.EasterStuff then
	--Chocolate Rabbit Box
		table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "PompsItems.ChocolateRabbitBox");
		table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, 0.02);
		table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "PompsItems.ChocolateRabbitBox");
		table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 0.02);
		table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "PompsItems.ChocolateRabbitBox");
		table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 0.01);
		table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "PompsItems.ChocolateRabbitBox");
		table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 0.02);
		
	--Chocolate Cross Box
		table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "PompsItems.ChocolateCrossBox");
		table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, 0.02);
		table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "PompsItems.ChocolateCrossBox");
		table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 0.02);
		table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "PompsItems.ChocolateCrossBox");
		table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 0.01);
		table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "PompsItems.ChocolateCrossBox");
		table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 0.02);
    end
  
    if SandboxVars.PompsItems.StallionMilk then
	--Stallion Milk
		table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "PompsItems.StallionMilk");
		table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, 0.5);
		table.insert(ProceduralDistributions["list"]["CrateCannedFood"].items, "PompsItems.StallionMilk");
		table.insert(ProceduralDistributions["list"]["CrateCannedFood"].items, 0.5);
		table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "PompsItems.StallionMilk");
		table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, 0.3);
		table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "PompsItems.StallionMilk");
		table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, 0.1);
    end
    ItemPickerJava.Parse()
end)