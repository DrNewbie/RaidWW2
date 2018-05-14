if not RaidGUIControlIntelImageDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlIntelImageDetails = slot0
RaidGUIControlIntelImageDetails.DEFAULT_W = 444
RaidGUIControlIntelImageDetails.DEFAULT_H = 592
RaidGUIControlIntelImageDetails.BACKGROUND_SIZE_PERCENTAGE = 0.85
RaidGUIControlIntelImageDetails.FOREGROUND_SIZE_PERCENTAGE = 0.92
RaidGUIControlIntelImageDetails.SELECTOR_ICON = "ico_sel_rect_top_left"
RaidGUIControlIntelImageDetails.PRESSED_SIZE = 0.97
function RaidGUIControlIntelImageDetails:init(parent, params)
	slot7 = params

	RaidGUIControlIntelImageDetails.super.init(slot4, self, parent)

	self._on_click_callback = params.on_click_callback
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_details(slot4)

	return 
end
function RaidGUIControlIntelImageDetails:_create_panel()
	slot3 = self._params
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_panel"

	if not panel_params.layer then
		slot4 = self._panel
		slot2 = self._panel.layer(slot3) + 1
	end

	panel_params.layer = slot2
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w or RaidGUIControlIntelImageDetails.DEFAULT_W
	panel_params.h = self._params.h or RaidGUIControlIntelImageDetails.DEFAULT_H
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlIntelImageDetails:_create_details()
	local intel_image_panel_params = {
		name = "intel_image_panel",
		h = 309,
		y = 0,
		x = 0
	}
	slot4 = self._object
	intel_image_panel_params.w = self._object.w(slot3)
	slot4 = self._object
	intel_image_panel_params.layer = self._object.layer(slot3) + 1
	slot5 = intel_image_panel_params
	self._image_panel = self._object.panel(slot3, self._object)
	local intel_image_background_params = {
		texture = "ui/main_menu/textures/mission_paper_background",
		name = "intel_image_background",
		texture_rect = {
			1063,
			5,
			882,
			613
		}
	}
	slot5 = self._image_panel
	intel_image_background_params.w = self._image_panel.w(self._object)
	slot5 = self._image_panel
	intel_image_background_params.h = self._image_panel.h(self._object)
	slot5 = self._image_panel
	intel_image_background_params.layer = self._image_panel.layer(self._object) + 1
	slot6 = intel_image_background_params
	self._intel_image_background = self._image_panel.bitmap(self._object, self._image_panel)
	slot9 = self._image_panel
	slot7 = self._image_panel.h(self._image_panel) / 2

	self._intel_image_background.set_center(self._object, self._intel_image_background, self._image_panel.w(slot7) / 2)

	local intel_image_params = {
		texture = "ui/loading_screens/loading_trainyard",
		name = "intel_image",
		texture_rect = {
			256,
			0,
			1536,
			1024
		}
	}
	slot6 = self._intel_image_background
	intel_image_params.w = self._intel_image_background.w(self._intel_image_background) * RaidGUIControlIntelImageDetails.FOREGROUND_SIZE_PERCENTAGE
	slot6 = self._image_panel
	intel_image_params.layer = self._image_panel.layer(RaidGUIControlIntelImageDetails.FOREGROUND_SIZE_PERCENTAGE) + 2
	slot7 = intel_image_params
	self._intel_image = self._image_panel.bitmap(RaidGUIControlIntelImageDetails.FOREGROUND_SIZE_PERCENTAGE, self._image_panel)
	slot9 = self._intel_image
	slot7 = (self._intel_image.w(self._image_panel) * 2) / 3

	self._intel_image.set_h(RaidGUIControlIntelImageDetails.FOREGROUND_SIZE_PERCENTAGE, self._intel_image)

	slot8 = self._image_panel.h(self._image_panel) / 2

	self._intel_image.set_center(RaidGUIControlIntelImageDetails.FOREGROUND_SIZE_PERCENTAGE, self._intel_image, self._image_panel.w(self._image_panel) / 2)

	local intel_title_params = {
		text = "",
		name = "intel_title",
		x = 20,
		wrap = true
	}
	slot8 = self._image_panel
	slot6 = self._image_panel.h(self._image_panel)
	intel_title_params.y = self._image_panel.y(self._intel_image) + slot6 + 32
	intel_title_params.font = tweak_data.gui.fonts.din_compressed
	intel_title_params.font_size = tweak_data.gui.font_sizes.large
	intel_title_params.color = tweak_data.gui.colors.raid_black
	slot8 = intel_title_params
	self._intel_title = self._object.text(slot6, self._object)
	slot7 = self._intel_title
	local _, _, w, h = self._intel_title.text_rect(slot6)
	slot12 = self._object.w(slot13) - self._intel_title.x(self._object) * 2

	self._intel_title.set_w(self._image_panel, self._intel_title)

	slot12 = h

	self._intel_title.set_h(self._image_panel, self._intel_title)

	local intel_subtitle_params = {
		text = "",
		name = "intel_subtitle",
		wrap = true
	}
	slot12 = self._intel_title
	intel_subtitle_params.x = self._intel_title.x(self._intel_title)
	slot13 = self._intel_title
	slot11 = self._intel_title.h(self._intel_title)
	intel_subtitle_params.y = self._intel_title.y(self._intel_title) + slot11 + 12
	intel_subtitle_params.font = tweak_data.gui.fonts.lato
	intel_subtitle_params.font_size = tweak_data.gui.font_sizes.paragraph
	intel_subtitle_params.color = tweak_data.gui.colors.raid_black
	slot13 = intel_subtitle_params
	self._intel_subtitle = self._object.text(slot11, self._object)
	slot12 = self._intel_subtitle
	local _, _, w, h = self._intel_subtitle.text_rect(slot11)
	slot20 = self._intel_subtitle
	slot17 = self._object.w(slot18) - self._intel_subtitle.x(self._object) * 2

	self._intel_subtitle.set_w(self._intel_title, self._intel_subtitle)

	slot20 = self._intel_subtitle
	slot17 = self._object.h(self._intel_subtitle.x(self._object) * 2) - self._intel_subtitle.y(self._object)

	self._intel_subtitle.set_h(self._intel_title, self._intel_subtitle)

	return 
