-- Herm
ISCarMechanicsOverlay.CarList["Base.28ss100"] = {imgPrefix = "28ss100_", x=10,y=0};
-- Top secret parts
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["28ss100_"] = {img="suspension_front_left", x=0,y=0,x2=0,y2=0};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["28ss100_"] = {x=0,y=0,x2=0,y2=0};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["28ss100_"] = {x=0,y=0,x2=0,y2=0};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles = ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["28ss100_"] = {x=0,y=0,x2=0,y2=0};
--
ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["28ss100_"] = {img="battery", x=14,y=150,x2=60,y2=182};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["28ss100_"] = {img="suspension_front_left", x=14,y=57,x2=54,y2=94};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["28ss100_"] = {x=14,y=200,x2=54,y2=238};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["28ss100_"] = {img="brake_front_left", x=14,y=94,x2=54,y2=132};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["28ss100_"] = {x=14,y=238,x2=54,y2=274};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["28ss100_"] = {x=196,y=57,x2=268,y2=100};
--
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles = ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles["28ss100_"] = {x=128,y=114,x2=153,y2=132};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["28ss100_"] = {x=232,y=245,x2=268,y2=315};
--
ISCarMechanicsOverlay.PartList["ATAMotoTireFrontWheel"] = {img="", x=0,y=0,x2=0,y2=0, vehicles={}};
ISCarMechanicsOverlay.PartList["ATAMotoTireRearWheel"] = {img="", x=0,y=0,x2=0,y2=0, vehicles={}};
ISCarMechanicsOverlay.PartList["ATAMotoTireFrontWheel"].vehicles["28ss100_"] = {x=132,y=57,x2=149,y2=77};
ISCarMechanicsOverlay.PartList["ATAMotoTireRearWheel"].vehicles["28ss100_"] = {x=14,y=274,x2=54,y2=313};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles = ISCarMechanicsOverlay.PartList["GasTank"].vehicles or {};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["28ss100_"] = {img="gastank", x=206,y=192,x2=268,y2=232};
--
ISCarMechanicsOverlay.CarList["Base.28ss100hermes"] = ISCarMechanicsOverlay.CarList["Base.28ss100"];