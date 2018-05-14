-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuItemToggle"

core.module(slot1, core)

slot3 = "CoreMenuItem"

core.import(slot1, core)

slot3 = "CoreMenuItemOption"

core.import(slot1, core)

if not ItemToggle then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

ItemToggle = slot0
ItemToggle.TYPE = "toggle"
function ItemToggle:init(data_node, parameters)
	slot7 = parameters

	CoreMenuItem.Item.init(slot4, self, data_node)

	self._type = "toggle"
	local params = self._parameters
	self.options = {}
	self.selected = 1

	if data_node then
		slot6 = data_node

		for _, c in ipairs(slot5) do
			local type = c._meta

			if type == "option" then
				slot13 = c
				local option = CoreMenuItemOption.ItemOption.new(slot11, CoreMenuItemOption.ItemOption)
				slot14 = option

				self.add_option(CoreMenuItemOption.ItemOption, self)
			end
		end
	end

	return 
end
function ItemToggle:add_option(option)
	slot5 = option

	table.insert(slot3, self.options)

	return 
end
function ItemToggle:toggle()
	if not self._enabled then
		return 
	end

	self.selected = self.selected + 1

	if #self.options < self.selected then
		self.selected = 1
	end

	slot3 = self

	self.dirty(slot2)

	return 
end
function ItemToggle:toggle_back()
	if not self._enabled then
		return 
	end

	self.selected = self.selected - 1

	if self.selected <= 0 then
		self.selected = #self.options
	end

	slot3 = self

	self.dirty(slot2)

	return 
end
function ItemToggle:selected_option()
	return self.options[self.selected]
end
function ItemToggle:value()
	local value = ""
	slot4 = self
	local selected_option = self.selected_option(slot3)

	if selected_option then
		slot5 = selected_option
		value = selected_option.parameters(slot4).value
	end

	return value
end
function ItemToggle:set_value(value)
	slot4 = self.options

	for i, option in ipairs(slot3) do
		slot9 = option

		if option.parameters(slot8).value == value then
			self.selected = i

			break
		end
	end

	slot4 = self

	self.dirty(slot3)

	return 
end
function ItemToggle:setup_gui(node, row_item)

	-- Decompilation error in this vicinity:
	slot6 = {
		w = managers.menu.get_menu_item_width(slot8)
	}
	row_item.gui_panel = node.item_panel.panel(slot4, node.item_panel)
	slot7 = row_item.gui_panel
	slot10 = node
	row_item.gui_text = node._text_item_part(slot4, node, row_item, node._right_align(managers.menu))
	slot5 = row_item.gui_text
	slot3 = row_item.gui_text.set_text
	slot5 = self

	if not self.enabled(slot4) then
		row_item.color = row_item.disabled_color
		slot6 = row_item.color

		row_item.gui_text.set_color(slot4, row_item.gui_text)

		slot6 = 0.75

		row_item.gui_text.set_alpha(slot4, row_item.gui_text)
	else
		slot6 = 1

		row_item.gui_text.set_alpha(slot4, row_item.gui_text)
	end

	slot5 = self
	slot5 = self.selected_option(slot4)

	if self.selected_option(slot4).parameters(slot4).text_id then
		slot7 = row_item.gui_panel
		slot10 = node
		row_item.gui_option = node._text_item_part(slot4, node, row_item, node._left_align(slot9))
		slot6 = row_item.align

		row_item.gui_option.set_align(slot4, row_item.gui_option)
	end

	slot5 = self
	slot5 = self.selected_option(slot4)

	if self.selected_option(slot4).parameters(slot4).icon then
		slot6 = {
			y = 0,
			x = 0,
			layer = node.layers.items,
			texture_rect = {
				0,
				0,
				24,
				24
			},
			texture = self.selected_option(slot8).parameters(slot8).icon,
			blend_mode = node.row_item_blend_mode
		}
		slot9 = self
		slot9 = self.selected_option(slot8)
		row_item.gui_icon = row_item.gui_panel.bitmap(slot4, row_item.gui_panel)
		slot6 = row_item.disabled_color

		row_item.gui_icon.set_color(slot4, row_item.gui_icon)
	end

	if row_item.help_text then
	end

	slot5 = self

	if self.info_panel(slot4) == "lobby_campaign" then
		slot6 = row_item

		node._set_lobby_campaign(slot4, node)
	end

	return true
