if isServer() then return; end
require "VisibleMoveablesExtensions"

--VisibleMoveables.AddConversion(SPRITE NAME, ORIGINAL MOVEABLE INVENTORY ITEM, PICKED UP ITEM, REPLACEMENT ITEM, Prevent running, Drop on shove);

-- Cardboard Boxes
---- small
VisibleMoveables.AddConversion("trashcontainers_01_24", "Base.Mov_CardboardBox", "Moveables.trashcontainers_01_24", "Base.CardboardBox2Carry", false, true);
VisibleMoveables.AddConversion("trashcontainers_01_25", "Base.Mov_CardboardBox", "Moveables.trashcontainers_01_25", "Base.CardboardBox2Carry", false, true);
----Large
VisibleMoveables.AddConversion("furniture_storage_02_16", "Moveables.furniture_storage_02_16", "Moveables.furniture_storage_02_16", "Base.CardboardBoxCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_17", "Moveables.furniture_storage_02_17", "Moveables.furniture_storage_02_17", "Base.CardboardBoxCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_18", "Moveables.furniture_storage_02_18", "Moveables.furniture_storage_02_18", "Base.CardboardBoxCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_19", "Moveables.furniture_storage_02_19", "Moveables.furniture_storage_02_19", "Base.CardboardBoxCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_24", "Moveables.furniture_storage_02_24", "Moveables.furniture_storage_02_24", "Base.CardboardBoxCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_25", "Moveables.furniture_storage_02_25", "Moveables.furniture_storage_02_25", "Base.CardboardBoxCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_26", "Moveables.furniture_storage_02_26", "Moveables.furniture_storage_02_26", "Base.CardboardBoxCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_27", "Moveables.furniture_storage_02_27", "Moveables.furniture_storage_02_27", "Base.CardboardBoxCarry", false, true);

--Garbage Cans
----regular Can
VisibleMoveables.AddConversion("trashcontainers_01_16", "Moveables.trashcontainers_01_16", "Moveables.trashcontainers_01_16", "Base.GarbageCarry", true, true);
---- SMall Black Can
VisibleMoveables.AddConversion("trashcontainers_01_20", "Moveables.trashcontainers_01_20", "Moveables.trashcontainers_01_20", "Base.SmallTrashCarry", false, true);
----Barrel with a bag
VisibleMoveables.AddConversion("trashcontainers_01_17", "Moveables.trashcontainers_01_17", "Moveables.trashcontainers_01_17", "Base.BarrelTrashCarry", true, true);

--Tv's
----Antique
VisibleMoveables.AddConversion("appliances_television_01_8", "Radio.TvAntique", "Radio.TvAntique", "Base.TelevisionCarry", false, true);
VisibleMoveables.AddConversion("appliances_television_01_9", "Radio.TvAntique", "Radio.TvAntique", "Base.TelevisionCarry", false, true);
VisibleMoveables.AddConversion("appliances_television_01_10", "Radio.TvAntique", "Radio.TvAntique", "Base.TelevisionCarry", false, true);
VisibleMoveables.AddConversion("appliances_television_01_11", "Radio.TvAntique", "Radio.TvAntique", "Base.TelevisionCarry", false, true);
----Valuetech
VisibleMoveables.AddConversion("appliances_television_01_4", "Radio.TvBlack", "Radio.TvBlack", "Base.Television2Carry", false, true);
VisibleMoveables.AddConversion("appliances_television_01_5", "Radio.TvBlack", "Radio.TvBlack", "Base.Television2Carry", false, true);
VisibleMoveables.AddConversion("appliances_television_01_6", "Radio.TvBlack", "Radio.TvBlack", "Base.Television2Carry", false, true);
VisibleMoveables.AddConversion("appliances_television_01_7", "Radio.TvBlack", "Radio.TvBlack", "Base.Television2Carry", false, true);

