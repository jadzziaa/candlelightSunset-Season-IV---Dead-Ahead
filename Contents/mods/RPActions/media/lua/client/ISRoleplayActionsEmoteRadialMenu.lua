require 'ISUI/ISEmoteRadialMenu'
local ISEmoteRadialMenu_fillMenu_old = ISEmoteRadialMenu.fillMenu

local OrdinaryPoseBook = {
"BobRPS Cancel Animation",
"BobRPA Arms Crossed",
"BobRPA At Ease",
"BobRPA Hand on Hip",
"BobRPA Hands Behind Back",
"BobRPA Hands in Pockets",
"BobRPA Hold Arm Front",

"BobRPA Injured",

"BobRPA Lean Back",
"BobRPA Lean Forward",
"BobRPA Lean Side",

"BobRPA Kneel",
"BobRPA Squat",

"BobRPA Sit Chair 1",
"BobRPA Sit Crossed Legs",
"BobRPA Sit Knees Up",
"BobRPA Sit Lounging",
"BobRPA Sit Sideways",

"BobRPA Lie on Back",
"BobRPA Lie on Floor",
"BobRPA Lie on Side",

"BobRPA Prone Idle",
"BobRPS Prone Rifle",
"BobRPS Prone Sidearm",
}

local SpecialPoseBook = {
	["RPA.BobRPA_Dad_Twerk_card"] = "BobRPA_DadTwerk",
	["RPA.BobRPA_Family_Guy_card"] = "BobRPA_FamilyGuy",
	["RPA.BobRPA_JackO_card"] = "BobRPA_JackO",
}

function ISEmoteRadialMenu:fillMenu(submenu)
	ISEmoteRadialMenu.menu['RPA'] = {};
	ISEmoteRadialMenu.menu['RPA'].name = getText('IGUI_Pose_RPA');
	ISEmoteRadialMenu.menu['RPA'].subMenu = {};	
	ISEmoteRadialMenu.icons['RPA'] = getTexture('media/ui/UI_RPA.png');
	
	if self.character:isRecipeKnown("BobRPS Cancel Animation") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPS_Cancel'] = getText('IGUI_Cancel');
		ISEmoteRadialMenu.icons['BobRPS_Cancel'] = getTexture('media/ui/UI_RPA_Cancel.png')
	end

--stances you toggle
	
	if self.character:isRecipeKnown("BobRPA Arms Crossed") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_ArmsCrossed'] = getText('IGUI_Pose_BobRPA_ArmsCrossed');
		ISEmoteRadialMenu.icons['BobRPA_ArmsCrossed'] = getTexture('media/ui/rpanormal/BobRPA_ArmsCrossed.png')
	end
	
	if self.character:isRecipeKnown("BobRPA At Ease") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_AtEase'] = getText('IGUI_Pose_BobRPA_AtEase');
		ISEmoteRadialMenu.icons['BobRPA_AtEase'] = getTexture('media/ui/rpanormal/BobRPA_AtEase.png')
	end
	
	if self.character:isRecipeKnown("BobRPA Hand on Hip") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_HandOnHip'] = getText('IGUI_Pose_BobRPA_HandOnHip');
		ISEmoteRadialMenu.icons['BobRPA_HandOnHip'] = getTexture('media/ui/rpanormal/BobRPA_HandOnHip.png')
	end
	
	if self.character:isRecipeKnown("BobRPA Hands Behind Back") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_HandsBehindBack'] = getText('IGUI_Pose_BobRPA_HandsBehindBack');
		ISEmoteRadialMenu.icons['BobRPA_HandsBehindBack'] = getTexture('media/ui/rpanormal/BobRPA_HandsBehindBack.png')
	end
	
	if self.character:isRecipeKnown("BobRPA Hands in Pockets") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_HandsInPockets'] = getText('IGUI_Pose_BobRPA_HandsInPockets');
		ISEmoteRadialMenu.icons['BobRPA_HandsInPockets'] = getTexture('media/ui/rpanormal/BobRPA_HandsInPockets.png')
	end
	
	if self.character:isRecipeKnown("BobRPA Hold Arm Front") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_HoldArmFront'] = getText('IGUI_Pose_BobRPA_HoldArmFront');
		ISEmoteRadialMenu.icons['BobRPA_HoldArmFront'] = getTexture('media/ui/rpanormal/BobRPA_HoldArmFront.png')
	end

	if self.character:isRecipeKnown("BobRPA Injured") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_Injured'] = getText('IGUI_Pose_BobRPA_Injured');
		ISEmoteRadialMenu.icons['BobRPA_Injured'] = getTexture('media/ui/rpanormal/BobRPA_Injured.png')
	end


	if self.character:isRecipeKnown("BobRPA Lean Back") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_LeanBack'] = getText('IGUI_Pose_BobRPA_LeanBack');
		ISEmoteRadialMenu.icons['BobRPA_LeanBack'] = getTexture('media/ui/rpanormal/BobRPA_LeanBack.png')
	end

	if self.character:isRecipeKnown("BobRPA Lean Forward") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_LeanForward'] = getText('IGUI_Pose_BobRPA_LeanForward');
		ISEmoteRadialMenu.icons['BobRPA_LeanForward'] = getTexture('media/ui/rpanormal/BobRPA_LeanForward.png')
	end

	if self.character:isRecipeKnown("BobRPA Lean Side") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_LeanSide'] = getText('IGUI_Pose_BobRPA_LeanSide');
		ISEmoteRadialMenu.icons['BobRPA_LeanSide'] = getTexture('media/ui/rpanormal/BobRPA_LeanSide.png')
	end



