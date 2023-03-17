require "Vehicles/VehicleDistributions"
local distributionTable = VehicleDistributions[1]


VehicleDistributions.SemiTruckTrunk = {
   rolls = 2,
   items ={
      "Hammer", 1,
      "LugWrench", 1,
      "Extinguisher", 2,
      "Jack", 1,
      "WaterBottleEmpty", 2,
      "PetrolCan", 2,
      "BlowTorch", 2,
      "EngineParts", 2,
      "PopBottle", 3,
      "Pickles", 2,
      "Teabag2", 2,
      "RotatorsClothing.Hat_BaseballCapRotators", 3,
   },
   junk = {
      rolls = 1,
      items = {
         "PopBottleEmpty", 1,
         "PopEmpty", 1,
         "WaterBottleEmpty", 1,
         "WhiskeyEmpty", 1,
      }
   }
}

VehicleDistributions.TrailerVanToolbox = {
   rolls = 3,
   items ={
      "Hammer", 2,
      "Wrench", 5,
      "LugWrench", 2,
      "PipeWrench", 1,
      "TirePump", 1,
      "BlowTorch", 3,
      "RotatorsClothing.Hat_BaseballCapRotators", 1,
      "Base.EmptyPetrolCan", 1,
      "Jack", 2,
      "Screwdriver", 3,
      "CarBattery2", 1,
      "FirstAidKit", 2,
      "DuctTape", 3,
      "Twine", 3,
      "Tarp", 3,
      "LeadPipe", 1,
      "MetalPipe", 1,
   },
   junk = {
      rolls = 1,
      items = {
         "PopBottleEmpty", 4,
         "PopEmpty", 4,
         "WaterBottleEmpty", 4,
         "WhiskeyEmpty", 1,
      }
   }
}

VehicleDistributions.SemiTruckInventory = {
   TruckBed = VehicleDistributions.SemiTruckTrunk;
   TrunkLeft = VehicleDistributions.SemiTruckTrunk;
   GloveBox = VehicleDistributions.GloveBox;
   SeatMiddleLeft = VehicleDistributions.Seat;
}

VehicleDistributions.SemiTruckBoxInventory = {
   TruckBed = VehicleDistributions.TrunkHeavy;

   TruckBedOpen = VehicleDistributions.TrunkHeavy;

   TrailerTrunk = VehicleDistributions.TrunkHeavy;

   GloveBox = VehicleDistributions.GloveBox;
}

VehicleDistributions.TrailerVanInventory = {
   TruckBed = VehicleDistributions.TrunkStandard;
   TrunkToolbox = VehicleDistributions.TrailerVanToolbox;
}

VehicleDistributions.TrailerCisternInventory = {
   TruckBed = VehicleDistributions.TrailerVanToolbox;
}

--[[
VehicleDistributions.TrailerVanFridgeInventory = {
   TruckBed = VehicleDistributions.GroceriesTruckBed;
   TrunkToolbox = VehicleDistributions.TrailerVanToolbox;
}
--]]

distributionTable["SemiTruck"] = { Normal = VehicleDistributions.SemiTruckInventory; }
distributionTable["SemiTruckBox"] = { Normal = VehicleDistributions.SemiTruckBoxInventory; }
distributionTable["SemiTruckLite"] = { Normal = VehicleDistributions.SemiTruckInventory; }
distributionTable["SemiTrailerVan"] = { Normal = VehicleDistributions.TrailerVanInventory; }
distributionTable["SemiTrailerCistern"] = { Normal = VehicleDistributions.TrailerCisternInventory; }
--distributionTable["SemiTrailerFridge"] = { Normal = VehicleDistributions.TrailerVanFridgeInventory; }




