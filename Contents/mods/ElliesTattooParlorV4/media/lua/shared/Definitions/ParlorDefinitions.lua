require "Definitions/MakeUpDefinitions"

MakeUpDefinitions.categories["Face_Tattoo"] = {
  name = "Face_Tattoo",
  avatarZoom = 20,
  avatarYOffset = -0.87,
  avatarXOffset = 0.004,
  category = "Face_Tattoo",
};
MakeUpDefinitions.categories["UpperBody_Tattoo"] = {
  name = "UpperBody_Tattoo",
  avatarZoom = 20,
  avatarYOffset = -0.70,
	avatarXRotation = 10,
  avatarXOffset = 0.004,
  category = "UpperBody_Tattoo",
};
MakeUpDefinitions.categories["LowerBody_Tattoo"] = {
  name = "LowerBody_Tattoo",
  avatarZoom = 20,
  avatarYOffset = -0.57,
  avatarXOffset = 0.004,
  category = "LowerBody_Tattoo",
};
MakeUpDefinitions.categories["LeftArm_Tattoo"] = {
  name = "LeftArm_Tattoo",
  avatarZoom = 15,
  avatarYOffset = -0.57,
  avatarXOffset = 0.004,
	avatarDirection = IsoDirections.W,
  category = "LeftArm_Tattoo",
};
MakeUpDefinitions.categories["RightArm_Tattoo"] = {
  name = "RightArm_Tattoo",
  avatarZoom = 15,
  avatarYOffset = -0.57,
  avatarXOffset = 0.004,
	avatarDirection = IsoDirections.E,
  category = "RightArm_Tattoo",
};
MakeUpDefinitions.categories["LeftLeg_Tattoo"] = {
  name = "LeftLeg_Tattoo",
  avatarZoom = 14,
  avatarYOffset = -0.25,
  avatarXOffset = 0.004,
	avatarDirection = IsoDirections.SW,
  category = "LeftLeg_Tattoo",
};
MakeUpDefinitions.categories["RightLeg_Tattoo"] = {
  name = "RightLeg_Tattoo",
  avatarZoom = 14,
  avatarYOffset = -0.25,
  avatarXOffset = 0.004,
	avatarDirection = IsoDirections.SE,
  category = "RightLeg_Tattoo",
};
MakeUpDefinitions.categories["Back_Tattoo"] = {
  name = "Back_Tattoo",
  avatarZoom = 16,
  avatarYOffset = -0.63,
  avatarXOffset = 0.004,
	avatarDirection = IsoDirections.N,
  category = "Back_Tattoo",
};


function addNewMakeUpDefinition(name, item, category)
	local makeup = {};
	makeup.name = name; -- the name you want it to show
	makeup.category = category; -- the category defined further above
	makeup.item = item; -- the item, including the module
	makeup.makeuptypes = {};
	makeup.makeuptypes[category] = true; -- where it's located?
	makeup.makeuptypes["All"] = true;
	makeup.makeuptypes["Tattoo"] = true; -- required for needle to work
	table.insert(MakeUpDefinitions.makeup, makeup);
end

--face
addNewMakeUpDefinition("Face_Tattoo_Heart", "ElliesTattooParlor.Face_Tattoo_Heart", "Face_Tattoo")

--upper body

addNewMakeUpDefinition("UpperBody_Tattoo_Heart", "ElliesTattooParlor.UpperBody_Tattoo_Heart", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Ellie", "ElliesTattooParlor.UpperBody_Tattoo_Ellie", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Marines2", "ElliesTattooParlor.UpperBody_Tattoo_Marines2", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Shuru", "ElliesTattooParlor.UpperBody_Tattoo_Shuru", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Val", "ElliesTattooParlor.UpperBody_Tattoo_Val", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Sakura", "ElliesTattooParlor.UpperBody_Tattoo_Sakura", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Scorp", "ElliesTattooParlor.UpperBody_Tattoo_Scorp", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Engine", "ElliesTattooParlor.UpperBody_Tattoo_Engine", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_CrossSkulls", "ElliesTattooParlor.UpperBody_Tattoo_CrossSkulls", "UpperBody_Tattoo")

addNewMakeUpDefinition("UpperBody_Tattoo_Moto", "ElliesTattooParlor.UpperBody_Tattoo_Moto", "UpperBody_Tattoo")

--lowerbody

addNewMakeUpDefinition("LowerBody_Tattoo_Heart", "ElliesTattooParlor.LowerBody_Tattoo_Heart", "LowerBody_Tattoo")

addNewMakeUpDefinition("LowerBody_Tattoo_Tank", "ElliesTattooParlor.LowerBody_Tattoo_Tank", "LowerBody_Tattoo")

addNewMakeUpDefinition("LowerBody_Tattoo_Jap1", "ElliesTattooParlor.LowerBody_Tattoo_Jap1", "LowerBody_Tattoo")

addNewMakeUpDefinition("LowerBody_Tattoo_Mask", "ElliesTattooParlor.LowerBody_Tattoo_Mask", "LowerBody_Tattoo")

addNewMakeUpDefinition("LowerBody_Tattoo_Tribal1", "ElliesTattooParlor.LowerBody_Tattoo_Tribal1", "LowerBody_Tattoo")

addNewMakeUpDefinition("LowerBody_Tattoo_SkullsBike", "ElliesTattooParlor.LowerBody_Tattoo_SkullsBike", "LowerBody_Tattoo")

--leftarm

