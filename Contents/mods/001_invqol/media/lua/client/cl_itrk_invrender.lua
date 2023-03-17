local itrk = require "cl_itrk"
local idup = require "cl_itrk_dupdec"
local irnd = require "cl_itrk_render"
local utils = require "cl_itrk_utils"

local tablewipe = table.wipe
local getTexture = getTexture
local ItemTypes = utils.Types

-- dragging, equipped, noequipped-selected, child, selected, notSelected
local trp = 0.75
local opacityPreset = {
    { 0.5, 0.8, 0.68, 0.5, 1, 0.5, 1 },
    { 0, trp, trp, trp, trp, 0, 1 },
    { 0.2, 0.8, 0.68, 0.2, 1, 0.8, 1 },
}
-- normal, bad, good
local nameColor = {
    { 1, 1, 1, 0.85 },
    { 1, 0.7, 0.7, 0.85 }
}
local maxItems = { 30, 10, 50, 100 }
local optionValues = {
    itrk_InventoryUpdateRate = 1,
    itrk_ItemDataUpdateRate = 1,
    itrk_MaxItemPerGroup = 1,
    itrk_OpacityPresets = 1,
    itrk_BookMarkStyle = 1,
    itrk_EquipStyle = 1,
    itrk_ControllerHighlight = 1,
    itrk_Booktrack = 1,
    itrk_EnableShowModdedGun = false,
    itrk_EnableTrackLitItems = true,
    itrk_EnableTrackMediaItems = true,
    itrk_EnableBadCondHighlight = true,
    itrk_EnableDrainableDetail = true,
    itrk_EnablePinItem = false,
    itrk_EnableEquipmentLine = true,
    itrk_EnableDelayedItemDataUpdate = true,
    itrk_EnableDelayedInventoryUpdate = false,
    itrk_ExperimentalTableWipe = false,
    itrk_EnableDetailedAttachments = false,
    itrk_EnableMagazineDetail = false,

    itrk_EnableTrackDuplicates = false,
    itrk_EnableTrackDuplicateLiteratures = true,
    itrk_EnableTrackDuplicateWeapons = false,
    itrk_EnableTrackDuplicateWeaponsComparison = false,
    itrk_EnableTrackDuplicateClothings = false,
    itrk_EnableTrackDuplicateFoods = false,
    itrk_EnableTrackDuplicateItems = false
}
local optionUpdateRates = {
    1000,
    2000,
    500,
    10
}
local maxRender = 20
local updRate = { 1000, 1000 }
local opset = opacityPreset[1]


-- region Assets for rendering
-- localizing assets because i want to die
local treeexpicon = getTexture("media/ui/triangle-down.png");
local treecolicon = getTexture("media/ui/triangle-right.png");
local equippedItemIcon = getTexture("media/ui/link-1.png");
local equippedInHotbar = getTexture("media/ui/link-none-1.png");
local moddedItemIcon = getTexture("media/ui/plus-green.png");
local poiItemIcon = getTexture("media/ui/dot-filled-green.png");
local brokenItemIcon = getTexture("media/ui/circle-backslash-red.png");
local frozenItemIcon = getTexture("media/ui/icon_frozen.png");
local poisonIcon = getTexture("media/ui/SkullPoison.png");
local favoriteStar = getTexture("media/ui/bookmark-yellow.png");
local rcpIcon = getTexture("media/ui/info-circled.png");
local lowlevelIcon = getTexture("media/ui/question-mark-circled.png");
local readIcon = getTexture("media/ui/check-circled-green.png");
local unreadIcon = getTexture("media/ui/info-circled.png");
local handIcon = getTexture("media/ui/hand.png");

local cmpEqualIcon = getTexture("media/ui/dot-filled.png");
local cmpGoodIcon = getTexture("media/ui/double-arrow-up.png");
local cmpBadIcon = getTexture("media/ui/double-arrow-down.png");
-- endregion

local slotFrames = {
    "media/ui/inner-shadow.png",
    "media/ui/slot-frame.png",
    "media/ui/slot-frame-b.png",
    "media/ui/slot-frame-c.png"
}
local attIcon = getTexture(slotFrames[2])

local bookmarkTextures = {
    "media/ui/bookmark-yellow.png",
    "media/ui/bookmark.png",
    "media/ui/heart-yellow.png",
    "media/ui/heart-red.png",
    "media/ui/heart-white.png",
    "media/ui/star-yellow.png",
    "media/ui/star-red.png",
    "media/ui/star-white.png",
    "media/ui/FavoriteStar.png",
}

