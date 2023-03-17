RecMedia = RecMedia or {}
P4RecordedMedia = {}

--[[ REMARKS : MediaLineData.codes list at 41.65
	[Skills]
		CRP : Carpentry
		COO : Cooking
		FRM : Farming
		DOC : FirstAid
		ELC : Electrical
		MTL : Metalworking
		MEC : Mechanics
		TAI : Tailoring
		FIS : Fishing
		TRA : Trapping
		FOR : Foraging
	[Recipes]
		RCP : GainRecipes
	[Moodles] -> ignore
		BOR : Boredom
		FAT : Fatigue
		PAN : Panic
		STS : Stress
]]

P4RecordedMedia.SKILL_CRP = "CRP"
P4RecordedMedia.SKILL_COO = "COO"
P4RecordedMedia.SKILL_FRM = "FRM"
P4RecordedMedia.SKILL_DOC = "DOC"
P4RecordedMedia.SKILL_ELC = "ELC"
P4RecordedMedia.SKILL_MTL = "MTL"
P4RecordedMedia.SKILL_MEC = "MEC"
P4RecordedMedia.SKILL_TAI = "TAI"
P4RecordedMedia.SKILL_FIS = "FIS"
P4RecordedMedia.SKILL_TRA = "TRA"
P4RecordedMedia.SKILL_FOR = "FOR"
P4RecordedMedia.SKILL_RCP = "RCP"

P4RecordedMedia.SKILL_NAME_CRP = getText("UI_P4VideoMeister_SkillName_CRP")
P4RecordedMedia.SKILL_NAME_COO = getText("UI_P4VideoMeister_SkillName_COO")
P4RecordedMedia.SKILL_NAME_FRM = getText("UI_P4VideoMeister_SkillName_FRM")
P4RecordedMedia.SKILL_NAME_DOC = getText("UI_P4VideoMeister_SkillName_DOC")
P4RecordedMedia.SKILL_NAME_ELC = getText("UI_P4VideoMeister_SkillName_ELC")
P4RecordedMedia.SKILL_NAME_MTL = getText("UI_P4VideoMeister_SkillName_MTL")
P4RecordedMedia.SKILL_NAME_MEC = getText("UI_P4VideoMeister_SkillName_MEC")
P4RecordedMedia.SKILL_NAME_TAI = getText("UI_P4VideoMeister_SkillName_TAI")
P4RecordedMedia.SKILL_NAME_FIS = getText("UI_P4VideoMeister_SkillName_FIS")
P4RecordedMedia.SKILL_NAME_TRA = getText("UI_P4VideoMeister_SkillName_TRA")
P4RecordedMedia.SKILL_NAME_FOR = getText("UI_P4VideoMeister_SkillName_FOR")
P4RecordedMedia.SKILL_NAME_RCP = getText("UI_P4VideoMeister_SkillName_RCP")

P4RecordedMedia.SKILL_TEXTURE_CRP = getTexture("media/ui/Skill_CRP.png")
P4RecordedMedia.SKILL_TEXTURE_COO = getTexture("media/ui/Skill_COO.png")
P4RecordedMedia.SKILL_TEXTURE_FRM = getTexture("media/ui/Skill_FRM.png")
P4RecordedMedia.SKILL_TEXTURE_DOC = getTexture("media/ui/Skill_DOC.png")
P4RecordedMedia.SKILL_TEXTURE_ELC = getTexture("media/ui/Skill_ELC.png")
P4RecordedMedia.SKILL_TEXTURE_MTL = getTexture("media/ui/Skill_MTL.png")
P4RecordedMedia.SKILL_TEXTURE_MEC = getTexture("media/ui/Skill_MEC.png")
P4RecordedMedia.SKILL_TEXTURE_TAI = getTexture("media/ui/Skill_TAI.png")
P4RecordedMedia.SKILL_TEXTURE_FIS = getTexture("media/ui/Skill_FIS.png")
P4RecordedMedia.SKILL_TEXTURE_TRA = getTexture("media/ui/Skill_TRA.png")
P4RecordedMedia.SKILL_TEXTURE_FOR = getTexture("media/ui/Skill_FOR.png")
P4RecordedMedia.SKILL_TEXTURE_RCP = getTexture("media/ui/Skill_RCP.png")

