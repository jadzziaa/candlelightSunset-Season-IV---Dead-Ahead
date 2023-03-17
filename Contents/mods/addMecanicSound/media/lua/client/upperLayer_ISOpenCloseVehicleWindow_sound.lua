--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISOpenCloseVehicleWindow"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISOpenCloseVehicleWindow = {}
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--upperLayer.ISOpenCloseVehicleWindow.update = ISOpenCloseVehicleWindow.update
--function ISOpenCloseVehicleWindow:update()
--    upperLayer.ISOpenCloseVehicleWindow.update(self)
--    if self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("OpenWindowLoop") end
--end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--upperLayer.ISOpenCloseVehicleWindow.start = ISOpenCloseVehicleWindow.start
--function ISOpenCloseVehicleWindow:start()
--	upperLayer.ISOpenCloseVehicleWindow.start(self)
--	self.ADDsound = vehicle:playSound("OpenWindow" .. (ZombRand(4)+1)
--end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISOpenCloseVehicleWindow.perform = ISOpenCloseVehicleWindow.perform
function ISOpenCloseVehicleWindow:perform()
    upperLayer.ISOpenCloseVehicleWindow.perform(self)
    --if self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
    if self.window:isOpen() then self.ADDsound = self.character:playSound("OpenWindowPerf2") else self.ADDsound = self.character:playSound("OpenWindowPerf1") end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--upperLayer.ISOpenCloseVehicleWindow.new = ISOpenCloseVehicleWindow.new
--function ISOpenCloseVehicleWindow:new(character, part, open, time)
--    local o = upperLayer.ISOpenCloseVehicleWindow.new(self,character, part, open, time)
--
--    if not ISVehicleMechanics.cheat then o.maxTime = o.maxTime + 30; end
--    return o
--end
-----------------------------------------------------------------------------------------------------------------------------------------------------------


--local rand = ZombRand(4)
--if rand == 1 then self.ADDsound = self.character:playSound("OpenWindow5") end --Wsound = "OpenWindow5" end
--if rand == 2 then self.ADDsound = self.character:playSound("OpenWindow6") end --Wsound = "OpenWindow6" end
--if rand == 3 then self.ADDsound = self.character:playSound("OpenWindow7") end --Wsound = "OpenWindow7" end
--if rand == 0 then self.ADDsound = self.character:playSound("OpenWindow8") end --Wsound = "OpenWindow8" end