end
local xl_pad = 64
function ItemToggle:reload(row_item, node)
	if not row_item then
		return 
	end

	local safe_rect = managers.gui_data.scaled_size(slot4)
	slot7 = row_item.color

	row_item.gui_text.set_color(managers.gui_data, row_item.gui_text)

	slot7 = node.font_size

	row_item.gui_text.set_font_size(managers.gui_data, row_item.gui_text)

	slot6 = row_item.gui_text
	local x, y, w, h = row_item.gui_text.text_rect(managers.gui_data)
	slot11 = h

	row_item.gui_text.set_height(slot9, row_item.gui_text)

	slot11 = managers.menu.MENU_ITEM_HEIGHT

	row_item.gui_panel.set_height(slot9, row_item.gui_panel)

	slot14 = node
	slot11 = safe_rect.width - node._mid_align(slot13)

	row_item.gui_panel.set_width(slot9, row_item.gui_panel)

	local node_padding = node._mid_align(slot9)
	slot11 = node

	if 0 < node._get_node_padding(node) then
		slot11 = node
		node_padding = node._get_node_padding(slot10)
	end

	if row_item.gui_option then
		slot12 = node.font_size

		row_item.gui_option.set_font_size(slot10, row_item.gui_option)

		slot15 = row_item.gui_panel
		slot12 = node._left_align(slot13) - row_item.gui_panel.x(node)

		row_item.gui_option.set_width(slot10, row_item.gui_option)

		slot15 = row_item.gui_panel
		slot12 = node._left_align(row_item.gui_panel.x(node)) - row_item.gui_panel.x(node)

		row_item.gui_option.set_right(slot10, row_item.gui_option)

		slot12 = h

		row_item.gui_option.set_height(slot10, row_item.gui_option)
	end

	slot12 = safe_rect.width / 2

	row_item.gui_text.set_width(slot10, row_item.gui_text)

	if row_item.align == "right" then
		slot11 = row_item.gui_text
		slot14 = row_item.gui_panel

		row_item.gui_text.set_right(slot10, row_item.gui_panel.w(slot13))
	else
		slot12 = 0

		row_item.gui_text.set_left(slot10, row_item.gui_text)
	end

	if row_item.gui_icon then
		slot12 = h

		row_item.gui_icon.set_w(slot10, row_item.gui_icon)

		slot12 = h

		row_item.gui_icon.set_h(slot10, row_item.gui_icon)

		slot11 = self

		if self.parameters(slot10).icon_by_text then
			if row_item.align == "right" then
				slot11 = row_item.gui_icon
				slot14 = row_item.gui_panel

				row_item.gui_icon.set_right(slot10, row_item.gui_panel.w(slot13))

				slot11 = row_item.gui_text
				slot14 = row_item.gui_icon

				row_item.gui_text.set_right(slot10, row_item.gui_icon.left(slot13))
			else
				slot15 = row_item.gui_panel
				slot15 = self
				slot12 = node._right_align(slot13) - row_item.gui_panel.x(node) + (self.parameters(node).expand_value or 0)

				row_item.gui_icon.set_left(slot10, row_item.gui_icon)

				slot11 = row_item.gui_text
				slot14 = row_item.gui_icon

				row_item.gui_text.set_left(slot10, row_item.gui_icon.right(self.parameters(node).expand_value or 0))
			end
		elseif row_item.align == "right" then
			slot15 = row_item.gui_panel
			slot15 = self
			slot12 = node._right_align(slot13) - row_item.gui_panel.x(node) + (self.parameters(node).expand_value or 0)

			row_item.gui_icon.set_left(slot10, row_item.gui_icon)
		else
			slot11 = row_item.gui_icon
			slot14 = row_item.gui_panel

			row_item.gui_icon.set_right(slot10, row_item.gui_panel.w(slot13))
		end
	end

	if row_item.gui_title then
		slot12 = node.font_size

		row_item.gui_title.set_font_size(slot10, row_item.gui_title)

		slot12 = h

		row_item.gui_title.set_height(slot10, row_item.gui_title)

		if row_item.gui_icon then
			slot14 = row_item.gui_icon
			slot12 = row_item.gui_icon.left(slot13) - node._align_line_padding * 2

			row_item.gui_title.set_right(slot10, row_item.gui_title)
		else
			slot11 = row_item.gui_title
			slot14 = node

			row_item.gui_title.set_right(slot10, node._left_align(slot13))
		end
	end

	if row_item.gui_info_panel then
		slot11 = self

		if self.info_panel(slot10) == "lobby_campaign" then
			slot12 = row_item

			node._align_lobby_campaign(slot10, node)
		else
			slot12 = row_item

			node._align_info_panel(slot10, node)
		end
	end

	if row_item.gui_option then
		if node.localize_strings then
			slot11 = self
			slot11 = self.selected_option(slot10)
		else
			slot11 = self
			slot11 = self.selected_option(slot10)
			row_item.option_text = self.selected_option(slot10).parameters(slot10).text_id
		end

		slot12 = row_item.option_text

		row_item.gui_option.set_text(slot10, row_item.gui_option)
	end

	slot12 = row_item

	self._set_toggle_item_image(slot10, self)

	slot11 = self

	if self.info_panel(slot10) == "lobby_campaign" then
		slot12 = row_item

		node._reload_lobby_campaign(slot10, node)
	end

	return true
