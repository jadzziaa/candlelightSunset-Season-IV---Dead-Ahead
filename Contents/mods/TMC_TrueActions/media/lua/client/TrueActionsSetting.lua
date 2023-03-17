if not TrueActions then
    TrueActions= {}
end

TrueActions.Phrases = {}
TrueActions.Phrases.Sit = {"IGUI_PlayerText_TRUEA_OccupiedPhrases_Sit_1", "IGUI_PlayerText_TRUEA_OccupiedPhrases_2", "IGUI_PlayerText_TRUEA_OccupiedPhrases_3"}
TrueActions.Phrases.Lie = {"IGUI_PlayerText_TRUEA_OccupiedPhrases_Lie_1", "IGUI_PlayerText_TRUEA_OccupiedPhrases_2", "IGUI_PlayerText_TRUEA_OccupiedPhrases_3"}
TrueActions.Phrases.Push = {"IGUI_PlayerText_TRUEA_dont_push_1", "IGUI_PlayerText_TRUEA_dont_push_2", "IGUI_PlayerText_TRUEA_dont_push_3"}

TrueActions.WorldLieObject = {
    -- ["carpentry_02_72"] = {{side = "L", dir = "E", x = 1.3, y = 1.65}, {side = "R", dir = "E", x = 1.3, y = 1.65-1.8}}, --+
    ["carpentry_02_73"] = {{side = "L", dir = "E", x = 0.3, y = 1.65}, {side = "R", dir = "E", x = 0.3, y = 1.65-1.8}}, --+
    -- ["carpentry_02_75"] = {{side = "R", dir = "S", x = 1, y = 1.3}, {side = "L", dir = "S", x = 1-1.1, y = 1.3}}, --+
    ["carpentry_02_74"] = {{side = "R", dir = "S", x = 1, y = 0.3}, {side = "L", dir = "S", x = 1-1.1, y = 0.3}}, --+

-- Picknic Table
    -- ["camping_01_8"] = {{side = "L", dir = "E", x = 1.3, y = 1.8},},
    ["camping_01_10"] = {{side = "L", dir = "E", x = 0.3, y = 1.8},},
    -- ["camping_01_14"] = {{side = "R", dir = "S", x = 1, y = 1.3},},
    ["camping_01_13"] = {{side = "R", dir = "S", x = 1, y = 0.3},},


--Fancy Bed

    -- ["furniture_bedding_01_2"] = {{side = "L", dir = "E", x = 1.12, y = 1.6},{side = "R", dir = "E", x = 1.12, y = 1.6-1.8},},
    ["furniture_bedding_01_3"] = {{side = "L", dir = "E", x = 0.12, y = 1.6},{side = "R", dir = "E", x = 0.12, y = 1.6-1.8},},
    -- ["furniture_bedding_01_1"] = {{side = "R", dir = "S", x = 0.9, y = 1.1},{side = "L", dir = "S", x = 0.9-1.1, y = 1.1},},
    ["furniture_bedding_01_0"] = {{side = "R", dir = "S", x = 0.9, y = 0.1},{side = "L", dir = "S", x = 0.9-1.1, y = 0.1},},
    
    -- ["furniture_bedding_01_69"] = {{side = "R", dir = "S", x = 1.2, y = 1},},-- North
    -- ["furniture_bedding_01_68"] = {{side = "R", dir = "S", x = 1.2, y = 0.0},},-- North
    -- ["furniture_bedding_01_70"] = {{side = "L", dir = "E", x = 1.0, y = 1.6},},-- West
    -- ["furniture_bedding_01_71"] = {{side = "L", dir = "E", x = 0.0, y = 1.6},}, -- West
-- 2x

    -- ["furniture_bedding_01_12"] = {{side = "L", dir = "E", x = 1.12, y = 1.4},},
    ["furniture_bedding_01_13"] = {{side = "L", dir = "E", x = 0.12, y = 1.4},},
    -- ["furniture_bedding_01_14"] = {{side = "R", dir = "E", x = 1.12, y = -0.2},},
    ["furniture_bedding_01_15"] = {{side = "R", dir = "E", x = 0.12, y = -0.2},},
    
    -- ["furniture_bedding_01_5"] = {{side = "L", dir = "S", x = -0.1, y = 1.12},},
    ["furniture_bedding_01_4"] = {{side = "L", dir = "S", x = -0.1, y = 0.12},},
    -- ["furniture_bedding_01_7"] = {{side = "R", dir = "S", x = 0.8, y = 1.12},},
    ["furniture_bedding_01_6"] = {{side = "R", dir = "S", x = 0.8, y = 0.12},},
    
    -- ["furniture_bedding_01_73"] = {{side = "L", dir = "S", x = -0.05, y = 1.12},},-- North 
    -- ["furniture_bedding_01_72"] = {{side = "L", dir = "S", x = -0.05, y = 0.12},},-- North 
    -- ["furniture_bedding_01_75"] = {{side = "R", dir = "S", x = 1, y = 1.12},},-- West 
    -- ["furniture_bedding_01_74"] = {{side = "R", dir = "S", x = 1, y = 0.12},},-- West 
    
    
--Blue Bed
    -- ["furniture_bedding_01_10"] = {{side = "L", dir = "E", x = 1.12, y = 1.6},{side = "R", dir = "E", x = 1.12, y = 1.6-1.8},},
    ["furniture_bedding_01_11"] = {{side = "L", dir = "E", x = 0.12, y = 1.6},{side = "R", dir = "E", x = 0.12, y = 1.6-1.8},},
    -- ["furniture_bedding_01_9"] = {{side = "R", dir = "S", x = 0.8, y = 1.1},{side = "L", dir = "S", x = 0.8-1.1, y = 1.1},},
    ["furniture_bedding_01_8"] = {{side = "R", dir = "S", x = 0.8, y = 0.1},{side = "L", dir = "S", x = 0.8-1.1, y = 0.1},},

    
    
-- Large Modern Bed
    -- ["furniture_bedding_01_25"] = {{side = "L", dir = "S", x = -0.1, y = 1.12},},
    ["furniture_bedding_01_24"] = {{side = "L", dir = "S", x = -0.1, y = 0.12},},
    -- ["furniture_bedding_01_27"] = {{side = "R", dir = "S", x = 0.8, y = 1.12},},
    ["furniture_bedding_01_26"] = {{side = "R", dir = "S", x = 0.8, y = 0.12},},
    
    -- ["furniture_bedding_01_28"] = {{side = "L", dir = "E", x = 1.12, y = 1.5},},
    ["furniture_bedding_01_29"] = {{side = "L", dir = "E", x = 0.12, y = 1.5},},
    -- ["furniture_bedding_01_30"] = {{side = "R", dir = "E", x = 1.12, y = -0.20},},
    ["furniture_bedding_01_31"] = {{side = "R", dir = "E", x = 0.12, y = -0.20},},
    
    
-- Simple Bed
    -- ["furniture_bedding_01_32"] = {{side = "L", dir = "E", x = 1.2, y = 1.6},{side = "R", dir = "E", x = 1.2, y = 1.6-1.8},},
    ["furniture_bedding_01_33"] = {{side = "L", dir = "E", x = 0.2, y = 1.6},{side = "R", dir = "E", x = 0.2, y = 1.6-1.8},},
    -- ["furniture_bedding_01_35"] = {{side = "R", dir = "S", x = 0.8, y = 1.2},{side = "L", dir = "S", x = 0.8-1, y = 1.2},},-- +
    ["furniture_bedding_01_34"] = {{side = "R", dir = "S", x = 0.8, y = 0.2},{side = "L", dir = "S", x = 0.8-1, y = 0.2},},-- 
    
    -- ["furniture_bedding_01_60"] = {{side = "L", dir = "E", x = 1.2, y = 1.6},{side = "R", dir = "E", x = 1.2, y = 1.6-1.8},},
    ["furniture_bedding_01_61"] = {{side = "L", dir = "E", x = 0.2, y = 1.6},{side = "R", dir = "E", x = 0.2, y = 1.6-1.8},},
    -- ["furniture_bedding_01_63"] = {{side = "R", dir = "S", x = 0.8, y = 1.2},{side = "L", dir = "S", x = 0.8-1.1, y = 1.2},},-- +
    ["furniture_bedding_01_62"] = {{side = "R", dir = "S", x = 0.8, y = 0.2},{side = "L", dir = "S", x = 0.8-1.1, y = 0.2},},-- 
    
    
-- Large Oak Bed (HOME)
    -- ["furniture_bedding_01_40"] = {{side = "L", dir = "E", x = 1.12, y = 1.4},},
    ["furniture_bedding_01_41"] = {{side = "L", dir = "E", x = 0.12, y = 1.4},},
    -- ["furniture_bedding_01_42"] = {{side = "R", dir = "E", x = 1.12, y = -0.2},},
    ["furniture_bedding_01_43"] = {{side = "R", dir = "E", x = 0.12, y = -0.2},},

    -- ["furniture_bedding_01_45"] = {{side = "L", dir = "S", x = -0.1, y = 1.1},},
    ["furniture_bedding_01_44"] = {{side = "L", dir = "S", x = -0.1, y = 0.1},},
    -- ["furniture_bedding_01_47"] = {{side = "R", dir = "S", x = 0.8, y = 1.1},},
    ["furniture_bedding_01_46"] = {{side = "R", dir = "S", x = 0.8, y = 0.1},},

-- Stretcher Bed
    -- ["furniture_bedding_01_58"] = {{side = "L", dir = "E", x = 1.2, y = 1.6},{side = "R", dir = "E", x = 1.2, y = 1.6-1.8},},
    ["furniture_bedding_01_59"] = {{side = "L", dir = "E", x = 0.2, y = 1.6},{side = "R", dir = "E", x = 0.2, y = 1.6-1.8},},
    -- ["furniture_bedding_01_57"] = {{side = "R", dir = "S", x = 0.8, y = 1.2},{side = "L", dir = "S", x = 0.8-1.1, y = 1.2},},--
    ["furniture_bedding_01_56"] = {{side = "R", dir = "S", x = 0.8, y = 0.2},{side = "L", dir = "S", x = 0.8-1.1, y = 0.2},},-- 
    
    
-- Hospital Bed
    -- ["furniture_bedding_01_66"] = {{side = "L", dir = "E", x = 1.2, y = 1.6},{side = "R", dir = "E", x = 1.2, y = 1.6-1.8},},
    ["furniture_bedding_01_67"] = {{side = "L", dir = "E", x = 0.2, y = 1.6},{side = "R", dir = "E", x = 0.2, y = 1.6-1.8},},
    -- ["furniture_bedding_01_65"] = {{side = "R", dir = "S", x = 0.8, y = 1.2},{side = "L", dir = "S", x = 0.8-1, y = 1.2},},-- +
    ["furniture_bedding_01_64"] = {{side = "R", dir = "S", x = 0.8, y = 0.2},{side = "L", dir = "S", x = 0.8-1, y = 0.2},},-- + ymin 0.1
    
--Red Comfy Couch
    -- ["furniture_seating_indoor_01_0"] = {{side = "L", dir = "E", x = 1.4, y = 1.8},},
    ["furniture_seating_indoor_01_1"] = {{side = "L", dir = "E", x = 0.4, y = 1.8},},
    -- ["furniture_seating_indoor_01_3"] = {{side = "R", dir = "S", x = 1, y = 1.3},},
    ["furniture_seating_indoor_01_2"] = {{side = "R", dir = "S", x = 1, y = 0.3},},
-- Green Comfy Couch
    -- ["furniture_seating_indoor_01_17"] = {{side = "L", dir = "E", x = 1.3, y = 1.8},},
    ["furniture_seating_indoor_01_16"] = {{side = "L", dir = "E", x = 0.3, y = 1.8},},
    -- ["furniture_seating_indoor_01_19"] = {{side = "R", dir = "S", x = 1, y = 1.2},},
    ["furniture_seating_indoor_01_18"] = {{side = "R", dir = "S", x = 1, y = 0.2},},
-- Purple Rattan Couch
    -- ["furniture_seating_indoor_01_26"] = {{side = "L", dir = "E", x = 1.3, y = 1.8},}, 
    ["furniture_seating_indoor_01_27"] = {{side = "L", dir = "E", x = 0.3, y = 1.8},},
    -- ["furniture_seating_indoor_01_25"] = {{side = "R", dir = "S", x = 1, y = 1.3},},
    ["furniture_seating_indoor_01_24"] = {{side = "R", dir = "S", x = 1, y = 0.3},},

-- Sturdy Bench
    -- ["furniture_seating_indoor_02_18"] = {{side = "L", dir = "E", x = 1.5, y = 1.7},}, 
    ["furniture_seating_indoor_02_19"] = {{side = "L", dir = "E", x = 0.5, y = 1.7},},
    -- ["furniture_seating_indoor_02_17"] = {{side = "R", dir = "S", x = 0.9, y = 1.5},},
    ["furniture_seating_indoor_02_16"] = {{side = "R", dir = "S", x = 0.9, y = 0.5},},
-- White Lazy Couch
    -- ["furniture_seating_indoor_02_24"] = {{side = "L", dir = "E", x = 1.3, y = 1.7},}, 
    ["furniture_seating_indoor_02_25"] = {{side = "L", dir = "E", x = 0.3, y = 1.7},},
    -- ["furniture_seating_indoor_02_27"] = {{side = "R", dir = "S", x = 1, y = 1.3},},
    ["furniture_seating_indoor_02_26"] = {{side = "R", dir = "S", x = 1, y = 0.3},},
-- Blue Rattan Couch
    -- ["furniture_seating_indoor_02_34"] = {{side = "L", dir = "E", x = 1.3, y = 1.7},}, 
    ["furniture_seating_indoor_02_35"] = {{side = "L", dir = "E", x = 0.3, y = 1.7},},
    -- ["furniture_seating_indoor_02_33"] = {{side = "R", dir = "S", x = 1, y = 1.3},},
    ["furniture_seating_indoor_02_32"] = {{side = "R", dir = "S", x = 1, y = 0.3},},
-- Brown Lazy Couch
    -- ["furniture_seating_indoor_02_48"] = {{side = "L", dir = "E", x = 1.4, y = 1.8},}, 
    ["furniture_seating_indoor_02_49"] = {{side = "L", dir = "E", x = 0.4, y = 1.8},},
    -- ["furniture_seating_indoor_02_51"] = {{side = "R", dir = "S", x = 1, y = 1.3},},
    ["furniture_seating_indoor_02_50"] = {{side = "R", dir = "S", x = 1, y = 0.3},},
-- Long Wooden Bench
    -- ["furniture_seating_indoor_02_60"] = {{side = "L", dir = "E", x = 1.5, y = 1.85},}, 
    ["furniture_seating_indoor_02_61"] = {{side = "L", dir = "E", x = 0.5, y = 1.85},},
    -- ["furniture_seating_indoor_02_63"] = {{side = "R", dir = "S", x = 1.1, y = 1.5},},
    ["furniture_seating_indoor_02_62"] = {{side = "R", dir = "S", x = 1.1, y = 0.5},},
    
-- Sports Bench
    -- ["furniture_seating_indoor_03_0"] = {{side = "L", dir = "E", x = 1.5, y = 1.75},{side = "R", dir = "E", x = 1.5, y = 1.75-1.6},},
    ["furniture_seating_indoor_03_1"] = {{side = "L", dir = "E", x = 0.5, y = 1.75},{side = "R", dir = "E", x = 0.5, y = 1.75-1.6},},
    -- ["furniture_seating_indoor_03_3"] = {{side = "R", dir = "S", x = 0.9, y = 1.5},{side = "L", dir = "S", x = 0.9-0.8, y = 1.5},},
    ["furniture_seating_indoor_03_2"] = {{side = "R", dir = "S", x = 0.9, y = 0.5},{side = "L", dir = "S", x = 0.9-0.8, y = 0.5},},
-- Light Blue Couch
    -- ["furniture_seating_indoor_03_8"] = {{side = "L", dir = "E", x = 1.35, y = 1.8},}, 
    ["furniture_seating_indoor_03_9"] = {{side = "L", dir = "E", x = 0.35, y = 1.8},},
    -- ["furniture_seating_indoor_03_11"] = {{side = "R", dir = "S", x = 1, y = 1.25},},
    ["furniture_seating_indoor_03_10"] = {{side = "R", dir = "S", x = 1, y = 0.25},},
-- Yellow Modern Couch
    -- ["furniture_seating_indoor_03_16"] = {{side = "L", dir = "E", x = 1.4, y = 1.8},}, 
    ["furniture_seating_indoor_03_17"] = {{side = "L", dir = "E", x = 0.4, y = 1.8},},
    -- ["furniture_seating_indoor_03_19"] = {{side = "R", dir = "S", x = 1.1, y = 1.4},},
    ["furniture_seating_indoor_03_18"] = {{side = "R", dir = "S", x = 1.1, y = 0.4},},    
-- Blue Comfy Couch
    -- ["furniture_seating_indoor_03_33"] = {{side = "L", dir = "E", x = 1.3, y = 1.8},}, 
    ["furniture_seating_indoor_03_32"] = {{side = "L", dir = "E", x = 0.3, y = 1.8},},
    -- ["furniture_seating_indoor_03_35"] = {{side = "R", dir = "S", x = 1, y = 1.3},},
    ["furniture_seating_indoor_03_34"] = {{side = "R", dir = "S", x = 1, y = 0.3},},    
-- Wooden Bench
    -- ["furniture_seating_indoor_03_66"] = {{side = "L", dir = "E", x = 1.5, y = 1.8},{side = "R", dir = "E", x = 1.5, y = 1.8-1.8},},
    ["furniture_seating_indoor_03_67"] = {{side = "L", dir = "E", x = 0.5, y = 1.8},{side = "R", dir = "E", x = 0.5, y = 1.8-1.8},},
    -- ["furniture_seating_indoor_03_65"] = {{side = "R", dir = "S", x = 1, y = 1.5},{side = "L", dir = "S", x = 1-0.9, y = 1.5},},
    ["furniture_seating_indoor_03_64"] = {{side = "R", dir = "S", x = 1, y = 0.5},{side = "L", dir = "S", x = 1-0.9, y = 0.5},},

-- -- Park Bench
    -- ["furniture_seating_outdoor_01_0"] = {{side = "L", dir = "E", x = 1.5, y = 1.8},}, 
    ["furniture_seating_outdoor_01_1"] = {{side = "L", dir = "E", x = 0.5, y = 1.8},},
    -- ["furniture_seating_outdoor_01_3"] = {{side = "R", dir = "S", x = 1, y = 1.5},},
    ["furniture_seating_outdoor_01_2"] = {{side = "R", dir = "S", x = 1, y = 0.5},},

-- -- Fancy Outdoors Bench
    -- ["furniture_seating_outdoor_01_11"] = {{side = "L", dir = "E", x = 1.5, y = 1.8},}, 
    ["furniture_seating_outdoor_01_10"] = {{side = "L", dir = "E", x = 0.5, y = 1.8},},
    -- ["furniture_seating_outdoor_01_9"] = {{side = "R", dir = "S", x = 1, y = 1.4},},
    ["furniture_seating_outdoor_01_8"] = {{side = "R", dir = "S", x = 1, y = 0.4},},
    
-- Oakwood Bench
    -- ["furniture_seating_outdoor_01_20"] = {{side = "L", dir = "E", x = 1.6, y = 1.9},{side = "R", dir = "E", x = 1.6, y = 1.9-1.6},}, 
    ["furniture_seating_outdoor_01_21"] = {{side = "L", dir = "E", x = 0.6, y = 1.9},{side = "R", dir = "E", x = 0.6, y = 1.9-1.6},},
    -- ["furniture_seating_outdoor_01_23"] = {{side = "R", dir = "S", x = 1.1, y = 1.5},{side = "L", dir = "S", x = 1.1-0.9, y = 1.5},},
    ["furniture_seating_outdoor_01_22"] = {{side = "R", dir = "S", x = 1.1, y = 0.5},{side = "L", dir = "S", x = 1.1-0.9, y = 0.5},},
-- Birchwood Bench
    -- ["furniture_seating_outdoor_01_32"] = {{side = "L", dir = "E", x = 1.5, y = 1.75},{side = "R", dir = "E", x = 1.5, y = 1.75-1.6},}, 
    ["furniture_seating_outdoor_01_33"] = {{side = "L", dir = "E", x = 0.5, y = 1.75},{side = "R", dir = "E", x = 0.5, y = 1.75-1.6},},
    -- ["furniture_seating_outdoor_01_35"] = {{side = "R", dir = "S", x = 0.95, y = 1.5},{side = "L", dir = "S", x = 0.95-0.9, y = 1.5},},
    ["furniture_seating_outdoor_01_34"] = {{side = "R", dir = "S", x = 0.95, y = 0.5},{side = "L", dir = "S", x = 0.95-0.9, y = 0.5},},

-- Church Pew
    
    ["location_community_church_small_01_51"] = {{side = "L", dir = "E", x = 1.5, y = 1.7},},
    ["location_community_church_small_01_52"] = {{side = "L", dir = "E", x = 1.2, y = 1.7},},
    ["location_community_church_small_01_53"] = {{side = "L", dir = "E", x = 0.0, y = 1.7},},
    
    ["location_community_church_small_01_50"] = {{side = "R", dir = "S", x = 0.95, y = 1.5},},
    ["location_community_church_small_01_49"] = {{side = "R", dir = "S", x = 0.95, y = 1.2},},
    ["location_community_church_small_01_48"] = {{side = "R", dir = "S", x = 0.95, y = 0},},

-- Dentist Patient Chair
    -- ["location_community_medical_01_2"] = {{side = "L", dir = "E", x = 1.3, y = 1.4},{side = "R", dir = "E", x = 1.3, y = 1.4-1.8},}, 
    ["location_community_medical_01_3"] = {{side = "L", dir = "E", x = 0.3, y = 1.4},{side = "R", dir = "E", x = 0.3, y = 1.4-1.8},},
    -- ["location_community_medical_01_1"] = {{side = "R", dir = "S", x = 0.7, y = 1.3},{side = "L", dir = "S", x = 0.7-1, y = 1.3},},
    ["location_community_medical_01_0"] = {{side = "R", dir = "S", x = 0.7, y = 0.3},{side = "L", dir = "S", x = 0.7-1, y = 0.3},},
-- Large Medical Bed
    -- ["location_community_medical_01_20"] = {{side = "L", dir = "E", x = 1.1, y = 1.5},{side = "R", dir = "E", x = 1.1, y = 1.5-1.6},}, 
    ["location_community_medical_01_21"] = {{side = "L", dir = "E", x = 0.1, y = 1.5},{side = "R", dir = "E", x = 0.1, y = 1.5-1.6},},
    -- ["location_community_medical_01_22"] = {{side = "L", dir = "E", x = 1.1, y = 1.3},{side = "R", dir = "E", x = 1.1, y = 1.3-1.6},}, 
    ["location_community_medical_01_23"] = {{side = "L", dir = "E", x = 0.1, y = 1.3},{side = "R", dir = "E", x = 0.1, y = 1.3-1.6},},
    -- ["location_community_medical_01_17"] = {{side = "R", dir = "S", x = 0.5, y = 1.1},{side = "L", dir = "S", x = 0.5-0.8, y = 1.1},},
    ["location_community_medical_01_16"] = {{side = "R", dir = "S", x = 0.5, y = 0.1},{side = "L", dir = "S", x = 0.5-0.8, y = 0.1},},
    -- ["location_community_medical_01_19"] = {{side = "R", dir = "S", x = 0.5, y = 1.1},{side = "L", dir = "S", x = 0.5-0.8, y = 1.1},},
    ["location_community_medical_01_18"] = {{side = "R", dir = "S", x = 0.5, y = 0.1},{side = "L", dir = "S", x = 0.5-0.8, y = 0.1},},
-- Patient Chair
    -- ["location_community_medical_01_34"] = {{side = "L", dir = "E", x = 1.1, y = 1.4},{side = "R", dir = "E", x = 1.1, y = 1.4-1.8},}, 
    ["location_community_medical_01_35"] = {{side = "L", dir = "E", x = 0.1, y = 1.4},{side = "R", dir = "E", x = 0.1, y = 1.4-1.8},},
    -- ["location_community_medical_01_33"] = {{side = "R", dir = "S", x = 0.6, y = 1.1},{side = "L", dir = "S", x = 0.6-0.9, y = 1.1},},
    ["location_community_medical_01_32"] = {{side = "R", dir = "S", x = 0.6, y = 0.1},{side = "L", dir = "S", x = 0.6-0.9, y = 0.1},},
-- Hospital Bed
    -- ["location_community_medical_01_74"] = {{side = "L", dir = "E", x = 1.1, y = 1.2},{side = "R", dir = "E", x = 1.1, y = 1.2-1.6},}, 
    ["location_community_medical_01_75"] = {{side = "L", dir = "E", x = 0.1, y = 1.2},{side = "R", dir = "E", x = 0.1, y = 1.2-1.6},},
    -- ["location_community_medical_01_73"] = {{side = "R", dir = "S", x = 0.5, y = 1.1},{side = "L", dir = "S", x = 0.5-0.9, y = 1.1},},
    ["location_community_medical_01_72"] = {{side = "R", dir = "S", x = 0.5, y = 0.1},{side = "L", dir = "S", x = 0.5-0.9, y = 0.1},},
-- Morgue Table
    -- ["location_community_medical_01_76"] = {{side = "L", dir = "E", x = 1.1, y = 1.4},{side = "R", dir = "E", x = 1.1, y = 1.4-1.8},}, 
    ["location_community_medical_01_77"] = {{side = "L", dir = "E", x = 0.1, y = 1.4},{side = "R", dir = "E", x = 0.1, y = 1.4-1.8},},
    -- ["location_community_medical_01_79"] = {{side = "R", dir = "S", x = 0.6, y = 1.1},{side = "L", dir = "S", x = 0.6-0.9, y = 1.1},},
    ["location_community_medical_01_78"] = {{side = "R", dir = "S", x = 0.6, y = 0.1},{side = "L", dir = "S", x = 0.6-0.9, y = 0.1},},
    
-- -- Prisoners Bed
    -- ["location_community_police_01_26"] = {{side = "L", dir = "E", x = 1.1, y = 1.7},{side = "R", dir = "E", x = 1.1, y = 1.7-1.8},}, 
    ["location_community_police_01_27"] = {{side = "L", dir = "E", x = 0.1, y = 1.7},{side = "R", dir = "E", x = 0.1, y = 1.7-1.8},},
    -- ["location_community_police_01_28"] = {{side = "L", dir = "E", x = 1.1, y = 1.7},{side = "R", dir = "E", x = 1.1, y = 1.7-1.8},}, 
    ["location_community_police_01_29"] = {{side = "L", dir = "E", x = 0.1, y = 1.7},{side = "R", dir = "E", x = 0.1, y = 1.7-1.8},},
    -- ["location_community_police_01_25"] = {{side = "R", dir = "S", x = 0.8, y = 1.1},{side = "L", dir = "S", x = 0.8-0.9, y = 1.1},},
    ["location_community_police_01_24"] = {{side = "R", dir = "S", x = 0.8, y = 0.1},{side = "L", dir = "S", x = 0.8-0.9, y = 0.1},},
    -- ["location_community_police_01_31"] = {{side = "R", dir = "S", x = 0.8, y = 1.1},{side = "L", dir = "S", x = 0.8-0.9, y = 1.1},},
    ["location_community_police_01_30"] = {{side = "R", dir = "S", x = 0.8, y = 0.1},{side = "L", dir = "S", x = 0.8-0.9, y = 0.1},},
    
-- 50s Seat
    -- ["location_restaurant_diner_01_32"] = {{side = "L", dir = "E", x = 1.2, y = 1.7},}, 
    ["location_restaurant_diner_01_33"] = {{side = "L", dir = "E", x = 0.2, y = 1.7},},
    -- ["location_restaurant_diner_01_35"] = {{side = "R", dir = "S", x = 0.9, y = 1.2},},
    ["location_restaurant_diner_01_34"] = {{side = "R", dir = "S", x = 0.9, y = 0.2},},
    
-- Brown Picknic Table
    -- ["location_restaurant_generic_01_0"] = {{side = "L", dir = "E", x = 1.2, y = 1.7},}, 
    ["location_restaurant_generic_01_2"] = {{side = "L", dir = "E", x = 0.2, y = 1.7},},
    -- ["location_restaurant_generic_01_6"] = {{side = "R", dir = "S", x = 0.9, y = 1.2},},
    ["location_restaurant_generic_01_5"] = {{side = "R", dir = "S", x = 0.9, y = 0.2},},
-- Blue Picknic Table
    -- ["location_restaurant_generic_01_8"] = {{side = "L", dir = "E", x = 1.2, y = 1.7},}, 
    ["location_restaurant_generic_01_10"] = {{side = "L", dir = "E", x = 0.2, y = 1.7},},
    -- ["location_restaurant_generic_01_14"] = {{side = "R", dir = "S", x = 0.9, y = 1.2},},
    ["location_restaurant_generic_01_13"] = {{side = "R", dir = "S", x = 0.9, y = 0.2},},
-- Whirled Seat
    -- ["location_restaurant_pizzawhirled_01_44"] = {{side = "L", dir = "E", x = 1.5, y = 1.8},}, 
    ["location_restaurant_pizzawhirled_01_45"] = {{side = "L", dir = "E", x = 0.5, y = 1.8},},
    -- ["location_restaurant_pizzawhirled_01_41"] = {{side = "R", dir = "S", x = 1, y = 1.5},},
    ["location_restaurant_pizzawhirled_01_40"] = {{side = "R", dir = "S", x = 1, y = 0.5},},
-- Spiffos Lounge Seat
    -- ["location_restaurant_spiffos_02_20"] = {{side = "L", dir = "E", x = 1.5, y = 1.8},}, 
    ["location_restaurant_spiffos_02_21"] = {{side = "L", dir = "E", x = 0.5, y = 1.8},},
    -- ["location_restaurant_spiffos_02_17"] = {{side = "R", dir = "S", x = 1, y = 1.5},},
    ["location_restaurant_spiffos_02_16"] = {{side = "R", dir = "S", x = 1, y = 0.5},},
-- Brick Mall Bench
    -- ["location_shop_mall_01_34"] = {{side = "L", dir = "E", x = 1.5, y = 1.5},{side = "R", dir = "E", x = 1.5, y = 1.5-1.6},}, 
    ["location_shop_mall_01_35"] = {{side = "L", dir = "E", x = 0.5, y = 1.5},{side = "R", dir = "E", x = 0.5, y = 1.5-1.6},},
    -- ["location_shop_mall_01_38"] = {{side = "L", dir = "E", x = 1.5, y = 1.9},{side = "R", dir = "E", x = 1.5, y = 1.9-1.6},}, 
    ["location_shop_mall_01_39"] = {{side = "L", dir = "E", x = 0.5, y = 1.9},{side = "R", dir = "E", x = 0.5, y = 1.9-1.6},},
    -- ["location_shop_mall_01_33"] = {{side = "R", dir = "S", x = 0.9, y = 1.5},{side = "L", dir = "S", x = 0.9-0.95, y = 1.5},},
    ["location_shop_mall_01_32"] = {{side = "R", dir = "S", x = 0.9, y = 0.5},{side = "L", dir = "S", x = 0.9-0.95, y = 0.5},},
    -- ["location_shop_mall_01_37"] = {{side = "R", dir = "S", x = 1.2, y = 1.5},{side = "L", dir = "S", x = 1.2-0.95, y = 1.5},},
    ["location_shop_mall_01_36"] = {{side = "R", dir = "S", x = 1.2, y = 0.5},{side = "L", dir = "S", x = 1.2-0.95, y = 0.5},},
-- -- Trailer Fixed Seat
    -- ["location_trailer_02_2"] = {{side = "L", dir = "E", x = 1.4, y = 1.6},}, 
    ["location_trailer_02_3"] = {{side = "L", dir = "E", x = 0.4, y = 1.6},},
    -- ["location_trailer_02_1"] = {{side = "R", dir = "S", x = 0.8, y = 1.4},},
    ["location_trailer_02_0"] = {{side = "R", dir = "S", x = 0.8, y = 0.4},},
-- Fitness Contraption
    -- ["recreational_sports_01_42"] = {{side = "L", dir = "E", x = 1.6, y = 1.6},{side = "R", dir = "E", x = 1.6, y = 1.6-1.6},}, 
    ["recreational_sports_01_43"] = {{side = "L", dir = "E", x = 0.6, y = 1.6},{side = "R", dir = "E", x = 0.6, y = 1.6-1.6},},
    -- ["recreational_sports_01_41"] = {{side = "R", dir = "S", x = 0.9, y = 1.6},{side = "L", dir = "S", x = 0.9-1.1, y = 1.6},},
    ["recreational_sports_01_40"] = {{side = "R", dir = "S", x = 0.9, y = 0.6},{side = "L", dir = "S", x = 0.9-1.1, y = 0.6},},

}


