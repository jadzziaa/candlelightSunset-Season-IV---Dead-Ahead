

function getVehicleCapacityVars()
    if SandboxVars.CustomizableVehicles.Capacity == 1 then  -- Off
        do return end


    elseif SandboxVars.CustomizableVehicles.Capacity == 2 then  -- Well Balanced

        function DannyZIL130PACK2Capacity()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Capacity)


    elseif SandboxVars.CustomizableVehicles.Capacity == 3 then  -- Balanced


        function DannyZIL130PACK2Capacity()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Capacity)


    elseif SandboxVars.CustomizableVehicles.Capacity == 4 then  -- Boosted


        function DannyZIL130PACK2Capacity()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Capacity)


    elseif SandboxVars.CustomizableVehicles.Capacity == 5 then  -- 300


        function DannyZIL130PACK2Capacity()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Capacity)


    end
end

function getVehicleWeightVars()
    if SandboxVars.CustomizableVehicles.Weight == 1 then  -- Normal
            do return end


    elseif SandboxVars.CustomizableVehicles.Weight == 2 then  -- -25


        function DannyZIL130PACK2Weight()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Weight)

            
    elseif SandboxVars.CustomizableVehicles.Weight == 3 then  --  50


        function DannyZIL130PACK2Weight()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Weight)
            
            
    elseif SandboxVars.CustomizableVehicles.Weight == 4 then  --  75


        function DannyZIL130PACK2Weight()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Weight)

            
    elseif SandboxVars.CustomizableVehicles.Weight == 5 then  -- Weightless


        function DannyZIL130PACK2Weight()
            if getActivatedMods():contains("ZIL130PACK2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageDanny) do

                CCMain(v.ItemName, "Weight", v.Weight * 0)
            end
        end
        Events.OnLoad.Add(DannyZIL130PACK2Weight)
           
           
    end
end


Events.OnSpawnRegionsLoaded.Add(getVehicleCapacityVars)
Events.OnSpawnRegionsLoaded.Add(getVehicleWeightVars)
Events.OnGameStart.Add(getVehicleWeightVars)
Events.OnGameStart.Add(getVehicleCapacityVars)
Events.OnInitWorld.Add(getVehicleWeightVars)