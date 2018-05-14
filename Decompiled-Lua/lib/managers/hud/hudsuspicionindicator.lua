-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDSuspicionIndicator = HUDSuspicionIndicator or class()
HUDSuspicionIndicator.W = 72
HUDSuspicionIndicator.H = 72
slot4 = "ececec"
slot4 = "ececec"
slot4 = "dd9a38"
slot4 = "b8392e"
slot4 = "b8392e"
HUDSuspicionIndicator.STATE_COLORS = {
	heard_something = Color(slot3),
	saw_something = Color(slot3),
	investigating = Color(slot3),
	alarmed = Color(slot3),
	calling = Color(slot3)
}
HUDSuspicionIndicator.EYE_BG_ICON = "stealth_eye_bg"
HUDSuspicionIndicator.EYE_OUTER_RING_ICON = "stealth_eye_out"
HUDSuspicionIndicator.EYE_FILL_ICON = "stealth_eye_fill"
HUDSuspicionIndicator.CALLING_INDICATOR_CENTER_ICON = "stealth_alarm_icon"
HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN = "stealth_alarm_in"
HUDSuspicionIndicator.CALLING_INDICATOR_ICON_OUT = "stealth_alarm_out"
HUDSuspicionIndicator.PLAYER_ACTIVE_ALPHA = 1
HUDSuspicionIndicator.TEAMMATE_ACTIVE_ALPHA = 0.6
function HUDSuspicionIndicator:init(hud, data)
	self._observer = data.unit
	self._suspect = data.suspect
	self._observer_position = data.position
	self._progress = 0
	self._onscreen = true
	self._active_alpha = (HUDManager.DIFFERENT_SUSPICION_INDICATORS_FOR_TEAMMATES == true and (data.suspect == "teammate" or data.suspect == nil) and HUDSuspicionIndicator.TEAMMATE_ACTIVE_ALPHA) or HUDSuspicionIndicator.PLAYER_ACTIVE_ALPHA
	slot6 = hud

	self._create_panel(slot4, self)

	slot5 = self

	self._create_eye_background(slot4)

	slot5 = self

	self._create_eye_outside_ring(slot4)

	slot5 = self

	self._create_eye_fill(slot4)

	slot5 = self

	self._create_calling_indicator(slot4)

	slot5 = self

	self._init_public_properties(slot4)
	self.set_state(slot4, self, data.state or "heard_something")

	slot10 = "_animate_create"
	slot7 = 0.4

	self._object.animate(slot4, self._object, callback(true, self, self))

	return 
end
function HUDSuspicionIndicator:_init_public_properties()
	self.in_timer = 1
	self.out_timer = 0
	self.current_position = Vector3()
	slot4 = self._observer_position

	mvector3.set(slot2, self.current_position)

	return 
