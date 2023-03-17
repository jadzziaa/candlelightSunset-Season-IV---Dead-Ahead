--Any item that have a transfornation to another item
local BOTTLES_TRANSFER = {
	WineEmpty='WineWaterFull',
	WhiskeyEmpty='WhiskeyWaterFull',
	WaterBottleEmpty='WaterBottleFull',
	WineEmpty2='WineWaterFull',
	PopBottleEmpty='WaterPopBottle',
	
	WaterPopBottle = 'PopBottleEmpty',
	WineWaterFull = 'WineEmpty',
	WhiskeyWaterFull = 'WhiskeyEmpty',
	WaterBottleFull = 'WaterBottleEmpty',
	
	WaterMug='Mugl',Mugl='WaterMug',
	--WaterBowl='Bowl',Bowl='WaterBowl',
	WaterPot='Pot',Pot='WaterPot',
	WaterSaucepan='Saucepan',Saucepan='WaterSaucepan',
	MayonnaiseWaterFull='MayonnaiseEmpty',MayonnaiseEmpty='MayonnaiseWaterFull',
	RemouladeWaterFull='RemouladeEmpty',RemouladeEmpty='RemouladeWaterFull',
	WateredCanFull='WateredCan',WateredCan='WateredCanFull',
	FullKettle='Kettle',Kettle='FullKettle',
	
	Flask = 'FlaskEmpty', FlaskEmpty = 'Flask',
	EmptyMilitaryCanteen = 'MilitaryCanteenFull', MilitaryCanteenFull = 'EmptyMilitaryCanteen',
	
	--Bucket
	BucketEmpty={BucketWaterFull=1,BucketConcreteFull=1,BucketPlasterFull=1,},
	BucketWaterFull='BucketEmpty',
	BucketConcreteFull='BucketEmpty',
	BucketPlasterFull='BucketEmpty',
	
	--Empty Sandbag
	EmptySandbag={Dirtbag=1,Gravelbag=1,Sandbag=1,CompostBag=1,},
	Dirtbag='EmptySandbag',
	Gravelbag='EmptySandbag',
	Sandbag='EmptySandbag',
	CompostBag='EmptySandbag',
	--FertilizerEmpty='',Fertilizer='FertilizerEmpty',
	
	--misc
	BathTowel='BathTowelWet',BathTowelWet='BathTowel',
	DishCloth='DishClothWet',DishClothWet='DishCloth',
	EmptyPetrolCan='PetrolCan',PetrolCan='EmptyPetrolCan',
	
	GardeningSprayEmpty={GardeningSprayMilk=1,GardeningSprayFull=1,GardeningSprayCigarettes=1},
	GardeningSprayMilk='GardeningSprayEmpty',
	GardeningSprayFull='GardeningSprayEmpty',
	GardeningSprayCigarettes='GardeningSprayEmpty',
	
	--Bowls
	Bowl={BeanBowl=1,WaterBowl=1,PastaBowl=1,RamenBowl=1,StewBowl=1,RiceBowl=1,SoupBowl=1,CerealBowl=1,CakeBatter=1,Oatmeal=1,
		Salad=1,FruitSalad=1},
	BeanBowl='Bowl',
	WaterBowl='Bowl',
	PastaBowl='Bowl',
	RamenBowl='Bowl',
	StewBowl='Bowl',
	RiceBowl='Bowl',
	SoupBowl='Bowl',
	CerealBowl='Bowl',
	CakeBatter='Bowl',
	Oatmeal='Bowl',
	Salad='Bowl',
	FruitSalad='Bowl',
	
	--Repairing
	BlowTorch='BlowTorch',
	Torch='Torch',
	
	--Weapons
	BaseballBat = 'BaseballBatNails',
	SpearCrafted={ SpearBreadKnife=1,SpearButterKnife=1,SpearFork=1,SpearHandFork=1,SpearHuntingKnife=1,SpearIcePick=1,
		SpearKnife=1,SpearLetterOpener=1,SpearMachete=1,SpearScalpel=1,SpearScissors=1,SpearScrewdriver=1,SpearSpoon=1,
	},
	SpearBreadKnife='SpearCrafted',SpearButterKnife='SpearCrafted',SpearFork='SpearCrafted',
	SpearHandFork='SpearCrafted',SpearHuntingKnife='SpearCrafted',SpearIcePick='SpearCrafted',
	SpearKnife='SpearCrafted',SpearLetterOpener='SpearCrafted',SpearMachete='SpearCrafted',
	SpearScalpel='SpearCrafted',SpearScissors='SpearCrafted',SpearScrewdriver='SpearCrafted',SpearSpoon='SpearCrafted',
	
	--Fish
	Bass={FishFillet=2},
	Catfish={FishFillet=2},
	Perch={FishFillet=2},
	Crappie={FishFillet=2},
	Panfish={FishFillet=2},
	Pike={FishFillet=2},
	Trout={FishFillet=2},
	FishFillet=0, --must be added or it wont work
	
	--Complex craft
	--[[BoxOfJars={EmptyJar=6},  ---JJ: EmptyJar have to be added to BOTTLES_TRANSFER, or it won't work
	NailsBox={Nails=20},
	ScrewsBox={Screws=20},
	PaperclipBox={Paperclip=40},
	Bread={BreadSlices=3},
	BreadDough={BreadSlices=3},
	PieWholeRaw={Pie=5},
	CakeRaw={CakeSlice=5},
	Ham={HamSlice=6},

	--Boxes *5
	Bullets9mmBox={Bullets9mm=6},
	Bullets45Box={Bullets45=6},
	Bullets38Box={Bullets38=6},
	Bullets44Box={Bullets44=4},
	['223Box']={['223Bullets']=8},
	['308Box']={['308Bullets']=8},
	ShotgunShellsBox={ShotgunShells=4},
	['556Box']={['556Bullets=12']=12},--]]
}

