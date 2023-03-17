SS100 = SS100 or {}
SS100.ContainerAccess = {}

function SS100.ContainerAccess.TrunkBox(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local trunkDoor = vehicle:getPartById("TrunkDoor")
	if trunkDoor and trunkDoor:getDoor() then
		if not trunkDoor:getInventoryItem() then return true end
		if not trunkDoor:getDoor():isOpen() then return false end
	end
	return true
end

function SS100.ContainerAccess.TrunkBoxLeft(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local trunkDoor = vehicle:getPartById("TrunkDoorLeft")
	if trunkDoor and trunkDoor:getDoor() then
		if not trunkDoor:getInventoryItem() then return true end
		if not trunkDoor:getDoor():isOpen() then return false end
	end
	return true
end

function SS100.ContainerAccess.TrunkBoxRight(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local trunkDoor = vehicle:getPartById("TrunkDoorRight")
	if trunkDoor and trunkDoor:getDoor() then
		if not trunkDoor:getInventoryItem() then return true end
		if not trunkDoor:getDoor():isOpen() then return false end
	end
	return true
end