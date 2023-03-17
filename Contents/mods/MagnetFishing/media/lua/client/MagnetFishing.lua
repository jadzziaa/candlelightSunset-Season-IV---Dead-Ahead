-- Add magnets to the lure table.
local function loadTierMagnets(magnetTier, chanceToBreak)
    local magnetCollection = MagnetFishing["Tier"..magnetTier.."Magnets"]
    for _, v in pairs(magnetCollection) do
        local item = getScriptManager():getItem(v)
        if item then
            item:DoParam("MagnetFishingTier = "..magnetTier)
            if not item:getTags():contains("MagnetItem") then
                item:getTags():Add("MagnetItem")
            end

            local magnet = {}
            magnet.item = v
            magnet.plastic = true
            magnet.chanceOfBreak = chanceToBreak
            Fishing.lure[item:getName()] = magnet
        end
    end
end

loadTierMagnets(1, 30)
loadTierMagnets(2, 7)
loadTierMagnets(3, -1)

-- Yoinked from FishingPlus, thank you for existing!1
function MagnetFishing:getTimesToRun(magnetTier, finalTier)
    local val = MagnetFishing.tiersToValues[magnetTier]
	if type(val) == "table" then
		return MagnetFishing.tiersToValues[magnetTier][finalTier]
	end
	return val
end

function MagnetFishing:getLootFromTier(tier)
    local totalWeight = tier.totalWeight
	local randomNumber = ZombRand(1, totalWeight) --math.random(1,totalWeight)

    local weightIndex = 0
    for _, data in ipairs(tier) do
        if data and type(data) == "table" then
            weightIndex = weightIndex + data[2]
            if randomNumber <= weightIndex then
                --print(randomNumber.." - "..entry.item);
                return data
            end
        end
    end
end
-- 
function MagnetFishing:getLoot(magnet)
    local magnetTier = magnet:getModData().MagnetFishingTier
    local finalTier = tonumber(magnetTier) or 1
    local randomNumber = ZombRand(1, MagnetFishing.totalTierChances)
    local items = {}

    if finalTier >= 3 then
        if randomNumber > (SandboxVars.MagnetFishing.Tier3Chance/MagnetFishing.totalTierChances)*100 then
            finalTier = 2
        end
    end

    if finalTier == 2 then
        if randomNumber > (SandboxVars.MagnetFishing.Tier2Chance/MagnetFishing.totalTierChances)*100 then
            finalTier = 1
        end
    end

    print("Final tier was "..tostring(finalTier))
    for i = 1, MagnetFishing:getTimesToRun(magnetTier, finalTier) do
        table.insert(items, MagnetFishing:getLootFromTier(MagnetFishing["Tier"..finalTier.."Items"]))
    end
    return items
end

MagnetFishing.originGetFishFunction = ISFishingAction.getFish
function ISFishingAction:getFish() -- Not for fish anymore NERDS!
    if not self.usingSpear and self.lure:getTags():contains("MagnetItem") then
        local firstItem = nil
        local items = MagnetFishing:getLoot(self.lure)
        for _, itemData in pairs(items) do
            local displayItem = nil
            local randomAmount = math.floor(ZombRand(itemData[3], itemData[4]) + 0.5)
            for i = 1, randomAmount do
                local item = InventoryItemFactory.CreateItem(itemData[1]);
                local randomUsage = ZombRandFloat(itemData[5], itemData[6])
                local inv = self:getUsedInventory(item);

                if instanceof(item, "Drainable") then
                    item:setUsedDelta(randomUsage)
                elseif instanceof(item, "HandWeapon") then
                    local maxCondition = item:getConditionMax()
                    item:setCondition(math.floor((randomUsage*maxCondition) + 0.5))
                end

                if item:isWaterSource() then
                    item:setTaintedWater(true)
                end

                self.character:playSound("CatchTrashWithRod");
                addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 20, 1)

                inv:AddItem(item);

                if not firstItem then
                    firstItem = item
                end

                displayItem = item
            end

            if self.fishingUI and displayItem then
                self.fishingUI:setFish(displayItem);
            end
        end

        local gainedXP = 3
        local currentXP = self.character:getXp():getXP(Perks.Fishing);
        self.character:getXp():AddXP(Perks.Fishing, gainedXP);
        gainedXP = self.character:getXp():getXP(Perks.Fishing) - currentXP;
        gainedXP = string.format("%.2f", gainedXP);
        local holotext = "[col=137,232,148]"..Perks.Fishing:getName().." "..getText("Challenge_Challenge2_CurrentXp", gainedXP) .. "[/] [img=media/ui/ArrowUp.png]"
        HaloTextHelper.addText(self.character, holotext)

        return firstItem
    end
    return MagnetFishing.originGetFishFunction(self)
end