--Any ghost item that may appear at a random time, but very important for player
local GUN_MAG_MEMORY = {
	['9mmClip']=1, ['45Clip']=1, ['44Clip']=1, ['223Clip']=1, ['308Clip']=1, ['556Clip']=1,
}

local memory = nil --persistent table

Events.OnCreatePlayer.Add(function()
	if memory then
		return
	end
	local player = getPlayer()
	if not player then
		return
	end
	memory = player:getModData().AlwaysFavorite
	--print('LOADED MEMORY')
	--for k,v in pairs(memory) do print(k,'=',v) end
	if not memory then
		--print('ZERO MEMORY')
		memory = {}
	end
end)

local last_save = {}
local save_clips = nil

local function onUpdateInventory()
	if not memory then
		return
	end
	local new_save = {}
	local new_clips = {}
	local player = getPlayer()
	local inv = player:getInventory()
	local items = {}
	-- CHECK INVENTORY
	for i=1,inv:getItems():size() do
		local item = inv:getItems():get(i-1)
		local name = item:getType()
		if (BOTTLES_TRANSFER[name]) then
			new_save[item] = {name=name, fav=item:isFavorite()}
		end
		if GUN_MAG_MEMORY[name] then
			new_save[item] = {name=name, fav=item:isFavorite()}
			local data = new_clips[name]
			if not data then
				data = { total=0, fav=0 }
				new_clips[name] = data
			end
			data.total = data.total + 1
			if item:isFavorite() then
				data.fav = data.fav + 1
			end
		end
	end
	-- BOTTLES
	for item,data in pairs(last_save) do
		if not new_save[item] and data.fav then
			--print('Found removed fav: ',data.name)
			local trans_data = BOTTLES_TRANSFER[data.name]
			--print('Trans: ',tostring(trans_data))
			if type(trans_data) == 'table' then --trans_data is associative array
				--print('Trans is a table')
				--print_r(new_save)
				for k,v in pairs(new_save) do
					--if trans_data[v.name] then
					--	print('check: ',v.fav,last_save[k])
					--end
					if trans_data[v.name] and not v.fav and not last_save[k] then
						--print('Found result: ',v.name)
						k:setFavorite(true)
						v.fav = true
						local num = trans_data[v.name] - 1
						if num > 0 then --make favorite few items at once (rare action)
							--print('Need more: ',num)
							for kk,vv in pairs(new_save) do
								if vv.name == v.name and not vv.fav and not last_save[kk] then
									kk:setFavorite(true)
									vv.fav = true
									--print('added')
									num = num - 1
									if num < 1 then
										break
									end
								end
							end
						end
						break
					end
				end
			elseif trans_data then -- trans_data is simple string
				for k,v in pairs(new_save) do
					if trans_data == v.name and not v.fav and not last_save[k] then
						k:setFavorite(true)
						v.fav = true
						break
					end
				end
			end
		end
	end
	last_save = new_save
	-- CLIPS
	if not save_clips then
		save_clips = new_clips
		return
	end
	local is_memory_changed = false
	local function Mark(name, mark_num) --print('Mark ',mark_num)
		if mark_num == 0 then
			return
		end
		memory[name] = memory[name] - mark_num
		if memory[name] == 0 then
			memory[name] = nil
		end
		is_memory_changed = true
		for item,data in pairs(new_save) do
			--print(data.name,' ',name)
			if data.name == name and not data.fav then
				item:setFavorite(true)
				mark_num = mark_num - 1
				if mark_num == 0 then
					return
				end
			end
		end
	end
	local function MoveClips(name, old, new) 
		local old_total, old_fav = old.total, old.fav
		local new_total, new_fav = new.total, new.fav
		--print('MoveClips '..name..' ('..old_total..','..old_fav..') ---> ('..new_total..','..new_fav..')')
		if old_fav > 0 and new_fav > 0 then --remove common favorites
			local delta = math.min(new_fav, old_fav)
			old_total = old_total - delta
			old_fav = old_fav - delta
			new_total = new_total - delta
			new_fav = new_fav - delta
		end
		if old_fav > 0 then --saome favs were removed
			local removed = math.max(old_total - new_total, 0)
			local in_gun = math.min(removed, old_fav) --to memory
			if in_gun > 0 then
				--print('in_gun ',in_gun)
				memory[name] = (memory[name] or 0) + in_gun
				is_memory_changed = true
			end
			--if removed > in_gun  ----->  unfavorite, ignore
			--if removed < in_gun ------> dropped items, ignore
			local added = math.max(new_total - old_total, 0) --from memory
			if added > 0 then --mark
				--print('mark ',mark_num)
				local mark_num = math.min(added, memory[name] or 0)
				Mark(name, mark_num)
			end
		end
		if new_fav > 0 then --just marked by user
			local common_num = new_total - new_fav
			local added = math.max(new_total - old_total, 0) 
			local plus = math.min(added, common_num) --from memory
			if added > 0 then --mark
				--print('mark2 ',mark_num)
				local mark_num = math.min(added, memory[name] or 0)
				Mark(name, mark_num)
			end
		end
		if new_fav == 0 then
			local added = math.max(new_total - old_total, 0) --from memory
			if added > 0 then --mark
				--print('mark3 ',mark_num)
				local mark_num = math.min(added, memory[name] or 0)
				Mark(name, mark_num)
			end
		end
	end
	local cache = {}
	for k,v in pairs(new_clips) do
		--print('log '..v.total..' '..v.fav)
		local data = save_clips[k]
		if not data then --print('not data 1')
			data = { total=0, fav=0 }
			save_clips[k] = data
		end
		--print('data '..data.total..' '..data.fav)
		if data.total ~= v.total or data.fav ~= v.fav then -- print('not equal') --something is changed
			MoveClips(k, data, v)
			cache[k] = true
		end
	end
	for k,v in pairs(save_clips) do
		if not cache[k] then
			if not new_clips[k] then
				MoveClips(k, v, { total=0, fav=0 })
			else
				--print('updated '..
				--MoveClips(k, v, new_clips[k])
			end
		end
	end
	save_clips = new_clips
	if is_memory_changed then --save to player
		local data = player:getModData()
		data.AlwaysFavorite = memory
		--print('Memory Changed:')
		--print_r(memory)
	end
end


local old_ISInventoryPane_update = ISInventoryPane.update
local update_cnt = 0
ISInventoryPane.update = function(...)
	if update_cnt < 11 then --20 is every second on normal settings
		update_cnt = update_cnt + 1
	else
		update_cnt = 0
		onUpdateInventory()
	end
	return old_ISInventoryPane_update(...)
end













