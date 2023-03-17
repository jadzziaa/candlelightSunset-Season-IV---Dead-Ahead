VN125 = VN125 or {}
VN125.ContainerAccess = {}

function VN125.ContainerAccess.TrunkBox(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end