-- TODO: de-table-fy aim time, since all of this is handled clientside anyway
-- TODO: make crosshair scale correctly with different resolutions (currently calibrated for 1920x1080)

-- constants
local MaxHitChance = 			100
local MaxCritChance = 			95
local DefaultHitChance = 		0
local DefaultCritChance = 		20

local MaxAimTimeFactor = 		0.75
local MinAimTimeFactor = 		0.09
local NormalHitTime = 			0.4
local GlobalAimTimeMultiplier = 1

local CrossHairEnable = true

local CrossHairMaxAlpha = 		0.8
local CrossHairMinAlpha = 		0.1

local CrossHairThickness = 		3
local CrossHairMinSpread = 		20
local CrossHairMaxSpread = 		70
local CrossHairWidth = 			30
local CrossHairVertOffset = 	35

local CrossHairScale = 1
local CrossHairScaleWithZoom = true

local CrossHairR = 0.8
local CrossHairG = 0.24
local CrossHairB = 0.24

local WeaponPartTypes = { "Scope", "Clip", "Sling", "Canon", "Stock", "RecoilPad" }

local EmptyTable = {}		-- Instead of allocating new empty tables for place holders, we just keep this one around

-- persistent tables
local VanillaItemData = {}	-- Unedited weapon data, used as base for derivatives
local PlayerAimTime = {}	-- Each players aim state, from 0 to 1, drives critical chance

local function Lerp(a,b,alpha)
	return a + (b-a) * alpha
end

local function IsGun(Item)
	return Item and Item:IsWeapon() and Item:isRanged()
end

local function GetHitAndCritAimTimes(CharIndex, Weapon)
	if not IsGun(Weapon) then return 0,0 end

	local function SquareAndClamp(x)
		x = math.max(0, math.min(1, x))
		return x*x
	end

	local AimSkill = getSpecificPlayer(CharIndex):getPerkLevel(Perks.Aiming)
	local WeaponAimTime = Weapon:getAimingTime() * Lerp(MaxAimTimeFactor, MinAimTimeFactor, AimSkill / 10.0) * GlobalAimTimeMultiplier
	local BaseAimTime = (PlayerAimTime[CharIndex] or 0) / WeaponAimTime

	local HitAimTime = BaseAimTime / NormalHitTime
	local CritAimTime = (BaseAimTime - NormalHitTime) / (1 - NormalHitTime)

	return SquareAndClamp(HitAimTime), SquareAndClamp(CritAimTime)
end

local function GetHitAndCritChances(CharIndex, Weapon)
	if not IsGun(Weapon) then return 0,0 end

	local HitAimTime, CritAimTime = GetHitAndCritAimTimes(CharIndex, Weapon)
	local OriginalWeaponData = VanillaItemData[Weapon:getScriptItem():getFullName()] or EmptyTable

	-- Hit Chance
	local OriginalHitChance = OriginalWeaponData.HitChance or DefaultHitChance
	for k,v in pairs(WeaponPartTypes) do
		local WeaponPart = Weapon:getWeaponPart(v)
		if WeaponPart then
			OriginalHitChance = OriginalHitChance + WeaponPart:getHitChance()
		end
	end

	local NewHitChance = math.floor(Lerp(OriginalHitChance, MaxHitChance, HitAimTime))

	-- Crit Chance
	local OriginalCritChance = OriginalWeaponData.CritChance or DefaultCritChance
	local NewCritChance = math.floor(Lerp(OriginalCritChance, MaxCritChance, CritAimTime))

	return NewHitChance, NewCritChance
end

local function ApplyHitAndCritBonus(CharIndex, Weapon)
	if not IsGun(Weapon) then return end

	local NewHitChance, NewCritChance = GetHitAndCritChances(CharIndex, Weapon)

	Weapon:setHitChance(NewHitChance)
	Weapon:setCriticalChance(NewCritChance)
end

-- Storing original weapon values as base for later manipulation
Events.OnGameBoot.Add(function()
	local StatDataInfo = {}

	local function AddStatDataInfo(Id, Key, DefaultValue)
		StatDataInfo[Id] = { ["Key"] = Key, ["DefaultValue"] = DefaultValue }
	end

	AddStatDataInfo("public float zombie.scripting.objects.Item.CriticalChance", "CritChance", DefaultCritChance)
	AddStatDataInfo("public int zombie.scripting.objects.Item.HitChance", "HitChance", DefaultHitChance)

	local AllItems = ScriptManager.instance:getAllItems()

	for i=0,AllItems:size()-1 do
		local item = AllItems:get(i)

		if item:isRanged() then
			local bNotEmpty = false
			local ShootData = {}

			for j=0,getNumClassFields(item)-1 do
				local Field = getClassField(item, j)
				local FieldName = tostring(Field)

				local CurStatDataInfo = StatDataInfo[FieldName]
				if CurStatDataInfo then
					local Value = getClassFieldVal(item, Field)
					if Value ~= CurStatDataInfo.DefaultValue then
						ShootData[CurStatDataInfo.Key] = Value
						bNotEmpty = true
					end
				end
			end

			if bNotEmpty then
				VanillaItemData[item:getFullName()] = ShootData
			end
		end
	end
end)

