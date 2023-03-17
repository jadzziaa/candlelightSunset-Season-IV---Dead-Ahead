if getActivatedMods():contains("AquatsarYachtClub") or getActivatedMods():contains("AquatsarYachtClub_TEST") then
	require 'Boats/ISUI/ISBoatMechanicsOverlay'
	if ISBoatMechanicsOverlay then
		ISBoatMechanicsOverlay.BoatList["Base.AMC_Waverunner"] = {imgPrefix = "AMC_Waverunner_", x=10,y=0};
        
		ISBoatMechanicsOverlay.PartList["Battery"].vehicles["AMC_Waverunner_"] = {img="battery", x=14,y=111,x2=59,y2=144};
		ISBoatMechanicsOverlay.PartList["Engine"].vehicles["AMC_Waverunner_"] = {x=14,y=51,x2=86,y2=96};
		ISBoatMechanicsOverlay.PartList["Muffler"].vehicles["AMC_Waverunner_"] = {x=232,y=301,x2=269,y2=370};
		ISBoatMechanicsOverlay.PartList["GasTank"].vehicles["AMC_Waverunner_"] = {img="gastank", x=206,y=147,x2=269,y2=187};
	end
end
