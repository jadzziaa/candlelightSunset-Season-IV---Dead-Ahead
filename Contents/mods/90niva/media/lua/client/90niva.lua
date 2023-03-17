local function info()

    ISCarMechanicsOverlay.CarList["Base.90niva"] = {imgPrefix = "suv_", x=10,y=0};

end


Events.OnInitWorld.Add(info);