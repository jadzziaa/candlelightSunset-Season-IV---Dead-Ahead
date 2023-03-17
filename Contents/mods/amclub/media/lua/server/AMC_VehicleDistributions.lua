require "CommonTemplates/CommonDistributions"

local distributionTable = VehicleDistributions[1]

distributionTable["AMC_bmw_classic"] = {
    Normal = VehicleDistributions.CommonTemplatesDist,
}
distributionTable["AMC_bmw_custom"] = {
    Normal = VehicleDistributions.CommonTemplatesDist,
}
distributionTable["AMC_harley"] = {
    Normal = VehicleDistributions.CommonTemplatesDist,
}
distributionTable["AMC_quad"] = {
    Normal = VehicleDistributions.CommonTemplatesDist,
}
distributionTable["AMC_Waverunner"] = {
    Normal = VehicleDistributions.CommonTemplatesDist,
}
distributionTable["TrailerAMCWaverunnerWithBody"] = {
    Normal = VehicleDistributions.CommonTemplatesDist,
}

table.insert(VehicleDistributions, 1, distributionTable);


