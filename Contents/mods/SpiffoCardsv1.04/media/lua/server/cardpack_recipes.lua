local card_common={
"SpiffoCards.SpiffoCard9",
"SpiffoCards.SpiffoCard12",
"SpiffoCards.SpiffoCard13",
"SpiffoCards.SpiffoCard14",
"SpiffoCards.SpiffoCard15",
"SpiffoCards.SpiffoCard16",
}

local card_uncommon={
"SpiffoCards.SpiffoCard6",
"SpiffoCards.SpiffoCard7",
"SpiffoCards.SpiffoCard8",
"SpiffoCards.SpiffoCard9",
"SpiffoCards.SpiffoCard10",
"SpiffoCards.SpiffoCard11",
"SpiffoCards.SpiffoCard12",
"SpiffoCards.SpiffoCard13",
"SpiffoCards.SpiffoCard14",
"SpiffoCards.SpiffoCard15",
"SpiffoCards.SpiffoCard16",
}

local card_rare={
"SpiffoCards.SpiffoCard1",
"SpiffoCards.SpiffoCard2",
"SpiffoCards.SpiffoCard3",
"SpiffoCards.SpiffoCard4",
"SpiffoCards.SpiffoCard5",
"SpiffoCards.SpiffoCard6",
"SpiffoCards.SpiffoCard7",
"SpiffoCards.SpiffoCard8",
"SpiffoCards.SpiffoCard9",
"SpiffoCards.SpiffoCard10",
"SpiffoCards.SpiffoCard11",
"SpiffoCards.SpiffoCard12",
"SpiffoCards.SpiffoCard13",
"SpiffoCards.SpiffoCard14",
"SpiffoCards.SpiffoCard15",
"SpiffoCards.SpiffoCard16",
}

local card_epic={
"SpiffoCards.SpiffoCard0",
"SpiffoCards.SpiffoCard1",
"SpiffoCards.SpiffoCard2",
"SpiffoCards.SpiffoCard3",
"SpiffoCards.SpiffoCard4",
"SpiffoCards.SpiffoCard5",
"SpiffoCards.SpiffoCard10",
"SpiffoCards.SpiffoCard11",
}

function opencardpack(items, result, player)
local roll=ZombRand(0,#card_common)
player:getInventory():AddItem(card_common[roll+1])
local roll=ZombRand(0,#card_uncommon)
player:getInventory():AddItem(card_uncommon[roll+1])
local roll=ZombRand(0,#card_rare)
player:getInventory():AddItem(card_rare[roll+1])
end

function opencardpackgold(items, result, player)
local roll=ZombRand(0,#card_rare)
player:getInventory():AddItem(card_rare[roll+1])
local roll=ZombRand(0,#card_epic)
player:getInventory():AddItem(card_epic[roll+1])
local roll=ZombRand(0,#card_epic)
player:getInventory():AddItem(card_epic[roll+1])
end