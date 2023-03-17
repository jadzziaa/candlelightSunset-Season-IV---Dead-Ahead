---@diagnostic disable: undefined-global, lowercase-global, deprecated
--***********************************************************
--**                  NECROPOLISRP.NET                     **
--**			  File Author: github.com/buffyuwu	       **
--**                    Admin Logs                         **
--***********************************************************
--
--This logs common admin actions in the admins.txt located in your server's ./Logs directory
--Things logged from this code are marked with [Buffy Logs] in the .txt file to differentiate the additional entries from the basegame logging.

--mini scoreboard
local function getLogLocation()
	return tostring(round(getPlayer():getX(),0))..","..tostring(round(getPlayer():getY(),0))..","..tostring(round(getPlayer():getZ(),0))
end
local miniScoreboardUI = ISMiniScoreboardUI.onCommand
function ISMiniScoreboardUI:onCommand(player, command)
    miniScoreboardUI(self, player, command)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] MINI SCOREBOARD: "..tostring(getOnlineUsername()).." performed "..command.." on "..tostring(player.displayName)})
end
--admin panel
local adminPanelCreate = ISAdminPanelUI.create
function ISAdminPanelUI:create()
    adminPanelCreate(self)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." opened the admin panel"})
end

--what they click in the admin panel
local adminPanelButton = ISAdminPanelUI.onOptionMouseDown
function ISAdminPanelUI:onOptionMouseDown(button, x, y)
    adminPanelButton(self, button, x, y)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." clicked "..tostring(button.internal).." in the admin panel"})
end

--item list viewer specifics
local itemListViewer = ISItemsListViewer.initialise
function ISItemsListViewer:initialise()
    itemListViewer(self)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." opened the item list viewer"})
end
function ISItemsListTable:onAddItem(button, item)
    if button.internal == "OK" then
        for i=0,tonumber(button.parent.entry:getText()) - 1 do
            self:addItem(item);
        end
		sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." spawned "..tonumber(button.parent.entry:getText()).." "..item:getFullName().." at location: "..getLogLocation()})
    end
end
local itemListViewerAdd = ISItemsListTable.onOptionMouseDown
function ISItemsListTable:onOptionMouseDown(button, x, y)
    itemListViewerAdd(self, button, x, y)
    local item = button.parent.datas.items[button.parent.datas.selected].item
    if button.internal == "ADDITEM1" then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." spawned 1 "..item:getFullName().." at location: "..getLogLocation()})
    elseif button.internal == "ADDITEM2" then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." spawned 2 "..item:getFullName().." at location: "..getLogLocation()})
    elseif button.internal == "ADDITEM5" then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." spawned 5 "..item:getFullName().." at location: "..getLogLocation()})
    end
end

