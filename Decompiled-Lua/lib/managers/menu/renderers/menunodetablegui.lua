-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not MenuNodeTableGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeTableGui = slot0
function MenuNodeTableGui:init(node, layer, parameters)
	slot9 = parameters

	MenuNodeTableGui.super.init(slot5, self, node, layer)

	return 
end
function MenuNodeTableGui:_setup_panels(node)
	slot5 = node

	MenuNodeTableGui.super._setup_panels(slot3, self)

	local safe_rect_pixels = self._scaled_size(slot3)
	slot6 = {
		w = 0,
		h = 0,
		x = 0,
		y = 0
	}
	local mini_info = self.safe_rect_panel.panel(self, self.safe_rect_panel)
	slot7 = {
		halign = "top",
		vertical = "top",
		word_wrap = true,
		wrap = true,
		align = "left",
		text = "",
		y = 0,
		x = 0,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = Color.white,
		layer = self.layers.items
	}
	local mini_text = mini_info.text(self.safe_rect_panel, mini_info)
	slot10 = self._info_bg_rect
	slot8 = self._info_bg_rect.w(slot9) - tweak_data.menu.info_padding * 2

	mini_info.set_width(mini_info, mini_info)

	slot7 = mini_text
	slot10 = mini_info

	mini_text.set_width(mini_info, mini_info.w(tweak_data.menu.info_padding * 2))

	slot8 = 100

	mini_info.set_height(mini_info, mini_info)

	slot8 = 100

	mini_text.set_height(mini_info, mini_text)

	slot10 = self._info_bg_rect
	slot8 = self._info_bg_rect.bottom(tweak_data.menu.info_padding * 2) + tweak_data.menu.info_padding

	mini_info.set_top(mini_info, mini_info)

	slot8 = 0

	mini_text.set_top(mini_info, mini_text)

	slot8 = tweak_data.menu.info_padding

	mini_info.set_left(mini_info, mini_info)

	slot8 = 0

	mini_text.set_left(mini_info, mini_text)

	self._mini_info_text = mini_text

	return 
end
function MenuNodeTableGui:set_mini_info(text)
	slot5 = text

	self._mini_info_text.set_text(slot3, self._mini_info_text)

	return 
end
function MenuNodeTableGui:_create_menu_item(row_item)
	if row_item.type == "column" then
		local columns = row_item.node.columns(slot3)
		local total_proportions = row_item.node.parameters(row_item.node).total_proportions
		slot7 = {
			x = self._right_align(slot9),
			w = self.item_panel.w(slot9)
		}
		slot10 = self
		slot10 = self.item_panel
		row_item.gui_panel = self.item_panel.panel(row_item.node, self.item_panel)
		row_item.gui_columns = {}
		local x = 0
		slot7 = columns

		for i, data in ipairs(self.item_panel) do
			slot13 = {
				vertical = "center",
				y = 0,
				font_size = self.font_size,
				x = row_item.position.x,
				align = data.align,
				halign = data.align,
				font = row_item.font,
				color = row_item.color,
				layer = self.layers.items,
				text = row_item.item.parameters(slot15).columns[i]
			}
			local text = row_item.gui_panel.text(slot11, row_item.gui_panel)
			row_item.gui_columns[i] = text
			slot13 = text
			local _, _, w, h = text.text_rect(row_item.gui_panel)
			slot18 = h

			text.set_h(row_item.item, text)

			slot18 = row_item.gui_panel
			local w = data.proportions / total_proportions * row_item.gui_panel.w(text)
			slot19 = w

			text.set_w(text, text)

			slot19 = x

			text.set_x(text, text)

			x = x + w
		end

		slot7 = row_item.gui_columns[1]
		local x, y, w, h = row_item.gui_columns[1].text_rect(slot6)
		slot12 = h

		row_item.gui_panel.set_height(slot10, row_item.gui_panel)
	elseif row_item.type == "server_column" then
		local columns = row_item.node.columns(slot3)
		local total_proportions = row_item.node.parameters(row_item.node).total_proportions
		slot6 = self
		local safe_rect = self._scaled_size(row_item.node)
		local xl_pad = 54
		slot9 = {
			x = safe_rect.width / 2 - xl_pad,
			w = safe_rect.width / 2 + xl_pad
		}
		row_item.gui_panel = self.item_panel.panel(slot7, self.item_panel)
		row_item.gui_columns = {}
		local x = 0
		slot9 = columns

		for i, data in ipairs(self.item_panel) do
			slot15 = {
				vertical = "center",
				y = 0,
				font_size = tweak_data.menu.server_list_font_size,
				x = row_item.position.x,
				align = data.align,
				halign = data.align,
				font = row_item.font,
				color = row_item.color,
				layer = self.layers.items,
				text = row_item.item.parameters(slot17).columns[i]
			}
			local text = row_item.gui_panel.text(slot13, row_item.gui_panel)
			row_item.gui_columns[i] = text
			slot15 = text
			local _, _, w, h = text.text_rect(row_item.gui_panel)
			slot20 = h

			text.set_h(row_item.item, text)

			slot20 = row_item.gui_panel
			local w = data.proportions / total_proportions * row_item.gui_panel.w(text)
			slot21 = w

			text.set_w(text, text)

			slot21 = x

			text.set_x(text, text)

			x = x + w
		end

		slot9 = row_item.gui_columns[1]
		local x, y, w, h = row_item.gui_columns[1].text_rect(slot8)
		slot14 = h

		row_item.gui_panel.set_height(slot12, row_item.gui_panel)

		local level_id = row_item.item.parameters(slot12).level_id
		slot15 = {
			y = 0,
			visible = false,
			x = 0,
			layer = self.layers.items,
			w = self._left_align(slot17),
			h = self._item_panel_parent.h(slot17)
		}
		slot18 = self
		slot18 = self._item_panel_parent
		row_item.gui_info_panel = self.safe_rect_panel.panel(row_item.item, self.safe_rect_panel)
		slot15 = {
			visible = false,
			align = "left",
			vertical = "left",
			text = utf8.to_upper(slot17),
			layer = self.layers.items,
			font = self.font,
			font_size = tweak_data.menu.challenges_font_size,
			color = row_item.color
		}
		slot20 = row_item.item
		slot18 = row_item.item.parameters(slot19).level_name
		row_item.heist_name = row_item.gui_info_panel.text(row_item.item, row_item.gui_info_panel)
	else
		slot5 = row_item

		MenuNodeTableGui.super._create_menu_item(slot3, self)
	end

	return 
