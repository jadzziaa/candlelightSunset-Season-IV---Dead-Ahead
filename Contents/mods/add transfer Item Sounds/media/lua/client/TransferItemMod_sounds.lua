-----------------------------------------------------------------------------------------------------------------------------------------------------------
local TIsnd = {}
TIsnd.ISInventoryTransferAction = {}
TIsnd.ISDetachItemHotbar = {}
TIsnd.ISAttachItemHotbar = {}
TIsnd.ISEquipWeaponAction = {}
TIsnd.ISUnequipAction = {} 
TIsnd.ISWearClothing = {}
TIsnd.sound = nil
TIsnd.delay  = nil
local delayStart = 77

--cannette vide >>>     
--cannette pleine >> Pop Pop2 Pop3 
--bouteil plastic vide >>>        
----------------------------------------------------------------------------------------------------------------------------------------------------------- 
local function TI_getSoundItem(item,stat)
	if stat == "up" or stat == "down" or stat == "cloth" then suFFixe = "_TakingM" else suFFixe = "_Clothing" end --"transf"
	local itemType = item:getType()
	if itemType and stat ~= "cloth" then
		-------------------------------------------------------------------------------
		if     	luautils.stringStarts(itemType, 'Guitar') or
				itemType == "Violin" 				or 
			    itemType == "Banjo"  			  	then suFFixe = "_itemGuitar_"..stat		
		-------------------------------------------------------------------------------
		elseif 	itemType == "PetrolCan" 		  	then suFFixe = "_itemPetrolCan_"..stat 
		-------------------------------------------------------------------------------
		elseif  itemType == "SmashedBottle" 	  	then suFFixe = "_SmashedBottle_"..stat
		-------------------------------------------------------------------------------
		elseif  itemType == "Molotov" 		      	then suFFixe = "_itemMolotov_"..stat 
		-------------------------------------------------------------------------------
		elseif  itemType == "WhiskeyWaterFull"  	or        
		   		itemType == "BeerWaterFull"     	or 
		   		itemType == "WineWaterFull"     	or 
		   		itemType == "WhiskeyPetrol"     	or 
		   		itemType == "WinePetrol" 	    	or 
		   		itemType == "Beer" 	   		    	or 
		   		itemType == "BeerBottle" 	    	or 
		   		itemType == "Wine" 	   		    	or
		   		itemType == "Wine2"  	   	    	or
		   		itemType == "WhiskeyFull"  	    	then suFFixe = "_itemMolotov_"..stat
		-------------------------------------------------------------------------------
		elseif  itemType == "PetrolBleachBottle"	or        
		   		itemType == "WaterBottlePetrol" 	or
		   		itemType == "PetrolPopBottle"  		then suFFixe = "_Water"
		-------------------------------------------------------------------------------
		elseif  itemType == "BeerEmpty"       		or 
				itemType == "EmptyJar"    			or
		 		itemType == "WhiskeyEmpty"    		or 
		 		itemType == "WineEmpty2"      		or 
		 		itemType == "WineEmpty"       		or
		 		itemType == "GlassTumbler"    		then suFFixe = "_GlassBottle"
		-------------------------------------------------------------------------------
		elseif 	itemType == "Saucepan" 			  	or
				itemType == "Pan" 				  	or 
			    itemType == "GridlePan" 		  	then suFFixe = "_itemPan_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "Plank" 			  	or 
				itemType == "MayonnaiseEmpty" 		or
				itemType == "BeerCanEmpty" 			or
				itemType == "PopEmpty" 				or
				itemType == "Pop2Empty" 			or
				itemType == "Pop3Empty" 			or
				itemType == "RemouladeEmpty" 		or
				itemType == "BucketEmpty" 			or
				itemType == "PopBottleEmpty" 		or
				itemType == "WaterBottleEmpty" 		or
				itemType == "BleachEmpty" 			or 
			    itemType == "SpearCrafted" 		  	or
				itemType == "EmptyPetrolCan" 		or
				itemType == "Nightstick" 			or
			    itemType == "AntiCrowbar"  			then suFFixe = "_TakingM"
		-------------------------------------------------------------------------------
		elseif 	itemType == "AntiLockpick" 			or
				itemType == "CarLockNeimanPart" 	or
				itemType == "CarLockDoorPart" 		or
				itemType == "PrintTool" 			or
				itemType == "PrintToolCar" 			or
				itemType == "CarKeyCutter" 			or
				itemType == "Key_Duplication_Machine"or
				itemType == "GPSdayz" 			  	or
				itemType == "GPSdestroyed" 			then suFFixe = "_WeaponPart"
		-------------------------------------------------------------------------------
		elseif 	itemType == "Machete" 			  	or 
			    itemType == "Katana"  			  	then suFFixe = "_itemKatana_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "BarBell" 	 		  	or
				itemType == "DumbBell"   		  	or
				itemType == "Wrench" 	 		  	or 
			    itemType == "PipeWrench" 		  	then suFFixe = "_itemWrench_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "BreadKnife"   		  	or
				itemType == "ButterKnife"  		  	or
				itemType == "Fork" 		   		  	or
				itemType == "IcePick" 	   		  	or
				itemType == "LetterOpener" 		  	or
				itemType == "TowHookCar" 		  	or
			    itemType == "Spoon" 	   		  	then suFFixe = "_itemMetalObj_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "HandScythe"   		  	or
				itemType == "HuntingKnife" 		  	or
				itemType == "KitchenKnife" 		  	or
				itemType == "MeatCleaver"  		  	or 
			    itemType == "Scalpel" 	   		  	then suFFixe = "_itemKnife_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "HandShovel" 		  	or 
			    itemType == "HandFork" 	 		  	then suFFixe = "_itemHandShovel_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "BaseballBat" 		  	or
				itemType == "HockeyStick" 		  	or
				itemType == "IceHockeyStick" 	  	or
				itemType == "Poolcue" 			  	or
				itemType == "BaseballBatNails" 	  	or
				itemType == "PlankNail" 		  	or
				itemType == "PickAxeHandle" 	  	or
				itemType == "RollingPin" 		  	or
				itemType == "PickAxeHandleSpiked" 	or
				itemType == "TableLeg" 			  	then suFFixe = "_itemBat_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "Crowbar" 			  	or
				itemType == "Golfclub" 			  	or
				itemType == "LeadPipe" 			  	or
				itemType == "MetalBar" 			  	or 
				itemType == "TowBarCar" 			or
				itemType == "AntiCrowbar" 			or
			    itemType == "MetalPipe" 		  	then suFFixe = "_itemBar_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "LeafRake" 	 		  	or
				itemType == "Rake" 		 		  	or 
			    itemType == "GardenFork" 		  	then suFFixe = "_itemRake_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "Shovel" 	 		  	or
				itemType == "Shovel2" 	 		  	or
				itemType == "SnowShovel" 		  	or
			    itemType == "GardenHoe"  		  	then suFFixe = "_itemShovel_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "Sledgehammer" 		  	or
				itemType == "Sledgehammer2" 	  	then suFFixe = "_itemSledge_"..stat
		-------------------------------------------------------------------------------
		elseif  itemType == "BallPeenHammer" 	  	or 
				itemType == "ClubHammer" 		  	or
				itemType == "PickAxe"			  	or
			    itemType == "Hammer" 		 	  	then suFFixe = "_itemHammer_"..stat
		-------------------------------------------------------------------------------
		elseif 	itemType == "Axe" 	  			  	or
				itemType == "HandAxe" 			  	or 
			    itemType == "WoodAxe" 			  	then suFFixe = "_itemAxe_"..stat
		-------------------------------------------------------------------------------
		elseif 	luautils.stringStarts(itemType, 'Spear') then suFFixe = "_itemSpear_"..stat
		-------------------------------------------------------------------------------
		end
	end
	return suFFixe
