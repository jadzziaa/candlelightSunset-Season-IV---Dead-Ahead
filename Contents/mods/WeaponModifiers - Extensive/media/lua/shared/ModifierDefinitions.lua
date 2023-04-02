
-- require "Items/WeaponModifiersManager"

RarityColors = {
    -- Modifier's color
    shitty = {0.65, 0.2, 0.2},       -- dark red
    bad = {0.65, 0.65, 0.65},      -- grey
    common = {0.95, 0.95, 0.95},   -- white
    good = {0.1, 1, 0.1},         -- green
    great = {0.2, 0.7, 1},        -- blue
    epic = {1, 0.1, 0.6},         -- purple
    insane = {1, 0.6, 0.6},      -- light red
    legendary = {1, 0.6, 0.1},    -- orange

    -- stats' color
    negativeStats = {0.9, 0.1, 0.1},    -- bad stats of modifier in red
    positiveStats = {0.2, 1, 0.2},      -- good stats of modifier in green
    infoStats = {0.9, 0.9, 0.1},        -- info stats on the weapon in yellow
}

Modifiers = {}


-- Melee Modifiers :
-- Hurtful I, II, III, IV, V        ( + damage )
-- Harmless I, II, III, IV, V       ( - damage )
-- Quick I, II, III, IV, V          ( + attack speed )
-- Slow I, II, III, IV, V           ( * attack speed )
-- Lucky I, II, III, IV, V          ( + crit chance )
-- Unlucky I, II, II                ( - crit chance )
-- Handy I, II, III, IV, V          ( - min range)
-- Extensive I, II, III, IV, V      ( + max range)
-- Strong I, II, III, IV, V         ( + knockback )
-- Weak I, II, III, IV, V           ( - knockback )
-- Tireless I, II, III, IV, V       ( - endurance cost )
-- Tiring I, II, III, IV            ( + endurance cost )
-- Intuitive I, II, III, IV, V      ( + experience )
-- Confusing I, II, III, IV, V      ( - experience )

-- Sturdy I, II, III, IV, V         ( + durability )
-- Unbreakable                      ( +++ durability )
-- Fragile I, II, III, IV, V        ( - durability )
-- Small I, II, III, IV, V          ( - min range, - max range )
-- Large I, II, III, IV, V          ( + min range, + max range )
-- Godly I, II, III
-- Damaged I, II, III
-- Quality I, II, III, IV, V
-- Dangerous I, II, III, IV
-- Berserk I, II, III, IV, V
-- Superior I, II, III
-- Inferior I, II, III
-- Agile I, II, III, IV, V
-- Stiff I, II, III, IV, V
-- Deadly I, II, III, IV, V
-- Shitty I, II, III, IV, V
-- Murderous I, II, II
-- Dexterous I, II, III, IV
-- Savage I, II, III
-- Bulky I, II, III, IV, V
-- Lethargic I, II, III, IV, V
-- Pacifist
-- Broken
-- Legendary
-- Frenzying


-- Ranged Modifiers
-- Hurtful I, II, III, IV, V        ( + damage )
-- Harmless I, II, III, IV, V       ( - damage )
-- Lucky I, II, III, IV, V          ( + crit chance )
-- Unlucky I, II, II                ( - crit chance )
-- Handy I, II, III, IV, V          ( - min range)
-- Extensive I, II, III, IV, V      ( + max range)
-- Sturdy I, II, III, IV, V         ( + durability )
-- Fragile I, II, III, IV, V        ( - durability )
-- Quick I, II, III, IV, V          ( + aim time, + reload time )
-- Slow I, II, III, IV, V           ( - aim time, - reload time )
-- Unbreakable
-- Steady I, II, III, IV, V         ( - recoil )
-- Shaky I, II, III, IV, V          ( + recoil )
-- Precise I, II, III, IV, V        ( + accuracy )
-- Imprecise I, II, III, IV, V      ( - accuracy )
-- Quiet I, II, III, IV, V          ( - sound radius )
-- Loud I, II, III, IV, V           ( + sound radius )
-- Deadly I, II, II
-- Godly I, II, III
-- Damaged I, II, III
-- Quality I, II, III, IV, V
-- Dangerous I, II, III, IV, V
-- Awkward I, II, III, IV, V
-- Sniper I, II, III, IV, V
-- Tactical I, II, III, IV, V
-- Berserk I, II, III
-- Frenzying
-- Legendary

-- Backpack modifiers
-- Efficient I, II, III, IV, V      ( + weight reduction )
-- Inefficient I, II, III, IV, V    ( - weight reduction )
-- Small I, II, III, IV, V          ( - capacity )
-- Large I, II, III, IV, V          ( + capacity )
-- Shitty                           ( --- weight reduction, --- capacity)
-- Crappy I, II, III, IV, V         ( - weight reduction, - capacity)
-- Superior I, II, III, IV, V       ( + weight reduction, + capacity)
-- Legendary                        ( +++ weight reduction, +++ capacity)
-- Compact I, II, III, IV, V        ( + weight reduction, - capacity)
-- Loose I, II, III, IV, V          ( - weight reduction, + capacity)

-- function SetupModifiers()

