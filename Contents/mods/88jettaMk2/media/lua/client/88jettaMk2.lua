local function info()

	ISCarMechanicsOverlay.CarList["Base.88jetta4doorMk2"] = {imgPrefix = "4door_", x=10,y=0};
	ISCarMechanicsOverlay.CarList["Base.88jetta2doorMk2"] = {imgPrefix = "4door_", x=10,y=0};

end


Events.OnInitWorld.Add(info);