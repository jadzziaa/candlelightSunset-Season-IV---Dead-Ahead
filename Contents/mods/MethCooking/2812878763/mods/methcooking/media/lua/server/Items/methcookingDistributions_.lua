require "Items/ProceduralDistributions"

local veryLowProb	=0.000001;
local lowProb		=0.00001;
local medProb		=0.0001;
local highProb		=0.001;
local veryHighProb	=0.010;

local function insertMethItems(location, baseProb)
	-- 50% of all meth is regular meth.
	table.insert(ProceduralDistributions.list[location].items, "MethCooking.MethGood");
	table.insert(ProceduralDistributions.list[location].items, baseProb * 0.5);			-- 1/2 regular meth is good
	table.insert(ProceduralDistributions.list[location].items, "MethCooking.MethBad");
	table.insert(ProceduralDistributions.list[location].items, baseProb * 0.5);			-- 1/2 regular meth is bad
	
	-- 30% of all meth is Blue meth.
	table.insert(ProceduralDistributions.list[location].items, "MethCooking.BlueMethGood");
	table.insert(ProceduralDistributions.list[location].items, (baseProb * 0.6) * 0.75);		-- 3/4ths of blue meth is good
	table.insert(ProceduralDistributions.list[location].items, "MethCooking.BlueMethBad");	-- 1/4th of blue meth is bad
	table.insert(ProceduralDistributions.list[location].items, (baseProb * 0.6) * 0.25);
	
	-- 20% of all meth is Pepper meth.
	table.insert(ProceduralDistributions.list[location].items, "MethCooking.PepperMethGood");
	table.insert(ProceduralDistributions.list[location].items, (baseProb * 0.4) * 0.666);		-- 2/3rds of pepper meth is good
	table.insert(ProceduralDistributions.list[location].items, "MethCooking.PepperMethBad");
	table.insert(ProceduralDistributions.list[location].items, (baseProb * 0.4) * 0.333);		-- 1/3rd of pepper meth is bad
end

insertMethItems("BathroomCabinet", medProb);
insertMethItems("BathroomCounter", medProb);
insertMethItems("BedroomDresser", medProb);
insertMethItems("BedroomSideTable", medProb);
insertMethItems("DeskGeneric", medProb);
insertMethItems("DresserGeneric", medProb);
insertMethItems("DrugLabSupplies", veryHighProb);
insertMethItems("DrugShackMisc", veryHighProb);
insertMethItems("FactoryLockers", lowProb);
insertMethItems("GymLockers", medProb);
insertMethItems("HospitalLockers", lowProb);
insertMethItems("HuntingLockers", veryHighProb);
insertMethItems("JanitorMisc", highProb);
insertMethItems("LivingRoomShelf", lowProb);
insertMethItems("LivingRoomShelfNoTapes", lowProb);
insertMethItems("LivingRoomSideTable", lowProb);
insertMethItems("LivingRoomSideTableNoRemote", lowProb);
insertMethItems("Locker", highProb);
insertMethItems("LockerArmyBedroom", lowProb);
insertMethItems("MechanicShelfMisc", veryHighProb);
insertMethItems("PoolLockers", highProb);
insertMethItems("PrisonCellRandom", highProb);
insertMethItems("PrisonGuardLockers", veryHighProb);
insertMethItems("SchoolLockers", highProb);
insertMethItems("SecurityLockers", medProb);
insertMethItems("ShelfGeneric", lowProb);
insertMethItems("StripClubDressers", veryHighProb);
insertMethItems("WardrobeMan", medProb);
insertMethItems("WardrobeManClassy", lowProb);
insertMethItems("WardrobeRedneck", veryHighProb);
insertMethItems("WardrobeWoman", medProb);
insertMethItems("WardrobeWomanClassy", lowProb);
