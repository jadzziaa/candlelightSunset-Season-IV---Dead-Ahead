-- Create LUA Objects that can be used to differentiate between heater types

SmallHeaterObject = {

    itemType = "SmallHeater",
    itemName = "Small Heater",
    heatRadius = 10,
    heatTemperature = 25,
}

OutdoorHeaterObject = {
    
    itemType = "OutdoorHeater",
    itemName = "Portable Outdoor Heater",
    heatRadius = 20,
    heatTemperature = 40,   
}

ElectricHeaterObject = {

    itemType = "ElectricHeater",
    itemName = "Electric Heater",
    heatRadius = 25,
    heatTemperature = 30,
}

availableHeaters = {SmallHeaterObject.itemType, OutdoorHeaterObject.itemType, ElectricHeaterObject.itemType}

-- Extra Stuff below

function isHeater(db, item)
    if type(item) == "table" then
        for _, value in ipair(item) do
            if db == value then
                return value;
            end
        end
    else
        print("Something went wrong.")
    end

    return false;
end

function tablePrint (tbl, maxDepth, indent)
    if not (type(tbl) == "table") then return end
    if not indent then indent = 0 end
    if not maxDepth then maxDepth = 2 end
  
    if not (indent <= maxDepth) then return end
    
    for k, v in pairs(tbl) do
      formatting = string.rep("    ", indent) .. k .. ": "
      if type(v) == "table" then
        print(formatting)
        tablePrint(v, maxDepth, indent+1)
      else
        print(formatting .. tostring(v))
      end
    end
  end