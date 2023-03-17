local function info()

	ISCarMechanicsOverlay.CarList["Base.91range"] = {imgPrefix = "suv_", x=10,y=0};
	ISCarMechanicsOverlay.CarList["Base.91range2"] = {imgPrefix = "suv_", x=10,y=0};

end


Events.OnInitWorld.Add(info);