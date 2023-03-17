

function getVehicleCapacityVars()
    if SandboxVars.CustomizableVehicles.Capacity == 1 then  -- Off
        do return end

    elseif SandboxVars.CustomizableVehicles.Capacity == 2 then  -- Well Balanced

        function KI5commandoCapacity()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
            Events.OnLoad.Add(KI5commandoCapacity)


        function KI5oshkoshM911Capacity()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Capacity)


        function KI5mercCapacity()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
            Events.OnLoad.Add(KI5mercCapacity)


        function KI5oshkoshP19ACapacity()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19ACapacity)


        function KI5cruiserCapacity()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
         end
            Events.OnLoad.Add(KI5cruiserCapacity)


        function KI5def90Capacity()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
         end
            Events.OnLoad.Add(KI5def90Capacity)


        function KI5def110Capacity()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
            Events.OnLoad.Add(KI5def110Capacity)


        function KI5amgeneralM998Capacity()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Capacity)
            
            
        function KI5Cadillac59Capacity()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5Cadillac59Capacity)
        
        
        function KI5amgeneralM151A2Capacity()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Capacity)
        
        
        function KI578amgeneralM35A2Capacity()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Capacity)
        
        
        function KI584mercCapacity()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI584mercCapacity)
        
        
        function KI583amgeneralM923Capacity()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Capacity)
        
        
        function KI580kz1000Capacity()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI580kz1000Capacity)
        
        
        function KI5nissanGTRCapacity()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRCapacity)
        
        
        function KI5fordE150Capacity()
            if getActivatedMods():contains("86fordE150") then
            else return end
            
            
        end
        Events.OnLoad.Add(KI5fordE150Capacity)
        
        
        function KI5Dodge70Capacity()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Capacity)
        
        
        function KI5Ford89Capacity()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5Ford89Capacity)
        
        
        function KI5JeepJ10Capacity()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Capacity)
        
        
        function KI5ChevyS10Capacity()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Capacity)
        
        
        function KI597BushmasterCapacity()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI597BushmasterCapacity)
        
        
        function KI570barracudaCapacity()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI570barracudaCapacity)
        
        
        function KI528ss100Capacity()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI528ss100Capacity)
        
        
        function KI5vino125Capacity()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI5vino125Capacity)

    elseif SandboxVars.CustomizableVehicles.Capacity == 3 then  -- Balanced
    
        function KI5commandoCapacity()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
            Events.OnLoad.Add(KI5commandoCapacity)


        function KI5oshkoshM911Capacity()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Capacity)


        function KI5mercCapacity()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
            Events.OnLoad.Add(KI5mercCapacity)


        function KI5oshkoshP19ACapacity()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19ACapacity)


        function KI5cruiserCapacity()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
         end
            Events.OnLoad.Add(KI5cruiserCapacity)


        function KI5def90Capacity()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
         end
            Events.OnLoad.Add(KI5def90Capacity)


        function KI5def110Capacity()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
            Events.OnLoad.Add(KI5def110Capacity)


        function KI5amgeneralM998Capacity()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Capacity)
            
            
        function KI5Cadillac59Capacity()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5Cadillac59Capacity)
        
        
        function KI5amgeneralM151A2Capacity()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Capacity)
        
        
        function KI578amgeneralM35A2Capacity()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Capacity)
        
        
        function KI584mercCapacity()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI584mercCapacity)
        
        
        function KI583amgeneralM923Capacity()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Capacity)
        
        
        function KI580kz1000Capacity()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI580kz1000Capacity)
        
        
        function KI5nissanGTRCapacity()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRCapacity)
        
        
        function KI5fordE150Capacity()
            if getActivatedMods():contains("86fordE150") then
            else return end
            
        end
        Events.OnLoad.Add(KI5fordE150Capacity)
        
        
        function KI5Dodge70Capacity()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Capacity)
        
        
        function KI5Ford89Capacity()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5Ford89Capacity)
        
        
        function KI5JeepJ10Capacity()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5JeepJ10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Capacity)
        
        
        function KI5ChevyS10Capacity()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Capacity)
        
        
        function KI597BushmasterCapacity()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
            for k, v in pairs(CContainers.VehiclePartsKI597Bushmaster) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI597BushmasterCapacity)
        
        
        function KI570barracudaCapacity()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI570barracudaCapacity)
        
        
        function KI528ss100Capacity()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI528ss100Capacity)
        
        
        function KI5vino125Capacity()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityB)
            end
        end
        Events.OnLoad.Add(KI5vino125Capacity)

    elseif SandboxVars.CustomizableVehicles.Capacity == 4 then  -- Boosted
        
        function KI5commandoCapacity()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
            Events.OnLoad.Add(KI5commandoCapacity)


        function KI5oshkoshM911Capacity()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Capacity)


        function KI5mercCapacity()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
            Events.OnLoad.Add(KI5mercCapacity)


        function KI5oshkoshP19ACapacity()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19ACapacity)


        function KI5cruiserCapacity()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
         end
            Events.OnLoad.Add(KI5cruiserCapacity)


        function KI5def90Capacity()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
         end
            Events.OnLoad.Add(KI5def90Capacity)


        function KI5def110Capacity()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
            Events.OnLoad.Add(KI5def110Capacity)


        function KI5amgeneralM998Capacity()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Capacity)
            
            
        function KI5Cadillac59Capacity()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5Cadillac59Capacity)
        
        
        function KI5amgeneralM151A2Capacity()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Capacity)
        
        
        function KI578amgeneralM35A2Capacity()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Capacity)
        
        
        function KI584mercCapacity()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI584mercCapacity)
        
        
        function KI583amgeneralM923Capacity()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Capacity)
        
        
        function KI580kz1000Capacity()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI580kz1000Capacity)
        
        
        function KI5nissanGTRCapacity()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRCapacity)
        
        
        function KI5fordE150Capacity()
            if getActivatedMods():contains("86fordE150") then
            else return end
            
        end
        Events.OnLoad.Add(KI5fordE150Capacity)
        
        
        function KI5Dodge70Capacity()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Capacity)
        
        
        function KI5Ford89Capacity()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5Ford89Capacity)
        
        
        function KI5JeepJ10Capacity()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5JeepJ10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Capacity)
        
        
        function KI5ChevyS10Capacity()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Capacity)
        
        
        function KI597BushmasterCapacity()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
            for k, v in pairs(CContainers.VehiclePartsKI597Bushmaster) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI597BushmasterCapacity)
        
        
        function KI570barracudaCapacity()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacity)
            end
        end
        Events.OnLoad.Add(KI570barracudaCapacity)
        
        
        function KI528ss100Capacity()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI528ss100Capacity)
        
        
        function KI5vino125Capacity()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", v.MaxCapacityBoost)
            end
        end
        Events.OnLoad.Add(KI5vino125Capacity)

    elseif SandboxVars.CustomizableVehicles.Capacity == 5 then  -- 300
       

        function KI5commandoCapacity()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
            Events.OnLoad.Add(KI5commandoCapacity)


        function KI5oshkoshM911Capacity()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Capacity)


        function KI5mercCapacity()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
            Events.OnLoad.Add(KI5mercCapacity)


        function KI5oshkoshP19ACapacity()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19ACapacity)


        function KI5cruiserCapacity()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
         end
            Events.OnLoad.Add(KI5cruiserCapacity)


        function KI5def90Capacity()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
         end
            Events.OnLoad.Add(KI5def90Capacity)


        function KI5def110Capacity()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
            Events.OnLoad.Add(KI5def110Capacity)


        function KI5amgeneralM998Capacity()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Capacity)
            
            
        function KI5Cadillac59Capacity()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5Cadillac59Capacity)
        
        
        function KI5amgeneralM151A2Capacity()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Capacity)
        
        
        function KI578amgeneralM35A2Capacity()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Capacity)
        
        
        function KI584mercCapacity()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI584mercCapacity)
        
        
        function KI583amgeneralM923Capacity()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Capacity)
        
        
        function KI580kz1000Capacity()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI580kz1000Capacity)
        
        
        function KI5nissanGTRCapacity()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRCapacity)
        
        
        function KI5fordE150Capacity()
            if getActivatedMods():contains("86fordE150") then
            else return end
            
        end
        Events.OnLoad.Add(KI5fordE150Capacity)
        
        
        function KI5Dodge70Capacity()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Capacity)
        
        
        function KI5Ford89Capacity()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5Ford89Capacity)
        
        
        function KI5JeepJ10Capacity()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5JeepJ10) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Capacity)
        
        
        function KI5ChevyS10Capacity()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Capacity)
        
        
        function KI597BushmasterCapacity()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
            for k, v in pairs(CContainers.VehiclePartsKI597Bushmaster) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI597BushmasterCapacity)
        
        
        function KI570barracudaCapacity()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI570barracudaCapacity)
        
        
        function KI528ss100Capacity()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI528ss100Capacity)
        
        
        function KI5vino125Capacity()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "MaxCapacity", 300)
            end
        end
        Events.OnLoad.Add(KI5vino125Capacity)

    end
