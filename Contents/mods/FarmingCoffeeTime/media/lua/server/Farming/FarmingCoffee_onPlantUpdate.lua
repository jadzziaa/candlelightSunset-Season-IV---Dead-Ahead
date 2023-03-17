
if isClient() then return end
-- here we want to be called by the checkplant loop
-- we add optional mod callback to plant update
local upperLayer = {}
upperLayer.checkStat = SPlantGlobalObject.checkStat
function SPlantGlobalObject:checkStat()
    --print ("SPlantGlobalObject:checkStat "..tostring(self.onPlantUpdateCode or "nil"))
    local prop = farming_vegetableconf.props[self.typeOfSeed]
    if prop and prop.onPlantUpdateCode then 
        assert(loadstring('return '..prop.onPlantUpdateCode..'(...)'))(self,prop)--now we're on, we can consume
    end

    --upper layer afterwards to manage dying from thirst and sickness after modded code
    upperLayer.checkStat(self);
end

