if getActivatedMods():contains("Swatpack") then
else return end


function getWeightReductionVars()
for k, v in pairs(CContainers.BackpacksSWAT) do
    if SandboxVars.CustomizableBackpacks.WeightReduction == 1 then  -- WeightReduction = -25
        
            CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 2 then  -- WeightReduction = Normal

            CCMain(v.ItemName, "WeightReduction", v.WeightReduction)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 3 then  -- WeightReduction = Well Balanced

            CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 4 then  -- WeightReduction = Balanced

            CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 5 then  -- WeightReduction = Random - Well Balanced

        function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.BackpacksSWAT) do
                CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                
            end
        end 
        Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
        Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
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

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 6 then   -- WeightReduction = Random - Balanced

        function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(55, 95)
            
            for k, v in pairs(CContainers.BackpacksSWAT) do
                CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)

            end 
        end
        Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
        Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
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

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 7 then	-- WeightReduction = 75 

            CCMain(v.ItemName, "WeightReduction", 75)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 8 then  -- WeightReduction = 80 

            CCMain(v.ItemName, "WeightReduction", 80)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 9 then  -- WeightReduction = 85 

            CCMain(v.ItemName, "WeightReduction", 85)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 10 then  -- WeightReduction = 90 

            CCMain(v.ItemName, "WeightReduction", 90)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 11 then  -- WeightReduction = 95 

            CCMain(v.ItemName, "WeightReduction", 95)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 12 then  -- WeightReduction = 99 

            CCMain(v.ItemName,"WeightReduction", 99)

    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 13 then  -- WeightReduction = Weightless 

            CCMain(v.ItemName, "WeightReduction", 100)
            
    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 14 then  -- WeightReduction = Custom - Static
            
            local Static = SandboxVars.CustomizableBackpacks.WeightReductionStatic
            
            CCMain(v.ItemName, "WeightReduction", Static)
            
    elseif SandboxVars.CustomizableBackpacks.WeightReduction == 15 then  -- WeightReduction = Custom - Randomized
              
        function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BackpacksSWAT) do
                CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)
                
            end
        end
        Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
        Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
        
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

        end
    end


for k, v in pairs(CContainers.FannyPacksSWAT) do

    if SandboxVars.CustomizableFannyPacks.WeightReduction == 1 then  -- WeightReduction = -25

        CCMain(v.ItemName, "WeightReduction", tonumber(string.format("%.0f", v.WeightReduction * 0.75)))

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 2 then  -- WeightReduction = Normal

            CCMain(v.ItemName, "WeightReduction", v.WeightReduction)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 3 then  -- WeightReduction = Well Balanced

            CCMain(v.ItemName, "WeightReduction", v.WeightReductionWB)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 4 then  -- WeightReduction = Balanced

            CCMain(v.ItemName, "WeightReduction", v.WeightReductionB)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 5 then  -- WeightReduction = Random - Well Balanced

        function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(40, 92)

            for k, v in pairs(CContainers.FannyPacksSWAT) do
            CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)

        end
    end
        Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
        Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
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

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 6 then   -- WeightReduction = Random - Balanced

        function CustomizableWeightReductionRandomizer()

            local RandomWeightReduction = ZombRand(55, 95)


            for k, v in pairs(CContainers.FannyPacksSWAT) do
            CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)

        end
    end
        Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
        Events.OnLoad.Add(CustomizableWeightReductionRandomizer)
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


    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 7 then	-- WeightReduction = 75 

            CCMain(v.ItemName, "WeightReduction", 75)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 8 then  -- WeightReduction = 80 

            CCMain(v.ItemName, "WeightReduction", 80)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 9 then  -- WeightReduction = 85 

            CCMain(v.ItemName, "WeightReduction", 85)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 10 then  -- WeightReduction = 90 

            CCMain(v.ItemName, "WeightReduction", 90)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 11 then  -- WeightReduction = 95 
    
            CCMain(v.ItemName, "WeightReduction", 95)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 12 then  -- WeightReduction = 99 

            CCMain(v.ItemName, "WeightReduction", 99)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 13 then  -- WeightReduction = Weightless 

            CCMain(v.ItemName, "WeightReduction", 100)
            
    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 14 then  -- WeightReduction = Custom - Static

        local Static = SandboxVars.CustomizableFannyPacks.WeightReductionStatic

        CCMain(v.ItemName, "WeightReduction", Static)

    elseif SandboxVars.CustomizableFannyPacks.WeightReduction == 15 then  -- WeightReduction = Custom - Randomized

        function CustomizableWeightReductionRandomizer()

            local Minimum = SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMin
            local Maximum = SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMax
            local RandomWeightReduction = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.FannyPacksSWAT) do
                CCMain(v.ItemName, "WeightReduction", RandomWeightReduction)

            end
        end
        Events.OnSpawnRegionsLoaded.Add(CustomizableWeightReductionRandomizer)
        Events.OnLoad.Add(CustomizableWeightReductionRandomizer)

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

        end
    end
end