end
----------------------------------------------------------------------------------------------------------------------------------------------------------- 
local function TI_SoundDisplayCategory2(player,item,stat)
	if not item or not player then return end
	local suFFixe = TI_getSoundItem(item,stat)
	local Cat = item:getDisplayCategory()
	local rand = ZombRand(6)
	if Cat ~= nil and suFFixe == "_TakingM" then
		---------------------------------------------
		local StrgItemType = item:getStringItemType()
		local MetalValue   = item:getMetalValue()
		local StrgItemType = item:getStringItemType()
		local itemCat	   = item:getCategory()
		if itemCat == "Weapon" 		then
			if 	Cat == "Weapon" 	then  if StrgItemType ~= "MeleeWeapon" then suFFixe = "_Weapon" end --Cat == "WeaponCrafted" or item:getType() == Type.Weapon  --Cat == "Container"
			end
		elseif Cat == "Clothing"  	or 
			   Cat == "Accessory" 	or 
			   Cat == "Bag" 	  	or 
			   Cat == "Bandage"   	then  if rand < 2 then suFFixe = "_Bag" elseif rand < 4 then suFFixe = "_Clothing" else suFFixe = "_Taking" end
		end 	
	end
	--print("-----------------")
	--print("vanillaCat : "..Cat)
	--print("TIsnd Cat : "..suFFixe)
	--print("getType : "..item:getType())
	--print("metal value : "..item:getMetalValue())
	--print("StrgItemType : "..item:getStringItemType())
	--print("TIsnddelay".. tostring(TIsnd.delay))
	if player:getVehicle() then
		return "inTIsnd"..suFFixe
	else
		return "TIsnd"..suFFixe
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------- 
local function TI_SoundDisplayCategory(player,item,stat)
	if not item or not player then return end
	local itemType = item:getType()
	local Cat 	   = item:getDisplayCategory()
	local maxAmmo = item:getMaxAmmo()
	local suFFixe  = TI_getSoundItem(item,stat)
	local rand 	   = ZombRand(6)
	if Cat ~= nil and itemType and suFFixe == "_Clothing" then
		----------------------------------------------------------------------------------------
		local ReplaceOnUse = item:getReplaceOnUse()
		local StrgItemType = item:getStringItemType()
		local MetalValue   = item:getMetalValue()
		
		if 		ReplaceOnUse == "BeerEmpty"     or
		   		ReplaceOnUse == "WhiskeyEmpty"  or
		   		ReplaceOnUse == "WineEmpty2"    or
		   		ReplaceOnUse == "WineEmpty"     or
		   		ReplaceOnUse == "GlassTumbler"  then if rand < 3 then suFFixe = "_itemMolotov_up" else suFFixe = "_itemMolotov_down" end
		----------------------------------------------------------------------------
		elseif 	Cat 		== "Water" 			or 
		   		Cat 		== "WaterContainer" then suFFixe = "_Water"	
		----------------------------------------------------------------------------
		elseif Cat == "Weapon" 		  		  	then 	if StrgItemType ~= "MeleeWeapon" then suFFixe = "_Weapon" elseif rand < 4 then suFFixe = "_WeaponMelee" else suFFixe = "_TakingM" end
		----------------------------------------------------------------------------
		elseif Cat == "ToolWeapon"    		  	or 
			   Cat == "Tool" 		  		  	then  suFFixe = "_TakingM"  
		----------------------------------------------------------------------------
		elseif Cat == "Sports"   	  		  	then  if MetalValue > 0 then suFFixe = "_ToolM" elseif rand < 3 then suFFixe = "_TakingM" end
		----------------------------------------------------------------------------
		elseif 			Cat == "Food" 			or 
			   ReplaceOnUse == "TinCanEmpty" 	or 
			   ReplaceOnUse == "BeerCanEmpty"	or 
			   itemType 	== "BeerCanEmpty" 	or 
			   itemType 	== "TinCanEmpty"  	then	
			---------------------------------------
			if(ReplaceOnUse == "TinCanEmpty" 	or 
			   ReplaceOnUse == "BeerCanEmpty" 	or
			   ------------------------------------
			   itemType 	== "BeerCanEmpty" 	or 
			   itemType 	== "TinCanEmpty"  	or 
			   StrgItemType == "CannedFood")  	and
			   rand 		< 5 			  	then suFFixe = "_FoodM" 
			else 								   	 suFFixe = "_Taking"
			end
		----------------------------------------------------------------------------
		elseif Cat == "Security"		  then 	suFFixe = "_Security"
		elseif Cat == "Ammo" 			  then 	if maxAmmo > 0 then suFFixe = "_WeaponPart" else suFFixe = "_Ammo" end
		elseif Cat == "Entertainment" 	  then 	suFFixe = "_Entertainment"
		elseif Cat == "Bag" and rand < 4  then  suFFixe = "_Bag"
		elseif Cat == "VehicleMaintenance"then 	suFFixe = "_VehicleMaintenance"
		----------------------------------------------------------------------------
		elseif Cat == "WeaponPart" 	 	  then 	suFFixe = "_WeaponPart" 
		----------------------------------------------------------------------------
		elseif Cat == "Explosives" 	 	  or 
			   Cat == "Instrument" 		  or 
			   Cat == "Trapping" 	 	  or 
			   Cat == "Electronics" 	  or 
			   Cat == "Communications"	  then 	suFFixe = "_Instrument"
		----------------------------------------------------------------------------
		elseif Cat == "Clothing" 		  or 
			   Cat == "Accessory" 		  or 
			   Cat == "Bandage" 		  then 	if rand < 4 then suFFixe = "_Clothing" else suFFixe = "_Taking" end
		----------------------------------------------------------------------------
		elseif Cat == "Cartography"  	  or 
			   Cat == "Literature" 		  or 
			   Cat == "SkillBook" 		  then 	suFFixe = "_Literature"
		----------------------------------------------------------------------------
		elseif Cat == "Household" 		  or
			   Cat == "Fishing" 	 	  or 
			   Cat == "Furniture" 	 	  or 
			   Cat == "Junk" 			  or
			   Cat == "Camping" 		  then 	if MetalValue > 0 then suFFixe = "_VehicleMaintenance" elseif rand < 2 then suFFixe = "_TakingM" elseif rand < 5 then suFFixe = "_Furniture" else suFFixe = "_Box" end
		----------------------------------------------------------------------------
		elseif Cat == "FirstAid" and rand < 4 then  suFFixe = "_Taking"
		----------------------------------------------------------------------------
		elseif Cat == "Material" and rand < 4 then  if MetalValue > 0 then suFFixe = "_VehicleMaintenance" else suFFixe = "_Furniture" end
		----------------------------------------------------------------------------
		elseif StrgItemType == "MeleeWeapon"  then  suFFixe = "_TakingM"
		----------------------------------------------------------------------------
		elseif Cat 			== "Gardening"    then  if rand < 2 then suFFixe = "_Taking" elseif rand < 4 then suFFixe = "_Furniture" end
		----------------------------------------------------------------------------
		elseif Cat 			== "Cooking"      then  if MetalValue >= 19 then suFFixe = "_CookingM" elseif rand < 5 then suFFixe = "_Cooking" else suFFixe = "_TakingM" end
		----------------------------------------------------------------------------
		end
	end
	------------------------------------------------------------------------------------------------------------------------------------
	if luautils.stringStarts(suFFixe, '_item') and rand > 3 then if rand > 4 then suFFixe = "_TakingM" else suFFixe = "_Clothing" end end
	------------------------------------------------------------------------------------------------------------------------------------
	--print("-----------------")
	--print("vanillaCat : "..Cat)
	--print("TIsnd Cat : "..suFFixe)
	--print("getType : "..item:getType())
	--
	--print("metal value : "..item:getMetalValue())
	--print("StrgItemType : "..item:getStringItemType())
	--print("TIsnddelay".. tostring(TIsnd.delay))
	if player:getVehicle() then
		return "inTIsnd"..suFFixe
	else
		return "TIsnd"..suFFixe
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function TI_ISInventoryTransferAction_delay_stop_sound()
-----------------------------------------------------------------------------------------------------------------------------------------------------------
	local player = getSpecificPlayer(0)
	if TIsnd.delay == nil then TIsnd.delay = delayStart end
	if TIsnd.delay <= 0 then
		if player and TIsnd.sound and TIsnd.sound ~= 0 and player:getEmitter():isPlaying(TIsnd.sound) then
			player:getEmitter():stopSound(TIsnd.sound)
		end
		TIsnd.delay = nil 
		TIsnd.sound = nil
		------------------------------------------------------------------------
		Events.OnPlayerUpdate.Remove(TI_ISInventoryTransferAction_delay_stop_sound)
		------------------------------------------------------------------------
		return
	end
	TIsnd.delay = TIsnd.delay -1
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
TIsnd.ISInventoryTransferAction.update = ISInventoryTransferAction.update
function ISInventoryTransferAction:update()
	TIsnd.ISInventoryTransferAction.update(self)
	--------------------------------------------------------------------------------------
	if self.character and ISInventoryTransferAction.putSound and ISInventoryTransferAction.putSound ~= 0 and self.character:getEmitter():isPlaying(ISInventoryTransferAction.putSound) then
		self.character:getEmitter():stopSound(ISInventoryTransferAction.putSound)
	end
	--------------------------------------------------------------------------------------
	if (self.character and self.item) and (TIsnd.sound == nil or (TIsnd.sound and not self.character:getEmitter():isPlaying(TIsnd.sound))) then
		local soundCat = TI_SoundDisplayCategory(self.character,self.item,"transf")
		if soundCat ~= nil then
			TIsnd.sound = self.character:getEmitter():playSound(soundCat)
		end
	end
	--------------------------------------------------------------------------------------
	if TIsnd.delay == nil then TIsnd.delay = delayStart end
	TIsnd.delay = TIsnd.delay +1
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
TIsnd.ISInventoryTransferAction.start = ISInventoryTransferAction.start
function ISInventoryTransferAction:start()
	TIsnd.ISInventoryTransferAction.start(self)
	--------------------------------------------------------------------------------------
	Events.OnPlayerUpdate.Add(TI_ISInventoryTransferAction_delay_stop_sound) --TIsnd.delay == nil or TIsnd.delay <= 0 -- if self.startTest == nil then end
	--------------------------------------------------------------------------------------
	if self.character and ISInventoryTransferAction.putSound and ISInventoryTransferAction.putSound ~= 0 and self.character:getEmitter():isPlaying(ISInventoryTransferAction.putSound) then
		self.character:getEmitter():stopSound(ISInventoryTransferAction.putSound)
	end
	if (self.startTest == nil and self.character and self.item) and (TIsnd.sound == nil or (TIsnd.sound and not self.character:getEmitter():isPlaying(TIsnd.sound))) then
		self.startTest = true
		local soundCat = TI_SoundDisplayCategory(self.character,self.item,"transf")
		if soundCat ~= nil then
			TIsnd.sound = self.character:getEmitter():playSound(soundCat)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local function TI_playSoundAction(player,item,stat)
