-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuItem"

core.import(slot1, core)

slot3 = "CoreMenuItemOption"

core.import(slot1, core)

if not MenuItemMultiChoice then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

MenuItemMultiChoice = slot0
MenuItemMultiChoice.TYPE = "multi_choice"
function MenuItemMultiChoice:init(data_node, parameters)
	slot7 = parameters

	CoreMenuItem.Item.init(slot4, self, data_node)

	self._type = MenuItemMultiChoice.TYPE
	self._options = {}
	self._current_index = 1
	self._all_options = {}

	if data_node then
		slot5 = data_node

		for _, c in ipairs(slot4) do
			local type = c._meta

			if type == "option" then
				slot12 = c
				local option = CoreMenuItemOption.ItemOption.new(slot10, CoreMenuItemOption.ItemOption)
				slot13 = option

				self.add_option(CoreMenuItemOption.ItemOption, self)

				local visible_callback = c.visible_callback

				if visible_callback then
					slot14 = " "
					option.visible_callback_names = string.split(slot12, visible_callback)
				end
			end
		end
	end

	self._enabled = true
	slot6 = nil

	self._show_options(slot4, self)

	return 
end
function MenuItemMultiChoice:set_enabled(enabled)
	self._enabled = enabled
	slot4 = self

	self.dirty(slot3)

	return 
end
function MenuItemMultiChoice:set_callback_handler(callback_handler)
	slot5 = callback_handler

	MenuItemMultiChoice.super.set_callback_handler(slot3, self)

	return 
end
function MenuItemMultiChoice:visible(...)
	slot4 = self._callback_handler

	self._show_options(slot2, self)

	slot3 = self

	return MenuItemMultiChoice.super.visible(slot2, ...)
end
function MenuItemMultiChoice:_show_options(callback_handler)
	slot4 = self

	if self.selected_option(slot3) then
		slot4 = self
		slot4 = self.selected_option(slot3)
		local selected_value = self.selected_option(slot3).value(slot3)
	end

	self._options = {}
	slot5 = self._all_options

	for _, option in ipairs(slot4) do
		local show = true

		if callback_handler and option.visible_callback_names then
			slot11 = option.visible_callback_names

			for _, id in ipairs(slot10) do
				slot17 = option

				if not callback_handler[id](slot15, callback_handler) then
					show = false

					break
				end
			end
		end

		if show then
			slot12 = option

			table.insert(slot10, self._options)
		end
	end

	if selected_value then
		slot6 = 1

		self.set_current_index(slot4, self)

		slot6 = selected_value

		self.set_value(slot4, self)
	end

	return 
end
function MenuItemMultiChoice:add_option(option)
	slot5 = option

	table.insert(slot3, self._all_options)

	return 
end
function MenuItemMultiChoice:clear_options()
	self._all_options = {}

	return 
end
function MenuItemMultiChoice:options()
	return self._options
end
function MenuItemMultiChoice:selected_option()
	return self._options[self._current_index]
end
function MenuItemMultiChoice:current_index()
	return self._current_index
end
function MenuItemMultiChoice:set_current_index(index)
	self._current_index = index
	slot4 = self

	self.dirty(slot3)

	return 
end
function MenuItemMultiChoice:set_value(value)
	slot4 = self._options

	for i, option in ipairs(slot3) do
		slot9 = option

		if option.parameters(slot8).value == value then
			self._current_index = i

			break
		end
	end

	slot4 = self

	self.dirty(slot3)

	return 
end
function MenuItemMultiChoice:value()
	local value = ""
	slot4 = self
	local selected_option = self.selected_option(slot3)

	if selected_option then
		slot5 = selected_option
		value = selected_option.parameters(slot4).value
	end

	return value
end
function MenuItemMultiChoice:_highest_option_index()
	local index = 1
	slot4 = self._options

	for i, option in ipairs(slot3) do
		slot9 = option

		if not option.parameters(slot8).exclude then
			index = i
		end
	end

	return index
end
function MenuItemMultiChoice:_lowest_option_index()
	slot3 = self._options

	for i, option in ipairs(slot2) do
		slot8 = option

		if not option.parameters(slot7).exclude then
			return i
		end
	end

	return 