--admin powers ui
local adminPowers = ISAdminPowerUI.onClick
function ISAdminPowerUI:onClick(button)
    --first collect our current values
    local invisible = getPlayer():isInvisible()
    local godMode = getPlayer():isGodMod()
    local ghostMode = getPlayer():isGhostMode()
    local noclip = getPlayer():isNoClip()
    local timedActionInstantCheat = getPlayer():isTimedActionInstantCheat()
    local unlimitedCarry = getPlayer():isUnlimitedCarry()
    local unlimitedEndurance = getPlayer():isUnlimitedEndurance()
    local canSeeAll = getPlayer():isCanSeeAll()
    local networkTeleport = getPlayer():isNetworkTeleportEnabled()
    local hearAll = getPlayer():isCanHearAll()
    local zombiesDontAttack = getPlayer():isZombiesDontAttack()
    local ShowMPInfos = getPlayer():isShowMPInfos()
    local fastMove = ISFastTeleportMove.cheat
    local buildCheat = ISBuildMenu.cheat
    local farmCheat = ISFarmingMenu.cheat
    local healthCheat = ISHealthPanel.cheat
    local mechanicCheat = ISVehicleMechanics.cheat
    local moveableCheat = ISMoveableDefinitions.cheat

    adminPowers(self, button) --run the function
    if not button.internal == "SAVE" then return end

    --now lets see what changed
    if getPlayer():isInvisible() == true and not invisible then --is this different from the previous value? log it.
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on invisibility"})
    end
    if getPlayer():isInvisible() == false and invisible then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off invisibility"})

    end
    if getPlayer():isGodMod() == true and not godMode then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on godmode"})
    end
    if getPlayer():isGodMod() == false and godMode then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off godmode"})

    end
    if getPlayer():isGhostMode() == true and not ghostMode then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on ghost mode"})
    end
    if getPlayer():isGhostMode() == false and ghostMode then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off ghost mode"})

    end
    if getPlayer():isNoClip() == true and not noclip then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on noclip"})
    end
    if getPlayer():isNoClip() == false and noclip then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off noclip"})
    end
    if getPlayer():isTimedActionInstantCheat() == true and not timedActionInstantCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on timed action instant"})
    end
    if getPlayer():isTimedActionInstantCheat() == false and timedActionInstantCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off timed action instant"})

    end
    if getPlayer():isUnlimitedCarry() == true and not unlimitedCarry then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on unlimited carry"})
    end
    if getPlayer():isUnlimitedCarry() == false and unlimitedCarry then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off unlimited carry"})

    end
    if getPlayer():isUnlimitedEndurance() == true and not unlimitedEndurance then 
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on unlimited endurance"})
    end
    if getPlayer():isUnlimitedEndurance() == false and unlimitedEndurance then 
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off unlimited endurance"})

    end
    if getPlayer():isCanSeeAll() == true and not canSeeAll then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on ESP"})
    end
    if getPlayer():isCanSeeAll() == false and canSeeAll then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off ESP"})

    end
    if getPlayer():isNetworkTeleportEnabled() == true and not networkTeleport then 
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on network teleporting"})
    end
    if getPlayer():isNetworkTeleportEnabled() == false and networkTeleport then 
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off network teleporting"})

    end
    if getPlayer():isCanHearAll() == true and not hearAll then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on hearing everyone's voice chat"})
    end
    if getPlayer():isCanHearAll() == false and hearAll then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off hearing everyone's voice chat"})

    end
    if getPlayer():isZombiesDontAttack() == true and not zombiesDontAttack then 
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on zombiesDontAttack"})
    end
    if getPlayer():isZombiesDontAttack() == false and zombiesDontAttack then 
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off zombiesDontAttack"})

    end
    if getPlayer():isShowMPInfos() == true and not ShowMPInfos then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on showing MP info"})
    end
    if getPlayer():isShowMPInfos() == false and ShowMPInfos then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off showing MP info"})

    end
    if ISFastTeleportMove.cheat == true and not fastMove then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on LUDICROUS SPEED!! "})
    end
    if ISFastTeleportMove.cheat == false and fastMove then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off LUDICROUS SPEED!! and crashed into a wall"})

    end
    if ISBuildMenu.cheat == true and not buildCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on building cheats".." at location: "..getLogLocation()})
    end
    if ISBuildMenu.cheat == false and buildCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off building cheats".." at location: "..getLogLocation()})

    end
    if ISFarmingMenu.cheat == true and not farmCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on farming cheats".." at location: "..getLogLocation()})
    end
    if ISFarmingMenu.cheat == false and farmCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off farming cheats".." at location: "..getLogLocation()})

    end
    if ISHealthPanel.cheat == true and not healthCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on health panel cheats"})
    end
    if ISHealthPanel.cheat == false and healthCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off health panel cheats"})

    end
    if ISVehicleMechanics.cheat == true and not mechanicCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on mechanic cheats".." at location: "..getLogLocation()})
    end
    if ISVehicleMechanics.cheat == false and mechanicCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off mechanic cheats".." at location: "..getLogLocation()})

    end
    if ISMoveableDefinitions.cheat == true and not moveableCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled on moveable cheats".." at location: "..getLogLocation()})
    end
    if ISMoveableDefinitions.cheat == false and moveableCheat then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." toggled off moveable cheats".." at location: "..getLogLocation()})
    end
