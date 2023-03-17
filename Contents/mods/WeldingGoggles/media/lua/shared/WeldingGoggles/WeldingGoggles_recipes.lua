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
local getScriptManager = ____PipeWrench.getScriptManager
local ____PipeWrench_2DEvents = require("WeldingGoggles/PipeWrench-Events")
local onGameStart = ____PipeWrench_2DEvents.onGameStart
local function editRecipes()
    local allrecipes = getScriptManager():getAllRecipes()
    do
        local i = 0
        while i < allrecipes:size() do
            local recipe = allrecipes:get(i)
            local recipe_sources = recipe:getSource()
            do
                local x = 0
                while x < recipe_sources:size() do
                    local source = recipe_sources:get(x)
                    local sourceItems = source:getItems()
                    if sourceItems:contains("Base.WeldingMask") and not sourceItems:contains("WeldingGoggles.WeldingGoggles") then
                        sourceItems:add("WeldingGoggles.WeldingGoggles")
                    end
                    x = x + 1
                end
            end
            i = i + 1
        end
    end
end
onGameStart:addListener(editRecipes)

-- PIPEWRENCH --
if _G.Events.OnPipeWrenchBoot == nil then
  _G.triggerEvent('OnPipeWrenchBoot', false)
end
_G.Events.OnPipeWrenchBoot.Add(function(____flag____)
  if ____flag____ ~= true then return end
  getScriptManager = ____PipeWrench.getScriptManager
end)
----------------

return ____exports
