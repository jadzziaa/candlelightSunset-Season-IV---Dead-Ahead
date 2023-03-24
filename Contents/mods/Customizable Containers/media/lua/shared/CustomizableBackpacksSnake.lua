

function getWeightReductionVars()
    if SandboxVars.CustomizableBackpacks.WeightReduction == 1 then  -- WeightReduction = -25


        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		

	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 2 then  -- WeightReduction = Vanilla

		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReduction)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReduction)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
	

	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 3 then  -- WeightReduction = Well Balanced
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		

	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 4 then  -- WeightReduction = Balanced
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 5 then  -- WeightReduction = Random - Well Balanced

        
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
        
        
        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(SnakeClothingWeightReduction)
            
            
    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 6 then   -- WeightReduction = Random - Balanced


        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(55, 95)

            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
        
        
        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(55, 95)

            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(SnakeClothingWeightReduction)
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 7 then	-- WeightReduction = 75	
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 75)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", 75)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 8 then  -- WeightReduction = 80 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 80)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", 80)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)


	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 9 then  -- WeightReduction = 85 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 85)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", 85)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		
			
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 10 then  -- WeightReduction = 90 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 90)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", 90)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 11 then  -- WeightReduction = 95 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 95)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", 95)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 12 then  -- WeightReduction = 99 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 99)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", 99)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 13 then  -- WeightReduction = Weightless 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 100)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "WeightReduction", 100)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)
        
    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 14 then  -- WeightReduction = Custom - Static
        
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                local Static = SandboxVars.CustomizableFannyPacks.WeightReductionStatic

                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                local Static = SandboxVars.CustomizableFannyPacks.WeightReductionStatic

                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeightReduction)  
        
    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 15 then  -- WeightReduction = Custom - Randomized
        
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
        
        
        function SnakeClothingWeightReduction()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(SnakeClothingWeightReduction)
	end
	
	
	if SandboxVars.CustomizableBags.WeightReduction == 1 then  -- WeightReduction = -25

        
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
		

	elseif SandboxVars.CustomizableBags.WeightReduction == 2 then  -- WeightReduction = Vanilla

		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReduction)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReduction)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReduction)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReduction)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
	

	elseif SandboxVars.CustomizableBags.WeightReduction == 3 then  -- WeightReduction = Well Balanced
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)


	elseif SandboxVars.CustomizableBags.WeightReduction == 4 then  -- WeightReduction = Balanced
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
		
		
	elseif SandboxVars.CustomizableBags.WeightReduction == 5 then  -- WeightReduction = Random - Well Balanced

        
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BagsAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end  end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

             for k, v in pairs(CContainers.BagsAmmoMaker) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AmmoMakerWeightReduction)
        
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BagsLeRevolution) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end

            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BagsWPA) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(WPAWeightReduction)
        
        
    elseif SandboxVars.CustomizableBags.WeightReduction == 6 then   -- WeightReduction = Random - Balanced


        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BagsAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BagsAmmoMaker) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AmmoMakerWeightReduction)
        
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BagsLeRevolution) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BagsWPA) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(WPAWeightReduction)
		
		
	elseif SandboxVars.CustomizableBags.WeightReduction == 7 then	-- WeightReduction = 75	
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 75)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", 75)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", 75)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", 75)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
		
		
	elseif SandboxVars.CustomizableBags.WeightReduction == 8 then  -- WeightReduction = 80 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 80)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", 80)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", 80)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", 80)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)


	elseif SandboxVars.CustomizableBags.WeightReduction == 9 then  -- WeightReduction = 85 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 85)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", 85)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", 85)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", 85)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
		
			
	elseif SandboxVars.CustomizableBags.WeightReduction == 10 then  -- WeightReduction = 90 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 90)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", 90)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", 90)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", 90)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
		
		
	elseif SandboxVars.CustomizableBags.WeightReduction == 11 then  -- WeightReduction = 95 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 95)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", 95)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", 95)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", 95)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
        
        
    elseif SandboxVars.CustomizableBags.WeightReduction == 12 then  -- WeightReduction = 99 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 99)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", 99)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", 99)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", 99)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
		
		
	elseif SandboxVars.CustomizableBags.WeightReduction == 13 then  -- WeightReduction = Weightless 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 100)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "WeightReduction", 100)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "WeightReduction", 100)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "WeightReduction", 100)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
        
    elseif SandboxVars.CustomizableBags.WeightReduction == 14 then  -- WeightReduction = Custom - Static 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic
            
                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic
            
                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeightReduction)
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic
            
                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic
            
                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(WPAWeightReduction)
        
    elseif SandboxVars.CustomizableBags.WeightReduction == 15 then  -- WeightReduction = Custom - Randomized
    
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
        
        
        function AmmoMakerWeightReduction()
            if getActivatedMods():contains("AmmoMaker") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsAmmoMaker) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AmmoMakerWeightReduction)
        
        
        function LeGourmetWeightReduction()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsLeRevolution) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(LeGourmetWeightReduction)
        
        
        function WPAWeightReduction()
            if getActivatedMods():contains("WPA") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsWPA) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(WPAWeightReduction) 	
	end
	
	
	if SandboxVars.CustomizableFannyPacks.WeightReduction == 1 then  -- WeightReduction = -25

        
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        

	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 2 then  -- WeightReduction = Vanilla

		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReduction)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
	

	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 3 then  -- WeightReduction = Well Balanced
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 4 then  -- WeightReduction = Balanced
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
		
		
	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 5 then  -- WeightReduction = Random - Well Balanced

        
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
        
            
    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 6 then   -- WeightReduction = Random - Balanced


        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                    CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)
		
		
	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 7 then	-- WeightReduction = 75	
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 75)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
		
		
	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 8 then  -- WeightReduction = 80 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 80)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)


	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 9 then  -- WeightReduction = 85 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 85)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
		
			
	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 10 then  -- WeightReduction = 90 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 90)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
		
		
	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 11 then  -- WeightReduction = 95 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 95)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
		
		
	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 12 then  -- WeightReduction = 99 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 99)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
		
		
	elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 13 then  -- WeightReduction = Weightless 
		
		
		function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "WeightReduction", 100)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)	
        
    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 14 then  -- WeightReduction = Custom - Static
    
    
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                local Static = SandboxVars.CustomizableFannyPacks.CapacityStatic
            
                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(AliceSPackWeightReduction)
        
    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 15 then  -- WeightReduction = Custom - Randomized
             
        function AliceSPackWeightReduction()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableFannyPacks.CapacityRandomizedMin
            local Maximum = SandboxVars.CustomizableFannyPacks.CapacityRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.FannyPacksAliceSPack) do
                CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackWeightReduction)     
             
	end