TrueActions.WorldSeatObject = {
    ["carpentry_01_40"] = {0.4, 0.8},
    ["carpentry_01_41"] = {0.8, 0.4},
    -- ["carpentry_01_42"] = {0.7, 0.2, "N"},
    -- ["carpentry_01_43"] = {0.8, 0.4, "W"},
    ["carpentry_01_44"] = {0.4, 0.8}, -- ЮГ
    ["carpentry_01_45"] = {0.8, 0.4}, -- Восток
    ["fixtures_bathroom_01_0"] = {0.34, 0.8},
    ["fixtures_bathroom_01_1"] = {0.8, 0.34},
    ["fixtures_bathroom_01_4"] = {0.34, 0.8},
    ["fixtures_bathroom_01_5"] = {0.8, 0.34},
    ["fixtures_bathroom_02_4"] = {0.34, 0.65},
    ["fixtures_bathroom_02_5"] = {0.65, 0.34},
    ["furniture_seating_indoor_01_0"] = {0.6, 0.85},
    ["furniture_seating_indoor_01_1"] = {0.3, 0.85},
    ["furniture_seating_indoor_01_2"] = {0.9, 0.3},
    ["furniture_seating_indoor_01_3"] = {0.9, 0.6},
    ["furniture_seating_indoor_01_8"] = {0.85, 0.35},
    ["furniture_seating_indoor_01_9"] = {0.35, 0.9},
    ["furniture_seating_indoor_01_12"] = {0.35, 0.85},
    ["furniture_seating_indoor_01_13"] = {0.85, 0.35},

    ["furniture_seating_indoor_01_16"] = {0.3, 0.88},
    ["furniture_seating_indoor_01_17"] = {0.6, 0.88},

    ["furniture_seating_indoor_01_18"] = {0.88, 0.24},
    ["furniture_seating_indoor_01_19"] = {0.88, 0.5},
    
    ["furniture_seating_indoor_01_24"] = {0.9, 0.24},
    ["furniture_seating_indoor_01_25"] = {0.9, 0.54},

    ["furniture_seating_indoor_01_26"] = {0.6, 0.88},
    ["furniture_seating_indoor_01_27"] = {0.24, 0.88},
    
    ["furniture_seating_indoor_01_32"] = {0.8, 0.37},
    ["furniture_seating_indoor_01_33"] = {0.37, 0.85},
    
    ["furniture_seating_indoor_01_36"] = {0.6, 0.37},
    ["furniture_seating_indoor_01_37"] = {0.37, 0.6},
    ["furniture_seating_indoor_01_40"] = {0.7, 0.35},
    ["furniture_seating_indoor_01_41"] = {0.35, 0.7},
    
    ["furniture_seating_indoor_01_44"] = {0.85, 0.35},
    ["furniture_seating_indoor_01_45"] = {0.35, 0.85},
    ["furniture_seating_indoor_01_46"] = {0.4, 0.8},
    ["furniture_seating_indoor_01_47"] = {0.8, 0.4},
    
    ["furniture_seating_indoor_01_49"] = {0.8, 0.5},
    ["furniture_seating_indoor_01_50"] = {0.5, 0.8},
    ["furniture_seating_indoor_01_53"] = {0.75, 0.45},
    ["furniture_seating_indoor_01_54"] = {0.45, 0.75},
    
    ["furniture_seating_indoor_01_56"] = {0.8, 0.4},
    ["furniture_seating_indoor_01_57"] = {0.4, 0.8},
    ["furniture_seating_indoor_01_60"] = {0.45, 0.8},
    ["furniture_seating_indoor_01_61"] = {0.8, 0.45},
    -------------------------------------------------------------
    ["furniture_seating_indoor_02_0"] = {0.5, 0.8},
    ["furniture_seating_indoor_02_1"] = {0.8, 0.45},
    ["furniture_seating_indoor_02_4"] = {0.8, 0.45},
    ["furniture_seating_indoor_02_5"] = {0.45, 0.8},
    
    ["furniture_seating_indoor_02_8"] = {0.85, 0.45},
    ["furniture_seating_indoor_02_9"] = {0.45, 0.8},
    ["furniture_seating_indoor_02_12"] = {0.85, 0.55},
    ["furniture_seating_indoor_02_13"] = {0.55, 0.85},
    
    ["furniture_seating_indoor_02_16"] = {0.8, 0.45},
    ["furniture_seating_indoor_02_17"] = {0.8, 0.5},

    ["furniture_seating_indoor_02_18"] = {0.45, 0.8},
    ["furniture_seating_indoor_02_19"] = {0.45, 0.8},
    
    ["furniture_seating_indoor_02_20"] = {0.35, 0.88},
    ["furniture_seating_indoor_02_21"] = {0.88, 0.35},

    ["furniture_seating_indoor_02_24"] = {0.6, 0.88},
    ["furniture_seating_indoor_02_25"] = {0.24, 0.88},

    ["furniture_seating_indoor_02_26"] = {0.88, 0.24},
    ["furniture_seating_indoor_02_27"] = {0.88, 0.6},

    ["furniture_seating_indoor_02_32"] = {0.88, 0.24},    
    ["furniture_seating_indoor_02_33"] = {0.88, 0.6},
    
    ["furniture_seating_indoor_02_34"] = {0.67, 0.88},
    ["furniture_seating_indoor_02_35"] = {0.25, 0.88},
    
    ["furniture_seating_indoor_02_40"] = {0.8, 0.3},
    ["furniture_seating_indoor_02_41"] = {0.4, 0.8},
    
    ["furniture_seating_indoor_02_44"] = {0.4, 0.88},
    ["furniture_seating_indoor_02_45"] = {0.88, 0.4},
    
    ["furniture_seating_indoor_02_48"] = {0.55, 0.8}, 
    ["furniture_seating_indoor_02_49"] = {0.22, 0.8}, 
    ["furniture_seating_indoor_02_50"] = {0.8, 0.2}, 
    ["furniture_seating_indoor_02_51"] = {0.8, 0.5},

    ["furniture_seating_indoor_02_56"] = {0.4, 0.7},
    ["furniture_seating_indoor_02_57"] = {0.7, 0.37},
    
    ["furniture_seating_indoor_02_60"] = {0.6, 0.8},
    ["furniture_seating_indoor_02_61"] = {0.3, 0.8},    
    ["furniture_seating_indoor_02_62"] = {0.8, 0.3},
    ["furniture_seating_indoor_02_63"] = {0.8, 0.6},
    
        -------------------------------------------------------------
    ["furniture_seating_indoor_03_0"] = {0.6, 0.7},
    ["furniture_seating_indoor_03_1"] = {0.3, 0.7},    
    ["furniture_seating_indoor_03_2"] = {0.7, 0.5},
    ["furniture_seating_indoor_03_3"] = {0.7, 0.6},
    
    ["furniture_seating_indoor_03_4"] = {0.35, 0.86},
    ["furniture_seating_indoor_03_5"] = {0.86, 0.35},
    
    
    ["furniture_seating_indoor_03_8"] = {0.5, 0.8},
    ["furniture_seating_indoor_03_9"] = {0.22, 0.8},
    ["furniture_seating_indoor_03_10"] = {0.8, 0.22},
    ["furniture_seating_indoor_03_11"] = {0.8, 0.5},
    
    ["furniture_seating_indoor_03_16"] = {0.6, 0.88},
    ["furniture_seating_indoor_03_17"] = {0.22, 0.88},
    ["furniture_seating_indoor_03_18"] = {0.88, 0.22},
    ["furniture_seating_indoor_03_19"] = {0.88, 0.6},

    ["furniture_seating_indoor_03_24"] = {0.88, 0.32},
    ["furniture_seating_indoor_03_25"] = {0.32, 0.88},

    ["furniture_seating_indoor_03_28"] = {0.42, 0.88},
    ["furniture_seating_indoor_03_29"] = {0.88, 0.38},
    
    ["furniture_seating_indoor_03_33"] = {0.5, 0.9},
    ["furniture_seating_indoor_03_32"] = {0.2, 0.9},

    ["furniture_seating_indoor_03_34"] = {0.9, 0.17},
    ["furniture_seating_indoor_03_35"] = {0.9, 0.5},
    
    ["furniture_seating_indoor_03_40"] = {0.6, 0.35},
    ["furniture_seating_indoor_03_41"] = {0.35, 0.6},
    
    ["furniture_seating_indoor_03_44"] = {0.7, 0.33},
    ["furniture_seating_indoor_03_45"] = {0.33, 0.7},
    
    ["furniture_seating_indoor_03_48"] = {0.7, 0.4}, 
    ["furniture_seating_indoor_03_49"] = {0.4, 0.7}, 

    ["furniture_seating_indoor_03_56"] = {0.8, 0.4},
    ["furniture_seating_indoor_03_57"] = {0.43, 0.75},
-------------------------------------------------------------

    ["furniture_seating_outdoor_01_0"] = {0.5, 0.8},
    ["furniture_seating_outdoor_01_1"] = {0.3, 0.8},
    ["furniture_seating_outdoor_01_2"] = {0.8, 0.35},
    ["furniture_seating_outdoor_01_3"] = {0.8, 0.5},
    
    ["furniture_seating_outdoor_01_8"] = {0.65, 0.35},
    ["furniture_seating_outdoor_01_9"] = {0.65, 0.5},
    
    ["furniture_seating_outdoor_01_11"] = {0.5, 0.65},
    ["furniture_seating_outdoor_01_10"] = {0.3, 0.65},
    
    ["furniture_seating_outdoor_01_16"] = {0.7, 0.33},
    ["furniture_seating_outdoor_01_17"] = {0.33, 0.7},
    
    ["furniture_seating_outdoor_01_20"] = {0.5, 0.8},
    ["furniture_seating_outdoor_01_21"] = {0.35, 0.8},
    ["furniture_seating_outdoor_01_22"] = {0.8, 0.35},
    ["furniture_seating_outdoor_01_23"] = {0.8, 0.5},
    
-------------------------------------------------------------    
    ["location_community_church_small_01_48"] = {0.6, 0.3},
    ["location_community_church_small_01_49"] = {0.6, 0.5},
    ["location_community_church_small_01_50"] = {0.6, 0.5},
    
    ["location_community_church_small_01_51"] = {0.5, 0.6},
    ["location_community_church_small_01_52"] = {0.3, 0.6},
    ["location_community_church_small_01_53"] = {0.3, 0.6},
    
    ["location_community_church_small_01_91"] = {0.4, 0.6},
    ["location_community_church_small_01_92"] = {0.6, 0.4},
    
    -- ["location_community_medical_01_10"] = {0.8, 0.5},
    ["location_community_medical_01_56"] = {0.65, 0.52},
    ["location_community_medical_01_57"] = {0.65, 0.12},
    
    ["location_community_medical_01_58"] = {0.14, 0.65},
    ["location_community_medical_01_59"] = {0.53, 0.65},
    
    -- ["location_restaurant_bar_01_25"] = {0.8, 0.5},
    -- ["location_restaurant_bar_01_26"] = {0.8, 0.5},
    
    ["location_restaurant_diner_01_32"] = {0.4, 0.8},
    ["location_restaurant_diner_01_33"] = {0.2, 0.8},
    ["location_restaurant_diner_01_34"] = {0.8, 0.3},
    ["location_restaurant_diner_01_35"] = {0.8, 0.3},
    -- ["location_restaurant_diner_01_42"] = {0.3, 0.2},
    
    ["location_restaurant_pileocrepe_01_24"] = {0.7, 0.3},
    ["location_restaurant_pileocrepe_01_25"] = {0.7, 0.5},
    ["location_restaurant_pileocrepe_01_28"] = {0.5, 0.7},
    ["location_restaurant_pileocrepe_01_29"] = {0.3, 0.7},
    
    ["location_restaurant_pileocrepe_01_40"] = {0.7, 0.45},
    ["location_restaurant_pileocrepe_01_41"] = {0.45, 0.7},
    
    ["location_restaurant_pizzawhirled_01_40"] = {0.8, 0.3},
    ["location_restaurant_pizzawhirled_01_41"] = {0.8, 0.5},
    ["location_restaurant_pizzawhirled_01_44"] = {0.5, 0.8},
    ["location_restaurant_pizzawhirled_01_45"] = {0.3, 0.8},
    
    ["location_restaurant_spiffos_02_16"] = {0.8, 0.3},
    ["location_restaurant_spiffos_02_17"] = {0.8, 0.5},
    ["location_restaurant_spiffos_02_20"] = {0.5, 0.8},
    ["location_restaurant_spiffos_02_21"] = {0.3, 0.8},
    
    ["location_restaurant_spiffos_02_24"] = {0.3, 0.6},
    ["location_restaurant_spiffos_02_25"] = {0.6, 0.3},
    
    ["location_trailer_02_0"] = {0.65, 0.27},
    ["location_trailer_02_1"] = {0.65, 0.57},
    ["location_trailer_02_2"] = {0.57, 0.60},
    ["location_trailer_02_3"] = {0.27, 0.60},
    
    ["location_trailer_02_2"] = {0.57, 0.60},
    ["location_trailer_02_3"] = {0.27, 0.60},
    
    ["location_shop_mall_01_34"] = {0.4, 0.65},
    ["location_shop_mall_01_35"] = {0.4, 0.65},
    ["location_shop_mall_01_36"] = {1, 0.4},
    ["location_shop_mall_01_37"] = {1, 0.4},
    ["location_shop_mall_01_40"] = {0.4, 0.65},
    ["location_shop_mall_01_41"] = {0.65, 0.35},
}