end
function MenuNodeTableGui:_align_server_column(row_item)
	local safe_rect = self._scaled_size(slot3)

	self._align_item_gui_info_panel(self, self)

	local font_size = tweak_data.menu.pd2_small_font_size
	local offset = 22 * tweak_data.scale.lobby_info_offset_multiplier
	slot8 = font_size

	row_item.server_title.set_font_size(row_item.gui_info_panel, row_item.server_title)

	slot8 = font_size

	row_item.server_text.set_font_size(row_item.gui_info_panel, row_item.server_text)

	slot7 = row_item.server_title
	local x, y, w, h = row_item.server_title.text_rect(row_item.gui_info_panel)
	slot12 = tweak_data.menu.info_padding

	row_item.server_title.set_x(slot10, row_item.server_title)

	slot12 = tweak_data.menu.info_padding

	row_item.server_title.set_y(slot10, row_item.server_title)

	slot12 = w

	row_item.server_title.set_w(slot10, row_item.server_title)

	slot11 = row_item.server_text
	slot14 = row_item.server_title

	row_item.server_text.set_lefttop(slot10, row_item.server_title.righttop(slot13))

	slot11 = row_item.server_text
	slot14 = row_item.gui_info_panel

	row_item.server_text.set_w(slot10, row_item.gui_info_panel.w(slot13))

	slot12 = math.round(row_item.server_text.x(slot15))

	row_item.server_text.set_position(slot10, row_item.server_text, math.round(row_item.server_text.y(row_item.server_text)))

	slot12 = font_size

	row_item.server_info_title.set_font_size(slot10, row_item.server_info_title)

	slot12 = font_size

	row_item.server_info_text.set_font_size(slot10, row_item.server_info_text)

	slot11 = row_item.server_info_title
	local x, y, w, h = row_item.server_info_title.text_rect(slot10)
	slot16 = tweak_data.menu.info_padding

	row_item.server_info_title.set_x(row_item.server_text.x, row_item.server_info_title)

	slot16 = tweak_data.menu.info_padding + offset

	row_item.server_info_title.set_y(row_item.server_text.x, row_item.server_info_title)

	slot16 = w

	row_item.server_info_title.set_w(row_item.server_text.x, row_item.server_info_title)

	slot15 = row_item.server_info_text
	slot18 = row_item.server_info_title

	row_item.server_info_text.set_lefttop(row_item.server_text.x, row_item.server_info_title.righttop(row_item.server_text))

	slot15 = row_item.server_info_text
	slot18 = row_item.gui_info_panel

	row_item.server_info_text.set_w(row_item.server_text.x, row_item.gui_info_panel.w(row_item.server_text))

	slot16 = math.round(row_item.server_info_text.x(slot19))
	slot21 = row_item.server_info_text

	row_item.server_info_text.set_position(row_item.server_text.x, row_item.server_info_text, math.round(row_item.server_info_text.y(row_item.server_info_text)))

	slot16 = font_size

	row_item.level_title.set_font_size(row_item.server_text.x, row_item.level_title)

	slot16 = font_size

	row_item.level_text.set_font_size(row_item.server_text.x, row_item.level_text)

	slot15 = row_item.level_title
	local x, y, w, h = row_item.level_title.text_rect(row_item.server_text.x)
	slot20 = tweak_data.menu.info_padding

	row_item.level_title.set_x(row_item.server_info_text.x, row_item.level_title)

	slot20 = tweak_data.menu.info_padding + offset * 2

	row_item.level_title.set_y(row_item.server_info_text.x, row_item.level_title)

	slot20 = w

	row_item.level_title.set_w(row_item.server_info_text.x, row_item.level_title)

	slot19 = row_item.level_text
	slot22 = row_item.level_title

	row_item.level_text.set_lefttop(row_item.server_info_text.x, row_item.level_title.righttop(offset * 2))

	slot19 = row_item.level_text
	slot22 = row_item.gui_info_panel

	row_item.level_text.set_w(row_item.server_info_text.x, row_item.gui_info_panel.w(offset * 2))

	slot20 = math.round(row_item.level_text.x(slot23))
	slot25 = row_item.level_text

	row_item.level_text.set_position(row_item.server_info_text.x, row_item.level_text, math.round(row_item.level_text.y(row_item.level_text)))

	slot20 = font_size

	row_item.difficulty_title.set_font_size(row_item.server_info_text.x, row_item.difficulty_title)

	slot20 = font_size

	row_item.difficulty_text.set_font_size(row_item.server_info_text.x, row_item.difficulty_text)

	slot19 = row_item.difficulty_title
	local x, y, w, h = row_item.difficulty_title.text_rect(row_item.server_info_text.x)
	slot24 = tweak_data.menu.info_padding

	row_item.difficulty_title.set_x(row_item.level_text.x, row_item.difficulty_title)

	slot24 = tweak_data.menu.info_padding + offset * 3

	row_item.difficulty_title.set_y(row_item.level_text.x, row_item.difficulty_title)

	slot24 = w

	row_item.difficulty_title.set_w(row_item.level_text.x, row_item.difficulty_title)

	slot23 = row_item.difficulty_text
	slot26 = row_item.difficulty_title

	row_item.difficulty_text.set_lefttop(row_item.level_text.x, row_item.difficulty_title.righttop(offset * 3))

	slot23 = row_item.difficulty_text
	slot26 = row_item.gui_info_panel

	row_item.difficulty_text.set_w(row_item.level_text.x, row_item.gui_info_panel.w(offset * 3))

	slot24 = math.round(row_item.difficulty_text.x(slot27))
	slot29 = row_item.difficulty_text

	row_item.difficulty_text.set_position(row_item.level_text.x, row_item.difficulty_text, math.round(row_item.difficulty_text.y(row_item.difficulty_text)))

	slot23 = row_item.heist_name
	local _, _, _, h = row_item.heist_name.text_rect(row_item.level_text.x)
	local w = row_item.gui_info_panel.w(row_item.difficulty_text.x)
	slot29 = h

	row_item.heist_name.set_height(row_item.gui_info_panel, row_item.heist_name)

	slot29 = w

	row_item.heist_name.set_w(row_item.gui_info_panel, row_item.heist_name)

	slot29 = w

	row_item.heist_briefing.set_w(row_item.gui_info_panel, row_item.heist_briefing)

	slot28 = row_item.heist_briefing
	slot31 = row_item.heist_briefing

	row_item.heist_briefing.set_shape(row_item.gui_info_panel, row_item.heist_briefing.text_rect(slot30))

	slot29 = 0

	row_item.heist_briefing.set_x(row_item.gui_info_panel, row_item.heist_briefing)

	slot29 = tweak_data.menu.info_padding + offset * 4 + tweak_data.menu.info_padding * 2

	row_item.heist_briefing.set_y(row_item.gui_info_panel, row_item.heist_briefing)

	slot29 = math.round(row_item.heist_briefing.x(slot32))
	slot34 = row_item.heist_briefing

	row_item.heist_briefing.set_position(row_item.gui_info_panel, row_item.heist_briefing, math.round(row_item.heist_briefing.y(row_item.heist_briefing)))

	return 
end
function MenuNodeTableGui:_setup_item_panel_parent(safe_rect)
	slot5 = safe_rect

	MenuNodeTableGui.super._setup_item_panel_parent(slot3, self)

	return 
end
function MenuNodeTableGui:_set_width_and_height(safe_rect)
	slot5 = safe_rect

	MenuNodeTableGui.super._set_width_and_height(slot3, self)

	return 
end
function MenuNodeTableGui:_setup_item_panel(safe_rect, res)
	slot7 = res

	MenuNodeTableGui.super._setup_item_panel(slot4, self, safe_rect)

	return 
end
function MenuNodeTableGui:resolution_changed()
	slot3 = self

	MenuNodeTableGui.super.resolution_changed(slot2)

	slot3 = self
	local safe_rect_pixels = self._scaled_size(slot2)

	return 
end

return 