Modifiers.Melee = { -- melee weapons
    common = {
        {
            -- modifierName = "Hurtful I",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                damage = 1.05,
            },
        },
        {
            -- modifierName = "Quick I",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["attack speed"] = 1.05,
            },
        },
        {
            -- modifierName = "Strong I",
            modifierName = getText('IGUI_modifier_name_Strong').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                knockback = 1.05,
            },
        },
        {
            -- modifierName = "Sturdy I",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["durability"] = 1.2,
            },
        },
        {
            -- modifierName = "Small I",
            modifierName = getText('IGUI_modifier_name_Small').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["minimum range"] = 0.95,
                ["maximum range"] = 0.95,
            },
        },
        {
            -- modifierName = "Small II",
            modifierName = getText('IGUI_modifier_name_Small').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["minimum range"] = 0.9,
                ["maximum range"] = 0.9,
            },
        },
        {
            -- modifierName = "Small III",
            modifierName = getText('IGUI_modifier_name_Small').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["minimum range"] = 0.85,
                ["maximum range"] = 0.85,
            },
        },
        {
            -- modifierName = "Small IV",
            modifierName = getText('IGUI_modifier_name_Small').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["minimum range"] = 0.8,
                ["maximum range"] = 0.8,
            },
        },
        -- {
        --     -- modifierName = "Small V",
        --     modifierName = getText('IGUI_modifier_name_Small').." "..getText('IGUI_modifier_name_level5'),
        --     fontColor = RarityColors.common,
        --     statsMultipliers = {
        --         ["minimum range"] = 0.8,
        --         ["maximum range"] = 0.8,
        --     },
        -- },
        {
            -- modifierName = "Large I",
            modifierName = getText('IGUI_modifier_name_Large').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["minimum range"] = 1.04,
                ["maximum range"] = 1.04,
            },
        },
        {
            modifierName = getText('IGUI_modifier_name_Large').." "..getText('IGUI_modifier_name_level2'),
            --modifierName = "Large II",
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["minimum range"] = 1.08,
                ["maximum range"] = 1.08,
            },
        },
        {
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level1'),
            --modifierName = "Intuitive I",
            fontColor = RarityColors.common,
            statsMultipliers = {
                experience = 1.1,
            },
        },
        {
            -- modifierName = "Lucky I",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["critical chance"] = 2,
            },
        },

    },
    good = {
        {
            -- modifierName = "Hurtful II",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.1,
            },
        },
        {
            -- modifierName = "Quick II",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["attack speed"] = 1.1,
            },
        },
        {
            -- modifierName = "Lucky II",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["critical chance"] = 4,
            },
        },
        {
            -- modifierName = "Extensive I",
            modifierName = getText('IGUI_modifier_name_Extensive').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["maximum range"] = 1.04,
            },
        },
        {
            -- modifierName = "Strong II",
            modifierName = getText('IGUI_modifier_name_Strong').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                knockback = 1.1,
            },
        },
        {
            -- modifierName = "Tireless I",
            modifierName = getText('IGUI_modifier_name_Tireless').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["endurance cost"] = 0.95,
            },
        },
        {
            -- modifierName = "Sturdy II",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["durability"] = 1.4,
            },
        },
        {
            -- modifierName = "Quality I",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.05,
                knockback = 1.05,
                durability = 1.1,
            },
        },
        {
            -- modifierName = "Dangerous I",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.04,
                ["critical chance"] = 4,
                ["maximum range"] = 1.04,
            },
        },
        {
            -- modifierName = "Large III",
            modifierName = getText('IGUI_modifier_name_Large').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["minimum range"] = 1.12,
                ["maximum range"] = 1.12,
            },
        },
        {
            -- modifierName = "Large IV",
            modifierName = getText('IGUI_modifier_name_Large').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["minimum range"] = 1.15,
                ["maximum range"] = 1.15,
            },
        },
        {
            -- modifierName = "Berserk I",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.05,
                ["attack speed"] = 1.05,
                ["minimum range"] = 0.95,
                knockback = 0.9
            },
        },
        {
            -- modifierName = "Deadly I",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.1,
                ["critical chance"] = 3,
            },
        },
        {
            -- modifierName = "Agile I",
            modifierName = getText('IGUI_modifier_name_Agile').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["attack speed"] = 1.05,
                ["critical chance"] = 2,
            },
        },
        {
            -- modifierName = "Bulky I",
            modifierName = getText('IGUI_modifier_name_Bulky').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.05,
                ["attack speed"] =  0.95,
                ["minimum range"] = 1.04,
                ["maximum range"] = 1.04,
                knockback = 1.05,
            },
        },
        
        {
            -- modifierName = "Bulky II",
            modifierName = getText('IGUI_modifier_name_Bulky').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.1,
                ["attack speed"] =  0.9,
                ["minimum range"] = 1.08,
                ["maximum range"] = 1.08,
                knockback = 1.1,
            },
        },
        {
            -- modifierName = "Bulky III",
            modifierName = getText('IGUI_modifier_name_Bulky').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.15,
                ["attack speed"] =  0.85,
                ["minimum range"] = 1.12,
                ["maximum range"] = 1.12,
                knockback = 1.15,
            },
        },
        {
            -- modifierName = "Bulky IV",
            modifierName = getText('IGUI_modifier_name_Bulky').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.2,
                ["attack speed"] =  0.8,
                ["minimum range"] = 1.16,
                ["maximum range"] = 1.16,
                knockback = 1.2,
            },
        },
        {
            -- modifierName = "Intuitive II",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                experience = 1.2,
            },
        },

    },
    great = {
        {
            -- modifierName = "Hurtful III",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.15,
            },
        },
        {
            -- modifierName = "Quick III",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["attack speed"] = 1.15,
            },
        },
        {
            -- modifierName = "Lucky III",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["critical chance"] = 6,
            },
        },
        {
            -- modifierName = "Handy II",
            modifierName = getText('IGUI_modifier_name_Handy').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["minimum range"] = 0.92,
            },
        },
        {
            -- modifierName = "Extensive II",
            modifierName = getText('IGUI_modifier_name_Extensive').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["maximum range"] = 1.08,
            },
        },
        {
            -- modifierName = "Strong III",
            modifierName = getText('IGUI_modifier_name_Strong').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                knockback = 1.15,
            },
        },
        {
            -- modifierName = "Tireless II",
            modifierName = getText('IGUI_modifier_name_Tireless').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["endurance cost"] = 0.90,
            },
        },
        {
            -- modifierName = "Sturdy III",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["durability"] = 1.6,
            },
        },
        {
            -- modifierName = "Quality II",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.1,
                knockback = 1.1,
                durability = 1.2,
            },
        },
        {
            -- modifierName = "Dangerous II",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.08,
                ["critical chance"] = 7,
                ["maximum range"] = 1.08,
            },
        },
        {
            -- modifierName = "Berserk II",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.1,
                ["attack speed"] = 1.1,
                ["minimum range"] = 0.9,
                knockback = 0.8
            },
        },
        {
            -- modifierName = "Berserk III",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.15,
                ["attack speed"] = 1.15,
                ["minimum range"] = 0.9,
                knockback = 0.7
            },
        },
        {
            -- modifierName = "Superior I",
            modifierName = getText('IGUI_modifier_name_Superior').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.05,
                ["critical chance"] = 2,
                knockback = 1.05,
                durability = 1.15
            },
        },
        {
            -- modifierName = "Agile II",
            modifierName = getText('IGUI_modifier_name_Agile').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["attack speed"] = 1.1,
                ["critical chance"] = 4,
            },
        },
        {
            -- modifierName = "Deadly II",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.2,
                ["critical chance"] = 6,
            },
        },
        {
            -- modifierName = "Dexterous I",
            modifierName = getText('IGUI_modifier_name_Dexterous').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["attack speed"] = 1.04,
                ["critical chance"] = 4,
                ["minimum range"] = 0.96,
                ["maximum range"] = 1.04,
            },
        },
        {
            -- modifierName = "Savage I",
            modifierName = getText('IGUI_modifier_name_Savage').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.05,
                ["maximum range"] = 1.05,
                knockback = 1.05,
                experience = 0.95
            },
        },
        {
            -- modifierName = "Bulky V",
            modifierName = getText('IGUI_modifier_name_Bulky').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.25,
                ["attack speed"] =  0.75,
                ["minimum range"] = 1.2,
                ["maximum range"] = 1.2,
                knockback = 1.25,
            },
        },
        {
            -- modifierName = "Intuitive III",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                experience = 1.3,
            },
        },

    },
    epic = {
        {
            -- modifierName = "Hurtful IV",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.25,
            },
        },
        {
            -- modifierName = "Quick IV",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["attack speed"] = 1.2,
            },
        },
        {
            -- modifierName = "Lucky IV",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["critical chance"] = 8,
            },
        },
        {
            -- modifierName = "Handy III",
            modifierName = getText('IGUI_modifier_name_Handy').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["minimum range"] = 0.88,
            },
        },
        {
            -- modifierName = "Extensive III",
            modifierName = getText('IGUI_modifier_name_Extensive').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["maximum range"] = 1.12,
            },
        },
        {
            -- modifierName = "Strong IV",
            modifierName = getText('IGUI_modifier_name_Strong').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                knockback = 1.25,
            },
        },
        {
            -- modifierName = "Strong V",
            modifierName = getText('IGUI_modifier_name_Strong').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                knockback = 1.4,
            },
        },
        {
            -- modifierName = "Tireless III",
            modifierName = getText('IGUI_modifier_name_Tireless').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["endurance cost"] = 0.85,
            },
        },
        {
            -- modifierName = "Sturdy IV",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["durability"] = 1.8,
            },
        },
        {
            -- modifierName = "Godly I",
            modifierName = getText('IGUI_modifier_name_Godly').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.1,
                ["attack speed"] = 1.05,
                ["critical chance"] = 5,
                knockback = 1.1,
                ["endurance cost"] = 0.95, 
            },
        },
        {
            -- modifierName = "Frenzying",
            modifierName = getText('IGUI_modifier_name_Frenzying'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 0.85,
                ["attack speed"] = 1.15,
                ["minimum range"] = 0.85,
            },
        },
        {
            -- modifierName = "Quality III",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.15,
                knockback = 1.15,
                durability = 1.3,
            },
        },
        {
            -- modifierName = "Dangerous III",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.12,
                ["critical chance"] = 10,
                ["maximum range"] = 1.12,
            },
        },
        {
            -- modifierName = "Berserk IV",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.2,
                ["attack speed"] = 1.2,
                ["minimum range"] = 0.85,
                knockback = 0.6
            },
        },
        {
            -- modifierName = "Superior II",
            modifierName = getText('IGUI_modifier_name_Superior').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.1,
                ["critical chance"] = 4,
                knockback = 1.1,
                durability = 1.3
            },
        },
        {
            -- modifierName = "Agile III",
            modifierName = getText('IGUI_modifier_name_Agile').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["attack speed"] = 1.15,
                ["critical chance"] = 6,
            },
        },
        {
            -- modifierName = "Deadly III",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.3,
                ["critical chance"] = 9,
            },
        },
        {
            -- modifierName = "Murderous I",
            modifierName = getText('IGUI_modifier_name_Murderous').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.07,
                ["attack speed"] = 1.07,
                ["critical chance"] = 5,
                ["endurance cost"] = 0.95,
            },
        },
        {
            -- modifierName = "Dexterous II",
            modifierName = getText('IGUI_modifier_name_Dexterous').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["attack speed"] = 1.08,
                ["critical chance"] = 4,
                ["minimum range"] = 0.92,
                ["maximum range"] = 1.08,
            },
        },
        {
            -- modifierName = "Savage II",
            modifierName = getText('IGUI_modifier_name_Savage').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.1,
                ["maximum range"] = 1.1,
                knockback = 1.1,
                experience = 0.9
            },
        },
        {
            -- modifierName = "Intuitive IV",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                experience = 1.4,
            },
        },

    },
    insane = {
        {
            -- modifierName = "Hurtful V",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.4,
            },
        },
        {
            -- modifierName = "Quick V",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["attack speed"] = 1.3,
            },
        },
        {
            -- modifierName = "Lucky V",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["critical chance"] = 10,
            },
        },
        {
            -- modifierName = "Handy IV",
            modifierName = getText('IGUI_modifier_name_Handy').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["minimum range"] = 0.8,
            },
        },
        {
            -- modifierName = "Handy V",
            modifierName = getText('IGUI_modifier_name_Handy').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["minimum range"] = 0.7,
            },
        },
        {
            -- modifierName = "Extensive IV",
            modifierName = getText('IGUI_modifier_name_Extensive').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["maximum range"] = 1.2,
            },
        },
        {
            -- modifierName = "Extensive V",
            modifierName = getText('IGUI_modifier_name_Extensive').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["maximum range"] = 1.3,
            },
        },
        {
            -- modifierName = "Tireless IV",
            modifierName = getText('IGUI_modifier_name_Tireless').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["endurance cost"] = 0.8,
            },
        },
        {
            -- modifierName = "Sturdy V",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["durability"] = 2,
            },
        },
        {
            -- modifierName = "Godly II",
            modifierName = getText('IGUI_modifier_name_Godly').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.2,
                ["attack speed"] = 1.1,
                ["critical chance"] = 10,
                knockback = 1.15,
                ["endurance cost"] = 0.9, 
            },
        },
        {
            -- modifierName = "Quality IV",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.2,
                knockback = 1.2,
                durability = 1.4,
            },
        },
        {
            -- modifierName = "Dangerous IV",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.15,
                ["critical chance"] = 8,
                ["maximum range"] = 1.15,
            },
        },
        {
            -- modifierName = "Berserk V",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.3,
                ["attack speed"] = 1.3,
                ["minimum range"] = 0.8,
                knockback = 0.5
            },
        },
        {
            -- modifierName = "Superior III",
            modifierName = getText('IGUI_modifier_name_Superior').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.15,
                ["critical chance"] = 6,
                knockback = 1.15,
                durability = 1.5
            },
        },
        {
            -- modifierName = "Agile IV",
            modifierName = getText('IGUI_modifier_name_Agile').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["attack speed"] = 1.2,
                ["critical chance"] = 4,
            },
        },
        {
            -- modifierName = "Deadly IV",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.4,
                ["critical chance"] = 12,
            },
        },
        {
            -- modifierName = "Murderous II",
            modifierName = getText('IGUI_modifier_name_Murderous').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.15,
                ["attack speed"] = 1.15,
                ["critical chance"] = 10,
                ["endurance cost"] = 0.9,
            },
        },
        {
            -- modifierName = "Dexterous III",
            modifierName = getText('IGUI_modifier_name_Dexterous').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["attack speed"] = 1.15,
                ["critical chance"] = 3,
                ["minimum range"] = 0.88,
                ["maximum range"] = 1.12,
            },
        },
        {
            -- modifierName = "Savage III",
            modifierName = getText('IGUI_modifier_name_Savage').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.15,
                ["maximum range"] = 1.15,
                knockback = 1.15,
                experience = 0.85
            },
        },
        {
            -- modifierName = "Intuitive V",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                experience = 1.5,
            },
        },


    },
    legendary = {
        {
            -- modifierName = "Unbreakable",
            modifierName = getText('IGUI_modifier_name_Unbreakable'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["durability"] = 11,
            },
        },
        {
            -- modifierName = "Godly III",
            modifierName = getText('IGUI_modifier_name_Godly').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.25,
                ["attack speed"] = 1.2,
                ["critical chance"] = 15,
                knockback = 1.2,
                ["endurance cost"] = 0.85, 
            },
        },
        {
            -- modifierName = "Legendary",
            modifierName = getText('IGUI_modifier_name_Legendary'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.3,
                ["attack speed"] = 1.3,
                ["critical chance"] = 15,
                ["minimum range"] = 0.9,
                ["maximum range"] = 1.1,
                knockback = 1.3,
                ["endurance cost"] = 0.7, 
                ["durability"] = 1.5,
                experience = 1.3
            },
        },
        {
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.4,
                knockback = 1.4,
                durability = 1.8,
            },
        },
        {
            modifierName = getText('IGUI_modifier_name_Agile').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["attack speed"] = 1.6,
                ["critical chance"] = 10,
            },
        },
        {
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.6,
                ["critical chance"] = 15,
            },
        },
        {
            -- modifierName = "Murderous III",
            modifierName = getText('IGUI_modifier_name_Murderous').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.25,
                ["attack speed"] = 1.25,
                ["critical chance"] = 15,
                ["endurance cost"] = 0.85,
            },
        },
        {
            modifierName = getText('IGUI_modifier_name_Dexterous').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["attack speed"] = 1.25,
                ["critical chance"] = 15,
                ["minimum range"] = 0.85,
                ["maximum range"] = 1.15,
            },
        },
        {
            -- modifierName = "Ultra Intuitive",
            modifierName = getText('IGUI_modifier_name_UltraIntuitive'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                experience = 3,
            },
        },
        {
            -- modifierName = "Pacifist",
            modifierName = getText('IGUI_modifier_name_Pacifist'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 0.1,
                ["attack speed"] = 1.5,
                knockback = 3,
                experience = 2
            },
        },
        {
            -- modifierName = "Close Quarters",
            modifierName = getText('IGUI_modifier_name_CloseQuarters'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["minimum range"] = 0.1,
            },
        },
        {
            -- modifierName = "Miracle",
            modifierName = getText('IGUI_modifier_name_Miracle'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["critical chance"] = 20,
            },
        },

    },
    bad = {
        {
            -- modifierName = "Harmless I",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                damage = 0.9,
            },
        },
        {
            -- modifierName = "Harmless II",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                damage = 0.8,
            },
        },
        {
            -- modifierName = "Slow I",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["attack speed"] = 0.9,
            },
        },
        {
            -- modifierName = "Slow II",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["attack speed"] = 0.8,
            },
        },
        {
            -- modifierName = "Unlucky I",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["critical chance"] = -2,
            },
        },
        {
            -- modifierName = "Unlucky II",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["critical chance"] = -4,
            },
        },
        {
            -- modifierName = "Weak I",
            modifierName = getText('IGUI_modifier_name_Weak').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                knockback = 0.9,
            },
        },
        {
            -- modifierName = "Weak II",
            modifierName = getText('IGUI_modifier_name_Weak').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                knockback = 0.8,
            },
        },
        {
            -- modifierName = "Tiring I",
            modifierName = getText('IGUI_modifier_name_Tiring').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["endurance cost"] = 1.1,
            },
        },
        {
            -- modifierName = "Tiring II",
            modifierName = getText('IGUI_modifier_name_Tiring').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["endurance cost"] = 1.2,
            },
        },
        {
            -- modifierName = "Fragile I",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["durability"] = 0.85,
            },
        },
        {
            -- modifierName = "Fragile II",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["durability"] = 0.7,
            },
        },
        {
            -- modifierName = "Stiff I",
            modifierName = getText('IGUI_modifier_name_Stiff').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["attack speed"] = 0.95,
                ["critical chance"] = -1,
            },
        },
        {
            -- modifierName = "Confusing I",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                experience = 0.9,
            },
        },
        {
            -- modifierName = "Confusing II",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                experience = 0.8,
            },
        },
        {
            -- modifierName = "Confusing III",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                experience = 0.7,
            },
        },

    },
    shitty = {
        {
            -- modifierName = "Harmless III",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.7,
            },
        },
        {
            -- modifierName = "Harmless IV",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.6,
            },
        },
        {
            -- modifierName = "Harmless V",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.5,
            },
        },
        -- SPEED MODIFIERS
        {
            -- modifierName = "Slow III",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] = 0.7,
            },
        },
        {
            -- modifierName = "Slow IV",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] = 0.6,
            },
        },
        {
            -- modifierName = "Slow V",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] = 0.5,
            },
        },
        {
            -- modifierName = "Unlucky III",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["critical chance"] = -6,
            },
        },
        {
            -- modifierName = "Unlucky IV",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["critical chance"] = -8,
            },
        },
        {
            -- modifierName = "Unlucky V",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["critical chance"] = -10,
            },
        },
        {
            -- modifierName = "Weak III",
            modifierName = getText('IGUI_modifier_name_Weak').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                knockback = 0.7,
            },
        },
        {
            -- modifierName = "Weak IV",
            modifierName = getText('IGUI_modifier_name_Weak').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                knockback = 0.6,
            },
        },
        {
            -- modifierName = "Weak V",
            modifierName = getText('IGUI_modifier_name_Weak').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                knockback = 0.5,
            },
        },
        {
            -- modifierName = "Tiring III",
            modifierName = getText('IGUI_modifier_name_Tiring').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["endurance cost"] = 1.3,
            },
        },
        {
            -- modifierName = "Tiring IV",
            modifierName = getText('IGUI_modifier_name_Tiring').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["endurance cost"] = 1.4,
            },
        },
        {
            -- modifierName = "Tiring V",
            modifierName = getText('IGUI_modifier_name_Tiring').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["endurance cost"] = 1.5,
            },
        },
        {
            -- modifierName = "Fragile III",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["durability"] = 0.6,
            },
        },
        {
            -- modifierName = "Fragile IV",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["durability"] = 0.45,
            },
        },
        {
            -- modifierName = "Fragile V",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["durability"] = 0.25,
            },
        },
        {
            -- modifierName = "Damaged I",
            modifierName = getText('IGUI_modifier_name_Damaged').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.9,
                knockback = 0.9,
                durability = 0.9,
            },
        },
        {
            -- modifierName = "Damaged II",
            modifierName = getText('IGUI_modifier_name_Damaged').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.8,
                knockback = 0.8,
                durability = 0.8,
            },
        },
        {
            -- modifierName = "Damaged III",
            modifierName = getText('IGUI_modifier_name_Damaged').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.7,
                knockback = 0.7,
                durability = 0.7,
            },
        },
        {
            -- modifierName = "Broken",
            modifierName = getText('IGUI_modifier_name_Broken'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.5,
                ["critical chance"] = -5,
                knockback = 0.5,
                durability = 0.3
            },
        },
        {
            -- modifierName = "Inferior I",
            modifierName = getText('IGUI_modifier_name_Inferior').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.95,
                knockback = 0.95,
                durability = 0.9
            },
        },
        {
            -- modifierName = "Inferior II",
            modifierName = getText('IGUI_modifier_name_Inferior').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.9,
                knockback = 0.9,
                durability = 0.8
            },
        },
        {
            -- modifierName = "Inferior III",
            modifierName = getText('IGUI_modifier_name_Inferior').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.85,
                knockback = 0.85,
                durability = 0.7
            },
        },
        {
            -- modifierName = "Stiff II",
            modifierName = getText('IGUI_modifier_name_Stiff').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] = 0.9,
                ["critical chance"] = -2,
            },
        },
        {
            -- modifierName = "Stiff III",
            modifierName = getText('IGUI_modifier_name_Stiff').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] = 0.85,
                ["critical chance"] = -2,
            },
        },
        {
            -- modifierName = "Stiff IV",
            modifierName = getText('IGUI_modifier_name_Stiff').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] = 0.8,
                ["critical chance"] = -3,
            },
        },
        {
            -- modifierName = "Stiff V",
            modifierName = getText('IGUI_modifier_name_Stiff').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] = 0.8,
                ["critical chance"] = -4,
            },
        },
        {
            -- modifierName = "Shitty I",
            modifierName = getText('IGUI_modifier_name_Shitty').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.9,
                ["attack speed"] = 0.9,
                knockback = 0.9,
                ["endurance cost"] = 1.1, 
                ["durability"] = 0.9,
            },
        },
        {
            -- modifierName = "Shitty II",
            modifierName = getText('IGUI_modifier_name_Shitty').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.8,
                ["attack speed"] = 0.8,
                knockback = 0.8,
                ["endurance cost"] = 1.2,
                ["durability"] = 0.8,
            },
        },
        {
            -- modifierName = "Shitty III",
            modifierName = getText('IGUI_modifier_name_Shitty').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.7,
                ["attack speed"] = 0.7,
                knockback = 0.7,
                ["endurance cost"] = 1.3,
                ["durability"] = 0.7,
            },
        },
        {
            -- modifierName = "Lethargic I",
            modifierName = getText('IGUI_modifier_name_Lethargic').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] =  0.9,
                knockback = 0.9,
                ["endurance cost"] = 1.1,
            },
        },
        {
            -- modifierName = "Lethargic II",
            modifierName = getText('IGUI_modifier_name_Lethargic').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] =  0.8,
                knockback = 0.8,
                ["endurance cost"] = 1.2,
            },
        },
        {
            -- modifierName = "Lethargic III",
            modifierName = getText('IGUI_modifier_name_Lethargic').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] =  0.7,
                knockback = 0.7,
                ["endurance cost"] = 1.3,
            },
        },
        {
            -- modifierName = "Lethargic IV",
            modifierName = getText('IGUI_modifier_name_Lethargic').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] =  0.6,
                knockback = 0.6,
                ["endurance cost"] = 1.4,
            },
        },
        {
            -- modifierName = "Lethargic V",
            modifierName = getText('IGUI_modifier_name_Lethargic').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["attack speed"] =  0.5,
                knockback = 0.5,
                ["endurance cost"] = 1.5,
            },
        },
        {
            -- modifierName = "Confusing IV",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                experience = 0.6,
            },
        },
        {
            -- modifierName = "Confusing V",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                experience = 0.5,
            },
        },


    },
}

