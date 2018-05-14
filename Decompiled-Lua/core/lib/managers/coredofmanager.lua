-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreDOFManager"

core.module(slot1, core)

DOFManager = DOFManager or class()
function DOFManager:init()
	self._queued_effects = {}
	self._sorted_effect_list = {}
	self._last_id = 0
	self._current_effect = nil
	self._enabled = true
	self._var_map = {
		"near_min",
		"near_max",
		"far_min",
		"far_max"
	}
	slot3 = TimerManager
	self._game_timer = TimerManager.game(slot2)
	self._env_dof_enabled = true
	self._environment_parameters = {
		clamp = 0,
		far_min = 0,
		far_max = 0,
		near_max = 0,
		near_min = 0
	}
	self._clamp_prev_frame = 0

	return 
end
function DOFManager:save(data)
	slot4 = self._queued_effects

	if next(slot3) then
		local state = {}
		slot5 = self._queued_effects
		state.queued_effects = clone(slot4)
		data.DOFManager = state
	end

	return 
end
function DOFManager:load(data)
	local state = data.DOFManager

	if state then
		if state.queued_effects then
			slot5 = state.queued_effects
			self._queued_effects = clone(slot4)
		else
			self._queued_effects = {}
		end
	end

	return 
end
function DOFManager:update(t, dt)
	slot7 = dt

	self.remove_expired_effects(slot4, self, t)

	self._current_effect = self._sorted_effect_list[1]
	local new_data, new_clamp = nil

	if self._current_effect then
		slot10 = self._current_effect

		self.update_effect(slot6, self, t, dt)

		slot7 = self
		new_data = self.check_dof_allowed(slot6) and self._queued_effects[self._current_effect]
	end

	if new_data then
		new_data = new_data.prog_data
		new_clamp = new_data.dirty and new_data.clamp
		new_data = new_clamp and new_data.cur_values

		if new_data then
			if self._clamp_prev_frame ~= new_clamp then
				self._clamp_prev_frame = new_clamp
			end

			slot12 = new_clamp

			self.feed_dof(slot6, self, new_data.near_min, new_data.near_max, new_data.far_min, new_data.far_max)
		end
	elseif not self._env_dof_enabled then
		slot7 = managers.viewport

		if managers.viewport.get_active_vp(slot6) then
			self._env_dof_enabled = true
		end
	end

	return 
end
function DOFManager:update_world_camera(t, dt, effect)
	slot9 = effect

	managers.worldcamera.update_dof(slot5, managers.worldcamera, t, dt)

	return 
end
function DOFManager:paused_update(t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function DOFManager:modifier_callback(interface)
	slot4 = interface
	self._modifier_output = interface.parameters(slot3)
	slot4 = self._modifier_input

	return assert(slot3)
end
function DOFManager:feed_dof(near_min, near_max, far_min, far_max, clamp)
	self._modifier_input = {
		near_focus_distance_min = near_min,
		near_focus_distance_max = near_max,
		far_focus_distance_min = far_min,
		far_focus_distance_max = far_max,
		clamp = clamp
	}

	return 
end
function DOFManager:get_dof_parameters()
	return self._current_effect and self._queued_effects[self._current_effect].prog_data.cur_values
end
function DOFManager:get_dof_values()
	slot3 = self._modifier_output

	assert(slot2)

	return self._modifier_output.near_focus_distance_min, self._modifier_output.near_focus_distance_max, self._modifier_output.far_focus_distance_min, self._modifier_output.far_focus_distance_max, self._modifier_output.clamp
end
function DOFManager:debug_draw_feed(near_max, near_min, far_min, far_max, clamp)
	slot8 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot7)

	if vp then
		slot11 = vp

		if alive(vp.camera(slot10)) then
			local camera = vp.camera(slot8)
			slot10 = camera
			local cam_dir = camera.rotation(vp).y(vp)
			local cam_pos = camera.position(camera.rotation(vp)) - math.UP * 50
			slot18 = 1

			Application.draw_cone(camera, Application, cam_pos + cam_dir * near_min, cam_pos + cam_dir * near_max, 49 * clamp + 1, 0, 0)

			slot18 = 0

			Application.draw_cone(camera, Application, cam_pos + cam_dir * far_min, cam_pos + cam_dir * far_max, 49 * clamp + 1, 0, 1)
		end
	end

	return 
