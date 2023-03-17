---------------------------------------- Guitar Mode Stuff by Nater ------------------------------------------------

local guitarMode = false
local oldBinds = keyBinding
 
function keyUpHome(keynum)
	if keynum == 199 then
		if (guitarMode) then
			guitarMode = false
			keyBinding = oldBinds
			MainOptions.keys = {}
			MainOptions.keyBindingLength = 0
			local knownKeys = {}
			-- keyBinding comes from keyBinding.lua
			for i=1, #keyBinding do
				bind = {}
				bind.key = keyBinding[i].key
				bind.value = keyBinding[i].value
				if not luautils.stringStarts(keyBinding[i].value, "[") then
					-- we add the key binding to the core (java side), so the game will know the key
					local bindNbr = tonumber(bind.key);
					if getCore():isAzerty() then -- doing azerty special keyboard, a=q, etc...
						if  bind.value == "Left" then
							bindNbr = 16;
						elseif bind.value == "Forward" then
							bindNbr = 44;
						elseif bind.value == "Shout" then
							bindNbr = 30;
						elseif bind.value == "VehicleHorn" then
							bindNbr = 30;
						end
					end
					getCore():addKeyBinding(bind.value, bindNbr)
					bind.key = bindNbr;
					table.insert(MainOptions.keys, bind)
					if getTextManager():MeasureStringX(UIFont.Small, bind.value) > MainOptions.keyBindingLength then
						MainOptions.keyBindingLength = getTextManager():MeasureStringX(UIFont.Small, bind.value)
					end
					knownKeys[bind.value] = bind
				else
					table.insert(MainOptions.keys, bind)
				end
			end
		else
			guitarMode = true
			keyBinding = {}
			getCore():reinitKeyMaps()
		end
	end
end

------------------------------------------------------------- Guitar Sounds

