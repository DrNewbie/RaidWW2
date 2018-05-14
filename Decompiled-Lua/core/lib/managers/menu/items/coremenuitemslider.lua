-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuItemSlider"

core.module(slot1, core)

slot3 = "CoreMenuItem"

core.import(slot1, core)

if not ItemSlider then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

ItemSlider = slot0
ItemSlider.TYPE = "slider"
function ItemSlider:init(data_node, parameters)
	slot7 = parameters

	CoreMenuItem.Item.init(slot4, self, data_node)

	self._type = "slider"
	self._min = 0
	self._max = 1
	self._step = 0.1
	self._show_value = false

	if data_node then
		self._min = data_node.min or self._min
		self._max = data_node.max or self._max
		self._step = data_node.step or self._step
		self._show_value = data_node.show_value
		self._show_slider_text = self._show_value or data_node.show_slider_text
	end

	slot5 = self._min
	self._min = tonumber(slot4)
	slot5 = self._max
	self._max = tonumber(slot4)
	slot5 = self._step
	self._step = tonumber(slot4)
	self._value = self._min

	return 
end
function ItemSlider:value()
	return self._value
end
function ItemSlider:show_value()
	return self._show_value
end
function ItemSlider:set_value(value)
	slot7 = value
	slot5 = self._max
	self._value = math.min(slot3, math.max(slot5, self._min))
	slot4 = self

	self.dirty(slot3)

	return 
end
function ItemSlider:set_value_by_percentage(percent)
	slot5 = self._min + (self._max - self._min) * percent / 100

	self.set_value(slot3, self)

	return 
end
function ItemSlider:set_min(value)
	self._min = value

	return 
end
function ItemSlider:set_max(value)
	self._max = value

	return 
end
function ItemSlider:set_step(value)
	self._step = value

	return 
end
function ItemSlider:increase()
	slot4 = self._value + self._step

	self.set_value(slot2, self)

	return 
end
function ItemSlider:decrease()
	slot4 = self._value - self._step

	self.set_value(slot2, self)

	return 
end
function ItemSlider:percentage()
	return (self._value - self._min) / (self._max - self._min) * 100