end
function ItemToggle:_set_toggle_item_image(row_item)
	slot4 = self
	slot4 = self.selected_option(slot3)

	if self.selected_option(slot3).parameters(slot3).icon then
		if row_item.highlighted then
			slot4 = self
			slot4 = self.selected_option(slot3)
		else
			slot4 = self
			local x = self.selected_option(slot3).parameters(slot3).x
			slot5 = self
			local y = self.selected_option(self.selected_option(slot3)).parameters(self.selected_option(slot3)).y
			slot6 = self
			local w = self.selected_option(self.selected_option(self.selected_option(slot3))).parameters(self.selected_option(self.selected_option(slot3))).w
			slot7 = self
			local h = self.selected_option(self.selected_option(self.selected_option(self.selected_option(slot3)))).parameters(self.selected_option(self.selected_option(self.selected_option(slot3)))).h
			slot11 = self
			slot11 = self.selected_option(slot10)
			slot13 = h

			row_item.gui_icon.set_image(self.selected_option(self.selected_option(self.selected_option(self.selected_option(slot3)))), row_item.gui_icon, self.selected_option(slot10).parameters(slot10).icon, x, y, w)
		end

		slot4 = self

		if self.enabled(slot3) then
			slot5 = row_item.color or Color.white

			row_item.gui_icon.set_color(slot3, row_item.gui_icon)

			slot5 = 1

			row_item.gui_icon.set_alpha(slot3, row_item.gui_icon)
		else
			slot5 = row_item.disabled_color

			row_item.gui_icon.set_color(slot3, row_item.gui_icon)

			slot5 = 0.75

			row_item.gui_icon.set_alpha(slot3, row_item.gui_icon)
		end
	end

	return 
end
function ItemToggle:highlight_row_item(node, row_item, mouse_over)
	slot7 = row_item.color

	row_item.gui_text.set_color(slot5, row_item.gui_text)

	slot6 = row_item.gui_text
	slot9 = "ui/fonts/pf_din_text_comp_pro_medium_20"

	row_item.gui_text.set_font(slot5, Idstring(slot8))

	row_item.highlighted = true
	slot7 = row_item

	self._set_toggle_item_image(slot5, self)

	if row_item.gui_option then
		slot7 = row_item.color

		row_item.gui_option.set_color(slot5, row_item.gui_option)
	end

	if row_item.gui_info_panel then
		slot7 = true

		row_item.gui_info_panel.set_visible(slot5, row_item.gui_info_panel)
	end

	slot6 = self

	if self.info_panel(slot5) == "lobby_campaign" then
		slot7 = row_item

		node._highlight_lobby_campaign(slot5, node)
	end

	return true
end
function ItemToggle:fade_row_item(node, row_item)
	slot6 = row_item.color

	row_item.gui_text.set_color(slot4, row_item.gui_text)

	slot5 = row_item.gui_text
	slot8 = "ui/fonts/pf_din_text_comp_pro_medium_20"

	row_item.gui_text.set_font(slot4, Idstring(slot7))

	row_item.highlighted = nil
	slot6 = row_item

	self._set_toggle_item_image(slot4, self)

	if row_item.gui_option then
		slot6 = row_item.color

		row_item.gui_option.set_color(slot4, row_item.gui_option)
	end

	if row_item.gui_info_panel then
		slot6 = false

		row_item.gui_info_panel.set_visible(slot4, row_item.gui_info_panel)
	end

	slot5 = self

	if self.info_panel(slot4) == "lobby_campaign" then
		slot6 = row_item

		node._fade_lobby_campaign(slot4, node)
	end

	return true
end

return 
