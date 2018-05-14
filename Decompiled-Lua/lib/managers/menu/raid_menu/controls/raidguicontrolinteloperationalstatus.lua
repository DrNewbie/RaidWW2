if not RaidGUIControlIntelOperationalStatus then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlIntelOperationalStatus = slot0
function RaidGUIControlIntelOperationalStatus:init(parent, params)
	slot7 = params

	RaidGUIControlIntelOperationalStatus.super.init(slot4, self, parent)

	slot6 = self._params
	self._object = self._panel.panel(slot4, self._panel)
	self._category_name = "operational_status"
	slot5 = self

	self._layout(slot4)

	return 
end
function RaidGUIControlIntelOperationalStatus:_layout()
	slot4 = {
		y = 0,
		x = 0,
		layer = self._object.layer(slot6) + 1,
		w = tweak_data.gui.icons.intel_table_newspapers.texture_rect[3],
		h = tweak_data.gui.icons.intel_table_newspapers.texture_rect[4],
		texture = tweak_data.gui.icons.intel_table_newspapers.texture,
		texture_rect = tweak_data.gui.icons.intel_table_newspapers.texture_rect
	}
	slot7 = self._object
	self._bg_image = self._object.bitmap(slot2, self._object)
	slot4 = {
		vertical = "center",
		h = 32,
		w = 192,
		align = "left",
		text = "",
		y = 112,
		x = 96,
		layer = self._object.layer(slot6) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.intel_newspapers_text
	}
	slot7 = self._object
	self._update_date = self._object.text(slot2, self._object)
	slot4 = {
		vertical = "center",
		h = 32,
		w = 192,
		align = "right",
		text = "",
		y = 112,
		x = 96,
		layer = self._object.layer(slot6) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.intel_newspapers_text
	}
	slot7 = self._object
	self._update_person = self._object.text(slot2, self._object)
	slot6 = self._object
	slot4 = self._object.w(tweak_data.gui.colors.intel_newspapers_text) - 128

	self._update_person.set_right(slot2, self._update_person)

	local content_panel_scrollable_area_params = {
		scrollbar_width = 3,
		name = "content_panel_scrollable_area",
		h = 512,
		y = 208,
		w = 576,
		x = 256,
		scroll_step = 19
	}
	slot4 = self._object
	content_panel_scrollable_area_params.layer = self._object.layer(self._update_person) + 2
	slot5 = content_panel_scrollable_area_params
	self.content_panel_scrollable_area = self._object.scrollable_area(self._update_person, self._object)
	local content_panel_params = {
		h = 512,
		y = 0,
		w = 572,
		x = 0
	}
	slot5 = self._object
	content_panel_params.layer = self._object.layer(self._object) + 2
	slot5 = self.content_panel_scrollable_area
	slot6 = content_panel_params
	self._content_panel = self.content_panel_scrollable_area.get_panel(self._object).panel(self._object, self.content_panel_scrollable_area.get_panel(self._object))
	slot5 = self.content_panel_scrollable_area

	self.content_panel_scrollable_area.setup_scroll_area(self._object)

	slot6 = {
		vertical = "center",
		wrap = true,
		align = "center",
		text = "",
		y = 0,
		x = 0,
		w = self._content_panel.w(slot8),
		layer = self._object.layer(slot8) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_56,
		color = tweak_data.gui.colors.chat_border
	}
	slot9 = self._content_panel
	slot9 = self._object
	self._title = self._content_panel.text(self._object, self._content_panel)
	slot6 = {
		vertical = "top",
		wrap = true,
		align = "left",
		text = "",
		y = 0,
		x = 0,
		w = self._content_panel.w(slot8),
		layer = self._object.layer(slot8) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.chat_border
	}
	slot9 = self._content_panel
	slot9 = self._object
	self._text = self._content_panel.text(self._object, self._content_panel)
	slot6 = {
		h = 288,
		y = 0,
		w = 512,
		x = 32,
		layer = self._object.layer(slot8) + 2,
		texture = tweak_data.gui.icons.intel_table_newspapers.texture,
		texture_rect = tweak_data.gui.icons.intel_table_newspapers.texture_rect
	}
	slot9 = self._object
	self._title_image = self._content_panel.bitmap(self._object, self._content_panel)

	return 
end
function RaidGUIControlIntelOperationalStatus:set_data(item_value)
	slot6 = item_value
	self._data = tweak_data.intel.get_item_data(slot3, tweak_data.intel, self._category_name)
	local text_top_coord = 0
	local content_panel_height = 0
	slot7 = self._data.update_date

	self._update_date.set_text(self._category_name, self._update_date)

	slot7 = self._data.update_person

	self._update_person.set_text(self._category_name, self._update_person)

	slot6 = self._title
	slot11 = true

	self._title.set_text(self._category_name, self.translate(slot8, self, self._data.title))

	slot6 = self._text
	slot11 = false

	self._text.set_text(self._category_name, self.translate(slot8, self, self._data.text))

	slot6 = self._title
	local x1, y1, w1, h1 = self._title.text_rect(self._category_name)
	slot11 = h1

	self._title.set_h(self, self._title)

	slot10 = self._title
	text_top_coord = self._title.bottom(self) + 32
	slot10 = self._title
	content_panel_height = content_panel_height + self._title.h(self) + 32

	if self._data.texture and self._data.texture_rect then
		slot10 = self._title_image

		self._title_image.show(slot9)

		slot13 = self._title
		slot11 = self._title.bottom(slot12) + 32

		self._title_image.set_y(slot9, self._title_image)

		slot11 = self._data.texture

		self._title_image.set_image(slot9, self._title_image)

		slot10 = self._title_image
		slot13 = self._data.texture_rect

		self._title_image.set_texture_rect(slot9, unpack(slot12))

		slot10 = self._title_image
		content_panel_height = content_panel_height + self._title_image.h(slot9) + 64
		slot10 = self._title_image
		text_top_coord = self._title_image.bottom(slot9) + 32
	else
		slot10 = self._title_image

		self._title_image.hide(slot9)

		slot10 = self._title
		text_top_coord = self._title.bottom(slot9) + 32
	end

	slot10 = self._text
	local x2, y2, w2, h2 = self._text.text_rect(slot9)
	slot15 = h2

	self._text.set_h(slot13, self._text)

	slot14 = self._text
	content_panel_height = content_panel_height + self._text.h(slot13)
	slot15 = text_top_coord

	self._text.set_y(slot13, self._text)

	slot15 = content_panel_height

	self._content_panel.set_h(slot13, self._content_panel)

	slot14 = self.content_panel_scrollable_area

	self.content_panel_scrollable_area.setup_scroll_area(slot13)

	return 
end
function RaidGUIControlIntelOperationalStatus:get_data()
	return self._data
end

return 
