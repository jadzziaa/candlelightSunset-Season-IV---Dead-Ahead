local function info()

	ISCarMechanicsOverlay.CarList["Base.87cruiser"] = {imgPrefix = "suv_", x=10,y=0};
	ISCarMechanicsOverlay.CarList["Base.87cruiserLights"] = {imgPrefix = "suv_", x=10,y=0};	
	ISCarMechanicsOverlay.CarList["Base.87cruiserRoofrack"] = {imgPrefix = "suv_", x=10,y=0};	

end


Events.OnInitWorld.Add(info);