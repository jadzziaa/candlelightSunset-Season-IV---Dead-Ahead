--[[I'm NOT Going to change Vehice Mass because the game doesn't like weightless Vehicles and has issues.]]

function getVehicleCapacityVars()
for k, v in pairs(CContainers.VehicleStorage) do
	if SandboxVars.CustomizableVehicles.Capacity == 1 then  -- Normal
		do return end

	
	elseif SandboxVars.CustomizableVehicles.Capacity == 2 then  -- Well Balanced
	
		CCMain(v.ItemName, "MaxCapacity", v.Capacity)
		
	elseif SandboxVars.CustomizableVehicles.Capacity == 3 then  -- Balanced
	
		CCMain(v.ItemName, "MaxCapacity", v.CapacityB)
		
	elseif SandboxVars.CustomizableVehicles.Capacity == 4 then  -- Boosted
	
		CCMain(v.ItemName, "MaxCapacity", v.CapacityBoost)
		
	elseif SandboxVars.CustomizableVehicles.Capacity == 5 then  -- 300
	
		CCMain(v.ItemName, "MaxCapacity", 300)
		
        end
    end
end

function getVehicleWeightVars()
for k, v in pairs(CContainers.VehicleStorage) do 

    if SandboxVars.CustomizableVehicles.Weight == 1 then  -- Weight = Well Balanced

        CCMain(v.ItemName, "Weight", v.Weight)

    elseif SandboxVars.CustomizableVehicles.Weight == 2 then  -- Weight = -25

        CCMain(v.ItemName, "Weight", v.Weight * .75)

    elseif SandboxVars.CustomizableVehicles.Weight == 3 then  -- Weight = -50

        CCMain(v.ItemName, "Weight", v.Weight * .5)

    elseif SandboxVars.CustomizableVehicles.Weight == 4 then  -- Weight = -75

        CCMain(v.ItemName, "Weight", v.Weight * .25)

    elseif SandboxVars.CustomizableVehicles.Weight == 5 then  -- Weight = Weightless

        CCMain(v.ItemName, "Weight", 0)

    end
end
    
for k, v in pairs(CContainers.VehicleParts) do 

    if SandboxVars.CustomizableVehicles.Weight == 1 then  -- Weight = Well Balanced

        CCMain(v.ItemName, "Weight", v.Weight)

    elseif SandboxVars.CustomizableVehicles.Weight == 2 then  -- Weight = -25

        CCMain(v.ItemName, "Weight", v.Weight * .75)

    elseif SandboxVars.CustomizableVehicles.Weight == 3 then  -- Weight = -50

        CCMain(v.ItemName, "Weight", v.Weight * .5)

    elseif SandboxVars.CustomizableVehicles.Weight == 4 then  -- Weight = -75

        CCMain(v.ItemName, "Weight", v.Weight * .25)

    elseif SandboxVars.CustomizableVehicles.Weight == 5 then  -- Weight = Weightless

        CCMain(v.ItemName, "Weight", 0)

        end
    end
end
	
	
Events.OnSpawnRegionsLoaded.Add(getVehicleCapacityVars)	
Events.OnSpawnRegionsLoaded.Add(getVehicleWeightVars)	
Events.OnLoad.Add(getVehicleWeightVars)
Events.OnLoad.Add(getVehicleCapacityVars)
Events.OnInitWorld.Add(getVehicleWeightVars)
