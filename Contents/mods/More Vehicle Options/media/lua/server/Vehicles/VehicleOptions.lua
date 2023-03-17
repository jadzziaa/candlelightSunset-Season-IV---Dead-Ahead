require "Vehicle/Vehicles"

local CreateBattery = Vehicles.Create.Battery
local CreateGasTank = Vehicles.Create.GasTank
local CreateEngine = Vehicles.Create.Engine
local CreateHeadlight = Vehicles.Create.Headlight
local CreateBrake = Vehicles.Create.Brake
local CreateDoor = Vehicles.Create.Door
local CreateTrunkDoor = Vehicles.Create.TrunkDoor
local CreateRadio = Vehicles.Create.Radio
local CreateRadioHAM = Vehicles.Create.Radio_HAM
local CreateDefault = Vehicles.Create.Default
local CreateTire = Vehicles.Create.Tire
local CreateWindow = Vehicles.Create.Window
local InitDoor = Vehicles.Init.Door
local InitWindow = Vehicles.Init.Window
local incomplete = false
local doors = 0
local windows = 0
local door_list = {"DoorFrontLeft", "DoorFrontRight", "DoorMiddleLeft", "DoorMiddleRight", "DoorRearLeft", "DoorRearRight"}
local window_list = {"WindowFrontLeft", "WindowFrontRight", "WindowMiddleLeft", "WindowMiddleRight", "WindowRearLeft", "WindowRearRight"}
local condition_destroyed = false

function ReduceCondition(p)
	if p and condition_destroyed then
		p:setCondition(math.min(ZombRand(10, 40), p:getCondition()))
	end
end

function GetWindow(part)
	for i, k in ipairs(door_list) do
		if part:getId() == k then
			return window_list[i]
		end
	end
	return false
end

function GetDoor(part)
	for i, k in ipairs(window_list) do
		if part:getId() == k then
			return door_list[i]
		end
	end
	return false
end

function IsConditionExtremelyLow()
	if SandboxVars.VehicleConditionExtremelyLow == 1 then
		return false
	else
		if SandboxVars.VehicleConditionExtremelyLow == 2 and ZombRand(7) == 0 then
			return true
		else
			if SandboxVars.VehicleConditionExtremelyLow == 3 and ZombRand(5) == 0 then
				return true
			else
				if SandboxVars.VehicleConditionExtremelyLow == 4 and ZombRand(2) == 0 then
					return true
				else
					if SandboxVars.VehicleConditionExtremelyLow == 5 then
						return true
					end
				end
			end
		end
	end
end

function IsIncomplete()
	local b
	if SandboxVars.VehicleMayBeIncomplete then
		if SandboxVars.VehicleIncompleteProb == 1 then
			b = (ZombRand(10) == 0)
		else
			if SandboxVars.VehicleIncompleteProb == 2 then
				b = (ZombRand(5) == 0)
			else
				if SandboxVars.VehicleIncompleteProb == 3 then
					b = (ZombRand(2) == 0)
				else
					if SandboxVars.VehicleIncompleteProb == 4 then
						b = true
					end
				end
			end
		end
	end
	return b
end

function PartsMissing(value)
	if (value == 1) and (ZombRand(8) == 0) then
		return true
	else
		if (value == 2) and (ZombRand(6) == 0) then
			return true
		else
			if (value == 3) and (ZombRand(3) == 0) then
				return true
			else
				if (value == 4) and (ZombRand(ZombRand(5) + 3) == 0) then
					return true
				else
					return false
				end
			end
		end
	end
end

function Vehicles.Create.Battery(vehicle, part)
	--print(part:getId())
	--print(vehicle:getId())
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateBattery(vehicle, part)
	local item = VehicleUtils.createPartInventoryItem(part)
	if (SandboxVars.TimeSinceApo == 13) and (not vehicle:isGoodCar()) and (SandboxVars.VehicleBatteryChance ~= 1) then
		if SandboxVars.VehicleBatteryChance == 2 and ZombRand(30) == 0 then
			item:setUsedDelta(ZombRandFloat(0.15,0.5))
		else
			if SandboxVars.VehicleBatteryChance == 3 and ZombRand(20) == 0 then
				item:setUsedDelta(ZombRandFloat(0.15,0.5))
			else
				if SandboxVars.VehicleBatteryChance == 4 and ZombRand(12) == 0 then
					item:setUsedDelta(ZombRandFloat(0.15,0.5))
				else
					if SandboxVars.VehicleBatteryChance == 5 and ZombRand(6) == 0 then
						item:setUsedDelta(ZombRandFloat(0.15,0.5))
					else
						if SandboxVars.VehicleBatteryChance == 6 and ZombRand(3) == 0 then
							item:setUsedDelta(ZombRandFloat(0.15,0.5))
						end
					end
				end
			end
		end
	end
	ReduceCondition(part)
end

function Vehicles.Create.GasTank(vehicle, part)
	--print(part:getId())
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateGasTank(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.Engine(vehicle, part)
	--print(part:getId())
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateEngine(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.Headlight(vehicle, part)
	--print(part:getId())
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateHeadlight(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.Brake(vehicle, part)
	--print(part:getId())
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateBrake(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.TrunkDoor(vehicle, part)
	--print(part:getId())
	--condition_destroyed = SandboxVars.VehicleConditionExtremelyLow == 1
	if not getActivatedMods():contains("SCKCO") then
		condition_destroyed = IsConditionExtremelyLow()
		incomplete = IsIncomplete()
	end
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		vehicle:getPartById("WindshieldRear"):setInventoryItem(nil)
		return false
	end
	CreateTrunkDoor(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.Radio(vehicle, part)
	--print(part:getId())
	CreateRadio(vehicle, part)
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		part:setInventoryItem(nil)
	end
	ReduceCondition(part)
end

function Vehicles.Create.Radio_HAM(vehicle, part)
	--print(part:getId())
	CreateRadioHAM(vehicle, part)
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		part:setInventoryItem(nil)
	end
	ReduceCondition(part)
end

function Vehicles.Create.Default(vehicle, part)
	--print(part:getId())
	if getActivatedMods():contains("SCKCO") and part:getId() == "SeatFrontLeft" then
		condition_destroyed = IsConditionExtremelyLow()
		incomplete = IsIncomplete()
	end
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateDefault(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.Tire(vehicle, part)
	--print(part:getId())
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateTire(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.Door(vehicle, part)
	--print(part:getId())
	doors = doors + 1
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		if windows > 0 then
			local current_window = GetWindow(part)
			if vehicle:getPartById(current_window):getInventoryItem() ~= nil then
				vehicle:getPartById(current_window):setInventoryItem(nil)
			end
		end
		return false
	end
	CreateDoor(vehicle, part)
	ReduceCondition(part)
end

function Vehicles.Create.Window(vehicle, part)
	--print(part:getId())
	windows = windows + 1
	local current_door = GetDoor(part)
	if vehicle:getPartById(current_door) then
		if doors > 0 and vehicle:getPartById(current_door):getInventoryItem() == nil then
			return false
		end
	end
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end
	CreateWindow(vehicle, part)
	ReduceCondition(part)
end
	
function Vehicles.Init.Window(vehicle, part)
	if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) and vehicle:getHeater():getCondition() > 0 then
		vehicle:getHeater():setCondition(0)
	end
	ReduceCondition(vehicle:getPartById("lightbar"))
	ReduceCondition(vehicle:getHeater())
	windows = 0
	InitWindow(vehicle, part)
end

function Vehicles.Init.Door(vehicle, part)
	doors = 0
	InitDoor(vehicle, part)
end