--Microwaves
----White
VisibleMoveables.AddConversion("appliances_cooking_01_24", "Moveables.appliances_cooking_01_24", "Moveables.appliances_cooking_01_24", "Base.Microwave1Carry", false, true);
VisibleMoveables.AddConversion("appliances_cooking_01_25", "Moveables.appliances_cooking_01_25", "Moveables.appliances_cooking_01_25", "Base.Microwave1Carry", false, true);
VisibleMoveables.AddConversion("appliances_cooking_01_26", "Moveables.appliances_cooking_01_26", "Moveables.appliances_cooking_01_26", "Base.Microwave1Carry", false, true);
VisibleMoveables.AddConversion("appliances_cooking_01_27", "Moveables.appliances_cooking_01_27", "Moveables.appliances_cooking_01_27", "Base.Microwave1Carry", false, true);
----Chrome
VisibleMoveables.AddConversion("appliances_cooking_01_28", "Moveables.appliances_cooking_01_28", "Moveables.appliances_cooking_01_28", "Base.Microwave2Carry", false, true);
VisibleMoveables.AddConversion("appliances_cooking_01_29", "Moveables.appliances_cooking_01_29", "Moveables.appliances_cooking_01_29", "Base.Microwave2Carry", false, true);
VisibleMoveables.AddConversion("appliances_cooking_01_30", "Moveables.appliances_cooking_01_30", "Moveables.appliances_cooking_01_30", "Base.Microwave2Carry", false, true);
VisibleMoveables.AddConversion("appliances_cooking_01_31", "Moveables.appliances_cooking_01_31", "Moveables.appliances_cooking_01_31", "Base.Microwave2Carry", false, true);

--Toilets
VisibleMoveables.AddConversion("fixtures_bathroom_01_0", "Base.Mov_FancyToilet", "Moveables.fixtures_bathroom_01_0", "Base.ToiletCarry", true, true);
VisibleMoveables.AddConversion("fixtures_bathroom_01_1", "Base.Mov_FancyToilet", "Moveables.fixtures_bathroom_01_1", "Base.ToiletCarry", true, true);
VisibleMoveables.AddConversion("fixtures_bathroom_01_2", "Base.Mov_FancyToilet", "Moveables.fixtures_bathroom_01_2", "Base.ToiletCarry", true, true);
VisibleMoveables.AddConversion("fixtures_bathroom_01_3", "Base.Mov_FancyToilet", "Moveables.fixtures_bathroom_01_3", "Base.ToiletCarry", true, true);

-- Barrels
----yellow
VisibleMoveables.AddConversion("location_military_generic_01_6", "Moveables.location_military_generic_01_6", "Moveables.location_military_generic_01_6", "Base.BarrelYellowCarry", true, true);
VisibleMoveables.AddConversion("location_military_generic_01_7", "Moveables.location_military_generic_01_7", "Moveables.location_military_generic_01_7", "Base.BarrelYellowCarry", true, true);
----Orange
VisibleMoveables.AddConversion("industry_01_22", "Moveables.industry_01_22", "Moveables.industry_01_22", "Base.BarrelOrangeCarry", true, true);
VisibleMoveables.AddConversion("industry_01_23", "Moveables.industry_01_23", "Moveables.industry_01_23", "Base.BarrelOrangeCarry", true, true);
----green
VisibleMoveables.AddConversion("location_military_generic_01_14", "Moveables.location_military_generic_01_14", "Moveables.location_military_generic_01_14", "Base.BarrelGreenCarry", true, true);
VisibleMoveables.AddConversion("location_military_generic_01_15", "Moveables.location_military_generic_01_15", "Moveables.location_military_generic_01_15", "Base.BarrelGreenCarry", true, true);
----grey
VisibleMoveables.AddConversion("crafted_01_32", "Moveables.crafted_01_32", "Moveables.crafted_01_32", "Base.BarrelGreyCarry", true, true);

--Trunk
VisibleMoveables.AddConversion("furniture_storage_02_28", "Moveables.furniture_storage_02_28", "Moveables.furniture_storage_02_28", "Base.TrunkCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_29", "Moveables.furniture_storage_02_29", "Moveables.furniture_storage_02_29", "Base.TrunkCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_30", "Moveables.furniture_storage_02_30", "Moveables.furniture_storage_02_30", "Base.TrunkCarry", false, true);
VisibleMoveables.AddConversion("furniture_storage_02_31", "Moveables.furniture_storage_02_31", "Moveables.furniture_storage_02_31", "Base.TrunkCarry", false, true);

