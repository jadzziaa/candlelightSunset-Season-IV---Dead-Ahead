-- This code is made by "Afterworlds" and has took from his mod "They Knew"
-- It makes Prepper Zombies spawn with ammunition sometimes
function CheckDrops(zombie)
	if not zombie:getOutfitName() then return false end
	local outfit = tostring(zombie:getOutfitName());
	local inv = zombie:getInventory();
	
	
	if outfit == "Stalker" then
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Aluminum", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Twigs", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Twigs", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.GunPowder", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.AlcoholBandage", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.TrapBox", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.TrapMouse", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.FishingTackle", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.FireWoodKit", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.FishingLine", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.BeerCan", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.BeerCan", 1);
		end
		if getActivatedMods():contains("ExpandedHelicopterEvents") then
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("EHE.ProteinBar", 1);
			end
		end
	end
	
	if outfit == "Prepper" then
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets9mmBox", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets44Box", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets45Box", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets9mmBox", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets44Box", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bullets45Box", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.ToiletPaper", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.ToiletPaper", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.WhiskeyFull", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Ramen", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Ramen", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Ramen", 1);
		end
		if getActivatedMods():contains("ExpandedHelicopterEvents") then
			if 40 >= ZombRand(1, 100) then
				inv:AddItems("EHE.EmergencyWaterRation", 1);
			end
			if 40 >= ZombRand(1, 100) then
				inv:AddItems("EHE.EmergencyWaterRation", 1);
			end
			if 40 >= ZombRand(1, 100) then
				inv:AddItems("EHE.EmergencyWaterRation", 1);
			end
			if 40 >= ZombRand(1, 100) then
				inv:AddItems("EHE.MealReadytoEat", 1);
			end
		end
	end
	
	if outfit == "Nomad" then
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Cereal", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.CannedCornedBeef", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.CannedSardines", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bread", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Butter", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Rosemary", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Sage", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Thyme", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Pepper", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Salt", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Wine2", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.TinOpener", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Candle", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Lighter", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.MugSpiffo", 1);
		end
	end
	
	if outfit == "OminousNomad" then
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Cereal", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.CannedCornedBeef", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.CannedSardines", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bread", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Butter", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Rosemary", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Sage", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Thyme", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Pepper", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Salt", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Wine2", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.TinOpener", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Candle", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Lighter", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.MugSpiffo", 1);
		end
	end
	
	if outfit == "Headhunter" then
	
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 40 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.HeadhunterScope", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto01", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto02", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto03", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto04", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto05", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto06", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto07", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto08", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto09", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto10", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.M14Clip", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.M14Clip", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.M14Clip", 1);
		end
		
		
		if getActivatedMods():contains("firearmmod") then
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.762x51Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.762x51Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.762x51Box", 1);
			end
		else
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.308Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.308Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.308Box", 1);
			end
		end
		
		
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Matches", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Pills", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.PillsBeta", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Camera", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.CameraFilm", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.SunflowerSeeds", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.MintCandy", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bread", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Butter", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Cheese", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.HuntingKnife", 1);
		end
		if getActivatedMods():contains("ExpandedHelicopterEvents") then
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("EHE.ProteinBar", 1);
			end
		end
	end
	
	if outfit == "DeadlyHeadhunter" then
	
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 40 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.HeadhunterScope", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto01", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto02", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto03", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto04", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto05", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto06", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto07", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto08", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto09", 1);
		end
		if 15 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.BountyPhoto10", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.M14Clip", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.M14Clip", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.M14Clip", 1);
		end
		
		if getActivatedMods():contains("firearmmod") then
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.762x51Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.762x51Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.762x51Box", 1);
			end
		else
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.308Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.308Box", 1);
			end
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("Base.308Box", 1);
			end
		end
		
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Matches", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Pills", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.PillsBeta", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Camera", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.CameraFilm", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.SunflowerSeeds", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.MintCandy", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bread", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Butter", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Cheese", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.HuntingKnife", 1);
		end
		if getActivatedMods():contains("ExpandedHelicopterEvents") then
			if 50 >= ZombRand(1, 100) then
				inv:AddItems("EHE.ProteinBar", 1);
			end
		end
	end

	if outfit == "Amazona" then
	
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Maggots", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("UndeadSurvivor.AmazonaFeather01", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Candle", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Matches", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.JuiceBox", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.WildEggs", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.WildEggs", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Pancakes", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Crackers", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Pepperoni", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.WaterBottleFull", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.GingerRoot", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.GummyWorms", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Bass", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Perch", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.Panfish", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.Pan", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.MugRed", 1);
		end
		if 50 >= ZombRand(1, 100) then
			inv:AddItems("Base.MakeupFoundation", 1);
		end
		if 30 >= ZombRand(1, 100) then
			inv:AddItems("Base.MakeupEyeshadow", 1);
		end

		if 50 >= ZombRand(1, 100) then
			if 20 >= ZombRand(1, 100) then
				inv:AddItems("Base.BookFishing1", 1);
			elseif 40 >= ZombRand(1, 100) then
				inv:AddItems("Base.BookFishing2", 1);
			elseif 60 >= ZombRand(1, 100) then
				inv:AddItems("Base.BookFishing3", 1);
			elseif 80 >= ZombRand(1, 100) then
				inv:AddItems("Base.BookFishing4", 1);
			else
				inv:AddItems("Base.BookFishing5", 5);
			end
		end
	end
	
	
end

Events.OnZombieDead.Add(CheckDrops);
