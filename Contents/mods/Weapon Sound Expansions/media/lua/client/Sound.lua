local stateConfig = {
    font = UIFont.Small,
    offset = 23,
    opacity1 = 0.5,
    opacity2 = 0.25
};

local function PrintPosition()
local txt1 = "WSE";
getTextManager():DrawString(stateConfig.font, 0, 0, txt1, 13, 13, 13, stateConfig.opacity1);

end


local function gunSetSwingSound(weapon)
	
	if weapon ~= nil then
		if gunSoundList[weapon:getType()] == nil then return end
		local gunSound = gunSoundList[weapon:getType()]
		if weapon:getCanon() ~= nil then
	
			if string.find(weapon:getCanon():getType(), "Suppressor") or string.find(weapon:getCanon():getType(), "22Silencer") or string.find(weapon:getCanon():getType(), "9mmSilencer")  or string.find(weapon:getCanon():getType(), "45Silencer")  or string.find(weapon:getCanon():getType(), "38Silencer")  or string.find(weapon:getCanon():getType(), "223Silencer")  or string.find(weapon:getCanon():getType(), "308Silencer")  or string.find(weapon:getCanon():getType(), "ShotgunSilencer") or string.find(weapon:getCanon():getType(), "ImprovisedSilencer") or string.find(weapon:getCanon():getType(), "Silencer_PopBottle") then
				weapon:setSwingSound(gunSound .. '_silence')
			else
				weapon:setSwingSound(gunSound)
			end
		else
			if string.find(gunSound, 'silence') then
				weapon:setSwingSound(gunSound)
			else
				weapon:setSwingSound(gunSound)
			
			end
		end
	end
end

local function gunSoundOnEquip(_player, item, inventoryItem, weapon)
	local player = _player
	if item == nil then return end
	local weapon = player:getPrimaryHandItem()
	gunSetSwingSound(weapon)

	
end

local function OnGameStart()
	local player = getPlayer()
	local weapon = player:getPrimaryHandItem()
	gunSetSwingSound(weapon)
	  
end

Events.OnGameStart.Add(OnGameStart)
Events.OnEquipPrimary.Add(gunSoundOnEquip);
Events.OnPostUIDraw.Add(PrintPosition);