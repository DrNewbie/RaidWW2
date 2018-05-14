HUDCenterPrompt = HUDCenterPrompt or class()
HUDCenterPrompt.W = 320
HUDCenterPrompt.H = 96
HUDCenterPrompt.TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDCenterPrompt.TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_24
function HUDCenterPrompt:init(hud)
	slot5 = hud

	self._create_panel(slot3, self)

	slot4 = self

	self._create_text(slot3)

	return 
end
function HUDCenterPrompt:_create_panel(hud)
	local panel_params = {
		name = "center_prompt_panel",
		halign = "center",
		valign = "center",
		w = HUDCenterPrompt.W,
		h = HUDCenterPrompt.H
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
function HUDCenterPrompt:_create_text()
	local text_params = {
		vertical = "center",
		name = "center_prompt_text",
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
	text_params.font = HUDCenterPrompt.TEXT_FONT
	text_params.font_size = HUDCenterPrompt.TEXT_FONT_SIZE
	slot5 = text_params
	self._text = self._object.text(slot3, self._object)

	return 
end
function HUDCenterPrompt:show_prompt(id, text, duration)
	if self._active_id == id then
		if duration then
			slot7 = "HUDCenterPrompt:hide"

			managers.queued_tasks.unqueue(slot5, managers.queued_tasks)

			slot12 = nil

			managers.queued_tasks.queue(slot5, managers.queued_tasks, "HUDCenterPrompt:hide", self.hide_prompt, self, {
				id
			}, duration)
		end

		return 
	end

	slot6 = self._text

	self._text.stop(slot5)

	slot11 = "_animate_change_prompt"
	slot9 = id

	self._text.animate(slot5, self._text, callback(slot8, self, self), text)

	if duration then
		slot12 = nil

		managers.queued_tasks.queue(slot5, managers.queued_tasks, "HUDCenterPrompt:hide", self.hide_prompt, self, {
			id
		}, duration)
	end

	return 
end
function HUDCenterPrompt:hide_prompt(id)
	slot4 = self._text

	self._text.stop(slot3)

	slot4 = self._text
	slot9 = "_animate_hide"

	self._text.animate(slot3, callback(slot6, self, self))

	self._active_id = nil

	return 
end
function HUDCenterPrompt:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDCenterPrompt:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDCenterPrompt:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDCenterPrompt:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDCenterPrompt:_animate_change_prompt(text_control, text, id)
	local fade_out_duration = 0.2
	local fade_in_duration = 0.3
	slot8 = self._text
	local t = (1 - self._text.alpha(slot7)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot9, t, 1, -1)
		slot12 = current_alpha

		self._text.set_alpha(t, self._text)
	end

	slot10 = 0

	self._text.set_alpha(slot8, self._text)

	if self._hidden_id == id then
		self._hidden_id = nil

		return 
	end

	slot10 = text

	self._text.set_text(slot8, self._text)

	self._active_id = id
	self._hidden_id = nil
	t = 0

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot9, t, 0, 1)
		slot12 = current_alpha

		self._text.set_alpha(t, self._text)
	end

	slot10 = 1

	self._text.set_alpha(slot8, self._text)

	return 
end
function HUDCenterPrompt:_animate_hide()
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
	end

	slot6 = 0

	self._text.set_alpha(slot4, self._text)

	return 
end

return 
