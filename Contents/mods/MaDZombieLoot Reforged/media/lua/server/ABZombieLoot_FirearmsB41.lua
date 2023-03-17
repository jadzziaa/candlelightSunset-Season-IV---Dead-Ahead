require "ABZombieLoot"

local function addFirearmsB41Loot(lootTable)
  if getActivatedMods():contains("firearmmod") then
    print("ABLOOT Firearms B41 Integration")
    ------------ MOD TABLE HERE ---------------------

    local AmmoMultiplier = SandboxVars.AirbobbelzLoot.AmmoMultiplier or 100
    local AmmoBoxMultiplier = SandboxVars.AirbobbelzLoot.AmmoBoxMultiplier or 100
    local MeleeMultiplier = SandboxVars.AirbobbelzLoot.MeleeMultiplier or 100
    local PistolMultiplier = SandboxVars.AirbobbelzLoot.PistolMultiplier or 100
    local LongGunsMultiplier = SandboxVars.AirbobbelzLoot.LongGunMultiplier or 100
    local GunLooseBulletsMultiplier = SandboxVars.AirbobbelzLoot.GunLooseBulletsMultiplier or 100
    local GunLooseBulletsRolls = SandboxVars.AirbobbelzLoot.GunLooseBulletsRolls or 12

    local ammoTypes = {"Bullets4440", "Bullets357", "762x51Bullets", "762x39Bullets", "Bullets22", "Bullets3006"}
    local ammo = {}

    for _, ammoType in pairs(ammoTypes) do
      ammo[#ammo + 1] = {
        item = ammoType,
        chance = AB_get_chance(0.3, AmmoMultiplier),
        alsoRollEach = {
          {item = ammoType, chance = AB_get_chance(50, AmmoMultiplier), times = GunLooseBulletsRolls}
        }
      }
    end

    local ammoBoxes = {
      {item = "Bullets4440Box", chance = AB_get_chance(0.01, AmmoBoxMultiplier)},
      {item = "Bullets357Box", chance = AB_get_chance(0.01, AmmoBoxMultiplier)},
      {item = "762x51Box", chance = AB_get_chance(0.01, AmmoBoxMultiplier)},
      {item = "762x39Box", chance = AB_get_chance(0.01, AmmoBoxMultiplier)},
      {item = "Bullets22Box", chance = AB_get_chance(0.01, AmmoBoxMultiplier)},
      {item = "Bullets3006Box", chance = AB_get_chance(0.01, AmmoBoxMultiplier)}
    }

    local pistols = {
      {
        item = "Glock17",
        chance = AB_get_chance(0.01, PistolMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "ColtAce",
        chance = AB_get_chance(0.01, PistolMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "ColtPeacemaker",
        chance = AB_get_chance(0.01, PistolMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "ColtSingleAction22",
        chance = AB_get_chance(0.01, PistolMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      }
    }

    local longGuns = {
      {
        item = "LAW12",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "SPAS12",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "M37Sawnoff",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "M37",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Remington870Sawnoff",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Remington870Wood",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Mossberg500Tactical",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Mossberg500",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "MP5",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "M1Garand",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "M24Rifle",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Rugerm7722",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "SKS",
        chance = AB_get_chance(0.005, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "HuntingRifle_Sawn",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "HuntingRifle",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Winchester94",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Winchester73",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "Rossi92",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "FN_FAL",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "M16A2",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "M733",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      {
        item = "AR15",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      },
      -- too big!
      -- {
      --     item = "M60",
      --     chance = AB_get_chance(0.001, LongGunsMultiplier),
      --     alsoRollEach = {
      --         { item = "[LOOSE_BULLETS]",
      --             chance = AB_get_chance(15, GunLooseBulletsMultiplier),
      --             times = GunLooseBulletsRolls },
      --     }
      -- },
      {
        item = "AK47",
        chance = AB_get_chance(0.01, LongGunsMultiplier),
        alsoRollEach = {
          {
            item = "[LOOSE_BULLETS]",
            chance = AB_get_chance(50, GunLooseBulletsMultiplier),
            times = GunLooseBulletsRolls
          }
        }
      }
    }

    AB_merge_into(lootTable.bullets.rollOne[1], ammo)
    AB_merge_into(lootTable.bulletsBoxes.rollOne[1], ammoBoxes)
    AB_merge_into(lootTable.pistols.rollOne[1], pistols)
    AB_merge_into(lootTable.longGuns.rollOne[1], longGuns)

  ------------ END MOD TABLE HERE ---------------------
  end
end

table.insert(AB_LOOT_PLUGINS, addFirearmsB41Loot)
