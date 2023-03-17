-----------------------------------------------------
--  Stab Short Blade Critical Hit by Star and Hea  --
--   Using this code in your mods is not allowed   --
--	     Simple Overhaul: Blades and Spears        --
--           Steam Workshop 2022-2023              --
-----------------------------------------------------

local _weapon = nil
local ShBladeDamageBonus
local ShBladeCritDmgBonus
local ShortBladeLvl

local function checkjawstabmodcheck()
	if getActivatedMods():contains("JawStab_Buff") == true then	
		jawstabmodcheck = 1;
		else jawstabmodcheck = 0; 
	end
end
Events.OnGameStart.Add(checkjawstabmodcheck);

function checkshbladelevel()
	local player = getPlayer();
	if player == nil then
		return
	end
	ShortBladeLvl = player:getPerkLevel(Perks.SmallBlade);
end
Events.OnGameStart.Add(checkshbladelevel);
Events.LevelPerk.Add(checkshbladelevel);
Events.OnCreatePlayer.Add(checkshbladelevel);
Events.OnCreateLivingCharacter.Add(checkshbladelevel);

local function SetWeaponAddedDamage(set_mindamage, set_maxdamage) -- , add_maxrange
	if not _weapon then
		return
	end
	if not _weapon:isEquipped() then
--		print('WARN: not equipped')
	end
--	print('MinDam MaxDam MaxRan',set_mindamage,' ',set_maxdamage) -- ,' ',add_maxrange
	local txt = _weapon:getScriptItem() 
	local txt_mindamage, txt_maxdamage, txt_maxrange = txt:getMinDamage(), txt:getMaxDamage(), txt:getMaxRange()
	if set_mindamage then 
		_weapon:setMinDamage(set_mindamage) 
		_weapon:setMaxDamage(set_maxdamage) 
	else 
		_weapon:setMinDamage(txt_mindamage) 
		_weapon:setMaxDamage(txt_maxdamage) 
		_weapon = nil
	end
end

local function OnWeaponSwingHitPoint(player, weapon)
	local anim = weapon:getSwingAnim()
--	print("OnWeaponSwingHitPoint ", anim)
	if anim ~= "Stab" then
		return
	end
	
	if jawstabmodcheck == 1 then
		player:Say("SOBS: Deactivate Jaw Stab Buff mod!");
	end	
	
	_weapon = weapon	
	local txt = _weapon:getScriptItem()
	local txt_mindamage, txt_maxdamage, txt_maxrange = txt:getMinDamage(), txt:getMaxDamage(), txt:getMaxRange()
	local WeaponCritChance = weapon:getCriticalChance();
	local WeaponCritDmgMultiplier = weapon:getCritDmgMultiplier();
	local CritProcRoll = ZombRand(100);
	local ShBladeCritPerLvl = ShortBladeLvl * 3;

	if WeaponCritChance >= 1 then 
	
		-- Panic moodle penalty
		if player:getMoodles():getMoodleLevel(MoodleType.Panic) == 4 then	
		ShBladeCritPanicPenalty	= 5
		elseif player:getMoodles():getMoodleLevel(MoodleType.Panic) == 3 then	
		ShBladeCritPanicPenalty	= 4
		elseif player:getMoodles():getMoodleLevel(MoodleType.Panic) == 2 then	
		ShBladeCritPanicPenalty	= 2	
		elseif player:getMoodles():getMoodleLevel(MoodleType.Panic) == 1 then	
		ShBladeCritPanicPenalty	= 1	
		else ShBladeCritPanicPenalty = 0
		end

		-- Heavy Load moodle penalty	
		if player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 4 then	
		ShBladeCritHeavyLoadPenalty	= 20
		elseif player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 3 then	
		ShBladeCritHeavyLoadPenalty	= 15
		elseif player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 2 then	
		ShBladeCritHeavyLoadPenalty	= 10	
		elseif player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 1 then	
		ShBladeCritHeavyLoadPenalty	= 5	
		else ShBladeCritHeavyLoadPenalty = 0
		end	
		
		ActualCritChance = ((WeaponCritChance * 0.5) + ShBladeCritPerLvl) - (ShBladeCritPanicPenalty + ShBladeCritHeavyLoadPenalty)
		if ActualCritChance <= 0 then 
			ActualCritChance = 0
		end		

		else
			ActualCritChance = 0
	end
	
	-- Actual Damage calculation
	local MinDamageCritHit = txt_mindamage * WeaponCritDmgMultiplier -- Critical Hit Min Damage
	local MaxDamageCritHit = txt_maxdamage * WeaponCritDmgMultiplier -- Critical Hit Max Damage
	local MinDamageHit = txt_mindamage -- Normal Hit Min Damage
	local MaxDamageHit = txt_maxdamage -- Normal Hit Max Damage

	if CritProcRoll <= ActualCritChance then
		SetWeaponAddedDamage(MinDamageCritHit, MaxDamageCritHit)
--		print("crit")
--		player:Say("crit");	
	else
		SetWeaponAddedDamage(MinDamageHit, MaxDamageHit)
	end
--	print("ShBladeCritPanicPenalty: " ..  ShBladeCritPanicPenalty)		
--	print("ShBladeCritHeavyLoadPenalty: " ..  ShBladeCritHeavyLoadPenalty)		
--	print("ActualCritChance: " ..  ActualCritChance)	
--	print("ShBladeCritChanceBonus: " ..  ShBladeCritChanceBonus)	
--	print("ShBladeCritDmgBonus: " ..  (WeaponCritDmgMultiplier * ShBladeCritDmgBonus))		
--	print("ShBladeDamageBonus: " ..  ShBladeDamageBonus)	
--	print("getMaxRange: " ..  weapon:getMaxRange())	
end

Events.OnWeaponSwingHitPoint.Add(OnWeaponSwingHitPoint)

local function ResetDamage()
	SetWeaponAddedDamage()
end

Events.OnWeaponHitCharacter.Add(ResetDamage)
Events.OnPlayerAttackFinished.Add(ResetDamage)
Events.EveryOneMinute.Add(ResetDamage)
Events.OnEquipPrimary.Add(ResetDamage)