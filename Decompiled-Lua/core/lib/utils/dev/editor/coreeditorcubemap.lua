-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEditorUtils"

core.import(slot1, core)

function CoreEditor:create_projection_light(type)
	local lights = {}
	local units = {}

	if type == "all" then
		slot7 = "Statics"
		local s_units = self.layer(slot5, self).created_units(slot5)
		slot7 = s_units

		for _, unit in ipairs(self.layer(slot5, self)) do
			slot13 = "shadow_projection"
			local light_name = CoreEditorUtils.has_projection_light(slot11, unit)

			if light_name then
				slot14 = {
					unit = unit,
					light_name = light_name
				}

				table.insert(slot12, units)
			end
		end
	elseif type == "selected" then
		local s_units = self.current_selected_units(slot5)
		slot7 = s_units

		for _, unit in ipairs(self) do
			slot13 = "shadow_projection"
			local light_name = CoreEditorUtils.has_projection_light(slot11, unit)

			if light_name then
				slot14 = {
					unit = unit,
					light_name = light_name
				}

				table.insert(slot12, units)
			end
		end
	end

	self._saved_all_lights = {}

	for _, light in ipairs(CoreEditorUtils.all_lights()) do
		slot12 = {
			light = light,
			enabled = light.enable(slot14)
		}
		slot15 = light

		table.insert(slot10, self._saved_all_lights)
	end

	slot6 = units

	for _, data in ipairs(slot5) do
		local unit = data.unit
		slot15 = data.light_name
		local light = unit.get_object(slot11, Idstring(slot14))
		local enabled = light.enable(unit)
		slot14 = unit

		if unit.unit_data(light).projection_lights then
			slot15 = light
			slot15 = light.name(unit)

			if unit.unit_data(slot13).projection_lights[light.name(unit).s(unit)] then
				slot15 = light
				slot15 = light.name(unit)
				local resolution = unit.unit_data(slot13).projection_lights[light.name(unit).s(unit)].x
			end
		end

		resolution = resolution or EditUnitLight.DEFAULT_SHADOW_RESOLUTION
		slot16 = {
			name = "",
			position = light.position(slot18),
			unit = unit,
			light = light,
			enabled = enabled,
			spot = (string.find(slot18, light.properties("spot")) and true) or false,
			resolution = resolution,
			output_name = unit.unit_data(slot18).unit_id
		}
		slot19 = light
		slot21 = light
		slot19 = unit

		table.insert(slot14, lights)

		slot16 = false

		light.set_enable(slot14, light)
	end

	if #lights == 0 then
		return 
	end

	slot6 = self._saved_all_lights

	for _, data in ipairs(slot5) do
		slot12 = false

		data.light.set_enable(slot10, data.light)
	end

	slot6 = self
	slot6 = self.viewport(slot5)
	slot8 = Idstring(slot9)
	slot11 = "empty"

	self.viewport(slot5).vp(slot5).set_post_processor_effect(slot5, self.viewport(slot5).vp(slot5), "World", Idstring("dof_prepare_post_processor"))

	slot6 = self
	slot6 = self.viewport(slot5)
	slot8 = Idstring(Idstring)
	slot11 = "bloom_combine_empty"

	self.viewport(slot5).vp(slot5).set_post_processor_effect(slot5, self.viewport(slot5).vp(slot5), "World", Idstring("bloom_combine_post_processor"))

	slot6 = self
	slot6 = self.viewport(slot5)
	slot8 = Idstring(Idstring)
	slot11 = "projection_generation"

	self.viewport(slot5).vp(slot5).set_post_processor_effect(slot5, self.viewport(slot5).vp(slot5), "World", Idstring("deferred"))

	slot6 = self
	slot6 = self.viewport(slot5)
	slot8 = Idstring(Idstring)
	slot11 = "depth_project"

	self.viewport(slot5).vp(slot5).set_post_processor_effect(slot5, self.viewport(slot5).vp(slot5), "World", Idstring("depth_projection"))

	slot6 = self
	slot6 = self.viewport(slot5)
	slot8 = Idstring(Idstring)
	slot11 = "empty"

	self.viewport(slot5).vp(slot5).set_post_processor_effect(slot5, self.viewport(slot5).vp(slot5), "World", Idstring("volumetric_light_scatter"))

	slot6 = self
	slot6 = self.viewport(slot5)
	slot8 = Idstring(Idstring)
	slot11 = "empty"

	self.viewport(slot5).vp(slot5).set_post_processor_effect(slot5, self.viewport(slot5).vp(slot5), "World", Idstring("post_motion_blur"))

	slot6 = self
	slot6 = self.viewport(slot5)
	slot8 = Idstring(Idstring)
	slot11 = "empty"

	self.viewport(slot5).vp(slot5).set_post_processor_effect(slot5, self.viewport(slot5).vp(slot5), "World", Idstring("colorblind_correction_post"))

	local saved_environment = managers.viewport.default_environment(slot5)

	managers.viewport.set_default_environment(managers.viewport, managers.viewport, "core/environments/default_depthlight", nil)

	slot8 = {
		simple_postfix = true,
		cubes = lights,
		saved_environment = saved_environment
	}

	self._create_cube_light(managers.viewport, self)

	return 
