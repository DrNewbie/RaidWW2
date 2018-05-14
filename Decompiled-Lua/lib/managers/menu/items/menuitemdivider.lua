slot3 = "CoreMenuItem"

core.import(slot1, core)

if not MenuItemDivider then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

MenuItemDivider = slot0
MenuItemDivider.TYPE = "divider"
function MenuItemDivider:init(data_node, parameters)
	slot7 = parameters

	MenuItemDivider.super.init(slot4, self, data_node)

	self._type = MenuItemDivider.TYPE

	return 
end
function MenuItemDivider:setup_gui(node, row_item)
	local scaled_size = managers.gui_data.scaled_size(slot4)
	slot7 = {
		w = node.item_panel.w(slot9)
	}
	slot10 = node.item_panel
	row_item.gui_panel = node.item_panel.panel(managers.gui_data, node.item_panel)
	slot6 = row_item.item
	local h = row_item.item.parameters(managers.gui_data).size or 10

	if row_item.text then
		row_item.text = node._text_item_part(slot6, node, row_item, row_item.gui_panel)
		slot7 = row_item.text
		local _, _, tw, th = row_item.text.text_rect(slot6)
		slot13 = th

		row_item.text.set_size(0, row_item.text, tw)

		h = th
	end

	slot7 = row_item.gui_panel

	row_item.gui_panel.set_left(slot6, node._mid_align(slot9))

	slot11 = row_item.gui_panel
	slot8 = scaled_size.width - row_item.gui_panel.left(node)

	row_item.gui_panel.set_w(slot6, row_item.gui_panel)

	slot8 = h

	row_item.gui_panel.set_h(slot6, row_item.gui_panel)

	return true
end
function MenuItemDivider:reload(row_item, node)
	slot7 = node

	MenuItemDivider.super.reload(slot4, self, row_item)

	slot7 = row_item

	self._set_row_item_state(slot4, self, node)

	return true
end
function MenuItemDivider:highlight_row_item(node, row_item, mouse_over)
	slot8 = row_item

	self._set_row_item_state(slot5, self, node)

	return true
end
function MenuItemDivider:fade_row_item(node, row_item, mouse_over)
	slot8 = row_item

	self._set_row_item_state(slot5, self, node)

	return true
end
function MenuItemDivider:_set_row_item_state(node, row_item)
	if row_item.highlighted then
	end

	return 
end
function MenuItemDivider:menu_unselected_visible()
	return false
end
function MenuItemDivider:on_delete_row_item(row_item, ...)
	slot5 = row_item

	MenuItemDivider.super.on_delete_row_item(slot3, self, ...)

	return 
end

return 