end
function ItemSlider:setup_gui(node, row_item)
	slot6 = {
		w = node.item_panel.w(slot8)
	}
	row_item.gui_panel = node.item_panel.panel(slot4, node.item_panel)
	slot7 = row_item.gui_panel
	slot10 = node
	row_item.gui_text = node._text_item_part(slot4, node, row_item, node._right_align(node.item_panel))
	slot6 = node.layers.items + 1

	row_item.gui_text.set_layer(slot4, row_item.gui_text)

	slot5 = row_item.gui_text
	local _, _, w, h = row_item.gui_text.text_rect(slot4)
	slot10 = h

	row_item.gui_panel.set_h(node._right_align, row_item.gui_panel)

	local bar_w = 192
	slot11 = {
		visible = false,
		vertical = "center",
		h = 22,
		align = "center",
		halign = "center",
		x = node._left_align(slot13) - bar_w,
		y = h / 2 - 11,
		w = bar_w,
		color = Color.black.with_alpha(slot13, Color.black),
		layer = node.layers.items - 1
	}
	slot14 = node
	slot15 = 0.5
	row_item.gui_slider_bg = row_item.gui_panel.rect(row_item.gui_panel, row_item.gui_panel)
	slot11 = {
		vertical = "center",
		align = "center",
		halign = "center",
		orientation = "vertical",
		gradient_points = {
			0,
			_G.tweak_data.screen_colors.button_stage_3,
			1,
			_G.tweak_data.screen_colors.button_stage_3
		},
		x = node._left_align(_G.tweak_data.screen_colors.button_stage_3) - bar_w + 2,
		y = row_item.gui_slider_bg.y(_G.tweak_data.screen_colors.button_stage_3) + 2,
		w = (row_item.gui_slider_bg.w(_G.tweak_data.screen_colors.button_stage_3) - 4) * 0.23,
		h = row_item.gui_slider_bg.h(_G.tweak_data.screen_colors.button_stage_3) - 4,
		blend_mode = node.row_item_blend_mode or "normal",
		color = row_item.color,
		layer = node.layers.items
	}
	slot14 = node
	slot14 = row_item.gui_slider_bg
	slot14 = row_item.gui_slider_bg
	slot14 = row_item.gui_slider_bg
	row_item.gui_slider_gfx = row_item.gui_panel.gradient(slot9, row_item.gui_panel)
	slot11 = {
		w = 100,
		color = row_item.color.with_alpha(slot13, row_item.color),
		layer = node.layers.items,
		h = row_item.gui_slider_bg.h(slot13) - 4
	}
	slot15 = 0
	slot14 = row_item.gui_slider_bg
	row_item.gui_slider = row_item.gui_panel.rect(slot9, row_item.gui_panel)
	slot11 = {
		texture = "guis/textures/debug_menu_icons",
		visible = false,
		texture_rect = {
			0,
			0,
			24,
			28
		},
		layer = node.layers.items + 2
	}
	row_item.gui_slider_marker = row_item.gui_panel.bitmap(slot9, row_item.gui_panel)
	local slider_text_align = (row_item.align == "left" and "right") or (row_item.align == "right" and "left") or row_item.align
	local slider_text_halign = (row_item.slider_text_halign == "left" and "right") or (row_item.slider_text_halign == "right" and "left") or row_item.slider_text_halign
	local slider_text_vertical = (row_item.vertical == "top" and "bottom") or (row_item.vertical == "bottom" and "top") or row_item.vertical
	slot14 = {
		y = 0,
		font_size = row_item.font_size or _G.tweak_data.menu.stats_font_size,
		x = node._right_align(slot16),
		h = h,
		w = row_item.gui_slider_bg.w(slot16),
		align = slider_text_align,
		halign = slider_text_halign,
		vertical = slider_text_vertical,
		valign = slider_text_vertical,
		font = node.font,
		color = row_item.color,
		layer = node.layers.items + 1,
		text = "" .. math.floor(row_item.gui_slider_bg) .. "%",
		blend_mode = node.row_item_blend_mode or "normal",
		render_template = Idstring(slot16),
		visible = self._show_slider_text
	}
	slot17 = node
	slot18 = 0
	slot17 = "VertexColorTextured"
	row_item.gui_slider_text = row_item.gui_panel.text(slot12, row_item.gui_panel)

	if row_item.help_text then
	end

	slot15 = row_item

	self._layout(slot12, self, node)

	return true
end
function ItemSlider:reload(row_item, node)

	-- Decompilation error in this vicinity:
	if not row_item then
		return 
	end

	slot5 = self
	slot7 = value

	row_item.gui_slider_text.set_text(slot5, row_item.gui_slider_text)

	slot7 = self._show_slider_text

	row_item.gui_slider_text.set_visible(slot5, row_item.gui_slider_text)

	slot8 = self
	local where = row_item.gui_slider.left(slot5) + row_item.gui_slider.w(row_item.gui_slider) * self.percentage(row_item.gui_slider) / 100
	slot8 = where

	row_item.gui_slider_marker.set_center_x(self.percentage(row_item.gui_slider) / 100, row_item.gui_slider_marker)

	slot11 = self
	slot8 = row_item.gui_slider.w(slot9) * self.percentage(row_item.gui_slider) / 100

	row_item.gui_slider_gfx.set_w(self.percentage(row_item.gui_slider) / 100, row_item.gui_slider_gfx)

	return true
end
function ItemSlider:highlight_row_item(node, row_item, mouse_over)

	-- Decompilation error in this vicinity:
	slot7 = row_item.color

	row_item.gui_text.set_color(slot5, row_item.gui_text)

	slot6 = row_item.gui_text
	slot4 = row_item.gui_text.set_font

	return true
end
function ItemSlider:fade_row_item(node, row_item)

	-- Decompilation error in this vicinity:
	slot6 = row_item.color

	row_item.gui_text.set_color(slot4, row_item.gui_text)

	slot5 = row_item.gui_text
	slot3 = row_item.gui_text.set_font

	return true
