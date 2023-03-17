--[[*]]-- Generated automagically by RotatorsLib --[[*]]--

require "Vehicles/ISUI/ISCarMechanicsOverlay"

local function RotatorsSemiTruckLiteMechanicsOverlay()
	for _,name in ipairs({ "Battery", "BrakeFrontLeft", "BrakeFrontRight", "BrakeRearLeft", "BrakeRearRight", "DoorFrontLeft", "DoorFrontRight", "Engine", "EngineDoor", "GasTank", "HeadlightLeft", "HeadlightRight", "Muffler", "SuspensionFrontLeft", "SuspensionFrontRight", "SuspensionRearLeft", "SuspensionRearRight", "TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight", "WindowFrontLeft", "WindowFrontRight", "Windshield" }) do
		ISCarMechanicsOverlay.PartList[name] = ISCarMechanicsOverlay.PartList[name] or {}
		ISCarMechanicsOverlay.PartList[name].vehicles = ISCarMechanicsOverlay.PartList[name].vehicles or {}
	end

	ISCarMechanicsOverlay.CarList["Rotators.SemiTruckLite"] = { imgPrefix = "rSemiTruckLite_", x = 10, y = 0 }

	ISCarMechanicsOverlay.PartList.Battery.vehicles.rSemiTruckLite_ = { x = 15, y = 237, x2 = 58, y2 = 269 }
	ISCarMechanicsOverlay.PartList.BrakeFrontLeft.vehicles.rSemiTruckLite_ = { x = 14, y = 170, x2 = 55, y2 = 208 }
	ISCarMechanicsOverlay.PartList.BrakeFrontRight.vehicles.rSemiTruckLite_ = { x = 228, y = 170, x2 = 268, y2 = 208 }
	ISCarMechanicsOverlay.PartList.BrakeRearLeft.vehicles.rSemiTruckLite_ = { x = 14, y = 450, x2 = 55, y2 = 488 }
	ISCarMechanicsOverlay.PartList.BrakeRearRight.vehicles.rSemiTruckLite_ = { x = 228, y = 520, x2 = 268, y2 = 560 }
	ISCarMechanicsOverlay.PartList.DoorFrontLeft.vehicles.rSemiTruckLite_ = { x = 0, y = 0, x2 = 0, y2 = 0 }
	ISCarMechanicsOverlay.PartList.DoorFrontRight.vehicles.rSemiTruckLite_ = { x = 0, y = 0, x2 = 0, y2 = 0 }
	ISCarMechanicsOverlay.PartList.Engine.vehicles.rSemiTruckLite_ = { x = 15, y = 36, x2 = 114, y2 = 96 }
	ISCarMechanicsOverlay.PartList.EngineDoor.vehicles.rSemiTruckLite_ = { x = 107, y = 122, x2 = 175, y2 = 208 }
	ISCarMechanicsOverlay.PartList.GasTank.vehicles.rSemiTruckLite_ = { x = 182, y = 36, x2 = 267, y2 = 90 }
	ISCarMechanicsOverlay.PartList.HeadlightLeft.vehicles.rSemiTruckLite_ = { x = 82, y = 123, x2 = 103, y2 = 144 }
	ISCarMechanicsOverlay.PartList.HeadlightRight.vehicles.rSemiTruckLite_ = { x = 179, y = 123, x2 = 200, y2 = 144 }
	ISCarMechanicsOverlay.PartList.Muffler.vehicles.rSemiTruckLite_ = { x = 232, y = 265, x2 = 268, y2 = 334 }
	ISCarMechanicsOverlay.PartList.SuspensionFrontLeft.vehicles.rSemiTruckLite_ = { x = 14, y = 132, x2 = 55, y2 = 170 }
	ISCarMechanicsOverlay.PartList.SuspensionFrontRight.vehicles.rSemiTruckLite_ = { x = 228, y = 132, x2 = 268, y2 = 170 }
	ISCarMechanicsOverlay.PartList.SuspensionRearLeft.vehicles.rSemiTruckLite_ = { x = 14, y = 412, x2 = 55, y2 = 450 }
	ISCarMechanicsOverlay.PartList.SuspensionRearRight.vehicles.rSemiTruckLite_ = { x = 228, y = 483, x2 = 268, y2 = 520 }
	ISCarMechanicsOverlay.PartList.TireFrontLeft.vehicles.rSemiTruckLite_ = { x = 70, y = 128, x2 = 80, y2 = 200 }
	ISCarMechanicsOverlay.PartList.TireFrontRight.vehicles.rSemiTruckLite_ = { x = 200, y = 128, x2 = 215, y2 = 200 }
	ISCarMechanicsOverlay.PartList.TireRearLeft.vehicles.rSemiTruckLite_ = { x = 68, y = 415, x2 = 213, y2 = 485 }
	ISCarMechanicsOverlay.PartList.TireRearRight.vehicles.rSemiTruckLite_ = { x = 68, y = 485, x2 = 213, y2 = 555 }
	ISCarMechanicsOverlay.PartList.WindowFrontLeft.vehicles.rSemiTruckLite_ = { x = 90, y = 235, x2 = 98, y2 = 275 }
	ISCarMechanicsOverlay.PartList.WindowFrontRight.vehicles.rSemiTruckLite_ = { x = 183, y = 235, x2 = 190, y2 = 275 }
	ISCarMechanicsOverlay.PartList.Windshield.vehicles.rSemiTruckLite_ = { x = 96, y = 228, x2 = 185, y2 = 235 }
end

Events.OnInitWorld.Add(RotatorsSemiTruckLiteMechanicsOverlay)