end
function CoreEditor:_create_cube_light(params)
	if not self._lastdir then
		return 
	end

	params.lights = true
	local folder_name = "cube_lights"
	slot6 = folder_name
	params.source_path = self.create_temp_saves(slot4, self) .. "\\"
	slot6 = self._lastdir .. "\\" .. folder_name

	self._make_dir("\\", self)

	params.output_path = self._lastdir .. "\\" .. folder_name .. "\\"
	slot6 = params

	self.create_cube_map("\\", self)

	return 
end
function CoreEditor:create_cube_map(params)
	slot7 = 500

	assert(self._vp.push_ref_fov(slot5, self._vp))

	slot5 = false

	self._vp.set_width_mul_enabled(slot3, self._vp)

	self._cubemap_params = params
	slot4 = params.cubes
	self._cubes_que = clone(slot3)

	if #self._cubes_que == 0 then
		slot5 = {
			name = "camera",
			position = self.camera(slot7).position(slot7)
		}
		slot8 = self
		slot8 = self.camera(slot7)

		table.insert(slot3, self._cubes_que)
	end

	self._saved_camera = {}
	slot5 = self
	slot5 = self.camera(slot4)
	self._saved_camera.aspect_ratio = self.camera(slot4).aspect_ratio(slot4)
	slot5 = self
	slot5 = self.camera(slot4)
	self._saved_camera.pos = self.camera(slot4).position(slot4)
	slot5 = self
	slot5 = self.camera(slot4)
	self._saved_camera.rot = self.camera(slot4).rotation(slot4)
	slot5 = self
	self._saved_camera.fov = self.camera_fov(slot4)
	slot5 = self
	slot5 = self.camera(slot4)
	self._saved_camera.near_range = self.camera(slot4).near_range(slot4)
	slot5 = self
	slot5 = self.camera(slot4)
	slot3 = self.camera(slot4).far_range(slot4)
	self._saved_camera.far_range = slot3
	slot4 = self
	slot5 = 1

	self.camera(slot3).set_aspect_ratio(slot3, self.camera(slot3))

	slot4 = self
	slot5 = 1

	self.camera(slot3).set_width_multiplier(slot3, self.camera(slot3))

	slot5 = false

	self.set_show_camera_info(slot3, self)

	slot5 = false

	self._layers[self._mission_layer_name].set_enabled(self._mission_layer_name, self._layers[self._mission_layer_name])

	self._saved_show_center = self._show_center
	self._show_center = false
	slot5 = {
		vis = false
	}

	self.on_hide_helper_units(self._mission_layer_name, self)

	self._saved_hidden_object = {}
	self._saved_hidden_units = {}
	slot4 = self._layers

	for name, layer in pairs(self._mission_layer_name) do
		slot11 = layer

		for _, unit in ipairs(layer.created_units(slot10)) do
			slot14 = unit
			slot17 = "leveltools"

			if unit.has_material_assigned(slot13, Idstring(slot16)) then
				slot16 = true

				self.set_unit_visible(slot13, self, unit)

				slot17 = "*"

				for _, obj in ipairs(unit.get_objects(unit, unit)) do
					slot21 = obj
					slot22 = true
					local match = string.find(slot18, obj.name(slot20), "s_", 1)

					if not match or match ~= 1 then
						slot21 = false

						obj.set_visibility(slot19, obj)

						slot21 = obj

						table.insert(slot19, self._saved_hidden_object)
					end
				end
			else
				slot14 = unit

				if unit.unit_data(slot13).hide_on_projection_light then
					slot16 = false

					self.set_unit_visible(slot13, self, unit)

					slot15 = unit

					table.insert(slot13, self._saved_hidden_units)
				end
			end
		end
	end

	if self._current_layer then
		slot4 = self._current_layer

		self._current_layer.update_unit_settings(slot3)
	end

	if managers.viewport and managers.viewport._sun_flare_effect then
		slot4 = managers.viewport._sun_flare_effect._sf_panel

		managers.viewport._sun_flare_effect._sf_panel.hide(slot3)
	end

	slot4 = self

	self.next_cube(slot3)

	return 
end
function CoreEditor:next_cube()
	if 0 < #self._cubes_que then
		slot4 = 1
		local cube = table.remove(slot2, self._cubes_que)
		slot6 = self._saved_camera.rot

		self.set_camera(self._cubes_que, self, cube.position)

		local resolution = cube.resolution or 512
		slot10 = 0

		self._set_appwin_fixed_resolution(slot4, Vector3(slot7, resolution + 4, resolution + 4))

		local params = {}
		slot8 = "cube_map_done"
		params.done_callback = callback(self, self, self)
		params.name = cube.name
		params.simple_postfix = self._cubemap_params.simple_postfix
		params.source_path = self._cubemap_params.source_path
		params.output_path = self._cubemap_params.output_path
		params.output_name = cube.output_name
		params.unit = cube.unit
		params.light = cube.light
		params.spot = cube.spot
		slot7 = params

		self._camera_controller.start_cube_map(self, self._camera_controller)

		return true
	end

	return false
