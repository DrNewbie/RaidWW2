if not MenuItemMultiChoiceRaid then
	slot2 = MenuItemMultiChoice
	slot0 = class(slot1)
end

MenuItemMultiChoiceRaid = slot0
MenuItemMultiChoiceRaid.TYPE = "multi_choice"
function MenuItemMultiChoiceRaid:init(data_node, parameters)
	slot7 = parameters

	MenuItemMultiChoiceRaid.super.init(slot4, self, data_node)

	self._type = MenuItemMultiChoiceRaid.TYPE

	return 
end
function MenuItemMultiChoiceRaid:setup_gui(node, row_item)
	local right_align = node._right_align(slot4)
	slot7 = {
		w = node.item_panel.w(slot9)
	}
	slot10 = node.item_panel
	row_item.gui_panel = node.item_panel.panel(node, node.item_panel)
	slot10 = row_item.align
	row_item.gui_text = node._text_item_part(node, node, row_item, row_item.gui_panel, right_align)
	slot7 = true

	row_item.gui_text.set_wrap(node, row_item.gui_text)

	slot7 = true

	row_item.gui_text.set_word_wrap(node, row_item.gui_text)

	local choice_text_align = (row_item.align == "left" and "right") or (row_item.align == "right" and "left") or row_item.align
	slot8 = {
		w = node.item_panel.w(slot10)
	}
	slot11 = node.item_panel
	row_item.choice_panel = row_item.gui_panel.panel(slot6, row_item.gui_panel)
	slot8 = {
		vertical = "center",
		align = "center",
		y = 0,
		x = 0,
		font_size = row_item.font_size,
		font = row_item.font,
		color = node.row_item_hightlight_color,
		layer = node.layers.items,
		blend_mode = node.row_item_blend_mode,
		text = utf8.to_upper(slot10),
		render_template = Idstring(slot10)
	}
	slot11 = ""
	slot11 = "VertexColorTextured"
	row_item.choice_text = row_item.choice_panel.text(slot6, row_item.choice_panel)
	local w = 20
	local h = 20
	local base = 20
	local height = 15
	slot12 = {
		texture = "guis/textures/menu_arrows",
		y = 0,
		x = 0,
		texture_rect = {
			0,
			0,
			24,
			24
		},
		color = Color(slot14, 0.5, 0.5),
		visible = self.arrow_visible(slot14),
		layer = node.layers.items,
		blend_mode = node.row_item_blend_mode
	}
	slot17 = 0.5
	slot15 = self
	row_item.arrow_left = row_item.gui_panel.bitmap(slot10, row_item.gui_panel)
	slot12 = {
		texture = "guis/textures/menu_arrows",
		y = 0,
		x = 0,
		texture_rect = {
			24,
			0,
			-24,
			24
		},
		color = Color(slot14, 0.5, 0.5),
		visible = self.arrow_visible(slot14),
		layer = node.layers.items,
		blend_mode = node.row_item_blend_mode
	}
	slot17 = 0.5
	slot15 = self
	row_item.arrow_right = row_item.gui_panel.bitmap(slot10, row_item.gui_panel)
	slot11 = self

	if self.info_panel(slot10) == "lobby_campaign" then
		slot12 = row_item

		node._create_lobby_campaign(slot10, node)
	else
		slot11 = self

		if self.info_panel(slot10) == "lobby_difficulty" then
			slot12 = row_item

			node._create_lobby_difficulty(slot10, node)
		elseif row_item.help_text then
		end
	end

	slot13 = row_item

	self._layout(slot10, self, node)

	return true