local progress = {
    getTexture("media/ui/crcl/c1.png"),
    getTexture("media/ui/crcl/c2.png"),
    getTexture("media/ui/crcl/c3.png"),
    getTexture("media/ui/crcl/c4.png"),
    getTexture("media/ui/crcl/c5.png"),
    getTexture("media/ui/crcl/c6.png"),
    getTexture("media/ui/crcl/c7.png"),
    getTexture("media/ui/crcl/c8.png"),
    getTexture("media/ui/crcl/c9.png"),
    getTexture("media/ui/crcl/c10.png"),
    getTexture("media/ui/crcl/c11.png"),
    getTexture("media/ui/crcl/c12.png"),
}
progress[0] = getTexture("media/ui/crcl/c0.png")

-- These items are player made.
local dynamicBook = {
    -- ["Base.SkillRecoveryJournal"] = true
}


function itrk:applyOption(settings)
    for k, v in pairs(settings.options) do
        optionValues[k] = v
    end
    maxRender = maxItems[optionValues.itrk_MaxItemPerGroup or 1]
    opset = opacityPreset[optionValues.itrk_OpacityPresets or 1]
    favoriteStar = getTexture(bookmarkTextures[optionValues.itrk_BookMarkStyle or 1])
    updRate[2] = optionUpdateRates[optionValues.itrk_InventoryUpdateRate or 1] or 1000
    updRate[1] = optionUpdateRates[optionValues.itrk_ItemDataUpdateRate or 1] or 1000
end