end

--hate to override this
function ISWhitelistModifyRow:onOptionMouseDown(button, x, y)
    if button.internal == "CLOSE" then
        self:setVisible(false);
        self:removeFromUIManager();
    end
    if button.internal == "UPDATE" then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] "..tostring(getOnlineUsername()).." made changes to the database"})
        local where = {}
        local query = {}
        for _,v in ipairs(self.buttonDatas) do
            local previousData = string.trim(self.data[v.columnName]);
            if v.type == "INTEGER" or v.type == "TEXT" then
                local data = string.trim(v:getText());
                if v.columnName == "accesslevel" then
                    if data == "admin" and getAccessLevel() ~= "admin" then
                        local modal = ISModalDialog:new(self.x + (self.width/2),self.y + (self.height/2), 250, 150, getText("IGUI_DbViewer_CantSetAdmin"), false, nil, nil, nil);
                        modal:initialise()
                        modal:addToUIManager()
                        return;
                    end
                end
                if self.data[v.columnName] and previousData ~= data then
                    table.insert(query, v.columnName)
                    table.insert(query, data)
                    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] ".."OLD value for "..v.columnName.." = "..previousData.." NEW value = "..data})
                elseif previousData ~= "" then
                    table.insert(where, v.columnName)
                    table.insert(where, previousData)
                    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] ".."OLD value for "..v.columnName.." = "..previousData.." NEW value = "..data})
                end
            elseif v.type == "BOOLEAN" then
                local value = "false";
                if v.selected == 1 then
                    value = "true";
                end
                if not previousData or previousData ~= value then
                    table.insert(query, v.columnName)
                    table.insert(query, value)
                    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] ".."OLD value for "..v.columnName.." = "..previousData.." NEW value = "..value})
                else
                    table.insert(where, v.columnName)
                    table.insert(where, previousData)
                    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] ".."OLD value for "..v.columnName.." = "..previousData.." NEW value = "..value})
                end
            end
        end
        local params = {}
        local queryStr = "UPDATE " .. self.tableName .. " SET "
        for i=1,#query,2 do
            queryStr = queryStr .. query[i] .. " = ?"
            table.insert(params, query[i+1])
            if i < #query - 1 then
                queryStr = queryStr .. ","
            end
        end
        local whereStr = " WHERE "
        for i=1,#where,2 do
            whereStr = whereStr .. where[i] .. " = ?"
            table.insert(params, where[i+1])
            if i < #where - 1 then
                whereStr = whereStr .. " AND "
            end
        end
        queryStr = queryStr .. whereStr;
        executeQuery(queryStr, params);
        self.view:clear();
        getTableResult(self.tableName, self.entriesPerPages);
        self:setVisible(false);
        self:removeFromUIManager();
    end
end

