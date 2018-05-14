HUDInteraction = HUDInteraction or class()
function HUDInteraction:init(hud, child_name)
	self._hud_panel = hud.panel
	self._progress_bar_width = 288
	self._progress_bar_height = 8
	slot5 = self._hud_panel
	self._progress_bar_x = self._hud_panel.w(slot4) / 2 - self._progress_bar_width / 2
	slot5 = self._hud_panel
	self._progress_bar_y = self._hud_panel.h(self._progress_bar_width / 2) / 2 + 191
	slot6 = {
		name = "progress_bar_bg",
		layer = 2,
		visible = false,
		x = self._progress_bar_x,
		y = self._progress_bar_y,
		texture = tweak_data.gui.icons.interaction_hold_meter_bg.texture,
		texture_rect = tweak_data.gui.icons.interaction_hold_meter_bg.texture_rect,
		w = self._progress_bar_width,
		h = self._progress_bar_height
	}
	self._progress_bar_bg = self._hud_panel.bitmap(self._progress_bar_width / 2, self._hud_panel)
	self._child_name_text = (child_name or "interact") .. "_text"
	self._child_ivalid_name_text = (child_name or "interact") .. "_invalid_text"
	slot6 = self._child_name_text

	if self._hud_panel.child("_invalid_text", self._hud_panel) then
		slot5 = self._hud_panel
		slot9 = self._child_name_text

		self._hud_panel.remove(slot4, self._hud_panel.child(slot7, self._hud_panel))
	end

	slot6 = self._child_ivalid_name_text

	if self._hud_panel.child(slot4, self._hud_panel) then
		slot5 = self._hud_panel
		slot9 = self._child_ivalid_name_text

		self._hud_panel.remove(slot4, self._hud_panel.child(slot7, self._hud_panel))
	end

	slot6 = {
		layer = 1,
		h = 64,
		font_size = 24,
		align = "center",
		text = "HELLO",
		visible = false,
		valign = "center",
		name = self._child_name_text,
		color = Color.white,
		font = tweak_data.gui.fonts.din_compressed_outlined_24
	}
	local interact_text = self._hud_panel.text(slot4, self._hud_panel)
	slot7 = {
		layer = 3,
		h = 64,
		text = "HELLO",
		font_size = 24,
		align = "center",
		blend_mode = "normal",
		visible = false,
		valign = "center",
		name = self._child_ivalid_name_text,
		color = Color(slot9, 1, 0.3),
		font = tweak_data.gui.fonts.din_compressed_outlined_24
	}
	slot12 = 0.3
	local invalid_text = self._hud_panel.text(self._hud_panel, self._hud_panel)
	slot10 = self._hud_panel
	slot8 = self._hud_panel.h(slot9) / 2 + 200

	interact_text.set_center_y(self._hud_panel, interact_text)

	slot10 = self._hud_panel
	slot8 = self._hud_panel.h(slot9) / 2 + 200

	invalid_text.set_center_y(self._hud_panel, invalid_text)

	self._panels_being_animated = {}

	return 
end
function HUDInteraction:show_interact(data)
	self._prompt_id = nil
	self._saved_text = (data and data.text) or self._saved_text

	if not self._saved_text then
		return 
	end

	slot4 = self

	self.remove_interact(slot3)

	slot2 = utf8.to_upper

	if not self._saved_text then
		slot8 = {
			BTN_INTERACT = managers.localization.btn_macro(slot10, managers.localization)
		}
		slot12 = "interact"
		slot4 = managers.localization.text(slot5, managers.localization, "interact_button_press")
	end

	local text = slot2(slot3)
	slot6 = self._child_name_text
	slot6 = text

	self._hud_panel.child(slot4, self._hud_panel).set_text(slot4, self._hud_panel.child(slot4, self._hud_panel))

	slot6 = self._child_name_text
	slot6 = true

	self._hud_panel.child(slot4, self._hud_panel).set_visible(slot4, self._hud_panel.child(slot4, self._hud_panel))

	if data and data.duration then
		self._prompt_id = data.id
		slot6 = "hud_interaction_prompt_hide"

		if managers.queued_tasks.has_task(slot4, managers.queued_tasks) then
			slot6 = "hud_interaction_prompt_hide"

			managers.queued_tasks.unqueue(slot4, managers.queued_tasks)
		end

		slot11 = nil

		managers.queued_tasks.queue(slot4, managers.queued_tasks, "hud_interaction_prompt_hide", self.hide_prompt, self, self._prompt_id, data.duration)
	end

	return 
end
function HUDInteraction:hide_prompt(id)
	if self._prompt_id == id then
		slot5 = self._child_name_text
		slot5 = false

		self._hud_panel.child(slot3, self._hud_panel).set_visible(slot3, self._hud_panel.child(slot3, self._hud_panel))
	end

	return 