Modifiers.Ranged = { --guns
    common = {
        {
            -- modifierName = "Hurtful I",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                damage = 1.05,
            },
        },
        {
            -- modifierName = "Quick I",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["aim time"] = 0.95,
                ["reload time"] = 0.95,
            },
        },
        {
            -- modifierName = "Lucky I",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["critical chance"] = 2,
            },
        },
        {
            -- modifierName = "Sturdy I",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["durability"] = 1.15,
            },
        },
        {
            -- modifierName = "Steady I",
            modifierName = getText('IGUI_modifier_name_Steady').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                recoil = 0.95,
            },
        },
        {
            -- modifierName = "Precise I",
            modifierName = getText('IGUI_modifier_name_Precise').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                accuracy = 1.05,
            },
        },
        {
            -- modifierName = "Quiet I",
            modifierName = getText('IGUI_modifier_name_Quiet').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                ["sound radius"] = 0.95,
            },
        },
        {
            -- modifierName = "Intuitive I",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.common,
            statsMultipliers = {
                experience = 1.15,
            },
        },


    },
    good = {
        {
            -- modifierName = "Hurtful II",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.1,
            },
        },
        {
            -- modifierName = "Quick II",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["aim time"] = 0.9,
                ["reload time"] = 0.9,
            },
        },
        {
            -- modifierName = "Lucky II",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["critical chance"] = 4,
            },
        },
        {
            -- modifierName = "Sturdy II",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["durability"] = 1.3,
            },
        },
        {
            -- modifierName = "Steady II",
            modifierName = getText('IGUI_modifier_name_Steady').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                recoil = 0.9,
            },
        },
        {
            -- modifierName = "Precise II",
            modifierName = getText('IGUI_modifier_name_Precise').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                accuracy = 1.1,
            },
        },
        {
            -- modifierName = "Quiet II",
            modifierName = getText('IGUI_modifier_name_Quiet').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["sound radius"] = 0.9,
            },
        },
        {
            -- modifierName = "Intuitive II",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                experience = 1.3,
            },
        },
        {
            -- modifierName = "Deadly I",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.1,
                ["critical chance"] = 2,
            },
        },
        {
            -- modifierName = "Quality I",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.05,
                recoil = 0.95,
                durability = 1.1,
            },
        },
        {
            -- modifierName = "Dangerous I",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.05,
                ["critical chance"] = 1,
                ["maximum range"] = 1.05,
                ["sound radius"] = 1.05,
            },
        },
        {
            -- modifierName = "Sniper I",
            modifierName = getText('IGUI_modifier_name_Sniper').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.05,
                ["maximum range"] = 1.15,
                accuracy = 1.1,
            },
        },
        {
            -- modifierName = "Tactical I",
            modifierName = getText('IGUI_modifier_name_Tactical').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                ["minimum range"] = 0.95,
                ["maximum range"] = 1.05,
                accuracy = 1.05,
                ["aim time"] = 0.95,
                ["reload time"] = 0.95,
                ["sound radius"] = 0.95,
            },
        },
        {
            -- modifierName = "Berserk I",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.good,
            statsMultipliers = {
                damage = 1.1,
                ["maximum range"] = 0.9,
                accuracy = 0.9,
                recoil = 0.9,
                ["aim time"] = 0.9,
                ["reload time"] = 0.9,
                ["sound radius"] = 1.1,
            },
        },
    },
    great = {
        {
            -- modifierName = "Hurtful III",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.15,
            },
        },
        {
            -- modifierName = "Quick III",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["aim time"] = 0.85,
                ["reload time"] = 0.85,
            },
        },
        {
            -- modifierName = "Lucky III",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["critical chance"] = 6,
            },
        },
        {
            -- modifierName = "Sturdy III",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["durability"] = 1.45,
            },
        },
        {
            -- modifierName = "Steady III",
            modifierName = getText('IGUI_modifier_name_Steady').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                recoil = 0.85,
            },
        },
        {
            -- modifierName = "Precise III",
            modifierName = getText('IGUI_modifier_name_Precise').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                accuracy = 1.15,
            },
        },
        {
            -- modifierName = "Quiet III",
            modifierName = getText('IGUI_modifier_name_Quiet').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["sound radius"] = 0.85,
            },
        },
        {
            -- modifierName = "Intuitive III",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                experience = 1.45,
            },
        },
        {
            -- modifierName = "Deadly II",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.2,
                ["critical chance"] = 4,
            },
        },
        {
            -- modifierName = "Quality II",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.1,
                recoil = 0.9,
                durability = 1.2,
            },
        },
        {
            -- modifierName = "Dangerous II",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.1,
                ["critical chance"] = 2,
                ["maximum range"] = 1.1,
                ["sound radius"] = 1.1,
            },
        },
        {
            -- modifierName = "Sniper II",
            modifierName = getText('IGUI_modifier_name_Sniper').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.1,
                ["maximum range"] = 1.3,
                accuracy = 1.2,
            },
        },
        {
            -- modifierName = "Tactical II",
            modifierName = getText('IGUI_modifier_name_Tactical').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                ["minimum range"] = 0.9,
                ["maximum range"] = 1.1,
                accuracy = 1.1,
                ["aim time"] = 0.9,
                ["reload time"] = 0.9,
                ["sound radius"] = 0.9,
            },
        },
        {
            -- modifierName = "Berserk II",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.great,
            statsMultipliers = {
                damage = 1.2,
                ["maximum range"] = 0.8,
                accuracy = 0.8,
                recoil = 0.8,
                ["aim time"] = 0.8,
                ["reload time"] = 0.8,
                ["sound radius"] = 1.2,
            },
        },
    },
    epic = {
        {
            -- modifierName = "Hurtful IV",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.25,
            },
        },
        {
            -- modifierName = "Quick IV",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["aim time"] = 0.75,
                ["reload time"] = 0.75,
            },
        },
        {
            -- modifierName = "Lucky IV",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["critical chance"] = 8,
            },
        },
        {
            -- modifierName = "Sturdy IV",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["durability"] = 1.6,
            },
        },
        {
            -- modifierName = "Steady IV",
            modifierName = getText('IGUI_modifier_name_Steady').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                recoil = 0.75,
            },
        },
        {
            -- modifierName = "Precise IV",
            modifierName = getText('IGUI_modifier_name_Precise').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                accuracy = 1.25,
            },
        },
        {
            -- modifierName = "Quiet IV",
            modifierName = getText('IGUI_modifier_name_Quiet').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["sound radius"] = 0.75,
            },
        },
        {
            -- modifierName = "Intuitive IV",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                experience = 1.6,
            },
        },
        {
            -- modifierName = "Deadly III",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.3,
                ["critical chance"] = 6,
            },
        },
        {
            -- modifierName = "Godly I",
            modifierName = getText('IGUI_modifier_name_Godly').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.1,
                ["critical chance"] = 5,
                recoil = 0.9,
                ["aim time"] = 0.95,
                ["reload time"] = 0.95,
                ["sound radius"] = 0.95
            },
        },
        {
            -- modifierName = "Frenzying",
            modifierName = getText('IGUI_modifier_name_Frenzying'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 0.85,
                ["aim time"] = 0.85,
                ["reload time"] = 0.85,
                recoil = 0.85,
                ["minimum range"] = 0.85,
                ["sound radius"] = 1.15
            },
        },
        {
            -- modifierName = "Quality III",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.15,
                recoil = 0.85,
                durability = 1.3,
            },
        },
        {
            -- modifierName = "Dangerous III",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.15,
                ["critical chance"] = 3,
                ["maximum range"] = 1.15,
                ["sound radius"] = 1.15,
            },
        },
        {
            -- modifierName = "Sniper III",
            modifierName = getText('IGUI_modifier_name_Sniper').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.15,
                ["maximum range"] = 1.45,
                accuracy = 1.3,
            },
        },
        {
            -- modifierName = "Tactical III",
            modifierName = getText('IGUI_modifier_name_Tactical').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                ["minimum range"] = 0.85,
                ["maximum range"] = 1.15,
                accuracy = 1.2,
                ["aim time"] = 0.8,
                ["reload time"] = 0.8,
                ["sound radius"] = 0.85,
            },
        },
        {
            -- modifierName = "Berserk III",
            modifierName = getText('IGUI_modifier_name_Berserk').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.epic,
            statsMultipliers = {
                damage = 1.3,
                ["maximum range"] = 0.7,
                accuracy = 0.7,
                recoil = 0.7,
                ["aim time"] = 0.7,
                ["reload time"] = 0.7,
                ["sound radius"] = 1.3,
            },
        },
    },
    insane = {
        {
            -- modifierName = "Hurtful V",
            modifierName = getText('IGUI_modifier_name_Hurtful').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.5,
            },
        },
        {
            -- modifierName = "Quick V",
            modifierName = getText('IGUI_modifier_name_Quick').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["aim time"] = 0.5,
                ["reload time"] = 0.5,
            },
        },
        {
            -- modifierName = "Lucky V",
            modifierName = getText('IGUI_modifier_name_Lucky').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["critical chance"] = 10,
            },
        },
        {
            -- modifierName = "Sturdy V",
            modifierName = getText('IGUI_modifier_name_Sturdy').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["durability"] = 2,
            },
        },
        {
            -- modifierName = "Steady V",
            modifierName = getText('IGUI_modifier_name_Steady').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                recoil = 0.5,
            },
        },
        {
            -- modifierName = "Precise V",
            modifierName = getText('IGUI_modifier_name_Precise').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                accuracy = 1.5,
            },
        },
        {
            -- modifierName = "Quiet V",
            modifierName = getText('IGUI_modifier_name_Quiet').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["sound radius"] = 0.5,
            },
        },
        {
            -- modifierName = "Intuitive V",
            modifierName = getText('IGUI_modifier_name_Intuitive').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                experience = 1.8,
            },
        },
        {
            -- modifierName = "Deadly IV",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.4,
                ["critical chance"] = 8,
            },
        },
        {
            -- modifierName = "Godly II",
            modifierName = getText('IGUI_modifier_name_Godly').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.2,
                recoil = 0.8,
                ["aim time"] = 0.9,
                ["reload time"] = 0.9,
                ["critical chance"] = 10,
                ["sound radius"] = 0.9
            },
        },
        {
            -- modifierName = "Quality IV",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.2,
                recoil = 0.8,
                durability = 1.4,
            },
        },
        {
            -- modifierName = "Dangerous IV",
            modifierName = getText('IGUI_modifier_name_Dangerous').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.2,
                ["critical chance"] = 4,
                ["maximum range"] = 1.2,
                ["sound radius"] = 1.2,
            },
        },
        {
            -- modifierName = "Sniper IV",
            modifierName = getText('IGUI_modifier_name_Sniper').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                damage = 1.2,
                ["maximum range"] = 1.6,
                accuracy = 1.4,
            },
        },
        {
            -- modifierName = "Tactical IV",
            modifierName = getText('IGUI_modifier_name_Tactical').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.insane,
            statsMultipliers = {
                ["minimum range"] = 0.8,
                ["maximum range"] = 1.2,
                accuracy = 1.3,
                ["aim time"] = 0.7,
                ["reload time"] = 0.7,
                ["sound radius"] = 0.8,
            },
        },

    },
    legendary = {
        {
            -- modifierName = "Unbreakable",
            modifierName = getText('IGUI_modifier_name_Unbreakable'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["durability"] = 11,
            },
        },
        {
            -- modifierName = "Precise VI",
            modifierName = getText('IGUI_modifier_name_Precise').." "..getText('IGUI_modifier_name_level6'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                accuracy = 2,
            },
        },
        {
            -- modifierName = "Silent",
            modifierName = getText('IGUI_modifier_name_Silent'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["sound radius"] = 0.3,
            },
        },
        {
            -- modifierName = "Ultra Intuitive",
            modifierName = getText('IGUI_modifier_name_UltraIntuitive'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                experience = 2.5,
            },
        },
        {
            -- modifierName = "Deadly V",
            modifierName = getText('IGUI_modifier_name_Deadly').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.5,
                ["critical chance"] = 10,
            },
        },
        {
            -- modifierName = "Godly III",
            modifierName = getText('IGUI_modifier_name_Godly').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.25,
                recoil = 0.7,
                ["aim time"] = 0.8,
                ["reload time"] = 0.8,
                ["critical chance"] = 15,
                ["sound radius"] = 0.85
            },
        },
        {
            -- modifierName = "Legendary",
            modifierName = getText('IGUI_modifier_name_Legendary'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.3,
                -- ["attack speed"] = 1.3,
                ["critical chance"] = 5,
                ["minimum range"] = 0.7,
                ["maximum range"] = 1.3,
                accuracy = 1.3,
                recoil = 0.7,
                ["aim time"] = 0.7,
                ["reload time"] = 0.7,
                ["sound radius"] = 0.7,
                ["durability"] = 1.3,
                experience = 1.3
            },
        },
        {
            -- modifierName = "Quality V",
            modifierName = getText('IGUI_modifier_name_Quality').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.3,
                recoil = 0.7,
                durability = 1.6,
            },
        },
        {
            -- modifierName = "Sniper V",
            modifierName = getText('IGUI_modifier_name_Sniper').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                damage = 1.5,
                ["maximum range"] = 1.8,
                accuracy = 1.5,
            },
        },
        {
            -- modifierName = "Tactical V",
            modifierName = getText('IGUI_modifier_name_Tactical').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.legendary,
            statsMultipliers = {
                ["minimum range"] = 0.7,
                ["maximum range"] = 1.3,
                accuracy = 1.4,
                ["aim time"] = 0.6,
                ["reload time"] = 0.6,
                ["sound radius"] = 0.75,
            },
        },
    },
    bad = {
        {
            -- modifierName = "Harmless I",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                damage = 0.95,
            },
        },
        {
            -- modifierName = "Harmless II",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                damage = 0.9,
            },
        },
        {
            -- modifierName = "Slow I",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["aim time"] = 1.05,
                ["reload time"] = 1.05,
            },
        },
        {
            -- modifierName = "Slow II",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["aim time"] = 1.1,
                ["reload time"] = 1.1,
            },
        },
        {
            -- modifierName = "Fragile I",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["durability"] = 0.9,
            },
        },
        {
            -- modifierName = "Unlucky I",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["critical chance"] = -1,
            },
        },
        {
            -- modifierName = "Unlucky II",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["critical chance"] = -2,
            },
        },
        {
            -- modifierName = "Fragile II",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["durability"] = 0.8,
            },
        },
        {
            -- modifierName = "Shaky I",
            modifierName = getText('IGUI_modifier_name_Shaky').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                recoil = 1.1,
            },
        },
        {
            -- modifierName = "Shaky II",
            modifierName = getText('IGUI_modifier_name_Shaky').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                recoil = 1.2,
            },
        },
        {
            -- modifierName = "Imprecise I",
            modifierName = getText('IGUI_modifier_name_Imprecise').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                accuracy = 0.95,
            },
        },
        {
            -- modifierName = "Imprecise II",
            modifierName = getText('IGUI_modifier_name_Imprecise').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                accuracy = 0.9,
            },
        },
        {
            -- modifierName = "Loud I",
            modifierName = getText('IGUI_modifier_name_Loud').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["sound radius"] = 1.05,
            },
        },
        {
            -- modifierName = "Loud II",
            modifierName = getText('IGUI_modifier_name_Loud').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["sound radius"] = 1.1,
            },
        },
        {
            -- modifierName = "Confusing I",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                experience = 0.9,
            },
        },
        {
            -- modifierName = "Confusing II",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                experience = 0.8,
            },
        },
        {
            -- modifierName = "Confusing III",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                experience = 0.7,
            },
        },
    },
    shitty = {
        {
            -- modifierName = "Harmless III",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.8,
            },
        },
        {
            -- modifierName = "Harmless IV",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.7,
            },
        },
        {
            -- modifierName = "Harmless V",
            modifierName = getText('IGUI_modifier_name_Harmless').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.6,
            },
        },
        {
            -- modifierName = "Slow III",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["aim time"] = 1.2,
                ["reload time"] = 1.2,
            },
        },
        {
            -- modifierName = "Slow IV",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["aim time"] = 1.3,
                ["reload time"] = 1.3,
            },
        },
        {
            -- modifierName = "Slow V",
            modifierName = getText('IGUI_modifier_name_Slow').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["aim time"] = 1.4,
                ["reload time"] = 1.4,
            },
        },
        {
            -- modifierName = "Unlucky III",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["critical chance"] = -3,
            },
        },
        {
            -- modifierName = "Unlucky IV",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["critical chance"] = -4,
            },
        },
        {
            -- modifierName = "Unlucky V",
            modifierName = getText('IGUI_modifier_name_Unlucky').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.bad,
            statsMultipliers = {
                ["critical chance"] = -5,
            },
        },
        {
            -- modifierName = "Fragile III",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["durability"] = 0.7,
            },
        },
        {
            -- modifierName = "Fragile IV",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["durability"] = 0.6,
            },
        },
        {
            -- modifierName = "Fragile V",
            modifierName = getText('IGUI_modifier_name_Fragile').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["durability"] = 0.4,
            },
        },
        {
            -- modifierName = "Shaky III",
            modifierName = getText('IGUI_modifier_name_Shaky').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                recoil = 1.3,
            },
        },
        {
            -- modifierName = "Shaky IV",
            modifierName = getText('IGUI_modifier_name_Shaky').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                recoil = 1.4,
            },
        },
        {
            -- modifierName = "Shaky V",
            modifierName = getText('IGUI_modifier_name_Shaky').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                recoil = 1.5,
            },
        },
        {
            -- modifierName = "Imprecise III",
            modifierName = getText('IGUI_modifier_name_Imprecise').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                accuracy = 0.85,
            },
        },
        {
            -- modifierName = "Imprecise IV",
            modifierName = getText('IGUI_modifier_name_Imprecise').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                accuracy = 0.75,
            },
        },
        {
            -- modifierName = "Imprecise V",
            modifierName = getText('IGUI_modifier_name_Imprecise').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                accuracy = 0.6,
            },
        },
        {
            -- modifierName = "Loud III",
            modifierName = getText('IGUI_modifier_name_Loud').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["sound radius"] = 1.15,
            },
        },
        {
            -- modifierName = "Loud IV",
            modifierName = getText('IGUI_modifier_name_Loud').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["sound radius"] = 1.25,
            },
        },
        {
            -- modifierName = "Loud V",
            modifierName = getText('IGUI_modifier_name_Loud').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["sound radius"] = 1.4,
            },
        },
        {
            -- modifierName = "Thunderous",
            modifierName = getText('IGUI_modifier_name_Thunderous'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["sound radius"] = 2,
            },
        },
        {
            -- modifierName = "Damaged I",
            modifierName = getText('IGUI_modifier_name_Damaged').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.9,
                recoil = 1.1,
                ["sound radius"] = 1.1,
                durability = 0.9,
            },
        },
        {
            -- modifierName = "Damaged II",
            modifierName = getText('IGUI_modifier_name_Damaged').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.8,
                recoil = 1.2,
                ["sound radius"] = 1.2,
                durability = 0.8,
            },
        },
        {
            -- modifierName = "Damaged III",
            modifierName = getText('IGUI_modifier_name_Damaged').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.7,
                recoil = 1.3,
                ["sound radius"] = 1.3,
                durability = 0.7,
            },
        },
        {
            -- modifierName = "Awkward I",
            modifierName = getText('IGUI_modifier_name_Awkward').." "..getText('IGUI_modifier_name_level1'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["maximum range"] = 0.9,
                recoil = 1.1,
                ["reload time"] = 1.1,
            },
        },
        {
            -- modifierName = "Awkward II",
            modifierName = getText('IGUI_modifier_name_Awkward').." "..getText('IGUI_modifier_name_level2'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["maximum range"] = 0.8,
                recoil = 1.2,
                ["reload time"] = 1.2,
            },
        },
        {
            -- modifierName = "Awkward III",
            modifierName = getText('IGUI_modifier_name_Awkward').." "..getText('IGUI_modifier_name_level3'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["maximum range"] = 0.7,
                recoil = 1.3,
                ["reload time"] = 1.3,
            },
        },
        {
            -- modifierName = "Awkward IV",
            modifierName = getText('IGUI_modifier_name_Awkward').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["maximum range"] = 0.6,
                recoil = 1.4,
                ["reload time"] = 1.4,
            },
        },
        {
            -- modifierName = "Awkward V",
            modifierName = getText('IGUI_modifier_name_Awkward').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                ["maximum range"] = 0.5,
                recoil = 1.5,
                ["reload time"] = 1.5,
            },
        },
        {
            -- modifierName = "Broken",
            modifierName = getText('IGUI_modifier_name_Broken'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                damage = 0.5,
                durability = 0.2,
                recoil = 2,
                ["reload time"] = 2,
            },
        },
        {
            -- modifierName = "Confusing IV",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level4'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                experience = 0.4,
            },
        },
        {
            -- modifierName = "Confusing V",
            modifierName = getText('IGUI_modifier_name_Confusing').." "..getText('IGUI_modifier_name_level5'),
            fontColor = RarityColors.shitty,
            statsMultipliers = {
                experience = 0.25,
            },
        },
    }
}

