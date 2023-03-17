--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

--require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISUnequipAction"
-----------------------------------------------------------------------------------------------------------------------------------------------------------

local upperLayer = {}
upperLayer.ISUnequipAction = {}

upperLayer.ISUnequipAction.start = ISUnequipAction.start
function ISUnequipAction:start()
    upperLayer.ISUnequipAction.start(self)
    --self.ZcorpseM = self.character:getInventory():getItemFromType("CorpseMale")
    --self.ZcorpseF = self.character:getInventory():getItemFromType("CorpseFemale")
--
    --if self.ZcorpseM then self.Zcorpse = self.ZcorpseM elseif self.ZcorpseF then self.Zcorpse = self.ZcorpseF end
   -- local playerObj = getSpecificPlayer(self.character)
   --:getType() == "CarKeyCutter"
   --player:getInventory():contains("CarKeyCutter") == true 
   --self.item:getFullType() == "Base.Doorknob"
	local playerInv = self.character:getInventory()
    if (playerInv:contains("CorpseMale") or playerInv:contains("CorpseFemale")) then 

    	local rand = ZombRand(5)

		if rand == 1 then self.CorpseSound = self.character:playSound("corpsPut1") end
		if rand == 2 then self.CorpseSound = self.character:playSound("corpsPut2") end
		if rand == 3 then self.CorpseSound = self.character:playSound("corpsPut3") end
		if rand == 4 then self.CorpseSound = self.character:playSound("corpsPut5") end
		if rand == 0 then self.CorpseSound = self.character:playSound("corpsPut4") end
	end
end

upperLayer.ISUnequipAction.stop = ISUnequipAction.stop
function ISUnequipAction:stop()
    upperLayer.ISUnequipAction.stop(self)

    if self.CorpseSound and self.CorpseSound ~= 0 and self.character:getEmitter():isPlaying(self.CorpseSound) then
        
        self.character:getEmitter():stopSound(self.CorpseSound)

        local rand = ZombRand(5)

        if rand == 1 then self.CorpseSound = self.character:playSound("corpsTake1") end
		if rand == 2 then self.CorpseSound = self.character:playSound("corpsTake2") end
		if rand == 3 then self.CorpseSound = self.character:playSound("corpsTake3") end
		if rand == 4 then self.CorpseSound = self.character:playSound("corpsTake5") end
		if rand == 0 then self.CorpseSound = self.character:playSound("corpsTake4") end
    end

	

    --I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.
end
--upperLayer.ISUnequipAction.stop = ISUnequipAction.stop
--function ISUnequipAction:stop()
--    upperLayer.ISUnequipAction.stop(self)
--    if self.sound ~= 0 then
--        self.character:getEmitter():stopSound(self.sound)
--    end
--    self.sound = self.character:playSound("MecaStop")
--end

--upperLayer.ISUnequipAction.perform = ISUnequipAction.perform
--function ISUnequipAction:perform()
--    upperLayer.ISUnequipAction.perform(self)
--    if self.sound ~= 0 then
--        self.character:getEmitter():stopSound(self.sound)
--    end
--    self.sound = self.character:playSound("corpsPut1")--I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.
--
--end