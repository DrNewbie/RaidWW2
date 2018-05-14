-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEnvironmentHandler"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

local dummy_material = {
	set_variable = function ()
		return 
	end
}
EnvironmentHandler = EnvironmentHandler or CoreClass.class()
EnvironmentHandler.AREAS_PER_FRAME = 3
EnvironmentHandler.init = function (self, env_manager, is_first_viewport)
	self._env_manager = env_manager
	self._is_first_viewport = is_first_viewport
	self._feeder_map = {}
	self._update_feeder_map = {}
	self._apply_prio_feeder_map = {}
	self._apply_feeder_map = {}
	self._post_processor_modifier_material_map = {}
	self._area_iterator = 1
	slot8 = self._env_manager

	self.set_environment(slot4, self, self._env_manager.default_environment(slot7), nil, nil, nil)

	return 
end
EnvironmentHandler.destroy = function (self)
	if self._feeder_map then
		slot3 = self._feeder_map

		for data_path_key, feeder in pairs(slot2) do
			slot8 = feeder

			feeder.destroy(slot7)
		end
	else
		slot4 = "[EnvironmentManager] Destroy called too many times."

		Application.error(slot2, Application)
	end

	self._env_manager = nil
	self._feeder_map = nil
	self._update_feeder_map = nil
	self._apply_prio_feeder_map = nil
	self._apply_feeder_map = nil
	self._post_processor_modifier_material_map = nil
	self._force_feeder_update = false

	return 
end
EnvironmentHandler.set_environment = function (self, path, blend_duration, blend_bezier_curve, filter_list, unfiltered_environment_path)
	slot9 = path
	local env_data = self._env_manager._get_data(slot7, self._env_manager)
	local filtered_env_data = nil
	self._path = path

	if filter_list then
		filtered_env_data = {}
		slot10 = filter_list

		for _, data_path_key in ipairs(slot9) do
			filtered_env_data[data_path_key] = env_data[data_path_key]
		end

		if unfiltered_environment_path then
			slot11 = unfiltered_environment_path
			local unfiltered_env_data = self._env_manager._get_data(slot9, self._env_manager)
			slot11 = unfiltered_env_data

			for data_path_key, value in pairs(self._env_manager) do
				if filtered_env_data[data_path_key] == nil then
					filtered_env_data[data_path_key] = value
				end
			end
		end
	else
		filtered_env_data = env_data
	end

	if blend_duration and 0 < blend_duration then
		self._blend_time = 0
		self._blend_duration = blend_duration
		self._blend_bezier_curve = blend_bezier_curve
	else
		self._blend_duration = nil
		blend_duration = nil
	end

	slot10 = filtered_env_data

	for data_path_key, value in pairs(slot9) do
		local feeder = self._feeder_map[data_path_key]

		if not feeder then
			slot18 = value
			feeder = self._env_manager._create_feeder(slot15, self._env_manager, data_path_key)
			self._feeder_map[data_path_key] = feeder
			slot17 = feeder

			self._add_apply_feeder(slot15, self)

			slot16 = feeder

			if feeder.get_modifier(slot15) then
				self._update_feeder_map[data_path_key] = feeder
			end
		else
			slot16 = feeder
			local modifier_func, is_modifier_override = feeder.get_modifier(slot15)

			if not modifier_func then
				slot19 = value
				local is_changed = not feeder.equals(slot17, feeder)
			end

			if blend_duration or is_modifier_override then
				slot20 = value

				feeder.set_target(slot18, feeder)
			else
				slot20 = value

				feeder.set(slot18, feeder)
			end

			if not is_modifier_override then
				if is_changed then
					if blend_duration then
						self._update_feeder_map[data_path_key] = feeder
					else
						slot20 = feeder

						self._add_apply_feeder(slot18, self)
					end
				else
					self._update_feeder_map[data_path_key] = nil
				end
			end
		end
	end

	return 
end
EnvironmentHandler.get_path = function (self)
	return self._path
end
EnvironmentHandler.create_modifier = function (self, data_path_key, is_override, func)
	local feeder = self._feeder_map[data_path_key]

	if not feeder then
		slot8 = "[EnvironmentManager] Environment need to be set before creating a modifier or the requested modifier doesn't exist."

		Application.stack_dump_error(slot6, Application)

		return nil
	else
		slot9 = is_override

		feeder.set_modifier(slot6, feeder, func)

		self._update_feeder_map[data_path_key] = feeder

		return data_path_key
	end

	return 
end
EnvironmentHandler.destroy_modifier = function (self, data_path_key)
	local feeder = self._feeder_map[data_path_key]

	if not feeder then
		slot6 = "[EnvironmentManager] Environment need to be set before destroying a modifier."

		Application.stack_dump_error(slot4, Application)
	else
		feeder.set_modifier(slot4, feeder, nil)

		self._update_feeder_map[data_path_key] = feeder
		slot6 = feeder

		self._add_apply_feeder(slot4, self)
	end

	return 