end
function HUDInteraction:remove_interact()
	slot3 = self._hud_panel

	if not alive(slot2) then
		return 
	end

	slot4 = self._child_name_text
	slot4 = false

	self._hud_panel.child(slot2, self._hud_panel).set_visible(slot2, self._hud_panel.child(slot2, self._hud_panel))

	slot4 = self._child_ivalid_name_text
	slot4 = false

	self._hud_panel.child(slot2, self._hud_panel).set_visible(slot2, self._hud_panel.child(slot2, self._hud_panel))

	return 
end
function HUDInteraction:show_interaction_bar(current, total)
	slot5 = self

	self.remove_interact(slot4)

	if self._progress_bar then
		slot5 = self._progress_bar
		slot6 = self._progress_bar

		self._progress_bar.parent(slot4).remove(slot4, self._progress_bar.parent(slot4))

		self._progress_bar = nil
	end

	slot6 = {
		w = 0,
		name = "interaction_progress_bar_show",
		h = 0,
		alpha = 1,
		blend_mode = "normal",
		layer = 3,
		x = self._progress_bar_x,
		y = self._progress_bar_y,
		color = tweak_data.gui.colors.interaction_bar
	}
	self._progress_bar = self._hud_panel.rect(slot4, self._hud_panel)
	slot6 = true

	self._progress_bar_bg.set_visible(slot4, self._progress_bar_bg)

	slot10 = "_animate_interaction_start"
	slot7 = 0.25

	self._progress_bar.animate(slot4, self._progress_bar, callback(tweak_data.gui.colors.interaction_bar, self, self))

	return 
end
function HUDInteraction:set_interaction_bar_width(current, total)
	if not self._progress_bar then
		return 
	end

	local progress = current / total
	slot7 = progress * self._progress_bar_width

	self._progress_bar.set_width(slot5, self._progress_bar)

	return 
end
function HUDInteraction:animate_progress(duration)
	if not self._progress_bar then
		slot6 = duration

		self.show_interaction_bar(slot3, self, 0)
	end

	slot9 = "_animate_interaction_duration"
	self._auto_animation = self._progress_bar.animate(slot3, self._progress_bar, callback(duration, self, self))

	return 
end
function HUDInteraction:hide_interaction_bar(complete, show_interact_at_finish)
	if complete then
		slot6 = {
			name = "interaction_progress_bar_hide",
			alpha = 1,
			blend_mode = "normal",
			layer = 3,
			x = self._progress_bar_x,
			y = self._progress_bar_y,
			w = self._progress_bar_width,
			h = self._progress_bar_height,
			color = Color(slot8, 0.8666666666666667, 0.6039215686274509)
		}
		slot11 = 0.2196078431372549
		local progress_full = self._hud_panel.rect(slot4, self._hud_panel)
		slot6 = progress_full
		slot11 = "_animate_interaction_complete"

		progress_full.animate(self._hud_panel, callback(slot8, self, self))
	end

	if self._progress_bar then
		slot6 = {
			name = "interaction_progress_bar_cancel",
			alpha = 1,
			blend_mode = "normal",
			layer = 3,
			x = self._progress_bar_x,
			y = self._progress_bar_y,
			w = self._progress_bar.w(slot8),
			h = self._progress_bar.h(slot8),
			color = Color(slot8, 0.8666666666666667, 0.6039215686274509)
		}
		slot9 = self._progress_bar
		slot9 = self._progress_bar
		slot11 = 0.2196078431372549
		local progress_cancel = self._hud_panel.rect(slot4, self._hud_panel)
		slot11 = "_animate_interaction_cancel"

		progress_cancel.animate(self._hud_panel, progress_cancel, callback(0.15, self, self))

		slot6 = self._progress_bar

		self._progress_bar.stop(self._hud_panel)

		slot6 = self._progress_bar
		slot7 = self._progress_bar

		self._progress_bar.parent(self._hud_panel).remove(self._hud_panel, self._progress_bar.parent(self._hud_panel))

		slot7 = false

		self._progress_bar_bg.set_visible(self._hud_panel, self._progress_bar_bg)

		self._progress_bar = nil

		if show_interact_at_finish then
			slot6 = self

			self.show_interact(slot5)
		end
	end

	return 
end
function HUDInteraction:set_bar_valid(valid, text_id)
	slot6 = self._child_name_text
	slot6 = valid

	self._hud_panel.child(slot4, self._hud_panel).set_visible(slot4, self._hud_panel.child(slot4, self._hud_panel))

	slot6 = self._child_ivalid_name_text
	local invalid_text = self._hud_panel.child(slot4, self._hud_panel)

	if text_id then
		slot6 = invalid_text
		slot10 = text_id

		invalid_text.set_text(slot5, managers.localization.to_upper_text(slot8, managers.localization))
	end

	slot7 = not valid

	invalid_text.set_visible(slot5, invalid_text)

	return 
