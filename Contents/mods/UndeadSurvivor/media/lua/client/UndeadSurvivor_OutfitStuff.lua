

local original_ISWearClothing_perform = ISWearClothing.perform
function ISWearClothing:perform()

    if self.item:getName() == "Amazona Dress" or self.item:getName() == "Amazona Dress but trimmed" or self.item:getName() == "Amazona Dress as shirt" or self.item:getName() == "Amazona Dress as tanktop" or self.item:getName() == "Amazona Dress as short tanktop" or self.item:getName() == "Amazona Dress as bikini"  then
        if self.character:isFemale() == false then
            self.character:Say("I am too muscular to wear this dress")
            self.character:playSound("ClothesRipping")
            return
        end
    end

    original_ISWearClothing_perform(self)
    
end


-- Add custom Makeup --

local makeup = {};
makeup.name = "Amazona01";
makeup.category = "FullFace";
makeup.item = "UndeadSurvivor.MakeUp_Amazona01";
makeup.makeuptypes = {};
makeup.makeuptypes["All"] = true;
makeup.makeuptypes["Foundation"] = true;
table.insert(MakeUpDefinitions.makeup, makeup);
