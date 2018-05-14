if not RaidGUIControlIntelRaidPersonel then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlIntelRaidPersonel = slot0
function RaidGUIControlIntelRaidPersonel:init(parent, params)
	slot7 = params

	RaidGUIControlIntelRaidPersonel.super.init(slot4, self, parent)

	slot6 = self._params
	self._object = self._panel.panel(slot4, self._panel)
	self._category_name = "raid_personnel"
	slot5 = self

	self._layout(slot4)

	return 
end
function RaidGUIControlIntelRaidPersonel:_layout()
	slot4 = {
		y = 0,
		x = 0,
		layer = self._object.layer(slot6) + 1,
		w = tweak_data.gui.icons.intel_table_personnel_folder.texture_rect[3],
		h = tweak_data.gui.icons.intel_table_personnel_folder.texture_rect[4],
		texture = tweak_data.gui.icons.intel_table_personnel_folder.texture,
		texture_rect = tweak_data.gui.icons.intel_table_personnel_folder.texture_rect
	}
	slot7 = self._object
	self._bg_image = self._object.bitmap(slot2, self._object)
	slot4 = {
		vertical = "center",
		h = 32,
		w = 384,
		align = "left",
		text = "",
		y = 128,
		x = 608,
		layer = self._object.layer(slot6) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.chat_border
	}
	slot7 = self._object
	self._title_name = self._object.text(slot2, self._object)
	slot4 = {
		vertical = "center",
		h = 32,
		w = 384,
		align = "left",
		text = "",
		y = 160,
		x = 608,
		layer = self._object.layer(slot6) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_18,
		color = tweak_data.gui.colors.chat_border
	}
	slot7 = self._object
	self._real_name = self._object.text(slot2, self._object)
	slot4 = {
		vertical = "top",
		h = 40,
		w = 384,
		align = "left",
		text = "",
		y = 196,
		x = 608,
		layer = self._object.layer(slot6) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_18,
		color = tweak_data.gui.colors.chat_border
	}
	slot7 = self._object
	self._former_rank = self._object.text(slot2, self._object)
	slot4 = {
		vertical = "top",
		wrap = true,
		w = 384,
		align = "left",
		text = "",
		y = 256,
		x = 608,
		layer = self._object.layer(slot6) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.chat_border
	}
	slot7 = self._object
	self._notes_title = self._object.text(slot2, self._object)
	local scrollable_area_notes_params = {
		scrollbar_width = 3,
		name = "scrollable_area_notes",
		h = 384,
		y = 288,
		w = 384,
		x = 608,
		scroll_step = 19
	}
	slot4 = self._object
	scrollable_area_notes_params.layer = self._object.layer(self._object) + 2
	slot5 = scrollable_area_notes_params
	self._scrollable_area_notes = self._object.scrollable_area(self._object, self._object)
	local content_panel_params = {
		w = 380,
		x = 0,
		y = 0
	}
	slot5 = self._object
	content_panel_params.layer = self._object.layer(self._object) + 2
	slot5 = self._scrollable_area_notes
	slot6 = content_panel_params
	self._content_panel = self._scrollable_area_notes.get_panel(self._object).panel(self._object, self._scrollable_area_notes.get_panel(self._object))
	slot5 = self._scrollable_area_notes

	self._scrollable_area_notes.setup_scroll_area(self._object)

	slot6 = {
		vertical = "top",
		wrap = true,
		w = 380,
		align = "left",
		text = "",
		y = 0,
		x = 0,
		layer = self._object.layer(slot8) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.chat_border
	}
	slot9 = self._object
	self._notes = self._content_panel.text(self._object, self._content_panel)
	slot6 = {
		h = 448,
		y = 160,
		w = 320,
		x = 96,
		layer = self._object.layer(slot8) + 2,
		texture = tweak_data.gui.icons.intel_table_personnel_img_rivet.texture,
		texture_rect = tweak_data.gui.icons.intel_table_personnel_img_rivet.texture_rect
	}
	slot9 = self._object
	self._profile_photo = self._object.bitmap(self._object, self._object)

	return 
end
function RaidGUIControlIntelRaidPersonel:set_data(item_value)
	self._data = tweak_data.intel.get_item_data(slot3, tweak_data.intel, self._category_name)
	slot4 = self._title_name
	slot9 = true

	self._title_name.set_text(slot3, self.translate(item_value, self, self._data.header_name_id))

	slot9 = true
	slot10 = true
	slot5 = self.translate(item_value, self, "personnel_heading_real_name") .. self.translate(self, self, self._data.real_name_id)

	self._real_name.set_text(slot3, self._real_name)

	slot9 = true
	slot6 = self.translate(self, self, self._data.rank_id)
	slot5 = self.translate(self.translate(self, self, self._data.real_name_id), self, "personnel_heading_rank") .. slot6

	self._former_rank.set_text(slot3, self._former_rank)

	slot4 = self._notes_title
	slot9 = true

	self._notes_title.set_text(slot3, self.translate(slot6, self, "personnel_heading_mrs_whites_notes"))

	slot4 = self._notes
	slot9 = false

	self._notes.set_text(slot3, self.translate(slot6, self, self._data.notes_id))

	slot4 = self._notes
	local x1, y1, w1, h1 = self._notes.text_rect(slot3)
	slot9 = h1

	self._notes.set_h(self, self._notes)

	slot9 = h1

	self._content_panel.set_h(self, self._content_panel)

	slot8 = self._scrollable_area_notes

	self._scrollable_area_notes.setup_scroll_area(self)

	slot9 = self._data.texture

	self._profile_photo.set_image(self, self._profile_photo)

	slot8 = self._profile_photo
	slot11 = self._data.texture_rect

	self._profile_photo.set_texture_rect(self, unpack(true))

	return 
end
function RaidGUIControlIntelRaidPersonel:get_data()
	return self._data
end

return 
