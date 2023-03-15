Recipe.iveryXP = {}

-- Additional functions for giving experience.
function Recipe.iveryXP.MetalWelding1(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.MetalWelding, 1);
end

function Recipe.iveryXP.MetalWelding5(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.MetalWelding, 5);
end

function Recipe.iveryXP.Tailoring1(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Tailoring, 1);
end

function Recipe.iveryXP.Tailoring5(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Tailoring, 5);
end

function Recipe.iveryXP.Tailoring10(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Tailoring, 10);
end

function Recipe.iveryXP.Tailoring25(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Tailoring, 25);
end

function Recipe.iveryXP.Tailoring50(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Tailoring, 50);
end

function Recipe.iveryXP.Electricity5(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Electricity, 5);
end

function Recipe.iveryXP.Electricity10(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Electricity, 10);
end

function Recipe.iveryXP.Electricity25(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Electricity, 25);
end

function Recipe.iveryXP.WoodWork5(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Woodwork, 5);
end

function Recipe.iveryXP.WoodWork10(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Woodwork, 10);
end

function Recipe.iveryXP.WoodWork25(recipe, ingredients, result, player)
    	player:getXp():AddXP(Perks.Woodwork, 25);
end

--moveables

function Recipe.OnCreate.LightDiamondRugNS(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRug_2PerRug')
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRugNS_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRugNS_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRugNS_4PerRug')
	player:getInventory():AddItem('ivery.ivery_LightDiamondRugNS_4PerRug')
end

function Recipe.OnCreate.LightDiamondRugEW(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRug_2PerRug')
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRugEW_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRugEW_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_LightDiamondRugEW_4PerRug')
	player:getInventory():AddItem('ivery.ivery_LightDiamondRugEW_4PerRug')
end

function Recipe.OnCreate.RedRugNS(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_RedRug_2PerRug')
    	player:getInventory():AddItem('ivery.ivery_RedRugNS_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_RedRugNS_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_RedRugNS_4PerRug')
	player:getInventory():AddItem('ivery.ivery_RedRugNS_4PerRug')
end

function Recipe.OnCreate.RedRugEW(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_RedRug_2PerRug')
    	player:getInventory():AddItem('ivery.ivery_RedRugEW_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_RedRugEW_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_RedRugEW_4PerRug')
	player:getInventory():AddItem('ivery.ivery_RedRugEW_4PerRug')
end

function Recipe.OnCreate.BlueRugNS(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_BlueRug_2PerRug')
    	player:getInventory():AddItem('ivery.ivery_BlueRugNS_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_BlueRugNS_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_BlueRugNS_4PerRug')
	player:getInventory():AddItem('ivery.ivery_BlueRugNS_4PerRug')
end

function Recipe.OnCreate.BlueRugEW(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_BlueRug_2PerRug')
    	player:getInventory():AddItem('ivery.ivery_BlueRugEW_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_BlueRugEW_4PerRug')
    	player:getInventory():AddItem('ivery.ivery_BlueRugEW_4PerRug')
	player:getInventory():AddItem('ivery.ivery_BlueRugEW_4PerRug')
end

function Recipe.OnCreate.ClutterClothing(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_FoldedShirt')
    	player:getInventory():AddItem('ivery.ivery_PlacedSneakers')
    	player:getInventory():AddItem('ivery.ivery_PlacedRainboots')
    	player:getInventory():AddItem('ivery.ivery_RowOfBoots')
	player:getInventory():AddItem('ivery.ivery_RowOfShoes')
end

function Recipe.OnCreate.ClutterOffice(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_PrinterPaper')
    	player:getInventory():AddItem('ivery.ivery_PapersAndPencils')
    	player:getInventory():AddItem('ivery.ivery_ScatteredNotes')
    	player:getInventory():AddItem('ivery.ivery_PlacedBills')
	player:getInventory():AddItem('ivery.ivery_StackedReports')
	player:getInventory():AddItem('ivery.ivery_BoxOfNotes')
    	player:getInventory():AddItem('ivery.ivery_BoundReports')
    	player:getInventory():AddItem('ivery.ivery_NotepadKit')
    	player:getInventory():AddItem('ivery.ivery_BoundNotes')
    	player:getInventory():AddItem('ivery.ivery_WritingDrafts')
	player:getInventory():AddItem('ivery.ivery_ManilaFolders')
	player:getInventory():AddItem('ivery.ivery_TeacherSupplies')
    	player:getInventory():AddItem('ivery.ivery_GradedEssays')
    	player:getInventory():AddItem('ivery.ivery_PencilDrawing')
    	player:getInventory():AddItem('ivery.ivery_CrayonDrawing')
	player:getInventory():AddItem('ivery.ivery_PlacedRulers')
end

function Recipe.OnCreate.ClutterKitchen(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_CookingKit')
    	player:getInventory():AddItem('ivery.ivery_OldCookware')
    	player:getInventory():AddItem('ivery.ivery_BarSupplies')
    	player:getInventory():AddItem('ivery.ivery_FoodStorage')
	player:getInventory():AddItem('ivery.ivery_JarStorage')
	player:getInventory():AddItem('ivery.ivery_RowOfJars')
end

function Recipe.OnCreate.ClutterGarage(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_PainterKit')
    	player:getInventory():AddItem('ivery.ivery_StorageBoxes')
    	player:getInventory():AddItem('ivery.ivery_ConstructionKit')
    	player:getInventory():AddItem('ivery.ivery_DisplayedGoods')
	player:getInventory():AddItem('ivery.ivery_MiscSupplies')
	player:getInventory():AddItem('ivery.ivery_BrandSupplies')
    	player:getInventory():AddItem('ivery.ivery_MechanicKit')
end

function Recipe.OnCreate.ClutterLibrary(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_RowOfFables')
    	player:getInventory():AddItem('ivery.ivery_OfficeBooks')
    	player:getInventory():AddItem('ivery.ivery_LeaningBooks')
    	player:getInventory():AddItem('ivery.ivery_RowOfTextbooks')
	player:getInventory():AddItem('ivery.ivery_OldTextbooks')
	player:getInventory():AddItem('ivery.ivery_FallenBooks')
    	player:getInventory():AddItem('ivery.ivery_ProfessorKit')
    	player:getInventory():AddItem('ivery.ivery_OldGlobe')
    	player:getInventory():AddItem('ivery.ivery_NewBooks')
    	player:getInventory():AddItem('ivery.ivery_CollegeNotes')
	player:getInventory():AddItem('ivery.ivery_ArtBooks')
	player:getInventory():AddItem('ivery.ivery_ColorfulBooks')
    	player:getInventory():AddItem('ivery.ivery_HistoryBooks')
end

function Recipe.OnCreate.ClutterBedroom(items, result, player)
    	player:getInventory():AddItem('ivery.ivery_MiscSupplies')
    	player:getInventory():AddItem('ivery.ivery_JewelryBox')
    	player:getInventory():AddItem('ivery.ivery_BoxAndBooks')
    	player:getInventory():AddItem('ivery.ivery_FramedPhoto')
end