-- item editor
function ISItemEditorUI:onOptionMouseDown(button, x, y)
    if button.internal == "SAVE" then
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! ----------"..getOnlineUsername().." opened EDIT ITEM on: "..self.item:getDisplayName().."----------"})
        if self.item:getDisplayName() ~= self.name:getInternalText() then
            sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed NAME "..self.item:getDisplayName().." -> "..self.name:getInternalText()})
            self.item:setName(string.trim(self.name:getInternalText()));
        end
        if self.originalWeight ~= tonumber(self.weight:getInternalText()) then
            sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed Weight "..self.originalWeight.." -> "..self.weight:getInternalText()})
            self.item:setActualWeight(tonumber(string.trim(self.weight:getInternalText())));
            self.item:setCustomWeight(true);
        end
        if self.item:getCondition() ~= tonumber(self.condition:getInternalText()) then
            sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed CONDITION "..self.item:getCondition().." -> "..self.condition:getInternalText()})
        end
        self.item:setCondition(tonumber(string.trim(self.condition:getInternalText())));
		if (self.item:getConditionMax() - self.item:getCondition() == 0 ) and instanceof(self.item, "Clothing") then
			for i=1,BloodBodyPartType.MAX:index() do
				self.item:getVisual():removeHole(i-1)
			end
			self.admin:resetModelNextFrame();
			sendClothing(self.admin)
		end
        if self.originalColorR ~= self.color.backgroundColor.r or self.originalColorG ~= self.color.backgroundColor.g or self.originalColorB ~= self.color.backgroundColor.b then
            local color = Color.new(self.color.backgroundColor.r, self.color.backgroundColor.g, self.color.backgroundColor.b,1);
            self.item:setColor(color);
            self.item:getVisual():setTint(ImmutableColor.new(color));
            if self.admin:isEquipped(self.item) then
                self.admin:resetModelNextFrame();
            end
            sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed Color changed for "..self.name:getInternalText()})
            self.item:setCustomColor(true);
        end
        if self.isWeapon then
            if round(self.item:getMinDamage(),3) ~= round(tonumber(self.minDmg:getInternalText()),3) then
                sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed MIN DAMAGE "..round(self.item:getMinDamage(),3).." -> "..self.minDmg:getInternalText()})
            end
            if round(self.item:getMaxDamage(),3) ~= tonumber(round(self.maxDmg:getInternalText(),3)) then
                sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed MAX DAMAGE "..round(self.item:getMaxDamage(),3).." -> "..tonumber(round(self.maxDmg:getInternalText(),3))})
            end
            if round(self.item:getMinAngle(),3) ~= tonumber(round(self.minAngle:getInternalText(),3)) then
                sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed ANGLE "..round(self.item:getMinAngle(),3).." -> "..tonumber(round(self.minAngle:getInternalText(),3))})
            end
            if round(self.item:getMaxRange(),3) ~= tonumber(round(self.maxRange:getInternalText(),3)) then
                sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "itemEdits", logText = "[Buffy Logs] ITEM EDITED! "..getOnlineUsername().." changed RANGE "..round(self.item:getMaxRange(),3).." -> "..tonumber(round(self.maxRange:getInternalText(),3))})
            end
            self.item:setMinDamage(tonumber(string.trim(self.minDmg:getInternalText())));
            self.item:setMaxDamage(tonumber(string.trim(self.maxDmg:getInternalText())));
            self.item:setMinAngle(tonumber(string.trim(self.minAngle:getInternalText())));
            if self.item:isRanged() then
                self.item:setMinRangeRanged(tonumber(string.trim(self.minRange:getInternalText())));
            else
                self.item:setMinRange(tonumber(string.trim(self.minRange:getInternalText())));
            end
            self.item:setMaxRange(tonumber(string.trim(self.maxRange:getInternalText())));
            self.item:setAimingTime(tonumber(string.trim(self.aimingTime:getInternalText())));
            self.item:setRecoilDelay(tonumber(string.trim(self.recoilDelay:getInternalText())));
            self.item:setReloadTime(tonumber(string.trim(self.reloadTime:getInternalText())));
            self.item:setClipSize(tonumber(string.trim(self.clipSize:getInternalText())));
        end
        if self.isFood then
           self.item:setAge(tonumber(string.trim(self.age:getInternalText())));
           self.item:setBaseHunger(tonumber(string.trim(self.hunger:getInternalText())));
           self.item:setHungChange(self.item:getBaseHunger());
           self.item:setUnhappyChange(tonumber(string.trim(self.unhappy:getInternalText())));
           self.item:setBoredomChange(tonumber(string.trim(self.boredom:getInternalText())));
           self.item:setPoisonPower(tonumber(string.trim(self.poisonPower:getInternalText())));
           self.item:setOffAge(tonumber(string.trim(self.offAge:getInternalText())));
           self.item:setOffAgeMax(tonumber(string.trim(self.offAgeMax:getInternalText())));
           self.item:setCalories(tonumber(string.trim(self.calories:getInternalText())));
           self.item:setLipids(tonumber(string.trim(self.lipids:getInternalText())));
           self.item:setProteins(tonumber(string.trim(self.proteins:getInternalText())));
           self.item:setCarbohydrates(tonumber(string.trim(self.carbs:getInternalText())));
        end
        if self.isDrainable then
            self.item:setUsedDelta(tonumber(string.trim(self.usedDelta:getInternalText())));
        end
        self:setVisible(false);
        self:removeFromUIManager();
    end
    if button.internal == "CANCEL" then
        self:setVisible(false);
        self:removeFromUIManager();
    end
