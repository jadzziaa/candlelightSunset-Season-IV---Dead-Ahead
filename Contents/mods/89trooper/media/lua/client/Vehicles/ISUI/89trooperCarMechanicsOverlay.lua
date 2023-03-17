-- common custom parts

ISCarMechanicsOverlay.PartList["ISZ89BumperFront"] = {img="bullbar", vehicles = {}};
ISCarMechanicsOverlay.PartList["ISZ89WindshieldArmor"] = {img="windshield_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["ISZ89DoorFrontLeftArmor"] = {img="door_front_left_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["ISZ89DoorFrontRightArmor"] = {img="door_front_right_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["ISZ89DoorRearLeftArmor"] = {img="door_rear_left_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["ISZ89DoorRearRightArmor"] = {img="door_rear_right_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["ISZ89WindshieldRearArmor"] = {img="windshield_rear_armor", vehicles = {}};
ISCarMechanicsOverlay.PartList["ISZ89SpareTire"] = {img="spare", vehicles = {}};

--
--##########trooper##########
--
ISCarMechanicsOverlay.CarList["Base.89trooper"] = {imgPrefix = "89trooper_", x=10,y=0};
ISCarMechanicsOverlay.CarList["Base.89trooperOP"] = ISCarMechanicsOverlay.CarList["Base.89trooper"];

--

ISCarMechanicsOverlay.PartList["Battery"].vehicles["89trooper_"] = {img="battery", x=228,y=103,x2=270,y2=134};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["89trooper_"] = {img="suspension_front_left", x=13,y=143,x2=55,y2=181};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["89trooper_"] = {img="suspension_front_right", x=228,y=143,x2=270,y2=181};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["89trooper_"] = {x=13,y=357,x2=55,y2=396};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["89trooper_"] = {x=228,y=357,x2=270,y2=396};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["89trooper_"] = {img="brake_front_left", x=14,y=181,x2=55,y2=218};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["89trooper_"] = {img="brake_front_right", x=228,y=181,x2=270,y2=218};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["89trooper_"] = {x=13,y=396,x2=55,y2=431};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["89trooper_"] = {x=228,y=396,x2=270,y2=431};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["89trooper_"] = {x=13,y=218,x2=55,y2=258};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["89trooper_"] = {x=228,y=218,x2=270,y2=258};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["89trooper_"] = {x=13,y=431,x2=55,y2=471};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["89trooper_"] = {x=228,y=431,x2=270,y2=471};
--
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles["89trooper_"] = {x=74,y=241,x2=81,y2=311};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["89trooper_"] = {x=201,y=241,x2=207,y2=311};
ISCarMechanicsOverlay.PartList["DoorRearLeft"].vehicles["89trooper_"] = {x=74,y=311,x2=81,y2=373};
ISCarMechanicsOverlay.PartList["DoorRearRight"].vehicles["89trooper_"] = {x=201,y=311,x2=207,y2=373};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles["89trooper_"] = {x=141,y=146,x2=196,y2=219};
--
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["89trooper_"] = {x=85,y=146,x2=141,y2=219};
--
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["89trooper_"] = {x=81,y=262,x2=89,y2=307};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles["89trooper_"] = {x=190,y=262,x2=200,y2=307};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles["89trooper_"] = {x=81,y=314,x2=89,y2=371};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles["89trooper_"] = {x=190,y=314,x2=200,y2=371};
--
ISCarMechanicsOverlay.PartList["Windshield"].vehicles["89trooper_"] = {x=90,y=233,x2=190,y2=259};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles["89trooper_"] = {x=90,y=447,x2=190,y2=457};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["89trooper_"] = {img="gastank", x=212,y=527,x2=270,y2=565};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["89trooper_"] = {x=13,y=527,x2=83,y2=564};

ISCarMechanicsOverlay.PartList["ISZ89BumperFront"].vehicles["89trooper_"] = {x=98,y=48,x2=141,y2=86};
ISCarMechanicsOverlay.PartList["ISZ89WindshieldArmor"].vehicles["89trooper_"] = {x=144,y=48,x2=187,y2=86};
ISCarMechanicsOverlay.PartList["ISZ89DoorFrontLeftArmor"].vehicles["89trooper_"] = {x=13,y=268,x2=55,y2=306};
ISCarMechanicsOverlay.PartList["ISZ89DoorFrontRightArmor"].vehicles["89trooper_"] = {x=228,y=268,x2=270,y2=306};
ISCarMechanicsOverlay.PartList["ISZ89DoorRearLeftArmor"].vehicles["89trooper_"] = {x=13,y=310,x2=55,y2=346};
ISCarMechanicsOverlay.PartList["ISZ89DoorRearRightArmor"].vehicles["89trooper_"] = {x=228,y=310,x2=270,y2=346};
ISCarMechanicsOverlay.PartList["ISZ89WindshieldRearArmor"].vehicles["89trooper_"] = {x=120,y=526,x2=163,y2=564};
ISCarMechanicsOverlay.PartList["ISZ89SpareTire"].vehicles["89trooper_"] = {x=91,y=460,x2=148,y2=482};
--
--
--##########trooperRS##########
--
ISCarMechanicsOverlay.CarList["Base.89trooperRS"] = {imgPrefix = "89trooperRS_", x=10,y=0};
--
ISCarMechanicsOverlay.PartList["Battery"].vehicles["89trooperRS_"] = {img="battery", x=228,y=103,x2=270,y2=134};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["89trooperRS_"] = {img="suspension_front_left", x=13,y=143,x2=55,y2=181};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["89trooperRS_"] = {img="suspension_front_right", x=228,y=143,x2=270,y2=181};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["89trooperRS_"] = {x=13,y=316,x2=55,y2=354};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["89trooperRS_"] = {x=228,y=316,x2=270,y2=354};
--
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["89trooperRS_"] = {img="brake_front_left", x=14,y=181,x2=55,y2=218};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["89trooperRS_"] = {img="brake_front_right", x=228,y=181,x2=270,y2=218};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["89trooperRS_"] = {x=13,y=354,x2=55,y2=391};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["89trooperRS_"] = {x=228,y=354,x2=270,y2=391};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["89trooperRS_"] = {x=13,y=218,x2=55,y2=258};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["89trooperRS_"] = {x=228,y=218,x2=270,y2=258};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["89trooperRS_"] = {x=13,y=391,x2=55,y2=431};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["89trooperRS_"] = {x=228,y=391,x2=270,y2=431};
--
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles["89trooperRS_"] = {x=75,y=241,x2=81,y2=316};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["89trooperRS_"] = {x=201,y=241,x2=207,y2=316};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles["89trooperRS_"] = {x=141,y=146,x2=196,y2=219};
--
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["89trooperRS_"] = {x=85,y=146,x2=141,y2=219};
--
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["89trooperRS_"] = {x=81,y=249,x2=91,y2=313};
ISCarMechanicsOverlay.PartList["WindowFrontRight"].vehicles["89trooperRS_"] = {x=191,y=249,x2=201,y2=313};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles["89trooperRS_"] = {x=81,y=320,x2=91,y2=366};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles["89trooperRS_"] = {x=191,y=320,x2=201,y2=366};
--
ISCarMechanicsOverlay.PartList["Windshield"].vehicles["89trooperRS_"] = {x=90,y=233,x2=190,y2=259};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles["89trooperRS_"] = {x=90,y=421,x2=192,y2=432};
--
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["89trooperRS_"] = {img="gastank", x=212,y=490,x2=270,y2=527};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["89trooperRS_"] = {x=13,y=490,x2=83,y2=527};

ISCarMechanicsOverlay.PartList["ISZ89BumperFront"].vehicles["89trooperRS_"] = {x=98,y=48,x2=141,y2=86};
ISCarMechanicsOverlay.PartList["ISZ89WindshieldArmor"].vehicles["89trooperRS_"] = {x=144,y=48,x2=187,y2=86};
ISCarMechanicsOverlay.PartList["ISZ89DoorFrontLeftArmor"].vehicles["89trooperRS_"] = {x=13,y=268,x2=55,y2=306};
ISCarMechanicsOverlay.PartList["ISZ89DoorFrontRightArmor"].vehicles["89trooperRS_"] = {x=228,y=268,x2=270,y2=306};
ISCarMechanicsOverlay.PartList["ISZ89WindshieldRearArmor"].vehicles["89trooperRS_"] = {x=120,y=490,x2=163,y2=527};
ISCarMechanicsOverlay.PartList["ISZ89SpareTire"].vehicles["89trooperRS_"] = {x=93,y=434,x2=147,y2=455};
--
--fml