P4RecordedMedia.SKILLS = {
	{key=P4RecordedMedia.SKILL_CRP, name=P4RecordedMedia.SKILL_NAME_CRP, texture=P4RecordedMedia.SKILL_TEXTURE_CRP},
	{key=P4RecordedMedia.SKILL_COO, name=P4RecordedMedia.SKILL_NAME_COO, texture=P4RecordedMedia.SKILL_TEXTURE_COO},
	{key=P4RecordedMedia.SKILL_FRM, name=P4RecordedMedia.SKILL_NAME_FRM, texture=P4RecordedMedia.SKILL_TEXTURE_FRM},
	{key=P4RecordedMedia.SKILL_DOC, name=P4RecordedMedia.SKILL_NAME_DOC, texture=P4RecordedMedia.SKILL_TEXTURE_DOC},
	{key=P4RecordedMedia.SKILL_ELC, name=P4RecordedMedia.SKILL_NAME_ELC, texture=P4RecordedMedia.SKILL_TEXTURE_ELC},
	{key=P4RecordedMedia.SKILL_MTL, name=P4RecordedMedia.SKILL_NAME_MTL, texture=P4RecordedMedia.SKILL_TEXTURE_MTL},
	{key=P4RecordedMedia.SKILL_MEC, name=P4RecordedMedia.SKILL_NAME_MEC, texture=P4RecordedMedia.SKILL_TEXTURE_MEC},
	{key=P4RecordedMedia.SKILL_TAI, name=P4RecordedMedia.SKILL_NAME_TAI, texture=P4RecordedMedia.SKILL_TEXTURE_TAI},
	{key=P4RecordedMedia.SKILL_FIS, name=P4RecordedMedia.SKILL_NAME_FIS, texture=P4RecordedMedia.SKILL_TEXTURE_FIS},
	{key=P4RecordedMedia.SKILL_TRA, name=P4RecordedMedia.SKILL_NAME_TRA, texture=P4RecordedMedia.SKILL_TEXTURE_TRA},
	{key=P4RecordedMedia.SKILL_FOR, name=P4RecordedMedia.SKILL_NAME_FOR, texture=P4RecordedMedia.SKILL_TEXTURE_FOR},
	{key=P4RecordedMedia.SKILL_RCP, name=P4RecordedMedia.SKILL_NAME_RCP, texture=P4RecordedMedia.SKILL_TEXTURE_RCP},
}

P4RecordedMedia.Skills = {}
P4RecordedMedia.getSkills = function(id)
	return P4RecordedMedia.Skills[id]
end

P4RecordedMedia.SkillNames = {}
P4RecordedMedia.getSkillNames = function(id)
	return P4RecordedMedia.SkillNames[id]
end

P4RecordedMedia.SkillTextures = {}
P4RecordedMedia.getSkillTextures = function(id)
	return P4RecordedMedia.SkillTextures[id]
end

P4RecordedMedia.init = function(_rc)
	for i,media in pairs(RecMedia) do
		local skills = {}
		local skillNames = {}
		local skillTextures = {}
		for _,line in ipairs(media.lines) do
			for _,skill in ipairs(P4RecordedMedia.SKILLS) do
				if string.find(line.codes, skill.key) then
					if isNew(skills, skill.key) then
						table.insert(skills, skill.key)
						table.insert(skillNames, skill.name)
						table.insert(skillTextures, skill.texture)
					end
				end
			end
		end
		if #skills > 0 then
			P4RecordedMedia.Skills[i] = skills
			P4RecordedMedia.SkillNames[i] = skillNames
			P4RecordedMedia.SkillTextures[i] = skillTextures
		end
    end
end
Events.OnInitRecordedMedia.Add(P4RecordedMedia.init)

function isNew(list, value)
	for i,j in ipairs(list) do
		if j == value then
			return false
		end
	end
	return true
end
