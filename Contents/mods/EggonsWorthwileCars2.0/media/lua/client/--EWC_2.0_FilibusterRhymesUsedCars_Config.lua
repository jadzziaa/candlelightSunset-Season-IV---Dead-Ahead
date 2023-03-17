EWC_2_0 = EWC_2_0 or {}
EWC_2_0.ModdedCarsConfigs = EWC_2_0.ModdedCarsConfigs or {}
local FRUC_Configs = {
    ["Base.51chevy3100"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 100,
        engineLoudness = 92
    },
    ["Base.51chevy3100old"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 100,
        engineLoudness = 100
    },
    ["Base.64mustang"] = {
        trunkType = "TruckBed",
        trunkCapacity = 35,
        engineLoudness = 100
    },
    ["Base.65gto"] = {
        trunkType = "TruckBed",
        trunkCapacity = 55,
        engineLoudness = 70
    },
    ["Base.68elcamino"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 85,
        engineLoudness = 85
    },
    ["Base.68wildcat"] = {
        trunkType = "TruckBed",
        trunkCapacity = 60,
        engineLoudness = 70
    },
    ["Base.68wildcatconvert"] = {
        trunkType = "TruckBed",
        trunkCapacity = 60,
        engineLoudness = 70
    },
    ["Base.69charger"] = {
        trunkType = "TruckBed",
        trunkCapacity = 35,
        engineLoudness = 110
    },
    ["Base.70chevelle"] = {
        trunkType = "TruckBed",
        trunkCapacity = 45,
        engineLoudness = 67
    },
    ["Base.70elcamino"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 85,
        engineLoudness = 85
    },
    ["Base.71chevyc10lb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.71chevyc10offroadlb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.71chevyc10offroadsb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 100,
        engineLoudness = 90
    },
    ["Base.71chevyc10offroadstepside"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 60,
        engineLoudness = 85
    },
    ["Base.71chevyc10stepside"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 70,
        engineLoudness = 88
    },
    ["Base.71chevyc10sb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 110,
        engineLoudness = 92
    },
    ["Base.71impala"] = {
        trunkType = "TruckBed",
        trunkCapacity = 55,
        engineLoudness = 70
    },
    ["Base.72beetle"] = {
        trunkType = "TruckBed",
        trunkCapacity = 40,
        engineLoudness = 60
    },
    ["Base.73falcon"] = {
        trunkType = "TruckBed",
        trunkCapacity = 25,
        engineLoudness = 100
    },
    ["Base.73pinto"] = {
        trunkType = "TruckBed",
        trunkCapacity = 25,
        engineLoudness = 55
    },
    ["Base.77transam"] = {
        trunkType = "TruckBed",
        trunkCapacity = 35,
        engineLoudness = 110
    },
    ["Base.79brougham"] = {
        trunkType = "TruckBed",
        trunkCapacity = 60,
        engineLoudness = 73
    },
    ["Base.79datsun280z"] = {
        trunkType = "TruckBed",
        trunkCapacity = 47,
        engineLoudness = 95
    },
    ["Base.80f350"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.80f350ambulance"] = {
        trunkType = "TruckBed",
        trunkCapacity = 150,
        engineLoudness = 100
    },
    ["Base.80f350offroad"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.80f350quad"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 98
    },
    ["Base.83hilux"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 110,
        engineLoudness = 90
    },
    ["Base.83hiluxoffroad"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 110,
        engineLoudness = 90
    },
    ["Base.85vicsed"] = {
        trunkType = "TruckBed",
        trunkCapacity = 50,
        engineLoudness = 70
    },
    ["Base.85vicwag"] = {
        trunkType = "TruckBed",
        trunkCapacity = 75,
        engineLoudness = 70
    },
    ["Base.85vicwag2"] = {
        trunkType = "TruckBed",
        trunkCapacity = 75,
        engineLoudness = 70
    },
    ["Base.86econoline"] = {
        trunkType = "TruckBed",
        trunkCapacity = 210,
        engineLoudness = 110
    },
    ["Base.86econolineambulance"] = {
        trunkType = "TruckBed",
        trunkCapacity = 150,
        engineLoudness = 110
    },
    ["Base.86econolinerv"] = {
        trunkType = "TruckBed",
        trunkCapacity = 150,
        engineLoudness = 110
    },
    ["Base.86econolineflorist"] = {
        trunkType = "TruckBed",
        trunkCapacity = 210,
        engineLoudness = 110
    },
    ["Base.86montecarlo"] = {
        trunkType = "TruckBed",
        trunkCapacity = 50,
        engineLoudness = 70
    },
    ["Base.86yugo"] = {
        trunkType = "TruckBed",
        trunkCapacity = 28,
        engineLoudness = 55
    },
    ["Base.87blazer"] = {
        trunkType = "TruckBed",
        trunkCapacity = 125,
        engineLoudness = 90
    },
    ["Base.87blazeroffroad"] = {
        trunkType = "TruckBed",
        trunkCapacity = 125,
        engineLoudness = 90
    },
    ["Base.87caprice"] = {
        trunkType = "TruckBed",
        trunkCapacity = 55,
        engineLoudness = 70
    },
    ["Base.87c10fire"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.87c10lb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.87c10mccoy"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.87c10offroadlb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.87c10utility"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.87c10offroadsb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 110,
        engineLoudness = 95
    },
    ["Base.87c10sb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 110,
        engineLoudness = 95
    },
    ["Base.87capricePD"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 55,
        engineLoudness = 70
    },
    ["Base.87suburban"] = {
        trunkType = "TruckBed",
        trunkCapacity = 120,
        engineLoudness = 95
    },
    ["Base.90corolla"] = {
        trunkType = "TruckBed",
        trunkCapacity = 40,
        engineLoudness = 62
    },
    ["Base.90ramlb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.90ramoffroadlb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 130,
        engineLoudness = 95
    },
    ["Base.90ramoffroadsb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 110,
        engineLoudness = 92
    },
    ["Base.90ramsb"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 110,
        engineLoudness = 92
    },
    ["Base.91celica"] = {
        trunkType = "TruckBed",
        trunkCapacity = 35,
        engineLoudness = 65
    },
    ["Base.91chevys10"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 90,
        engineLoudness = 85
    },
    ["Base.91chevys10ext"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 100,
        engineLoudness = 89
    },
    ["Base.91chevys10offroad"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 90,
        engineLoudness = 85
    },
    ["Base.91chevys10offroadext"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 90,
        engineLoudness = 85
    },
    ["Base.91crx"] = {
        trunkType = "TruckBed",
        trunkCapacity = 45,
        engineLoudness = 53
    },
    ["Base.91wagoneer"] = {
        trunkType = "TruckBed",
        trunkCapacity = 80,
        engineLoudness = 80
    },
    ["Base.92crownvic"] = {
        trunkType = "TruckBed",
        trunkCapacity = 40,
        engineLoudness = 62
    },
    ["Base.92crownvicPD"] = {
        trunkType = "TruckBed",
        trunkCapacity = 40,
        engineLoudness = 62
    },
    ["Base.92wrangler"] = {
        trunkType = "TruckBed",
        trunkCapacity = 60,
        engineForce = 4800,
        engineLoudness = 85
    },
    ["Base.92wranglerjurassic"] = {
        trunkType = "TruckBed",
        trunkCapacity = 60,
        engineForce = 5000,
        engineLoudness = 85
    },
    ["Base.92wrangleroffroad"] = {
        trunkType = "TruckBed",
        trunkCapacity = 60,
        engineForce = 5000,
        engineLoudness = 85
    },
    ["Base.92wranglerranger"] = {
        trunkType = "TruckBed",
        trunkCapacity = 60,
        engineForce = 5000,
        engineLoudness = 85
    },
    ["Base.93explorerjurassic"] = {
        trunkType = "TruckBed",
        trunkCapacity = 75,
        engineLoudness = 85
    },
    ["Base.93explorer"] = {
        trunkType = "TruckBed",
        trunkCapacity = 75,
        engineLoudness = 85
    },
    ["Base.93jeepcherokee"] = {
        trunkType = "TruckBed",
        trunkCapacity = 75,
        engineLoudness = 85
    },
    ["Base.93jeepcherokeeoffroad"] = {
        trunkType = "TruckBed",
        trunkCapacity = 75,
        engineLoudness = 85
    },
    ["Base.astrovan"] = {
        trunkType = "TruckBed",
        trunkCapacity = 40,
        engineLoudness = 92
    },
    ["Base.chevystepvan"] = {
        trunkType = "TruckBed",
        trunkCapacity = 450,
        engineLoudness = 130
    },
    ["Base.chevystepvanswat"] = {
        trunkType = "TruckBed",
        trunkCapacity = 350,
        engineLoudness = 130
    },
    ["Base.f700box"] = {
        trunkType = "TruckBed",
        trunkCapacity = 600,
        engineLoudness = 135
    },
    ["Base.f700dump"] = {
        trunkType = "TruckBed",
        trunkCapacity = 160,
        engineLoudness = 130
    },
    ["Base.f700flatbed"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 300,
        engineLoudness = 130
    },
    ["Base.f700propane"] = {
        trunkType = "TruckBedOpen",
        -- trunkCapacity = 300,
        engineLoudness = 130
    },
    ["Base.firepumper"] = {
        trunkType = "TruckBed",
        trunkCapacity = 85,
        engineLoudness = 130
    },
    ["Base.hmmwvht"] = {
        trunkType = "TruckBed",
        trunkCapacity = 90,
        engineLoudness = 115
    },
    ["Base.hmmwvtr"] = {
        trunkType = "TruckBed",
        trunkCapacity = 150,
        engineLoudness = 115
    },
    ["Base.isuzubox"] = {
        trunkType = "TruckBed",
        trunkCapacity = 400,
        engineLoudness = 120
    },
    ["Base.isuzuboxelec"] = {
        trunkType = "TruckBed",
        trunkCapacity = 400,
        engineLoudness = 120
    },
    ["Base.isuzuboxfood"] = {
        trunkType = "TruckBed",
        trunkCapacity = 400,
        engineLoudness = 120
    },
    ["Base.isuzuboxmccoy"] = {
        trunkType = "TruckBed",
        trunkCapacity = 350,
        engineLoudness = 122
    },
    ["Base.m151canvas"] = {
        trunkType = "TruckBed",
        trunkCapacity = 30,
        engineLoudness = 75
    },
    ["Base.m35a2fuel"] = {
        trunkType = "TruckBed",
        trunkCapacity = 15,
        engineLoudness = 120
    },
    ["Base.moveurself"] = {
        trunkType = "TruckBed",
        trunkCapacity = 300,
        engineLoudness = 120
    },
    ["Base.pursuitspecial"] = {
        trunkType = "TruckBed",
        trunkCapacity = 35,
        engineLoudness = 120
    },
    ["Base.schoolbusshort"] = {
        trunkType = "TruckBed",
        trunkCapacity = 200,
        engineLoudness = 120
    },
    ["Base.tractorford7810"] = {
        trunkType = "TruckBed",
        -- trunkCapacity = 200,
        engineLoudness = 120
    },
    -- ["Base.Trailerfuelsmall"] = {
    --     trunkType = "TruckBedOpen",
    --     trunkCapacity = 15
    -- },
    -- ["Base.Trailerfuelmedium"] = {
    --     trunkType = "TruckBedOpen",
    --     trunkCapacity = 15
    -- },
    ["Base.Trailer51chevy"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 90
    },
    ["Base.Trailercamperscamp"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 175
    },
    ["Base.Trailermovingbig"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 350
    },
    ["Base.Trailermovingmedium"] = {
        trunkType = "TruckBedOpen",
        trunkCapacity = 200
    },
    ["Base.Van_LectroMax"] = {
        trunkType = "TruckBed",
        trunkCapacity = 210,
        engineLoudness = 110
    },
    ["Base.volvo244"] = {
        trunkType = "TruckBed",
        trunkCapacity = 42,
        engineLoudness = 62
    }
}

EWC_2_0.ModdedCarsConfigs.FRUC_Configs = FRUC_Configs
