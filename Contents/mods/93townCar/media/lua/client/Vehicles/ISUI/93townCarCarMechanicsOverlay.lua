--
ISCarMechanicsOverlay.PartList["LIN93BumperFront"] = {img="bullbar", vehicles = {}};
ISCarMechanicsOverlay.PartList["LIN93WindshieldArmor"] = {img="windshield_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["LIN93DoorFrontLeftArmor"] = {img="door_front_left_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["LIN93DoorFrontRightArmor"] = {img="door_front_right_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["LIN93DoorRearLeftArmor"] = {img="door_rear_left_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["LIN93DoorRearRightArmor"] = {img="door_rear_right_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["LIN93WindshieldRearArmor"] = {img="windshield_rear_armor", vehicles = {}};

--##########93townCar##########
--
ISCarMechanicsOverlay.CarList["Base.93townCar"] = {imgPrefix = "93townCar_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.93townCarLimo"] = ISCarMechanicsOverlay.CarList["Base.93townCar"];

--

ISCarMechanicsOverlay.PartList["Battery"].vehicles["93townCar_"] = {img="battery", x=228,y=103,x2=270,y2=134};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["93townCar_"] = {img="suspension_front_left", x=13,y=143,x2=55,y2=181};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["93townCar_"] = {img="suspension_front_right", x=228,y=143,x2=270,y2=181};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["93townCar_"] = {x=13,y=357,x2=55,y2=396};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["93townCar_"] = {x=228,y=357,x2=270,y2=396};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["93townCar_"] = {img="brake_front_left", x=14,y=181,x2=55,y2=218};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["93townCar_"] = {img="brake_front_right", x=228,y=181,x2=270,y2=218};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["93townCar_"] = {x=13,y=396,x2=55,y2=431};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["93townCar_"] = {x=228,y=396,x2=270,y2=431};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["93townCar_"] = {x=13,y=218,x2=55,y2=258};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["93townCar_"] = {x=228,y=218,x2=270,y2=258};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["93townCar_"] = {x=13,y=431,x2=55,y2=471};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["93townCar_"] = {x=228,y=431,x2=270,y2=471};
--
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles["93townCar_"] = {x=73,y=240,x2=80,y2=306};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["93townCar_"] = {x=200,y=240,x2=207,y2=306};
ISCarMechanicsOverlay.PartList["DoorRearLeft"].vehicles["93townCar_"] = {x=73,y=314,x2=80,y2=366};
ISCarMechanicsOverlay.PartList["DoorRearRight"].vehicles["93townCar_"] = {x=200,y=314,x2=207,y2=366};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles["93townCar_"] = {x=141,y=130,x2=196,y2=219};
--
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["93townCar_"] = {x=82,y=130,x2=141,y2=219};

ISCarMechanicsOverlay.PartList["TrunkDoor"] = {img="trunk", vehicles = {"93townCar_"}};
ISCarMechanicsOverlay.PartList["TrunkDoor"].vehicles["93townCar_"] = {x=86,y=427,x2=195,y2=481};
--
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["93townCar_"] = {x=80,y=258,x2=93,y2=309};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles["93townCar_"] = {x=188,y=258,x2=200,y2=309};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles["93townCar_"] = {x=80,y=317,x2=93,y2=363};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles["93townCar_"] = {x=188,y=317,x2=200,y2=363};
--
ISCarMechanicsOverlay.PartList["Windshield"].vehicles["93townCar_"] = {x=93,y=232,x2=188,y2=273};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles["93townCar_"] = {x=92,y=400,x2=189,y2=423};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["93townCar_"] = {img="gastank", x=212,y=527,x2=270,y2=565};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["93townCar_"] = {x=13,y=527,x2=83,y2=564};

ISCarMechanicsOverlay.PartList["LIN93BumperFront"].vehicles["93townCar_"] = {x=98,y=48,x2=141,y2=86};
ISCarMechanicsOverlay.PartList["LIN93WindshieldArmor"].vehicles["93townCar_"] = {x=144,y=48,x2=187,y2=86};
ISCarMechanicsOverlay.PartList["LIN93DoorFrontLeftArmor"].vehicles["93townCar_"] = {x=13,y=268,x2=55,y2=306};
ISCarMechanicsOverlay.PartList["LIN93DoorFrontRightArmor"].vehicles["93townCar_"] = {x=228,y=268,x2=270,y2=306};
ISCarMechanicsOverlay.PartList["LIN93DoorRearLeftArmor"].vehicles["93townCar_"] = {x=13,y=310,x2=55,y2=346};
ISCarMechanicsOverlay.PartList["LIN93DoorRearRightArmor"].vehicles["93townCar_"] = {x=228,y=310,x2=270,y2=346};
ISCarMechanicsOverlay.PartList["LIN93WindshieldRearArmor"].vehicles["93townCar_"] = {x=120,y=526,x2=163,y2=564};
--