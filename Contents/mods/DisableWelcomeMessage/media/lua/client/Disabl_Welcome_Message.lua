--In main menu
if MainScreen and MainScreen.instantiate then
	local old_main_instantiate = MainScreen.instantiate
	function MainScreen:instantiate(...)
		old_main_instantiate(self, ...)
		if self.animPopup then
			self.animPopup:setVisible(false)
		end
	end
end

--Remove welcome message for Mods Screen
if ISModsNagPanel and ISModsNagPanel.onOK and ISModsNagPanel.render then
	local old_render = ISModsNagPanel.render;
	ISModsNagPanel.render = function(self, ...)
		old_render(self, ...)
		self:onOK();
	end
end