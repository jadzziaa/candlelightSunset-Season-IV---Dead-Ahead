mhpHandle = nil

local mhpEnabled = true

function onCreatePlayer(idx,player)
	if mhpHandle == nil then
		mhpHandle = ISMiniHealth:new(idx,player,mhpEnabled)
		-- mhpHandle = ISMiniHealth:new()
		mhpHandle:initialize()
		mhpHandle:instantiate()
		mhpHandle:createChildren()
		if mhpEnabled then
			mhpHandle:addToUIManager()
		end
		mhpHandle:initConfig()
		mhpHandle:checkNewResolution()
		mhpHandle:addSettingsPanel()
	elseif mhpHandle:getPlayerIsDead() == true then
		mhpHandle:setPlayer(idx,player)
	end
end

local function onPlayerDeath(player)
	if mhpHandle ~= nil and player == mhpHandle:getPlayer() then
		mhpHandle:setPlayerIsDead(true);
	end
end

local function onSave()
	if mhpHandle ~= nil then
		mhpHandle:writeConfig()
	end
end

local function onResolutionChange()
	if mhpHandle ~= nil then
		mhpHandle:checkNewResolution()
	end
end

Events.OnCreatePlayer.Add(onCreatePlayer)
Events.OnPlayerDeath.Add(onPlayerDeath);
Events.OnSave.Add(onSave);
Events.OnResolutionChange.Add(onResolutionChange)

-- ===== Mod options integration

if ModOptions and ModOptions.getInstance then

	local function onModOptionsApply(optionValues)
		local value = optionValues.settings.options.enable_mini_health
		mhpEnabled = value

		if mhpHandle ~= nil then
			mhpHandle:onModOptionsApply(value)
		end
	end

	local SETTINGS = {

		options_data = {
			enable_mini_health = {
				name = "UI_MiniHealth_Enable",
				default = true,
				OnApplyMainMenu = onModOptionsApply,
				OnApplyInGame = onModOptionsApply,
			}
		},

		mod_id = 'MiniHealth',
		mod_shortname = 'Mini Health Panel',
		mod_fullname = 'Mini Health Panel'
	}

	local optionsInstance = ModOptions:getInstance(SETTINGS)
	ModOptions:loadFile()

	Events.OnPreMapLoad.Add(function() onModOptionsApply({ settings = SETTINGS }) end)

end