end
function MenuItemMultiChoice:next()
	if not self._enabled then
		return 
	end

	if #self._options < 2 then
		return 
	end

	slot4 = self

	if self._current_index == self._highest_option_index(slot3) then
		return 
	end

	repeat
		self._current_index = (self._current_index == #self._options and 1) or self._current_index + 1
		slot3 = self._options[self._current_index]
	until not self._options[self._current_index].parameters(self._current_index).exclude

	return true
end
function MenuItemMultiChoice:previous()
	if not self._enabled then
		return 
	end

	if #self._options < 2 then
		return 
	end

	slot4 = self

	if self._current_index == self._lowest_option_index(slot3) then
		return 
	end

	repeat
		self._current_index = (self._current_index == 1 and #self._options) or self._current_index - 1
		slot3 = self._options[self._current_index]
	until not self._options[self._current_index].parameters(self._current_index).exclude

	return true
end
function MenuItemMultiChoice:left_arrow_visible()
	slot4 = self

	return self._lowest_option_index(slot3) < self._current_index and self._enabled
end
function MenuItemMultiChoice:right_arrow_visible()
	slot4 = self

	return self._current_index < self._highest_option_index(slot3) and self._enabled
end
function MenuItemMultiChoice:arrow_visible()
	return 1 < #self._options
end
function MenuItemMultiChoice:setup_gui(node, row_item)
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
function MenuItemMultiChoice:reload(row_item, node)
	if not row_item then
		return 
	end

	if node.localize_strings then
		slot5 = self
		slot5 = self.selected_option(slot4)
	else
		slot5 = self
		slot5 = self.selected_option(slot4)
		row_item.option_text = self.selected_option(slot4).parameters(slot4).text_id
	end

	slot5 = row_item.choice_text
	slot8 = row_item.option_text

	row_item.choice_text.set_text(slot4, utf8.to_upper(slot7))

	local arrow_alpha = (row_item.highlighted and 1) or 0.5
	slot6 = row_item.arrow_left
	slot9 = self

	row_item.arrow_left.set_visible(slot5, self.arrow_visible(slot8))

	slot6 = row_item.arrow_right
	slot9 = self

	row_item.arrow_right.set_visible(slot5, self.arrow_visible(slot8))

	slot6 = row_item.arrow_left
	slot4 = row_item.arrow_left.set_color

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot7 = (self.left_arrow_visible(slot8) and tweak_data.screen_colors.button_stage_2) or tweak_data.screen_colors.button_stage_3

		slot4(slot5, slot6)

		slot6 = row_item.arrow_right
		slot4 = row_item.arrow_right.set_color
	end

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot7 = (self.right_arrow_visible(slot8) and tweak_data.screen_colors.button_stage_2) or tweak_data.screen_colors.button_stage_3

		slot4(slot5, slot6)

		slot7 = arrow_alpha

		row_item.arrow_left.set_alpha(slot5, row_item.arrow_left)

		slot7 = arrow_alpha

		row_item.arrow_right.set_alpha(slot5, row_item.arrow_right)

		slot7 = row_item.color

		row_item.gui_text.set_color(slot5, row_item.gui_text)

		slot6 = row_item.choice_text
		slot4 = row_item.choice_text.set_color
	end

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot9 = self.selected_option(slot8)
		slot7 = self.selected_option(slot8).parameters(slot8).color or node.row_item_hightlight_color

		slot4(slot5, slot6)

		slot7 = (self._enabled and 1) or 0.75

		row_item.choice_text.set_alpha(slot5, row_item.choice_text)

		slot6 = self
	end

	if self.info_panel(slot5) == "lobby_campaign" then
		slot7 = row_item

		node._reload_lobby_campaign(slot5, node)
	else
		slot6 = self

		if self.info_panel(slot5) == "lobby_difficulty" then
			slot7 = row_item

			node._reload_lobby_difficulty(slot5, node)
		end
	end

	slot6 = self
	slot6 = self.selected_option(slot5)
	local color = self.selected_option(slot5).parameters(slot5).color1

	if color then
		local count = 1

		while color do
			slot11 = self
			slot11 = self.selected_option(slot10)
			slot12 = self
			slot12 = self.selected_option(count)
			slot11 = color

			row_item.choice_text.set_range_color(slot7, row_item.choice_text, self.selected_option(slot10).parameters(slot10)["color_start" .. count], self.selected_option(count).parameters(count)["color_stop" .. count])

			count = count + 1
			slot8 = self
			slot8 = self.selected_option(slot7)
			color = self.selected_option(slot7).parameters(slot7)["color" .. count]
		end
	end

	return true
end
function MenuItemMultiChoice:highlight_row_item(node, row_item, mouse_over)
	slot7 = row_item.color

	row_item.gui_text.set_color(slot5, row_item.gui_text)

	slot6 = row_item.choice_text
	slot4 = row_item.choice_text.set_color

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot9 = self.selected_option(slot8)
		slot7 = self.selected_option(slot8).parameters(slot8).color or node.row_item_hightlight_color

		slot4(slot5, slot6)

		slot7 = (self._enabled and 1) or 0.75

		row_item.choice_text.set_alpha(slot5, row_item.choice_text)

		slot11 = 24

		row_item.arrow_left.set_image(slot5, row_item.arrow_left, "guis/textures/menu_arrows", 24, 0, 24)

		slot11 = 24

		row_item.arrow_right.set_image(slot5, row_item.arrow_right, "guis/textures/menu_arrows", 48, 0, -24)

		slot6 = row_item.arrow_left
		slot4 = row_item.arrow_left.set_color
	end

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot7 = (self.left_arrow_visible(slot8) and tweak_data.screen_colors.button_stage_2) or tweak_data.screen_colors.button_stage_3

		slot4(slot5, slot6)

		slot6 = row_item.arrow_right
		slot4 = row_item.arrow_right.set_color
	end

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot7 = (self.right_arrow_visible(slot8) and tweak_data.screen_colors.button_stage_2) or tweak_data.screen_colors.button_stage_3

		slot4(slot5, slot6)

		slot7 = (self._enabled and 1) or 0.75

		row_item.arrow_left.set_alpha(slot5, row_item.arrow_left)

		slot7 = (self._enabled and 1) or 0.75

		row_item.arrow_right.set_alpha(slot5, row_item.arrow_right)

		slot6 = self
	end

	if self.info_panel(slot5) == "lobby_campaign" then
		slot7 = row_item

		node._highlight_lobby_campaign(slot5, node)
	else
		slot6 = self

		if self.info_panel(slot5) == "lobby_difficulty" then
			slot7 = row_item

			node._highlight_lobby_difficulty(slot5, node)
		elseif row_item.gui_info_panel then
			slot7 = true

			row_item.gui_info_panel.set_visible(slot5, row_item.gui_info_panel)
		end
	end

	return true
end
function MenuItemMultiChoice:fade_row_item(node, row_item, mouse_over)
	slot7 = row_item.color

	row_item.gui_text.set_color(slot5, row_item.gui_text)

	slot6 = row_item.choice_text
	slot4 = row_item.choice_text.set_color

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot9 = self.selected_option(slot8)
		slot7 = self.selected_option(slot8).parameters(slot8).color or node.row_item_hightlight_color

		slot4(slot5, slot6)

		slot7 = (self._enabled and 1) or 0.75

		row_item.choice_text.set_alpha(slot5, row_item.choice_text)

		slot11 = 24

		row_item.arrow_left.set_image(slot5, row_item.arrow_left, "guis/textures/menu_arrows", 0, 0, 24)

		slot11 = 24

		row_item.arrow_right.set_image(slot5, row_item.arrow_right, "guis/textures/menu_arrows", 24, 0, -24)

		slot6 = row_item.arrow_left
		slot4 = row_item.arrow_left.set_color
	end

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot7 = (self.left_arrow_visible(slot8) and tweak_data.screen_colors.button_stage_2) or tweak_data.screen_colors.button_stage_3

		slot4(slot5, slot6)

		slot6 = row_item.arrow_right
		slot4 = row_item.arrow_right.set_color
	end

	if self._enabled or not row_item.disabled_color then
		slot9 = self
		slot7 = (self.right_arrow_visible(slot8) and tweak_data.screen_colors.button_stage_2) or tweak_data.screen_colors.button_stage_3

		slot4(slot5, slot6)

		slot7 = (self._enabled and 0.5) or 0.25

		row_item.arrow_left.set_alpha(slot5, row_item.arrow_left)

		slot7 = (self._enabled and 0.5) or 0.25

		row_item.arrow_right.set_alpha(slot5, row_item.arrow_right)

		slot6 = self
	end

	if self.info_panel(slot5) == "lobby_campaign" then
		slot7 = row_item

		node._fade_lobby_campaign(slot5, node)
	else
		slot6 = self

		if self.info_panel(slot5) == "lobby_difficulty" then
			slot7 = row_item

			node._fade_lobby_difficulty(slot5, node)
		elseif row_item.gui_info_panel then
			slot7 = false

			row_item.gui_info_panel.set_visible(slot5, row_item.gui_info_panel)
		end
	end

	return true
end
local xl_pad = 64
function MenuItemMultiChoice:_layout(node, row_item)
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

	return true
end

if not MenuItemMultiChoiceWithIcon then
	slot3 = MenuItemMultiChoice
	slot1 = class(slot2)
end

MenuItemMultiChoiceWithIcon = slot1
function MenuItemMultiChoiceWithIcon:init(data_node, parameters, ...)
	slot7 = parameters

	MenuItemMultiChoiceWithIcon.super.init(slot4, self, data_node, ...)

	self._icon_texture = parameters and parameters.icon

	return 
end
function MenuItemMultiChoiceWithIcon:setup_gui(node, row_item, ...)
	slot7 = row_item

	MenuItemMultiChoiceWithIcon.super.setup_gui(slot4, self, node, ...)

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
	slot5 = self._icon
	slot8 = row_item.arrow_right

	self._icon.set_right(slot4, row_item.arrow_right.x(node.row_item_blend_mode))

	slot6 = false

	self._icon.set_visible(slot4, self._icon)

	slot5 = self._icon
	slot3 = self._icon.set_color

	if self._enabled or not row_item.disabled_color then
		slot8 = self
		slot8 = self.selected_option(slot7)
		slot6 = self.selected_option(slot7).parameters(slot7).color or node.row_item_hightlight_color

		slot3(slot4, slot5)

		slot6 = (self._enabled and 1) or 0.75

		self._icon.set_alpha(slot4, self._icon)

		return true
	end
end
function MenuItemMultiChoiceWithIcon:set_icon_visible(state)
	slot5 = state

	self._icon.set_visible(slot3, self._icon)

	return 
end

return 
