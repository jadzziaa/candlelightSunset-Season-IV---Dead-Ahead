local proceduralPlaces = {
    PoliceStorageOutfit = 1,
    PoliceLockers = 1,
    ArmyStorageOutfit = 5,
    LockerArmyBedroom = 5,

    FirearmWeapons = 2,
    PawnShopGunsSpecial = 2,
    ArmySurplusOutfit = 5,

    GunStoreShelf = 1,
    CampingStoreGear = 1,
    CampingStoreBackpacks = 1,
    WardrobeRedneck = 1,
}

local suburbsPlaces = {
    ["SurvivorCache1.SurvivorCrate"] = 0.5,
    ["SurvivorCache2.SurvivorCrate"] = 0.5,
    Bag_WeaponBag = 0.5,
    Bag_SurvivorBag = 0.5,
}

local vehiclePlaces = {
    ["Police.TruckBed"] = 0.5,
    SurvivalistTruckBed = 0.5,
    HunterTruckBed = 0.5,
}

local function hasDot(s)
    local dot = string.find(s,".",1,true)
    local v1,v2
    if dot then
        v1 = string.sub(s,1,dot-1)
        v2 = string.sub(s,dot+1,-1)
    end
    return dot,v1,v2
end

for k,v in pairs(proceduralPlaces) do 
    table.insert(ProceduralDistributions.list[k].items, "Base.SlingA");
    table.insert(ProceduralDistributions.list[k].items, v);
end

for k,v in pairs(suburbsPlaces) do 
    local found,k1,k2 = hasDot(k)
    if found then 
        table.insert(SuburbsDistributions[k1][k2].items, "Base.SlingA");
        table.insert(SuburbsDistributions[k1][k2].items, v);
    else
        table.insert(SuburbsDistributions[k].items, "Base.SlingA");
        table.insert(SuburbsDistributions[k].items, v);
    end
end

for k,v in pairs(vehiclePlaces) do 
    local found,k1,k2 = hasDot(k)
    if found then 
        table.insert(VehicleDistributions[k1][k2].items, "Base.SlingA");
        table.insert(VehicleDistributions[k1][k2].items, v);
    else
        table.insert(VehicleDistributions[k].items, "Base.SlingA");
        table.insert(VehicleDistributions[k].items, v);
    end
    
end