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
local InitTire = Vehicles.Init.Tire
local incomplete = false
local incomplete_setted = false
local doors = 0
local windows = 0
local door_list = {"DoorFrontLeft", "DoorFrontRight", "DoorMiddleLeft", "DoorMiddleRight", "DoorRearLeft", "DoorRearRight"}
local window_list = {"WindowFrontLeft", "WindowFrontRight", "WindowMiddleLeft", "WindowMiddleRight", "WindowRearLeft", "WindowRearRight"}
local tire_list = {"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"}
local susp_list = {"SuspensionFrontLeft", "SuspensionFrontRight", "SuspensionRearLeft", "SuspensionRearRight"}
local brake_list = {"BrakeFrontLeft", "BrakeFrontRight", "BrakeRearLeft", "BrakeRearRight"}
local condition_destroyed = false
local destroyed_setted = false
local destroyed_prob = 0
local no_trunkdoor = false
local missingparts_prob = 0
local missingparts_random = false
local incomplete_prob = 0
local probs_setted = false

function ReduceCondition(v, p)
	if p and condition_destroyed then
		p:setCondition(math.min(ZombRand(10, 40), p:getCondition()))
		if p:getId() == "TruckBed" or p:getId() == "TrailerTrunk" then
			p:doInventoryItemStats(p:getInventoryItem(), p:getMechanicSkillInstaller())
			v:transmitPartCondition(p)
		end
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

function CheckTires(vehicle, list)
	for i, k in ipairs(list) do
		local part = vehicle:getPartById(k)
		if part then
			if not vehicle:getPartById(k):getInventoryItem() then
				vehicle:getPartById(tire_list[i]):setInventoryItem(nil)
			end
		end
	end
end

--[[function IsConditionExtremelyLow()
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
end]]

function IsConditionExtremelyLow()
	return ZombRand(destroyed_prob) == 0
end

function SetDestroyedProb()
	if SandboxVars.VehicleConditionExtremelyLow == 2 then
		destroyed_prob = 7
	else
		if SandboxVars.VehicleConditionExtremelyLow == 3 then
			destroyed_prob = 5
		else
			if SandboxVars.VehicleConditionExtremelyLow == 4 then
				destroyed_prob = 2
			else
				if SandboxVars.VehicleConditionExtremelyLow == 5 then
					destroyed_prob = 0
				end	
			end
		end
	end
end

function SetDestroyed()
	if not destroyed_setted and SandboxVars.VehicleConditionExtremelyLow ~= 1 then
		condition_destroyed = IsConditionExtremelyLow()
		destroyed_setted = true
		--print("DESTRUIDO?", condition_destroyed)
	end
end

function SetIncomplete()
	if not probs_setted and SandboxVars.VehicleMayBeIncomplete then
		SetIncompleteProb()
		SetPartsMissingProb()
		if SandboxVars.VehicleConditionExtremelyLow > 1 and SandboxVars.VehicleConditionExtremelyLow < 6 then
			SetDestroyedProb()
		end
		probs_setted = true
	end
	if not incomplete_setted and SandboxVars.VehicleMayBeIncomplete then
		incomplete = IsIncomplete()
		incomplete_setted = true
	end
end

--[[function IsIncomplete()
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
end]]

function IsIncomplete()
	return ZombRand(incomplete_prob) == 0
end

function SetIncompleteProb()
	if SandboxVars.VehicleIncompleteProb == 1 then
		incomplete_prob = 10
	else
		if SandboxVars.VehicleIncompleteProb == 2 then
			incomplete_prob = 5
		else
			if SandboxVars.VehicleIncompleteProb == 3 then
				incomplete_prob = 2
			else
				if SandboxVars.VehicleIncompleteProb == 4 then
					incomplete_prob = 0
				end
			end
		end
	end
end

function SetPartsMissingProb()
	if SandboxVars.VehicleMissingPartsQuantity == 1 then
		missingparts_prob = 8
	else
		if SandboxVars.VehicleMissingPartsQuantity == 2 then
			missingparts_prob = 6
		else
			if SandboxVars.VehicleMissingPartsQuantity == 3 then
				missingparts_prob = 3
			else
				if SandboxVars.VehicleMissingPartsQuantity == 4 then
					missingparts_random = true
				end
			end
		end
	end
end

function PartsMissing(value)
	if ZombRand(value) == 0 and not missingparts_random then
		return true
	else
		if missingparts_random and (ZombRand(ZombRand(5) + 3) == 0) then
			return true
		else
			return false
		end
	end
end

--[[function PartsMissing(value)
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
end]]

