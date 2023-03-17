local locations = {"MaskEyes", "Mask", "MaskFull", "Hands", "Hat", "FullHat", "Neck", "Belt", "BeltExtra", "Jacket", "JacketHat"}

local wearClothingFunc = ISWearClothing.new
function ISWearClothing:new(character, item, time)
    local b = wearClothingFunc(self, character, item, time)
    if instanceof(item, "Clothing") then
        local loc = item:getBodyLocation()
        for i, v in pairs(locations) do
            if loc == v then b.stopOnWalk = false end
        end
    elseif instanceof(item, "InventoryContainer") and item:canBeEquipped() ~= "" then
        b.stopOnWalk = false
    end
	return b
end