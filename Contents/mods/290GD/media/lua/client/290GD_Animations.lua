-- Credit: Chuck
-- This is free for anyone to use that needs it for a project but do credit Chuck.

---If the provided 'input' is not a table then that is returned (string expected).
---Otherwise; then parse every other value as a acceptable value and it's weight.
local function parseSeatAnimationSelection(input)
	if type(input) == "table" then
		---If input is a table parse each value and check if it's a string
		local parsedWeightedInput = {}
		for key,value in pairs(input) do
			if type(value) == "string" then
				---If the value is a string then check the next value
				---If it's a number use as an iterator; otherwise use 1
				local iterations = input[key+1]
				if type(iterations) ~= "number" then
					iterations = 1
				end
				---Add as many iterations as selected for value
				for i=1, iterations do
					table.insert(parsedWeightedInput, value)
				end
			end
		end

		if #parsedWeightedInput>0 then
			local selection = parsedWeightedInput[ZombRand(#parsedWeightedInput)+1]
			return selection
		else
			print("SC_ANIM: DEBUG ERROR: parsedWeightedInput not populated. (input:"..tostring(input)..")")
		end
	else
		return input
	end
end


local vehicleToSeatAnimations = {

    ["Base.290GD2Door"] = {
        ["seat0"]="Bob_Idle_Driver",
		["seat1"]="Shark_Idle_Passenger",
        ["passenger"]="Shark_Idle_Passenger",
    },

	["Base.290GD2DoorSmall"] = {
        ["seat0"]="Bob_Idle_Driver",
		["seat1"]="Shark_Idle_Passenger",
        ["passenger"]="Shark_Idle_Passenger",
    },

	["Base.290GD4Door"] = {
        ["seat0"]="Bob_Idle_Driver",
		["seat1"]="Shark_Idle_Passenger",
        ["passenger"]="Shark_Idle_Passenger",
    },

	["Base.290GDOpenTop"] = {
        ["seat0"]="Bob_Idle_Driver",
		["seat1"]="Shark_Idle_Passenger",
        ["passenger"]="Shark_Idle_Passenger",
    },
}

---@param player IsoPlayer|IsoGameCharacter
local function Vehicle_Enter(player)
    ---@type BaseVehicle
    local vehicle = player:getVehicle()
    if not vehicle then return end

    local vehicleName = vehicle:getScriptName()
    print("SC_ANIM: DEBUG: "..vehicleName)

    local seat = vehicle:getSeat(player)
    print(" -- Seat: "..seat)
    if not seat then return end

    local vehicleAnimation = vehicleToSeatAnimations[vehicleName]
    if not vehicleAnimation then return end

    local fetchedAnimation = vehicleAnimation["seat"..seat] or vehicleAnimation["passenger"]
    fetchedAnimation = parseSeatAnimationSelection(fetchedAnimation)
    print(" ---- Anim Selected: "..fetchedAnimation)

    if fetchedAnimation then
        player:SetVariable("VehicleScriptName", fetchedAnimation)
    end
end


Events.OnEnterVehicle.Add(Vehicle_Enter)
Events.OnSwitchVehicleSeat.Add(Vehicle_Enter)


local function Vehicle_Exit(player)
    --sendClientCommand(player, "SC_VehicleAnim", "PlayerExit", {})
    player:SetVariable("VehicleScriptName", "")
end
Events.OnExitVehicle.Add(Vehicle_Exit)