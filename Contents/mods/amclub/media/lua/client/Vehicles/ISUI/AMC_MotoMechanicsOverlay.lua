require "Vehicles/ISUI/TSL_ISCarMechanicsOverlay"

-- Harley
ISCarMechanicsOverlay.CarList["Base.AMC_harley"] = {imgPrefix = "AMC_harley_", x=10,y=0};
ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["AMC_harley_"] = {img="battery", x=14,y=150,x2=60,y2=182};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["AMC_harley_"] = {img="suspension_front_left", x=14,y=57,x2=54,y2=94};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["AMC_harley_"] = {x=14,y=200,x2=54,y2=238};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["AMC_harley_"] = {img="brake_front_left", x=14,y=94,x2=54,y2=132};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["AMC_harley_"] = {x=14,y=238,x2=54,y2=274};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["AMC_harley_"] = {x=196,y=57,x2=268,y2=100};
--
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles = ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles["AMC_harley_"] = {x=128,y=114,x2=153,y2=132};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["AMC_harley_"] = {x=232,y=245,x2=268,y2=315};
--
ISCarMechanicsOverlay.PartList["ATAMotoTireFrontWheel"].vehicles["AMC_harley_"] = {x=132,y=57,x2=149,y2=77};
ISCarMechanicsOverlay.PartList["ATAMotoTireRearWheel"].vehicles["AMC_harley_"] = {x=14,y=274,x2=54,y2=313};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles = ISCarMechanicsOverlay.PartList["GasTank"].vehicles or {};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["AMC_harley_"] = {img="gastank", x=206,y=192,x2=268,y2=232};
--
-- BMW
ISCarMechanicsOverlay.CarList["Base.AMC_bmw_classic"] = {imgPrefix = "AMC_bmw_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.AMC_bmw_custom"] = {imgPrefix = "AMC_bmw_", x=10,y=0};

ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["AMC_bmw_"] = {img="battery", x=14,y=150,x2=60,y2=182};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["AMC_bmw_"] = {img="suspension_front_left", x=14,y=57,x2=54,y2=94};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["AMC_bmw_"] = {x=14,y=200,x2=54,y2=238};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["AMC_bmw_"] = {img="brake_front_left", x=14,y=94,x2=54,y2=132};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["AMC_bmw_"] = {x=14,y=238,x2=54,y2=274};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["AMC_bmw_"] = {x=196,y=57,x2=268,y2=100};
--
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles = ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles["AMC_bmw_"] = {x=128,y=114,x2=153,y2=132};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["AMC_bmw_"] = {x=232,y=245,x2=268,y2=315};
--
ISCarMechanicsOverlay.PartList["ATAMotoTireFrontWheel"].vehicles["AMC_bmw_"] = {x=132,y=57,x2=149,y2=77};
ISCarMechanicsOverlay.PartList["ATAMotoTireRearWheel"].vehicles["AMC_bmw_"] = {x=14,y=274,x2=54,y2=313};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles = ISCarMechanicsOverlay.PartList["GasTank"].vehicles or {};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["AMC_bmw_"] = {img="gastank", x=206,y=192,x2=268,y2=232};
--
-- Trailer
ISCarMechanicsOverlay.CarList["Base.TrailerAMCWaverunner"] = {imgPrefix = "TrailerAMCWaverunner_", x=10,y=0};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["TrailerAMCWaverunner_"] = {x=74,y=248,x2=78,y2=285};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["TrailerAMCWaverunner_"] = {x=204,y=248,x2=208,y2=285};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["TrailerAMCWaverunner_"] = {img="suspension_front_left", x=14,y=246,x2=54,y2=287};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["TrailerAMCWaverunner_"] = {x=229,y=246,x2=269,y2=287};
--
-- Trailer with jetski
ISCarMechanicsOverlay.CarList["Base.TrailerAMCWaverunnerWithBody"] = {imgPrefix = "TrailerAMCWaverunnerWithBody_", x=10,y=0};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["TrailerAMCWaverunnerWithBody_"] = {x=74,y=248,x2=78,y2=285};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["TrailerAMCWaverunnerWithBody_"] = {x=204,y=248,x2=208,y2=285};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["TrailerAMCWaverunnerWithBody_"] = {img="suspension_front_left", x=14,y=246,x2=54,y2=287};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["TrailerAMCWaverunnerWithBody_"] = {x=229,y=246,x2=269,y2=287};
--
ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["TrailerAMCWaverunnerWithBody_"] = {img="battery", x=14,y=111,x2=59,y2=144};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["TrailerAMCWaverunnerWithBody_"] = {x=14,y=51,x2=86,y2=96};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["TrailerAMCWaverunnerWithBody_"] = {x=232,y=301,x2=269,y2=370};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles = ISCarMechanicsOverlay.PartList["GasTank"].vehicles or {};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["TrailerAMCWaverunnerWithBody_"] = {img="gastank", x=206,y=147,x2=269,y2=187};
--
-- Jetski on ground
ISCarMechanicsOverlay.CarList["Base.AMC_Waverunner_Ground"] = {imgPrefix = "AMC_Waverunner_", x=10,y=0};
--
ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["AMC_Waverunner_"] = {img="battery", x=14,y=111,x2=59,y2=144};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["AMC_Waverunner_"] = {x=14,y=51,x2=86,y2=96};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["AMC_Waverunner_"] = {x=232,y=301,x2=269,y2=370};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles = ISCarMechanicsOverlay.PartList["GasTank"].vehicles or {};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["AMC_Waverunner_"] = {img="gastank", x=206,y=147,x2=269,y2=187};
--
-- Quad
ISCarMechanicsOverlay.CarList["Base.AMC_quad"] = {imgPrefix = "AMC_quad_", x=10,y=0};
--
ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["AMC_quad_"] = {img="battery", x=14,y=150,x2=59,y2=184};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["AMC_quad_"] = {img="suspension_front_left", x=14,y=64,x2=54,y2=103};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["AMC_quad_"] = {img="suspension_front_left", x=228,y=64,x2=269,y2=103};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["AMC_quad_"] = {x=14,y=193,x2=54,y2=230};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["AMC_quad_"] = {x=228,y=193,x2=269,y2=230};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["AMC_quad_"] = {img="brake_front_left", x=14,y=103,x2=54,y2=139};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["AMC_quad_"] = {img="brake_front_right", x=230,y=103,x2=269,y2=139};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["AMC_quad_"] = {x=14,y=230,x2=54,y2=268};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["AMC_quad_"] = {x=228,y=230,x2=269,y2=268};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["AMC_quad_"] = {x=167,y=317,x2=269,y2=381};
--
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles = ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles["AMC_quad_"] = {x=134,y=114,x2=148,y2=132};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["AMC_quad_"] = {x=14,y=317,x2=51,y2=387};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["AMC_quad_"] = {x=78,y=70,x2=87,y2=131};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["AMC_quad_"] = {x=195,y=70,x2=204,y2=131};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["AMC_quad_"] = {x=78,y=200,x2=87,y2=261};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles = ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["AMC_quad_"] = {x=195,y=200,x2=204,y2=261};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles = ISCarMechanicsOverlay.PartList["GasTank"].vehicles or {};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["AMC_quad_"] = {img="gastank", x=64,y=317,x2=153,y2=376};
--
