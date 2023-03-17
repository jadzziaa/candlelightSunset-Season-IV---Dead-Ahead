-- LuaManager.getFunctionObject(recipe.LuaCreate)
-- local recipes = ScriptManager.instance:getAllRecipes()
-- for recipeIndex = 0, recipes:size() - 1 do
--     local recipe = recipes:get(recipeIndex)
-- end
EggonsMU = EggonsMU or {}
EggonsMU.Recipes = {}
local Handlers = {}

LuaEventManager.AddEvent("OnRecipeOnTest")
LuaEventManager.AddEvent("OnBeforeRecipeOnCreate")
LuaEventManager.AddEvent("OnAfterRecipeOnCreate")

function Handlers.OnCreate(vanillaHandler, recipe)
    local recipeName = recipe:getName()
    return function(items, result, player)
        local cancel = false
        local function cancelVanilla()
            cancel = true
        end
        triggerEvent("OnBeforeRecipeOnCreate", items, result, player, recipeName, recipe, cancelVanilla)

        triggerEvent("OnBeforeRecipeOnCreate", items, result, player, recipeName, recipe)
    end
end

function Handlers.OnTest(vanillaHandler, recipe)
    local recipeName = recipe:getName()
    return function(sourceItem, result)
        local onTestOutcome = nil
        local function changeResult(returnedResult)
            onTestOutcome = returnedResult
        end
        if outcome == nil then
            onTestOutcome = vanillaHandler(sourceItem, result)
        end
        triggerEvent("OnRecipeTest", sourceItem, result, onTestOutcome, recipeName, recipe, changeResult)
        return onTestOutcome
    end
end

local function registerRecipeHandlers()
    local recipes = ScriptManager.instance:getAllRecipes()
    for i = 0, recipes:size() - 1 do
        local recipe = recipes:get(i)
        local oldHandler = LuaManager.getFunctionObject(recipe.OnTest)
        recipe.OnTest = Handlers.OnTest(oldHandler, recipe)
    end
end