end

--vehicles
local spawnvehicleUI = ISSpawnVehicleUI.onClick
function ISSpawnVehicleUI:onClick(button)
    spawnvehicleUI(self,button)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." spawned a "..self:getVehicle().." at location: "..getLogLocation()})
end


function ISVehicleMechanics.onCheatGetKey(playerObj, vehicle)
	sendClientCommand(playerObj, "vehicle", "getKey", { vehicle = vehicle:getId() })
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." got a vehicle key from vehicle ID "..vehicle:getId()})
end

function ISVehicleMechanics.onCheatHotwire(playerObj, vehicle, hotwired, broken)
	sendClientCommand(playerObj, "vehicle", "cheatHotwire", { vehicle = vehicle:getId(), hotwired = hotwired, broken = broken })
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." hotwired/unhotwired vehicle ID "..vehicle:getId()})
end

function ISVehicleMechanics.onCheatRepair(playerObj, vehicle)
	sendClientCommand(playerObj, "vehicle", "repair", { vehicle = vehicle:getId() })
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." repaired vehicle ID "..vehicle:getId()})
end

function ISVehicleMechanics.onCheatRepairPart(playerObj, part)
	sendClientCommand(playerObj, "vehicle", "repairPart", { vehicle = part:getVehicle():getId(), part = part:getId() })
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." repaired part id "..part:getId().." on vehicle ID "..part:getVehicle():getId()})
end

function ISVehicleMechanics.onCheatSetConditionAux(target, button, playerObj, part)
	if button.internal ~= "OK" then return end
	local text = button.parent.entry:getText()
	local condition = tonumber(text)
	if not condition then return end
    local oldCondition = part:getCondition()
	condition = math.max(condition, 0)
	condition = math.min(condition, 100)
	local vehicle = part:getVehicle()
	sendClientCommand(playerObj, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = condition })
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." changed part condition for part ID "..part:getId().." on vehicle ID "..part:getVehicle():getId().." OLD CONDITION: "..oldCondition.." NEW CONDITION: "..condition})
end


function ISVehicleMechanics.onCheatSetContentAmountAux(target, button, playerObj, part)
	if button.internal ~= "OK" then return end
	local text = button.parent.entry:getText()
	local amount = tonumber(text)
	if not amount then return end
    local oldAmount = part:getContainerContentAmount()
	local vehicle = part:getVehicle()
	if isClient() then
		sendClientCommand(playerObj, "vehicle", "setContainerContentAmount", { vehicle = vehicle:getId(), part = part:getId(), amount = amount })
	else
		part:setContainerContentAmount(amount)
	end
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." changed GASOLINE for part ID "..part:getId().." on vehicle ID "..part:getVehicle():getId().." OLD Amount: "..oldAmount.." NEW Amount: "..amount})
end


function ISVehicleMechanics.onCheatRemoveAux(dummy, button, playerObj, vehicle)
	if button.internal == "NO" then return end
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." REMOVED vehicle ID "..vehicle:getId()})
	if isClient() then
		sendClientCommand(playerObj, "vehicle", "remove", { vehicle = vehicle:getId() })
	else
		vehicle:permanentlyRemove()
	end
end