end


function getCapacityVars() 
	if SandboxVars.CustomizableBackpacks.Capacity == 1 then  -- Capacity = -25

        
        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)

	
    elseif SandboxVars.CustomizableBackpacks.Capacity == 2 then  -- Capacity = Vanilla

        
        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.Capacity)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", v.Capacity)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)


	elseif SandboxVars.CustomizableBackpacks.Capacity == 3 then  -- Capacity = Well Balanced
	
		
		function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.CapacityWB)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", v.CapacityWB)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)


	elseif SandboxVars.CustomizableBackpacks.Capacity == 4 then  -- Capacity = Balanced
	
		
		function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.CapacityB)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", v.CapacityB)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 5 then  -- Capacity = Random - Well Balanced
	
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 34)

            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end

            function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 34)

            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(SnakeClothingCapacity)
            
            
    elseif SandboxVars.CustomizableBackpacks.Capacity == 6 then  -- Capacity = Random - Balanced
	
		
		function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 34)

            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end

            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end

            function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 34)

            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(SnakeClothingCapacity)
            
		
			
	elseif SandboxVars.CustomizableBackpacks.Capacity == 7 then  -- Capacity = +25
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.25)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.25)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 8 then  -- Capacity = +50
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 9 then  -- Capacity = +75
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75))) 
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 10 then  -- Capacity = 2x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)


	elseif SandboxVars.CustomizableBackpacks.Capacity == 11 then  -- Capacity = 3x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)


	elseif SandboxVars.CustomizableBackpacks.Capacity == 12 then  -- Capacity = 5x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
        
        
    elseif SandboxVars.CustomizableBackpacks.Capacity == 13 then  -- Capacity = 7.5x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
        
        
    elseif SandboxVars.CustomizableBackpacks.Capacity == 14 then  -- Capacity = 10x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 15 then  -- Capacity = 20
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 20)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", 20)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 16 then  -- Capacity = 25
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 25)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", 25)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 17 then  -- Capacity = 30
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 30)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", 30)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 18 then  -- Capacity = 40
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 40)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", 40)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 19 then  -- Capacity = 50
		
		
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 50)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", 50)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 20 then  -- Capacity = 75
		
		
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 75)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Capacity", 75)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
        
        
    elseif SandboxVars.CustomizableBackpacks.Capacity == 21 then  -- Capacity = Custom - Static
		
		
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                local Static = SandboxVars.CustomizableBackpacks.WeightReductionStatic

                CCMain(v.ItemName, "WeightReduction", Static)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                local Static = SandboxVars.CustomizableBackpacks.WeightReductionStatic

                CCMain(v.ItemName, "WeightReduction", Static)
            end 
        end
        Events.OnLoad.Add(SnakeClothingCapacity)
        
    elseif SandboxVars.CustomizableBackpacks.Capacity == 21 then  -- Capacity = Custom - Static    
        
        
        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end

            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)
        
        
        function SnakeClothingCapacity()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end

            function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(SnakeClothingCapacity)
	end


    if SandboxVars.CustomizableBags.Capacity == 1 then  -- Capacity = -25


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 2 then  -- Capacity = Vanilla


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.Capacity)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", v.Capacity)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", v.Capacity)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", v.Capacity)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 3 then  -- Capacity = Well Balanced


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.CapacityWB)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", v.CapacityWB)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", v.CapacityWB)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", v.CapacityWB)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 4 then  -- Capacity = Balanced


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.CapacityB)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", v.CapacityB)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", v.CapacityB)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", v.CapacityB)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 5 then  -- Capacity = Random - Well Balanced


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(4, 34)

                for k, v in pairs(CContainers.BagsAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(4, 34)

                for k, v in pairs(CContainers.BagsAmmoMaker) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(4, 34)

                for k, v in pairs(CContainers.BagsLeRevolution) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(4, 34)

                for k, v in pairs(CContainers.BagsWPA) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(WPACapacity)



    elseif SandboxVars.CustomizableBags.Capacity == 6 then  -- Capacity = Random - Balanced


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(5, 40)

                for k, v in pairs(CContainers.BagsAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(5, 40)

                for k, v in pairs(CContainers.BagsAmmoMaker) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(5, 40)

                for k, v in pairs(CContainers.BagsLeRevolution) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end

            function CustomizableCapacityRandomizer()

                local RandomCapacity = ZombRand(5, 40)

                for k, v in pairs(CContainers.BagsWPA) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
            if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return

            elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

                Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

                Events.EveryHours.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

                Events.EveryDays.Add(CustomizableWeightReductionRandomizer)

            elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

                Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

            end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 7 then  -- Capacity = +25


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.25)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity *1.25 )))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.25)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity *1.25 )))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 8 then  -- Capacity = +50


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 9 then  -- Capacity = +75


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 10 then  -- Capacity = 2x


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 11 then  -- Capacity = 3x


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 12 then  -- Capacity = 5x


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 13 then  -- Capacity = 7.5x


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 14 then  -- Capacity = 10x


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 15 then  -- Capacity = 20


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", 20)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", 20)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", 20)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", 20)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 16 then  -- Capacity = 25


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", 25)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", 25)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", 25)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", 25)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 17 then  -- Capacity = 30


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", 30)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", 30)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", 30)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", 30)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 18 then  -- Capacity = 40


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", 40)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", 40)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", 40)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", 40)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 19 then  -- Capacity = 50


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", 50)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", 50)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", 50)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", 50)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 20 then  -- Capacity = 75


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Capacity", 75)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Capacity", 75)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Capacity", 75)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Capacity", 75)
            end
        end
        Events.OnLoad.Add(WPACapacity)
        
        
    elseif SandboxVars.CustomizableBags.Capacity == 21 then -- Capacaity = Custom - Static


        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic

                CCMain(v.ItemName, "Capacity", Static)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic

                CCMain(v.ItemName, "Capacity", Static)
            end
        end
        Events.OnLoad.Add(AmmoMakerCapacity)


        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic

                CCMain(v.ItemName, "Capacity", Static)
            end
        end
        Events.OnLoad.Add(LeGourmetCapacity)


        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                local Static = SandboxVars.CustomizableBags.WeightReductionStatic

                CCMain(v.ItemName, "Capacity", Static)
            end
        end
        Events.OnLoad.Add(WPACapacity)


    elseif SandboxVars.CustomizableBags.Capacity == 22 then -- Capacaity = Custom - Randomized
    
        
        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)
        
        
        function AmmoMakerCapacity()
            if getActivatedMods():contains("AmmoMaker") then
            else return end

            function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsAmmoMaker) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AmmoMakerCapacity)
        
        
        function LeGourmetCapacity()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end

            function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsLeRevolution) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(LeGourmetCapacity)
        
        
        function WPACapacity()
            if getActivatedMods():contains("WPA") then
            else return end

            function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableBags.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBags.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BagsWPA) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(WPACapacity)
    end
	
	
	if SandboxVars.CustomizableFannyPacks.Capacity == 1 then  -- Capacity = -25

        
        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)

	
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 2 then  -- Capacity = Vanilla

        
        function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.Capacity)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


	elseif SandboxVars.CustomizableFannyPacks.Capacity == 3 then  -- Capacity = Well Balanced
	
		function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.CapacityWB)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


	elseif SandboxVars.CustomizableFannyPacks.Capacity == 4 then  -- Capacity = Balanced
	
		
		function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", v.CapacityB)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 5 then  -- Capacity = Random - Well Balanced
	
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 9)

            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)
	    
            
            
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 6 then  -- Capacity = Random - Balanced
	
		
		function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(5, 13)

            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)
		
			
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 7 then  -- Capacity = +25
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.25)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 8 then  -- Capacity = +50
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 9 then  -- Capacity = +75
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 10 then  -- Capacity = 2x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


	elseif SandboxVars.CustomizableFannyPacks.Capacity == 11 then  -- Capacity = 3x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)


	elseif SandboxVars.CustomizableFannyPacks.Capacity == 12 then  -- Capacity = 5x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 13 then  -- Capacity = 7.5x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 14 then  -- Capacity = 10x
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 15 then  -- Capacity = 20
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 20)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 16 then  -- Capacity = 25
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 25)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 17 then  -- Capacity = 30
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 30)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 18 then  -- Capacity = 40
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 40)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 19 then  -- Capacity = 50
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 50)
            end
        end
        Events.OnLoad.Add(AliceSPackCapacity)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Capacity == 20 then  -- Capacity = 75
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Capacity", 75)
            end 
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 21 then  -- Capacity = Custom - Randomized
		
	    
	    function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                local Static = SandboxVars.CustomizableFannyPacks.WeightReductionStatic

                CCMain(v.ItemName, "WeightReduction", Static)
            end 
        end
        Events.OnLoad.Add(AliceSPackCapacity)
        
        
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 22 then  -- Capacity = Custom - Randomized
	
		
		function AliceSPackCapacity()
            if getActivatedMods():contains("AliceSPack") then
            else return end

            function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                    CCMain(v.ItemName, "Capacity", RandomCapacity)
                end
            end
          if SandboxVars.CustomizableRandomizer.Frequency == 1 then

                return
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then
        
            Events.EveryTenMinutes.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then
        
            Events.EveryHours.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then
        
            Events.EveryDays.Add(CustomizableWeightReductionRandomizer)
        
        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then
        
            Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
        end
            Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
            Events.OnLoad.Add(CustomizableCapacityRandomizer)
        end
        Events.OnInitWorld.Add(AliceSPackCapacity)
	end
