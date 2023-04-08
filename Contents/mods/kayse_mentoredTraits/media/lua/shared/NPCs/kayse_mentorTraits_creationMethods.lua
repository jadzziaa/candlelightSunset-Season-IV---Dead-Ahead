MentorTraits_CharacterDetails = {}

MentorTraits_CharacterDetails.DoTraits = function()
	-- Mentor Traits
	local mentor_carpentry = TraitFactory.addTrait("mentor_carpentry", "Carpentry Mentoring", 10, "You've been mentored in carpentry.", false);
    mentor_carpentry:addXPBoost(Perks.Woodwork, 1)
	local mentor_cooking = TraitFactory.addTrait("mentor_cooking", "Cooking Mentoring", 10, "You've been mentored in cooking.", false);
    mentor_cooking:addXPBoost(Perks.Cooking, 1)
	local mentor_farming = TraitFactory.addTrait("mentor_farming", "Farming Mentoring", 10, "You've been mentored in farming.", false);
    mentor_farming:addXPBoost(Perks.Farming, 1)
	local mentor_firstaid = TraitFactory.addTrait("mentor_firstaid", "First Aid Mentoring", 10, "You've been mentored in first aid.", false);
    mentor_firstaid:addXPBoost(Perks.Doctor, 1)
	local mentor_electrical = TraitFactory.addTrait("mentor_electrical", "Electrical Mentoring", 10, "You've been mentored in electricity.", false);
    mentor_electrical:addXPBoost(Perks.Electricity, 1)
	local mentor_metalworking = TraitFactory.addTrait("mentor_metalworking", "Metalworking Mentoring", 10, "You've been mentored in metalworking.", false);
    mentor_metalworking:addXPBoost(Perks.MetalWelding, 1)
	local mentor_mechanics = TraitFactory.addTrait("mentor_mechanics", "Mechanics Mentoring", 10, "You've been mentored in mechanics.", false);
    mentor_mechanics:addXPBoost(Perks.Mechanics, 1)
	local mentor_tailoring = TraitFactory.addTrait("mentor_tailoring", "Tailoring Mentoring", 10, "You've been mentored in tailoring.", false);
    mentor_tailoring:addXPBoost(Perks.Tailoring, 1)
	local mentor_tinkering = TraitFactory.addTrait("mentor_tinkering", "Tinkering Mentoring", 10, "You've been mentored in tinkering.", false);
    mentor_tinkering:addXPBoost(Perks.Tinkering, 1)

end

Events.OnGameBoot.Add(MentorTraits_CharacterDetails.DoTraits);