-- Refridgerators
----Mini Fridge
VisibleMoveables.AddConversion("appliances_refrigeration_01_24", "Moveables.appliances_refrigeration_01_24", "Moveables.appliances_refrigeration_01_24", "Base.MiniFridgeCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_25", "Moveables.appliances_refrigeration_01_25", "Moveables.appliances_refrigeration_01_25", "Base.MiniFridgeCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_26", "Moveables.appliances_refrigeration_01_26", "Moveables.appliances_refrigeration_01_26", "Base.MiniFridgeCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_27", "Moveables.appliances_refrigeration_01_27", "Moveables.appliances_refrigeration_01_27", "Base.MiniFridgeCarry", true, true);
----Red Fridge
VisibleMoveables.AddConversion("appliances_refrigeration_01_32", "Moveables.appliances_refrigeration_01_32", "Moveables.appliances_refrigeration_01_32", "Base.FridgeRedCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_33", "Moveables.appliances_refrigeration_01_33", "Moveables.appliances_refrigeration_01_33", "Base.FridgeRedCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_34", "Moveables.appliances_refrigeration_01_34", "Moveables.appliances_refrigeration_01_34", "Base.FridgeRedCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_35", "Moveables.appliances_refrigeration_01_35", "Moveables.appliances_refrigeration_01_35", "Base.FridgeRedCarry", true, true);
----Green Fridge
VisibleMoveables.AddConversion("appliances_refrigeration_01_12", "Moveables.appliances_refrigeration_01_12", "Moveables.appliances_refrigeration_01_12", "Base.FridgeGreenCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_13", "Moveables.appliances_refrigeration_01_13", "Moveables.appliances_refrigeration_01_13", "Base.FridgeGreenCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_14", "Moveables.appliances_refrigeration_01_14", "Moveables.appliances_refrigeration_01_14", "Base.FridgeGreenCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_15", "Moveables.appliances_refrigeration_01_15", "Moveables.appliances_refrigeration_01_15", "Base.FridgeGreenCarry", true, true);
----White Fridge
VisibleMoveables.AddConversion("appliances_refrigeration_01_0", "Moveables.appliances_refrigeration_01_0", "Moveables.appliances_refrigeration_01_0", "Base.FridgeWhiteCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_1", "Moveables.appliances_refrigeration_01_1", "Moveables.appliances_refrigeration_01_1", "Base.FridgeWhiteCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_2", "Moveables.appliances_refrigeration_01_2", "Moveables.appliances_refrigeration_01_2", "Base.FridgeWhiteCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_3", "Moveables.appliances_refrigeration_01_3", "Moveables.appliances_refrigeration_01_3", "Base.FridgeWhiteCarry", true, true);
----White Fridge2
VisibleMoveables.AddConversion("appliances_refrigeration_01_28", "Moveables.appliances_refrigeration_01_28", "Moveables.appliances_refrigeration_01_28", "Base.Fridge2WhiteCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_29", "Moveables.appliances_refrigeration_01_29", "Moveables.appliances_refrigeration_01_29", "Base.Fridge2WhiteCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_30", "Moveables.appliances_refrigeration_01_30", "Moveables.appliances_refrigeration_01_30", "Base.Fridge2WhiteCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_31", "Moveables.appliances_refrigeration_01_31", "Moveables.appliances_refrigeration_01_31", "Base.Fridge2WhiteCarry", true, true);
----Teal Fridge2
VisibleMoveables.AddConversion("appliances_refrigeration_01_4", "Moveables.appliances_refrigeration_01_4", "Moveables.appliances_refrigeration_01_4", "Base.Fridge2TealCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_5", "Moveables.appliances_refrigeration_01_5", "Moveables.appliances_refrigeration_01_5", "Base.Fridge2TealCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_6", "Moveables.appliances_refrigeration_01_6", "Moveables.appliances_refrigeration_01_6", "Base.Fridge2TealCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_7", "Moveables.appliances_refrigeration_01_7", "Moveables.appliances_refrigeration_01_7", "Base.Fridge2TealCarry", true, true);
----Steel Fridge
VisibleMoveables.AddConversion("appliances_refrigeration_01_8", "Moveables.appliances_refrigeration_01_8", "Moveables.appliances_refrigeration_01_8", "Base.Fridge3SilverCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_9", "Moveables.appliances_refrigeration_01_9", "Moveables.appliances_refrigeration_01_9", "Base.Fridge3SilverCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_10", "Moveables.appliances_refrigeration_01_10", "Moveables.appliances_refrigeration_01_10", "Base.Fridge3SilverCarry", true, true);
VisibleMoveables.AddConversion("appliances_refrigeration_01_11", "Moveables.appliances_refrigeration_01_11", "Moveables.appliances_refrigeration_01_11", "Base.Fridge3SilverCarry", true, true);