end


function getWeightVars()
	if SandboxVars.CustomizableBackpacks.Weight == 1 then  -- Weight = Normal
		
		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function SnakeClothingWeight()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Weight", v.Weight)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeight)
		

    elseif SandboxVars.CustomizableBackpacks.Weight == 2 then  -- Weight = -25

        
        function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function SnakeClothingWeight()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeight)


	elseif SandboxVars.CustomizableBackpacks.Weight == 3 then  -- Weight = -50

        
        function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function SnakeClothingWeight()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeight)
		
		
	elseif SandboxVars.CustomizableBackpacks.Weight == 4 then  -- Weight = -75

		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function SnakeClothingWeight()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeight)
		
		
	elseif SandboxVars.CustomizableBackpacks.Weight == 5 then  -- Weight = Weightless

		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BackpacksAliceSPack) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function SnakeClothingWeight()
            if getActivatedMods():contains("SnakeClothingMod") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(SnakeClothingWeight)
    end
	
	
	if SandboxVars.CustomizableBags.Weight == 1 then  -- Weight = Normal
		
		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function AmmoMakerWeight()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Weight", v.Weight)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeight)
        
        
        function LeGourmetWeight()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Weight", v.Weight)
            end
        end
        Events.OnLoad.Add(LeGourmetWeight)
        
        
        function WPAWeight()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Weight", v.Weight)
            end
        end
        Events.OnLoad.Add(WPAWeight)
		

    elseif SandboxVars.CustomizableBags.Weight == 2 then  -- Weight = -25

        
        function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function AmmoMakerWeight()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeight)
        
        
        function LeGourmetWeight()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(LeGourmetWeight)
        
        
        function WPAWeight()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(WPAWeight)


	elseif SandboxVars.CustomizableBags.Weight == 3 then  -- Weight = -50

        
        function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function AmmoMakerWeight()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeight)
        
        
        function LeGourmetWeight()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(LeGourmetWeight)
        
        
        function WPAWeight()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(WPAWeight)
		
		
	elseif SandboxVars.CustomizableBags.Weight == 4 then  -- Weight = -75

		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function AmmoMakerWeight()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeight)
        
        
        function LeGourmetWeight()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(LeGourmetWeight)
        
        
        function WPAWeight()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(WPAWeight)
		
		
	elseif SandboxVars.CustomizableBags.Weight == 5 then  -- Weight = Weightless


		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        
        
        function AmmoMakerWeight()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(AmmoMakerWeight)
        
        
        function LeGourmetWeight()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(LeGourmetWeight)
        
        
        function WPAWeight()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(WPAWeight)	
	end
	
	
	if SandboxVars.CustomizableFannyPacks.Weight == 1 then  -- Weight = Normal
		
		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
        

    elseif SandboxVars.CustomizableFannyPacks.Weight == 2 then  -- Weight = -25

        
        function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)


	elseif SandboxVars.CustomizableFannyPacks.Weight == 3 then  -- Weight = -50

        
        function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Weight == 4 then  -- Weight = -75

		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
		
		
	elseif SandboxVars.CustomizableFannyPacks.Weight == 5 then  -- Weight = Weightless

		
		function AliceSPackWeight()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(AliceSPackWeight)
	end