end
function CoreEditor:cube_map_done()
	slot3 = self

	if self.next_cube(slot2) then
		return 
	end

	if self._cubemap_params.saved_environment then
		managers.viewport.set_default_environment(slot2, managers.viewport, self._cubemap_params.saved_environment, nil)
	end

	if self._saved_all_lights then
		slot3 = self._saved_all_lights

		for _, data in ipairs(slot2) do
			slot9 = data.enabled

			data.light.set_enable(slot7, data.light)
		end

		self._saved_all_lights = nil
	end

	if self._cubemap_params.lights then

		-- Decompilation error in this vicinity:
		slot3 = self
		slot3 = self.viewport(slot2)
		slot7 = "dof_prepare_post_processor"
		slot6 = self._default_post_processor_effect

		self.viewport(slot2).vp(slot2).set_post_processor_effect(slot2, self.viewport(slot2).vp(slot2), "World", Idstring(slot6))

		slot4 = "empty"
		slot4 = self
		slot4 = self.viewport(slot3)
		slot8 = "bloom_combine_post_processor"

		self.viewport(slot3).vp(slot3).set_post_processor_effect(slot3, self.viewport(slot3).vp(slot3), "World", Idstring(slot7))

		slot4 = self
		slot4 = self.viewport(slot3)
		slot6 = Idstring(bloom_combine_effect)
		slot9 = "deferred_lighting"

		self.viewport(slot3).vp(slot3).set_post_processor_effect(slot3, self.viewport(slot3).vp(slot3), "World", Idstring("deferred"))

		slot4 = self
		slot4 = self.viewport(slot3)
		slot6 = Idstring(Idstring)
		slot9 = "depth_project_empty"

		self.viewport(slot3).vp(slot3).set_post_processor_effect(slot3, self.viewport(slot3).vp(slot3), "World", Idstring("depth_projection"))

		slot4 = self
		slot4 = self.viewport(slot3)
		slot6 = Idstring(Idstring)
		slot9 = "volumetric_light_scatter"

		self.viewport(slot3).vp(slot3).set_post_processor_effect(slot3, self.viewport(slot3).vp(slot3), "World", Idstring("volumetric_light_scatter"))

		slot4 = self
		slot4 = self.viewport(slot3)
		slot6 = Idstring(Idstring)
		slot9 = "motion_blur"

		self.viewport(slot3).vp(slot3).set_post_processor_effect(slot3, self.viewport(slot3).vp(slot3), "World", Idstring("post_motion_blur"))

		slot5 = self._cubemap_params.output_path

		self._recompile(slot3, self)

		slot4 = self._cubemap_params.cubes

		for _, cube in ipairs(slot3) do
			slot10 = cube.enabled

			cube.light.set_enable(slot8, cube.light)

			slot10 = self._cubemap_params.output_path .. cube.output_name
			local texture_path = managers.database.entry_path(slot8, managers.database)
			slot13 = texture_path
			slot13 = false

			cube.light.set_projection_texture(managers.database, cube.light, Idstring(slot12), not cube.spot)
		end
	end

	slot4 = true

	self.set_show_camera_info(slot2, self)

	slot4 = true

	self._layers[self._mission_layer_name].set_enabled(self._mission_layer_name, self._layers[self._mission_layer_name])

	self._show_center = self._saved_show_center
	slot4 = {
		vis = true
	}

	self.on_hide_helper_units(self._mission_layer_name, self)

	slot3 = self._saved_hidden_object

	for _, obj in ipairs(self._mission_layer_name) do
		slot9 = true

		obj.set_visibility(slot7, obj)
	end

	slot3 = self._saved_hidden_units

	for _, unit in ipairs(slot2) do
		slot10 = true

		self.set_unit_visible(slot7, self, unit)
	end

	if managers.viewport and managers.viewport._sun_flare_effect then
		slot3 = managers.viewport._sun_flare_effect._sf_panel

		managers.viewport._sun_flare_effect._sf_panel.show(slot2)
	end

	if self._saved_camera then
		slot5 = self._saved_camera.rot

		self.set_camera(slot2, self, self._saved_camera.pos)

		slot4 = self._saved_camera.fov

		self.set_camera_fov(slot2, self)

		slot3 = self
		slot4 = self._saved_camera.aspect_ratio

		self.camera(slot2).set_aspect_ratio(slot2, self.camera(slot2))

		slot3 = self
		slot4 = self._saved_camera.near_range

		self.camera(slot2).set_near_range(slot2, self.camera(slot2))

		slot3 = self
		slot4 = self._saved_camera.far_range

		self.camera(slot2).set_far_range(slot2, self.camera(slot2))

		self._saved_camera = nil
	end

	slot4 = nil

	self._set_appwin_fixed_resolution(slot2, self)
	self._vp.set_width_mul_enabled(slot2, self._vp)

	slot5 = self._vp

	assert(self._vp.pop_ref_fov(true))

	return 
end

return 
