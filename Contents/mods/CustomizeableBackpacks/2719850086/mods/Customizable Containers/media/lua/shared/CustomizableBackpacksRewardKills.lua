if getActivatedMods():contains("RewardableKills") then
else return end


function getWeightReductionVars()
	if SandboxVars.CustomizableBackpacks.WeightReduction == 1 then  -- WeightReduction = -25


		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 71")
	

	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 2 then  -- WeightReduction = Vanilla


		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 95")


	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 3 then  -- WeightReduction = Well Balanced
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 91")


	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 4 then  -- WeightReduction = Balanced
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 94")
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 5 then  -- WeightReduction = Random - Well Balanced


        function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)


            getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction  = "..RandomWeightReduction)

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
            
            
    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 6 then   -- WeightReduction = Random - Balanced


        function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(55, 95)


            getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction  = "..RandomWeightReduction)

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
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 7 then	-- WeightReduction = 75	
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 75")
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 8 then  -- WeightReduction = 80 
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 80")


	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 9 then  -- WeightReduction = 85 
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 85")
		
			
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 10 then  -- WeightReduction = 90 
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 90")
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 11 then  -- WeightReduction = 95 
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 95")
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 12 then  -- WeightReduction = 99 
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 99")
		
		
	elseif SandboxVars.CustomizableBackpacks.WeightReduction == 13 then  -- WeightReduction = Weightless 
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("WeightReduction = 100")
		
		
	end
end


function getCapacityVars() 
	if SandboxVars.CustomizableBackpacks.Capacity == 1 then  -- Capacity = -25


		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 38")

	
    elseif SandboxVars.CustomizableBackpacks.Capacity == 2 then  -- Capacity = Vanilla


		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 50")
		

	elseif SandboxVars.CustomizableBackpacks.Capacity == 3 then  -- Capacity = Well Balanced
	
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 34")


	elseif SandboxVars.CustomizableBackpacks.Capacity == 4 then  -- Capacity = Balanced
	
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 38")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 5 then  -- Capacity = Random - Well Balanced
	
	
	    function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 34)


            getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity  = "..RandomCapacity)

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
            
            
    elseif SandboxVars.CustomizableBackpacks.Capacity == 6 then  -- Capacity = Random - Balanced
	
		
		function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(5, 40)


            getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity  = "..RandomCapacity)

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
		
			
	elseif SandboxVars.CustomizableBackpacks.Capacity == 7 then  -- Capacity = +25
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 63")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 8 then  -- Capacity = +50
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 75")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 9 then  -- Capacity = +75
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 88")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 10 then  -- Capacity = 2x
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 100")


	elseif SandboxVars.CustomizableBackpacks.Capacity == 11 then  -- Capacity = 3x
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 150")


	elseif SandboxVars.CustomizableBackpacks.Capacity == 12 then  -- Capacity = 5x
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 250")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 13 then  -- Capacity = 20
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 20")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 14 then  -- Capacity = 25
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 25")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 15 then  -- Capacity = 30
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 30")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 16 then  -- Capacity = 40
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 40")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 17 then  -- Capacity = 50
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 50")
		
		
	elseif SandboxVars.CustomizableBackpacks.Capacity == 18 then  -- Capacity = 75
		
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Capacity = 75")
		
	  
	end
end


function getWeightVars()
	if SandboxVars.CustomizableBackpacks.Weight == 1 then  -- Weight = Well Balanced
		
		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Weight = 0.5")
		

    elseif SandboxVars.CustomizableBackpacks.Weight == 2 then  -- Weight = -25


		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Weight = 0.375")


	elseif SandboxVars.CustomizableBackpacks.Weight == 3 then  -- Weight = -50


		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Weight = 0.25")
		
		
	elseif SandboxVars.CustomizableBackpacks.Weight == 4 then  -- Weight = -75

		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Weight = 0.13")
		
		
	elseif SandboxVars.CustomizableBackpacks.Weight == 5 then  -- Weight = Weightless

		
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("Weight = 0")
		
		
	end
end

function getRunSpeedModifierVars()
	if SandboxVars.CustomizableBackpacks.RemoveRunSpeedModifier == true then
	else return end
	
	
		getScriptManager():getItem("BetterTraits.PackerBag"):DoParam("RunSpeedModifier = 1.0")
	
		
	end

Events.OnSpawnRegionsLoaded.Add(getWeightReductionVars)
Events.OnSpawnRegionsLoaded.Add(getCapacityVars) 
Events.OnSpawnRegionsLoaded.Add(getRunSpeedModifierVars) 
Events.OnSpawnRegionsLoaded.Add(getWeightVars)
Events.OnLoad.Add(getWeightReductionVars)
Events.OnLoad.Add(getCapacityVars)
Events.OnLoad.Add(getRunSpeedModifierVars)
Events.OnLoad.Add(getWeightVars)