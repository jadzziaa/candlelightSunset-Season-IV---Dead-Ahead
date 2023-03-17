require 'Items/ProceduralDistributions'
require 'Items/SuburbsDistributions'
require 'Items/Distributions'

function registerAsLoot(item, chance, allocation)
  table.insert(ProceduralDistributions.list[allocation].items, item);
  table.insert(ProceduralDistributions.list[allocation].items, chance);
end

local iReg = "Books";

iReg = "CardsCrafts.CardBoxClassicSealed"
registerAsLoot(iReg, 0.2, "CrateBooks");
registerAsLoot(iReg, 0.1, "DaycareDesk");
registerAsLoot(iReg, 0.1, "DaycareShelves");
registerAsLoot(iReg, 0.1, "KitchenBook");
registerAsLoot(iReg, 0.1, "LibraryCounter");
registerAsLoot(iReg, 0.1, "LivingRoomShelf");
registerAsLoot(iReg, 0.1, "LivingRoomShelfNoTapes");
registerAsLoot(iReg, 0.1, "Locker");
registerAsLoot(iReg, 0.1, "OfficeCounter");
registerAsLoot(iReg, 0.1, "PostOfficeBooks");
registerAsLoot(iReg, 0.1, "SchoolLockers");
registerAsLoot(iReg, 0.1, "ShelfGeneric");
registerAsLoot(iReg, 0.1, "ToolStoreBooks");
registerAsLoot(iReg, 0.2, "BookstoreBooks");
registerAsLoot(iReg, 0.1, "CampingStoreBooks");
registerAsLoot(iReg, 0.1, "ClassroomDesk");
registerAsLoot(iReg, 0.1, "ClassroomMisc");
registerAsLoot(iReg, 0.1, "ClassroomShelves");