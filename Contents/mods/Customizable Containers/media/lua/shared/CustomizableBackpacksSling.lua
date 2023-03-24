

function getWeightVars()
    if SandboxVars.CustomizableChestRigs.Weight == 1 then  -- Weight = Well Balanced


        function SlingCustomWeight()
            if getActivatedMods():contains("SlingCustom") then
            else return end

            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.01")

            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.01")

            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.01")

            getScriptManager():getItem("Base.SlingAalt3"):DoParam("Weight = 0.01")

        end
        Events.OnLoad.Add(SlingCustomWeight)
        
        
        function SlingNoirWeight()
            if getActivatedMods():contains("noirrsling") then
            else return end

            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.01")

            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.01")

            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.01")

        end
        Events.OnLoad.Add(SlingNoirWeight)
        

    elseif SandboxVars.CustomizableChestRigs.Weight == 2 then  -- Weight = -25

        
        function SlingCustomWeight()
            if getActivatedMods():contains("SlingCustom") then
            else return end
            
            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.0075")
    
            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.0075")
    
            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.0075")
    
            getScriptManager():getItem("Base.SlingAalt3"):DoParam("Weight = 0.0075")
            
        end
        Events.OnLoad.Add(SlingCustomWeight)
        
        
        function SlingNoirWeight()
            if getActivatedMods():contains("noirrsling") then
            else return end

            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.0075")

            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.0075")

            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.0075")

        end
        Events.OnLoad.Add(SlingNoirWeight)
        

    elseif SandboxVars.CustomizableChestRigs.Weight == 3 then  -- Weight = -50


        function SlingCustomWeight()
            if getActivatedMods():contains("SlingCustom") then
            else return end
            
            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.005")
    
            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.005")
    
            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.005")
    
            getScriptManager():getItem("Base.SlingAalt3"):DoParam("Weight = 0.005")
            
        end
        Events.OnLoad.Add(SlingCustomWeight)
        
        
        function SlingNoirWeight()
            if getActivatedMods():contains("noirrsling") then
            else return end

            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.005")

            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.005")

            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.005")

        end
        Events.OnLoad.Add(SlingNoirWeight)


    elseif SandboxVars.CustomizableChestRigs.Weight == 4 then  -- Weight = -75


        function SlingCustomWeight()
            if getActivatedMods():contains("SlingCustom") then
            else return end
            
            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.0025")
    
            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.0025")
    
            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.0025")
    
            getScriptManager():getItem("Base.SlingAalt3"):DoParam("Weight = 0.0025")
            
        end
        Events.OnLoad.Add(SlingCustomWeight)
        
        
        function SlingNoirWeight()
            if getActivatedMods():contains("noirrsling") then
            else return end

            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.0025")

            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.0025")

            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.0025")

        end
        Events.OnLoad.Add(SlingNoirWeight)


    elseif SandboxVars.CustomizableChestRigs.Weight == 5 then  -- Weight = Weightless


        function SlingCustomWeight()
            if getActivatedMods():contains("SlingCustom") then
            else return end
            
            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.0")
    
            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.0")
    
            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.0")
    
            getScriptManager():getItem("Base.SlingAalt3"):DoParam("Weight = 0.0")
            
        end
        Events.OnLoad.Add(SlingCustomWeight)
        
        
        function SlingNoirWeight()
            if getActivatedMods():contains("noirrsling") then
            else return end

            getScriptManager():getItem("Base.SlingA"):DoParam("Weight = 0.0")

            getScriptManager():getItem("Base.SlingAalt"):DoParam("Weight = 0.0")

            getScriptManager():getItem("Base.SlingAalt2"):DoParam("Weight = 0.0")
            

        end
        Events.OnLoad.Add(SlingNoirWeight)


    end
end

function getRunSpeedModifierVars()
	if SandboxVars.CustomizableChestRigs.RemoveRunSpeedModifier == true then
	else return end
	
	
		function SlingCustomRun()
            if getActivatedMods():contains("SlingCustom") then
            else return end
            
            getScriptManager():getItem("Base.SlingA"):DoParam("RunSpeedModifier = 1.0")
    
            getScriptManager():getItem("Base.SlingAalt"):DoParam("RunSpeedModifier = 1.0")
    
            getScriptManager():getItem("Base.SlingAalt2"):DoParam("RunSpeedModifier = 1.0")
    
            getScriptManager():getItem("Base.SlingAalt3"):DoParam("RunSpeedModifier = 1.0")
            
        end
        Events.OnLoad.Add(SlingCustomRun)
        
        
        function SlingNoirRun()
            if getActivatedMods():contains("noirrsling") then
            else return end
            
            getScriptManager():getItem("Base.SlingA"):DoParam("RunSpeedModifier = 1.0")
    
            getScriptManager():getItem("Base.SlingAalt"):DoParam("RunSpeedModifier = 1.0")
    
            getScriptManager():getItem("Base.SlingAalt2"):DoParam("RunSpeedModifier = 1.0")
            
        end
        Events.OnLoad.Add(SlingNoirRun)
	
		
	end


Events.OnSpawnRegionsLoaded.Add(getRunSpeedModifierVars) 
Events.OnSpawnRegionsLoaded.Add(getWeightVars)
Events.OnGameStart.Add(getRunSpeedModifierVars)
Events.OnGameStart.Add(getWeightVars)
Events.OnInitWorld.Add(getWeightVars)