end
EnvironmentHandler.update_value = function (self, data_path_key)
	local feeder = self._feeder_map[data_path_key]

	if feeder then
		self._update_feeder_map[data_path_key] = feeder
	else
		slot6 = "[EnvironmentManager] Invalid data path key."

		Application.stack_dump_error(slot4, Application)
	end

	return 
end
EnvironmentHandler.get_value = function (self, data_path_key)
	local feeder = self._feeder_map[data_path_key]

	if feeder then
		slot5 = feeder

		return feeder.get_current(slot4)
	else
		slot6 = "[EnvironmentManager] Invalid data path key."

		Application.stack_dump_error(slot4, Application)

		return nil
	end

	return 
end
EnvironmentHandler.editor_set_value = function (self, data_path_key, value)
	local feeder = self._feeder_map[data_path_key]

	if not feeder then
		slot7 = data_path_key

		if self._env_manager.has_data_path_key(slot5, self._env_manager) then
			slot8 = value
			feeder = self._env_manager._create_feeder(slot5, self._env_manager, data_path_key)
			self._feeder_map[data_path_key] = feeder
		end
	end

	if not feeder then
		return false
	else
		slot7 = value

		if not feeder.equals(slot5, feeder) then
			slot7 = value

			feeder.set(slot5, feeder)

			slot7 = feeder

			self._add_apply_feeder(slot5, self)
		end
	end

	return true
end
EnvironmentHandler.update = function (self, is_first_viewport, viewport, dt)
	local scale = nil

	if self._blend_duration then
		self._blend_time = self._blend_time + dt
		scale = self._blend_time / self._blend_duration

		if self._blend_bezier_curve then
			slot7 = self._blend_bezier_curve
			slot12 = 1
			scale = math.bezier(slot6, math.clamp(slot9, scale, 0))
		end

		slot9 = 1
		scale = math.clamp(slot6, scale, 0)

		if scale == 1 then
			self._blend_duration = nil
		end
	else
		scale = 1
	end

	slot9 = false

	self.set_first_viewport(slot6, self, is_first_viewport)

	local remove_update_list = nil
	slot8 = self._update_feeder_map

	for data_path_key, feeder in pairs(self) do
		slot15 = scale
		local is_done, is_not_changed = feeder.update(slot12, feeder, self)

		if is_done then
			remove_update_list = remove_update_list or {}
			slot16 = data_path_key

			table.insert(slot14, remove_update_list)
		end

		if not is_not_changed then
			slot16 = feeder

			self._add_apply_feeder(slot14, self)
		end
	end

	if remove_update_list then
		slot8 = remove_update_list

		for _, data_path_key in ipairs(slot7) do
			self._update_feeder_map[data_path_key] = nil
		end
	end

	return 
end
EnvironmentHandler.set_force_feeder_update = function (self)
	self._force_feeder_update = true

	return 
end
EnvironmentHandler.apply = function (self, is_first_viewport, viewport, scene)
	slot8 = self._force_feeder_update

	self.set_first_viewport(slot5, self, is_first_viewport)

	self._force_feeder_update = false
	slot6 = self._apply_prio_feeder_map

	if next(slot5) then
		slot6 = self._apply_prio_feeder_map

		for _, feeder in pairs(slot5) do
			if not feeder.IS_GLOBAL or is_first_viewport then
				slot14 = scene

				feeder.apply(slot10, feeder, self, viewport)
			end
		end

		self._apply_prio_feeder_map = {}
	end

	slot6 = self._apply_feeder_map

	if next(slot5) then
		slot6 = self._apply_feeder_map

		for _, feeder in pairs(slot5) do
			if not feeder.IS_GLOBAL or is_first_viewport then
				slot14 = scene

				feeder.apply(slot10, feeder, self, viewport)
			end
		end

		self._apply_feeder_map = {}
	end

	return 
end
EnvironmentHandler.update_environment_area = function (self, check_pos, area_list)
	if self._current_area then
		slot6 = check_pos
		local is_still_inside = self._current_area.still_inside(slot4, self._current_area)
		slot6 = self
		slot4 = self._check_inside
		slot7 = check_pos
		slot8 = area_list
	else
		slot8 = nil

		self._check_inside(slot4, self, check_pos, area_list)
	end

	return 
end
EnvironmentHandler.on_environment_area_removed = function (self, area)
	if area == self._current_area then
		slot4 = self

		self._leave_current_area(slot3)
	end

	self._area_iterator = 1

	return 
end
EnvironmentHandler.on_default_environment_changed = function (self, default_environment_path, blend_duration, blend_bezier_curve)
	if not self._current_area then
		self.set_environment(slot5, self, default_environment_path, blend_duration, blend_bezier_curve, nil)
	end

	return 
end
EnvironmentHandler.set_first_viewport = function (self, is_first_viewport, force_feeder_update)
	if force_feeder_update then
		slot5 = self._feeder_map

		for data_path_key, feeder in pairs(slot4) do
			slot11 = feeder

			self._add_apply_feeder(slot9, self)
		end
	elseif self._is_first_viewport ~= is_first_viewport then
		self._is_first_viewport = is_first_viewport

		if is_first_viewport then
			slot5 = self._feeder_map

			for data_path_key, feeder in pairs(slot4) do
				slot11 = feeder

				self._add_apply_feeder(slot9, self)
			end
		end
	end

	return 
