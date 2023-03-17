--[[*]]-- Generated automagically by RotatorsLib --[[*]]--

require "Vehicles/ISUI/ISCarMechanicsOverlay"

local function RotatorsSemiTruckBoxMechanicsOverlay()
	for _,name in ipairs({ "Battery", "BrakeFrontLeft", "BrakeFrontRight", "BrakeRearLeft", "BrakeRearRight", "DoorFrontLeft", "DoorFrontRight", "Engine", "EngineDoor", "GasTank", "HeadlightLeft", "HeadlightRight", "Muffler", "SuspensionFrontLeft", "SuspensionFrontRight", "SuspensionRearLeft", "SuspensionRearRight", "TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight", "TruckBed", "WindowFrontLeft", "WindowFrontRight", "Windshield" }) do
		ISCarMechanicsOverlay.PartList[name] = ISCarMechanicsOverlay.PartList[name] or {}
		ISCarMechanicsOverlay.PartList[name].vehicles = ISCarMechanicsOverlay.PartList[name].vehicles or {}
	end

	ISCarMechanicsOverlay.CarList["Rotators.SemiTruckBox"] = { imgPrefix = "rSemiTruckBox_", x = 10, y = 0, PartList = {} }
	ISCarMechanicsOverlay.CarList["Rotators.SemiTruckBox"].PartList.DoorRear = { img = "door_rear_left" }

	ISCarMechanicsOverlay.PartList.Battery.vehicles.rSemiTruckBox_ = { x = 15, y = 231, x2 = 58, y2 = 263 }
	ISCarMechanicsOverlay.PartList.BrakeFrontLeft.vehicles.rSemiTruckBox_ = { x = 14, y = 170, x2 = 55, y2 = 208 }
	ISCarMechanicsOverlay.PartList.BrakeFrontRight.vehicles.rSemiTruckBox_ = { x = 228, y = 170, x2 = 268, y2 = 208 }
	ISCarMechanicsOverlay.PartList.BrakeRearLeft.vehicles.rSemiTruckBox_ = { x = 14, y = 450, x2 = 55, y2 = 488 }
	ISCarMechanicsOverlay.PartList.BrakeRearRight.vehicles.rSemiTruckBox_ = { x = 228, y = 520, x2 = 268, y2 = 560 }
	ISCarMechanicsOverlay.PartList.DoorFrontLeft.vehicles.rSemiTruckBox_ = { x = 0, y = 0, x2 = 0, y2 = 0 }
	ISCarMechanicsOverlay.PartList.DoorFrontRight.vehicles.rSemiTruckBox_ = { x = 0, y = 0, x2 = 0, y2 = 0 }
	ISCarMechanicsOverlay.PartList.Engine.vehicles.rSemiTruckBox_ = { x = 15, y = 36, x2 = 114, y2 = 96 }
	ISCarMechanicsOverlay.PartList.EngineDoor.vehicles.rSemiTruckBox_ = { x = 107, y = 119, x2 = 175, y2 = 208 }
	ISCarMechanicsOverlay.PartList.GasTank.vehicles.rSemiTruckBox_ = { x = 182, y = 36, x2 = 267, y2 = 90 }
	ISCarMechanicsOverlay.PartList.HeadlightLeft.vehicles.rSemiTruckBox_ = { x = 86, y = 124, x2 = 106, y2 = 144 }
	ISCarMechanicsOverlay.PartList.HeadlightRight.vehicles.rSemiTruckBox_ = { x = 177, y = 124, x2 = 197, y2 = 144 }
	ISCarMechanicsOverlay.PartList.Muffler.vehicles.rSemiTruckBox_ = { x = 233, y = 266, x2 = 268, y2 = 333 }
	ISCarMechanicsOverlay.PartList.SuspensionFrontLeft.vehicles.rSemiTruckBox_ = { x = 14, y = 132, x2 = 55, y2 = 170 }
	ISCarMechanicsOverlay.PartList.SuspensionFrontRight.vehicles.rSemiTruckBox_ = { x = 228, y = 132, x2 = 268, y2 = 170 }
	ISCarMechanicsOverlay.PartList.SuspensionRearLeft.vehicles.rSemiTruckBox_ = { x = 14, y = 412, x2 = 55, y2 = 450 }
	ISCarMechanicsOverlay.PartList.SuspensionRearRight.vehicles.rSemiTruckBox_ = { x = 228, y = 483, x2 = 268, y2 = 520 }
	ISCarMechanicsOverlay.PartList.TireFrontLeft.vehicles.rSemiTruckBox_ = { x = 74, y = 128, x2 = 85, y2 = 194 }
	ISCarMechanicsOverlay.PartList.TireFrontRight.vehicles.rSemiTruckBox_ = { x = 199, y = 128, x2 = 210, y2 = 194 }
	ISCarMechanicsOverlay.PartList.TireRearLeft.vehicles.rSemiTruckBox_ = { x = 76, y = 405, x2 = 205, y2 = 464 }
	ISCarMechanicsOverlay.PartList.TireRearRight.vehicles.rSemiTruckBox_ = { x = 76, y = 471, x2 = 205, y2 = 530 }
	ISCarMechanicsOverlay.PartList.TruckBed.vehicles.rSemiTruckBox_ = { x = 81, y = 286, x2 = 202, y2 = 578 }
	ISCarMechanicsOverlay.PartList.WindowFrontLeft.vehicles.rSemiTruckBox_ = { x = 90, y = 235, x2 = 98, y2 = 275 }
	ISCarMechanicsOverlay.PartList.WindowFrontRight.vehicles.rSemiTruckBox_ = { x = 183, y = 235, x2 = 190, y2 = 275 }
	ISCarMechanicsOverlay.PartList.Windshield.vehicles.rSemiTruckBox_ = { x = 100, y = 224, x2 = 185, y2 = 230 }
end

Events.OnInitWorld.Add(RotatorsSemiTruckBoxMechanicsOverlay)