function Vehicles.Create.Battery(vehicle, part)
	--print(part:getId())
	--print(vehicle:getId())
	SetIncomplete()
	SetDestroyed()
	if incomplete and PartsMissing(missingparts_prob) then
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
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.GasTank(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	if incomplete and PartsMissing(missingparts_prob) then
		return false
	end
	CreateGasTank(vehicle, part)
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.Engine(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	CreateEngine(vehicle, part)
	if incomplete and PartsMissing(missingparts_prob) then
		--print("FALTA MOTOR")
		part:setCondition(0)
		return
	end
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.Headlight(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	if incomplete and PartsMissing(missingparts_prob) then
		return false
	end
	CreateHeadlight(vehicle, part)
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.Brake(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	if incomplete and PartsMissing(missingparts_prob) then
		return false
	end
	CreateBrake(vehicle, part)
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.TrunkDoor(vehicle, part)
	--condition_destroyed = SandboxVars.VehicleConditionExtremelyLow == 1
	SetIncomplete()
	SetDestroyed()
	CreateTrunkDoor(vehicle, part)
	ReduceCondition(vehicle, part)
	if incomplete and PartsMissing(missingparts_prob) then
		--print("FALTA TAPA MALETERO")
		no_trunkdoor = true
		vehicle:getPartById("WindshieldRear"):setInventoryItem(nil)
		part:setInventoryItem(nil)
	end
end


function Vehicles.Create.Radio(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	CreateRadio(vehicle, part)
	if incomplete and PartsMissing(missingparts_prob) then
		part:setInventoryItem(nil)
	end
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.Radio_HAM(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	CreateRadioHAM(vehicle, part)
	if incomplete and PartsMissing(missingparts_prob) then
		part:setInventoryItem(nil)
	end
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.Default(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	--[[if getActivatedMods():contains("SCKCO") and part:getId() == "SeatFrontLeft" then
		condition_destroyed = IsConditionExtremelyLow()
		incomplete = IsIncomplete()
	end]]
	if part:getId() == "WindshieldRear" and no_trunkdoor then
		return false
	end
	if incomplete and PartsMissing(missingparts_prob) and (part:getId() ~= "TruckBed" and part:getId() ~= "GloveBox") then
		return false
	end
	CreateDefault(vehicle, part)
	ReduceCondition(vehicle, part)
	if (part:getId() == "TruckBed" or part:getId() == "GloveBox") and incomplete and PartsMissing(missingparts_prob) then
		--print(part:getId(), "MAL ESTADO")
		part:setCondition(ZombRand(3, 15))
		part:doInventoryItemStats(part:getInventoryItem(), part:getMechanicSkillInstaller())
		vehicle:transmitPartCondition(part)
	end
end

function Vehicles.Create.Tire(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	--[[if incomplete and PartsMissing(SandboxVars.VehicleMissingPartsQuantity) then
		return false
	end]]
	CreateTire(vehicle, part)
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.Door(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	doors = doors + 1
	if incomplete and PartsMissing(missingparts_prob) then
		if windows > 0 then
			local current_window = GetWindow(part)
			if vehicle:getPartById(current_window):getInventoryItem() ~= nil then
				vehicle:getPartById(current_window):setInventoryItem(nil)
			end
		end
		return false
	end
	CreateDoor(vehicle, part)
	ReduceCondition(vehicle, part)
end

function Vehicles.Create.Window(vehicle, part)
	--print(part:getId())
	SetIncomplete()
	SetDestroyed()
	windows = windows + 1
	local current_door = GetDoor(part)
	--if vehicle:getPartById(current_door) then
	if current_door then
		if doors > 0 and vehicle:getPartById(current_door):getInventoryItem() == nil then
			return false
		end
	end
	if incomplete and PartsMissing(missingparts_prob) then
		return false
	end
	CreateWindow(vehicle, part)
	ReduceCondition(vehicle, part)
end
	
function Vehicles.Init.Window(vehicle, part)
	if incomplete and PartsMissing(missingparts_prob) and vehicle:getHeater():getCondition() > 0 then
		vehicle:getHeater():setCondition(0)
	end
	ReduceCondition(vehicle, vehicle:getPartById("lightbar"))
	ReduceCondition(vehicle, vehicle:getHeater())
	windows = 0
	incomplete_setted = false
	destroyed_setted = false
	despawn_setted = false
	vehicle_despawned = false
	InitWindow(vehicle, part)
end

function Vehicles.Init.Door(vehicle, part)
	doors = 0
	no_trunkdoor = false
	InitDoor(vehicle, part)
end

function Vehicles.Init.Tire(vehicle, part)
	--print(part:getId())
	--print(vehicle:getVehicleType())
	CheckTires(vehicle, susp_list)
	CheckTires(vehicle, brake_list)
	InitTire(vehicle, part)
end