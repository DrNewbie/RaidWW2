HUDToastNotification = HUDToastNotification or class()
HUDToastNotification.BACKGROUND_IMAGE = "backgrounds_toast_mission_bg_002"
HUDToastNotification.BORDER_H = 2
HUDToastNotification.BORDER_COLOR = tweak_data.gui.colors.toast_notification_border
HUDToastNotification.TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDToastNotification.TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_24
function HUDToastNotification:init(hud)
	slot5 = "present_panel"

	if hud.panel.child(slot3, hud.panel) then
		slot4 = hud.panel
		slot8 = "present_panel"

		hud.panel.remove(slot3, hud.panel.child(slot6, hud.panel))
	end

	slot5 = hud

	self._create_panel(slot3, self)

	slot4 = self

	self._create_background(slot3)

	slot4 = self

	self._create_text(slot3)

	return 
end
function HUDToastNotification:_create_panel(hud)
	local panel_params = {
		name = "toast_notification_panel",
		visible = false
	}
	slot6 = HUDToastNotification.BACKGROUND_IMAGE
	panel_params.w = tweak_data.gui.icon_w(slot4, tweak_data.gui)
	slot6 = HUDToastNotification.BACKGROUND_IMAGE
	panel_params.h = tweak_data.gui.icon_h(slot4, tweak_data.gui)
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
function HUDToastNotification:_create_background()
	local background_params = {
		name = "background",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[HUDToastNotification.BACKGROUND_IMAGE].texture,
		texture_rect = tweak_data.gui.icons[HUDToastNotification.BACKGROUND_IMAGE].texture_rect
	}
	slot5 = background_params
	self._background = self._object.bitmap(HUDToastNotification.BACKGROUND_IMAGE, self._object)

	return 
end
function HUDToastNotification:_create_text()
	local text_params = {
		vertical = "center",
		name = "text",
		layer = 5,
		align = "center",
		text = "GET THE AMBER WAGON READY TO LIFT IT UP WITH THE CRANE!",
		halign = "center",
		valign = "center",
		font = HUDToastNotification.TEXT_FONT,
		font_size = HUDToastNotification.TEXT_FONT_SIZE
	}
	slot5 = text_params
	self._text = self._object.text(slot3, self._object)
	slot4 = self._text
	local _, _, w, h = self._text.text_rect(slot3)
	slot9 = w

	self._text.set_w(slot7, self._text)

	slot9 = h

	self._text.set_h(slot7, self._text)

	slot11 = self._object
	slot9 = self._object.w(slot10) / 2

	self._text.set_center_x(slot7, self._text)

	slot11 = self._object
	slot9 = self._object.h(slot10) / 2

	self._text.set_center_y(slot7, self._text)

	return 
end
function HUDToastNotification:present(params)
	self._present_queue = self._present_queue or {}

	if self._presenting then
		slot5 = params

		table.insert(slot3, self._present_queue)

		return 
	end

	if params.present_mid_text then
		slot5 = params

		self._present_information(slot3, self)
	end

	return 
end
function HUDToastNotification:cleanup()
	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	return 
end
function HUDToastNotification:_present_information(params)
	slot5 = params.text

	self._set_text(slot3, self)

	slot5 = true

	self._object.set_visible(slot3, self._object)

	slot4 = managers.hud

	managers.hud.hide_objectives(slot3)

	if params.event then
		slot5 = params.event

		managers.hud._sound_source.post_event(slot3, managers.hud._sound_source)
	end

	local present_time = params.time or 4
	slot5 = self._object

	self._object.stop(slot4)

	slot10 = "_animate_present"

	self._object.animate(slot4, self._object, callback(present_time, self, self))

	self._presenting = true

	return 
end
function HUDToastNotification:_set_text(text)
	slot4 = self._text

	self._text.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self._text
	local _, _, w, h = self._text.text_rect(slot3)
	slot9 = w

	self._text.set_w(text, self._text)

	slot9 = h

	self._text.set_h(text, self._text)

	slot11 = self._object
	slot9 = self._object.w(slot10) / 2

	self._text.set_center_x(text, self._text)

	slot11 = self._object
	slot9 = self._object.h(slot10) / 2

	self._text.set_center_y(text, self._text)

	return 
end
function HUDToastNotification:_present_done()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	slot3 = managers.hud

	managers.hud.show_objectives(slot2)

	self._presenting = false
	slot4 = 1
	local queued = table.remove(slot2, self._present_queue)

	if queued and queued.present_mid_text then
		slot4 = setup
		slot10 = queued

		setup.add_end_frame_clbk(slot3, callback(slot6, self, self, "_present_information"))
	end

	return 
