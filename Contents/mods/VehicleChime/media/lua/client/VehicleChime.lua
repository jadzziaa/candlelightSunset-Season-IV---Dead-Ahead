--[[
Code rant:

I really tried to be fancy with classes and methods, but Lua and really sparse docs killed this pretty quickly :c
LMK if you know this: Exception thrown java.lang.RuntimeException: attempted index of non-table at KahluaUtil.fail line:82.

Next I tried to be fancy and use events, but guess what: They are also poorly documented and the good ones are the wrong ones.
OnKeyPressed -> Only works for keys, what if we turn on lights with a button
OnExitVehicle / OnEnterVehicle / OnSwitchVehicleSeat -> Well, cool but they are useless in terms on light on/off
OnUseVehicle -> Would have been amazing but just simply does not work, I always get the nil from above again

Then I wanted to play a sound in a loop, but ofc thats broken too.
Then I was like, ok just call it in a loop and let is wait after, but ofc os.clock is not avaiable either.

So here we are with a function which just runs OnTick and nothing really fancy about it, I tried to do better but it is what it is
--]]

ChimeIsPlaying = false
LastChimePlayed = getTimestampMs() + 5000
Audio = nil

function StopAudio()
  if Audio then
    Audio:stop()
    ChimeIsPlaying = false
  end
end

function IsEmpty(variable)
  if not variable or variable == nil or variable == '' then
    return true
  end
  return false
end

function ChimeTick()
  local p = getPlayer()
  if IsEmpty(p) then return StopAudio() end -- because we need to check everything twice with lua

  local v = p:getVehicle()

  if IsEmpty(v) or not v:isDriver(p) then
    return StopAudio()
  end

  if ( v:isEngineRunning() or not v:getHeadlightsOn() ) then
    return StopAudio()
  end

  if (getTimestampMs() - LastChimePlayed >= 1100) then
    LastChimePlayed = getTimestampMs()
    StopAudio()
    Audio = getSoundManager():PlayWorldSound("oldsmobile_chime", true, p:getSquare(), 0, 10, 1, true)
  end
end

function EnterVehicle(player)
  local v = player:getVehicle()

  -- dont do this script for boats
  if string.find(string.lower(v:getObjectName()), "boat") or string.find(string.lower(v:getObjectName()), "yacht") then
    return StopAudio()
  end

  if ( v:getBatteryCharge() <= 0 or not v:isEngineWorking() ) then
    return StopAudio()
  end

  Events.OnTick.Add(ChimeTick)
end

function ExitVehicle()
  Events.OnTick.Remove(ChimeTick)
end

Events.OnEnterVehicle.Add(EnterVehicle)
Events.OnExitVehicle.Add(ExitVehicle)

print("[Daszh][VehicleChime][INFO] Loaded sucessfully?")
