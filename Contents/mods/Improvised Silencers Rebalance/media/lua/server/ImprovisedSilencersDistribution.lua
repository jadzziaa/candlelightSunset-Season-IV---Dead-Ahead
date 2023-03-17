require 'Items/ProceduralDistributions'

local SILENCER_RIFLE = "ImprovisedSilencers.Silencer"
local SILENCER_PISTOL = "ImprovisedSilencers.SilencerPistol"

local addToDist = function(groupName, toAdd)
	local itemsTable = ProceduralDistributions["list"][groupName].items
	for name, weight in pairs(toAdd) do
		table.insert(itemsTable, name)
		table.insert(itemsTable, weight)
	end
end

addToDist("GunStoreShelf", {
	[SILENCER_RIFLE] = 3
})
addToDist("GunStoreCounter", {
	[SILENCER_RIFLE] = 6
})
addToDist("GunStoreDisplayCase", {
	[SILENCER_RIFLE] = 6
})
addToDist("PoliceStorageGuns", {
	[SILENCER_RIFLE] = 2,
	[SILENCER_PISTOL] = 2
})
addToDist("PawnShopGunsSpecial", {
	[SILENCER_RIFLE] = 2,
	[SILENCER_PISTOL] = 1
})
addToDist("ArmyStorageGuns", {
	[SILENCER_RIFLE] = 12,
	[SILENCER_PISTOL] = 8
})
addToDist("GarageFirearms", {
	[SILENCER_RIFLE] = 6,
	[SILENCER_PISTOL] = 3
})