-- Keep track of how long the player aims and is not moving
Events.OnPlayerUpdate.Add(function(Character)
	local CharIndex = Character:getPlayerNum()

	local Weapon = Character:getPrimaryHandItem()

	if not IsGun(Weapon) or Character:isPlayerMoving() or not Character:isAiming() or Character:isDoShove() then
		PlayerAimTime[CharIndex] = 0
		return
	end

	PlayerAimTime[CharIndex] = PlayerAimTime[CharIndex] + getGameTime():getRealworldSecondsSinceLastUpdate()

	-- Applying the modified chances here would be necessary to make
	-- the outline color correct, but it breaks the chance
	-- apparently, so its commented out for now

	--ApplyHitAndCritBonus(CharIndex, Weapon)
end)

-- Modify hit and critical chance, right before shot gets evaluated
Events.OnWeaponSwing.Add(function(Character, Weapon)
	if not IsGun(Weapon) or not Character:isLocalPlayer() then return end

	local CharIndex = Character:getPlayerNum()

	ApplyHitAndCritBonus(CharIndex, Weapon)

	PlayerAimTime[CharIndex] = 0
end)

-- Reset aim time when shoving and reloading
local function ResetAimTime(Character, Weapon)
	PlayerAimTime[Character:getPlayerNum()] = 0
end

Events.OnPressReloadButton.Add(ResetAimTime)
Events.OnPressRackButton.Add(ResetAimTime)

-- Crosshair Drawing
-- Crosshair shrinks and becomes fully opaque, as aim time increases
local CrossHairBaseLines = {}
CrossHairBaseLines[1] = { x = 0, y = 1}
--CrossHairBaseLines[2] = { x = 0, y = -1}
CrossHairBaseLines[3] = { x = 1, y = 0}
CrossHairBaseLines[4] = { x = -1, y = 0}

Events.OnCreateUI.Add(function()
	local Crosshair = ISUIElement:new(0,0,0,0)

	Crosshair.render = function(self)
		if not CrossHairEnable then return end

		local Character = getPlayer()
		local CharIndex = Character:getPlayerNum()
		local Weapon = Character:getPrimaryHandItem()

		if not IsGun(Weapon) then return end

		local Alpha, AlphaCrit = GetHitAndCritAimTimes(CharIndex, Character:getPrimaryHandItem())

		if Alpha == 0 then return end

		--local Zoom = 1.0 / getCore():getZoom(0)
		local Zoom = CrossHairScale
		if CrossHairScaleWithZoom then
			Zoom = Zoom / getCore():getZoom(0)
		end

		-- render crosshair
		local CrossHairX = getMouseX()
		local CrossHairY = getMouseY() + CrossHairVertOffset * Zoom

		local function GetScaledPoint(Point, Scale)
			Scale = Scale * Zoom
			return { x = Point.x * Scale + CrossHairX, y = Point.y * Scale + CrossHairY }
		end

		for k,BasePoint in pairs(CrossHairBaseLines) do
			local UsedAlpha = Alpha
			if k == 1 then UsedAlpha = AlphaCrit end

			local DrawAlpha = Lerp(CrossHairMinAlpha, CrossHairMaxAlpha, UsedAlpha)
			local CrossHairSpread = Lerp(CrossHairMaxSpread, CrossHairMinSpread, UsedAlpha) * Zoom
			local CHThicknessScaled = math.max(1, CrossHairThickness * Zoom)

			local P1 = GetScaledPoint(BasePoint, CrossHairSpread)
			local P2 = GetScaledPoint(BasePoint, CrossHairSpread + CrossHairWidth)

			local Q1 = {x = math.min(P1.x, P2.x) - CHThicknessScaled, y = math.min(P1.y, P2.y) - CHThicknessScaled}
			local Q2 = {x = math.max(P1.x, P2.x) + CHThicknessScaled, y = math.max(P1.y, P2.y) + CHThicknessScaled}

			self:drawRect(Q1.x, Q1.y, Q2.x - Q1.x, Q2.y - Q1.y, DrawAlpha, CrossHairR, CrossHairG, CrossHairB)
		end
	end

	Crosshair:initialise()
	Crosshair:setVisible(true)
	Crosshair:clearMaxDrawHeight()
	Crosshair:addToUIManager()
end)

-- Mod Options
if Mod.IsMCMInstalled_v1 then
	local DOTL_ModOptions = ModOptionTable:New("DayOfTheLead", "DAY OF THE LEAD", false)

	DOTL_ModOptions:AddModOption("CrossHairEnable", "checkbox", CrossHairEnable, nil, "Enable Crosshair", nil, function(value)
		CrossHairEnable = value
	end)

	DOTL_ModOptions:AddModOption("CrossHairColor", "color", {r = CrossHairR, g = CrossHairG, b = CrossHairB}, nil, "Crosshair Color", nil, function(color)
		CrossHairR, CrossHairG, CrossHairB = color.r, color.g, color.b
	end)

	DOTL_ModOptions:AddModOption("CrossHairThickness", "number_slider", CrossHairThickness, { min = 1, max = 6, step = 1 }, "Crosshair Thickness", nil, function(value)
		CrossHairThickness = value
	end)

	DOTL_ModOptions:AddModOption("CrossHairScale", "number_slider", CrossHairScale, { min = 0.1, max = 1.5, step = 0.25}, "Crosshair Scale", nil, function(value)
		CrossHairScale = value
	end)

	DOTL_ModOptions:AddModOption("CrossHairScaleWithZoom", "checkbox", CrossHairScaleWithZoom, nil, "Crosshair Scale with Zoom", "Size of Crosshair changes as you change zoom level", function(value)
		CrossHairScaleWithZoom = value
	end)
end