end
function HUDSuspicionIndicator:_create_panel(hud)
	local panel_params = {
		name = "suspicion_indicator",
		alpha = 0,
		w = HUDSuspicionIndicator.W,
		h = HUDSuspicionIndicator.H
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
function HUDSuspicionIndicator:_create_eye_background()
	local eye_panel_params = {
		halign = "scale",
		name = "eye_panel",
		valign = "scale"
	}
	slot5 = eye_panel_params
	self._eye_panel = self._object.panel(slot3, self._object)
	local eye_background_params = {
		name = "eye_background",
		texture = tweak_data.gui.icons[HUDSuspicionIndicator.EYE_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDSuspicionIndicator.EYE_BG_ICON].texture_rect
	}
	slot5 = self._object
	eye_background_params.layer = self._object.layer(HUDSuspicionIndicator.EYE_BG_ICON) + 1
	slot6 = eye_background_params
	self._eye_background = self._eye_panel.bitmap(HUDSuspicionIndicator.EYE_BG_ICON, self._eye_panel)
	slot9 = self._eye_panel

	self._eye_background.set_center(HUDSuspicionIndicator.EYE_BG_ICON, self._eye_background, self._eye_panel.w(self._eye_panel.h(self._eye_panel) / 2) / 2)

	return 
end
function HUDSuspicionIndicator:_create_eye_outside_ring()
	local eye_outside_ring_params = {
		name = "eye_outside_ring",
		texture = tweak_data.gui.icons[HUDSuspicionIndicator.EYE_OUTER_RING_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDSuspicionIndicator.EYE_OUTER_RING_ICON].texture_rect
	}
	slot4 = self._eye_background
	eye_outside_ring_params.layer = self._eye_background.layer(HUDSuspicionIndicator.EYE_OUTER_RING_ICON) + 1
	slot5 = eye_outside_ring_params
	self._eye_outside_ring = self._eye_panel.bitmap(HUDSuspicionIndicator.EYE_OUTER_RING_ICON, self._eye_panel)
	slot4 = self._eye_outside_ring
	slot7 = self._eye_background

	self._eye_outside_ring.set_center(HUDSuspicionIndicator.EYE_OUTER_RING_ICON, self._eye_background.center(slot6))

	return 
end
function HUDSuspicionIndicator:_create_eye_fill()
	local eye_fill_params = {
		name = "eye_fill",
		position_z = 0,
		render_template = "VertexColorTexturedRadial",
		texture = tweak_data.gui.icons[HUDSuspicionIndicator.EYE_FILL_ICON].texture
	}
	slot6 = HUDSuspicionIndicator.EYE_FILL_ICON
	slot6 = HUDSuspicionIndicator.EYE_FILL_ICON
	eye_fill_params.texture_rect = {
		tweak_data.gui.icon_w(slot4, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(slot4, tweak_data.gui),
		tweak_data.gui.icon_h(slot4, tweak_data.gui)
	}
	slot5 = HUDSuspicionIndicator.EYE_FILL_ICON
	eye_fill_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot5 = HUDSuspicionIndicator.EYE_FILL_ICON
	eye_fill_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot4 = self._eye_background
	eye_fill_params.layer = self._eye_background.layer(tweak_data.gui.icon_h) + 1
	slot5 = eye_fill_params
	self._eye_fill = self._eye_panel.bitmap(tweak_data.gui.icon_h, self._eye_panel)
	slot4 = self._eye_fill
	slot7 = self._eye_background

	self._eye_fill.set_center(tweak_data.gui.icon_h, self._eye_background.center(HUDSuspicionIndicator.EYE_FILL_ICON))

	return 
end
function HUDSuspicionIndicator:_create_calling_indicator()
	local calling_indicator_panel_params = {
		halign = "scale",
		name = "calling_indicator_panel",
		valign = "scale"
	}
	slot5 = calling_indicator_panel_params
	self._calling_indicator_panel = self._object.panel(slot3, self._object)
	self._calling_indicators = {}
	local phone_icon_params = {
		name = "calling_indicator_phone",
		alpha = 0,
		texture = tweak_data.gui.icons[HUDSuspicionIndicator.CALLING_INDICATOR_CENTER_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDSuspicionIndicator.CALLING_INDICATOR_CENTER_ICON].texture_rect
	}
	slot6 = phone_icon_params
	local phone_icon = self._calling_indicator_panel.bitmap(HUDSuspicionIndicator.CALLING_INDICATOR_CENTER_ICON, self._calling_indicator_panel)
	slot9 = self._calling_indicator_panel
	slot7 = self._calling_indicator_panel.w(slot8) / 2

	phone_icon.set_center_x(self._calling_indicator_panel, phone_icon)

	slot9 = self._calling_indicator_panel
	slot7 = self._calling_indicator_panel.h(slot8) / 2

	phone_icon.set_center_y(self._calling_indicator_panel, phone_icon)

	local calling_icon_in_params = {
		name = "calling_indicator_in",
		alpha = 0,
		texture = tweak_data.gui.icons[HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN].texture,
		texture_rect = tweak_data.gui.icons[HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN].texture_rect
	}
	slot8 = calling_icon_in_params
	local calling_icon_in = self._calling_indicator_panel.bitmap(HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN, self._calling_indicator_panel)
	slot11 = self._calling_indicator_panel
	slot9 = self._calling_indicator_panel.w(slot10) / 2

	calling_icon_in.set_center_x(self._calling_indicator_panel, calling_icon_in)

	slot11 = self._calling_indicator_panel
	slot9 = self._calling_indicator_panel.h(slot10) / 2

	calling_icon_in.set_center_y(self._calling_indicator_panel, calling_icon_in)

	local calling_icon_out_params = {
		name = "calling_indicator_out",
		alpha = 0,
		texture = tweak_data.gui.icons[HUDSuspicionIndicator.CALLING_INDICATOR_ICON_OUT].texture,
		texture_rect = tweak_data.gui.icons[HUDSuspicionIndicator.CALLING_INDICATOR_ICON_OUT].texture_rect
	}
	slot10 = calling_icon_out_params
	local calling_icon_out = self._calling_indicator_panel.bitmap(HUDSuspicionIndicator.CALLING_INDICATOR_ICON_OUT, self._calling_indicator_panel)
	slot13 = self._calling_indicator_panel
	slot11 = self._calling_indicator_panel.w(slot12) / 2

	calling_icon_out.set_center_x(self._calling_indicator_panel, calling_icon_out)

	slot13 = self._calling_indicator_panel
	slot11 = self._calling_indicator_panel.h(slot12) / 2

	calling_icon_out.set_center_y(self._calling_indicator_panel, calling_icon_out)

	slot11 = phone_icon

	table.insert(self._calling_indicator_panel, self._calling_indicators)

	slot11 = calling_icon_in

	table.insert(self._calling_indicator_panel, self._calling_indicators)

	slot11 = calling_icon_out

	table.insert(self._calling_indicator_panel, self._calling_indicators)

	return 
end
function HUDSuspicionIndicator:observer_position()
	return self._observer_position
end
function HUDSuspicionIndicator:suspect()
	return self._suspect
end
function HUDSuspicionIndicator:set_progress(progress)
	if progress == self._progress then
		return 
	end

	if self._old_progress and progress < self._old_progress then
		if self._current_progress then
		end
	else
		self._old_progress = self._progress
		self._cdt = 0
	end

	slot6 = 1
	self._progress = math.clamp(slot3, progress, 0)

	return 
end
function HUDSuspicionIndicator:update_progress(t, dt)
	if self._progress and self._progress == 1 then
		slot6 = 1

		self._eye_fill.set_position_z(slot4, self._eye_fill)

		return 
	end

	if not self._old_progress or self._old_progress == 0 then
		slot6 = 0

		self._eye_fill.set_position_z(slot4, self._eye_fill)

		return 
	end

	slot7 = self._cdt
	self._current_progress = math.lerp(slot4, self._old_progress, self._progress)
	slot6 = self._current_progress

	self._eye_fill.set_position_z(slot4, self._eye_fill)

	self._cdt = self._cdt + dt

	return 
end
function HUDSuspicionIndicator:active_alpha()
	return self._active_alpha
end
function HUDSuspicionIndicator:state()
	return self._state
end
function HUDSuspicionIndicator:set_state(state, dont_animate)
	if self._state == state then
		return 
	end

	if state == "heard_something" then
	elseif state == "saw_something" then
		slot5 = self

		self.set_state_saw_something(slot4)
	elseif state == "investigating" then
		slot5 = self

		self.set_state_investigating(slot4)
	elseif state == "alarmed" then
		slot5 = self

		self.set_state_alarmed(slot4)
	elseif state == "calling" then
		slot5 = self

		self.set_state_calling(slot4)
	end

	local color_change_occured = HUDSuspicionIndicator.STATE_COLORS[state] and (not HUDSuspicionIndicator.STATE_COLORS[self._state] or HUDSuspicionIndicator.STATE_COLORS[self._state] ~= HUDSuspicionIndicator.STATE_COLORS[state])

	if color_change_occured then
		if dont_animate then
			slot7 = HUDSuspicionIndicator.STATE_COLORS[state]

			self._eye_fill.set_color(slot5, self._eye_fill)

			slot7 = HUDSuspicionIndicator.STATE_COLORS[state]

			self._eye_outside_ring.set_color(slot5, self._eye_outside_ring)
		else
			slot6 = self

			self._rotate_eye_ring(slot5)

			slot7 = HUDSuspicionIndicator.STATE_COLORS[state]

			self._change_color(slot5, self)
		end
	end

	self._state = state
	slot6 = Network

	if Network.is_server(slot5) then
		slot6 = managers.network
		slot10 = self._observer

		managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "set_hud_suspicion_state", self._observer.id(state))
	end

	return 
end
function HUDSuspicionIndicator:_rotate_eye_ring()
	if self._rotating_ring then
		return 
	end

	slot3 = self._eye_background

	self._eye_background.stop(slot2)

	slot3 = self._eye_background
	slot8 = "_animate_ring_rotate"

	self._eye_background.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDSuspicionIndicator:_change_color(new_color)
	slot4 = self._eye_fill

	self._eye_fill.stop(slot3)

	slot9 = "_animate_color_change"

	self._eye_fill.animate(slot3, self._eye_fill, callback(new_color, self, self))

	return 
end
function HUDSuspicionIndicator:set_state_saw_something()
	return 
end
function HUDSuspicionIndicator:set_state_investigating()
	return 
end
function HUDSuspicionIndicator:set_state_alarmed()
	return 
end
function HUDSuspicionIndicator:set_state_calling()
	slot3 = self._eye_panel
	slot8 = "_animate_hide_suspicion"

	self._eye_panel.animate(slot2, callback(slot5, self, self))

	slot3 = self._calling_indicators[1]

	self._calling_indicators[1].stop(slot2)

	slot8 = "_animate_create"
	slot7 = 1

	self._calling_indicators[1].animate(slot2, self._calling_indicators[1], callback(slot5, self, self), 0.5, 0.2)

	slot3 = self._calling_indicators[2]

	self._calling_indicators[2].stop(slot2)

	slot8 = "_animate_indicator_calling"

	self._calling_indicators[2].animate(slot2, self._calling_indicators[2], callback(0.5, self, self))

	slot3 = self._calling_indicators[3]

	self._calling_indicators[3].stop(slot2)

	slot8 = "_animate_indicator_calling"
	slot5 = 0.8

	self._calling_indicators[3].animate(slot2, self._calling_indicators[3], callback(0.4, self, self))

	return 
end
function HUDSuspicionIndicator:set_center(x, y)
	slot7 = y

	self._object.set_center(slot4, self._object, x)

	return 
end
function HUDSuspicionIndicator:destroy()
	slot3 = self._object

	if alive(slot2) then
		slot3 = self._object

		self._object.stop(slot2)

		slot3 = self

		self._destroy(slot2)
	end

	return 
end
function HUDSuspicionIndicator:set_alpha(alpha)
	slot5 = alpha

	self._object.set_alpha(slot3, self._object)

	return 
end
function HUDSuspicionIndicator:alpha()
	slot3 = self._object

	return self._object.alpha(slot2)
end
function HUDSuspicionIndicator:go_offscreen()
	self._onscreen = false

	return 
end
function HUDSuspicionIndicator:go_onscreen()
	self._onscreen = true

	return 
end
function HUDSuspicionIndicator:onscreen()
	return self._onscreen
end
function HUDSuspicionIndicator:parent()
	slot3 = self._object

	return self._object.parent(slot2)
end
function HUDSuspicionIndicator:_destroy()
	slot3 = self._eye_panel

	self._eye_panel.stop(slot2)

	slot3 = self._calling_indicators[1]

	self._calling_indicators[1].stop(slot2)

	slot3 = self._calling_indicators[2]

	self._calling_indicators[2].stop(slot2)

	slot3 = self._calling_indicators[3]

	self._calling_indicators[3].stop(slot2)

	slot3 = self._object

	self._object.clear(slot2)

	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	self._data = nil
	self._state = nil
	self._progress = nil
	self._onscreen = nil

	return 
end
function HUDSuspicionIndicator:_get_color_for_percentage(color_table, percentage)
	for i = #color_table, 1, -1 do
		if color_table[i].start_percentage < percentage then
			return color_table[i].color
		end
	end

	return color_table[1].color
end
function HUDSuspicionIndicator:_animate_ring_rotate(background)
	local t = 0
	local rotation_duration = 0.8
	self._rotating_ring = true
	local starting_rotation = self._eye_background.rotation(slot5)
	slot7 = starting_rotation / 180
	local wanted_rotation = (math.ceil(self._eye_background) - 1) * 180

	while t < rotation_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = rotation_duration
		local current_rotation = Easing.quartic_in_out(slot8, t, starting_rotation, wanted_rotation - starting_rotation)
		slot11 = current_rotation

		self._eye_background.set_rotation(t, self._eye_background)

		slot11 = current_rotation

		self._eye_outside_ring.set_rotation(t, self._eye_outside_ring)
	end

	slot9 = wanted_rotation

	self._eye_background.set_rotation(slot7, self._eye_background)

	slot9 = wanted_rotation

	self._eye_outside_ring.set_rotation(slot7, self._eye_outside_ring)

	self._rotating_ring = false

	return 
end
function HUDSuspicionIndicator:_animate_color_change(eye_fill, new_color)
	local t = 0
	local color_change_duration = 0.8
	slot7 = self._eye_fill
	local starting_color = self._eye_fill.color(slot6)

	while t < color_change_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = color_change_duration
		local current_r = Easing.quadratic_in_out(slot8, t, starting_color.r, new_color.r - starting_color.r)
		slot13 = color_change_duration
		local current_g = Easing.quadratic_in_out(t, t, starting_color.g, new_color.g - starting_color.g)
		local current_b = Easing.quadratic_in_out(t, t, starting_color.b, new_color.b - starting_color.b)
		slot12 = self._eye_fill
		slot17 = current_b

		self._eye_fill.set_color(t, Color(color_change_duration, current_r, current_g))

		slot12 = self._eye_outside_ring
		slot17 = current_b

		self._eye_outside_ring.set_color(t, Color(color_change_duration, current_r, current_g))
	end

	slot9 = new_color

	self._eye_fill.set_color(slot7, self._eye_fill)

	slot9 = new_color

	self._eye_outside_ring.set_color(slot7, self._eye_outside_ring)

	return 
end
function HUDSuspicionIndicator:_animate_hide_suspicion()
	local duration = 0.25
	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_in_out(slot5, t, self._active_alpha, -self._active_alpha)
		slot8 = current_alpha

		self._eye_panel.set_alpha(t, self._eye_panel)
	end

	slot6 = 0

	self._eye_panel.set_alpha(slot4, self._eye_panel)

	return 
end
function HUDSuspicionIndicator:_animate_indicator_calling(indicator, delay)
	while true do
		local final_size_multiplier = 1.3
		local fade_in_duration = 0.4
		slot7 = indicator
		local visible_sustain = indicator.alpha(slot6) * fade_in_duration
		local fade_out_duration = 0.4
		local invisible_sustain = 0.5
		local total_duration = fade_in_duration + visible_sustain + fade_out_duration
		local t = 0
		local total_t = 0

		if delay then
			slot13 = delay

			wait(slot12)

			total_duration = total_duration + delay
			total_t = total_t + delay
		end

		slot13 = indicator
		slot17 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN

		indicator.set_w(slot12, tweak_data.gui.icon_w(slot15, tweak_data.gui))

		slot13 = indicator
		slot17 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN

		indicator.set_h(slot12, tweak_data.gui.icon_h(slot15, tweak_data.gui))

		slot16 = self._calling_indicator_panel
		slot14 = self._calling_indicator_panel.w(slot15) / 2

		indicator.set_center_x(slot12, indicator)

		slot16 = self._calling_indicator_panel
		slot14 = self._calling_indicator_panel.h(slot15) / 2

		indicator.set_center_y(slot12, indicator)

		while t < fade_in_duration do
			local dt = coroutine.yield()
			t = t + dt
			total_t = total_t + dt
			slot17 = fade_in_duration
			local current_alpha = Easing.quadratic_in_out(slot13, t, 0, 1)
			slot16 = current_alpha

			indicator.set_alpha(t, indicator)

			local current_size = Easing.quadratic_in(t, total_t, 1, final_size_multiplier - 1)
			slot20 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN
			slot17 = tweak_data.gui.icon_w(total_duration, tweak_data.gui) * current_size

			indicator.set_w(total_t, indicator)

			slot20 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN
			slot17 = tweak_data.gui.icon_h(total_duration, tweak_data.gui) * current_size

			indicator.set_h(total_t, indicator)

			slot19 = self._calling_indicator_panel
			slot17 = self._calling_indicator_panel.w(total_duration) / 2

			indicator.set_center_x(total_t, indicator)

			slot19 = self._calling_indicator_panel
			slot17 = self._calling_indicator_panel.h(total_duration) / 2

			indicator.set_center_y(total_t, indicator)
		end

		slot14 = 1

		indicator.set_alpha(slot12, indicator)

		t = 0

		while t < visible_sustain do
			local dt = coroutine.yield()
			t = t + dt
			total_t = total_t + dt
			local current_size = Easing.quadratic_in(slot13, total_t, 1, final_size_multiplier - 1)
			slot19 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN
			slot16 = tweak_data.gui.icon_w(total_duration, tweak_data.gui) * current_size

			indicator.set_w(total_t, indicator)

			slot19 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN
			slot16 = tweak_data.gui.icon_h(total_duration, tweak_data.gui) * current_size

			indicator.set_h(total_t, indicator)

			slot18 = self._calling_indicator_panel
			slot16 = self._calling_indicator_panel.w(total_duration) / 2

			indicator.set_center_x(total_t, indicator)

			slot18 = self._calling_indicator_panel
			slot16 = self._calling_indicator_panel.h(total_duration) / 2

			indicator.set_center_y(total_t, indicator)
		end

		t = 0

		while t < fade_out_duration do
			local dt = coroutine.yield()
			t = t + dt
			total_t = total_t + dt
			slot17 = fade_out_duration
			local current_alpha = Easing.quadratic_in_out(slot13, t, 1, -1)
			slot16 = current_alpha

			indicator.set_alpha(t, indicator)

			local current_size = Easing.quadratic_in(t, total_t, 1, final_size_multiplier - 1)
			slot20 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN
			slot17 = tweak_data.gui.icon_w(total_duration, tweak_data.gui) * current_size

			indicator.set_w(total_t, indicator)

			slot20 = HUDSuspicionIndicator.CALLING_INDICATOR_ICON_IN
			slot17 = tweak_data.gui.icon_h(total_duration, tweak_data.gui) * current_size

			indicator.set_h(total_t, indicator)

			slot19 = self._calling_indicator_panel
			slot17 = self._calling_indicator_panel.w(total_duration) / 2

			indicator.set_center_x(total_t, indicator)

			slot19 = self._calling_indicator_panel
			slot17 = self._calling_indicator_panel.h(total_duration) / 2

			indicator.set_center_y(total_t, indicator)
		end

		slot14 = 0

		indicator.set_alpha(slot12, indicator)

		slot13 = invisible_sustain

		wait(slot12)
	end

	return 
end
function HUDSuspicionIndicator:_animate_destroy()
	local duration = 0.3
	slot4 = self._object
	local t = (1 - self._object.alpha(slot3) / self._active_alpha) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_in_out(slot5, t, self._active_alpha, -self._active_alpha)
		slot8 = current_alpha

		self._object.set_alpha(t, self._object)
	end

	slot6 = 0

	self._object.set_alpha(slot4, self._object)

	slot5 = self

	self._destroy(slot4)

	return 
end
function HUDSuspicionIndicator:_animate_create(object, fade_in_duration, delay, new_alpha)
	local duration = fade_in_duration or 0.15
	local t = 0

	if delay then
		slot9 = delay

		wait(slot8)
	end

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local current_alpha = Easing.quartic_in_out(slot9, t, 0, new_alpha or self._active_alpha)
		slot12 = current_alpha

		object.set_alpha(t, object)
	end

	slot10 = new_alpha or self._active_alpha

	object.set_alpha(slot8, object)

	return 
end

return 