-----------------------------------------------------------------------------------------------------------------------------------------------------------
	Events.OnPlayerUpdate.Add(TI_ISInventoryTransferAction_delay_stop_sound)--if TIsnd.delay == nil or TIsnd.delay <= 0 then  end
	--------------------------------------------------------------------------------------
	if (player and item) and (TIsnd.sound == nil or (TIsnd.sound and not player:getEmitter():isPlaying(TIsnd.sound))) then
		local soundCat = TI_SoundDisplayCategory2(player,item,stat)
		if soundCat ~= nil then
			TIsnd.sound = player:getEmitter():playSound(soundCat)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
TIsnd.ISDetachItemHotbar.start = ISDetachItemHotbar.start
function ISDetachItemHotbar:start()
	TIsnd.ISDetachItemHotbar.start(self)
	TI_playSoundAction(self.character,self.item,"down")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
TIsnd.ISAttachItemHotbar.start = ISAttachItemHotbar.start
function ISAttachItemHotbar:start()
	TIsnd.ISAttachItemHotbar.start(self)
	TI_playSoundAction(self.character,self.item,"up")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
TIsnd.ISEquipWeaponAction.start = ISEquipWeaponAction.start
function ISEquipWeaponAction:start()
	TIsnd.ISEquipWeaponAction.start(self)
	if not self.item:getEquipSound() then
		TI_playSoundAction(self.character,self.item,"up")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
TIsnd.ISUnequipAction.start = ISUnequipAction.start
function ISUnequipAction:start()
	TIsnd.ISUnequipAction.start(self)
	TI_playSoundAction(self.character,self.item,"down")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
TIsnd.ISWearClothing.start = ISWearClothing.start
function ISWearClothing:start()
	TIsnd.ISWearClothing.start(self)
	TI_playSoundAction(self.character,self.item,"cloth")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------















--[[
ANIMAUX

DisplayCategory = Beaver,
DisplayCategory = Fox,
DisplayCategory = Hedgehog,
DisplayCategory = Mole,
DisplayCategory = Bunny,
DisplayCategory = Squirrel,
DisplayCategory = Badger,
DisplayCategory = Raccoon,
DisplayCategory = Corpse,

DisplayCategory = Paint,

DisplayCategory = LightSource,

DisplayCategory = ZedDmg,
DisplayCategory = Hidden
DisplayCategory = Appearance
]]
	






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	
	
	
	
	
	
	