end
function ItemSlider:_layout(node, row_item)
	local safe_rect = managers.gui_data.scaled_size(slot4)
	slot7 = node.font_size

	row_item.gui_text.set_font_size(managers.gui_data, row_item.gui_text)

	slot6 = row_item.gui_text
	local x, y, w, h = row_item.gui_text.text_rect(managers.gui_data)
	local bg_pad = 8
	local xl_pad = 64
	slot13 = h

	row_item.gui_panel.set_height(slot11, row_item.gui_panel)

	slot16 = node
	slot13 = safe_rect.width - node._mid_align(slot15)

	row_item.gui_panel.set_width(slot11, row_item.gui_panel)
	row_item.gui_panel.set_x(slot11, node._mid_align(node._mid_align(slot15)))

	local sh = h - 2
	slot14 = sh

	row_item.gui_slider_bg.set_h(row_item.gui_panel, row_item.gui_slider_bg)

	slot13 = row_item.gui_slider_bg
	slot16 = row_item.gui_panel

	row_item.gui_slider_bg.set_w(row_item.gui_panel, row_item.gui_panel.w(node))

	slot14 = 0

	row_item.gui_slider_bg.set_x(row_item.gui_panel, row_item.gui_slider_bg)

	slot14 = h / 2

	row_item.gui_slider_bg.set_center_y(row_item.gui_panel, row_item.gui_slider_bg)

	slot14 = row_item.font_size or _G.tweak_data.menu.stats_font_size

	row_item.gui_slider_text.set_font_size(slot12, row_item.gui_slider_text)

	slot13 = row_item.gui_slider_text
	slot16 = row_item.gui_slider_bg

	row_item.gui_slider_text.set_size(slot12, row_item.gui_slider_bg.size(slot15))

	slot13 = row_item.gui_slider_text
	slot16 = row_item.gui_slider_bg

	row_item.gui_slider_text.set_position(slot12, row_item.gui_slider_bg.position(slot15))

	slot13 = row_item.gui_slider_text
	slot16 = row_item.gui_slider_text

	row_item.gui_slider_text.set_y(slot12, row_item.gui_slider_text.y(slot15))

	if row_item.align == "right" then
		slot17 = row_item.gui_panel
		slot14 = node._right_align(slot15) - row_item.gui_panel.x(node)

		row_item.gui_slider_text.set_left(slot12, row_item.gui_slider_text)
	else
		slot17 = node
		slot14 = row_item.gui_slider_text.x(slot15) - node.align_line_padding(row_item.gui_slider_text)

		row_item.gui_slider_text.set_x(slot12, row_item.gui_slider_text)
	end

	slot14 = sh

	row_item.gui_slider_gfx.set_h(slot12, row_item.gui_slider_gfx)

	slot13 = row_item.gui_slider_gfx
	slot16 = row_item.gui_slider_bg

	row_item.gui_slider_gfx.set_x(slot12, row_item.gui_slider_bg.x(slot15))

	slot13 = row_item.gui_slider_gfx
	slot16 = row_item.gui_slider_bg

	row_item.gui_slider_gfx.set_y(slot12, row_item.gui_slider_bg.y(slot15))

	slot13 = row_item.gui_slider
	slot16 = row_item.gui_slider_bg

	row_item.gui_slider.set_x(slot12, row_item.gui_slider_bg.x(slot15))

	slot13 = row_item.gui_slider
	slot16 = row_item.gui_slider_bg

	row_item.gui_slider.set_y(slot12, row_item.gui_slider_bg.y(slot15))

	slot13 = row_item.gui_slider
	slot16 = row_item.gui_slider_bg

	row_item.gui_slider.set_w(slot12, row_item.gui_slider_bg.w(slot15))

	slot14 = h / 2

	row_item.gui_slider_marker.set_center_y(slot12, row_item.gui_slider_marker)

	slot14 = safe_rect.width / 2

	row_item.gui_text.set_width(slot12, row_item.gui_text)

	if row_item.align == "right" then
		slot13 = row_item.gui_text
		slot16 = row_item.gui_panel

		row_item.gui_text.set_right(slot12, row_item.gui_panel.w(slot15))
	else
		slot17 = row_item.gui_panel
		slot14 = node._right_align(slot15) - row_item.gui_panel.x(node)

		row_item.gui_text.set_left(slot12, row_item.gui_text)
	end

	slot14 = h

	row_item.gui_text.set_height(slot12, row_item.gui_text)

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

	return 
end

return 
