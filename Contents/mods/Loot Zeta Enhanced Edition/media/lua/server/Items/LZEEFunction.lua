require "Items/LZEETable"

LZFunc = {};
function LZFunc.LootZetaAddItemTable(tab, item, chance, count, modname)
	if LZTable then
		local Debug = false;
		if isDebugEnabled() then
			Debug = true;
		end
		--local strtab = tostring(tab);
		if LZTable[tab] then
			--nothing
		else 
			LZTable[tab] = {};
		end
		table.insert(LZTable[tab], {item,chance,count});
		if Debug then
			print( "<" .. modname .."> Item: " .. tostring(item) .. " Agregado a Indumentaria: " .. tab .. ". Chance: " .. tostring(chance) .. ".");
		end
	end
end