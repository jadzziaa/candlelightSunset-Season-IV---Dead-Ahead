--This code is for compatibility with AuthenticZ Attatchments



--Thanks Authentic Peach for the mod!

if getActivatedMods():contains("Authentic Z - Current") or getActivatedMods():contains("AuthenticZLite") or getActivatedMods():contains("AuthenticZBackpacks+") then

--Thermos
	local item = ScriptManager.instance:getItem("SapphCooking.FullWaterThermos")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.EmptyThermos")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ThermosBeverage")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ThermosCoffee")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end
--Cola Bottle
	
	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottlewithMilk")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end
	
	local item = ScriptManager.instance:getItem("SapphCooking.WaterColaBottle")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottleEmpty")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

		local item = ScriptManager.instance:getItem("SapphCooking.ColaBottle")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottlewithProteinShake")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

--Gin

	local item = ScriptManager.instance:getItem("SapphCooking.GinFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.GinEmpty")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.GinWaterFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

--Vodka
	local item = ScriptManager.instance:getItem("SapphCooking.VodkaFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.VodkaEmpty")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.VodkaWaterFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

--Tequila
	local item = ScriptManager.instance:getItem("SapphCooking.TequilaFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.TequilaEmpty")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.TequilaWaterFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

--Sake
	local item = ScriptManager.instance:getItem("SapphCooking.SakeFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SakeEmpty")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SakeWaterFull")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

--Energy Drink
	local item = ScriptManager.instance:getItem("SapphCooking.EnergyDrink")
	if item then 
		item:DoParam("AttachmentType = Canteen")
	end

end
