require 'ISUI/ISEmoteRadialMenu'
local ISEmoteRadialMenu_fillMenu_old = ISEmoteRadialMenu.fillMenu

local OrdinaryDanceBook = {
"BobTA African Noodle",
"BobTA African Rainbow",
"BobTA Arms Hip Hop",
"BobTA Arm Push",
"BobTA Arm Wave One",
"BobTA Arm Wave Two",
"BobTA Around The World",
"BobTA Bboy Hip Hop One",
"BobTA Bboy Hip Hop Three",
"BobTA Bboy Hip Hop Two",
"BobTA Body Wave",
"BobTA Booty Step",
"BobTA Breakdance Brooklyn Uprock",
"BobTA Cabbage Patch",
"BobTA Can Can",
"BobTA Chicken",
"BobTA Crazy Legs",
"BobTA Defile De Samba Parade",
"BobTA Hokey Pokey",
"BobTA Kick Step",
"BobTA Macarena",
"BobTA Maraschino",
"BobTA MoonWalk One",
"BobTA Northern Soul Spin",
"BobTA Northern Soul Spin On Floor",
"BobTA Raise The Roof",
"BobTA Really Twirl",
"BobTA Rib Pops",
"BobTA Rockette Kick",
"BobTA Rumba Dancing",
"BobTA Running Man One",
"BobTA Running Man Three",
"BobTA Running Man Two",
"BobTA Salsa",
"BobTA Salsa Double Twirl",
"BobTA Salsa Double Twirl and Clap",
"BobTA Salsa Side to Side",
"BobTA Shimmy",
"BobTA Shim Sham",
"BobTA Shuffling",
"BobTA Side to Side",
"BobTA Twist One",
"BobTA Twist Two",
"BobTA Uprock Indian Step",
"BobTA YMCA",
}

local DifficultDanceBook = {
	["TAD.BobTA_Afoxe_Samba_Raggae_card"] = "BobTA_Afoxe_Samba_Raggae",
	["TAD.BobTA_Belly_Dancing_One_card"] = "BobTA_Belly_Dancing_One",
	["TAD.BobTA_Belly_Dancing_Three_card"] = "BobTA_Belly_Dancing_Three",
	["TAD.BobTA_Belly_Dancing_Two_card"] = "BobTA_Belly_Dancing_Two",
	["TAD.BobTA_Boogaloo_card"] = "BobTA_Boogaloo",
	["TAD.BobTA_Breakdance_1990_card"] = "BobTA_Breakdance_1990",
	["TAD.BobTA_Breakdance_Freezes_Combo_card"] = "BobTA_Breakdance_Freezes_Combo",
	["TAD.BobTA_Charleston_card"] = "BobTA_Charleston",
	["TAD.BobTA_Gandy_card"] = "BobTA_Gandy",
	["TAD.BobTA_House_Dancing_card"] = "BobTA_House_Dancing",
	["TAD.BobTA_Locking_card"] = "BobTA_Locking",
	["TAD.BobTA_Moonwalk_Two_card"] = "BobTA_Moonwalk_Two",
	["TAD.BobTA_Northern_Soul_Spin_and_Floor_Work_card"] = "BobTA_Northern_Soul_Spin_and_Floor_Work",
	["TAD.BobTA_Northern_Soul_Spin_Dip_and_Splits_card"] = "BobTA_Northern_Soul_Spin_Dip_and_Splits",
	["TAD.BobTA_Rick_Dancing_card"] = "BobTA_Rick_Dancing",
	["TAD.BobTA_Robot_One_card"] = "BobTA_Robot_One",
	["TAD.BobTA_Robot_Two_card"] = "BobTA_Robot_Two",
	["TAD.BobTA_Salsa_Two_card"] = "BobTA_Salsa_Two",
	["TAD.BobTA_Samba_Olodum_card"] = "BobTA_Samba_Olodum",
	["TAD.BobTA_Samba_Pagode_card"] = "BobTA_Samba_Pagode",
	["TAD.BobTA_Slide_Step_card"] = "BobTA_Slide_Step",
	["TAD.BobTA_Snake_card"] = "BobTA_Snake",
	["TAD.BobTA_Thriller_Four_card"] = "BobTA_Thriller_Four",
	["TAD.BobTA_Thriller_One_card"] = "BobTA_Thriller_One",
	["TAD.BobTA_Thriller_Three_card"] = "BobTA_Thriller_Three",
	["TAD.BobTA_Thriller_Two_card"] = "BobTA_Thriller_Two",
	["TAD.BobTA_Tut_One_card"] = "BobTA_Tut_One",
	["TAD.BobTA_Tut_Two_card"] = "BobTA_Tut_Two",
	["TAD.BobTA_Wave_One_card"] = "BobTA_Wave_One",
	["TAD.BobTA_Wave_Two_card"] = "BobTA_Wave_Two",
}

