require "Farming/ISUI/ISFarmingMenu";

-- orderly context menu

local vanillaFContext = ISFarmingMenu["doSeedMenu"];

ISFarmingMenu["doSeedMenu"] = function(self, context, furrow, square, playerObj)
    if BTSE.Farming["seedsAreGrouped"] == nil
    then
        BTSE.Farming:createGroupedSeedsCache();
    end

    if BTSE.Farming["seedsAreGrouped"]
    then
        local seedMenu = BTSE.Farming:addContextMenuSubMenu(context, getText("ContextMenu_Sow_Seed"), false, BTSE.Icons["farming"]);

        for groupName, groupedItems in pairs(BTSE.Farming["seedsByGroup"])
        do
            local targetMenu = seedMenu;

            if groupedItems["_count"] > 1
            then
                targetMenu = BTSE.Farming:addContextMenuSubMenu(seedMenu,
                    groupName .. " (" .. tostring(groupedItems["_count"]) .. ")",
                    BTSE.Farming:getGroupSeedCount(groupedItems, playerObj) == 0
                );
            end

            BTSE.Farming:createSeedGroupContextMenuItems(targetMenu, groupedItems, playerObj, furrow, square);
        end
    else
        vanillaFContext(self, context, furrow, square, playerObj);
    end
end

-- hook for veggie names in tooltips

if __classmetatables[_G["ObjectTooltip"].class]["__index"]["DrawTextCentre"]
then
    local vanillaDrawTextCentre = __classmetatables[_G["ObjectTooltip"].class]["__index"]["DrawTextCentre"];
    local farmingTrnsPattern = string.gsub("Farming_", "([^%w])", "%%%1") .. ".+";

    __classmetatables[_G["ObjectTooltip"].class]["__index"]["DrawTextCentre"] = function(self, font, str, p1, p2, p3, p4, p5, p6)
        for translation in string.gmatch(str, farmingTrnsPattern)
		do
			str = string.gsub(str, PARP:escapeString("Farming_") .. ".+", getText(translation));
		end

        return vanillaDrawTextCentre(self, font, str, p1, p2, p3, p4, p5, p6);
    end
end