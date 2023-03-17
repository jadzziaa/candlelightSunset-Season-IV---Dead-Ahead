require 'AquaConfig'

if AquaConfig then
    AquaConfig.Boats["AMC_Waverunner"] = {}
    boat = AquaConfig.Boats["AMC_Waverunner"]
    boat.dashboard = "ISBoatDashboard"
    boat.boatSeatUI_Image = "AMC_Waverunner_base_small"
    boat.boatSeatUI_Scale = 1
    boat.multiplierFuelConsumption = 2
    boat.windInfluence = 1.1
    boat.boatSeatUI_SeatOffsetX = {
        ["FrontLeft"] = 0,
        ["FrontRight"] = 0,
        ["MiddleLeft"] = 0,
        ["MiddleRight"] = 0,
        ["RearLeft"] = 0,
        ["RearRight"] = 0,
    }
    boat.boatSeatUI_SeatOffsetY = {
        ["FrontLeft"] = 0,
        ["FrontRight"] = 0,
        ["MiddleLeft"] = 0, 
        ["MiddleRight"] = 0,
        ["RearLeft"] = 0,
        ["RearRight"] = 0,
    }
    
    AquaConfig.Boats["AMC_Waverunner_Ground"] = {}
    boat = AquaConfig.Boats["AMC_Waverunner_Ground"]
    boat.onGround = true
    boat.dashboard = "ISBoatDashboard"
    boat.boatSeatUI_Image = "AMC_Waverunner_base_small"
    boat.boatSeatUI_Scale = 1
    boat.multiplierFuelConsumption = 2
    boat.windInfluence = 1.1
    boat.boatSeatUI_SeatOffsetX = {
        ["FrontLeft"] = 0,
        ["FrontRight"] = 0,
        ["MiddleLeft"] = 0,
        ["MiddleRight"] = 0,
        ["RearLeft"] = 0,
        ["RearRight"] = 0,
    }
    boat.boatSeatUI_SeatOffsetY = {
        ["FrontLeft"] = 0,
        ["FrontRight"] = 0,
        ["MiddleLeft"] = 0, 
        ["MiddleRight"] = 0,
        ["RearLeft"] = 0,
        ["RearRight"] = 0,
    }

    -----------------
    -- Trailers
    -----------------

    AquaConfig.Trailers["TrailerAMCWaverunner"] = {}
    local trailer = AquaConfig.Trailers["TrailerAMCWaverunner"]
    trailer.isWithBoat = false
    trailer.trailerWithBoatTable = {}
    trailer.trailerWithBoatTable["AMC_Waverunner"] = "TrailerAMCWaverunnerWithBody"
    trailer.trailerWithBoatTable["AMC_Waverunner_Ground"] = "TrailerAMCWaverunnerWithBody"

    AquaConfig.Trailers["TrailerAMCWaverunnerWithBody"] = {}
    local trailer = AquaConfig.Trailers["TrailerAMCWaverunnerWithBody"]
    trailer.isWithBoat = true
    trailer.boat = "AMC_Waverunner"
    trailer.emptyTrailer = "TrailerAMCWaverunner"

    -- AquaConfig.Trailers["TrailerWithBoatMotor"] = {}
    -- local trailer = AquaConfig.Trailers["TrailerWithBoatMotor"]
    -- trailer.isWithBoat = true
    -- trailer.boat = "BoatMotor"
    -- trailer.emptyTrailer = "TrailerForBoat"
end




