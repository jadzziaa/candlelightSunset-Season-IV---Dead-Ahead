function eris_nvg_WashClothing_TestIsValid (sourceItem, result)
	if instanceof(sourceItem, "Clothing") then
		return sourceItem:isDirty() or sourceItem:isBloody();
	else
		return true;
	end
end

function eris_nvg_WashClothing_OnCreate(items, result, player, selectedItem)
	for i=0,items:size() - 1 do
		if instanceof (items:get(i), "Clothing") then
			items:get(i):setDirtyness(0);
			items:get(i):setBloodLevel(0);
			return;
		end
	end
end