-- --------------------------------------------------------------- --
--  LOCAL "GLOBALS" ---------------------------------------------- --
-- --------------------------------------------------------------- --
local installedMods = getActivatedMods();       -- list of running mods
local activeTag = "GasMask";                    -- Configuration. Must match OEQM_Logic.lua


-- --------------------------------------------------------------- --
--  FUNCTIONS ---------------------------------------------------- --
--      Imported from "ItemTweakerAPI" --------------------------- --
-- --------------------------------------------------------------- --
local TweakItemData = {};
local function doTweaks()
    for k,v in pairs(TweakItemData) do
        for t,y in pairs(v) do
            local item = ScriptManager.instance:getItem(k);
            if item ~= nil then
                item:DoParam(t.." = "..y);
                print("Tweaking Item: " .. k..": "..t..", "..y);
            end
        end
    end
end
local function TweakItem(itemName, itemProperty, propertyValue)
    if not TweakItemData[itemName] then
        TweakItemData[itemName] = {};
    end
    TweakItemData[itemName][itemProperty] = propertyValue;
end
Events.OnGameBoot.Add(doTweaks);


-- --------------------------------------------------------------- --
--  TWEAK KNOWN GASMASKS ----------------------------------------- --
-- --------------------------------------------------------------- --
-- Vanilla Game
TweakItem("Base.Hat_NBCmask", "tags", activeTag);

-- Authentic Z (Current & Lite editions)
if installedMods:contains("Authentic Z - Current") or installedMods:contains("AuthenticZLite") then
    TweakItem("AuthenticZClothing.Hat_GasMask", "tags", activeTag);
    TweakItem("AuthenticZClothing.CEDAHazmatSuit", "tags", activeTag);
    TweakItem("AuthenticZClothing.CEDAHazmatSuitBlack", "tags", activeTag);
    TweakItem("AuthenticZClothing.CEDAHazmatSuitBlue", "tags", activeTag);
    TweakItem("AuthenticZClothing.CEDAHazmatSuitRed", "tags", activeTag);
    TweakItem("AuthenticZClothing.HazmatSuit2", "tags", activeTag);
end

-- Authentic Z (Backpacks+)
if installedMods:contains("AuthenticZBackpacks+") then
    TweakItem("AuthenticZClothing.Hat_GasMask", "tags", activeTag);
end

-- Shark and Peach's Military Uniform improvements
if installedMods:contains("SMUI") then
    TweakItem("SMUIClothing.Hat_M17", "tags", activeTag);
    TweakItem("SMUIClothing.Hat_M40", "tags", activeTag);
    TweakItem("SMUIClothing.Hat_M17Doff", "tags", activeTag);
    TweakItem("SMUIClothing.Hat_M40Doff", "tags", activeTag);
end

-- Shark's Law Inforcement Overhaul
if installedMods:contains("SLEO") then
    TweakItem("SLEOClothing.Hat_PoliceM17", "tags", activeTag);
end

-- Brita's Armor Pack
if installedMods:contains("Brita_2") then
    TweakItem("Base.Hat_MCU_GasMask", "tags", activeTag);
    TweakItem("Base.Hat_M45_GasMask", "tags", activeTag);
    TweakItem("Base.Hat_M50", "tags", activeTag);
    TweakItem("Base.Hat_FM53", "tags", activeTag);
    TweakItem("Base.Hat_MSA_Gas_Mask", "tags", activeTag);
    TweakItem("Base.Hat_MSA_Gas_Mask_AMP", "tags", activeTag);
end

-- Swatpack
if installedMods:contains("Swatpack") then
    TweakItem("Base.Hat_SwatGasMask", "tags", activeTag);
end

-- Paw Low Loot
if installedMods:contains("PLLootF") then
    TweakItem("Base.Mask_HECU", "tags", activeTag);
end

--Undead Survivor
if installedMods:contains("UndeadSuvivor") then
    TweakItem("UndeadSurvivor.StalkerMask", "tags", activeTag);
    TweakItem("UndeadSurvivor.PrepperMask", "tags", activeTag);
    TweakItem("UndeadSurvivor.HeadhunterGasmask", "tags", activeTag);
    TweakItem("UndeadSurvivor.DeadlyHeadhunterGasmask", "tags", activeTag);
end

-- Scrap Armor
if installedMods:contains("ScrapArmor(new version)") then 
    TweakItem("Base.Hat_Rebreather", "tags", activeTag);
end

-- They Knew
if installedMods:contains("TheyKnew") then
    TweakItem("TheyKnew.MysteriousHazmat", "tags", activeTag);
end

-- Toxic Fog
if installedMods:contains("toxicfog") then
    TweakItem("Base.Hat_GasMask_Improvised", "tags", activeTag);
end

-- Stalker Armor 
if installedMods:contains("StalkerArmorPack") then
    TweakItem("Base.GP5GasMask", "tags", activeTag);
    TweakItem("Base.M40GasMask", "tags", activeTag);
    TweakItem("Base.PPM88", "tags", activeTag);
    TweakItem("Base.GP10Z", "tags", activeTag);
    TweakItem("Base.SovietPMG", "tags", activeTag);
    TweakItem("Base.CS2aGasMask", "tags", activeTag);
    TweakItem("Base.PBF1", "tags", activeTag);
    TweakItem("Base.PBF1CS", "tags", activeTag);
    TweakItem("Base.PBF1Duty", "tags", activeTag);
    TweakItem("Base.PBF1Freedom", "tags", activeTag);
    TweakItem("Base.PBF2", "tags", activeTag);
    TweakItem("Base.PBF2CS", "tags", activeTag);
    TweakItem("Base.PBF2Duty", "tags", activeTag);
    TweakItem("Base.PBF2Freedom", "tags", activeTag);
    TweakItem("Base.RespiratorGold", "tags", activeTag);
    TweakItem("Base.RespiratorSilver", "tags", activeTag);
    TweakItem("Base.RespiratorCS", "tags", activeTag);
    TweakItem("Base.RespiratorFreedom", "tags", activeTag);
    TweakItem("Base.RespiratorDuty", "tags", activeTag);
    TweakItem("Base.RespiratorMonolith", "tags", activeTag);
end

-- Asura Chi
if installedMods:contains("AsuraChi") then
    TweakItem("AsuraChi.chiGasMask", "tags", activeTag);
end