end
function HUDToastNotification:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDToastNotification:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDToastNotification:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDToastNotification:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDToastNotification:_animate_present(panel, duration)
	local x_travel = 60
	local fade_in_duration = duration * 0.1
	local sustain_duration = duration * 0.6
	local fade_out_duration = duration * 0.1
	local fade_in_distance = x_travel * 0.38
	local sustain_distance = x_travel * 0.24
	local fade_out_distance = x_travel * 0.38
	local t = 0
	slot14 = 0

	self._background.set_alpha(slot12, self._background)

	slot14 = 0

	self._text.set_alpha(slot12, self._text)

	slot16 = self._object
	slot16 = self._object.parent(slot15)
	slot14 = self._object.parent(slot15).w(slot15) / 2 + x_travel / 2

	self._object.set_center_x(slot12, self._object)

	slot16 = self._object
	slot14 = self._object.w(x_travel / 2) / 2 - x_travel / 2

	self._text.set_center_x(slot12, self._text)

	slot14 = "objective_activated_in"

	managers.hud._sound_source.post_event(slot12, managers.hud._sound_source)

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot18 = fade_in_duration * 0.8
		slot14 = math.clamp(slot15, t - 0.2, 0)
		slot17 = fade_in_duration * 0.8
		local current_alpha = Easing.quadratic_in_out(slot13, slot14, 0, 1)
		slot16 = current_alpha

		self._background.set_alpha(slot14, self._background)

		slot16 = current_alpha

		self._text.set_alpha(slot14, self._text)

		local current_offset = Easing.quartic_in_out(slot14, t, x_travel / 2, -fade_in_distance)
		slot19 = self._object
		slot19 = self._object.parent(fade_in_duration)
		slot17 = self._object.parent(fade_in_duration).w(fade_in_duration) / 2 + current_offset

		self._object.set_center_x(t, self._object)

		slot19 = self._object
		slot17 = self._object.w(fade_in_duration) / 2 - x_travel / 2 - current_offset * 2

		self._text.set_center_x(t, self._text)
	end

	slot14 = 1

	self._background.set_alpha(slot12, self._background)

	slot14 = 1

	self._text.set_alpha(slot12, self._text)

	t = 0

	while t < sustain_duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_offset = Easing.linear(slot13, t, x_travel / 2 - fade_in_distance, -sustain_distance)
		slot18 = self._object
		slot18 = self._object.parent(sustain_duration)
		slot16 = self._object.parent(sustain_duration).w(sustain_duration) / 2 + current_offset

		self._object.set_center_x(t, self._object)

		slot18 = self._object
		slot16 = self._object.w(sustain_duration) / 2 - x_travel / 2 - current_offset * 2

		self._text.set_center_x(t, self._text)
	end

	slot14 = "objective_activated_out"

	managers.hud._sound_source.post_event(slot12, managers.hud._sound_source)

	t = 0

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot17 = fade_out_duration * 0.8
		local current_alpha = Easing.quadratic_in_out(slot13, t, 1, -1)
		slot16 = current_alpha

		self._background.set_alpha(t, self._background)

		slot16 = current_alpha

		self._text.set_alpha(t, self._text)

		local current_offset = Easing.quartic_in_out(t, t, x_travel / 2 - fade_in_distance - sustain_distance, -fade_out_distance)
		slot19 = self._object
		slot19 = self._object.parent(fade_out_duration)
		slot17 = self._object.parent(fade_out_duration).w(fade_out_duration) / 2 + current_offset

		self._object.set_center_x(t, self._object)

		slot19 = self._object
		slot17 = self._object.w(fade_out_duration) / 2 - x_travel / 2 - current_offset * 2

		self._text.set_center_x(t, self._text)
	end

	slot14 = 0

	self._background.set_alpha(slot12, self._background)

	slot14 = 0

	self._text.set_alpha(slot12, self._text)

	slot16 = self._object
	slot16 = self._object.parent(slot15)
	slot14 = self._object.parent(slot15).w(slot15) / 2

	self._object.set_center_x(slot12, self._object)

	slot16 = self._object
	slot14 = self._object.w(slot15) / 2

	self._text.set_center_x(slot12, self._text)

	slot13 = self

	self._present_done(slot12)

	return 
end

return 