-- Gnome
VisibleMoveables.AddConversion("vegetation_ornamental_01_48", "Moveables.vegetation_ornamental_01_48", "Moveables.vegetation_ornamental_01_48", "Base.GnomeCarry", false, true);
VisibleMoveables.AddConversion("vegetation_ornamental_01_49", "Moveables.vegetation_ornamental_01_49", "Moveables.vegetation_ornamental_01_49", "Base.GnomeCarry", false, true);

-- Cones
----regular cone
VisibleMoveables.AddConversion("street_decoration_01_26", "Moveables.street_decoration_01_26", "Moveables.street_decoration_01_26", "Base.ConeCarry", false, true);
----round cone
VisibleMoveables.AddConversion("street_decoration_01_27", "Moveables.street_decoration_01_27", "Moveables.street_decoration_01_27", "Base.Cone2Carry", false, true);

--Registers
----White
VisibleMoveables.AddConversion("location_shop_accessories_01_0", "Moveables.location_shop_accessories_01_0", "Moveables.location_shop_accessories_01_0", "Base.RegisterCarry", false, true);
VisibleMoveables.AddConversion("location_shop_accessories_01_1", "Moveables.location_shop_accessories_01_1", "Moveables.location_shop_accessories_01_1", "Base.RegisterCarry", false, true);
VisibleMoveables.AddConversion("location_shop_accessories_01_2", "Moveables.location_shop_accessories_01_2", "Moveables.location_shop_accessories_01_2", "Base.RegisterCarry", false, true);
VisibleMoveables.AddConversion("location_shop_accessories_01_3", "Moveables.location_shop_accessories_01_3", "Moveables.location_shop_accessories_01_3", "Base.RegisterCarry", false, true);
----Black
VisibleMoveables.AddConversion("location_shop_accessories_01_20", "Moveables.location_shop_accessories_01_20", "Moveables.location_shop_accessories_01_20", "Base.Register2Carry", false, true);
VisibleMoveables.AddConversion("location_shop_accessories_01_21", "Moveables.location_shop_accessories_01_21", "Moveables.location_shop_accessories_01_21", "Base.Register2Carry", false, true);
VisibleMoveables.AddConversion("location_shop_accessories_01_22", "Moveables.location_shop_accessories_01_22", "Moveables.location_shop_accessories_01_22", "Base.Register2Carry", false, true);
VisibleMoveables.AddConversion("location_shop_accessories_01_23", "Moveables.location_shop_accessories_01_23", "Moveables.location_shop_accessories_01_23", "Base.Register2Carry", false, true);

--Washers & Dryers
----Washer
VisibleMoveables.AddConversion("appliances_laundry_01_4", "Moveables.appliances_laundry_01_4", "Moveables.appliances_laundry_01_4", "Base.WasherCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_5", "Moveables.appliances_laundry_01_5", "Moveables.appliances_laundry_01_5", "Base.WasherCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_6", "Moveables.appliances_laundry_01_6", "Moveables.appliances_laundry_01_6", "Base.WasherCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_7", "Moveables.appliances_laundry_01_7", "Moveables.appliances_laundry_01_7", "Base.WasherCarry", true, true);
----Dryer
VisibleMoveables.AddConversion("appliances_laundry_01_12", "Moveables.appliances_laundry_01_12", "Moveables.appliances_laundry_01_12", "Base.DryerCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_13", "Moveables.appliances_laundry_01_13", "Moveables.appliances_laundry_01_13", "Base.DryerCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_14", "Moveables.appliances_laundry_01_14", "Moveables.appliances_laundry_01_14", "Base.DryerCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_15", "Moveables.appliances_laundry_01_15", "Moveables.appliances_laundry_01_15", "Base.DryerCarry", true, true);
----combo
VisibleMoveables.AddConversion("appliances_laundry_01_0", "Moveables.appliances_laundry_01_0", "Moveables.appliances_laundry_01_0", "Base.ComboCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_1", "Moveables.appliances_laundry_01_1", "Moveables.appliances_laundry_01_1", "Base.ComboCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_2", "Moveables.appliances_laundry_01_2", "Moveables.appliances_laundry_01_2", "Base.ComboCarry", true, true);
VisibleMoveables.AddConversion("appliances_laundry_01_3", "Moveables.appliances_laundry_01_3", "Moveables.appliances_laundry_01_3", "Base.ComboCarry", true, true);