end
function DOFManager:remove_expired_effects(t, dt)
	slot5 = self._queued_effects
	local id, effect = next(slot4)

	while id do
		if effect.prog_data.finish_t then
			slot7 = effect.preset.timer or self._game_timer
			local eff_t = effect.preset.timer or self._game_timer.time(slot6)

			if effect.prog_data.finish_t <= eff_t then
				slot9 = id

				self.intern_remove_effect(slot7, self)
			end
		end

		slot8 = id
		id, effect = next(slot6, self._queued_effects)
	end

	return 
end
function DOFManager:update_effect(t, dt, id)

	-- Decompilation error in this vicinity:
	local effect = self._queued_effects[id]
	local preset = effect.preset
	local prog = effect.prog_data

	return 
end
function DOFManager:calculate_current_parameters_fade_in(t, dt, effect)
	local next_eff_sort = effect.prog_data.sort_index + 1
	local next_eff_id = self._sorted_effect_list[next_eff_sort]
	local init = nil

	if next_eff_id then
		slot12 = next_eff_id

		self.update_effect(slot8, self, t, dt)

		init = self._queued_effects[self._sorted_effect_list[next_eff_sort]].prog_data.cur_values
	end

	init = init or self._environment_parameters
	local cur = effect.prog_data.cur_values
	local tar = effect.prog_data.target_values
	local eff_lerp = effect.prog_data.lerp
	slot12 = self._var_map

	for _, v in pairs(slot11) do
		slot19 = eff_lerp
		cur[v] = math.lerp(slot16, init[v], tar[v])
	end

	slot14 = eff_lerp
	cur.clamp = math.lerp(slot11, init.clamp, effect.prog_data.clamp)
	effect.prog_data.dirty = true

	return 
end
function DOFManager:calculate_current_parameters_sustain(t, dt, effect)
	if effect.prog_data.peak_reached then
		effect.prog_data.dirty = nil
	else
		effect.prog_data.peak_reached = true
		local cur = effect.prog_data.cur_values
		local tar = effect.prog_data.target_values
		slot8 = self._var_map

		for _, v in pairs(slot7) do
			cur[v] = tar[v]
		end

		cur.clamp = effect.prog_data.clamp
		effect.prog_data.dirty = true
	end

	return 
end
function DOFManager:calculate_current_parameters_fade_out(t, dt, effect, id)
	local next_eff_sort = effect.prog_data.sort_index + 1
	local next_eff_id = self._sorted_effect_list[next_eff_sort]
	local out = nil

	if next_eff_id then
		slot13 = next_eff_id

		self.update_effect(slot9, self, t, dt)

		out = self._queued_effects[self._sorted_effect_list[next_eff_sort]].prog_data.cur_values
	end

	out = out or self._environment_parameters
	local cur = effect.prog_data.cur_values
	local tar = effect.prog_data.target_values
	local eff_lerp = effect.prog_data.lerp
	slot13 = self._var_map

	for _, v in pairs(slot12) do
		slot20 = eff_lerp
		cur[v] = math.lerp(slot17, out[v], tar[v])
	end

	slot15 = eff_lerp
	cur.clamp = math.lerp(slot12, out.clamp, effect.prog_data.clamp)
	effect.prog_data.dirty = true

	return 
end
function DOFManager:play(dof_data, amplitude_multiplier)
	self._last_id = self._last_id + 1
	local new_data = {}
	local timer = dof_data.timer or self._game_timer
	slot7 = timer
	local t = timer.time(slot6)
	local prog_data = {
		clamp = (amplitude_multiplier and dof_data.clamp * amplitude_multiplier) or dof_data.clamp,
		fade_in_end = (dof_data.fade_in and t + dof_data.fade_in) or t,
		sustain_end = dof_data.sustain and prog_data.fade_in_end + dof_data.sustain
	}

	if prog_data.sustain_end then
		slot7 = prog_data.sustain_end + (dof_data.fade_out or 0)
	end

	prog_data.finish_t = slot7
	prog_data.start_t = t
	local cur_values = nil
	slot10 = self
	local near_min, near_max, far_min, far_max, clamp = self.get_dof_values(slot9)

	if 0 < clamp then
		cur_values = {
			near_min = near_min,
			near_max = near_max,
			far_min = far_min,
			far_max = far_max,
			clamp = clamp
		}
	else
		cur_values = {
			clamp = 0,
			far_min = 0,
			far_max = 0,
			near_max = 0,
			near_min = 0
		}
	end

	local target_values = {}
	slot16 = self._var_map

	for _, v in pairs(slot15) do
		target_values[v] = dof_data[v]
	end

	prog_data.target_values = target_values
	prog_data.cur_values = cur_values
	new_data.preset = dof_data
	new_data.prog_data = prog_data
	self._queued_effects[self._last_id] = new_data
	slot18 = dof_data.prio

	self.add_to_sorted_list(self._last_id, self, self._last_id)

	return self._last_id
