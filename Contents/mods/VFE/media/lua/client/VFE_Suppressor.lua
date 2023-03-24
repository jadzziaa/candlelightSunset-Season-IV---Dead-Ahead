local function suppress(wielder, weapon)
  if weapon == nil then return end
	if not weapon:IsWeapon() or not weapon:isRanged() then return; end
    local scriptItem = weapon:getScriptItem()
    local scriptItem = weapon:getScriptItem()

    local soundVolume = scriptItem:getSoundVolume()
    local soundRadius = scriptItem:getSoundRadius()
    local swingSound = scriptItem:getSwingSound()
	
	local canon = weapon:getCanon()
    if canon then
  		if string.find(canon:getType(), "OilFilterSuppressor") then
    	      soundRadius = soundRadius * (0.7)
    	      soundVolume = soundVolume *  (0.8)
			  swingSound = 'suppressedshot2'
				else
          soundRadius = soundRadius * (1)
          soundVolume = soundVolume *  (1)
          swingSound = swingSound
         end
		if string.find(canon:getType(), "OilFilterSuppressor2") then
    	      soundRadius = soundRadius * (0.6)
    	      soundVolume = soundVolume *  (0.7)
			  swingSound = 'suppressedshot'
				else
          soundRadius = soundRadius * (1)
          soundVolume = soundVolume *  (1)
          swingSound = swingSound
         end
	 end
	
    weapon:setSoundRadius(soundRadius)
    weapon:setSoundVolume(soundVolume)
    weapon:setSwingSound(swingSound)
    print(scriptItem:getSoundRadius())
end

Events.OnEquipPrimary.Add(suppress);

Events.OnGameStart.Add(function() -- make sure our player is setup on game start
	local player = getPlayer()
	suppress(player, player:getPrimaryHandItem())
end)