end
EnvironmentHandler._check_inside = function (self, check_pos, area_list, min_prio)
	local area_count = #area_list

	if 0 < area_count then
		local areas_per_frame = self.AREAS_PER_FRAME
		local check_count = 0

		for i = 1, area_count, 1 do
			local area = area_list[self._area_iterator]
			slot15 = area_count
			self._area_iterator = math.mod(slot13, self._area_iterator) + 1
			slot15 = min_prio

			if area.is_higher_prio(slot13, area) then
				slot15 = check_pos

				if area.is_inside(slot13, area) then
					slot14 = area
					local id = area.id(slot13)

					if self._current_area_id ~= id then
						local environment = area.environment(slot14)
						local blend_duration = area.transition_time(area)
						local blend_bezier_curve = area.bezier_curve(area)
						local filter_list = area.filter_list(area)
						slot19 = area

						if area.permanent(area) then
							slot22 = blend_bezier_curve

							managers.viewport.set_default_environment(slot18, managers.viewport, environment, blend_duration)

							if self._current_area then
								slot23 = filter_list
								slot26 = self._env_manager

								self.set_environment(slot18, self, environment, blend_duration, blend_bezier_curve, self._env_manager.default_environment(slot25))
							end
						else
							slot19 = self
							slot17 = self.set_environment
							slot20 = environment
							slot21 = blend_duration
							slot22 = blend_bezier_curve
							slot23 = filter_list

							if self._current_area ~= nil then
								slot26 = self._env_manager
								slot24 = self._env_manager.default_environment(slot25)
							else
								slot24 = false

								if false then
									slot24 = true
								end
							end

							slot17(slot18, slot19, slot20, slot21, slot22, slot23)
						end
					end

					self._current_area = area
					self._current_area_id = id
					self._area_iterator = 1

					return true
				end

				check_count = check_count + 1

				if areas_per_frame <= check_count then
					break
				end
			end
		end
	end

	return false
end
EnvironmentHandler._leave_current_area = function (self)
	slot8 = self._current_area

	self.set_environment(slot2, self, self._env_manager.default_environment(slot5), self._current_area.transition_time(self._env_manager), self._current_area.bezier_curve(self._current_area), nil)

	self._current_area = nil
	self._current_area_id = nil

	return 
end
EnvironmentHandler._get_post_processor_modifier_material = function (self, viewport, scene, id, ids_processor_name, ids_effect_name, ids_modifier)
	local scene_map = self._post_processor_modifier_material_map[scene]
	local material = nil

	if not scene_map then
		scene_map = {}
		self._post_processor_modifier_material_map[scene] = scene_map
	else
		material = scene_map[id]
	end

	if not material then
		slot14 = ids_effect_name
		local post_processor = viewport.get_post_processor_effect(slot10, viewport, scene, ids_processor_name)

		if post_processor then
			slot13 = ids_modifier
			local modifier = post_processor.modifier(slot11, post_processor)

			if modifier then
				slot13 = modifier
				material = modifier.material(slot12)
			else
				material = dummy_material
				slot17 = post_processor

				Application.stack_dump_error(slot12, Application, post_processor.modifiers(slot16))

				slot15 = post_processor

				for k, v in pairs(post_processor.modifiers("[EnvironmentManager] ")) do
					slot19 = "[EnvironmentManager] "
					slot22 = v

					Application.stack_dump_error(slot17, Application, v.name(slot21))
				end

				slot17 = scene
				slot19 = ids_processor_name
				slot21 = ids_effect_name
				slot23 = ids_modifier
				slot14 = "[EnvironmentManager] Invalid post processor. Scene: " .. tostring(slot16) .. ", Processor: " .. tostring(slot18) .. ", Effect: " .. tostring(slot20) .. ", Modifier: " .. tostring(slot22)

				Application.stack_dump_error(slot12, Application)
			end
		else
			material = dummy_material
			slot16 = scene
			slot18 = ids_processor_name
			slot20 = ids_effect_name
			slot22 = ids_modifier
			slot13 = "[EnvironmentManager] Invalid post processor. Scene: " .. tostring(slot15) .. ", Processor: " .. tostring(slot17) .. ", Effect: " .. tostring(slot19) .. ", Modifier: " .. tostring(slot21)

			Application.stack_dump_error(slot11, Application)
		end

		scene_map[id] = material
	end

	return material
end
EnvironmentHandler._add_apply_feeder = function (self, feeder)
	if feeder.AFFECTED_LIST then
		slot5 = feeder

		table.insert(slot3, self._apply_prio_feeder_map)

		slot4 = feeder.AFFECTED_LIST

		for _, affected_feeder in ipairs(slot3) do
			slot10 = self._feeder_map[affected_feeder.DATA_PATH_KEY]

			table.insert(slot8, self._apply_feeder_map)
		end
	else
		slot5 = feeder

		table.insert(slot3, self._apply_feeder_map)
	end

	return 
end

return 