--kneeling

	if self.character:isRecipeKnown("BobRPA Kneel") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_Kneel'] = getText('IGUI_Pose_BobRPA_Kneel');
		ISEmoteRadialMenu.icons['BobRPA_Kneel'] = getTexture('media/ui/rpanormal/BobRPA_Kneel.png')
	end

	if self.character:isRecipeKnown("BobRPA Squat") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_Squat'] = getText('IGUI_Pose_BobRPA_Squat');
		ISEmoteRadialMenu.icons['BobRPA_Squat'] = getTexture('media/ui/rpanormal/BobRPA_Squat.png')
	end

--sitting

	if self.character:isRecipeKnown("BobRPA Sit Chair 1") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_SitChair1'] = getText('IGUI_Pose_BobRPA_SitChair1');
		ISEmoteRadialMenu.icons['BobRPA_SitChair1'] = getTexture('media/ui/rpanormal/BobRPA_SitChair1.png')
	end

	if self.character:isRecipeKnown("BobRPA Sit Crossed Legs") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_SitCrossedLegs'] = getText('IGUI_Pose_BobRPA_SitCrossedLegs');
		ISEmoteRadialMenu.icons['BobRPA_SitCrossedLegs'] = getTexture('media/ui/rpanormal/BobRPA_SitCrossedLegs.png')
	end

	if self.character:isRecipeKnown("BobRPA Sit Knees Up") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_SitKneesUp'] = getText('IGUI_Pose_BobRPA_SitKneesUp');
		ISEmoteRadialMenu.icons['BobRPA_SitKneesUp'] = getTexture('media/ui/rpanormal/BobRPA_SitKneesUp.png')
	end

	if self.character:isRecipeKnown("BobRPA Sit Lounging") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_SitLounging'] = getText('IGUI_Pose_BobRPA_SitLounging');
		ISEmoteRadialMenu.icons['BobRPA_SitLounging'] = getTexture('media/ui/rpanormal/BobRPA_SitLounging.png')
	end

	if self.character:isRecipeKnown("BobRPA Sit Sideways") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_SitSideways'] = getText('IGUI_Pose_BobRPA_SitSideways');
		ISEmoteRadialMenu.icons['BobRPA_SitSideways'] = getTexture('media/ui/rpanormal/BobRPA_SitSideways.png')
	end

