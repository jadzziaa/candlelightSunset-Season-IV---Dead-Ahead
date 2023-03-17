-----Thanks to Funnypig for providing this file-----
require "fhqExpandedVehSpawns"

if VehicleZoneDistribution then
    --------------------------------New spawn zones--------------------------------
    
    
    ---Special Dealer: Specialty car dealer zone. This should contain exotics and imports mostly, as well as restored classics. Possibility for a race/concept car as a display car. HIgher condition and key chance ---
    
    VehicleZoneDistribution.specialdealer = VehicleZoneDistribution.specialdealer or {};
    VehicleZoneDistribution.specialdealer.vehicles = VehicleZoneDistribution.specialdealer.vehicles or {};
    
    VehicleZoneDistribution.specialdealer.vehicles["Base.CarLuxury"]  = nil;
    
    
    ---New Dealer: Zone for new car dealerships. Should lean towards modern cars, with a rare chance for a display car. Higher condition and key chance.
    
    VehicleZoneDistribution.newdealer = VehicleZoneDistribution.newdealer or {};
    VehicleZoneDistribution.newdealer.vehicles = VehicleZoneDistribution.newdealer.vehicles or {};
    
    VehicleZoneDistribution.newdealer.vehicles["Base.ModernCar"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.ModernCar02"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.SUV"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.OffRoad"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.CarLuxury"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.SportsCar"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.PickUpTruck"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.PickUpVan"]  = nil;
    VehicleZoneDistribution.newdealer.vehicles["Base.VanSeats"]  = nil;

    
    ---Commercial: Medium and small commercial vehicles, such as vans and small box trucks. May include small/medium trailers as well.---
    VehicleZoneDistribution.commercial = VehicleZoneDistribution.commercial or {};
    VehicleZoneDistribution.commercial.vehicles = VehicleZoneDistribution.commercial.vehicles or {};
    
    VehicleZoneDistribution.commercial.vehicles["Base.Van"]  = nil;
    VehicleZoneDistribution.commercial.vehicles["Base.StepVan"]  = nil;
    VehicleZoneDistribution.commercial.vehicles["Base.PickUpTruck"]  = nil;
    VehicleZoneDistribution.commercial.vehicles["Base.PickUpVan"]  = nil;
    

    ---utility: Utility vehicles, such as vans, trucks, and small trailers.---
    
    VehicleZoneDistribution.utility = VehicleZoneDistribution.utility or {};
    VehicleZoneDistribution.utility.vehicles = VehicleZoneDistribution.utility.vehicles or {};
    
    VehicleZoneDistribution.utility.vehicles["Base.Van"]  = nil;
    VehicleZoneDistribution.utility.vehicles["Base.StepVan"]  = nil;
    VehicleZoneDistribution.utility.vehicles["Base.PickUpTruck"]  = nil;
    VehicleZoneDistribution.utility.vehicles["Base.PickUpVan"]  = nil;
    VehicleZoneDistribution.utility.vehicles["Base.Trailer"]  = nil;
    VehicleZoneDistribution.utility.vehicles["Base.TrailerCover"]  = nil;
    
    
    ---Large Commercial: Large commercial vehicles, such as large box trucks or semi trucks/trailers---
    
    VehicleZoneDistribution.commerciallarge = VehicleZoneDistribution.commerciallarge or {};
    VehicleZoneDistribution.commerciallarge.vehicles = VehicleZoneDistribution.commerciallarge.vehicles or {};
    
    VehicleZoneDistribution.commerciallarge.vehicles["Base.StepVan"]  = nil;

    
    ---Used Dealer: Zone for used car dealers. Should contain older cars, but newer cars can also be included as well. Higher key chance, lower condition.---
    
    VehicleZoneDistribution.useddealer = VehicleZoneDistribution.useddealer or {};
    VehicleZoneDistribution.useddealer.vehicles = VehicleZoneDistribution.useddealer.vehicles or {};
    
    VehicleZoneDistribution.useddealer.vehicles["Base.CarNormal"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.SmallCar"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.SmallCar02"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.PickUpTruck"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.PickUpVan"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.CarStationWagon"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.CarStationWagon2"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.VanSeats"]  = nil;
    VehicleZoneDistribution.useddealer.vehicles["Base.Van"]  = nil;

    
    --Trailerutility Utility trailers, small to medium size.--
    VehicleZoneDistribution.trailerutility = VehicleZoneDistribution.trailerutility or {};
    VehicleZoneDistribution.trailerutility.vehicles = VehicleZoneDistribution.trailerutility.vehicles or {};
    
    VehicleZoneDistribution.trailerutility.vehicles["Base.Trailer"]  = nil;
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerCover"]  = nil;
	
	
	VehicleZoneDistribution.movers = VehicleZoneDistribution.movers or {};
	VehicleZoneDistribution.movers.vehicles = VehicleZoneDistribution.movers.vehicles or {};

	VehicleZoneDistribution.movers.vehicles["Base.Van"] = nil;
	
	
	VehicleZoneDistribution.construction = VehicleZoneDistribution.construction or {};
	VehicleZoneDistribution.construction.vehicles = VehicleZoneDistribution.construction.vehicles or {};

	VehicleZoneDistribution.construction.vehicles["Base.StepVan"] = nil;
    
    --------------------------------New Special spawn zones--------------------------------
    
    
    ---Heist Vehicles: Vehicles placed near banks as escape/loot vehicles for a heist story. A bit temp, vehicle stories would be ideal---
    
    VehicleZoneDistribution.heistvehicle = VehicleZoneDistribution.heistvehicle or {};
    VehicleZoneDistribution.heistvehicle.vehicles = VehicleZoneDistribution.heistvehicle.vehicles or {};
    
    VehicleZoneDistribution.heistvehicle.vehicles["Base.Van"]  = nil;
    VehicleZoneDistribution.heistvehicle.vehicles["Base.PickUpVan"]  = nil;
    VehicleZoneDistribution.heistvehicle.vehicles["Base.PickUpTruck"]  = nil;
    
    ---Police Exclusive: The vanilla police list, but will only spawn police vehicles---
    
    VehicleZoneDistribution.policeonly = VehicleZoneDistribution.policeonly or {};
    VehicleZoneDistribution.policeonly.vehicles = VehicleZoneDistribution.policeonly.vehicles or {};
    
    VehicleZoneDistribution.policeonly.vehicles["Base.PickUpVanLightsPolice"]  = nil;
    VehicleZoneDistribution.policeonly.vehicles["Base.CarLightsPolice"]  = nil;
    
    ---Ambulance Exclusive: The vanilla ambulance list, but will only spawn ambulances---
    
    VehicleZoneDistribution.ambulanceonly = VehicleZoneDistribution.ambulanceonly or {};
    VehicleZoneDistribution.ambulanceonly.vehicles = VehicleZoneDistribution.ambulanceonly.vehicles or {};
    
    VehicleZoneDistribution.ambulanceonly.vehicles["Base.VanAmbulance"] = nil;
    
    ---Fire Exclusive: The vanilla fire list, but will only spawn fire dept. vehicles---
    
    VehicleZoneDistribution.fireonly = VehicleZoneDistribution.fireonly or {};
    VehicleZoneDistribution.fireonly.vehicles = VehicleZoneDistribution.fireonly.vehicles or {};
    
    VehicleZoneDistribution.fireonly.vehicles["Base.PickUpVanLightsFire"] = nil;
    VehicleZoneDistribution.fireonly.vehicles["Base.PickUpTruckLightsFire"] =  nil;
	
	VehicleZoneDistribution.mccoyonly = VehicleZoneDistribution.mccoyonly or {};
	VehicleZoneDistribution.mccoyonly.vehicles = VehicleZoneDistribution.mccoyonly.vehicles or {};

	VehicleZoneDistribution.mccoyonly.vehicles["Base.PickUpVanMccoy"] = nil;
	VehicleZoneDistribution.mccoyonly.vehicles["Base.PickUpTruckMccoy"] = nil;
	VehicleZoneDistribution.mccoyonly.vehicles["Base.VanSpecial"] = nil;
	
	VehicleZoneDistribution.postalonly = VehicleZoneDistribution.postalonly or {};
	VehicleZoneDistribution.postalonly.vehicles = VehicleZoneDistribution.postalonly.vehicles or {};

	VehicleZoneDistribution.postalonly.vehicles["Base.StepVanMail"] = nil;
	VehicleZoneDistribution.postalonly.vehicles["Base.VanSpecial"] = nil;
	
	VehicleZoneDistribution.postallarge = VehicleZoneDistribution.postalonly or {};
	VehicleZoneDistribution.postallarge.vehicles = VehicleZoneDistribution.postalonly.vehicles or {};
	
	VehicleZoneDistribution.postallarge.vehicles["Base.StepVanMail"] = nil;
    
    
    end