end
function HUDInteraction:destroy()
	slot3 = self._hud_panel
	slot7 = self._child_name_text

	self._hud_panel.remove(slot2, self._hud_panel.child(slot5, self._hud_panel))

	slot3 = self._hud_panel
	slot7 = self._child_ivalid_name_text

	self._hud_panel.remove(slot2, self._hud_panel.child(slot5, self._hud_panel))

	slot4 = "hud_interaction_prompt_hide"

	if managers.queued_tasks.has_task(slot2, managers.queued_tasks) then
		slot4 = "hud_interaction_prompt_hide"

		managers.queued_tasks.unqueue(slot2, managers.queued_tasks)
	end

	if self._progress_bar then
		slot3 = self._progress_bar
		slot4 = self._progress_bar

		self._progress_bar.parent(slot2).remove(slot2, self._progress_bar.parent(slot2))

		slot3 = self._pdwrogress_bar_bg
		slot4 = self._progress_bar_bg

		self._pdwrogress_bar_bg.parent(slot2).remove(slot2, self._pdwrogress_bar_bg.parent(slot2))

		self._progress_bar = nil
		self._progress_bar_bg = nil
	end

	return 
end
function HUDInteraction:_animate_interaction_start(progress_bar, duration)
	local t = 0
	slot7 = progress_bar
	self._panels_being_animated[tostring(slot6)] = true

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_height = self._ease_out_quint(slot6, self, t, 0, self._progress_bar_height)
		slot9 = current_height

		progress_bar.set_height(self, progress_bar)

		slot9 = self._progress_bar_y

		progress_bar.set_y(self, progress_bar)
	end

	slot7 = self._progress_bar_height

	progress_bar.set_height(slot5, progress_bar)

	slot7 = progress_bar
	self._panels_being_animated[tostring(progress_bar)] = false

	return 
end
function HUDInteraction:_animate_interaction_duration(progress_bar, duration)
	local t = 0
	slot8 = duration

	self.set_interaction_bar_width(slot5, self, 0)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration

		self.set_interaction_bar_width(slot6, self, t)
	end

	slot8 = duration

	self.set_interaction_bar_width(slot5, self, duration)

	return 
end
function HUDInteraction:_animate_interaction_cancel(progress_bar, duration)
	local t = 0
	slot6 = progress_bar
	local start_height = progress_bar.h(slot5)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = duration
		local current_height = self._ease_in_quint(slot7, self, t, start_height, -start_height)
		slot10 = current_height

		progress_bar.set_height(self, progress_bar)

		slot10 = self._progress_bar_y

		progress_bar.set_y(self, progress_bar)
	end

	slot8 = 0

	progress_bar.set_height(slot6, progress_bar)

	slot7 = progress_bar
	slot8 = progress_bar

	progress_bar.parent(slot6).remove(slot6, progress_bar.parent(slot6))

	return 
end
function HUDInteraction:_animate_interaction_complete(progress_bar)
	local duration = 0.5
	local t = 0
	slot7 = "right"

	progress_bar.set_halign(slot5, progress_bar)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_width = self._ease_out_quint(slot6, self, t, self._progress_bar_width, -self._progress_bar_width)
		slot9 = current_width

		progress_bar.set_width(self, progress_bar)

		slot11 = self._hud_panel
		slot9 = self._hud_panel.w(-self._progress_bar_width) / 2 + self._progress_bar_width / 2

		progress_bar.set_right(self, progress_bar)
	end

	slot7 = 0

	progress_bar.set_width(slot5, progress_bar)

	slot6 = progress_bar
	slot7 = progress_bar

	progress_bar.parent(slot5).remove(slot5, progress_bar.parent(slot5))

	return 
end
function HUDInteraction:ease_in_out_multiple(t, starting_value, change, duration)
	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t + starting_value
	end

	t = t - 1

	return -change / 2 * (t * (t - 2) - 1) + starting_value
end
function HUDInteraction:_ease_in_quart(t, starting_value, change, duration)
	t = t / duration

	return change * t * t * t * t + starting_value
end
function HUDInteraction:_ease_in_quint(t, starting_value, change, duration)
	t = t / duration

	return change * t * t * t * t * t + starting_value
end
function HUDInteraction:_ease_out_quint(t, starting_value, change, duration)
	t = t / duration
	t = t - 1

	return change * (t * t * t * t * t + 1) + starting_value
end

return 
