require "Items/ProceduralDistributions"

local list = ProceduralDistributions.list
local targets = {ArtStorePen = 5, BedroomSideTable = 1, BookstoreStationery = 5,
	ClassroomDesk = 7, ClassroomMisc = 7, ClassroomShelves = 7,
	CrateOfficeSupplies = 7, CrateRandomJunk = 0.5, DeskGeneric = 7,
	GigamartSchool = 7, KitchenRandom = 7, LibraryCounter = 7,
	LivingRoomShelf = 0.8, LivingRoomShelfNoTapes = 0.8, Locker = 7,
	OfficeCounter = 7, OfficeDesk = 7, OfficeDeskHome = 7, OfficeDrawers = 7,
	OfficeShelfSupplies = 7, PoliceDesk = 7, PostOfficeSupplies = 7,
	RandomFiller = 1, SchoolLockers = 7, ShelfGeneric = 0.8}
local item = "BicPen.BicPen"

for k,v in pairs(targets) do
	table.insert(list[k].items, item)
	table.insert(list[k].items, v)
end

targets = {counter = 7, inventoryfemale = 0.8, inventorymale = 0.8, sidetable = 7}

for k,v in pairs(targets) do
	table.insert(Distributions[1].all[k].items, item)
	table.insert(Distributions[1].all[k].items, v)
end

targets = {Bag_WorkerBag = 7, Bag_Schoolbag = 7, Briefcase = 7, Suitcase = 7}
for k,v in pairs(targets) do
	table.insert(Distributions[1][k].items, item)
	table.insert(Distributions[1][k].items, v)
end

