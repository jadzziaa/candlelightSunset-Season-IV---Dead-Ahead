

function getVehicleCapacityVars()
    if SandboxVars.CustomizableVehicles.Capacity == 1 then  -- Off
        do return end


    elseif SandboxVars.CustomizableVehicles.Capacity == 2 then  -- Well Balanced


        function TsaramclubCapacity()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsaramclubCapacity)
        
        
        function TsarYachtCapacity()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarYachtCapacity)
        
        
        function TsarBusCapacity()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarBusCapacity)
        
        
        function TsarDadgeCapacity()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarDadgeCapacity)
        
        
        function TsarJeepCapacity()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarJeepCapacity)
        
        
        function TsarMustangCapacity()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarMustangCapacity)
        
        
        function TsarTrailersCapacity()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarTrailersCapacity)
        
        
        function TsarTrolleyCapacity()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarTrolleyCapacity)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaCapacity()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanDeRumba) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaCapacity)


    elseif SandboxVars.CustomizableVehicles.Capacity == 3 then  -- Balanced


        function TsaramclubCapacity()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsaramclubCapacity)
        
        
        function TsarYachtCapacity()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarYachtCapacity)
        
        
        function TsarBusCapacity()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarBusCapacity)
        
        
        function TsarDadgeCapacity()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarDadgeCapacity)
        
        
        function TsarJeepCapacity()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarJeepCapacity)
        
        
        function TsarMustangCapacity()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarMustangCapacity)
        
        
        function TsarTrailersCapacity()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarTrailersCapacity)
        
        
        function TsarTrolleyCapacity()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarTrolleyCapacity)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaCapacity()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanDeRumba) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaCapacity)


    elseif SandboxVars.CustomizableVehicles.Capacity == 4 then  -- Boosted


        function TsaramclubCapacity()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsaramclubCapacity)
        
        
        function TsarYachtCapacity()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarYachtCapacity)
        
        
        function TsarBusCapacity()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarBusCapacity)
        
        
        function TsarDadgeCapacity()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarDadgeCapacity)
        
        
        function TsarJeepCapacity()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarJeepCapacity)
        
        
        function TsarMustangCapacity()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarMustangCapacity)
        
        
        function TsarTrailersCapacity()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarTrailersCapacity)
        
        
        function TsarTrolleyCapacity()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarTrolleyCapacity)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaCapacity()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanRumba) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaCapacity)


    elseif SandboxVars.CustomizableVehicles.Capacity == 5 then  -- 300


        function TsaramclubCapacity()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsaramclubCapacity)
        
        
        function TsarYachtCapacity()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarYachtCapacity)
        
        
        function TsarBusCapacity()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarBusCapacity)
        
        
        function TsarDadgeCapacity()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarDadgeCapacity)
        
        
        function TsarJeepCapacity()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarJeepCapacity)
        
        
        function TsarMustangCapacity()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarMustangCapacity)
        
        
        function TsarTrailersCapacity()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarTrailersCapacity)
        
        
        function TsarTrolleyCapacity()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarTrolleyCapacity)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaCapacity()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanDeRumba) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaCapacity)


    end
end