function ISEmoteRadialMenu:fillMenu(submenu)
	ISEmoteRadialMenu.menu['TAD'] = {};
	ISEmoteRadialMenu.menu['TAD'].name = getText('IGUI_Emote_TAD');
	ISEmoteRadialMenu.menu['TAD'].subMenu = {};	
	ISEmoteRadialMenu.icons['TAD'] = getTexture('media/ui/UI_TAD.png');
	
	if self.character:isRecipeKnown("BobTA African Noodle") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_African_Noodle'] = getText('IGUI_Emote_BobTA_African_Noodle');
		ISEmoteRadialMenu.icons['BobTA_African_Noodle'] = getTexture('media/ui/tadordinary/BobTA_African_Noodle.png')
	end

	if self.character:isRecipeKnown("BobTA African Rainbow") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_African_Rainbow'] = getText('IGUI_Emote_BobTA_African_Rainbow');
		ISEmoteRadialMenu.icons['BobTA_African_Rainbow'] = getTexture('media/ui/tadordinary/BobTA_African_Rainbow.png')
	end

	if self.character:isRecipeKnown("BobTA Arms Hip Hop") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Arms_Hip_Hop'] = getText('IGUI_Emote_BobTA_Arms_Hip_Hop');
		ISEmoteRadialMenu.icons['BobTA_Arms_Hip_Hop'] = getTexture('media/ui/tadordinary/BobTA_Arms_Hip_Hop.png')
	end

	if self.character:isRecipeKnown("BobTA Arm Push") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Arm_Push'] = getText('IGUI_Emote_BobTA_Arm_Push');
		ISEmoteRadialMenu.icons['BobTA_Arm_Push'] = getTexture('media/ui/tadordinary/BobTA_Arm_Push.png')
	end

	if self.character:isRecipeKnown("BobTA Arm Wave One") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Arm_Wave_One'] = getText('IGUI_Emote_BobTA_Arm_Wave_One');
		ISEmoteRadialMenu.icons['BobTA_Arm_Wave_One'] = getTexture('media/ui/tadordinary/BobTA_Arm_Wave_One.png')
	end

	if self.character:isRecipeKnown("BobTA Arm Wave Two") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Arm_Wave_Two'] = getText('IGUI_Emote_BobTA_Arm_Wave_Two');
		ISEmoteRadialMenu.icons['BobTA_Arm_Wave_Two'] = getTexture('media/ui/tadordinary/BobTA_Arm_Wave_Two.png')
	end

	if self.character:isRecipeKnown("BobTA Around The World") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Around_The_World'] = getText('IGUI_Emote_BobTA_Around_The_World');
		ISEmoteRadialMenu.icons['BobTA_Around_The_World'] = getTexture('media/ui/tadordinary/BobTA_Around_The_World.png')
	end

	if self.character:isRecipeKnown("BobTA Bboy Hip Hop One") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Bboy_Hip_Hop_One'] = getText('IGUI_Emote_BobTA_Bboy_Hip_Hop_One');
		ISEmoteRadialMenu.icons['BobTA_Bboy_Hip_Hop_One'] = getTexture('media/ui/tadordinary/BobTA_Bboy_Hip_Hop_One.png')
	end

	if self.character:isRecipeKnown("BobTA Bboy Hip Hop Two") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Bboy_Hip_Hop_Two'] = getText('IGUI_Emote_BobTA_Bboy_Hip_Hop_Two');
		ISEmoteRadialMenu.icons['BobTA_Bboy_Hip_Hop_Two'] = getTexture('media/ui/tadordinary/BobTA_Bboy_Hip_Hop_Two.png')
	end


	if self.character:isRecipeKnown("BobTA Bboy Hip Hop Three") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Bboy_Hip_Hop_Three'] = getText('IGUI_Emote_BobTA_Bboy_Hip_Hop_Three');
		ISEmoteRadialMenu.icons['BobTA_Bboy_Hip_Hop_Three'] = getTexture('media/ui/tadordinary/BobTA_Bboy_Hip_Hop_Three.png')
	end

	if self.character:isRecipeKnown("BobTA Body Wave") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Body_Wave'] = getText('IGUI_Emote_BobTA_Body_Wave');
		ISEmoteRadialMenu.icons['BobTA_Body_Wave'] = getTexture('media/ui/tadordinary/BobTA_Body_Wave.png')
	end

	if self.character:isRecipeKnown("BobTA Booty Step") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Booty_Step'] = getText('IGUI_Emote_BobTA_Booty_Step');
		ISEmoteRadialMenu.icons['BobTA_Booty_Step'] = getTexture('media/ui/tadordinary/BobTA_Booty_Step.png')
	end

	if self.character:isRecipeKnown("BobTA Breakdance Brooklyn Uprock") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Breakdance_Brooklyn_Uprock'] = getText('IGUI_Emote_BobTA_Breakdance_Brooklyn_Uprock');
		ISEmoteRadialMenu.icons['BobTA_Breakdance_Brooklyn_Uprock'] = getTexture('media/ui/tadordinary/BobTA_Breakdance_Brooklyn_Uprock.png')
	end

	if self.character:isRecipeKnown("BobTA Cabbage Patch") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Cabbage_Patch'] = getText('IGUI_Emote_BobTA_Cabbage_Patch');
		ISEmoteRadialMenu.icons['BobTA_Cabbage_Patch'] = getTexture('media/ui/tadordinary/BobTA_Cabbage_Patch.png')
	end

	if self.character:isRecipeKnown("BobTA Can Can") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Can_Can'] = getText('IGUI_Emote_BobTA_Can_Can');
		ISEmoteRadialMenu.icons['BobTA_Can_Can'] = getTexture('media/ui/tadordinary/BobTA_Can_Can.png')
	end

	if self.character:isRecipeKnown("BobTA Chicken") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Chicken'] = getText('IGUI_Emote_BobTA_Chicken');
		ISEmoteRadialMenu.icons['BobTA_Chicken'] = getTexture('media/ui/tadordinary/BobTA_Chicken.png')
	end

	if self.character:isRecipeKnown("BobTA Crazy Legs") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Crazy_Legs'] = getText('IGUI_Emote_BobTA_Crazy_Legs');
		ISEmoteRadialMenu.icons['BobTA_Crazy_Legs'] = getTexture('media/ui/tadordinary/BobTA_Crazy_Legs.png')
	end

	if self.character:isRecipeKnown("BobTA Defile De Samba Parade") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Defile_De_Samba_Parade'] = getText('IGUI_Emote_BobTA_Defile_De_Samba_Parade');
		ISEmoteRadialMenu.icons['BobTA_Defile_De_Samba_Parade'] = getTexture('media/ui/tadordinary/BobTA_Defile_De_Samba_Parade.png')
	end

	if self.character:isRecipeKnown("BobTA Hokey Pokey") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Hokey_Pokey'] = getText('IGUI_Emote_BobTA_Hokey_Pokey');
		ISEmoteRadialMenu.icons['BobTA_Hokey_Pokey'] = getTexture('media/ui/tadordinary/BobTA_Hokey_Pokey.png')
	end

	if self.character:isRecipeKnown("BobTA Kick Step") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Kick_Step'] = getText('IGUI_Emote_BobTA_Kick_Step');
		ISEmoteRadialMenu.icons['BobTA_Kick_Step'] = getTexture('media/ui/tadordinary/BobTA_Kick_Step.png')
	end

	if self.character:isRecipeKnown("BobTA Macarena") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Macarena'] = getText('IGUI_Emote_BobTA_Macarena');
		ISEmoteRadialMenu.icons['BobTA_Macarena'] = getTexture('media/ui/tadordinary/BobTA_Macarena.png')
	end

	if self.character:isRecipeKnown("BobTA Maraschino") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Maraschino'] = getText('IGUI_Emote_BobTA_Maraschino');
		ISEmoteRadialMenu.icons['BobTA_Maraschino'] = getTexture('media/ui/tadordinary/BobTA_Maraschino.png')
	end

	if self.character:isRecipeKnown("BobTA MoonWalk One") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_MoonWalk_One'] = getText('IGUI_Emote_BobTA_MoonWalk_One');
		ISEmoteRadialMenu.icons['BobTA_MoonWalk_One'] = getTexture('media/ui/tadordinary/BobTA_MoonWalk_One.png')
	end

	if self.character:isRecipeKnown("BobTA Northern Soul Spin") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Northern_Soul_Spin'] = getText('IGUI_Emote_BobTA_Northern_Soul_Spin');
		ISEmoteRadialMenu.icons['BobTA_Northern_Soul_Spin'] = getTexture('media/ui/tadordinary/BobTA_Northern_Soul_Spin.png')
	end

	if self.character:isRecipeKnown("BobTA Northern Soul Spin On Floor") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Northern_Soul_Spin_On_Floor'] = getText('IGUI_Emote_BobTA_Northern_Soul_Spin_On_Floor');
		ISEmoteRadialMenu.icons['BobTA_Northern_Soul_Spin_On_Floor'] = getTexture('media/ui/tadordinary/BobTA_Northern_Soul_Spin_On_Floor.png')
	end

	if self.character:isRecipeKnown("BobTA Raise The Roof") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Raise_The_Roof'] = getText('IGUI_Emote_BobTA_Raise_The_Roof');
		ISEmoteRadialMenu.icons['BobTA_Raise_The_Roof'] = getTexture('media/ui/tadordinary/BobTA_Raise_The_Roof.png')
	end

	if self.character:isRecipeKnown("BobTA Really Twirl") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Really_Twirl'] = getText('IGUI_Emote_BobTA_Really_Twirl');
		ISEmoteRadialMenu.icons['BobTA_Really_Twirl'] = getTexture('media/ui/tadordinary/BobTA_Really_Twirl.png')
	end

	if self.character:isRecipeKnown("BobTA Rib Pops") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Rib_Pops'] = getText('IGUI_Emote_BobTA_Rib_Pops');
		ISEmoteRadialMenu.icons['BobTA_Rib_Pops'] = getTexture('media/ui/tadordinary/BobTA_Rib_Pops.png')
	end

	if self.character:isRecipeKnown("BobTA Rockette Kick") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Rockette_Kick'] = getText('IGUI_Emote_BobTA_Rockette_Kick');
		ISEmoteRadialMenu.icons['BobTA_Rockette_Kick'] = getTexture('media/ui/tadordinary/BobTA_Rockette_Kick.png')
	end

	if self.character:isRecipeKnown("BobTA Rumba Dancing") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Rumba_Dancing'] = getText('IGUI_Emote_BobTA_Rumba_Dancing');
		ISEmoteRadialMenu.icons['BobTA_Rumba_Dancing'] = getTexture('media/ui/tadordinary/BobTA_Rumba_Dancing.png')
	end

	if self.character:isRecipeKnown("BobTA Running Man One") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Running_Man_One'] = getText('IGUI_Emote_BobTA_Running_Man_One');
		ISEmoteRadialMenu.icons['BobTA_Running_Man_One'] = getTexture('media/ui/tadordinary/BobTA_Running_Man_One.png')
	end

	if self.character:isRecipeKnown("BobTA Running Man Two") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Running_Man_Two'] = getText('IGUI_Emote_BobTA_Running_Man_Two');
		ISEmoteRadialMenu.icons['BobTA_Running_Man_Two'] = getTexture('media/ui/tadordinary/BobTA_Running_Man_Two.png')
	end

	if self.character:isRecipeKnown("BobTA Running Man Three") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Running_Man_Three'] = getText('IGUI_Emote_BobTA_Running_Man_Three');
		ISEmoteRadialMenu.icons['BobTA_Running_Man_Three'] = getTexture('media/ui/tadordinary/BobTA_Running_Man_Three.png')
	end

	if self.character:isRecipeKnown("BobTA Salsa") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Salsa'] = getText('IGUI_Emote_BobTA_Salsa');
		ISEmoteRadialMenu.icons['BobTA_Salsa'] = getTexture('media/ui/tadordinary/BobTA_Salsa.png')
	end

	if self.character:isRecipeKnown("BobTA Salsa Double Twirl") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Salsa_Double_Twirl'] = getText('IGUI_Emote_BobTA_Salsa_Double_Twirl');
		ISEmoteRadialMenu.icons['BobTA_Salsa_Double_Twirl'] = getTexture('media/ui/tadordinary/BobTA_Salsa_Double_Twirl.png')
	end

	if self.character:isRecipeKnown("BobTA Salsa Double Twirl and Clap") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Salsa_Double_Twirl_and_Clap'] = getText('IGUI_Emote_BobTA_Salsa_Double_Twirl_and_Clap');
		ISEmoteRadialMenu.icons['BobTA_Salsa_Double_Twirl_and_Clap'] = getTexture('media/ui/tadordinary/BobTA_Salsa_Double_Twirl_and_Clap.png')
	end

	if self.character:isRecipeKnown("BobTA Salsa Side to Side") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Salsa_Side_to_Side'] = getText('IGUI_Emote_BobTA_Salsa_Side_to_Side');
		ISEmoteRadialMenu.icons['BobTA_Salsa_Side_to_Side'] = getTexture('media/ui/tadordinary/BobTA_Salsa_Side_to_Side.png')
	end

	if self.character:isRecipeKnown("BobTA Shimmy") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Shimmy'] = getText('IGUI_Emote_BobTA_Shimmy');
		ISEmoteRadialMenu.icons['BobTA_Shimmy'] = getTexture('media/ui/tadordinary/BobTA_Shimmy.png')
	end

	if self.character:isRecipeKnown("BobTA Shim Sham") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Shim_Sham'] = getText('IGUI_Emote_BobTA_Shim_Sham');
		ISEmoteRadialMenu.icons['BobTA_Shim_Sham'] = getTexture('media/ui/tadordinary/BobTA_Shim_Sham.png')
	end

	if self.character:isRecipeKnown("BobTA Shuffling") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Shuffling'] = getText('IGUI_Emote_BobTA_Shuffling');
		ISEmoteRadialMenu.icons['BobTA_Shuffling'] = getTexture('media/ui/tadordinary/BobTA_Shuffling.png')
	end

	if self.character:isRecipeKnown("BobTA Side to Side") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Side_to_Side'] = getText('IGUI_Emote_BobTA_Side_to_Side');
		ISEmoteRadialMenu.icons['BobTA_Side_to_Side'] = getTexture('media/ui/tadordinary/BobTA_Side_to_Side.png')
	end

	if self.character:isRecipeKnown("BobTA Twist One") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Twist_One'] = getText('IGUI_Emote_BobTA_Twist_One');
		ISEmoteRadialMenu.icons['BobTA_Twist_One'] = getTexture('media/ui/tadordinary/BobTA_Twist_One.png')
	end

	if self.character:isRecipeKnown("BobTA Twist Two") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Twist_Two'] = getText('IGUI_Emote_BobTA_Twist_Two');
		ISEmoteRadialMenu.icons['BobTA_Twist_Two'] = getTexture('media/ui/tadordinary/BobTA_Twist_Two.png')
	end

	if self.character:isRecipeKnown("BobTA Uprock Indian Step") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_Uprock_Indian_Step'] = getText('IGUI_Emote_BobTA_Uprock_Indian_Step');
		ISEmoteRadialMenu.icons['BobTA_Uprock_Indian_Step'] = getTexture('media/ui/tadordinary/BobTA_Uprock_Indian_Step.png')
	end

	if self.character:isRecipeKnown("BobTA YMCA") then
		ISEmoteRadialMenu.menu['TAD'].subMenu['BobTA_YMCA'] = getText('IGUI_Emote_BobTA_YMCA');
		ISEmoteRadialMenu.icons['BobTA_YMCA'] = getTexture('media/ui/tadordinary/BobTA_YMCA.png')
	end

	local allItems = self.character:getInventory():getItems()
	local taddif = false
	for i=1,allItems:size() do
		local item = allItems:get(i-1)
		if DifficultDanceBook[item:getFullType()] then
			if not taddif then
				taddif = true
				ISEmoteRadialMenu.menu['TADdif'] = {};
				ISEmoteRadialMenu.menu['TADdif'].name = getText('IGUI_Emote_TADdif');
				ISEmoteRadialMenu.menu['TADdif'].subMenu = {};	
				ISEmoteRadialMenu.icons['TADdif'] = getTexture('media/ui/UI_TADdif.png');
			end
			ISEmoteRadialMenu.menu['TADdif'].subMenu[DifficultDanceBook[item:getFullType()]] = getText('IGUI_Emote_' .. DifficultDanceBook[item:getFullType()]);
			ISEmoteRadialMenu.icons[DifficultDanceBook[item:getFullType()]] = getTexture('media/ui/taddifficult/' .. DifficultDanceBook[item:getFullType()] .. '.png');
		end
	end
	ISEmoteRadialMenu_fillMenu_old(self, submenu)
