

RarityColors = {
    -- Modifier's color
    bad = {0.9, 0.1, 0.1},       -- red
    good = {0.2, 1, 0.2},         -- green
    rare = {1, 0.6, 0.1},         -- light orange
    -- stats' color
    negativeStats = {0.9, 0.1, 0.1},    -- bad stats of modifier in red
    positiveStats = {0.2, 1, 0.2},      -- good stats of modifier in green
    infoStats = {0.9, 0.9, 0.1},        -- info stats on the weapon in yellow
}
Modifiers = {}

-- LongBlunt :  Big
-- ShortBlunt :  Big
-- LongBlade :  Razor-Edged, Razor-Sharp, Cutting, Honed, Keen
-- ShortBlade :  Razor-Edged, Razor-Sharp, Cutting, Honed, Keen
-- Spear : Long 
DefaultModifier = {
    modifierName = getText("Tooltip_modifier_standard"),
    statsMultipliers = {
        damage = 1,
        ["attack speed"] = 1,
        ["critical chance"] = 0,
        ["minimum range"] = 1,
        ["maximum range"] = 1,
        knockback = 1,
        ["endurance cost"] = 1, 
        ["durability"] = 1,
        weight = 1, -- custom weight doesn't work
        accuracy = 1,
        ["sound radius"] = 1,
        recoil = 1,
        ["reload time"] = 1,
        ["aim time"] = 1,
        experience = 1
    },
    fontColor = {1, 1, 1},
}