do
    function __AlternativeIconRender(self)
        local xpad = 10;
        local ypad = 10;
        local iw = 40;
        local ih = 40;
        local xmax = math.floor((self.width - (xpad * 2)) / iw);
        -- local ymax = math.floor((self.height - (ypad * 2)) / ih);
        local xcount = 0;
        local ycount = 0;
        local it = self.inventory:getItems();
        for i = 0, it:size() - 1 do
            local item = it:get(i);
            self:drawTexture(item:getTex(), (xcount * iw) + xpad + 4, (ycount * ih) + ypad + 4, 1, 1, 1, 1);

            xcount = xcount + 1;

            if xcount >= xmax then
                xcount = 0;
                ycount = ycount + 1;
            end
        end
    end

    local function formattedItemName(v, item, cnt)
        return (cnt > 2) and item:getName() .. " (" .. (cnt - 1) .. ")" or item:getName();
    end

    -- region Cached Type chekcer
    -- to avoid calling Java-Lua Interface too often, using localized verison of checker
    -- todo: empty cache if there is more than 100-1000 items in the cache.
    local checkType = utils.checkType
    -- endregion

    do
        -- ref and localize rendering functions to get better performances
        local renderTime = 0
        local getPlayerHotbar = getPlayerHotbar

        -- region Localized item state checker
        -- You can't just Unread things unless you die.
        -- Exception were made for the video.
        local readCheckCache = {}
        local vidCheckCache = {}
        local rcpCheckCache = {}
        local tempCheckCache = {}
        local ilTrait = nil
        Events.OnPlayerDeath.Add(function()
            tablewipe(readCheckCache)
            ilTrait = nil
        end) -- ofc
        Events.OnCreatePlayer.Add(function(pid)
            local player = getSpecificPlayer(pid)
            if player then
                ilTrait = ilTrait or player:HasTrait("Illiterate")
            end
        end)
        Events.EveryDays.Add(function()
            vidCheckCache = {}
            tempCheckCache = {}
        end)
        -- I know this is bad but i can't think of good event to hook on
        -- OnContainerUpdate get called too frequently.
        -- Events.OnContainerUpdate.Add(function()
        -- end)
        local perkCache = {}
        Events.LevelPerk.Add(function()
            perkCache = {}
        end)
        -- endregion

        local methodCache = {
            drawtexture       = nil,
            drawtexturescaled = nil,
            drawrect          = nil,
            drawtext          = nil,
            gmx               = nil,
            gmy               = nil,
            gys               = nil,
            gh                = nil,
        }
        --local drawtext, drawtexture, drawtexturescaled, drawrect, gmx, gmy, gys, gh
        local paneCache = {
        }

        local function cacheMethods(self)
            -- region Localized variables
            methodCache.drawtexture       = methodCache.drawtexture or self.drawTexture
            methodCache.drawtexturescaled = methodCache.drawtexturescaled or self.drawTextureScaledAspect
            methodCache.drawrect          = methodCache.drawrect or self.drawRectStatic
            methodCache.drawtext          = methodCache.drawtext or self.drawText
            methodCache.gmx               = methodCache.gmx or self.getMouseX
            methodCache.gmy               = methodCache.gmy or self.getMouseY
            methodCache.gys               = methodCache.gys or self.getYScroll
            methodCache.gh                = methodCache.gh or self.getHeight
        end

        local function cacheItemWepData(self, item, cIt)
            return irnd:cacheItemWeaponData(cIt, item)
        end

        local function cacheItemFreezing(self, item, cIt)
            cIt.frTime = item:getFreezingTime()
            if cIt.frTime <= 0 then return false end
            return true
        end

        local function cacheItemMelting(self, item, cIt)
            cIt.mtTime = item:getMeltingTime()
            if cIt.mtTime <= 0 then return false end
            return true
        end

        local function cacheItemCondition(self, item, cIt)
            cIt.cond = item:getCondition()
            cIt.condMax = item:getConditionMax()
            cIt.condFactor = cIt.cond / cIt.condMax
        end

        local function cacheItemCook(self, item, cIt)
            cIt.isCookable = item:getCookingTime()
            cIt.heat = cIt.heat or item:getHeat()
            if (not cIt.isCookable or cIt.heat <= 1.6) then return false end
            cIt.invHeat = cIt.invHeat or item:getInvHeat()
            cIt.itemHeat = cIt.itemHeat or item:getItemHeat()
            cIt.ckTime = item:getCookingTime()
            cIt.ckMTC = item:getMinutesToCook()
            cIt.ckMTB = item:getMinutesToBurn()
            return true
        end

        local notMagazine = {}
        local function cacheMagazine(self, item, cIt)
            if notMagazine[cIt.type] then return false end
            cIt.magMax = item:getMaxAmmo()
            if cIt.magMax <= 0 then
                notMagazine[cIt.type] = true
                return false
            end
            cIt.magCur = item:getCurrentAmmoCount()
            cIt.magFctOne = cIt.magCur / cIt.magMax
            cIt.magFct = math.ceil((cIt.magFctOne) * 12)
            return true
        end

        local mg = 2
        local mgg = mg * 2
        local function drawAttachment(self, mc, item, x, y, wh, i)
            if item then
                local tex = item:getTex();
                if tex then
                    local xx, yy = x - wh * (i + 1) - 5 * i, y
                    self:drawTextureScaledAspect(attIcon, xx - mg, yy - mg, wh + mgg, wh + mgg, 1);
                    self:drawTextureScaledAspect(tex, xx, yy, wh, wh, 1, 1, 1, 1);
                    return i + 1
                end
            end
            return i
        end

        local getText = getText
        local function drawItemDetails(self, item, y, xoff, yoff, cIt, displayWid, texWH, texMgn)
            if not item then return end
            local mc = methodCache

            local name = item:getName()
            local hdrHgt = self.headerHgt
            local top = hdrHgt + y + yoff
            local fgBar = { r = 0.0, g = 0.6, b = 0.0, a = 0.7 }
            local fgText = { r = 0.5, g = 0.5, b = 0.8, a = 0.5 }
            local x, y = 56 + xoff, top + (self.itemHgt - self.fontHgt) / 2

            if cIt.isWeapon then
                cacheItemCondition(self, item, cIt)
                self:drawTextAndProgressBar(
                    string.format("%d / %d (%d%s)", cIt.cond, cIt.condMax, cIt.condFactor * 100, "%"), cIt.condFactor,
                    xoff, top, fgText, fgBar
                )

                if optionValues.itrk_EnableDetailedAttachments and cacheItemWepData(self, item, cIt) and cIt.isRanged and cIt.atAny then
                    local xx, yy = displayWid + xoff - 8, top + texMgn
                    local i      = drawAttachment(self, mc, cIt.atScope, xx, yy, texWH, 0)
                    i            = drawAttachment(self, mc, cIt.atClip, xx, yy, texWH, i)
                    i            = drawAttachment(self, mc, cIt.atSling, xx, yy, texWH, i)
                    i            = drawAttachment(self, mc, cIt.atStock, xx, yy, texWH, i)
                    i            = drawAttachment(self, mc, cIt.atRecPad, xx, yy, texWH, i)
                    i            = drawAttachment(self, mc, cIt.atCanon, xx, yy, texWH, i)
                end
            elseif checkType(item, ItemTypes.Drain) then
                if optionValues.itrk_EnableDrainableDetail then
                    local c, cm, cf = item:getDrainableUsesInt(), math.ceil(1 / item:getUseDelta()), item:getUsedDelta()
                    self:drawTextAndProgressBar(string.format("%d / %d (%d%s)", c, cm, cf * 100, "%"), cf, xoff, top, fgText, fgBar)
                else
                    self:drawTextAndProgressBar(getText("IGUI_invpanel_Remaining"), item:getUsedDelta(), xoff, top, fgText, fgBar)
                end
            elseif cIt.isFood then
                if cacheItemFreezing(self, item, cIt) then
                    local ft = cIt.frTime
                    local t = getText("IGUI_invpanel_FreezingTime") .. ":"
                    local text = string.format("%s %d%s", t, ft, "%")
                    mc.drawtext(self, text, x, y, fgText.a, fgText.r, fgText.g + ft / 100 * 0.5, fgText.b, self.font);
                elseif cacheItemMelting(self, item, cIt) then
                    local ft = cIt.mtTime
                    local t = getText("IGUI_invpanel_MeltingTime") .. ":"
                    local text = string.format("%s %d%s", t, ft, "%")
                    mc.drawtext(self, text, x, y, fgText.a, fgText.r, fgText.g + ft / 100 * 0.5, fgText.b, self.font);
                elseif item:isBurnt() then
                    mc.drawtext(self, getText("IGUI_invpanel_Burnt"), x, y, fgText.a + 0.4, fgText.r, fgText.g, fgText.b, self.font);
                elseif cacheItemCook(self, item, cIt) then
                    local ct, mtc, mtb = cIt.ckTime, cIt.ckMTC, cIt.ckMTB

                    local f = ct / mtc;
                    local s = getText("IGUI_invpanel_Cooking") .. ":"
                    if ct > mtc then
                        s = getText("IGUI_invpanel_Burning") .. ":"
                        f = (ct - mtc) / (mtb - mtc);
                        fgText.a = fgText.a + f
                    else
                        fgText.r = fgText.r + f
                    end

                    local text = string.format("%s %d%s", s, f * 100, "%")
                    mc.drawtext(self, text, x, y, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
                else
                    mc.drawtext(self, name, x, y, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
                end
            elseif optionValues.itrk_EnableMagazineDetail and cacheMagazine(self, item, cIt) then
                local tt = texWH * 0.9
                local txt = string.format("%d / %d (%d%s)", cIt.magCur, cIt.magMax, cIt.magFctOne * 100, "%")
                self:drawTextureScaledAspect(progress[cIt.magFct], x, y + texWH * 0.05 - 2, tt, tt, 1, 1, cIt.magFctOne * 2, cIt.magFctOne * 2)
                -- self:drawTextureScaledAspect(progress[cIt.magFct], x, y+texWH*0.05-2, tt, tt, 1, 1, cIt.magFctOne*2, 1)
                mc.drawtext(self, txt, texWH + 8 + x, y, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
            else
                mc.drawtext(self, name, x, y, fgText.a, fgText.r, fgText.g, fgText.b, self.font);
            end
        end

        local function updateContainerItems(self, doDragged, shouldUpdate, player)
            if not doDragged then
                if optionValues.itrk_ExperimentalTableWipe then
                    self.items = {}
                else
                    tablewipe(self.items)
                end

                if shouldUpdate and self.inventory:isDrawDirty() then
                    self:refreshContainer()
                end
            end
        end

        local upd = { false, false } -- itemData, inventory
        local lastUpd = { 0, 0 }
        local lastItemCount, lastDuplicateUpdate, duplicateUpdateRate = 0, 0, 1000
        function __AlternativeItemRender(self, doDragged)
            cacheMethods(self)
            local mc             = methodCache
            local player         = getSpecificPlayer(self.player)
            local eqLine, eqDone = false, false
            local tt = getTimeInMillis()

            for i = 1, 2 do
                if lastUpd[i] < tt then
                    lastUpd[i] = tt + updRate[i]
                    upd[i] = true
                else
                    upd[i] = false
                end
            end

            self:updateScrollbars();

            updateContainerItems(self, doDragged, not optionValues.itrk_EnableDelayedInventoryUpdate or upd[2])

            local checkDraggedItems = false
            local dgi = self.draggedItems
            if doDragged and self.dragging ~= nil and self.dragStarted then
                dgi:update()
                checkDraggedItems = true
            end

            -- if not doDragged then
            --     -- background of item icon
            --     self:drawRectStatic(0, 0, self.column2, self.height, 0.6, 0, 0, 0);
            -- end
            local y, alt = 0, false;

            local itemslist = self.itemslist
            if not itemslist then
                self:refreshContainer();
                itemslist = self.itemslist
            end

            -- local totDrag                 = ISMouseDrag.dragging and #ISMouseDrag.dragging > 0
            local hh                  = self.headerHgt
            local msx, msy, scY, pHgt = mc.gmx(self), mc.gmy(self), mc.gys(self), mc.gh(self)
            local ih                  = self.itemHgt
            local scrollBarWid        = self:isVScrollBarVisible() and 13 or 0
            local displayWid          = self.column4 - scrollBarWid
            local hl                  = self.highlightItem
            local font                = self.font
            local sel                 = self.selected
            local clp                 = self.collapsed
            local texscale            = self.texScale
            local auxDXY              = math.ceil(20 * texscale)
            local drawdetail          = drawItemDetails
            local hotbar              = getPlayerHotbar(self.player)
            local doController        = self.doController
            local joySel              = (self.joyselection and self.joyselection + 1 or 0)
            -- endregion


            local idx = 0
            local tstk = -ih
            local itstimetostop = false
            local texWH = ih - 2
            texWH = (texWH < 32) and texWH or 32
            local texMgn = (ih - texWH) / 2
            local itemCnt = #itemslist
            local isChar = self.parent and self.parent.onCharacter or nil

            if optionValues.itrk_EnableTrackDuplicates and isChar and not doDragged and lastItemCount ~= itemCnt and lastDuplicateUpdate < tt then
                lastDuplicateUpdate = tt + duplicateUpdateRate
                lastItemCount = itemCnt
                idup:rememberInventory(player, optionValues)
            end

            for i = 1, itemCnt do
                local v = itemslist[i]
                local itsl, name, its = v.count, v.name, v.items
                local clsp = clp and clp[name]

                local mxIter = (itsl > maxRender and maxRender or itsl)
                local adh = ih * (clsp and 1 or mxIter + 1)
                if (tstk + adh >= -scY - ih and not itstimetostop) then
                    -- Go through each item in stack..
                    for ii = 1, mxIter do
                        local first, single = ii == 1, itsl > 2
                        if first or not clsp then -- (not (not first and clsp))
                            local cIt                              = {} -- item state cache
                            y                                      = y + 1;
                            local v2                               = its[ii]
                            local item, doIt, xoff, yoff           = v2, true, 0, 0;
                            tstk                                   = tstk + ih
                            cIt.isFood, cIt.isClothing = checkType(item, ItemTypes.Food), checkType(item, ItemTypes.Clothing)

                            -- bruh
                            if not doDragged then
                                idx = idx + 1
                                self.items[idx] = first and v or item -- we can do this better.

                                if not optionValues.itrk_EnableDelayedItemDataUpdate or upd[1] then
                                    if cIt.isFood then item:updateAge() end
                                    if cIt.isClothing then item:updateWetness() end
                                end
                            end

                            local selYp, isDragging = sel and sel[y] or nil, false
                            if self.dragging and selYp and self.dragStarted then
                                xoff = msx - self.draggingX;
                                yoff = msy - self.draggingY;

                                if not doDragged then
                                    doIt = false;
                                else
                                    self:suspendStencil();
                                    isDragging = true
                                end
                            elseif doDragged then
                                doIt = false
                            end

                            local itemPos = tstk + scY
                            local var5 = tstk + hh
                            if not isDragging and ((itemPos < -ih) or (itemPos > pHgt)) then
                                doIt = false
                                itstimetostop = itemPos > pHgt
                                -- not going to stop
                                -- if we stop, the item insertion will get halt
                            end

                            if doIt then
                                cIt.type = item:getType()
                                if first and not doDragged then
                                    mc.drawtexture(self, not clsp and treeexpicon or treecolicon, 2, tstk + hh + 5 + yoff, 1, 1, 1, 0.8);
                                end

                                cIt.isWater = checkType(item, ItemTypes.Combo)
                                local isWaterFood = cIt.isFood or cIt.isWater
                                local color = { 0.3, 0.3, 0.3, isDragging and opset[1] or (first and (v.equipped and opset[2] or opset[3]) or opset[4]) * (selYp and opset[5] or opset[6]) }

                                -- region Background Color
                                if selYp and not hl and checkDraggedItems and dgi:cannotDropItem(item) then
                                    color[1] = 1
                                    color[2] = 0
                                    color[3] = 0
                                elseif (hl and hl == cIt.type) or (doController and joySel == y) then
                                    color[4] = optionValues.itrk_ControllerHighlight == 2
                                        and 0.6
                                        or 0.4 + math.abs((math.sin(renderTime / 5000) * 0.25))
                                elseif isWaterFood then
                                    cIt.heat, cIt.itemHeat = item:getHeat(), item:getItemHeat()
                                    cIt.monHeat = cIt.heat ~= 1 or cIt.itemHeat ~= 1
                                    cIt.isHot = cIt.heat > 1 or cIt.itemHeat > 1

                                    if cIt.monHeat then
                                        cIt.invHeat = item:getInvHeat()
                                        local ht = cIt.invHeat
                                        local invHeat = ht < 0 and -ht or ht -- ditch math abs because i want to die
                                        local idx = (cIt.isHot and 1 or 3)
                                        color[4] = color[4] + invHeat * 0.1
                                        color[idx] = color[idx] + invHeat * 0.5
                                    end
                                end

                                mc.drawrect(self, xoff, scY + var5 + yoff, self.column4, ih, color[4], color[1], color[2], color[3])
                                -- endregion

                                -- Jesus christ, Until i remove all of this, I cannot say im doing my job.
                                local tex = item:getTex()
                                if tex then
                                    local var1 = (20 + auxDXY + xoff)
                                    local var2 = var1 + 1

                                    if (itsl > 2 or first) or (itsl == 1 and first) then
                                        self:drawTextureScaledAspect(tex, xoff + auxDXY, var5 + 1 + yoff + texMgn, texWH, texWH, first and 1 or 0.7, item:getR(), item:getG(), item:getB());
                                    end

                                    cIt.isWeapon = checkType(item, ItemTypes.Weapon)
                                    if first then
                                        local yy = var5 + auxDXY - 2 + yoff
                                        if cIt.isWeapon then
                                            cIt.isBroken = item:isBroken()

                                            if cIt.isBroken then
                                                mc.drawtexture(self, brokenItemIcon, var1, yy - 1, 1, 1, 1, 1);
                                            elseif v.equipped or player:isEquipped(item) then
                                                mc.drawtexture(self, equippedItemIcon, var1, yy, 1, 1, 1, 1);
                                                if not eqDone and v.equipped then
                                                    eqLine = true
                                                    eqDone = true
                                                end
                                            elseif hotbar and hotbar:isInHotbar(item) then
                                                mc.drawtexture(self, equippedInHotbar, var1, yy, 1, 1, 1, 1);
                                            end

                                            -- todo: find more efficient way to track this thing
                                            if optionValues.itrk_EnableShowModdedGun and clsp and cacheItemWepData(self, item, cIt) then
                                                -- is range check
                                                mc.drawtexture(self, poiItemIcon, xoff + 12, yy, 1, 1, 1, 1);
                                            end
                                        elseif not cIt.isFood then
                                            if v.equipped or player:isEquipped(item) then
                                                mc.drawtexture(self, equippedItemIcon, var1, yy, 1, 1, 1, 1);
                                                if not eqDone and v.equipped then
                                                    eqLine = true
                                                    eqDone = true
                                                end
                                            elseif hotbar and hotbar:isInHotbar(item) then
                                                mc.drawtexture(self, equippedInHotbar, var1, yy, 1, 1, 1, 1);
                                            elseif not ilTrait and checkType(item, ItemTypes.Literature) and optionValues.itrk_EnableTrackLitItems then
                                                cIt.isBook = true
                                                cIt.ftype = item:getFullType()
                                                local ft = cIt.ftype
                                                if not rcpCheckCache[ft] then
                                                    local rcp = item:getTeachedRecipes()
                                                    rcpCheckCache[ft] = (rcp and not rcp:isEmpty())
                                                end

                                                -- todo: remove cache after death
                                                if readCheckCache[ft] then
                                                    mc.drawtexture(self, readIcon, var1, yy, 1, 1, 1, 1);
                                                elseif SkillBook[item:getSkillTrained()] then
                                                    if item:getNumberOfPages() <= player:getAlreadyReadPages(ft) then
                                                        mc.drawtexture(self, readIcon, var1, yy, 1, 1, 1, 1);
                                                        readCheckCache[ft] = true
                                                    else
                                                        if perkCache[ft] then
                                                            mc.drawtexture(self, unreadIcon, var1, yy, 1, 1, 1, 1)
                                                        else
                                                            local perk = SkillBook[item:getSkillTrained()].perk
                                                            if not (item:getLvlSkillTrained() > player:getPerkLevel(perk) + 1) and
                                                                not (item:getMaxLevelTrained() < player:getPerkLevel(perk) + 1) then
                                                                perkCache[ft] = true
                                                            end
                                                        end
                                                    end
                                                elseif rcpCheckCache[ft] then
                                                    local aread = tempCheckCache[ft] and tempCheckCache[ft] == 2 or player:getAlreadyReadBook():contains(ft)
                                                    mc.drawtexture(self, aread and readIcon or rcpIcon,
                                                        var1, yy, 1, 1, 1, 1);
                                                    readCheckCache[ft] = aread
                                                    tempCheckCache[ft] = aread and 2 or 1 -- in render, you should check only once.
                                                elseif dynamicBook[ft] then
                                                    if item:getNumberOfPages() < 0 then
                                                        mc.drawtexture(self, unreadIcon, var1, yy, 1, 1, 1, 1)
                                                    elseif item:getNumberOfPages() <= item:getAlreadyReadPages() then
                                                        mc.drawtexture(self, readIcon, var1, yy, 1, 1, 1, 1);
                                                    else 
                                                        mc.drawtexture(self, unreadIcon, var1, yy, 1, 1, 1, 1)
                                                    end
                                                end
                                            else
                                                if optionValues.itrk_EnableTrackMediaItems then
                                                    if vidCheckCache[item] then
                                                        mc.drawtexture(self, readIcon, var1, yy, 1, 1, 1, 1);
                                                    elseif item.getMediaData then
                                                        local media = item:getMediaData()
                                                        if media and getZomboidRadio():getRecordedMedia():hasListenedToAll(player, media) then
                                                            mc.drawtexture(self, readIcon, var1, yy, 1, 1, 1, 1);
                                                            vidCheckCache[item] = true
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            if cIt.isFood then
                                                if item:isFrozen() then
                                                    mc.drawtexture(self, frozenItemIcon, 3 + var1, var5 + auxDXY - 1 + yoff, 1, 1, 1, 1);
                                                end
                                                if player:isKnownPoison(item) then
                                                    mc.drawtexture(self, poisonIcon, var1, var5 + auxDXY - 1 + yoff, 1, 1, 1, 1);
                                                end
                                            elseif cIt.isWater and item:isTaintedWater() then
                                                mc.drawtexture(self, poisonIcon, var1, var5 + auxDXY - 1 + yoff, 1, 1, 1, 1);
                                            end
                                        end
                                        if isChar then
                                            if item:isFavorite() then
                                                mc.drawtexture(self, favoriteStar, var1, var5 - 1 + yoff, 1, 1, 1, 1);
                                            end
                                        elseif optionValues.itrk_EnableTrackDuplicates then
                                            -- less access, more good.
                                            if cIt.isWeapon and optionValues.itrk_EnableTrackDuplicateWeapons then
                                                local dItem = idup:findDuplicate(player, item)
                                                if dItem then
                                                    if optionValues.itrk_EnableTrackDuplicateWeaponsComparison then
                                                        cIt.condition = cIt.condition or item:getCondition()
                                                        local dCondition = dItem:getCondition()

                                                        if cIt.condition < dCondition then
                                                            mc.drawtexture(self, cmpBadIcon, var2 - 1, var5 + yoff, 1, 1, 0.5, 0.5);
                                                        elseif cIt.condition > dCondition then
                                                            mc.drawtexture(self, cmpGoodIcon, var2 - 1, var5 + yoff, 1, 0.5, 1, 0.5);
                                                        else
                                                            mc.drawtexture(self, cmpEqualIcon, var2 - 1, var5 + yoff, 1, 0.55, 0.55, 0.55);
                                                        end
                                                    else
                                                        mc.drawtexture(self, handIcon, var2 - 1, var5 + yoff, 1, 0.55, 0.55, 0.85);
                                                    end
                                                end
                                            elseif (cIt.isClothing and optionValues.itrk_EnableTrackDuplicateClothings) or
                                                (cIt.isFood and optionValues.itrk_EnableTrackDuplicateFoods) or
                                                (cIt.isBook and optionValues.itrk_EnableTrackDuplicateLiteratures) or
                                                (optionValues.itrk_EnableTrackDuplicateItems) then
                                                local dItem = idup:findDuplicate(player, item)
                                                if dItem then
                                                    mc.drawtexture(self, handIcon, var2 - 1, var5 + yoff, 1, 0.55, 0.55, 0.85);
                                                end
                                            end
                                        end
                                    elseif single or (doDragged and not first and itsl > 2) then
                                        local yy = var5 + auxDXY + yoff
                                        if cIt.isWeapon then
                                            cIt.isBroken = item:isBroken()
                                            if cIt.isBroken then
                                                mc.drawtexture(self, brokenItemIcon, var1, yy - 1, 1, 1, 1, 1);
                                            elseif v.equipped or player:isEquipped(item) then
                                                mc.drawtexture(self, equippedItemIcon, var1, yy, 1, 1, 1, 1);
                                            end

                                            -- todo: find more efficient way to track this thing
                                            if optionValues.itrk_EnableShowModdedGun and cacheItemWepData(self, item, cIt) then
                                                mc.drawtexture(self, moddedItemIcon, var2, yy - 5, 1, 1, 1, 1);
                                            end
                                        elseif not cIt.isFood then
                                            if v.equipped or player:isEquipped(item) then
                                                mc.drawtexture(self, equippedItemIcon, var2, var5 + auxDXY + yoff, 1, 1, 1, 1);
                                            end
                                        else
                                            if cIt.isFood and item:isFrozen() then
                                                mc.drawtexture(self, frozenItemIcon, 3 + var2, var5 + auxDXY - 1 + yoff, 1, 1, 1, 1);
                                            end
                                        end
                                        if isChar then
                                            if item:isFavorite() then
                                                mc.drawtexture(self, favoriteStar, var2, var5 - 1 + yoff, 1, 1, 1, 1);
                                            end
                                        end
                                    end
                                end

                                local textDY = (ih - self.fontHgt) / 2
                                local var6 = hh + textDY + yoff
                                local itemName = formattedItemName(v, item, itsl)

                                if first then
                                    local col = nameColor[(optionValues.itrk_EnableBadCondHighlight and cIt.isWeapon and cIt.isBroken) and 2 or 1]
                                    mc.drawtext(self, itemName, self.column2 + 8 + xoff, tstk + var6, col[1], col[2], col[3], col[4], font);
                                end
                                if optionValues.itrk_EnableEquipmentLine and not doDragged and eqLine then
                                    mc.drawrect(self, xoff, scY + var5 + yoff, self.column4, 1, opset[7], color[1], color[2], color[3])
                                    eqLine = nil
                                end

                                local delta = item:getJobDelta()
                                if delta > 0 and (not first or clsp) then
                                    mc.drawrect(self, xoff, scY + var5 + yoff, displayWid * delta, ih, 0.2, 0.4, 1.0, 0.3);
                                end

                                local dcat = item:getDisplayCategory()
                                if first and not doDragged then
                                    mc.drawtext(self, dcat and getText(utils.GUIPrefix .. dcat) or getText(utils.GUIPrefix .. item:getCategory()),
                                        self.column3 + 8 + xoff, tstk + var6, 0.6, 0.6, 0.8, 1.0, font);
                                elseif not first then
                                    drawdetail(self, item, tstk, xoff, yoff, cIt, displayWid, texWH, texMgn);
                                end

                                alt = first and not (alt or false) or alt

                                if (not optionValues.itrk_EnableDelayedItemDataUpdate or upd[1]) and first and clsp and cIt.isFood then
                                    for iii = 1, mxIter do
                                        its[iii]:updateAge()
                                    end
                                    break
                                end
                            end
                        end
                    end
                else
                    -- bruh
                    if not doDragged then
                        for ii = 1, clsp and 1 or mxIter do
                            idx = idx + 1
                            self.items[idx] = (ii == 1) and v or its[ii] -- we can do this better.
                        end
                    end
                    y = y + (clsp and 1 or mxIter);
                    tstk = tstk + adh - (clsp and 0 or ih)
                end
            end

            self:setScrollHeight(tstk + ih * 2);
            self:setScrollWidth(0);

            if self.draggingMarquis then
                local mqx, mqy = self.draggingMarquisX, self.draggingMarquisY
                local mw, mh = mqx - msx, mqy - msy
                self:drawRectBorder(mqx, mqy, -mw, -mh, 0.8, 1, 1, 1)
            end
            return true
        end
    end
end