end

local old_ISEmoteRadialMenu_emote = ISEmoteRadialMenu.emote

function ISEmoteRadialMenu:emote(emote)
	if string.sub(emote,1,string.len('BobTA'))=='BobTA' then
		self.character:setPrimaryHandItem(nil)
		self.character:setSecondaryHandItem(nil)
	end
	old_ISEmoteRadialMenu_emote(self, emote)
end


function TADOnCreatePlayer(playerNum, playerObj)
	if not playerObj:getModData()['tad'] then
		playerObj:getModData()['tad'] = true
		local a = OrdinaryDanceBook[ZombRand(#OrdinaryDanceBook)+1]
		local b = OrdinaryDanceBook[ZombRand(#OrdinaryDanceBook)+1]
		local test = 0
		while (a == b) and test ~= 5 do
			b = OrdinaryDanceBook[ZombRand(#OrdinaryDanceBook)+1]
			test = test + 1
		end
		local c = OrdinaryDanceBook[ZombRand(#OrdinaryDanceBook)+1]
		test = 0
		while ((a == c) or (b == c)) and test ~= 5 do
			c = OrdinaryDanceBook[ZombRand(#OrdinaryDanceBook)+1]
			test = test + 1
		end
		playerObj:getKnownRecipes():add(a)
		playerObj:getKnownRecipes():add(b)
		playerObj:getKnownRecipes():add(c)
	end
end

Events.OnCreatePlayer.Add(TADOnCreatePlayer)