addNewMakeUpDefinition("LeftArm_Tattoo_Heart", "ElliesTattooParlor.LeftArm_Tattoo_Heart", "LeftArm_Tattoo")

addNewMakeUpDefinition("LeftArm_Tattoo_Cavalry", "ElliesTattooParlor.LeftArm_Tattoo_Cavalry", "LeftArm_Tattoo")

addNewMakeUpDefinition("LeftArm_Tattoo_Cat", "ElliesTattooParlor.LeftArm_Tattoo_Cat", "LeftArm_Tattoo")

addNewMakeUpDefinition("LeftArm_Tattoo_Dragon", "ElliesTattooParlor.LeftArm_Tattoo_Dragon", "LeftArm_Tattoo")

addNewMakeUpDefinition("LeftArm_Tattoo_Tribal2", "ElliesTattooParlor.LeftArm_Tattoo_Tribal2", "LeftArm_Tattoo")

addNewMakeUpDefinition("LeftArm_Tattoo_MCEagle", "ElliesTattooParlor.LeftArm_Tattoo_MCEagle", "LeftArm_Tattoo")

--rightarm

addNewMakeUpDefinition("RightArm_Tattoo_Heart", "ElliesTattooParlor.RightArm_Tattoo_Heart", "RightArm_Tattoo")

addNewMakeUpDefinition("RightArm_Tattoo_Marine", "ElliesTattooParlor.RightArm_Tattoo_Marine", "RightArm_Tattoo")

addNewMakeUpDefinition("RightArm_Tattoo_OniDemon", "ElliesTattooParlor.RightArm_Tattoo_OniDemon", "RightArm_Tattoo")

addNewMakeUpDefinition("RightArm_Tattoo_OniFemale", "ElliesTattooParlor.RightArm_Tattoo_OniFemale", "RightArm_Tattoo")

addNewMakeUpDefinition("RightArm_Tattoo_OniMask", "ElliesTattooParlor.RightArm_Tattoo_OniMask", "RightArm_Tattoo")

addNewMakeUpDefinition("RightArm_Tattoo_Tribal3", "ElliesTattooParlor.RightArm_Tattoo_Tribal3", "RightArm_Tattoo")

addNewMakeUpDefinition("RightArm_Tattoo_Harley", "ElliesTattooParlor.RightArm_Tattoo_Harley", "RightArm_Tattoo")

--leftleg
addNewMakeUpDefinition("LeftLeg_Tattoo_Heart", "ElliesTattooParlor.LeftLeg_Tattoo_Heart", "LeftLeg_Tattoo")

addNewMakeUpDefinition("LeftLeg_Tattoo_Soldier", "ElliesTattooParlor.LeftLeg_Tattoo_Soldier", "LeftLeg_Tattoo")

addNewMakeUpDefinition("LeftLeg_Tattoo_SexyRevolver", "ElliesTattooParlor.LeftLeg_Tattoo_SexyRevolver", "LeftLeg_Tattoo")

addNewMakeUpDefinition("LeftLeg_Tattoo_Tiger", "ElliesTattooParlor.LeftLeg_Tattoo_Tiger", "LeftLeg_Tattoo")

addNewMakeUpDefinition("LeftLeg_Tattoo_Tribal5", "ElliesTattooParlor.LeftLeg_Tattoo_Tribal5", "LeftLeg_Tattoo")

addNewMakeUpDefinition("LeftLeg_Tattoo_Tribal6", "ElliesTattooParlor.LeftLeg_Tattoo_Tribal6", "LeftLeg_Tattoo")

addNewMakeUpDefinition("LeftLeg_Tattoo_Wheel", "ElliesTattooParlor.LeftLeg_Tattoo_Wheel", "LeftLeg_Tattoo")

--rightleg
addNewMakeUpDefinition("RightLeg_Tattoo_Heart", "ElliesTattooParlor.RightLeg_Tattoo_Heart", "RightLeg_Tattoo")

addNewMakeUpDefinition("RightLeg_Tattoo_Medic", "ElliesTattooParlor.RightLeg_Tattoo_Medic", "RightLeg_Tattoo")

addNewMakeUpDefinition("RightLeg_Tattoo_Fish", "ElliesTattooParlor.RightLeg_Tattoo_Fish", "RightLeg_Tattoo")

addNewMakeUpDefinition("RightLeg_Tattoo_Tribal4", "ElliesTattooParlor.RightLeg_Tattoo_Tribal4", "RightLeg_Tattoo")

addNewMakeUpDefinition("RightLeg_Tattoo_BikerHorse", "ElliesTattooParlor.RightLeg_Tattoo_BikerHorse", "RightLeg_Tattoo")

--back 
addNewMakeUpDefinition("Back_Tattoo_Heart", "ElliesTattooParlor.Back_Tattoo_Heart", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_ILoveSpiffos", "ElliesTattooParlor.Back_Tattoo_ILoveSpiffos", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_Veteran", "ElliesTattooParlor.Back_Tattoo_Veteran", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_Snake", "ElliesTattooParlor.Back_Tattoo_Snake", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_Owl", "ElliesTattooParlor.Back_Tattoo_Owl", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_TribalHeart", "ElliesTattooParlor.Back_Tattoo_TribalHeart", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_BikerGirl", "ElliesTattooParlor.Back_Tattoo_BikerGirl", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_GrimRider", "ElliesTattooParlor.Back_Tattoo_GrimRider", "Back_Tattoo")

addNewMakeUpDefinition("Back_Tattoo_SkullAce", "ElliesTattooParlor.Back_Tattoo_SkullAce", "Back_Tattoo")
