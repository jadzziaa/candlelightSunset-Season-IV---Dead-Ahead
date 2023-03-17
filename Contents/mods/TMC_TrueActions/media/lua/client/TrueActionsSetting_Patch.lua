require "TrueActionsSetting"

-- #############################################################################
-- #############################################################################
-- Patchs the True Actions modification to support sitting and laying on
-- the 41.73 Victorian Chairs and Couches found in Rich Louisville districts
-- =============================================================================
-- Requires Original Mod 2487022075 (https://steamcommunity.com/sharedfiles/filedetails/?id=2487022075)
-- Original Coding by iBrRus (https://steamcommunity.com/id/ibrrus)
-- Victorian Patch By Orcicorn (https://steamcommunity.com/id/orcicorn/)
-- #############################################################################
-- #############################################################################

-- *****************************************************************************
-- Add Sit Objects *************************************************************
-- *****************************************************************************
    -- CHAIRS ------------------------------------------------------------------
    -- Victorian 1 Chair (Fancy Cloth, Peach)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_80"] = {0.70, 0.35}    -- East
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_81"] = {0.35, 0.70}    -- North

    -- Victorian 2 Chair (Fancy Cloth, Red/Pink)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_84"] = {0.70, 0.35}    -- East
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_85"] = {0.35, 0.70}    -- North

    -- Victorian 3 Chair (Fancy Cloth, Zebra)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_96"] = {0.60, 0.35}    -- East
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_97"] = {0.35, 0.60}    -- North

    -- Victorian 4 Chair (Leather, Black)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_100"] = {0.65, 0.35}    -- East
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_101"] = {0.35, 0.65}    -- North

    -- Victorian 5 Chair (Leather, Red)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_120"] = {0.65, 0.35}    -- East
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_121"] = {0.35, 0.65}    -- North

    -- Victorian 6 Chair (Leather, White)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_124"] = {0.65, 0.35}    -- East
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_125"] = {0.35, 0.65}    -- North

    -- COUCHES ------------------------------------------------------------------
    -- Victorian C1 Couch (Fancy Cloth, Red/Pink)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_72"] = {0.60, 0.35}; -- East, Left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_73"] = {0.60, 0.35}; -- East, Right Side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_74"] = {0.35, 0.60}; -- North, left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_75"] = {0.35, 0.60}; -- North, right side

    -- Victorian C2 Couch (Fancy Cloth, Peach)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_88"] = {0.60, 0.35}; -- East, Left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_89"] = {0.60, 0.35}; -- East, Right Side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_90"] = {0.35, 0.60}; -- North, left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_91"] = {0.35, 0.60}; -- North, right side

    -- Victorian C3 Couch (Fancy Cloth, Zebra)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_104"] = {0.60, 0.35}; -- East, Left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_105"] = {0.60, 0.35}; -- East, Right Side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_106"] = {0.35, 0.60}; -- North, left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_107"] = {0.35, 0.60}; -- North, right side

    -- Victorian C4 Couch (Leather, Black)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_112"] = {0.75, 0.35}; -- East, Left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_113"] = {0.75, 0.35}; -- East, Right Side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_114"] = {0.35, 0.75}; -- North, left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_115"] = {0.35, 0.75}; -- North, right side

    -- Victorian C5 Couch (Leather, Red)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_128"] = {0.75, 0.35}; -- East, Left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_129"] = {0.75, 0.35}; -- East, Right Side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_130"] = {0.35, 0.75}; -- North, left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_131"] = {0.35, 0.75}; -- North, right side

    -- Victorian C6 Couch (Leather, White)
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_136"] = {0.80, 0.35}; -- East, Left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_137"] = {0.80, 0.35}; -- East, Right Side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_138"] = {0.35, 0.80}; -- North, left side
    TrueActions.WorldSeatObject["furniture_seating_indoor_03_139"] = {0.35, 0.80}; -- North, right side


-- *****************************************************************************
-- Add Lie Objects *************************************************************
-- *****************************************************************************
    -- Victorian C1 Couch (Fancy Cloth, Red/Pink)
    TrueActions.WorldLieObject["furniture_seating_indoor_03_72"] = {{side = "R", dir = "S", x= 0.80, y = 0.35},}     -- East, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_73"] = {{side = "R", dir = "S", x= 0.65, y = 1.35},}     -- East, Right Side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_74"] = {{side = "L", dir = "E", x= 1.40, y = 1.55},}     -- Nort, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_75"] = {{side = "L", dir = "E", x= 0.40, y = 1.55},}     -- North, Right Side

    -- Victorian C2 Couch (Fancy Cloth, Peach)
    TrueActions.WorldLieObject["furniture_seating_indoor_03_88"] = {{side = "R", dir = "S", x= 0.80, y = 0.35},}     -- East, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_89"] = {{side = "R", dir = "S", x= 0.65, y = 1.35},}     -- East, Right Side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_90"] = {{side = "L", dir = "E", x= 1.40, y = 1.55},}     -- Nort, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_91"] = {{side = "L", dir = "E", x= 0.40, y = 1.55},}     -- North, Right Side

    -- Victorian C3 Couch (Fancy Cloth, Zebra)
    TrueActions.WorldLieObject["furniture_seating_indoor_03_104"] = {{side = "R", dir = "S", x= 0.80, y = 0.35},}     -- East, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_105"] = {{side = "R", dir = "S", x= 0.65, y = 1.35},}     -- East, Right Side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_106"] = {{side = "L", dir = "E", x= 1.40, y = 1.55},}     -- Nort, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_107"] = {{side = "L", dir = "E", x= 0.40, y = 1.55},}     -- North, Right Side

    -- Victorian C4 Couch (Leather, Black)
    TrueActions.WorldLieObject["furniture_seating_indoor_03_112"] = {{side = "R", dir = "S", x= 0.90, y = 0.35},}     -- East, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_113"] = {{side = "R", dir = "S", x= 0.75, y = 1.35},}     -- East, Right Side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_114"] = {{side = "L", dir = "E", x= 1.50, y = 1.65},}     -- Nort, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_115"] = {{side = "L", dir = "E", x= 0.50, y = 1.65},}     -- North, Right Side

    -- Victorian C5 Couch (Leather, Red)
    TrueActions.WorldLieObject["furniture_seating_indoor_03_128"] = {{side = "R", dir = "S", x= 0.90, y = 0.35},}     -- East, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_129"] = {{side = "R", dir = "S", x= 0.75, y = 1.35},}     -- East, Right Side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_130"] = {{side = "L", dir = "E", x= 1.50, y = 1.65},}     -- Nort, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_131"] = {{side = "L", dir = "E", x= 0.50, y = 1.65},}     -- North, Right Side

    -- Victorian C6 Couch (Leather, White)
    TrueActions.WorldLieObject["furniture_seating_indoor_03_136"] = {{side = "R", dir = "S", x= 1.00, y = 0.35},}     -- East, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_137"] = {{side = "R", dir = "S", x= 0.85, y = 1.35},}     -- East, Right Side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_138"] = {{side = "L", dir = "E", x= 1.50, y = 1.65},}     -- Nort, Left side
    TrueActions.WorldLieObject["furniture_seating_indoor_03_139"] = {{side = "L", dir = "E", x= 0.50, y = 1.65},}     -- North, Right Side
