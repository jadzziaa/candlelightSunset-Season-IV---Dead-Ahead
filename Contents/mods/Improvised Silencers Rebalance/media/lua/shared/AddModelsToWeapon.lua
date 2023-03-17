require "SUFVWeaponTable"
for weaponname,siltype in pairs(SUFVsilencerWeaponTable) do
	local item = ScriptManager.instance:getItem(weaponname)
	if item then 
		if siltype == 0 then -- Pistols
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.SilencerPistol ImprovisedSilencers.SilencerRifle muzzle muzzle")
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.MetalPipeSilencer ImprovisedSilencers.MetalPipeSilencer muzzle muzzle")
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.TorchSilencer ImprovisedSilencers.TorchSilencer muzzle muzzle")
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.WaterBottleSilencer ImprovisedSilencers.WaterBottleSilencer muzzle muzzle")
		elseif siltype == 1 then -- Shotguns
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.Silencer ImprovisedSilencers.SilencerBig muzzle muzzle")
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.MetalPipeSilencer ImprovisedSilencers.MetalPipeSilencerBig muzzle muzzle")
		elseif siltype == 2 then -- Rifles
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.Silencer ImprovisedSilencers.SilencerRifle muzzle muzzle")
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.MetalPipeSilencer ImprovisedSilencers.MetalPipeSilencerRifle muzzle muzzle")
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.TorchSilencer ImprovisedSilencers.TorchSilencerRifle muzzle muzzle")
			item:DoParam("ModelWeaponPart = ImprovisedSilencers.WaterBottleSilencer ImprovisedSilencers.WaterBottleSilencerRifle muzzle muzzle")
		end
	end
end

-- new approach to extent to other mods, still figuring out how to modulize it
-- tired, maybe continue one day when i got time and energy
-- -------------------------------------------------------------------------------------------------------------------------------
-- silencerMountList = ScriptManager.instance:getItem("Silencer.Silencer"):InstanceItem("Silencer.Silencer"):getMountOn()
-- print(ScriptManager.instance:getItem("Silencer.Silencer"):InstanceItem("Silencer.Silencer"):getMountOn())
-- print(type(silencerMountList))
-- print(type(tostring(silencerMountList)))
-- print(type(4))
-- print(type("adfasfa"))
-- print(type({21321,213123,123,2}))
