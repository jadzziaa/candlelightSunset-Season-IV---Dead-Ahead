-- If in a multiplayer session, scale radius
-- to compensate for reduction in
-- ISReloadWeaponAction.lua, l. 348:
--
--		if isClient() then -- limit sound radius in MP
--			radius = radius / 2.2;
--		end

local SoundRadiusScale = 2.2

Events.OnGameBoot.Add(function()
	if not isClient() then return end

	local AllItems = ScriptManager.instance:getAllItems()

	for i=0,AllItems:size()-1 do
		local item = AllItems:get(i)

		if item:isRanged() then
			item:setSoundRadius(item:getSoundRadius() * SoundRadiusScale)
		end
	end
end)