function getCapacityVars()
for k, v in pairs(CContainers.BackpacksSWAT) do
    if SandboxVars.CustomizableBackpacks.Capacity == 1 then  -- Capacity = -25

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 2 then  -- Capacity = Vanilla

        CCMain(v.ItemName, "Capacity", v.Capacity)

    elseif SandboxVars.CustomizableBackpacks.Capacity == 3 then  -- Capacity = Well Balanced

        CCMain(v.ItemName, "Capacity", v.CapacityWB)

    elseif SandboxVars.CustomizableBackpacks.Capacity == 4 then  -- Capacity = Balanced

        CCMain(v.ItemName, "Capacity", v.CapacityB)
            
    elseif SandboxVars.CustomizableBackpacks.Capacity == 5 then  -- Capacity = Random - Well Balanced

        function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 34)

            for k, v in pairs(CContainers.BackpacksSWAT) do
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

    elseif SandboxVars.CustomizableBackpacks.Capacity == 6 then  -- Capacity = Random - Balanced

        function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(5, 40)

            for k, v in pairs(CContainers.BackpacksSWAT) do
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

    elseif SandboxVars.CustomizableBackpacks.Capacity == 7 then  -- Capacity = +25

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.25)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 8 then  -- Capacity = +50

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 9 then  -- Capacity = +75

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 10 then  -- Capacity = 2x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 11 then  -- Capacity = 3x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 12 then  -- Capacity = 5x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 13 then  -- Capacity = 7.5x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
        
    elseif SandboxVars.CustomizableBackpacks.Capacity == 14 then  -- Capacity = 10x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))

    elseif SandboxVars.CustomizableBackpacks.Capacity == 15 then  -- Capacity = 20
    
        CCMain(v.ItemName, "Capacity", 20)

    elseif SandboxVars.CustomizableBackpacks.Capacity == 16 then  -- Capacity = 25

        CCMain(v.ItemName, "Capacity", 25)

    elseif SandboxVars.CustomizableBackpacks.Capacity == 17 then  -- Capacity = 30

        CCMain(v.ItemName, "Capacity", 30)

    elseif SandboxVars.CustomizableBackpacks.Capacity == 18 then  -- Capacity = 40

        CCMain(v.ItemName, "Capacity", 40)

    elseif SandboxVars.CustomizableBackpacks.Capacity == 19 then  -- Capacity = 50

        CCMain(v.ItemName, "Capacity", 50)

    elseif SandboxVars.CustomizableBackpacks.Capacity == 20 then  -- Capacity = 75

        CCMain(v.ItemName, "Capacity", 75)
        
    elseif SandboxVars.CustomizableBackpacks.Capacity == 21 then  -- Capacity = Custom - Static
            
            local Static = SandboxVars.CustomizableBackpacks.CapacityStatic
            
            CCMain(v.ItemName, "Capacity", Static)
            
    elseif SandboxVars.CustomizableBackpacks.Capacity == 22 then  -- Capacity = Custom - Randomized

        function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableBackpacks.CapacityRandomizedMin
            local Maximum = SandboxVars.CustomizableBackpacks.CapacityRandomizedMax
            local RandomCapacity = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.BackpacksSWAT) do
                CCMain(v.ItemName, "Capacity", RandomCapacity)

            end
        end
        Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
        Events.OnLoad.Add(CustomizableCapacityRandomizer)

        if SandboxVars.CustomizableRandomizer.Frequency == 1 then

            return

        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

            Events.EveryTenMinutes.Add(CustomizableCapacityRandomizer)

        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

            Events.EveryHours.Add(CustomizableCapacityRandomizer)

        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

            Events.EveryDays.Add(CustomizableCapacityRandomizer)

        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

            Events.OnLoad.Add(CustomizableCapacityRandomizer)

        end

        end
    end


