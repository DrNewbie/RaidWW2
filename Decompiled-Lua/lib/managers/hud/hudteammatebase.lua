-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDTeammateBase = HUDTeammateBase or class()
function HUDTeammateBase:init(i, teammates_panel)
	return 
end
function HUDTeammateBase:panel()
	return self._object
end
function HUDTeammateBase:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDTeammateBase:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDTeammateBase:padding_down()
	return 0
end
function HUDTeammateBase:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDTeammateBase:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDTeammateBase:show()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDTeammateBase:hide()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	slot3 = self

	self.stop_timer(slot2)

	self._peer_id = nil

	return 
end
function HUDTeammateBase:peer_id()
	return self._peer_id
end
function HUDTeammateBase:set_peer_id(peer_id)
	self._peer_id = peer_id

	return 
end
function HUDTeammateBase:is_ai()
	return false
end
function HUDTeammateBase:set_health(data)
	return 
end
function HUDTeammateBase:set_stamina(value)
	return 
end
function HUDTeammateBase:set_max_stamina(value)
	return 
end
function HUDTeammateBase:set_warcry_meter_fill(data)
	return 
end
function HUDTeammateBase:activate_warcry(duration)
	return 
end
function HUDTeammateBase:deactivate_warcry()
	return 
end
function HUDTeammateBase:set_warcry_ready(value)
	return 
end
function HUDTeammateBase:set_name(name)
	return 
end
function HUDTeammateBase:set_nationality(nationality)
	return 
end
function HUDTeammateBase:set_cheater(state)
	return 
end
function HUDTeammateBase:start_interact(timer)
	return 
end
function HUDTeammateBase:set_carry_info(carry_id)
	return 
end
function HUDTeammateBase:remove_carry_info()
	return 
end
function HUDTeammateBase:show_turret_icon()
	return 
end
function HUDTeammateBase:hide_turret_icon()
	return 
end
function HUDTeammateBase:show_lockpick_icon()
	return 
end
function HUDTeammateBase:hide_lockpick_icon()
	return 
end
function HUDTeammateBase:add_special_equipment(data)
	return 
end
function HUDTeammateBase:remove_special_equipment(equipment)
	return 
end
function HUDTeammateBase:set_special_equipment_amount(equipment_id, amount)
	return 
end
function HUDTeammateBase:clear_special_equipment()
	return 
end
function HUDTeammateBase:go_into_bleedout()
	slot3 = self

	self._clear_states(slot2)

	slot4 = "downed"

	self._add_active_state(slot2, self)

	return 
end
function HUDTeammateBase:on_revived()
	slot4 = "downed"

	self._remove_active_state(slot2, self)

	slot4 = "revived"

	self._remove_active_state(slot2, self)

	slot3 = self

	self.stop_timer(slot2)

	return 
end
function HUDTeammateBase:on_died()
	slot4 = "dead"

	self._add_active_state(slot2, self)

	slot4 = "downed"

	self._remove_active_state(slot2, self)

	return 
end
function HUDTeammateBase:_clear_states()
	self._active_states = {}
	self._displayed_state = self._states[#self._states]
	slot4 = self._displayed_state.id

	self._add_active_state(#self._states, self)

	return 
end
function HUDTeammateBase:set_condition(icon_data, text)
	return 
end
function HUDTeammateBase:reset_state()
	return 
end
function HUDTeammateBase:_add_active_state(state_id)
	self._active_states[state_id] = true
	slot4 = self

	self._check_state_change(true)

	return 
end
function HUDTeammateBase:_remove_active_state(state_id)
	self._active_states[state_id] = nil
	slot4 = self

	self._check_state_change(nil)

	return 
end
function HUDTeammateBase:_check_state_change()
	local new_state = nil

	for i = 1, #self._states, 1 do
		if self._active_states[self._states[i].id] then
			if self._states[i].id == self._displayed_state.id then
				return 
			end

			new_state = self._states[i]

			break
		end
	end

	if new_state then
		slot4 = self._status_panel

		self._status_panel.stop(slot3)

		slot9 = "_animate_state_change"

		self._status_panel.animate(slot3, self._status_panel, callback(new_state, self, self))
	end

	return 
end
function HUDTeammateBase:_animate_state_change(status_panel, new_state)
	local old_state = self._displayed_state
	local fade_out_duration = 0.15
	slot7 = self._status_panel
	local t = (1 - self._status_panel.alpha(slot6)) * fade_out_duration
	self._displayed_state = new_state

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 1, -1)
		slot11 = current_alpha

		self._status_panel.set_alpha(t, self._status_panel)

		if new_state.hidden then
			slot10 = new_state.hidden

			for index, control_id in pairs(slot9) do
				slot16 = control_id
				local control = self._left_panel.child(slot14, self._left_panel)
				slot17 = current_alpha

				control.set_alpha(self._left_panel, control)
			end
		end
	end

	slot8 = self._states

	for index, state in pairs(slot7) do
		slot14 = state.control
		slot14 = 0

		self._status_panel.child(slot12, self._status_panel).set_alpha(slot12, self._status_panel.child(slot12, self._status_panel))
	end

	slot9 = self._displayed_state.control
	slot9 = 1

	self._status_panel.child(slot7, self._status_panel).set_alpha(slot7, self._status_panel.child(slot7, self._status_panel))

	local fade_in_duration = 0.15
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot9, t, 0, 1)
		slot12 = current_alpha

		self._status_panel.set_alpha(t, self._status_panel)

		if old_state.hidden then
			slot11 = old_state.hidden

			for index, control_id in pairs(slot10) do
				slot17 = control_id
				local control = self._left_panel.child(slot15, self._left_panel)
				slot18 = current_alpha

				control.set_alpha(self._left_panel, control)
			end
		end
	end

	slot10 = 1

	self._status_panel.set_alpha(slot8, self._status_panel)

	return 
end
function HUDTeammateBase:start_timer(time, current)
	self._timer_total = time
	self._timer_current = current or time
	self._is_timer_running = true
	slot5 = self._timer_text
	slot10 = "_animate_timer_countdown"

	self._timer_text.animate(slot4, callback(slot7, self, self))

	return 
end
function HUDTeammateBase:set_pause_timer(pause)
	self._is_timer_running = not pause

	return 
end
function HUDTeammateBase:is_timer_running()
	return self._is_timer_running
end
function HUDTeammateBase:stop_timer()
	self._timer_total = nil
	self._is_timer_running = false
	slot3 = self._timer_text

	self._timer_text.stop(slot2)

	return 
end
function HUDTeammateBase:_animate_timer_countdown()
	while 0 < self._timer_current and self._timer_total and 0 < self._timer_total do
		local dt = coroutine.yield()

		if self._is_timer_running and self._timer_total and 0 < self._timer_total then

			-- Decompilation error in this vicinity:
			self._timer_current = self._timer_current - dt
			slot5 = self._timer_current / self._timer_total

			self._timer_bar.set_position_z(slot3, self._timer_bar)

			slot4 = self._timer_current
			slot6 = time_text

			self._timer_text.set_text(slot4, self._timer_text)
		end
	end

	return 
end
function HUDTeammateBase:_set_status_icon(new_status_icon)
	return 
end

return 
