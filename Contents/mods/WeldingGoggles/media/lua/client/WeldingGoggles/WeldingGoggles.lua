--- Copyright 2022 gilbz
--- 
--- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
--- to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
--- and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--- 
--- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--- 
--- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
--- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
--- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

local ____exports = {}
local ____PipeWrench = require("WeldingGoggles/PipeWrench")
local getSearchMode = ____PipeWrench.getSearchMode
local getPlayer = ____PipeWrench.getPlayer
local _instanceof_ = ____PipeWrench._instanceof_
local ____PipeWrench_2DEvents = require("WeldingGoggles/PipeWrench-Events")
local onClothingUpdated = ____PipeWrench_2DEvents.onClothingUpdated
local onDisableSearchMode = ____PipeWrench_2DEvents.onDisableSearchMode
local onGameStart = ____PipeWrench_2DEvents.onGameStart
local ____PipeWrench_2DUtils = require("WeldingGoggles/PipeWrench-Utils")
local getGlobal = ____PipeWrench_2DUtils.getGlobal
local function tintVision(playerNum)
    local search_mode = getSearchMode()
    local player_search_mode = search_mode:getSearchModeForPlayer(playerNum)
    local blur = player_search_mode:getBlur()
    blur:setExterior(0.2)
    blur:setInterior(0.2)
    local desat = player_search_mode:getDesat()
    desat:setExterior(0.3)
    desat:setInterior(0.3)
    local gradient = player_search_mode:getGradientWidth()
    gradient:setExterior(6)
    gradient:setInterior(6)
    local dark = player_search_mode:getDarkness()
    dark:setExterior(0.5)
    dark:setInterior(0.5)
    search_mode:setOverride(playerNum, true)
    search_mode:setEnabled(playerNum, true)
end
local function unTintVision(playerNum)
    local search_mode = getSearchMode()
    if search_mode:isOverride(playerNum) then
        search_mode:setOverride(playerNum, false)
    end
    if search_mode:isEnabled(playerNum) then
        search_mode:setEnabled(playerNum, false)
    end
end
local function checkWeldingGoggles(playerOrCharacter)
    if _instanceof_(playerOrCharacter, "IsoPlayer") then
        local player = playerOrCharacter
        local playerInventory = player:getInventory()
        local SandboxVars = getGlobal("SandboxVars")
        local tintGoggles = SandboxVars.WeldingGoggles.GogglesTint
        local tintMask = SandboxVars.WeldingGoggles.MaskTint
        if tintGoggles == true and playerInventory:contains("WeldingGoggles.WeldingGoggles") then
            local goggles = playerInventory:FindAll("WeldingGoggles.WeldingGoggles")
            do
                local i = 0
                while i < goggles:size() do
                    if goggles:get(i):isEquipped() then
                        tintVision(player:getPlayerNum())
                        return
                    end
                    i = i + 1
                end
            end
        end
        if tintMask == true and playerInventory:contains("Base.WeldingMask") then
            local mask = playerInventory:FindAll("Base.WeldingMask")
            do
                local i = 0
                while i < mask:size() do
                    if mask:get(i):isEquipped() then
                        tintVision(player:getPlayerNum())
                        return
                    end
                    i = i + 1
                end
            end
        end
        unTintVision(player:getPlayerNum())
    end
end
local function disableSearchModeOverride(player, isSearchMode)
    checkWeldingGoggles(player)
end
onGameStart:addListener(function()
    local SandboxVars = getGlobal("SandboxVars")
    local tintGoggles = SandboxVars.WeldingGoggles.GogglesTint
    local tintMask = SandboxVars.WeldingGoggles.MaskTint
    if tintGoggles or tintMask then
        checkWeldingGoggles(getPlayer())
        onDisableSearchMode:addListener(disableSearchModeOverride)
        onClothingUpdated:addListener(checkWeldingGoggles)
    end
end)

-- PIPEWRENCH --
if _G.Events.OnPipeWrenchBoot == nil then
  _G.triggerEvent('OnPipeWrenchBoot', false)
end
_G.Events.OnPipeWrenchBoot.Add(function(____flag____)
  if ____flag____ ~= true then return end
  getSearchMode = ____PipeWrench.getSearchMode
getPlayer = ____PipeWrench.getPlayer
_instanceof_ = ____PipeWrench._instanceof_
end)
----------------

return ____exports
