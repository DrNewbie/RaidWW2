HUDBigPrompt = HUDBigPrompt or class()
HUDBigPrompt.W = 416
HUDBigPrompt.H = 96
HUDBigPrompt.TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDBigPrompt.TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDBigPrompt.DEFAULT_TEXT_COLOR = tweak_data.gui.colors.light_grey
HUDBigPrompt.DEFAULT_BACKGROUND = "backgrounds_equipment_panel_msg"
function HUDBigPrompt:init(hud)
	slot5 = hud

	self._create_panel(slot3, self)

	slot4 = self

	self._create_background(slot3)

	slot4 = self

	self._create_text(slot3)

	return 
end
function HUDBigPrompt:_create_panel(hud)
	local panel_params = {
		name = "big_prompt_panel",
		halign = "center",
		valign = "center",
		w = HUDBigPrompt.W,
		h = HUDBigPrompt.H
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
function HUDBigPrompt:_create_background()
	local background_params = {
		name = "big_prompt_background",
		layer = 1,
		alpha = 0,
		texture = tweak_data.gui.icons[HUDBigPrompt.DEFAULT_BACKGROUND].texture,
		texture_rect = tweak_data.gui.icons[HUDBigPrompt.DEFAULT_BACKGROUND].texture_rect
	}
	slot5 = background_params
	self._background = self._object.bitmap(HUDBigPrompt.DEFAULT_BACKGROUND, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._background.set_center_x(HUDBigPrompt.DEFAULT_BACKGROUND, self._background)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._background.set_center_y(HUDBigPrompt.DEFAULT_BACKGROUND, self._background)

	return 
end
function HUDBigPrompt:_create_text()
	local text_params = {
		vertical = "center",
		name = "big_prompt_text",
		align = "center",
		alpha = 0,
		text = "",
		halign = "scale",
		valign = "scale"
	}
	slot4 = self._object
	text_params.w = self._object.w(slot3)
	slot4 = self._object
	text_params.h = self._object.h(slot3)
	text_params.font = HUDBigPrompt.TEXT_FONT
	text_params.font_size = HUDBigPrompt.TEXT_FONT_SIZE
	slot4 = self._background
	text_params.layer = self._background.layer(slot3) + 1
	slot5 = text_params
	self._text = self._object.text(slot3, self._object)

	return 
end
function HUDBigPrompt:show_prompt(params)
	if self._active_id == params.id then
		if params.duration then
			slot5 = "HUDBigPrompt:hide"

			managers.queued_tasks.unqueue(slot3, managers.queued_tasks)

			slot11 = true

			managers.queued_tasks.queue(slot3, managers.queued_tasks, "HUDBigPrompt:hide", self.hide_prompt, self, {
				params.id
			}, params.duration, nil)
		end

		return 
	end

	slot4 = self._text

	self._text.stop(slot3)

	slot9 = "_animate_change_prompt"
	slot9 = params.background

	self._text.animate(slot3, self._text, callback(slot6, self, self), params.text, params.id, params.text_color)

	if params.duration then
		slot11 = true

		managers.queued_tasks.queue(slot3, managers.queued_tasks, "HUDBigPrompt:hide", self.hide_prompt, self, {
			params.id
		}, params.duration, nil)
	end

	return 
end
function HUDBigPrompt:hide_prompt(id)
	slot4 = self._text

	self._text.stop(slot3)

	slot4 = self._text
	slot9 = "_animate_hide"

	self._text.animate(slot3, callback(slot6, self, self))

	self._active_id = nil

	return 
end
function HUDBigPrompt:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDBigPrompt:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDBigPrompt:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDBigPrompt:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDBigPrompt:_animate_change_prompt(text_control, text, id, text_color, background)
	local fade_out_duration = 0.2
	local fade_in_duration = 0.3
	slot10 = self._text
	local t = (1 - self._text.alpha(slot9)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot15 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot11, t, 1, -1)
		slot14 = current_alpha

		self._text.set_alpha(t, self._text)

		slot14 = current_alpha

		self._background.set_alpha(t, self._background)
	end

	slot12 = 0

	self._text.set_alpha(slot10, self._text)

	slot12 = 0

	self._background.set_alpha(slot10, self._background)

	if self._hidden_id == id then
		self._hidden_id = nil

		return 
	end

	slot12 = text

	self._text.set_text(slot10, self._text)

	if text_color then
		slot12 = text_color

		self._text.set_color(slot10, self._text)
	else
		slot12 = HUDBigPrompt.DEFAULT_TEXT_COLOR

		self._text.set_color(slot10, self._text)
	end

	if background then
		slot12 = tweak_data.gui.icons[background].texture

		self._background.set_image(slot10, self._background)

		slot11 = self._background
		slot14 = tweak_data.gui.icons[background].texture_rect

		self._background.set_texture_rect(slot10, unpack(slot13))
	else
		slot12 = tweak_data.gui.icons[HUDBigPrompt.DEFAULT_BACKGROUND].texture

		self._background.set_image(slot10, self._background)

		slot11 = self._background
		slot14 = tweak_data.gui.icons[HUDBigPrompt.DEFAULT_BACKGROUND].texture_rect

		self._background.set_texture_rect(slot10, unpack(HUDBigPrompt.DEFAULT_BACKGROUND))
	end

	slot14 = self._object
	slot12 = self._object.w(slot13) / 2

	self._background.set_center_x(slot10, self._background)

	slot14 = self._object
	slot12 = self._object.h(slot13) / 2

	self._background.set_center_y(slot10, self._background)

	self._active_id = id
	self._hidden_id = nil
	t = 0

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot15 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot11, t, 0, 1)
		slot14 = current_alpha

		self._text.set_alpha(t, self._text)

		slot14 = current_alpha

		self._background.set_alpha(t, self._background)
	end

	slot12 = 1

	self._text.set_alpha(slot10, self._text)

	slot12 = 1

	self._background.set_alpha(slot10, self._background)

	return 
end
function HUDBigPrompt:_animate_hide()
	local fade_out_duration = 0.2
	slot4 = self._text
	local t = (1 - self._text.alpha(slot3)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot5, t, 1, -1)
		slot8 = current_alpha

		self._text.set_alpha(t, self._text)

		slot8 = current_alpha

		self._background.set_alpha(t, self._background)
	end

	slot6 = 0

	self._text.set_alpha(slot4, self._text)

	slot6 = 0

	self._background.set_alpha(slot4, self._background)

	return 
end

return 
