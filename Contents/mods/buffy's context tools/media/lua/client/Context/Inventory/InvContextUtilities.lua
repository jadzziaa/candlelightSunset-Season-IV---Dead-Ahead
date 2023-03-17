
ISInventoryMenuElements = ISInventoryMenuElements or {};

function ISInventoryMenuElements.ContextUtilities(context)
    local self 					= ISMenuElement.new();
    self.invMenu			    = ISContextManager.getInstance().getInventoryMenu();

    function self.init()
    end

    function self.createMenu( _item )
        if _item:IsClothing() and _item:isEquipped() then
            return
        end
        if _item:isFavorite() then
            return
        end
        if _item:getContainer() ~= self.invMenu.inventory then
            return;
        end
        if SandboxVars.ContextUtility.TrashEnable then
            if self.invMenu.player:getPrimaryHandItem() ~= _item and self.invMenu.player:getSecondaryHandItem() ~= _item then
                local parent = self.invMenu.context:addOption("Trash Item", self.invMenu, nil );
                local subMenu = ISContextMenu:getNew(self.invMenu.context);
                self.invMenu.context:addSubMenu(parent, subMenu);
                subMenu:addOption("Confirm", self.invMenu, self.trashItem, _item);
            end
        end
    end

    function self.trashItem( _p, _item )
        local itemname = _item:getName() or "item"
        sendClientCommand(getPlayer(), 'ISLogSystem', 'writeLog', {loggerName = "TrashLog", logText = "[Buffy Logs] ("..getOnlineUsername()..") trashed "..itemname}) --logs to a file called TrashLog in the servers log folder
        getPlayer():addLineChatElement("Trashed ".. itemname, 1, 0, 0);
        getSpecificPlayer(0):getInventory():Remove(_item)
    end
    return self;
end