for k, v in pairs(CContainers.FannyPacksSWAT) do

    if SandboxVars.CustomizableFannyPacks.Capacity == 1 then  -- Capacity = -25

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 0.75)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 2 then  -- Capacity = Vanilla

        CCMain(v.ItemName, "Capacity", v.Capacity)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 3 then  -- Capacity = Well Balanced

        CCMain(v.ItemName, "Capacity", v.CapacityWB)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 4 then  -- Capacity = Balanced

        CCMain(v.ItemName, "Capacity", v.CapacityB)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 5 then  -- Capacity = Random - Well Balanced

        function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(4, 9)

            for k, v in pairs(CContainers.FannyPacksSWAT) do
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

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 6 then  -- Capacity = Random - Balanced

        function CustomizableCapacityRandomizer()

            local RandomCapacity = ZombRand(5, 13)

            for k, v in pairs(CContainers.FannyPacksSWAT) do
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

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 7 then  -- Capacity = +25

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.25)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 8 then  -- Capacity = +50

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.5)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 9 then  -- Capacity = +75

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 1.75)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 10 then  -- Capacity = 2x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 2)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 11 then  -- Capacity = 3x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 3)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 12 then  -- Capacity = 5x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 5)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 13 then  -- Capacity = 7.5x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 7.5)))
        
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 14 then  -- Capacity = 10x

        CCMain(v.ItemName, "Capacity", tonumber(string.format("%.0f", v.Capacity * 10)))

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 15 then  -- Capacity = 20
    
        CCMain(v.ItemName, "Capacity", 20)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 16 then  -- Capacity = 25

        CCMain(v.ItemName, "Capacity", 25)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 17 then  -- Capacity = 30

        CCMain(v.ItemName, "Capacity", 30)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 18 then  -- Capacity = 40

        CCMain(v.ItemName, "Capacity", 40)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 19 then  -- Capacity = 50

        CCMain(v.ItemName, "Capacity", 50)

    elseif SandboxVars.CustomizableFannyPacks.Capacity == 20 then  -- Capacity = 75

        CCMain(v.ItemName, "Capacity", 75)
        
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 21 then  -- Capacity = Custom - Static
            
            local Static = SandboxVars.CustomizableFannyPacks.CapacityStatic
            
            CCMain(v.ItemName, "Capacity", Static)
            
    elseif SandboxVars.CustomizableFannyPacks.Capacity == 22 then  -- Capacity = Custom - Randomized

        function CustomizableCapacityRandomizer()

            local Minimum = SandboxVars.CustomizableFannyPacks.CapacityRandomizedMin
            local Maximum = SandboxVars.CustomizableFannyPacks.CapacityRandomizedMax
            local RandomCapacity = ZombRand(Minimum, Maximum)

            for k, v in pairs(CContainers.FannyPacksSWAT) do
                CCMain(v.ItemName, "Capacity", RandomCapacity)

            end
        end
        Events.OnSpawnRegionsLoaded.Add(CustomizableCapacityRandomizer)
        Events.OnLoad.Add(CustomizableCapacityRandomizer)

        if SandboxVars.CustomizableRandomizer.Frequency == 1 then

            return

        elseif SandboxVars.CustomizableRandomizer.Frequency == 2 then

            Events.EveryTenMinutes.Add(CustomizableCapacityRandomizer)

        elseif SandboxVars.CustomizableRandomizer.Frequency == 3 then

            Events.EveryHours.Add(CustomizableCapacityRandomizer)

        elseif SandboxVars.CustomizableRandomizer.Frequency == 4 then

            Events.EveryDays.Add(CustomizableCapacityRandomizer)

        elseif SandboxVars.CustomizableRandomizer.Frequency == 5 then

            Events.OnLoad.Add(CustomizableCapacityRandomizer)

        end

        end
    end    
end


function getWeightVars()
for k, v in pairs(CContainers.BackpacksSWAT) do
    if SandboxVars.CustomizableBackpacks.Weight == 1 then  -- Weight = Well Balanced

        CCMain(v.ItemName, "Weight", v.Weight)

    elseif SandboxVars.CustomizableBackpacks.Weight == 2 then  -- Weight = -25

        CCMain(v.ItemName, "Weight", v.Weight * .75)

    elseif SandboxVars.CustomizableBackpacks.Weight == 3 then  -- Weight = -50

        CCMain(v.ItemName, "Weight", v.Weight * .5)

    elseif SandboxVars.CustomizableBackpacks.Weight == 4 then  -- Weight = -75

        CCMain(v.ItemName, "Weight", v.Weight * .25)

    elseif SandboxVars.CustomizableBackpacks.Weight == 5 then  -- Weight = Weightless

        CCMain(v.ItemName, "Weight", 0)

        end
    end


for k, v in pairs(CContainers.FannyPacksSWAT) do

    if SandboxVars.CustomizableFannyPacks.Weight == 1 then  -- Weight = Well Balanced

        CCMain(v.ItemName, "Weight", v.Weight)

    elseif SandboxVars.CustomizableFannyPacks.Weight == 2 then  -- Weight = -25

        CCMain(v.ItemName, "Weight", v.Weight * .75)

    elseif SandboxVars.CustomizableFannyPacks.Weight == 3 then  -- Weight = -50

        CCMain(v.ItemName, "Weight", v.Weight * .5)

    elseif SandboxVars.CustomizableFannyPacks.Weight == 4 then  -- Weight = -75

        CCMain(v.ItemName, "Weight", v.Weight * .25)

    elseif SandboxVars.CustomizableFannyPacks.Weight == 5 then  -- Weight = Weightless

        CCMain(v.ItemName, "Weight", 0)

        end
    end
end


function getRunSpeedModifierVars()
    if SandboxVars.CustomizableBackpacks.RemoveRunSpeedModifier == true then
    else return end
        for k, v in pairs(CContainers.BackpacksSWAT and CContainers.FannyPacksSWAT) do
    
            CCMain(v.ItemName, "RunSpeedModifier", 1.0)
        
        end
end
	

Events.OnSpawnRegionsLoaded.Add(getWeightReductionVars)
Events.OnSpawnRegionsLoaded.Add(getCapacityVars) 
Events.OnSpawnRegionsLoaded.Add(getRunSpeedModifierVars) 
Events.OnSpawnRegionsLoaded.Add(getWeightVars)
Events.OnLoad.Add(getWeightReductionVars)
Events.OnLoad.Add(getCapacityVars)
Events.OnLoad.Add(getRunSpeedModifierVars)
Events.OnLoad.Add(getWeightVars)



