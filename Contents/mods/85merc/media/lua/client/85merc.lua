local function info()

    ISCarMechanicsOverlay.CarList["Base.85mercJunk"] = {imgPrefix = "4door_", x=10,y=0};
    ISCarMechanicsOverlay.CarList["Base.85mercSedan"] = {imgPrefix = "4door_", x=10,y=0};
    ISCarMechanicsOverlay.CarList["Base.85mercWagon"] = {imgPrefix = "stationwagon_", x=10,y=0};
    ISCarMechanicsOverlay.CarList["Base.85mercWagon2"] = {imgPrefix = "stationwagon_", x=10,y=0};

end


Events.OnInitWorld.Add(info);