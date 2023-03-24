

function getCustomizableExerciseVar()
    if SandboxVars.CustomizableExercise.Exercise == true then
	    else return end
        require 'ISUI/ISFitnessUI'

        function ISFitnessUI:equipItems()
            
            
                local player = self.player
                local item = self.exeData.item
                local exists = self.player:getInventory():contains(self.exeData.item, true)
                local equipped = self.exeData.prop 
                
                if item and not exists then 
                return false		
                end
            
                if equipped == "primary" then
                    ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), item, true, false)
                    player:setSecondaryHandItem(nil)
                end
            
        
                if equipped == "twohands" then
                    ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), item, true, true)
                end
        
            
                if equipped == "switch" then
                    ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), item, true, false)
                    player:setSecondaryHandItem(nil)
                end
            
            
                return true
            
            
        end
end


Events.OnLoad.Add(getCustomizableExerciseVar)