function getVehicleWeightVars()
    if SandboxVars.CustomizableVehicles.Weight == 1 then  -- Normal
            do return end


    elseif SandboxVars.CustomizableVehicles.Weight == 2 then  -- -25


        function TsarAgroWeight()
            if getActivatedMods():contains("agrotsar") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarAgro) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarAgroWeight)
        
        
        function TsaramclubWeight()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsaramclub) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsaramclubWeight)
        
        
        function TsarYachtWeight()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarYachtClub) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarYachtWeight)
        
        
        function TsarBusWeight()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarBus) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarBusWeight)
        
        
        function TsarDadgeWeight()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarDadge) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarDadgeWeight)
        
        
        function TsarJeepWeight()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarJeep) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarJeepWeight)
        
        
        function TsarMustangWeight()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarMustang) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarMustangWeight)
        
        
        function TsarPetyarWeight()
            if getActivatedMods():contains("ATA_Petyarbuilt") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarPetyar) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarPetyarWeight)
        
        
        function TsarTrailersWeight()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end 
        end
        Events.OnLoad.Add(TsarTrailersWeight)
        
        
        function TsarTrolleyWeight()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarTrolleyWeight)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarLuton) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaWeight()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanRumba) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarVanRumba) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaWeight)

            
    elseif SandboxVars.CustomizableVehicles.Weight == 3 then  --  50


        function TsarAgroWeight()
            if getActivatedMods():contains("agrotsar") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarAgro) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarAgroWeight)
        
        
        function TsaramclubWeight()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsaramclub) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsaramclubWeight)
        
        
        function TsarYachtWeight()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarYachtClub) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarYachtWeight)
        
        
        function TsarBusWeight()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarBus) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarBusWeight)
        
        
        function TsarDadgeWeight()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarDadge) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarDadgeWeight)
        
        
        function TsarJeepWeight()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarJeep) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarJeepWeight)
        
        
        function TsarMustangWeight()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarMustang) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarMustangWeight)
        
        
        function TsarPetyarWeight()
            if getActivatedMods():contains("ATA_Petyarbuilt") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarPetyar) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarPetyarWeight)
        
        
        function TsarTrailersWeight()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end 
        end
        Events.OnLoad.Add(TsarTrailersWeight)
        
        
        function TsarTrolleyWeight()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarTrolleyWeight)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarLuton) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaWeight()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanRumba) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarVanRumba) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaWeight)
            
            
    elseif SandboxVars.CustomizableVehicles.Weight == 4 then  --  75


        function TsarAgroWeight()
            if getActivatedMods():contains("agrotsar") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarAgro) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarAgroWeight)
        
        
        function TsaramclubWeight()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsaramclub) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsaramclubWeight)
        
        
        function TsarYachtWeight()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarYachtClub) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarYachtWeight)
        
        
        function TsarBusWeight()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarBus) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarBusWeight)
        
        
        function TsarDadgeWeight()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarDadge) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarDadgeWeight)
        
        
        function TsarJeepWeight()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarJeep) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarJeepWeight)
        
        
        function TsarMustangWeight()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarMustang) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarMustangWeight)
        
        
        function TsarPetyarWeight()
            if getActivatedMods():contains("ATA_Petyarbuilt") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarPetyar) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarPetyarWeight)
        
        
        function TsarTrailersWeight()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end 
        end
        Events.OnLoad.Add(TsarTrailersWeight)
        
        
        function TsarTrolleyWeight()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarTrolleyWeight)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarLuton) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaWeight()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanRumba) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarVanRumba) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaWeight)

            
    elseif SandboxVars.CustomizableVehicles.Weight == 5 then  -- Weightless


        function TsarAgroWeight()
            if getActivatedMods():contains("agrotsar") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarAgro) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarAgroWeight)
        
        
        function TsaramclubWeight()
            if getActivatedMods():contains("amclub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsaramclub) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsaramclub) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsaramclubWeight)
        
        
        function TsarYachtWeight()
            if getActivatedMods():contains("AquatsarYachtClub") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarYachtClub) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarYachtClub) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarYachtWeight)
        
        
        function TsarBusWeight()
            if getActivatedMods():contains("ATA_Bus") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarBus) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarBus) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarBusWeight)
        
        
        function TsarDadgeWeight()
            if getActivatedMods():contains("ATA_Dadge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarDadge) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarDadge) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarDadgeWeight)
        
        
        function TsarJeepWeight()
            if getActivatedMods():contains("ATA_Jeep") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarJeep) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarJeep) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarJeepWeight)
        
        
        function TsarMustangWeight()
            if getActivatedMods():contains("ATA_Mustang") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarMustang) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarMustang) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarMustangWeight)
        
        
        function TsarPetyarWeight()
            if getActivatedMods():contains("ATA_Petyarbuilt") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsTsarPetyar) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarPetyarWeight)
        
        
        function TsarTrailersWeight()
            if getActivatedMods():contains("autotsartrailers") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrailers) do

                CCMain(v.ItemName, "Weight", 0)
            end 
        end
        Events.OnLoad.Add(TsarTrailersWeight)
        
        
        function TsarTrolleyWeight()
            if getActivatedMods():contains("TMC_Trolley") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarTrolley) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarTrolleyWeight)
        
        
        function TsarLutonCapacity()
            if getActivatedMods():contains("ATA_Luton") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarLuton) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarLuton) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarLutonCapacity)
        
        
        function TsarVanDeRumbaWeight()
            if getActivatedMods():contains("ATA_VanDeRumba") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageTsarVanRumba) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsTsarVanRumba) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(TsarVanDeRumbaWeight)      
        end
    end


Events.OnSpawnRegionsLoaded.Add(getVehicleCapacityVars)
Events.OnSpawnRegionsLoaded.Add(getVehicleWeightVars)
Events.OnGameStart.Add(getVehicleWeightVars)
Events.OnGameStart.Add(getVehicleCapacityVars)
Events.OnInitWorld.Add(getVehicleWeightVars)