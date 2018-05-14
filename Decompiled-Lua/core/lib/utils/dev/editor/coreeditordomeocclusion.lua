-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEditorUtils"

core.import(slot1, core)

function CoreEditor:init_create_dome_occlusion(shape, res)
	slot5 = "CoreEditor:init_create_dome_occlusion()"

	print(slot4)

	slot5 = self
	slot5 = self.viewport(slot4)
	slot7 = Idstring(slot8)
	slot10 = "empty"

	self.viewport(slot4).vp(slot4).set_post_processor_effect(slot4, self.viewport(slot4).vp(slot4), "World", Idstring("dof_prepare_post_processor"))

	slot5 = self
	slot5 = self.viewport(slot4)
	slot7 = Idstring(Idstring)
	slot10 = "empty"

	self.viewport(slot4).vp(slot4).set_post_processor_effect(slot4, self.viewport(slot4).vp(slot4), "World", Idstring("colorblind_correction_post"))

	slot5 = self
	slot5 = self.viewport(slot4)
	slot7 = Idstring(Idstring)
	slot10 = "bloom_combine_empty"

	self.viewport(slot4).vp(slot4).set_post_processor_effect(slot4, self.viewport(slot4).vp(slot4), "World", Idstring("bloom_combine_post_processor"))

	slot5 = self
	slot5 = self.viewport(slot4)
	slot7 = Idstring(Idstring)
	slot10 = "render_dome_occ"

	self.viewport(slot4).vp(slot4).set_post_processor_effect(slot4, self.viewport(slot4).vp(slot4), "World", Idstring("depth_projection"))

	slot5 = managers.viewport
	local saved_environment = managers.viewport.default_environment(slot4)
	local params = {
		res = res,
		shape = shape,
		saved_environment = saved_environment
	}
	slot8 = params

	self._create_dome_occlusion("World", self)

	return 
end
function CoreEditor:_create_dome_occlusion(params)
	self._dome_occlusion_params = params
	slot7 = 500

	assert(self._vp.push_ref_fov(slot5, self._vp))

	slot5 = false

	self._vp.set_width_mul_enabled(slot3, self._vp)

	slot9 = 0

	self._set_appwin_fixed_resolution(slot3, Vector3(self._vp, self._dome_occlusion_params.res + 4, self._dome_occlusion_params.res + 4))

	self._saved_camera = {}
	slot5 = self
	slot5 = self.camera(self)
	self._saved_camera.aspect_ratio = self.camera(self).aspect_ratio(self)
	slot5 = self
	slot5 = self.camera(self)
	self._saved_camera.pos = self.camera(self).position(self)
	slot5 = self
	slot5 = self.camera(self)
	self._saved_camera.rot = self.camera(self).rotation(self)
	slot5 = self
	self._saved_camera.fov = self.camera_fov(self)
	slot5 = self
	slot5 = self.camera(self)
	self._saved_camera.near_range = self.camera(self).near_range(self)
	slot5 = self
	slot5 = self.camera(self)
	slot3 = self.camera(self).far_range(self)
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

	local shape = self._dome_occlusion_params.shape
	local corner = shape.position(slot4)
	local w = shape.depth(shape)
	local d = shape.width(shape)
	slot8 = shape
	local h = shape.height(shape)
	local x = corner.x + w / 2
	local y = corner.y - d / 2
	local fov = 4
	slot13 = d
	local far_range = math.max(slot11, w) / 2 / math.tan(w)
	local z = corner.z + far_range
	slot15 = far_range + 10000

	self.set_camera_far_range(fov / 2, self)

	slot19 = z
	slot15 = Vector3(slot16, x, y)
	slot20 = 0

	self.set_camera(fov / 2, self, Rotation(x, 0, -90))

	slot15 = fov

	self.set_camera_fov(fov / 2, self)

	slot14 = self
	slot14 = self.viewport(fov / 2)
	slot15 = "World"
	slot18 = "depth_projection"
	local deferred_processor = self.viewport(fov / 2).vp(fov / 2).get_post_processor_effect(fov / 2, self.viewport(fov / 2).vp(fov / 2), Idstring(x))

	if not deferred_processor then
		slot15 = self

		self.dome_occlusion_done(slot14)

		return 
	end

	slot18 = "post_dome_occ"
	local post_dome_occ = deferred_processor.modifier(slot14, Idstring(slot17))
	self._dome_occ_corner = corner
	slot18 = h
	self._dome_occ_size = Vector3(deferred_processor, w, d)
	slot16 = post_dome_occ
	local dome_occ_feed = post_dome_occ.material(deferred_processor)

	if dome_occ_feed then
		slot20 = "dome_occ_pos"

		dome_occ_feed.set_variable(slot16, dome_occ_feed, Idstring(slot19))

		slot20 = "dome_occ_size"
		slot19 = self._dome_occ_size

		dome_occ_feed.set_variable(slot16, dome_occ_feed, Idstring(self._dome_occ_corner))
	end

	if not self._lastdir then
		slot17 = self

		self.dome_occlusion_done(slot16)

		return 
	end

	local folder_name = "cube_lights"
	local path = self._lastdir .. "\\" .. folder_name
	slot19 = path

	print(folder_name)

	self._dome_occlusion_params.file_name = "dome_occlusion"
	self._dome_occlusion_params.output_path = path
	self._dome_occlusion_params.step = 0
	slot20 = path

	self._make_dir(0, self)

	slot20 = path .. "\\"

	self.generate_dome_occlusion(0, self)

	return 
