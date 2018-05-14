slot3 = "CoreMenuItemToggle"

core.import(slot1, core)

if not MenuItemToggleWithIcon then
	slot2 = CoreMenuItemToggle.ItemToggle
	slot0 = class(slot1)
end

MenuItemToggleWithIcon = slot0
function MenuItemToggleWithIcon:init(data_node, parameters, ...)
	slot7 = parameters

	MenuItemToggleWithIcon.super.init(slot4, self, data_node, ...)

	self._icon_texture = parameters and parameters.icon

	return 
end
function MenuItemToggleWithIcon:setup_gui(node, row_item, ...)
	slot7 = row_item

	MenuItemToggleWithIcon.super.setup_gui(slot4, self, node, ...)

	slot6 = {
		name = "icon",
		h = 16,
		y = 6,
		w = 16,
		layer = 0,
		texture = self._icon_texture,
		blend_mode = node.row_item_blend_mode
	}
	self._icon = row_item.gui_panel.bitmap(slot4, row_item.gui_panel)
	slot6 = false

	self._icon.set_visible(slot4, self._icon)

	return true
end
function MenuItemToggleWithIcon:reload(row_item, node, ...)
	MenuItemToggleWithIcon.super.reload(slot4, self, row_item, ...)

	slot5 = self._icon
	slot8 = row_item.gui_panel

	self._icon.set_right(slot4, row_item.gui_panel.w(node))

	slot8 = self._icon
	slot6 = self._icon.x(node) - 8

	row_item.gui_text.set_right(slot4, row_item.gui_text)

	return true
end
function MenuItemToggleWithIcon:highlight_row_item(node, row_item, mouse_over, ...)
	slot9 = mouse_over

	MenuItemToggleWithIcon.super.highlight_row_item(slot5, self, node, row_item, ...)

	slot7 = row_item.color

	self._icon.set_color(slot5, self._icon)

	return true
end
function MenuItemToggleWithIcon:fade_row_item(node, row_item, ...)
	slot7 = row_item

	MenuItemToggleWithIcon.super.fade_row_item(slot4, self, node, ...)

	slot6 = row_item.color

	self._icon.set_color(slot4, self._icon)

	return true
end
function MenuItemToggleWithIcon:set_icon_visible(state)
	slot5 = state

	self._icon.set_visible(slot3, self._icon)

	return 
end

return 
