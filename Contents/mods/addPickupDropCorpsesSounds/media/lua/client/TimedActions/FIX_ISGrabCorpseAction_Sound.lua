--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

--require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISGrabCorpseAction"
-----------------------------------------------------------------------------------------------------------------------------------------------------------

local upperLayer = {}
upperLayer.ISGrabCorpseAction = {}


upperLayer.ISGrabCorpseAction.start = ISGrabCorpseAction.start
function ISGrabCorpseAction:start()
    upperLayer.ISGrabCorpseAction.start(self)
    local rand = ZombRand(5)   

	if rand == 1 then self.CorpseSound = self.character:playSound("corpsTake1") end
	if rand == 2 then self.CorpseSound = self.character:playSound("corpsTake2") end
	if rand == 3 then self.CorpseSound = self.character:playSound("corpsTake3") end
	if rand == 4 then self.CorpseSound = self.character:playSound("corpsTake5") end
	if rand == 0 then self.CorpseSound = self.character:playSound("corpsTake4") end

    --I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.
end

upperLayer.ISGrabCorpseAction.stop = ISGrabCorpseAction.stop
function ISGrabCorpseAction:stop()
    upperLayer.ISGrabCorpseAction.stop(self)

    if self.CorpseSound and self.CorpseSound ~= 0 and self.character:getEmitter():isPlaying(self.CorpseSound) then
        
        self.character:getEmitter():stopSound(self.CorpseSound)

        local rand = ZombRand(5)
        
        if rand == 1 then self.CorpseSound = self.character:playSound("corpsPut1") end
		if rand == 2 then self.CorpseSound = self.character:playSound("corpsPut2") end
		if rand == 3 then self.CorpseSound = self.character:playSound("corpsPut3") end
		if rand == 4 then self.CorpseSound = self.character:playSound("corpsPut5") end
		if rand == 0 then self.CorpseSound = self.character:playSound("corpsPut4") end
    end

	

    --I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.
end
