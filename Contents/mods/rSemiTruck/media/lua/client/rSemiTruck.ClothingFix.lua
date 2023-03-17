require "ISUI/ISInventoryPaneContextMenu"

require "rLib.Client"

local function ClothingFix(player, context, items)
	local ctxForward = rLib.ContextMenu.GetSubOption(context, getText("ContextMenu_Wear"), getText("ContextMenu_ForwardCap"))
	local ctxReverse = rLib.ContextMenu.GetSubOption(context, getText("ContextMenu_Wear"), getText("ContextMenu_ReverseCap"))

	function ffs(ctx, item)
		if ctx and ctx.onSelect == ISInventoryPaneContextMenu.onClothingItemExtra and ctx.param1 and ctx.param1 == item then
			ctx.param1 = "RotatorsClothing." .. ctx.param1
		end
	end

	ffs(ctxForward, "Hat_BaseballCapRotators")
	ffs(ctxReverse, "Hat_BaseballCapRotators_Reverse")
end

Events.OnFillInventoryObjectContextMenu.Add(ClothingFix)
