local CurrVersion = "IsMCMInstalled_v1"

local OldVersions = { }
local function Old(str)
	OldVersions[str] = true
end

-- Insert old version strings here
-- (in the future)

-- ...

-- Current version should only be increased,
-- if any significant changes to the API are made,
-- which require mod authors to update their mods

-- We set the meta table, so that when the version check variable is read,
-- we run a custom function. If a mod checks in with a string that is
-- deemed outdated, we throw a warning and an error in the log.

-- If MCM isn't installed, the variable will simply read nil
-- and the branch picks false without any error.

-- We hook into an already existing table, instead of _G, because
-- we don't want to add any overhead to every single variable read.
-- Ideally we should pick a table that gets rarely if ever used.

local MTHost = Mod

local mt = getmetatable(MTHost) or {}
setmetatable(MTHost, mt)

local old__index = mt.__index
mt.__index = function(t, k)
	if CurrVersion == k then return true end

	if OldVersions[k] then
		-- TODO: some pop-up warning for the user, with instructions,
		-- we'll worry about it in the future.
		local _, e = pcall(function() error("MCM version check failed. Please ensure that your mod complies with the latest version of MCM and update the version check.") end)
		print(e)
		return false
	end

	local oi_type = type(old__index)
	if oi_type == "function" then return old__index(t, k) end
	if oi_type == "table" then return old__index[k] end
	return nil
end
