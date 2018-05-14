-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuItem"

core.import(slot1, core)

if not MenuItemCustomizeController then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

MenuItemCustomizeController = slot0
MenuItemCustomizeController.TYPE = "customize_controller"
function MenuItemCustomizeController:init(data_node, parameters)
	slot7 = parameters

	CoreMenuItem.Item.init(slot4, self, data_node)

	self._type = MenuItemCustomizeController.TYPE

	return 
end
function MenuItemCustomizeController:setup_gui(node, row_item)
	slot6 = {
		w = 450
	}
	row_item.gui_panel = node.item_panel.panel(slot4, node.item_panel)
	slot7 = row_item.gui_panel
	slot10 = node
	row_item.controller_name = node._text_item_part(slot4, node, row_item, node._left_align(slot9))
	slot6 = "right"

	row_item.controller_name.set_align(slot4, row_item.controller_name)

	slot10 = node
	row_item.controller_binding = node._text_item_part(slot4, node, row_item, row_item.gui_panel, node._left_align(slot9))
	slot6 = "left"

	row_item.controller_binding.set_align(slot4, row_item.controller_binding)

	slot5 = row_item.controller_binding
	slot10 = row_item.item
	slot8 = row_item.item.parameters("left").binding

	row_item.controller_binding.set_text(slot4, string.upper(row_item.gui_panel))

	slot6 = tweak_data.menu.default_changeable_text_color

	row_item.controller_binding.set_color(slot4, row_item.controller_binding)

	slot7 = row_item

	self._layout(slot4, self, node)

	return true
end
function MenuItemCustomizeController:reload(row_item, node)
	slot5 = self

	if self.parameters(slot4).axis then
		slot5 = row_item.controller_binding
		slot10 = self
		slot8 = self.parameters(slot9).binding

		row_item.controller_binding.set_text(slot4, string.upper(slot7))
	else
		slot5 = row_item.controller_binding
		slot10 = self
		slot8 = self.parameters(slot9).binding

		row_item.controller_binding.set_text(slot4, string.upper(slot7))
	end

	return true
end
function MenuItemCustomizeController:highlight_row_item(node, row_item, mouse_over)

	-- Decompilation error in this vicinity:
	slot7 = row_item.color

	row_item.controller_binding.set_color(slot5, row_item.controller_binding)

	slot6 = row_item.controller_binding
	slot4 = row_item.controller_binding.set_font
end
function MenuItemCustomizeController:fade_row_item(node, row_item)

	-- Decompilation error in this vicinity:
	slot6 = row_item.color

	row_item.controller_name.set_color(slot4, row_item.controller_name)

	slot5 = row_item.controller_name
	slot3 = row_item.controller_name.set_font
end
function MenuItemCustomizeController:_layout(node, row_item)
	local safe_rect = managers.gui_data.scaled_size(slot4)
	slot7 = tweak_data.menu.customize_controller_size

	row_item.controller_name.set_font_size(managers.gui_data, row_item.controller_name)

	slot6 = row_item.controller_name
	local x, y, w, h = row_item.controller_name.text_rect(managers.gui_data)
	slot11 = h

	row_item.controller_name.set_height(slot9, row_item.controller_name)

	slot14 = node
	slot11 = row_item.gui_panel.w(slot12) - node.align_line_padding(row_item.gui_panel)

	row_item.controller_name.set_right(slot9, row_item.controller_name)

	slot11 = h

	row_item.gui_panel.set_height(slot9, row_item.gui_panel)

	slot11 = tweak_data.menu.customize_controller_size

	row_item.controller_binding.set_font_size(slot9, row_item.controller_binding)

	slot11 = h

	row_item.controller_binding.set_height(slot9, row_item.controller_binding)

	slot11 = 0

	row_item.controller_binding.set_left(slot9, row_item.controller_binding)

	return 
end

return 
