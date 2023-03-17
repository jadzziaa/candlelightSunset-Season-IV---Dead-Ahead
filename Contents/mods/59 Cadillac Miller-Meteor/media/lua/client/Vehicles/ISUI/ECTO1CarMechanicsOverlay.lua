ISCarMechanicsOverlay.CarList["Base.ECTO1"] = {imgPrefix = "ECTO1_", x=10,y=20};
ISCarMechanicsOverlay.CarList["Base.59meteor"] = {imgPrefix = "ECTO1_", x=10,y=20};
ISCarMechanicsOverlay.CarList["Base.59ambulance"] = {imgPrefix = "ECTO1_", x=10,y=20};
--
ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["ECTO1_"] = {img="battery", x=228,y=80,x2=270,y2=113};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["ECTO1_"] = {img="suspension_front_left", x=13,y=119,x2=55,y2=156};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["ECTO1_"] = {img="suspension_front_right", x=228,y=119,x2=270,y2=156};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["ECTO1_"] = {x=13,y=404,x2=55,y2=441};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["ECTO1_"] = {x=228,y=404,x2=270,y2=441};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["ECTO1_"] = {img="brake_front_left", x=14,y=156,x2=55,y2=193};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["ECTO1_"] = {img="brake_front_right", x=228,y=156,x2=270,y2=193};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["ECTO1_"] = {x=13,y=441,x2=55,y2=477};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["ECTO1_"] = {x=228,y=441,x2=270,y2=477};
--
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles["ECTO1_"] = {x=70,y=235,x2=82,y2=320};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["ECTO1_"] = {x=201,y=235,x2=211,y2=320};
ISCarMechanicsOverlay.PartList["DoorRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["DoorRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorRearLeft"].vehicles["ECTO1_"] = {x=70,y=322,x2=82,y2=400};
ISCarMechanicsOverlay.PartList["DoorRearRight"].vehicles = ISCarMechanicsOverlay.PartList["DoorRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorRearRight"].vehicles["ECTO1_"] = {x=201,y=322,x2=211,y2=400};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["ECTO1_"] = {x=90,y=155,x2=195,y2=210};
--
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles = ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles or {};
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["ECTO1_"] = {x=90,y=100,x2=195,y2=155};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["ECTO1_"] = {x=13,y=193,x2=55,y2=232};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["ECTO1_"] = {x=228,y=193,x2=270,y2=232};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["ECTO1_"] = {x=13,y=477,x2=55,y2=517};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles = ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["ECTO1_"] = {x=228,y=477,x2=270,y2=517};
--
ISCarMechanicsOverlay.PartList["TrunkDoor"] = {img="trunk", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["TrunkDoor"].vehicles = ISCarMechanicsOverlay.PartList["TrunkDoor"].vehicles or {};
ISCarMechanicsOverlay.PartList["TrunkDoor"].vehicles["ECTO1_"] = {x=104,y=520,x2=178,y2=530};
--
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["ECTO1_"] = {x=82,y=252,x2=89,y2=320};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles["ECTO1_"] = {x=193,y=252,x2=214,y2=320};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles["ECTO1_"] = {x=82,y=322,x2=89,y2=400};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles = ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles["ECTO1_"] = {x=193,y=322,x2=214,y2=400};
--
ISCarMechanicsOverlay.PartList["Windshield"].vehicles = ISCarMechanicsOverlay.PartList["Windshield"].vehicles or {};
ISCarMechanicsOverlay.PartList["Windshield"].vehicles["ECTO1_"] = {x=89,y=213,x2=193,y2=252};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles = ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles or {};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles["ECTO1_"] = {x=104,y=507,x2=178,y2=520};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles = ISCarMechanicsOverlay.PartList["GasTank"].vehicles or {};
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["ECTO1_"] = {img="gastank", x=13,y=581,x2=70,y2=620};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["ECTO1_"] = {x=199,y=581,x2=270,y2=620};
--
ISCarMechanicsOverlay.PartList["ECTO1Bullbar"] = {img="bullbar", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["ECTO1Bullbar"].vehicles = ISCarMechanicsOverlay.PartList["ECTO1Bullbar"].vehicles or {};
ISCarMechanicsOverlay.PartList["ECTO1Bullbar"].vehicles["ECTO1_"] = {x=98,y=45,x2=141,y2=83};
--
ISCarMechanicsOverlay.PartList["ECTO1WindshieldArmor"] = {img="windshield_armor", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["ECTO1WindshieldArmor"].vehicles = ISCarMechanicsOverlay.PartList["ECTO1WindshieldArmor"].vehicles or {};
ISCarMechanicsOverlay.PartList["ECTO1WindshieldArmor"].vehicles["ECTO1_"] = {x=144,y=45,x2=187,y2=83};
--
ISCarMechanicsOverlay.PartList["ECTO1DoorFrontLeftArmor"] = {img="door_front_left_armor", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["ECTO1DoorFrontLeftArmor"].vehicles = ISCarMechanicsOverlay.PartList["ECTO1DoorFrontLeftArmor"].vehicles or {};
ISCarMechanicsOverlay.PartList["ECTO1DoorFrontLeftArmor"].vehicles["ECTO1_"] = {x=13,y=281,x2=55,y2=319};
--
ISCarMechanicsOverlay.PartList["ECTO1DoorFrontRightArmor"] = {img="door_front_right_armor", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["ECTO1DoorFrontRightArmor"].vehicles = ISCarMechanicsOverlay.PartList["ECTO1DoorFrontRightArmor"].vehicles or {};
ISCarMechanicsOverlay.PartList["ECTO1DoorFrontRightArmor"].vehicles["ECTO1_"] = {x=228,y=281,x2=270,y2=319};
--
ISCarMechanicsOverlay.PartList["ECTO1DoorRearLeftArmor"] = {img="door_rear_left_armor", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["ECTO1DoorRearLeftArmor"].vehicles = ISCarMechanicsOverlay.PartList["ECTO1DoorRearLeftArmor"].vehicles or {};
ISCarMechanicsOverlay.PartList["ECTO1DoorRearLeftArmor"].vehicles["ECTO1_"] = {x=13,y=322,x2=55,y2=360};
--
ISCarMechanicsOverlay.PartList["ECTO1DoorRearRightArmor"] = {img="door_rear_right_armor", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["ECTO1DoorRearRightArmor"].vehicles = ISCarMechanicsOverlay.PartList["ECTO1DoorRearRightArmor"].vehicles or {};
ISCarMechanicsOverlay.PartList["ECTO1DoorRearRightArmor"].vehicles["ECTO1_"] = {x=228,y=322,x2=270,y2=360};
--
ISCarMechanicsOverlay.PartList["ECTO1WindshieldRearArmor"] = {img="windshield_rear_armor", vehicles = {"ECTO1_"}};
ISCarMechanicsOverlay.PartList["ECTO1WindshieldRearArmor"].vehicles = ISCarMechanicsOverlay.PartList["ECTO1WindshieldRearArmor"].vehicles or {};
ISCarMechanicsOverlay.PartList["ECTO1WindshieldRearArmor"].vehicles["ECTO1_"] = {x=120,y=581,x2=163,y2=620};