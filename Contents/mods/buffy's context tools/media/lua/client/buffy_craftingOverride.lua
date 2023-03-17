function ISCraftingUI:setVisible(bVisible)
    self.javaObject:setVisible(bVisible);
    self.javaObject:setEnabled(bVisible)

    if not bVisible then -- save the selected index
        self.selectedIndex = {};
        for i,v in ipairs(self.categories) do
            self.selectedIndex[v.category] = v.recipes.selected;
        end
    end
--    if getPlayer() then
--        self.character:setBlockMovement(bVisible);
--    end
    if not LoadedRecipesInitially then
        self:refresh();
        LoadedRecipesInitially = true --suffer the delay the first time they open the UI this session to load everything. this delay will be absent until they press refresh after.
    end
    if bVisible and self.recipesList then
        --self:refresh();
        --commenting this prevents the stutter when the UI is opened, as we do not need to load anything else unless we learn new recipes. 
        --TIS, if you add an event for when a player learns a recipe that table.inserts the recipe into the list without needing to do a full check, that could be another solution. 
        --for now, though. refresh button.
    end
    -- load saved selected index
    if bVisible then
        for i,v in ipairs(self.categories) do
            if self.selectedIndex[v.category] then
                v.recipes.selected = self.selectedIndex[v.category];
            end
        end
    end

    self.craftInProgress = false;
    local recipeListBox = self:getRecipeListBox()
    recipeListBox:ensureVisible(recipeListBox.selected);
    if bVisible then
        self.knownRecipes = RecipeManager.getKnownRecipesNumber(self.character);
        self.totalRecipes = getAllRecipes():size();
    end
--    print("KNOWN RECIPES", self.knownRecipes, self.totalRecipes);
end
function ISCraftingCategoryUI:refreshTheHeckingCraftingUIPlease()
    self.craftingUI:refresh()
end
local craftingCategory = ISCraftingCategoryUI.create
function ISCraftingCategoryUI:create()
    craftingCategory(self)
    self.refreshButton = ISButton:new(self.filterAll.x + self.filterAll.width + 15, 3, 100, 30, getText("IGUI_DbViewer_Refresh").." "..getText("IGUI_LiteratureUI_Recipes"), self, self.refreshTheHeckingCraftingUIPlease)
    self.refreshButton:initialise()
    self.refreshButton:instantiate()
    self:addChild(self.refreshButton)
end
local craftingUpdate = ISCraftingCategoryUI.update
function ISCraftingCategoryUI:update()
    craftingUpdate(self)
    self.refreshButton:setX(self.width / 2 - self.filterAll.width)
end