end
function RaidGUIControlIntelImageDetails:set_image(photo, title_id, description_id, skip_animation)
	if skip_animation then
		slot10 = description_id

		self._set_image(slot6, self, photo, title_id)

		return 
	end

	slot7 = self._intel_image

	self._intel_image.stop(slot6)

	slot12 = "_animate_change_photo"
	slot11 = description_id

	self._intel_image.animate(slot6, self._intel_image, callback(slot9, self, self), photo, title_id)

	return 
end
function RaidGUIControlIntelImageDetails:_set_image(photo, title_id, description_id)
	slot7 = tweak_data.gui.mission_photos[photo].texture

	self._intel_image.set_image(slot5, self._intel_image)

	slot6 = self._intel_image
	slot9 = tweak_data.gui.mission_photos[photo].texture_rect

	self._intel_image.set_texture_rect(slot5, unpack(slot8))

	slot6 = self._intel_title
	slot11 = true

	self._intel_title.set_text(slot5, self.translate(slot8, self, title_id))

	slot6 = self._intel_title
	local _, _, w, h = self._intel_title.text_rect(slot5)
	slot14 = self._intel_title
	slot11 = self._object.w(slot12) - self._intel_title.x(self._object) * 2

	self._intel_title.set_w(self, self._intel_title)

	slot11 = h

	self._intel_title.set_h(self, self._intel_title)

	slot10 = self._intel_subtitle
	slot14 = description_id

	self._intel_subtitle.set_text(self, self.translate(self._intel_title.x(self._object) * 2, self))

	slot14 = self._intel_title
	slot11 = self._intel_title.y(self._intel_title.x(self._object) * 2) + self._intel_title.h(self._intel_title) + 12

	self._intel_subtitle.set_y(self, self._intel_subtitle)

	slot14 = self._intel_subtitle
	slot11 = self._object.h(self._intel_title.h(self._intel_title)) - self._intel_subtitle.y(self._object)

	self._intel_subtitle.set_h(self, self._intel_subtitle)

	return 
end
function RaidGUIControlIntelImageDetails:set_left(left)
	slot5 = left

	self._object.set_left(slot3, self._object)

	return 
end
function RaidGUIControlIntelImageDetails:set_right(right)
	slot5 = right

	self._object.set_right(slot3, self._object)

	return 
end
function RaidGUIControlIntelImageDetails:set_top(top)
	slot5 = top

	self._object.set_top(slot3, self._object)

	return 
end
function RaidGUIControlIntelImageDetails:set_bottom(bottom)
	slot5 = bottom

	self._object.set_bottom(slot3, self._object)

	return 
end
function RaidGUIControlIntelImageDetails:set_center_x(center_x)
	slot5 = center_x

	self._object.set_center_x(slot3, self._object)

	return 
end
function RaidGUIControlIntelImageDetails:set_center_y(center_y)
	slot5 = center_y

	self._object.set_center_y(slot3, self._object)

	return 
end
function RaidGUIControlIntelImageDetails:close()
	return 
end
function RaidGUIControlIntelImageDetails:_animate_change_photo(control, photo, title_id, description_id)
	local fade_out_duration = 0.05
	local fade_in_duration = 0.15
	slot9 = self._object
	local t = (1 - self._object.alpha(slot8)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = fade_out_duration
		local alpha = Easing.quartic_in(slot10, t, 1, -1)
		slot13 = alpha

		self._object.set_alpha(t, self._object)
	end

	slot11 = 0

	self._object.set_alpha(slot9, self._object)

	slot13 = description_id

	self._set_image(slot9, self, photo, title_id)

	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = fade_in_duration
		local alpha = Easing.quartic_out(slot10, t, 0, 1)
		slot13 = alpha

		self._object.set_alpha(t, self._object)
	end

	slot11 = 1

	self._object.set_alpha(slot9, self._object)

	return 
end

return 
