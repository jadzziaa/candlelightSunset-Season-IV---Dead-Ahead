local function addBodyLocationTattoo(tattooLocation)
    local group = BodyLocations.getGroup("Human");
    local list = getClassFieldVal(group, getClassField(group, 1));
    local tattooItem = group:getOrCreateLocation(tattooLocation);
    --local tattooItem = list:get(list:size()-1); unnecessary
    list:remove(tattooItem);
    list:add(0, tattooItem);
end

addBodyLocationTattoo("Face_Tattoo");
addBodyLocationTattoo("UpperBody_Tattoo");
addBodyLocationTattoo("LowerBody_Tattoo");
addBodyLocationTattoo("LeftArm_Tattoo");
addBodyLocationTattoo("RightArm_Tattoo");
addBodyLocationTattoo("LeftLeg_Tattoo");
addBodyLocationTattoo("RightLeg_Tattoo");
addBodyLocationTattoo("Back_Tattoo");