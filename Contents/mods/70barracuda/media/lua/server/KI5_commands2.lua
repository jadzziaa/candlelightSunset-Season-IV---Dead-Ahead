--***********************************************************
--**                         KI5                           **
--***********************************************************

KI5 = KI5 or {};
KI5.Create = {};
KI5.InstallTest = {};
KI5.UninstallTest = {};

function KI5.Create.Blank(vehicle, part)
	part:setInventoryItem(nil)
end

function KI5.InstallTest.Default(vehicle, part, chr)
	if ISVehicleMechanics.cheat then return true; end
	local keyvalues = part:getTable("install")
	if not keyvalues then return false end
	if part:getInventoryItem() then return false end
	if not part:getItemType() or part:getItemType():isEmpty() then return false end
	local typeToItem = VehicleUtils.getItems(chr:getPlayerNum())
	if keyvalues.requireInstalled then
		local split = keyvalues.requireInstalled:split(";");
		for i,v in ipairs(split) do
			if not vehicle:getPartById(v) or not vehicle:getPartById(v):getInventoryItem() then return false; end
		end
	end
	if keyvalues.requireUninstalled then
        local split = keyvalues.requireUninstalled:split(";");
        for i,v in ipairs(split) do
            if vehicle:getPartById(v) and vehicle:getPartById(v):getInventoryItem() then return false; end
        end
    end
	if not VehicleUtils.testProfession(chr, keyvalues.professions) then return false end
	if not VehicleUtils.testRecipes(chr, keyvalues.recipes) then return false end
	if not VehicleUtils.testTraits(chr, keyvalues.traits) then return false end
	if not VehicleUtils.testItems(chr, keyvalues.items, typeToItem) then return false end
	if VehicleUtils.RequiredKeyNotFound(part, chr) then
		return false;
	end
	return true
end

function KI5.UninstallTest.Default(vehicle, part, chr)
	if ISVehicleMechanics.cheat then return true; end
	local keyvalues = part:getTable("uninstall")
	if not keyvalues then return false end
	if not part:getInventoryItem() then return false end
	if not part:getItemType() or part:getItemType():isEmpty() then return false end
	local typeToItem = VehicleUtils.getItems(chr:getPlayerNum())
	if keyvalues.requireUninstalled then
        local split = keyvalues.requireUninstalled:split(";");
        for i,v in ipairs(split) do
            if vehicle:getPartById(v) and vehicle:getPartById(v):getInventoryItem() then return false; end
        end
    end
	if not VehicleUtils.testProfession(chr, keyvalues.professions) then return false end
	if not VehicleUtils.testRecipes(chr, keyvalues.recipes) then return false end
	if not VehicleUtils.testTraits(chr, keyvalues.traits) then return false end
	if not VehicleUtils.testItems(chr, keyvalues.items, typeToItem) then return false end
	if keyvalues.requireEmpty and round(part:getContainerContentAmount(), 3) > 0 then return false end
	local seatNumber = part:getContainerSeatNumber()
	local seatOccupied = (seatNumber ~= -1) and vehicle:isSeatOccupied(seatNumber)
	if keyvalues.requireEmpty and seatOccupied then return false end
	if VehicleUtils.RequiredKeyNotFound(part, chr) then
		return false
	end
	return true
end