-- Modifiers.Containers = { -- backbacks
    


--     {
--         modifierName = "Efficient I",
--         fontColor = RarityColors.common,
--         statsMultipliers = {
--             ["weight reduction"] = 1,
--         },
--     },
--     {
--         modifierName = "Efficient II",
--         fontColor = RarityColors.good,
--         statsMultipliers = {
--             ["weight reduction"] = 2,
--         },
--     },
--     {
--         modifierName = "Efficient III",
--         fontColor = RarityColors.great,
--         statsMultipliers = {
--             ["weight reduction"] = 3,
--         },
--     },
--     {
--         modifierName = "Efficient IV",
--         fontColor = RarityColors.epic,
--         statsMultipliers = {
--             ["weight reduction"] = 4,
--         },
--     },
--     {
--         modifierName = "Efficient V",
--         fontColor = RarityColors.insane,
--         statsMultipliers = {
--             ["weight reduction"] = 5,
--         },
--     },
--     {
--         modifierName = "Inefficient I",
--         fontColor = RarityColors.bad,
--         statsMultipliers = {
--             ["weight reduction"] = -1,
--         },
--     },
--     {
--         modifierName = "Inefficient II",
--         fontColor = RarityColors.bad,
--         statsMultipliers = {
--             ["weight reduction"] = -2,
--         },
--     },
--     {
--         modifierName = "Inefficient III",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             ["weight reduction"] = -3,
--         },
--     },
--     {
--         modifierName = "Inefficient IV",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             ["weight reduction"] = -4,
--         },
--     },
--     {
--         modifierName = "Inefficient V",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             ["weight reduction"] = -5,
--         },
--     },
--     {
--         modifierName = "Small I",
--         fontColor = RarityColors.bad,
--         statsMultipliers = {
--             capacity = -1,
--         },
--     },
--     {
--         modifierName = "Small II",
--         fontColor = RarityColors.bad,
--         statsMultipliers = {
--             capacity = -2,
--         },
--     },
--     {
--         modifierName = "Small III",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -3,
--         },
--     },
--     {
--         modifierName = "Small IV",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -4,
--         },
--     },
--     {
--         modifierName = "Small V",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -5,
--         },
--     },
--     {
--         modifierName = "Large I",
--         fontColor = RarityColors.common,
--         statsMultipliers = {
--             capacity = 1,
--         },
--     },
--     {
--         modifierName = "Large II",
--         fontColor = RarityColors.good,
--         statsMultipliers = {
--             capacity = 2,
--         },
--     },
--     {
--         modifierName = "Large III",
--         fontColor = RarityColors.great,
--         statsMultipliers = {
--             capacity = 3,
--         },
--     },
--     {
--         modifierName = "Large IV",
--         fontColor = RarityColors.epic,
--         statsMultipliers = {
--             capacity = 4,
--         },
--     },
--     {
--         modifierName = "Large V",
--         fontColor = RarityColors.insane,
--         statsMultipliers = {
--             capacity = 5,
--         },
--     },
--     {
--         modifierName = "Shitty",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -6,
--             ["weight reduction"] = -6
--         },
--     },
--     {
--         modifierName = "Legendary",
--         fontColor = RarityColors.legendary,
--         statsMultipliers = {
--             capacity = 8,
--             ["weight reduction"] = 8,
--             -- weight = 0.5
--         },
--     },
--     {
--         modifierName = "Superior I",
--         fontColor = RarityColors.good,
--         statsMultipliers = {
--             capacity = 1,
--             ["weight reduction"] = 1
--         },
--     },
--     {
--         modifierName = "Superior II",
--         fontColor = RarityColors.great,
--         statsMultipliers = {
--             capacity = 2,
--             ["weight reduction"] = 2
--         },
--     },
--     {
--         modifierName = "Superior III",
--         fontColor = RarityColors.epic,
--         statsMultipliers = {
--             capacity = 3,
--             ["weight reduction"] = 3
--         },
--     },
--     {
--         modifierName = "Superior IV",
--         fontColor = RarityColors.insane,
--         statsMultipliers = {
--             capacity = 4,
--             ["weight reduction"] = 4
--         },
--     },
--     {
--         modifierName = "Superior V",
--         fontColor = RarityColors.legendary,
--         statsMultipliers = {
--             capacity = 5,
--             ["weight reduction"] = 5
--         },
--     },
--     {
--         modifierName = "Inferior I",
--         fontColor = RarityColors.bad,
--         statsMultipliers = {
--             capacity = -1,
--             ["weight reduction"] = -1
--         },
--     },
--     {
--         modifierName = "Inferior II",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -2,
--             ["weight reduction"] = -2
--         },
--     },
--     {
--         modifierName = "Inferior III",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -3,
--             ["weight reduction"] = -3
--         },
--     },
--     {
--         modifierName = "Inferior IV",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -4,
--             ["weight reduction"] = -4
--         },
--     },
--     {
--         modifierName = "Inferior V",
--         fontColor = RarityColors.shitty,
--         statsMultipliers = {
--             capacity = -5,
--             ["weight reduction"] = -5
--         },
--     },
--     {
--         modifierName = "Compact I",
--         fontColor = RarityColors.common,
--         statsMultipliers = {
--             capacity = -1,
--             ["weight reduction"] = 2
--         },
--     },
--     {
--         modifierName = "Compact II",
--         fontColor = RarityColors.common,
--         statsMultipliers = {
--             capacity = -2,
--             ["weight reduction"] = 4
--         },
--     },
--     {
--         modifierName = "Compact III",
--         fontColor = RarityColors.good,
--         statsMultipliers = {
--             capacity = -3,
--             ["weight reduction"] = 6
--         },
--     },
--     {
--         modifierName = "Compact IV",
--         fontColor = RarityColors.great,
--         statsMultipliers = {
--             capacity = -4,
--             ["weight reduction"] = 8
--         },
--     },
--     {
--         modifierName = "Compact V",
--         fontColor = RarityColors.epic,
--         statsMultipliers = {
--             capacity = -5,
--             ["weight reduction"] = 10
--         },
--     },
--     {
--         modifierName = "Loose I",
--         fontColor = RarityColors.common,
--         statsMultipliers = {
--             capacity = 2,
--             ["weight reduction"] = -2
--         },
--     },
--     {
--         modifierName = "Loose II",
--         fontColor = RarityColors.common,
--         statsMultipliers = {
--             capacity = 4,
--             ["weight reduction"] = -4
--         },
--     },
--     {
--         modifierName = "Loose III",
--         fontColor = RarityColors.good,
--         statsMultipliers = {
--             capacity = 6,
--             ["weight reduction"] = -6
--         },
--     },
--     {
--         modifierName = "Loose IV",
--         fontColor = RarityColors.great,
--         statsMultipliers = {
--             capacity = 8,
--             ["weight reduction"] = -8
--         },
--     },
--     {
--         modifierName = "Loose V",
--         fontColor = RarityColors.epic,
--         statsMultipliers = {
--             capacity = 10,
--             ["weight reduction"] = -10
--         },
--     },
-- }


-- end