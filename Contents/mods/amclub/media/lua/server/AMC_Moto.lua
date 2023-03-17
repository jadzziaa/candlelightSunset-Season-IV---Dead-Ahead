
AMC_Moto = {}
AMC_Moto.CheckEngine = {}
AMC_Moto.CheckOperate = {}
AMC_Moto.ContainerAccess = {}
AMC_Moto.Create = {}
AMC_Moto.Init = {}
AMC_Moto.InstallComplete = {}
AMC_Moto.InstallTest = {}
AMC_Moto.UninstallComplete = {}
AMC_Moto.UninstallTest = {}
AMC_Moto.Update = {}
AMC_Moto.Use = {}

function AMC_Moto.Create.SeatFrontRight(vehicle, part)
	local driverSeat = vehicle:getPartById("SeatFrontLeft")
	if driverSeat and driverSeat:getInventoryItem() then
		local item = VehicleUtils.createPartInventoryItem(part);
		part:setCondition(driverSeat:getCondition())
	else
		part:setInventoryItem(nil)
	end
end

function AMC_Moto.Init.SeatFrontRight(vehicle, part)
	local driverSeat = vehicle:getPartById("SeatFrontLeft")
	if driverSeat and driverSeat:getInventoryItem() then
		local item = VehicleUtils.createPartInventoryItem(part);
		part:setCondition(driverSeat:getCondition())
	else
		part:setInventoryItem(nil)
	end
end

function AMC_Moto.Update.SeatFrontRight(vehicle, part, elapsedMinutes)
	local driverSeat = vehicle:getPartById("SeatFrontLeft")
	if driverSeat and driverSeat:getInventoryItem() then
		local item = VehicleUtils.createPartInventoryItem(part);
		part:setCondition(driverSeat:getCondition())
	else
		part:setInventoryItem(nil)
	end
end