--lying

	if self.character:isRecipeKnown("BobRPA Lie on Back") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_LieOnBack'] = getText('IGUI_Pose_BobRPA_LieOnBack');
		ISEmoteRadialMenu.icons['BobRPA_LieOnBack'] = getTexture('media/ui/rpanormal/BobRPA_BobRPA_LieOnBack.png')
	end

	if self.character:isRecipeKnown("BobRPA Lie on Floor") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_LieOnFloor'] = getText('IGUI_Pose_BobRPA_LieOnFloor');
		ISEmoteRadialMenu.icons['BobRPA_LieOnFloor'] = getTexture('media/ui/rpanormal/BobRPA_LieOnFloor.png')
	end

	if self.character:isRecipeKnown("BobRPA Lie on Side") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_LieOnSide'] = getText('IGUI_Pose_BobRPA_LieOnSide');
		ISEmoteRadialMenu.icons['BobRPA_LieOnSide'] = getTexture('media/ui/rpanormal/BobRPA_LieOnSide.png')
	end


--[[
	if self.character:isRecipeKnown("BobRPA Prone Idle") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPA_ProneIdle'] = getText('IGUI_Pose_BobRPA_ProneIdle');
		ISEmoteRadialMenu.icons['BobRPA_ProneIdle'] = getTexture('media/ui/rpanormal/BobRPA_ProneIdle.png')
	end

	if self.character:isRecipeKnown("BobRPS Prone Aim Rifle") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPS_ProneAimRifle'] = getText('IGUI_Pose_BobRPS_ProneAimRifle');
		ISEmoteRadialMenu.icons['BobRPS_ProneAimRifle'] = getTexture('media/ui/rpanormal/BobRPS_ProneAimRifle.png')
	end

	if self.character:isRecipeKnown("BobRPS Prone Sidearm") then
		ISEmoteRadialMenu.menu['RPA'].subMenu['BobRPS_ProneAimSidearm'] = getText('IGUI_Pose_BobRPS_ProneAimSidearm');
		ISEmoteRadialMenu.icons['BobRPS_ProneAimSidearm'] = getTexture('media/ui/rpanormal/BobRPS_ProneAimSidearm.png')
	end
--]]


	local allItems = self.character:getInventory():getItems()
	local RPAspc = false
	for i=1,allItems:size() do
		local item = allItems:get(i-1)
		if SpecialPoseBook[item:getFullType()] then
			if not RPAspc then
				RPAspc = true
				ISEmoteRadialMenu.menu['RPAspc'] = {};
				ISEmoteRadialMenu.menu['RPAspc'].name = getText('IGUI_Pose_RPAspc');
				ISEmoteRadialMenu.menu['RPAspc'].subMenu = {};	
				ISEmoteRadialMenu.icons['RPAspc'] = getTexture('media/ui/UI_RPAspc.png');
			end
			ISEmoteRadialMenu.menu['RPAspc'].subMenu[SpecialPoseBook[item:getFullType()]] = getText('IGUI_Pose_' .. SpecialPoseBook[item:getFullType()]);
			ISEmoteRadialMenu.icons[SpecialPoseBook[item:getFullType()]] = getTexture('media/ui/rpaspecial/' .. SpecialPoseBook[item:getFullType()] .. '.png');
		end
	end
	ISEmoteRadialMenu_fillMenu_old(self, submenu)
end


local old_ISEmoteRadialMenu_emote = ISEmoteRadialMenu.emote

function ISEmoteRadialMenu:emote(emote)
	if string.sub(emote,1,string.len('BobRPA'))=='BobRPA' then
		self.character:setPrimaryHandItem(nil)
		self.character:setSecondaryHandItem(nil)
	end
	if string.sub(emote,1,string.len('BobRPS'))=='BobRPS' then
		--whuh
	end
	old_ISEmoteRadialMenu_emote(self, emote)
end


function RPAOnCreatePlayer(playerNum, playerObj)
	playerObj:getModData()['RPA'] = true
	local b = 1
	while b ~= #OrdinaryPoseBook+1 do
		local a = OrdinaryPoseBook[b]
		playerObj:getKnownRecipes():add(a)
		b = b + 1
	end
end

Events.OnCreatePlayer.Add(RPAOnCreatePlayer)


