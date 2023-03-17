local function info()

	ISCarMechanicsOverlay.CarList["Base.88golf4doorMk2"] = {imgPrefix = "smallcar_", x=10,y=0};
	ISCarMechanicsOverlay.CarList["Base.88golf2doorMk2"] = {imgPrefix = "smallcar_", x=10,y=0};

end


Events.OnInitWorld.Add(info);