end

function getRunSpeedModifierVars()
	if SandboxVars.CustomizableBackpacks.RemoveRunSpeedModifier == true then
	else return end
	
	    
	    function AliceSPackRun()
            if getActivatedMods():contains("AliceSPack") then
            else return end
            for k, v in pairs(CContainers.FannyPacksAliceSPack and CContainers.BackpacksAliceSPack and CContainers.BagsAliceSPack) do

                CCMain(v.ItemName, "RunSpeedModifier", 1.0)
            end
        end
        Events.OnLoad.Add(AliceSPackRun)
        
        
        function SnakeClothingRun()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BackpacksSnakeClothing) do

                CCMain(v.ItemName, "RunSpeedModifier", 1.0)
            end
        end
        Events.OnLoad.Add(SnakeClothingRun)
        
        
        function AmmoMakerRun()
            if getActivatedMods():contains("AmmoMaker") then
            else return end
            for k, v in pairs(CContainers.BagsAmmoMaker) do

                CCMain(v.ItemName, "RunSpeedModifier", 1.0)
            end
        end
        Events.OnLoad.Add(AmmoMakerRun)
        
        
        function LeGourmetRun()
            if getActivatedMods():contains("LeGourmetRevolution") then
            else return end
            for k, v in pairs(CContainers.BagsLeRevolution) do

                CCMain(v.ItemName, "RunSpeedModifier", 1.0)
            end
        end
        Events.OnLoad.Add(LeGourmetRun)
        
        
        function WPARun()
            if getActivatedMods():contains("WPA") then
            else return end
            for k, v in pairs(CContainers.BagsWPA) do

                CCMain(v.ItemName, "RunSpeedModifier", 1.0)
            end
        end
        Events.OnLoad.Add(WPARun)	
	end


Events.OnSpawnRegionsLoaded.Add(getWeightReductionVars)
Events.OnSpawnRegionsLoaded.Add(getCapacityVars) 
Events.OnSpawnRegionsLoaded.Add(getRunSpeedModifierVars) 
Events.OnSpawnRegionsLoaded.Add(getWeightVars)
Events.OnLoad.Add(getWeightReductionVars)
Events.OnLoad.Add(getCapacityVars)
Events.OnLoad.Add(getRunSpeedModifierVars)
Events.OnLoad.Add(getWeightVars)
Events.OnGameStart.Add(getWeightReductionVars) --  Needed for Randomized Options
Events.OnGameStart.Add(getCapacityVars) --  Needed for Randomized Options