end
function MenuItemMultiChoiceRaid:_layout(node, row_item)
	local safe_rect = managers.gui_data.scaled_size(slot4)
	local right_align = node._right_align(managers.gui_data)
	local left_align = node._left_align(node)
	slot8 = self

	if self.parameters(node).filter then
	end

	slot12 = node
	slot9 = safe_rect.width - node._mid_align(slot11)

	row_item.gui_panel.set_width(slot7, row_item.gui_panel)

	slot11 = node

	row_item.gui_panel.set_x(slot7, node._mid_align(node._mid_align(slot11)))

	local arrow_size = 24 * tweak_data.scale.multichoice_arrow_multiplier
	slot11 = arrow_size

	row_item.arrow_right.set_size(row_item.gui_panel, row_item.arrow_right, arrow_size)

	slot11 = arrow_size

	row_item.arrow_left.set_size(row_item.gui_panel, row_item.arrow_left, arrow_size)

	if row_item.align == "right" then
		slot13 = self
		slot10 = right_align - row_item.gui_panel.x(slot11) + (self.parameters(row_item.gui_panel).expand_value or 0)

		row_item.arrow_left.set_left(slot8, row_item.arrow_left)

		slot12 = row_item.arrow_left
		slot10 = row_item.arrow_left.right(self.parameters(row_item.gui_panel).expand_value or 0) + 2 * (1 - tweak_data.scale.multichoice_arrow_multiplier)

		row_item.arrow_right.set_left(slot8, row_item.arrow_right)
	else
		slot9 = row_item.arrow_right
		slot12 = row_item.gui_panel

		row_item.arrow_right.set_right(slot8, row_item.gui_panel.w(slot11))

		slot12 = row_item.arrow_right
		slot10 = row_item.arrow_right.left(slot11) + 2 * (1 - tweak_data.scale.multichoice_arrow_multiplier)

		row_item.arrow_left.set_right(slot8, row_item.arrow_left)
	end

	slot9 = row_item.gui_text
	local x, y, w, h = row_item.gui_text.text_rect(slot8)
	slot14 = h

	row_item.gui_text.set_h(slot12, row_item.gui_text)

	slot14 = w + 5

	row_item.gui_text.set_width(slot12, row_item.gui_text)

	if h == 0 then
		h = row_item.font_size
		slot16 = row_item.gui_panel
		slot14 = row_item.gui_panel.width(slot15) - (arrow_size + node._align_line_padding) * 2

		row_item.choice_panel.set_w(slot12, row_item.choice_panel)
	else
		slot17 = self
		slot14 = row_item.gui_panel.width(slot15) * 0.4 + (self.parameters(row_item.gui_panel).text_offset or 0)

		row_item.choice_panel.set_w(slot12, row_item.choice_panel)
	end

	slot14 = h

	row_item.choice_panel.set_h(slot12, row_item.choice_panel)

	if row_item.align == "right" then
		slot16 = row_item.arrow_left
		slot14 = row_item.arrow_left.right(slot15) + node._align_line_padding

		row_item.choice_panel.set_left(slot12, row_item.choice_panel)

		slot13 = row_item.arrow_right
		slot16 = row_item.choice_panel

		row_item.arrow_right.set_left(slot12, row_item.choice_panel.right(node._align_line_padding))
	else
		slot16 = row_item.arrow_right
		slot14 = row_item.arrow_right.left(slot15) - node._align_line_padding

		row_item.choice_panel.set_right(slot12, row_item.choice_panel)

		slot13 = row_item.arrow_left
		slot16 = row_item.choice_panel

		row_item.arrow_left.set_right(slot12, row_item.choice_panel.left(node._align_line_padding))
	end

	slot13 = row_item.choice_text
	slot16 = row_item.choice_panel

	row_item.choice_text.set_w(slot12, row_item.choice_panel.w(slot15))

	slot14 = h

	row_item.choice_text.set_h(slot12, row_item.choice_text)

	slot14 = 0

	row_item.choice_text.set_left(slot12, row_item.choice_text)

	slot13 = row_item.arrow_right
	slot16 = row_item.choice_panel

	row_item.arrow_right.set_center_y(slot12, row_item.choice_panel.center_y(slot15))

	slot13 = row_item.arrow_left
	slot16 = row_item.choice_panel

	row_item.arrow_left.set_center_y(slot12, row_item.choice_panel.center_y(slot15))

	if row_item.align == "right" then
		slot13 = row_item.gui_text
		slot16 = row_item.gui_panel

		row_item.gui_text.set_right(slot12, row_item.gui_panel.w(slot15))
	else
		slot17 = row_item.gui_panel
		slot17 = self
		slot14 = node._right_align(slot15) - row_item.gui_panel.x(node) + (self.parameters(node).expand_value or 0)

		row_item.gui_text.set_left(slot12, row_item.gui_text)
	end

	slot14 = h

	row_item.gui_text.set_height(slot12, row_item.gui_text)

	slot14 = h

	row_item.gui_panel.set_height(slot12, row_item.gui_panel)

	if row_item.gui_info_panel then
		slot14 = row_item.gui_info_panel

		node._align_item_gui_info_panel(slot12, node)

		slot13 = self

		if self.info_panel(slot12) == "lobby_campaign" then
			slot14 = row_item

			node._align_lobby_campaign(slot12, node)
		else
			slot13 = self

			if self.info_panel(slot12) == "lobby_difficulty" then
				slot14 = row_item

				node._align_lobby_difficulty(slot12, node)
			else
				slot14 = row_item

				node._align_info_panel(slot12, node)
			end
		end
	end

	local node_padding = node._mid_align(slot12)
	slot14 = node

	if 0 < node._get_node_padding(node) then
		slot14 = node
		node_padding = node._get_node_padding(slot13)
	end

	slot15 = node_padding

	row_item.gui_panel.set_x(slot13, row_item.gui_panel)

	slot15 = 0

	row_item.gui_text.set_x(slot13, row_item.gui_text)

	slot14 = row_item.gui_text

	row_item.gui_text.hide(slot13)

	slot15 = 0

	row_item.arrow_left.set_x(slot13, row_item.arrow_left)

	slot14 = row_item.choice_panel
	slot17 = row_item.arrow_left

	row_item.choice_panel.set_x(slot13, row_item.arrow_left.right(slot16))

	slot17 = row_item.choice_panel
	slot15 = row_item.choice_panel.w(slot16) * 1.5

	row_item.choice_panel.set_w(slot13, row_item.choice_panel)

	slot14 = row_item.choice_text
	slot17 = row_item.choice_panel

	row_item.choice_text.set_w(slot13, row_item.choice_panel.w(slot16))

	slot14 = row_item.arrow_right
	slot17 = row_item.choice_panel

	row_item.arrow_right.set_x(slot13, row_item.choice_panel.right(slot16))

	slot18 = row_item.choice_panel
	slot18 = row_item.arrow_right
	slot15 = row_item.arrow_left.w(slot16) + row_item.choice_panel.w(row_item.arrow_left) + row_item.arrow_right.w(row_item.arrow_left)

	row_item.gui_panel.set_w(slot13, row_item.gui_panel)

	slot17 = row_item.gui_panel
	slot15 = row_item.gui_panel.h(row_item.arrow_right.w(row_item.arrow_left)) * 2

	row_item.gui_panel.set_h(slot13, row_item.gui_panel)

	return true
end

return 
