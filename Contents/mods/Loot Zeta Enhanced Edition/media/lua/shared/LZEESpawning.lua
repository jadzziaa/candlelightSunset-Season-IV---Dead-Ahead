function LootZetaDoSpawnTable(zombie)
	if not zombie:getOutfitName() then return false end
	local prof = tostring(zombie:getOutfitName())
	if not LZTable[prof] or LZTable[prof] == nil then return end
	if LZTable[prof] then
		local Debug = false;
		if isDebugEnabled() then
			Debug = true;
		end
		local mult = LootZetaEDoVar(zombie);
		if Debug then
			print("-- Loot Zeta Enhanced Test --")
			print("********************")
			print("Indumentaria: " .. tostring(prof))
			print("Multiplicador: " .. tostring(mult))
			print("-----------------------------")
		end
		local fmin = 0.00000;
		local fmax = 100.00001;
		for i in pairs(LZTable[prof]) do
			if LZTable[prof][i][1] ~= nil and LZTable[prof][i][2] ~= nil then
				local roll = ZombRandFloat(fmin,fmax)
				local rnumber = tonumber(string.format("%." .. (5 or 0) .. "f", roll))
				local fnumber = LootZetaEDoFinalNumber(rnumber, mult);
				if Debug then
					print("Item: " .. tostring(LZTable[prof][i][1]))
					print("Chance del Item (Tabla): " .. tostring(LZTable[prof][i][2]))
					local chanceDesc = LootZetaEDoChanceDesc(LZTable[prof][i][2], zombie);
					print("Chance Real (SandBoxVars): " .. tostring(chanceDesc))
					print("Resultado: " .. tostring(fnumber))
				end
				if fnumber <= LZTable[prof][i][2] then
					local Item = InventoryItemFactory.CreateItem(LZTable[prof][i][1])
					LootZetaDoExtraChanges(Item)
					if Item ~= nil then
						if Item:getCount() ~= nil and tonumber(Item:getCount()) > 1 and LZTable[prof][i][3] and LZTable[prof][i][3] == true then
							LootZetaAddItem(Item, zombie, true)
						else
							LootZetaAddItem(Item, zombie, false)
						end
						if Debug then
							print("Item Agregado al Zombie")
						end
					else
						print("Loot Zeta Spawn Item ERROR: Item is Null")
					end
				else
					if Debug then
						print("Item NO agregado al Zombie (Resultado mayor a chance real)")
					end
				end
				if Debug then
					print("********************")
				end
			end
		end
	end
end
function LootZetaAddItem(Item, zombie, count)
	local toContainer = nil;
	if zombie:getClothingItem_Back() and instanceof(zombie:getClothingItem_Back(), "InventoryContainer") then
		local container = zombie:getClothingItem_Back();
		print("Peso de contenido: " .. tostring(container:getContainer():getContentsWeight()) .. " +"..  tostring(Item:getWeight()) .. "(Peso del Item). Capacidad total: " .. tostring(container:getItemContainer():getCapacity()))
		if (container:getItemContainer():getContentsWeight() + Item:getWeight()) <= container:getItemContainer():getCapacity() then
			toContainer = true;
		end
	end

	if toContainer ~= nil and not count then
		zombie:getClothingItem_Back():getInventory():AddItem(Item);
		return
	end
	if toContainer ~= nil and count then
		zombie:getClothingItem_Back():getInventory():AddItems(Item, 1);
		return
	end
	if toContainer == nil and count == true then
		zombie:getInventory():AddItems(Item, 1);
		return
	end
	if toContainer == nil and not count then
		zombie:getInventory():AddItem(Item);
		return
	end
end

function LootZetaEDoChanceDesc(number, zombie)
	local value = 1;
	local extravalue = 1;
	if SandboxVars.OtherLoot == 1 then -- Bastante Raro
		value = 0.8;
	elseif SandboxVars.OtherLoot == 2 then -- Raro
		value = 1;
	elseif SandboxVars.OtherLoot == 3 then -- Normal
		value = 1.05;
	elseif SandboxVars.OtherLoot == 4 then -- Común
		value = 1.125;
	elseif SandboxVars.OtherLoot == 5 then -- Abundante
		value = 1.25;
	else
		--nothing
	end
	local backpacktext = ""
	if zombie:getClothingItem_Back() and instanceof(zombie:getClothingItem_Back(), "InventoryContainer") then
		extravalue = 1.25;
		value = value *extravalue;
		backpacktext = "*(" .. tostring(extravalue).. " por Mochila)"
	end
	local text = tostring(number*value);
	local ExText = " (" .. tostring(number) .. "*" .. tostring(value)..")"..backpacktext;
	return text .. ExText
end

function LootZetaEDoVar(zombie)
	local value = 1;
	if SandboxVars.OtherLoot == 1 then -- Bastante Raro
		value = 0.8;
	elseif SandboxVars.OtherLoot == 2 then -- Raro
		value = 1;
	elseif SandboxVars.OtherLoot == 3 then -- Normal
		value = 1.05;
	elseif SandboxVars.OtherLoot == 4 then -- Común
		value = 1.125;
	elseif SandboxVars.OtherLoot == 5 then -- Abundante
		value = 1.25;
	else
		--nothing
	end
	if zombie:getClothingItem_Back() and instanceof(zombie:getClothingItem_Back(), "InventoryContainer") then
		value = value *1.25
	end
	return value;
end

function LootZetaEDoFinalNumber(number, mult)
	local fnumber = number*mult;
	if fnumber <= 0 then
		fnumber = 0.00001;
	end
	if fnumber >= 100 then
		fnumber = 100;
	end
	return tonumber(string.format("%." .. (5 or 0) .. "f", fnumber))
end

function LootZetaDoExtraChanges(item)
	if instanceof(item, "DrainableComboItem") and item:getUsedDelta() then
		local dmax = (1/item:getUseDelta())+1;
		item:setUsedDelta(item:getUseDelta()*ZombRand(1, dmax));
	end
	if instanceof(item, "HandWeapon") and item:getCondition() then
		item:setCondition(ZombRand(1,item:getConditionMax()+1));
		--if item:getCondition() == 0 then
		--	item:setBroken(true);
		--end
	end
	if instanceof(item, "Food") then
		if item:isIsCookable() and item:getMinutesToCook() > 0 and item:getMinutesToBurn() > 0 then
			if ZombRand(2) == 0 then
				--nothing
			elseif ZombRand(2) == 0 then
				item:setCooked(true)
			else
				item:setBurnt(true)
			end
		end
		if item:getScriptItem():getDaysFresh() ~= nil and item:getScriptItem():getDaysTotallyRotten() ~= nil then
			local totaldays = item:getScriptItem():getDaysTotallyRotten();
			if totaldays < 1000 then
				local rand = ZombRand(5);
				if rand == 0 then
					item:setAge(ZombRand(totaldays, totaldays+ZombRand(1,31)))
				elseif rand <= 4 then
					item:setAge(ZombRand(0, totaldays))
				else
				end
			end
		end
	end
end

function LootZetaInit(zombie)
	LootZetaDoSpawnTable(zombie)
end


Events.OnZombieDead.Add(LootZetaInit)	