end
function CoreEditor:_tick_generate_dome_occlusion(t, dt)
	if self._dome_occlusion_params then
		self._dome_occlusion_params.step = self._dome_occlusion_params.step + 1

		if self._dome_occlusion_params.step == 2 then
			slot5 = self

			self._convert_dome_occlusion(slot4)
		elseif self._dome_occlusion_params.step == 3 then
			slot5 = self

			self.dome_occlusion_done(slot4)
		end
	end

	return 
end
function CoreEditor:generate_dome_occlusion(path)
	slot4 = self._camera_controller
	local x1, y1, x2, y2 = self._camera_controller._get_screen_size(slot3)
	slot13 = y2

	Application.screenshot(slot7, Application, path .. self._dome_occlusion_params.file_name .. ".tga", x1, y1, x2)

	return 
end
function CoreEditor:_convert_dome_occlusion()
	local path = self._dome_occlusion_params.output_path .. "\\"
	slot4 = managers.database
	local execute = managers.database.root_path(slot3) .. "aux_assets/engine/tools/spotmapgen.bat "
	execute = execute .. path .. self._dome_occlusion_params.file_name .. ".tga" .. " "
	local output_path = path .. self._dome_occlusion_params.file_name .. ".dds "
	execute = execute .. output_path .. " "
	slot7 = execute

	print(output_path, "execute")

	self._dome_occlusion_params.output_path_file = output_path .. self._dome_occlusion_params.file_name
	slot6 = execute

	os.execute(output_path .. self._dome_occlusion_params.file_name)

	slot8 = "colormap_no_alpha_no_mips"

	self._camera_controller._add_meta_data(output_path .. self._dome_occlusion_params.file_name, self._camera_controller, output_path)

	return 
end
function CoreEditor:dome_occlusion_done()

	-- Decompilation error in this vicinity:
	if not self._dome_occlusion_params then
		slot4 = "CoreEditor:dome_occlusion_done. Generate has not been started"

		Application.error(slot2, Application)

		return 
	end

	if self._dome_occlusion_params.saved_environment then
		managers.viewport.set_default_environment(slot2, managers.viewport, self._dome_occlusion_params.saved_environment, nil)
	end

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

	slot5 = self._dome_occlusion_params.output_path

	self._recompile(slot3, self)

	slot6 = self._dome_occ_size
	slot10 = self._dome_occlusion_params.output_path_file

	managers.environment_controller.set_dome_occ_params(slot3, managers.environment_controller, self._dome_occ_corner, managers.database.entry_path("depth_projection", managers.database))

	slot5 = true

	self.set_show_camera_info(slot3, self)

	slot5 = true

	self._layers[self._mission_layer_name].set_enabled(self._mission_layer_name, self._layers[self._mission_layer_name])

	self._show_center = self._saved_show_center
	slot5 = {
		vis = true
	}

	self.on_hide_helper_units(self._mission_layer_name, self)

	slot4 = self._saved_hidden_object

	for _, obj in ipairs(self._mission_layer_name) do
		slot10 = true

		obj.set_visibility(slot8, obj)
	end

	slot4 = self._saved_hidden_units

	for _, unit in ipairs(slot3) do
		slot11 = true

		self.set_unit_visible(slot8, self, unit)
	end

	if self._saved_camera then
		slot6 = self._saved_camera.rot

		self.set_camera(slot3, self, self._saved_camera.pos)

		slot5 = self._saved_camera.fov

		self.set_camera_fov(slot3, self)

		slot4 = self
		slot5 = self._saved_camera.aspect_ratio

		self.camera(slot3).set_aspect_ratio(slot3, self.camera(slot3))

		slot4 = self
		slot5 = self._saved_camera.near_range

		self.camera(slot3).set_near_range(slot3, self.camera(slot3))

		slot4 = self
		slot5 = self._saved_camera.far_range

		self.camera(slot3).set_far_range(slot3, self.camera(slot3))

		self._saved_camera = nil
	end

	slot5 = nil

	self._set_appwin_fixed_resolution(slot3, self)
	self._vp.set_width_mul_enabled(slot3, self._vp)

	slot6 = self._vp

	assert(self._vp.pop_ref_fov(true))

	self._dome_occlusion_params = nil

	return 
end

return 
