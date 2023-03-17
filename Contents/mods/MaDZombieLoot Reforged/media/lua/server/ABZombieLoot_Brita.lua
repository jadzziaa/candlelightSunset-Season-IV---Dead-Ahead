require "ABZombieLoot"

local function addBritaLoot(lootTable)
  if getActivatedMods():contains("Brita") then
    local GunBagMultiplier = SandboxVars.AirbobbelzLoot.GunBagMultiplier
    local OtherGunsMultiplier = SandboxVars.AirbobbelzLoot.OtherGunsMultiplier
    local AmmoBoxMultiplier = SandboxVars.AirbobbelzLoot.AmmoBoxMultiplier

    print("ABLOOT Brita Integration")
    ------------ MOD TABLE HERE ---------------------

    -- add brita small gun cases to selection of gun bags to roll
    local britaGunBags = {
      {item = "Case_Small1", chance = AB_get_chance(0.01, GunBagMultiplier), isGunCase = true},
      {item = "Case_Small2", chance = AB_get_chance(0.01, GunBagMultiplier), isGunCase = true},
      {item = "Case_Small3", chance = AB_get_chance(0.01, GunBagMultiplier), isGunCase = true},
      {item = "Case_Small4", chance = AB_get_chance(0.01, GunBagMultiplier), isGunCase = true},
      {item = "Case_Small5", chance = AB_get_chance(0.01, GunBagMultiplier), isGunCase = true},
      {item = "Case_Small6", chance = AB_get_chance(0.01, GunBagMultiplier), isGunCase = true},
      {item = "Case_Small7", chance = AB_get_chance(0.01, GunBagMultiplier), isGunCase = true}
    }
    -- if we merge, vanilla gun bags will still appear, we probably don't want that (?)
    -- AB_merge_into(lootTable.gunBags.rollOne[1], {
    lootTable.gunBags.rollOne[1] = britaGunBags

    if not A26ProcDistro or not A26ProcDistro.list or not A26ProcDistro.list.GunStoreGuns then
      print("AB LOOT: Error reading Brita's mod gun list: A26ProcDistro not found")
      return
    end

    -- add brita guns (gun store distribution) to 'otherGuns' AB loot distro
    local britaGuns = AB_get_distro_for_vanilla_table(A26ProcDistro.list.GunStoreGuns, OtherGunsMultiplier)
    for i, tab in ipairs(britaGuns) do
      -- add loose bullets to every gun in the table
      britaGuns[i].alsoRollEach = {
        {
          item = "[LOOSE_BULLETS]",
          chance = AB_get_chance(50, SandboxVars.AirbobbelzLoot.GunLooseBulletsMultiplier),
          times = SandboxVars.AirbobbelzLoot.GunLooseBulletsRolls
        }
      }
    end

    table.insert(lootTable.otherGuns.rollOne, britaGuns)

    -- add brita ammo boxes (gun store distribution) to AB loot distribution
    -- multiply by ammo box multiplier and also 1% -- because ammo boxes are plentiful in gun stores but on zombies should
    -- be much rarer. Obviously can be customized with the ammo box sandbox multiplier, but default value should be in-line with rare/very rare loot amounts
    local britaAmmoBoxes = AB_get_distro_for_vanilla_table(A26ProcDistro.list.GunStoreAmmo, AmmoBoxMultiplier * 0.01)
    local britaAmmoBoxesFiltered = {}
    for i, v in pairs(britaAmmoBoxes) do
      local itemName = v.item
      -- filter out ammo cans and poly cans
      if not string.find(itemName, "PolyCan") and not string.find(itemName, "AmmoCan") then
        britaAmmoBoxesFiltered[#britaAmmoBoxesFiltered + 1] = v
      end
    end

    -- replace entire ammo box distro with brita ammo boxes
    lootTable.bulletsBoxes.rollOne = {
      britaAmmoBoxesFiltered
    }

    -- disable vanilla rolls for guns and long guns. All brita weapons go into 'otherGuns' distro
    lootTable.pistols = {}
    lootTable.longGuns = {}

  -- @TODO: replace bullets distribution? no clear way to get those from brita tables though.. hmm..

  ------------ END MOD TABLE HERE ---------------------
  end
end

table.insert(AB_LOOT_PLUGINS, addBritaLoot)
