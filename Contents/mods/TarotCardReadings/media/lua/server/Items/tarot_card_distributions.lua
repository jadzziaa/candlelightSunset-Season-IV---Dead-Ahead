require 'Items/ProceduralDistributions'

TCR = TCR or {};

function TCR:addDistributions(itemsAndChances, locations)
	for item, chance in pairs(itemsAndChances)
	do
		for i, location in ipairs(locations)
		do
			if ProceduralDistributions.list[location] and ProceduralDistributions.list[location].items
			then
				table.insert(ProceduralDistributions.list[location].items, item);
				table.insert(ProceduralDistributions.list[location].items, chance);
			end
		end
	end
end

local sVars = SandboxVars.TCR;
local deckSpawns = sVars.Decks * sVars.Loot * 1.0;

TCR:addDistributions({
    -- Deck of cards
    ["TCR.TarotCardDeckFull"] = deckSpawns,
}, {
    "ArtStoreOther", 
    "ClosetShelfGeneric",
    "LivingRoomShelf",
    "LivingRoomShelfNoTapes",
    "Gifts",
    "OtherGeneric",
    "Hobbies",
    "HolidayStuff",
    "OfficeDeskHome",
    "LibraryCounter",
});