Modifiers.Melee = {
    Axe = {
        rare = {
            {
                -- -- modifierName = "Modified",
                modifierName = getText("IGUI_modifier_name_Modified"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.5,
                    ["attack speed"] = 0.7,
                    ["critical chance"] = 10,
                    ["maximum range"] = 1.1,
                    knockback = 1.3,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                },
            },
            {
                -- -- modifierName = "Five-Star",
                modifierName = getText("IGUI_modifier_name_FiveStar"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    ["endurance cost"] = 0.7, 
                    ["durability"] = 1.3,
                    experience = 1.3,
                },
            },
            {
                -- -- modifierName = "First-Rate",
                modifierName = getText("IGUI_modifier_name_FirstRate"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.1,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 2,
                    knockback = 1.1,
                    ["endurance cost"] = 0.9, 
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },

        },
        good = {
            {
                -- modifierName = "Pointy",
                modifierName = getText("IGUI_modifier_name_Pointy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["critical chance"] = 8,
                },
            },
            {
                -- modifierName = "Sharpened",
                modifierName = getText("IGUI_modifier_name_Sharpened"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.3,
                    ["critical chance"] = 5,
                },
            },
            {
                -- modifierName = "Tampered",
                modifierName = getText("IGUI_modifier_name_Tampered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.9,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 10,
                    ["minimum range"] = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "User-Friendly",
                modifierName = getText("IGUI_modifier_name_UserFriendly"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.8,
                    experience = 1.2
                },
            },
            {
                -- modifierName = "Improved",
                modifierName = getText("IGUI_modifier_name_Improved"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.08,
                    ["attack speed"] = 1.08,
                    knockback = 1.08,
                },
            },
            {
                -- modifierName = "Tinkered",
                modifierName = getText("IGUI_modifier_name_Tinkered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    ["attack speed"] = 0.9,
                    ["critical chance"] = 3,
                    knockback = 1.2,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                    experience = 0.9
                },
            },
            {
                -- modifierName = "Well-Designed",
                modifierName = getText("IGUI_modifier_name_WellDesigned"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },
            {
                -- modifierName = "Reinforced",
                modifierName = getText("IGUI_modifier_name_Reinforced"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    knockback = 1.2,
                    ["durability"] = 1.2,
                    ["critical chance"] = 2,
                },
            },
            {
                -- modifierName = "Large",
                modifierName = getText("IGUI_modifier_name_Large"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 1.1,
                    ["maximum range"] = 1.1,
                },
            },
            {
                -- modifierName = "Small",
                modifierName = getText("IGUI_modifier_name_Small"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["maximum range"] = 0.9,
                },
            },
            {
                -- modifierName = "Sturdy",
                modifierName = getText("IGUI_modifier_name_Sturdy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["durability"] = 1.3,
                },
            },
            {
                -- modifierName = "Quality",
                modifierName = getText("IGUI_modifier_name_Quality"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.05,
                    ["durability"] = 1.1,
                },
            },
            {
                -- modifierName = "Heavy",
                modifierName = getText("IGUI_modifier_name_Heavy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    knockback = 1.2,
                    ["attack speed"] = 0.9,
                    ["endurance cost"] = 1.1, 
                },
            },
            {
                -- modifierName = "Light",
                modifierName = getText("IGUI_modifier_name_Light"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["attack speed"] = 1.1,
                    ["endurance cost"] = 0.9, 
                },
            },
        },
        bad = {
            {
                -- modifierName = "Rusty",
                modifierName = getText("IGUI_modifier_name_Rusty"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.7,
                    ["critical chance"] = -3,
                    ["endurance cost"] = 0.7, 
                    experience = 0.7
                },
            },
            {
                -- modifierName = "Dull",
                modifierName = getText("IGUI_modifier_name_Dull"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.7,
                    ["critical chance"] = -5,
                },
            },
            {
                -- modifierName = "Used",
                modifierName = getText("IGUI_modifier_name_Used"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["critical chance"] = -4,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Old",
                modifierName = getText("IGUI_modifier_name_Old"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    knockback = 0.8,
                },
            },
            {
                -- modifierName = "Faulty",
                modifierName = getText("IGUI_modifier_name_Faulty"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["critical chance"] = -5,
                    knockback = 0.95,
                    experience = 0.95
                },
            },
            {
                -- modifierName = "Low-Quality",
                modifierName = getText("IGUI_modifier_name_LowQuality"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Damaged",
                modifierName = getText("IGUI_modifier_name_Damaged"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Fragile",
                modifierName = getText("IGUI_modifier_name_Fragile"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    ["durability"] = 0.7,
                },
            },
            {
                -- modifierName = "Broken",
                modifierName = getText("IGUI_modifier_name_Broken"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.5,
                    ["durability"] = 0.5,
                },
            },
        }
    },
    Blunt = {
        rare = {
            {
                -- modifierName = "Modified",
                modifierName = getText("IGUI_modifier_name_Modified"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.5,
                    ["attack speed"] = 0.7,
                    ["critical chance"] = 10,
                    ["maximum range"] = 1.1,
                    knockback = 1.3,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Five-Star",
                modifierName = getText("IGUI_modifier_name_FiveStar"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    ["endurance cost"] = 0.7, 
                    ["durability"] = 1.3,
                    experience = 1.3,
                },
            },
            {
                -- modifierName = "First-Rate",
                modifierName = getText("IGUI_modifier_name_FirstRate"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.1,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 2,
                    knockback = 1.1,
                    ["endurance cost"] = 0.9, 
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },

        },
        good = {
            {
                -- modifierName = "Big",
                modifierName = getText("IGUI_modifier_name_Big"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["maximum range"] = 1.15,
                    knockback = 1.15,
                },
            },
            {
                -- modifierName = "Tampered",
                modifierName = getText("IGUI_modifier_name_Tampered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.9,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 10,
                    ["minimum range"] = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "User-Friendly",
                modifierName = getText("IGUI_modifier_name_UserFriendly"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.8,
                    experience = 1.2
                },
            },
            {
                -- modifierName = "Improved",
                modifierName = getText("IGUI_modifier_name_Improved"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.08,
                    ["attack speed"] = 1.08,
                    knockback = 1.08,
                },
            },
            {
                -- modifierName = "Tinkered",
                modifierName = getText("IGUI_modifier_name_Tinkered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    ["attack speed"] = 0.9,
                    ["critical chance"] = 3,
                    knockback = 1.2,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                    experience = 0.9
                },
            },
            {
                -- modifierName = "Well-Designed",
                modifierName = getText("IGUI_modifier_name_WellDesigned"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },
            {
                -- modifierName = "Reinforced",
                modifierName = getText("IGUI_modifier_name_Reinforced"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    knockback = 1.2,
                    ["durability"] = 1.2,
                    ["critical chance"] = 2,
                },
            },
            {
                -- modifierName = "Large",
                modifierName = getText("IGUI_modifier_name_Large"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 1.1,
                    ["maximum range"] = 1.1,
                },
            },
            {
                -- modifierName = "Small",
                modifierName = getText("IGUI_modifier_name_Small"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["maximum range"] = 0.9,
                },
            },
            {
                -- modifierName = "Sturdy",
                modifierName = getText("IGUI_modifier_name_Sturdy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["durability"] = 1.3,
                },
            },
            {
                -- modifierName = "Quality",
                modifierName = getText("IGUI_modifier_name_Quality"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.05,
                    ["durability"] = 1.1,
                },
            },
            {
                -- modifierName = "Heavy",
                modifierName = getText("IGUI_modifier_name_Heavy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    knockback = 1.2,
                    ["attack speed"] = 0.9,
                    ["endurance cost"] = 1.1, 
                },
            },
            {
                -- modifierName = "Light",
                modifierName = getText("IGUI_modifier_name_Light"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["attack speed"] = 1.1,
                    ["endurance cost"] = 0.9, 
                },
            },
        },
        bad = {
            {
                -- modifierName = "Curved",
                modifierName = getText("IGUI_modifier_name_Curved"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.9,
                    knockback = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "Bent",
                modifierName = getText("IGUI_modifier_name_Bent"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["durability"] = 0.8,
                    experience = 0.8,
                },
            },
            {
                -- modifierName = "Used",
                modifierName = getText("IGUI_modifier_name_Used"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["critical chance"] = -4,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Old",
                modifierName = getText("IGUI_modifier_name_Old"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    knockback = 0.8,
                },
            },
            {
                -- modifierName = "Faulty",
                modifierName = getText("IGUI_modifier_name_Faulty"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["critical chance"] = -5,
                    knockback = 0.95,
                    experience = 0.95
                },
            },
            {
                -- modifierName = "Low-Quality",
                modifierName = getText("IGUI_modifier_name_LowQuality"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Damaged",
                modifierName = getText("IGUI_modifier_name_Damaged"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Fragile",
                modifierName = getText("IGUI_modifier_name_Fragile"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    ["durability"] = 0.7,
                },
            },
            {
                -- modifierName = "Broken",
                modifierName = getText("IGUI_modifier_name_Broken"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.5,
                    ["durability"] = 0.5,
                },
            },
        }
    },
    SmallBlunt = {
        rare = {
            {
                -- modifierName = "Modified",
                modifierName = getText("IGUI_modifier_name_Modified"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.5,
                    ["attack speed"] = 0.7,
                    ["critical chance"] = 10,
                    ["maximum range"] = 1.1,
                    knockback = 1.3,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Five-Star",
                modifierName = getText("IGUI_modifier_name_FiveStar"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    ["endurance cost"] = 0.7, 
                    ["durability"] = 1.3,
                    experience = 1.3,
                },
            },
            {
                -- modifierName = "First-Rate",
                modifierName = getText("IGUI_modifier_name_FirstRate"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.1,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 2,
                    knockback = 1.1,
                    ["endurance cost"] = 0.9, 
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },

        },
        good = {
            {
                -- modifierName = "Big",
                modifierName = getText("IGUI_modifier_name_Big"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["maximum range"] = 1.15,
                    knockback = 1.15,
                },
            },
            {
                -- modifierName = "Tampered",
                modifierName = getText("IGUI_modifier_name_Tampered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.9,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 10,
                    ["minimum range"] = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "User-Friendly",
                modifierName = getText("IGUI_modifier_name_UserFriendly"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.8,
                    experience = 1.2
                },
            },
            {
                -- modifierName = "Improved",
                modifierName = getText("IGUI_modifier_name_Improved"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.08,
                    ["attack speed"] = 1.08,
                    knockback = 1.08,
                },
            },
            {
                -- modifierName = "Tinkered",
                modifierName = getText("IGUI_modifier_name_Tinkered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    ["attack speed"] = 0.9,
                    ["critical chance"] = 3,
                    knockback = 1.2,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                    experience = 0.9
                },
            },
            {
                -- modifierName = "Well-Designed",
                modifierName = getText("IGUI_modifier_name_WellDesigned"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },
            {
                -- modifierName = "Reinforced",
                modifierName = getText("IGUI_modifier_name_Reinforced"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    knockback = 1.2,
                    ["durability"] = 1.2,
                    ["critical chance"] = 2,
                },
            },
            {
                -- modifierName = "Large",
                modifierName = getText("IGUI_modifier_name_Large"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 1.1,
                    ["maximum range"] = 1.1,
                },
            },
            {
                -- modifierName = "Small",
                modifierName = getText("IGUI_modifier_name_Small"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["maximum range"] = 0.9,
                },
            },
            {
                -- modifierName = "Sturdy",
                modifierName = getText("IGUI_modifier_name_Sturdy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["durability"] = 1.3,
                },
            },
            {
                -- modifierName = "Quality",
                modifierName = getText("IGUI_modifier_name_Quality"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.05,
                    ["durability"] = 1.1,
                },
            },
            {
                -- modifierName = "Heavy",
                modifierName = getText("IGUI_modifier_name_Heavy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    knockback = 1.2,
                    ["attack speed"] = 0.9,
                    ["endurance cost"] = 1.1, 
                },
            },
            {
                -- modifierName = "Light",
                modifierName = getText("IGUI_modifier_name_Light"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["attack speed"] = 1.1,
                    ["endurance cost"] = 0.9, 
                },
            },
        },
        bad = {
            {
                -- modifierName = "Curved",
                modifierName = getText("IGUI_modifier_name_Curved"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.9,
                    knockback = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "Bent",
                modifierName = getText("IGUI_modifier_name_Bent"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["durability"] = 0.8,
                    experience = 0.8,
                },
            },
            {
                -- modifierName = "Used",
                modifierName = getText("IGUI_modifier_name_Used"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["critical chance"] = -4,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Old",
                modifierName = getText("IGUI_modifier_name_Old"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    knockback = 0.8,
                },
            },
            {
                -- modifierName = "Faulty",
                modifierName = getText("IGUI_modifier_name_Faulty"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["critical chance"] = -5,
                    knockback = 0.95,
                    experience = 0.95
                },
            },
            {
                -- modifierName = "Low-Quality",
                modifierName = getText("IGUI_modifier_name_LowQuality"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Damaged",
                modifierName = getText("IGUI_modifier_name_Damaged"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Fragile",
                modifierName = getText("IGUI_modifier_name_Fragile"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    ["durability"] = 0.7,
                },
            },
            {
                -- modifierName = "Broken",
                modifierName = getText("IGUI_modifier_name_Broken"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.5,
                    ["durability"] = 0.5,
                },
            },
        }
    },
    LongBlade = {
        rare = {
            {
                -- modifierName = "Modified",
                modifierName = getText("IGUI_modifier_name_Modified"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.5,
                    ["attack speed"] = 0.7,
                    ["critical chance"] = 10,
                    ["maximum range"] = 1.1,
                    knockback = 1.3,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Five-Star",
                modifierName = getText("IGUI_modifier_name_FiveStar"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    ["endurance cost"] = 0.7, 
                    ["durability"] = 1.3,
                    experience = 1.3,
                },
            },
            {
                -- modifierName = "First-Rate",
                modifierName = getText("IGUI_modifier_name_FirstRate"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.1,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 2,
                    knockback = 1.1,
                    ["endurance cost"] = 0.9, 
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },

        },
        good = {
            {
                -- modifierName = "Pointy",
                modifierName = getText("IGUI_modifier_name_Pointy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["critical chance"] = 8,
                },
            },
            {
                -- modifierName = "Sharpened",
                modifierName = getText("IGUI_modifier_name_Sharpened"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.3,
                    ["critical chance"] = 5,
                },
            },
            {
                -- modifierName = "Tampered",
                modifierName = getText("IGUI_modifier_name_Tampered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.9,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 10,
                    ["minimum range"] = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "User-Friendly",
                modifierName = getText("IGUI_modifier_name_UserFriendly"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.8,
                    experience = 1.2
                },
            },
            {
                -- modifierName = "Improved",
                modifierName = getText("IGUI_modifier_name_Improved"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.08,
                    ["attack speed"] = 1.08,
                    knockback = 1.08,
                },
            },
            {
                -- modifierName = "Tinkered",
                modifierName = getText("IGUI_modifier_name_Tinkered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    ["attack speed"] = 0.9,
                    ["critical chance"] = 3,
                    knockback = 1.2,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                    experience = 0.9
                },
            },
            {
                -- modifierName = "Well-Designed",
                modifierName = getText("IGUI_modifier_name_WellDesigned"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },
            {
                -- modifierName = "Reinforced",
                modifierName = getText("IGUI_modifier_name_Reinforced"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    knockback = 1.2,
                    ["durability"] = 1.2,
                    ["critical chance"] = 2,
                },
            },
            {
                -- modifierName = "Large",
                modifierName = getText("IGUI_modifier_name_Large"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 1.1,
                    ["maximum range"] = 1.1,
                },
            },
            {
                -- modifierName = "Small",
                modifierName = getText("IGUI_modifier_name_Small"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["maximum range"] = 0.9,
                },
            },
            {
                -- modifierName = "Sturdy",
                modifierName = getText("IGUI_modifier_name_Sturdy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["durability"] = 1.3,
                },
            },
            {
                -- modifierName = "Quality",
                modifierName = getText("IGUI_modifier_name_Quality"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.05,
                    ["durability"] = 1.1,
                },
            },
            {
                -- modifierName = "Heavy",
                modifierName = getText("IGUI_modifier_name_Heavy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    knockback = 1.2,
                    ["attack speed"] = 0.9,
                    ["endurance cost"] = 1.1, 
                },
            },
            {
                -- modifierName = "Light",
                modifierName = getText("IGUI_modifier_name_Light"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["attack speed"] = 1.1,
                    ["endurance cost"] = 0.9, 
                },
            },
        },
        bad = {
            {
                -- modifierName = "Rusty",
                modifierName = getText("IGUI_modifier_name_Rusty"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.7,
                    ["critical chance"] = -3,
                    ["endurance cost"] = 0.7, 
                    experience = 0.7
                },
            },
            {
                -- modifierName = "Dull",
                modifierName = getText("IGUI_modifier_name_Dull"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.7,
                    ["critical chance"] = -5,
                },
            },
            {
                -- modifierName = "Used",
                modifierName = getText("IGUI_modifier_name_Used"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["critical chance"] = -4,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Old",
                modifierName = getText("IGUI_modifier_name_Old"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    knockback = 0.8,
                },
            },
            {
                -- modifierName = "Faulty",
                modifierName = getText("IGUI_modifier_name_Faulty"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["critical chance"] = -5,
                    knockback = 0.95,
                    experience = 0.95
                },
            },
            {
                -- modifierName = "Low-Quality",
                modifierName = getText("IGUI_modifier_name_LowQuality"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Damaged",
                modifierName = getText("IGUI_modifier_name_Damaged"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Fragile",
                modifierName = getText("IGUI_modifier_name_Fragile"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    ["durability"] = 0.7,
                },
            },
            {
                -- modifierName = "Broken",
                modifierName = getText("IGUI_modifier_name_Broken"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.5,
                    ["durability"] = 0.5,
                },
            },
        }
    },
    SmallBlade = {
        rare = {
            {
                -- modifierName = "Modified",
                modifierName = getText("IGUI_modifier_name_Modified"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.5,
                    ["attack speed"] = 0.7,
                    ["critical chance"] = 10,
                    ["maximum range"] = 1.1,
                    knockback = 1.3,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Five-Star",
                modifierName = getText("IGUI_modifier_name_FiveStar"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    ["endurance cost"] = 0.7, 
                    ["durability"] = 1.3,
                    experience = 1.3,
                },
            },
            {
                -- modifierName = "First-Rate",
                modifierName = getText("IGUI_modifier_name_FirstRate"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.1,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 2,
                    knockback = 1.1,
                    ["endurance cost"] = 0.9, 
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },

        },
        good = {
            {
                -- modifierName = "Pointy",
                modifierName = getText("IGUI_modifier_name_Pointy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["critical chance"] = 8,
                },
            },
            {
                -- modifierName = "Sharpened",
                modifierName = getText("IGUI_modifier_name_Sharpened"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.3,
                    ["critical chance"] = 5,
                },
            },
            {
                -- modifierName = "Tampered",
                modifierName = getText("IGUI_modifier_name_Tampered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.9,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 10,
                    ["minimum range"] = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "User-Friendly",
                modifierName = getText("IGUI_modifier_name_UserFriendly"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.8,
                    experience = 1.2
                },
            },
            {
                -- modifierName = "Improved",
                modifierName = getText("IGUI_modifier_name_Improved"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.08,
                    ["attack speed"] = 1.08,
                    knockback = 1.08,
                },
            },
            {
                -- modifierName = "Tinkered",
                modifierName = getText("IGUI_modifier_name_Tinkered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    ["attack speed"] = 0.9,
                    ["critical chance"] = 3,
                    knockback = 1.2,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                    experience = 0.9
                },
            },
            {
                -- modifierName = "Well-Designed",
                modifierName = getText("IGUI_modifier_name_WellDesigned"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },
            {
                -- modifierName = "Reinforced",
                modifierName = getText("IGUI_modifier_name_Reinforced"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    knockback = 1.2,
                    ["durability"] = 1.2,
                    ["critical chance"] = 2,
                },
            },
            {
                -- modifierName = "Large",
                modifierName = getText("IGUI_modifier_name_Large"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 1.1,
                    ["maximum range"] = 1.1,
                },
            },
            {
                -- modifierName = "Small",
                modifierName = getText("IGUI_modifier_name_Small"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["maximum range"] = 0.9,
                },
            },
            {
                -- modifierName = "Sturdy",
                modifierName = getText("IGUI_modifier_name_Sturdy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["durability"] = 1.3,
                },
            },
            {
                -- modifierName = "Quality",
                modifierName = getText("IGUI_modifier_name_Quality"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.05,
                    ["durability"] = 1.1,
                },
            },
            {
                -- modifierName = "Heavy",
                modifierName = getText("IGUI_modifier_name_Heavy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    knockback = 1.2,
                    ["attack speed"] = 0.9,
                    ["endurance cost"] = 1.1, 
                },
            },
            {
                -- modifierName = "Light",
                modifierName = getText("IGUI_modifier_name_Light"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["attack speed"] = 1.1,
                    ["endurance cost"] = 0.9, 
                },
            },
        },
        bad = {
            {
                -- modifierName = "Rusty",
                modifierName = getText("IGUI_modifier_name_Rusty"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.7,
                    ["critical chance"] = -3,
                    ["endurance cost"] = 0.7, 
                    experience = 0.7
                },
            },
            {
                -- modifierName = "Dull",
                modifierName = getText("IGUI_modifier_name_Dull"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.7,
                    ["critical chance"] = -5,
                },
            },
            {
                -- modifierName = "Used",
                modifierName = getText("IGUI_modifier_name_Used"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["critical chance"] = -4,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Old",
                modifierName = getText("IGUI_modifier_name_Old"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    knockback = 0.8,
                },
            },
            {
                -- modifierName = "Faulty",
                modifierName = getText("IGUI_modifier_name_Faulty"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["critical chance"] = -5,
                    knockback = 0.95,
                    experience = 0.95
                },
            },
            {
                -- modifierName = "Low-Quality",
                modifierName = getText("IGUI_modifier_name_LowQuality"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Damaged",
                modifierName = getText("IGUI_modifier_name_Damaged"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Fragile",
                modifierName = getText("IGUI_modifier_name_Fragile"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    ["durability"] = 0.7,
                },
            },
            {
                -- modifierName = "Broken",
                modifierName = getText("IGUI_modifier_name_Broken"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.5,
                    ["durability"] = 0.5,
                },
            },
        }
    },
    Spear = {
        rare = {
            {
                -- modifierName = "Extensive",
                modifierName = getText("IGUI_modifier_name_Extensive"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.1,
                    ["maximum range"] = 1.1,
                    ["critical chance"] = 5,
                },
            },
            {
                -- modifierName = "Modified",
                modifierName = getText("IGUI_modifier_name_Modified"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.5,
                    ["attack speed"] = 0.7,
                    ["critical chance"] = 10,
                    ["maximum range"] = 1.1,
                    knockback = 1.3,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Five-Star",
                modifierName = getText("IGUI_modifier_name_FiveStar"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    ["endurance cost"] = 0.7, 
                    ["durability"] = 1.3,
                    experience = 1.3,
                },
            },
            {
                -- modifierName = "First-Rate",
                modifierName = getText("IGUI_modifier_name_FirstRate"),
                fontColor = RarityColors.rare,
                statsMultipliers = {
                    damage = 1.1,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 2,
                    knockback = 1.1,
                    ["endurance cost"] = 0.9, 
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },

        },
        good = {
            {
                -- modifierName = "Long",
                modifierName = getText("IGUI_modifier_name_Long"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["maximum range"] = 1.1,
                    ["minimum range"] = 1.1,
                },
            },
            {
                -- modifierName = "Pointy",
                modifierName = getText("IGUI_modifier_name_Pointy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["critical chance"] = 8,
                },
            },
            {
                -- modifierName = "Sharpened",
                modifierName = getText("IGUI_modifier_name_Sharpened"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.3,
                    ["critical chance"] = 5,
                },
            },
            {
                -- modifierName = "Tampered",
                modifierName = getText("IGUI_modifier_name_Tampered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.9,
                    ["attack speed"] = 1.1,
                    ["critical chance"] = 10,
                    ["minimum range"] = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "User-Friendly",
                modifierName = getText("IGUI_modifier_name_UserFriendly"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.8,
                    experience = 1.2
                },
            },
            {
                -- modifierName = "Improved",
                modifierName = getText("IGUI_modifier_name_Improved"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.08,
                    ["attack speed"] = 1.08,
                    knockback = 1.08,
                },
            },
            {
                -- modifierName = "Tinkered",
                modifierName = getText("IGUI_modifier_name_Tinkered"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    ["attack speed"] = 0.9,
                    ["critical chance"] = 3,
                    knockback = 1.2,
                    ["endurance cost"] = 1.1, 
                    ["durability"] = 0.9,
                    experience = 0.9
                },
            },
            {
                -- modifierName = "Well-Designed",
                modifierName = getText("IGUI_modifier_name_WellDesigned"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["durability"] = 1.1,
                    experience = 1.1,
                },
            },
            {
                -- modifierName = "Reinforced",
                modifierName = getText("IGUI_modifier_name_Reinforced"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    knockback = 1.2,
                    ["durability"] = 1.2,
                    ["critical chance"] = 2,
                },
            },
            {
                -- modifierName = "Large",
                modifierName = getText("IGUI_modifier_name_Large"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 1.1,
                    ["maximum range"] = 1.1,
                },
            },
            {
                -- modifierName = "Small",
                modifierName = getText("IGUI_modifier_name_Small"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["minimum range"] = 0.9,
                    ["maximum range"] = 0.9,
                },
            },
            {
                -- modifierName = "Sturdy",
                modifierName = getText("IGUI_modifier_name_Sturdy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    ["durability"] = 1.3,
                },
            },
            {
                -- modifierName = "Quality",
                modifierName = getText("IGUI_modifier_name_Quality"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.05,
                    ["durability"] = 1.1,
                },
            },
            {
                -- modifierName = "Heavy",
                modifierName = getText("IGUI_modifier_name_Heavy"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 1.2,
                    knockback = 1.2,
                    ["attack speed"] = 0.9,
                    ["endurance cost"] = 1.1, 
                },
            },
            {
                -- modifierName = "Light",
                modifierName = getText("IGUI_modifier_name_Light"),
                fontColor = RarityColors.good,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["attack speed"] = 1.1,
                    ["endurance cost"] = 0.9, 
                },
            },
        },
        bad = {
            {
                -- modifierName = "Curved",
                modifierName = getText("IGUI_modifier_name_Curved"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.9,
                    knockback = 0.9,
                    ["durability"] = 0.9,
                    experience = 0.9,
                },
            },
            {
                -- modifierName = "Bent",
                modifierName = getText("IGUI_modifier_name_Bent"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    knockback = 0.8,
                    ["durability"] = 0.8,
                    experience = 0.8,
                },
            },
            {
                -- modifierName = "Used",
                modifierName = getText("IGUI_modifier_name_Used"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["critical chance"] = -4,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Old",
                modifierName = getText("IGUI_modifier_name_Old"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    knockback = 0.8,
                },
            },
            {
                -- modifierName = "Faulty",
                modifierName = getText("IGUI_modifier_name_Faulty"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["critical chance"] = -5,
                    knockback = 0.95,
                    experience = 0.95
                },
            },
            {
                -- modifierName = "Low-Quality",
                modifierName = getText("IGUI_modifier_name_LowQuality"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.95,
                    ["durability"] = 0.9,
                },
            },
            {
                -- modifierName = "Damaged",
                modifierName = getText("IGUI_modifier_name_Damaged"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.8,
                    ["durability"] = 0.8,
                },
            },
            {
                -- modifierName = "Fragile",
                modifierName = getText("IGUI_modifier_name_Fragile"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    ["durability"] = 0.7,
                },
            },
            {
                -- modifierName = "Broken",
                modifierName = getText("IGUI_modifier_name_Broken"),
                fontColor = RarityColors.bad,
                statsMultipliers = {
                    damage = 0.5,
                    ["durability"] = 0.5,
                },
            },
        }
    },
    Improvised = {
        rare = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        },
        good = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        },
        bad = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        }
    },
    Unarmed = {
        rare = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        },
        good = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        },
        bad = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        }
    },
    None = {
        rare = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        },
        good = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        },
        bad = {
            {
                modifierName = getText("Tooltip_modifier_standard"),
                fontColor = RarityColors.good,
                statsMultipliers = {},
            },
        }
    }

}


Modifiers.Ranged = {
    rare = {
        {
            modifierName = getText("Tooltip_modifier_standard"),
            fontColor = RarityColors.good,
            statsMultipliers = {},
        },
    },
    good = {
        {
            modifierName = getText("Tooltip_modifier_standard"),
            fontColor = RarityColors.good,
            statsMultipliers = {},
        },
    },
    bad = {
        {
            modifierName = getText("Tooltip_modifier_standard"),
            fontColor = RarityColors.good,
            statsMultipliers = {},
        },
    },
}