local sounds = {}
--Chords, Major - Minor
sounds[2] = {regularSound = "PG_Chords_A", shiftSound = "PG_Chords_A_m"} -- 1
sounds[3] = {regularSound = "PG_Chords_A_Sharp", shiftSound = "PG_Chords_A_Sharp_m"} -- 2
sounds[4] = {regularSound = "PG_Chords_B", shiftSound = "PG_Chords_B_m"} -- 3
sounds[5] = {regularSound = "PG_Chords_C", shiftSound = "PG_Chords_C_m"} -- 4
sounds[6] = {regularSound = "PG_Chords_C_Sharp", shiftSound = "PG_Chords_C_Sharp_m"} -- 5
sounds[7] = {regularSound = "PG_Chords_D", shiftSound = "PG_Chords_D_m"} -- 6
sounds[8] = {regularSound = "PG_Chords_D_Sharp", shiftSound = "PG_Chords_D_Sharp_m"} -- 7
sounds[9] = {regularSound = "PG_Chords_E", shiftSound = "PG_Chords_E_m"} -- 8
sounds[10] = {regularSound = "PG_Chords_F", shiftSound = "PG_Chords_F_m"} -- 9
sounds[11] = {regularSound = "PG_Chords_F_Sharp", shiftSound = "PG_Chords_F_Sharp_m"} -- 0
sounds[12] = {regularSound = "PG_Chords_G", shiftSound = "PG_Chords_G_m"} -- -
sounds[13] = {regularSound = "PG_Chords_G_Sharp", shiftSound = "PG_Chords_G_Sharp_m"} -- =
--E String -- G String 
sounds[44] = {regularSound = "PG_E_0_Medium", shiftSound = "PG_G_1_Medium"} -- Z
sounds[45] = {regularSound = "PG_F_0_Medium", shiftSound = "PG_G_Sharp_1_Medium"} -- X
sounds[46] = {regularSound = "PG_F_Sharp_0_Medium", shiftSound = "PG_A_1_Medium"} -- C
sounds[47] = {regularSound = "PG_G_0_Medium", shiftSound = "PG_A_Sharp_1_Medium"} -- V
sounds[48] = {regularSound = "PG_G_Sharp_0_Medium", shiftSound = "PG_B_1_Medium"} -- B
sounds[49] = {regularSound = "PG_A_0_Medium", shiftSound = "PG_C_2_Medium"} -- N
sounds[50] = {regularSound = "PG_A_Sharp_0_Medium", shiftSound = "PG_C_Sharp_2_Medium"} -- M
sounds[51] = {regularSound = "PG_B_0_Medium", shiftSound = "PG_D_2_Medium"} -- ,
sounds[52] = {regularSound = "PG_C_1_Medium", shiftSound = "PG_D_Sharp_2_Medium"}     -- .
sounds[53] = {regularSound = "PG_C_Sharp_1_Medium", shiftSound = "PG_E_2_Medium"} -- /
-- A String -- B String 
sounds[30] = {regularSound = "PG_A_0_Medium", shiftSound = "PG_B_1_Medium"} -- A
sounds[31] = {regularSound = "PG_A_Sharp_0_Medium", shiftSound = "PG_C_2_Medium"} -- S
sounds[32] = {regularSound = "PG_B_0_Medium", shiftSound = "PG_C_Sharp_2_Medium"} -- D
sounds[33] = {regularSound = "PG_C_1_Medium", shiftSound = "PG_D_2_Medium"} -- F
sounds[34] = {regularSound = "PG_C_Sharp_1_Medium", shiftSound = "PG_D_Sharp_2_Medium"} -- G
sounds[35] = {regularSound = "PG_D_1_Medium", shiftSound = "PG_E_2_Medium"} -- H
sounds[36] = {regularSound = "PG_D_Sharp_1_Medium", shiftSound = "PG_F_2_Medium"} -- J
sounds[37] = {regularSound = "PG_E_1_Medium", shiftSound = "PG_F_Sharp_2_Medium"} -- K
sounds[38] = {regularSound = "PG_F_1_Medium"    , shiftSound = "PG_G_2_Medium"} -- L
sounds[39] = {regularSound = "PG_F_Sharp_1_Medium", shiftSound = "PG_G_Sharp_2_Medium"} -- ;
sounds[40] = {regularSound = "PG_G_1_Medium", shiftSound = "PG_A_2_Medium"} -- '
-- D String -- e String
sounds[16] = {regularSound = "PG_D_1_Medium", shiftSound = "PG_E_2_Medium"} -- Q
sounds[17] = {regularSound = "PG_D_Sharp_1_Medium", shiftSound = "PG_F_2_Medium"} -- W
sounds[18] = {regularSound = "PG_E_1_Medium", shiftSound = "PG_F_Sharp_2_Medium"} -- E
sounds[19] = {regularSound = "PG_F_1_Medium", shiftSound = "PG_G_2_Medium"} -- R
sounds[20] = {regularSound = "PG_F_Sharp_1_Medium", shiftSound = "PG_G_Sharp_2_Medium"} -- T
sounds[21] = {regularSound = "PG_G_1_Medium", shiftSound = "PG_A_2_Medium"} -- Y
sounds[22] = {regularSound = "PG_G_Sharp_1_Medium", shiftSound = "PG_A_Sharp_2_Medium"} -- U
sounds[23] = {regularSound = "PG_A_1_Medium"    , shiftSound = "PG_B_2_Medium"} -- I
sounds[24] = {regularSound = "PG_A_Sharp_1_Medium", shiftSound = "PG_C_3_Medium"} -- O
sounds[25] = {regularSound = "PG_B_1_Medium", shiftSound = "PG_C_Sharp_3_Medium"} -- P
sounds[26] = {regularSound = "PG_C_2_Medium", shiftSound = "PG_D_3_Medium"} -- [
sounds[27] = {regularSound = "PG_C_Sharp_2_Medium", shiftSound = "PG_D_Sharp_3_Medium"} -- ]

function checkSoundFunction(keyNum)
    if getPlayer() and not getPlayer():getInventory():contains("Base.GuitarAcoustic") then
        return
    end
	if guitarMode ~= true then
		return
	end
    if sounds[keyNum] ~= nil then
        if isKeyDown(54) then
            getSoundManager():PlayWorldSound(sounds[keyNum].shiftSound, getSpecificPlayer(0):getSquare(), 1, 5, 1, false)
        else
            getSoundManager():PlayWorldSound(sounds[keyNum].regularSound, getSpecificPlayer(0):getSquare(), 1, 5, 1, false)
        end
    end
end


Events.OnKeyPressed.Add(keyUpHome)
Events.OnKeyStartPressed.Add(checkSoundFunction)