end
function DOFManager:add_to_sorted_list(new_id, prio)
	local allocated = nil
	slot6 = self._sorted_effect_list

	for index, eff_id in ipairs(slot5) do
		if self._queued_effects[eff_id].preset.prio <= prio then
			slot13 = new_id

			table.insert(slot10, self._sorted_effect_list, index)

			allocated = true

			break
		end
	end

	if not allocated then
		slot7 = new_id

		table.insert(slot5, self._sorted_effect_list)
	end

	slot6 = self._sorted_effect_list

	for index, eff_id in ipairs(slot5) do
		self._queued_effects[eff_id].prog_data.sort_index = index
	end

	return 
end
function DOFManager:remove_from_sorted_list(id)
	slot4 = self._sorted_effect_list

	for index, eff_id in ipairs(slot3) do
		if eff_id == id then
			slot10 = index

			table.remove(slot8, self._sorted_effect_list)

			break
		end
	end

	slot4 = self._sorted_effect_list

	for index, eff_id in ipairs(slot3) do
		self._queued_effects[eff_id].prog_data.sort_index = index
	end

	return 
end
function DOFManager:stop(id, instant)
	local effect = self._queued_effects[id]

	if effect then
		if instant then
			slot7 = id

			self.intern_remove_effect(slot5, self)

			if self._current_effect == id then
				self._current_effect = nil
			end
		else
			slot6 = effect.preset.timer or self._game_timer
			local t = effect.preset.timer or self._game_timer.time(slot5)
			effect.prog_data.sustain_end = t
			effect.prog_data.finish_t = t + (effect.preset.fade_out or 0)
		end
	end

	return 
end
function DOFManager:stop_all(instant)
	self._queued_effects = {}
	self._sorted_effect_list = {}
	self._current_effect = nil
	slot4 = managers.environment

	managers.environment.enable_dof(slot3)

	slot5 = "PE"

	managers.environment.needs_update(slot3, managers.environment)

	self._env_dof_enabled = true
	slot4 = managers.viewport

	if managers.viewport.get_active_vp(slot3) then
		slot9 = 0

		self.feed_dof(slot3, self, 0, 0, 0, 0)
	end

	return 
end
function DOFManager:intern_remove_effect(id)
	self._queued_effects[id] = nil
	slot5 = id

	self.remove_from_sorted_list(nil, self)

	return 
end
function DOFManager:check_dof_allowed()
	return self._enabled
end
function DOFManager:set_enabled(state)
	self._enabled = state

	return 
end
function DOFManager:is_effect_playing(id)
	return id and self._queued_effects[id] and true
end
function DOFManager:from_env_mgr_set_env_dof(env_data)
	local env_param = self._environment_parameters
	env_param.near_min = env_data.near_focus_distance_min
	env_param.near_max = env_data.near_focus_distance_max
	env_param.far_min = env_data.far_focus_distance_min
	env_param.far_max = env_data.far_focus_distance_max
	env_param.clamp = env_data.clamp

	return 
end
function DOFManager:clbk_environment_change()
	slot3 = managers.environment
	local env_data = managers.environment.get_posteffect(slot2)
	env_data = env_data and env_data._post_processors
	env_data = env_data and env_data.hdr_post_processor
	env_data = env_data and env_data._modifiers
	env_data = env_data and env_data.dof
	env_data = env_data and env_data._params

	if env_data then
		self._environment_parameters = {
			near_min = env_data.near_focus_distance_min,
			near_max = env_data.near_focus_distance_max,
			far_min = env_data.far_focus_distance_min,
			far_max = env_data.far_focus_distance_max,
			clamp = env_data.clamp
		}
	end

	return 
end
function DOFManager:set_effect_parameters(id, params, clamp)
	if self._queued_effects[id] then
		if params then
			slot6 = params

			for k, v in pairs(slot5) do
				self._queued_effects[id].prog_data.target_values[k] = v
			end
		end

		if clamp then
			self._queued_effects[id].prog_data.clamp = clamp
		end

		self._queued_effects[id].prog_data.peak_reached = nil

		return true
	end

	return 
end

return 