function ISVehicleMechanics.onCheatToggle(playerObj)
	ISVehicleMechanics.cheat = not ISVehicleMechanics.cheat
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] VEHICLE CHEAT: "..getOnlineUsername().." toggled mechanic cheat!"})
end

--health panel
ISHealthPanel.onCheatItem = function(itemType, playerObj)
    playerObj:getInventory():AddItem(itemType)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] HEALTH PANEL CHEAT: "..getOnlineUsername().." spawned a "..tostring(itemType)})
end

ISHealthPanel.onCheat = function(bodyPart, action, player, otherPlayer)
    if otherPlayer == nil then
        ISHealthPanel.onCheatCurrentPlayer(bodyPart, action, player)
		sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] HEALTH PANEL CHEAT: "..getOnlineUsername().." toggled "..tostring(action).." at location index: "..tostring(BodyPartType.ToIndex(bodyPart:getType())).." on target player: "..tostring(player:getUsername())})
    else
        ISHealthPanel.onCheatOtherPlayer(bodyPart, action, player, otherPlayer)
		sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] HEALTH PANEL CHEAT: "..getOnlineUsername().." toggled "..tostring(action).." at location index: "..tostring(BodyPartType.ToIndex(bodyPart:getType())).." on target player: "..tostring(otherPlayer:getUsername())})
    end
	
end

--teleporting
DebugContextMenu.onTeleportValid = function(button, x, y, z)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] TELEPORT CHEAT: "..getOnlineUsername().." FROM -> "..getLogLocation().." TO -> "..tostring(round(x,0))..","..tostring(round(y,0))..","..tostring(round(z,0))})
	print("going to ", x, y, z)
	getPlayer():setX(tonumber(x));
	getPlayer():setY(tonumber(y));
	getPlayer():setZ(tonumber(z));
	getPlayer():setLx(tonumber(x));
	getPlayer():setLy(tonumber(y));
	getPlayer():setLz(tonumber(z));
end

function IsoRegionsWindow:onTeleport(worldX, worldY)
    local player = getSpecificPlayer(0)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] TELEPORT CHEAT: "..getOnlineUsername().." FROM -> "..getLogLocation().." TO -> "..tostring(round(worldX,0))..","..tostring(round(worldY,0))..",0"})
    player:setX(worldX)
    player:setY(worldY)
    player:setLx(worldX)
    player:setLy(worldY)
end

function ISWorldMap:onTeleport(worldX, worldY)
	local playerObj = getSpecificPlayer(0)
	if not playerObj then return end
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] TELEPORT CHEAT: "..getOnlineUsername().." FROM -> "..getLogLocation().." TO -> "..tostring(round(worldX,0))..","..tostring(round(worldY,0))..",0"})
	playerObj:setX(worldX)
	playerObj:setY(worldY)
	playerObj:setZ(0.0)
	playerObj:setLx(worldX)
	playerObj:setLy(worldY)
end
function ZombiePopulationWindow:onTeleport(worldX, worldY)
	local player = getSpecificPlayer(0)
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] TELEPORT CHEAT: "..getOnlineUsername().." FROM -> "..getLogLocation().." TO -> "..tostring(round(worldX,0))..","..tostring(round(worldY,0))..",0"})
	player:setX(worldX)
	player:setY(worldY)
	player:setLx(worldX)
	player:setLy(worldY)
end
function ISMiniMapInner:onTeleport(worldX, worldY)
	local playerObj = getSpecificPlayer(0)
	if not playerObj then return end
    sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "admin", logText = "[Buffy Logs] TELEPORT CHEAT: "..getOnlineUsername().." FROM -> "..getLogLocation().." TO -> "..tostring(round(worldX,0))..","..tostring(round(worldY,0))..",0"})
	playerObj:setX(worldX)
	playerObj:setY(worldY)
	playerObj:setZ(0.0)
	playerObj:setLx(worldX)
	playerObj:setLy(worldY)
end
