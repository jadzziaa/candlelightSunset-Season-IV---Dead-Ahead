ZNL50 = ZNL50 or {}
ZNL50.ContainerAccess = {}

function ZNL50.ContainerAccess.storageFront(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function ZNL50.ContainerAccess.storageBox(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	local trunkDoor = vehicle:getPartById("TrunkDoor")
	if trunkDoor and trunkDoor:getDoor() then
		if not trunkDoor:getInventoryItem() then return true end
		if not trunkDoor:getDoor():isOpen() then return false end
	end
	return true
end