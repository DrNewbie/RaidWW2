if not RaidGUIControlIntelOppositeForces then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlIntelOppositeForces = slot0
function RaidGUIControlIntelOppositeForces:init(parent, params)
	slot7 = params

	RaidGUIControlIntelOppositeForces.super.init(slot4, self, parent)

	slot6 = self._params
	self._object = self._panel.panel(slot4, self._panel)
	self._category_name = "opposition_forces"
	slot5 = self

	self._layout(slot4)

	return 
end
function RaidGUIControlIntelOppositeForces:_layout()
	slot4 = {
		y = 0,
		x = 0,
		layer = self._object.layer(slot6) + 1,
		w = tweak_data.gui.icons.intel_table_opposition_card.texture_rect[3],
		h = tweak_data.gui.icons.intel_table_opposition_card.texture_rect[4],
		texture = tweak_data.gui.icons.intel_table_opposition_card.texture,
		texture_rect = tweak_data.gui.icons.intel_table_opposition_card.texture_rect
	}
	slot7 = self._object
	self._bg_image = self._object.bitmap(slot2, self._object)
	slot4 = {
		w = 384,
		h = 64,
		text = "",
		y = 96,
		x = 96,
		layer = self._object.layer(slot6) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.chat_border
	}
	slot7 = self._object
	self._title = self._object.text(slot2, self._object)
	local scrollable_area_description_params = {
		scrollbar_width = 3,
		name = "scrollable_area_description",
		h = 448,
		y = 160,
		w = 416,
		x = 96,
		scroll_step = 19
	}
	slot4 = self._object
	scrollable_area_description_params.layer = self._object.layer(self._object) + 2
	slot5 = scrollable_area_description_params
	self._scrollable_area_description = self._object.scrollable_area(self._object, self._object)
	local content_panel_params = {
		w = 384,
		x = 0,
		y = 0
	}
	slot5 = self._object
	content_panel_params.layer = self._object.layer(self._object) + 2
	slot5 = self._scrollable_area_description
	slot6 = content_panel_params
	self._content_panel = self._scrollable_area_description.get_panel(self._object).panel(self._object, self._scrollable_area_description.get_panel(self._object))
	slot5 = self._scrollable_area_description

	self._scrollable_area_description.setup_scroll_area(self._object)

	slot6 = {
		w = 380,
		wrap = true,
		text = "",
		y = 0,
		x = 0,
		layer = self._object.layer(slot8) + 2,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.chat_border
	}
	slot9 = self._object
	self._description = self._content_panel.text(self._object, self._content_panel)
	local image_viewer_params = {
		visible = true,
		h = 480,
		y = 128,
		w = 320,
		x = 576
	}
	slot8 = image_viewer_params
	self._image_viewer = self._object.create_custom_control(self._content_panel, self._object, RaidGUIControlImageViewer)

	return 
end
function RaidGUIControlIntelOppositeForces:set_data(item_value)
	self._data = tweak_data.intel.get_item_data(slot3, tweak_data.intel, self._category_name)
	slot4 = self._title
	slot9 = true

	self._title.set_text(slot3, self.translate(item_value, self, self._data.name_id))

	slot4 = self._description
	slot9 = false

	self._description.set_text(slot3, self.translate(item_value, self, self._data.desc_id))

	slot4 = self._description
	local x1, y1, w1, h1 = self._description.text_rect(slot3)
	slot9 = h1

	self._description.set_h(self, self._description)

	slot9 = h1

	self._content_panel.set_h(self, self._content_panel)

	slot8 = self._scrollable_area_description

	self._scrollable_area_description.setup_scroll_area(self)

	slot9 = self._data.images

	self._image_viewer.set_data(self, self._image_viewer)

	return 
end
function RaidGUIControlIntelOppositeForces:get_data()
	return self._data
end

return 