end

function getVehicleWeightVars()
        if SandboxVars.CustomizableVehicles.Weight == 1 then  -- Normal
            do return end


    elseif SandboxVars.CustomizableVehicles.Weight == 2 then  -- -25

        function KI5commandoWeight()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Commando) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
            Events.OnLoad.Add(KI5commandoWeight)


        function KI5oshkoshM911Weight()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Weight)


        function KI5mercWeight()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
            Events.OnLoad.Add(KI5mercWeight)


        function KI5oshkoshP19AWeight()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19AWeight)


        function KI5cruiserWeight()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
         end
            Events.OnLoad.Add(KI5cruiserWeight)


        function KI5def90Weight()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
         end
            Events.OnLoad.Add(KI5def90Weight)


        function KI5def110Weight()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
            Events.OnLoad.Add(KI5def110Weight)


        function KI5amgeneralM998Weight()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Weight)
            
            
        function KI5Cadillac59Weight()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end 
        end
        Events.OnLoad.Add(KI5Cadillac59Weight)
        
        
        function KI5amgeneralM151A2Weight()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Weight)
        
        
        function KI578amgeneralM35A2Weight()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Weight)
        
        
        function KI584mercWeight()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI584merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI584mercWeight)
        
        
        function KI583amgeneralM923Weight()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Weight)
        
        
        function KI580kz1000Weight()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI580kz1000) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI580kz1000Weight)
        
        
        function KI5nissanGTRWeight()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRWeight)
        
        
        function KI5fordE150Weight()
            if getActivatedMods():contains("86fordE150") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5fordE150) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5fordE150) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5fordE150Weight)
        
        
        function KI5Dodge70Weight()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Dodge70) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Weight)
        
        
        function KI5Ford89Weight()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Ford89) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5Ford89Weight)
        
        
        function KI5JeepJ10Weight()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Weight)
        
        
        function KI5ChevyS10Weight()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Weight)
        
        
        function KI597BushmasterWeight()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI597BushmasterWeight)
        
        
        function KI549PWagonWeight()
            if getActivatedMods():contains("49powerWagon") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI549PWagon) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI549PWagon) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI549PWagonWeight)
        
        
        function KI570barracudaWeight()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI570barracudaWeight)
        
        
        function KI528ss100Weight()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI528ss100Weight)
        
        
        function KI5vino125Weight()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * .75)
            end
        end
        Events.OnLoad.Add(KI5vino125Weight)

    elseif SandboxVars.CustomizableVehicles.Weight == 3 then  --  50

      function KI5commandoWeight()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Commando) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
            Events.OnLoad.Add(KI5commandoWeight)


        function KI5oshkoshM911Weight()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Weight)


        function KI5mercWeight()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
            Events.OnLoad.Add(KI5mercWeight)


        function KI5oshkoshP19AWeight()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19AWeight)


        function KI5cruiserWeight()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
         end
            Events.OnLoad.Add(KI5cruiserWeight)


        function KI5def90Weight()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
         end
            Events.OnLoad.Add(KI5def90Weight)


        function KI5def110Weight()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
            Events.OnLoad.Add(KI5def110Weight)


        function KI5amgeneralM998Weight()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Weight)
            
            
        function KI5Cadillac59Weight()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end 
        end
        Events.OnLoad.Add(KI5Cadillac59Weight)
        
        
        function KI5amgeneralM151A2Weight()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Weight)
        
        
        function KI578amgeneralM35A2Weight()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Weight)
        
        
        function KI584mercWeight()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI584merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI584mercWeight)
        
        
        function KI583amgeneralM923Weight()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Weight)
        
        
        function KI580kz1000Weight()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI580kz1000) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI580kz1000Weight)
        
        
        function KI5nissanGTRWeight()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRWeight)
        
        
        function KI5fordE150Weight()
            if getActivatedMods():contains("86fordE150") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5fordE150) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5fordE150) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5fordE150Weight)
        
        
        function KI5Dodge70Weight()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Dodge70) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Weight)   
        
        
        function KI5Ford89Weight()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Ford89) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5Ford89Weight)   
        
        
        function KI5JeepJ10Weight()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Weight)
        
        
        function KI5ChevyS10Weight()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Weight)
        
        
        function KI597BushmasterWeight()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI597BushmasterWeight)
        
        
        function KI549PWagonWeight()
            if getActivatedMods():contains("49powerWagon") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI549PWagon) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI549PWagon) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI549PWagonWeight)
        
        
        function KI570barracudaWeight()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI570barracudaWeight)
        
        
        function KI528ss100Weight()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI528ss100Weight)
        
        
        function KI5vino125Weight()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * .5)
            end
        end
        Events.OnLoad.Add(KI5vino125Weight)

    elseif SandboxVars.CustomizableVehicles.Weight == 4 then  --  -75

       function KI5commandoWeight()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Commando) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
            Events.OnLoad.Add(KI5commandoWeight)


        function KI5oshkoshM911Weight()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Weight)


        function KI5mercWeight()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
            Events.OnLoad.Add(KI5mercWeight)


        function KI5oshkoshP19AWeight()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19AWeight)


        function KI5cruiserWeight()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
         end
            Events.OnLoad.Add(KI5cruiserWeight)


        function KI5def90Weight()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
         end
            Events.OnLoad.Add(KI5def90Weight)


        function KI5def110Weight()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
            Events.OnLoad.Add(KI5def110Weight)


        function KI5amgeneralM998Weight()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Weight)
            
            
        function KI5Cadillac59Weight()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end 
        end
        Events.OnLoad.Add(KI5Cadillac59Weight)
        
        
        function KI5amgeneralM151A2Weight()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Weight)
        
        
        function KI578amgeneralM35A2Weight()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Weight)
        
        
        function KI584mercWeight()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI584merc) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI584mercWeight)
        
        
        function KI583amgeneralM923Weight()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Weight)
        
        
        function KI580kz1000Weight()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI580kz1000) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI580kz1000Weight)
        
        
        function KI5nissanGTRWeight()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRWeight)
        
        
        function KI5fordE150Weight()
            if getActivatedMods():contains("86fordE150") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5FordE150) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5fordE150) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5fordE150Weight)
        
        
        function KI5Dodge70Weight()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Dodge70) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Weight)
        
        
        function KI5Ford89Weight()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Ford89) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5Ford89Weight)
        
        
        function KI5JeepJ10Weight()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Weight)
        
        
        function KI5ChevyS10Weight()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Weight)
        
        
        function KI597BushmasterWeight()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI597BushmasterWeight)
        
        
        function KI549PWagonWeight()
            if getActivatedMods():contains("49powerWagon") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI549PWagon) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI549PWagon) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI549PWagonWeight)
        
        
        function KI570barracudaWeight()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI570barracudaWeight)
        
        
        function KI528ss100Weight()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI528ss100Weight)
        
        
        function KI5vino125Weight()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * .25)
            end
        end
        Events.OnLoad.Add(KI5vino125Weight)

    elseif SandboxVars.CustomizableVehicles.Weight == 5 then  -- Weightless

        function KI5commandoWeight()
            if getActivatedMods():contains("67commando") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Commando) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Commando) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
            Events.OnLoad.Add(KI5commandoWeight)
        

        function KI5oshkoshM911Weight()
            if getActivatedMods():contains("82oshkoshM911") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshM911) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
            Events.OnLoad.Add(KI5oshkoshM911Weight)


        function KI5mercWeight()
            if getActivatedMods():contains("85merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5merc) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
            Events.OnLoad.Add(KI5mercWeight)


        function KI5oshkoshP19AWeight()
            if getActivatedMods():contains("86oshkoshP19A") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5oshkoshP19A) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
            Events.OnLoad.Add(KI5oshkoshP19AWeight)


        function KI5cruiserWeight()
            if getActivatedMods():contains("87cruiser") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5cruiser) do

                CCMain(v.ItemName, "Weight", 0)
            end
         end
            Events.OnLoad.Add(KI5cruiserWeight)


        function KI5def90Weight()
            if getActivatedMods():contains("89def90") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def90) do

                CCMain(v.ItemName, "Weight", 0)
            end
         end
            Events.OnLoad.Add(KI5def90Weight)


        function KI5def110Weight()
            if getActivatedMods():contains("89def110") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5def110) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
            Events.OnLoad.Add(KI5def110Weight)


        function KI5amgeneralM998Weight()
            if getActivatedMods():contains("92amgeneralM998") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM998) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
            Events.OnLoad.Add(KI5amgeneralM998Weight)
            
            
        function KI5Cadillac59Weight()
            if getActivatedMods():contains("59meteor") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Cadillac59) do

                CCMain(v.ItemName, "Weight", 0)
            end 
        end
        Events.OnLoad.Add(KI5Cadillac59Weight)
        
        
        function KI5amgeneralM151A2Weight()
            if getActivatedMods():contains("74amgeneralM151A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM151A2) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI5amgeneralM151A2Weight)
        
        
        function KI578amgeneralM35A2Weight()
            if getActivatedMods():contains("78amgeneralM35A2") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM35A2) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI578amgeneralM35A2Weight)
        
        
        function KI584mercWeight()
            if getActivatedMods():contains("84merc") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI584merc) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI584merc) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI584mercWeight)
        
        
        function KI583amgeneralM923Weight()
            if getActivatedMods():contains("83amgeneralM923") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5amgeneralM923) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI583amgeneralM923Weight)
        
        
        function KI580kz1000Weight()
            if getActivatedMods():contains("80kz1000") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI580kz1000) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI580kz1000) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI580kz1000Weight)
        
        
        function KI5nissanGTRWeight()
            if getActivatedMods():contains("92nissanGTR") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5nissanGTR) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI5nissanGTRWeight)
        
        
        function KI5fordE150Weight()
            if getActivatedMods():contains("86fordE150") then
            else return end
            for k, v in pairs(CContainers.VehiclePartsKI5fordE150) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI5fordE150Weight)
        
        
        function KI5Dodge70Weight()
            if getActivatedMods():contains("70dodge") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Dodge70) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Dodge70) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI5Dodge70Weight)
        
        
        function KI5Ford89Weight()
            if getActivatedMods():contains("89fordBronco") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5Ford89) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5Ford89) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI5Ford89Weight)
        
        
        function KI5JeepJ10Weight()
            if getActivatedMods():contains("82jeepJ10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5JeepJ10) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI5JeepJ10Weight)
        
        
        function KI5ChevyS10Weight()
            if getActivatedMods():contains("88chevyS10") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5ChevyS10) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI5ChevyS10Weight)
        
        
        function KI597BushmasterWeight()
            if getActivatedMods():contains("97bushmaster") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI597Bushmaster) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI597BushmasterWeight)
        
        
        function KI549PWagonWeight()
            if getActivatedMods():contains("49powerWagon") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI549PWagon) do

                CCMain(v.ItemName, "Weight", 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI549PWagon) do

                CCMain(v.ItemName, "Weight", 0)
            end
        end
        Events.OnLoad.Add(KI549PWagonWeight)
        
        
        function KI570barracudaWeight()
            if getActivatedMods():contains("70barracuda") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI570barracuda) do

                CCMain(v.ItemName, "Weight", v.Weight * 0)
            end
        end
        Events.OnLoad.Add(KI570barracudaWeight)
        
        
        function KI528ss100Weight()
            if getActivatedMods():contains("28ss100") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI528ss100) do

                CCMain(v.ItemName, "Weight", v.Weight * 0)
            end
        end
        Events.OnLoad.Add(KI528ss100Weight)
        
        
        function KI5vino125Weight()
            if getActivatedMods():contains("vino125") then
            else return end
            for k, v in pairs(CContainers.VehicleStorageKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * 0)
            end
            for k, v in pairs(CContainers.VehiclePartsKI5vino125) do

                CCMain(v.ItemName, "Weight", v.Weight * 0)
            end
        end
        Events.OnLoad.Add(KI5vino125Weight)
        end
    end


Events.OnSpawnRegionsLoaded.Add(getVehicleCapacityVars)
Events.OnSpawnRegionsLoaded.Add(getVehicleWeightVars)
Events.OnGameStart.Add(getVehicleWeightVars)
Events.OnGameStart.Add(getVehicleCapacityVars)
Events.OnInitWorld.Add(getVehicleWeightVars)