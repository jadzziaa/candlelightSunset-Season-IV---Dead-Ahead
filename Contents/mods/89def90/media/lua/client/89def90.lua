local function info()

    ISCarMechanicsOverlay.CarList["Base.89def90"] = {imgPrefix = "suv_", x=10,y=0};
    ISCarMechanicsOverlay.CarList["Base.89def90op"] = {imgPrefix = "suv_", x=10,y=0};

end


Events.OnInitWorld.Add(info);