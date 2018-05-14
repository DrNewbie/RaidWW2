if not MenuNodeHiddenGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeHiddenGui = slot0
function MenuNodeHiddenGui:_create_menu_item(row_item)
	slot5 = row_item

	MenuNodeHiddenGui.super._create_menu_item(slot3, self)

	slot4 = row_item.gui_panel

	row_item.gui_panel.hide(slot3)

	return 
end

return 
