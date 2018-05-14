slot3 = "CoreManagerBase"

core.import(slot1, core)

CoreWorldCameraManager = CoreWorldCameraManager or class()
CoreWorldCameraManager.MAX_FOV_WIDENING_FACTOR = 1.3
function CoreWorldCameraManager:init()
	slot3 = World
	self._camera = World.create_camera(slot2)
	slot4 = 75

	self.set_default_fov(slot2, self)

	slot4 = self._default_fov

	self.set_fov(slot2, self)

	slot5 = 10000

	self.set_default_dof(slot2, self, 150)

	self._current_near_dof = self._default_near_dof
	self._current_far_dof = self._default_far_dof
	self._default_dof_padding = 100
	self._current_dof_padding = self._default_dof_padding
	self._default_dof_clamp = 1
	self._current_dof_clamp = self._default_dof_clamp
	slot5 = self._default_far_dof

	self.set_dof(slot2, self, self._default_near_dof)

	slot4 = managers.viewport.WORLD_CAMERA_NEAR_RANGE

	self._camera.set_near_range(slot2, self._camera)

	slot4 = managers.viewport.CAMERA_FAR_RANGE

	self._camera.set_far_range(slot2, self._camera)

	slot9 = CoreManagerBase.PRIO_WORLDCAMERA
	self._viewport = managers.viewport.new_vp(slot2, managers.viewport, 0, 0, 1, 1, "worldcamera")
	slot3 = self._viewport
	self._director = self._viewport.director(slot2)
	slot3 = self._director
	self._shaker = self._director.shaker(slot2)
	slot4 = self._camera
	slot7 = "world_camera"
	self._camera_controller = self._director.make_camera(slot2, self._director, Idstring(1))
	slot4 = self._camera

	self._viewport.set_camera(slot2, self._viewport)

	slot4 = self._camera_controller

	self._director.set_camera(slot2, self._director)

	slot4 = self._camera

	self._director.position_as(slot2, self._director)

	slot3 = self

	self._create_listener(slot2)

	self._use_gui = false
	slot3 = Overlay
	slot7 = 1
	self._workspace = Overlay.newgui(slot2).create_screen_workspace(slot2, Overlay.newgui(slot2), 0, 0, 1)
	slot3 = self._workspace
	slot3 = self._workspace.panel(slot2)
	slot6 = "core/guis/core_world_camera"
	self._gui = self._workspace.panel(slot2).gui(slot2, Idstring(0))
	self._gui_visible = nil
	slot4 = false

	self._set_gui_visible(slot2, self)

	slot3 = self

	self._clear_callback_lists(slot2)

	slot3 = self

	self._set_dof_effect(slot2)

	slot3 = self

	self.clear(slot2)

	return 
end
function CoreWorldCameraManager:use_gui()
	return self._use_gui
end
function CoreWorldCameraManager:_create_listener()
	slot5 = self._camera
	self._listener_id = managers.listener.add_listener(slot2, managers.listener, "world_camera")
	self._listener_activation_id = nil
	slot5 = {
		"world_camera"
	}

	managers.listener.add_set(slot2, managers.listener, "world_camera")

	return 
end
function CoreWorldCameraManager:set_default_fov(default_fov)
	self._default_fov = default_fov

	return 
end
function CoreWorldCameraManager:default_fov()
	return self._default_fov
end
function CoreWorldCameraManager:set_fov(fov)
	slot5 = fov

	self._camera.set_fov(slot3, self._camera)

	return 
end
function CoreWorldCameraManager:scale_worldcamera_fov(aspect_ratio)
	local base_aspect_ratio = tweak_data.gui.base_resolution.x / tweak_data.gui.base_resolution.y
	slot6 = aspect_ratio
	local aspect_ratio = math.min(slot4, base_aspect_ratio)
	slot7 = CoreWorldCameraManager.MAX_FOV_WIDENING_FACTOR
	local fov_scale = math.min(base_aspect_ratio, base_aspect_ratio / aspect_ratio)
	slot7 = self._world_cameras

	for _, worldcamera in pairs(base_aspect_ratio / aspect_ratio) do
		slot12 = worldcamera._keys

		for _, key in ipairs(slot11) do
			key.fov = key.base_fov * fov_scale
		end
	end

	return 
end
function CoreWorldCameraManager:set_default_dof(near_dof, far_dof)
	self._default_near_dof = near_dof
	self._default_far_dof = far_dof

	return 
end
function CoreWorldCameraManager:default_near_dof()
	return self._default_near_dof
end
function CoreWorldCameraManager:default_far_dof()
	return self._default_far_dof
end
function CoreWorldCameraManager:set_dof(dof)
	return 
end
function CoreWorldCameraManager:default_dof_padding()
	return self._default_dof_padding
end
function CoreWorldCameraManager:default_dof_clamp()
	return self._default_dof_clamp
end
function CoreWorldCameraManager:_set_dof_effect()
	self._dof = {
		update_callback = "update_world_camera"
	}
	slot4 = self
	self._dof.near_min = self.default_near_dof(slot3)
	slot4 = self
	self._dof.near_max = self.default_near_dof(slot3)
	slot4 = self
	self._dof.far_min = self.default_far_dof(slot3)
	slot4 = self
	self._dof.far_max = self.default_far_dof(slot3)
	self._dof.clamp = 1
	self._dof.prio = 1
	self._dof.name = "world_camera"
	self._dof.fade_in = 0
	self._dof.fade_out = 0

	return 
end
function CoreWorldCameraManager:destroy()
	slot3 = self

	self._destroy_listener(slot2)

	if self._viewport then
		slot3 = self._viewport

		self._viewport.destroy(slot2)

		self._viewport = nil
	end

	slot3 = self._workspace

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))

		self._workspace = nil
	end

	slot3 = self._camera

	if alive(slot2) then
		slot4 = self._camera

		World.delete_camera(slot2, World)

		self._camera = nil
	end

	return 
end
function CoreWorldCameraManager:_destroy_listener()
	if self._listener_id then
		slot4 = self._listener_id

		managers.listener.remove_listener(slot2, managers.listener)

		slot4 = "world_camera"

		managers.listener.remove_set(slot2, managers.listener)

		self._listener_id = nil
	end

	return 
end
function CoreWorldCameraManager:stop_simulation()
	slot3 = self

	self._clear_callback_lists(slot2)

	slot3 = self

	self.stop_world_camera(slot2)

	return 
end
function CoreWorldCameraManager:_clear_callback_lists()
	self._last_world_camera_done_callback_id = {}
	self._world_camera_done_callback_list = {}
	self._last_sequence_done_callback_id = {}
	self._sequence_done_callback_list = {}
	self._last_sequence_camera_clip_callback_id = {}
	self._sequence_camera_clip_callback_list = {}

	return 
end
function CoreWorldCameraManager:clear()
	self._world_cameras = {}
	self._world_camera_sequences = {}
	self._current_world_camera = nil

	return 
end
function CoreWorldCameraManager:current_world_camera()
	return self._current_world_camera
end
function CoreWorldCameraManager:save(file)
	local worldcameras = {}
	slot5 = self._world_cameras

	for name, world_camera in pairs(slot4) do
		slot10 = world_camera
		worldcameras[name] = world_camera.save_data_table(slot9)
	end

	local camera_data = {
		worldcameras = worldcameras,
		sequences = self._world_camera_sequences
	}
	slot6 = file
	slot10 = camera_data

	file.puts(slot5, ScriptSerializer.to_generic_xml(slot8, ScriptSerializer))

	return 
end
function CoreWorldCameraManager:load(param, world_id, translation, yaw)
	slot8 = param

	if not self._old_load(slot6, self) then
		if not param.worldcameras then
			slot8 = "Can't load world cameras, it is in new format but probably loaded from old level"

			Application.error(slot6, Application)

			return 
		end

		slot7 = param.worldcameras

		for name, camera_data in pairs(slot6) do
			slot10 = self._world_cameras
			slot14 = "WorldCamera"

			if not rawget(slot12, _G) then
				slot14 = "CoreWorldCamera"
				slot11 = rawget(slot12, _G)
			end

			slot14 = name
			slot10[name] = slot11.new(slot12, slot11)
			self._world_cameras[name].world_id = world_id or 0
			slot15 = yaw

			self._world_cameras[name].load(world_id or 0, self._world_cameras[name], camera_data, translation)
		end

		self._world_camera_sequences = param.sequences
		slot7 = self._world_camera_sequences

		for name, camera_sequence in pairs(slot6) do
			camera_sequence.world_id = world_id
		end
	end

	slot7 = self._world_cameras

	for _, worldcamera in pairs(slot6) do
		slot12 = worldcamera._keys

		for _, key in ipairs(slot11) do
			key.base_fov = key.fov
		end
	end

	slot8 = RenderSettings.resolution.x / RenderSettings.resolution.y

	self.scale_worldcamera_fov(slot6, self)

	return 
end
function CoreWorldCameraManager:destroy_world_cameras(world_id)
	slot4 = self._world_camera_sequences

	for name, camera_sequence in pairs(slot3) do
		if camera_sequence.world_id == world_id then
			self._world_camera_sequences[name] = nil
		end
	end

	slot4 = self._world_cameras

	for name, camera in pairs(slot3) do
		if camera.world_id == world_id then
			self._world_cameras[name] = nil
		end
	end

	return 
end
function CoreWorldCameraManager:_old_load(path)
	slot4 = path

	if type_name(slot3) ~= "string" then
		return false
	end

	slot6 = path
	local path = managers.database.entry_expanded_path(slot3, managers.database, "world_cameras")
	slot6 = path
	local node = SystemFS.parse_xml(managers.database, SystemFS)
	slot6 = node

	if node.name(SystemFS) ~= "world_cameras" then
		return false
	end

	slot6 = node

	for child in node.children(slot5) do
		slot10 = child

		if child.name(slot9) == "world_camera" then
			local world_camera_name = child.parameter(slot9, child)
			slot9 = self._world_cameras
			slot13 = "WorldCamera"

			if not rawget("name", _G) then
				slot13 = "CoreWorldCamera"
				slot10 = rawget(slot11, _G)
			end

			slot13 = world_camera_name
			slot9[world_camera_name] = slot10.new(slot11, slot10)
			slot12 = child

			self._world_cameras[world_camera_name].old_load(slot10.new(slot11, slot10), self._world_cameras[world_camera_name])
		else
			slot10 = child
			local name, value = parse_value_node(slot9)
			self[name] = value
		end
	end

	return true
end
function CoreWorldCameraManager:update(t, dt)
	if self._current_world_camera then
		slot7 = dt

		self._current_world_camera.update(slot4, self._current_world_camera, t)
	end

	return 
end
function CoreWorldCameraManager:_set_gui_visible(visible)
	if self._gui_visible ~= visible then
		if visible and self._use_gui then
			slot4 = self._workspace

			self._workspace.show(slot3)
		else
			slot4 = self._workspace

			self._workspace.hide(slot3)
		end

		self._gui_visible = visible
	end

	return 
end
function CoreWorldCameraManager:add_world_camera_done_callback(world_camera_name, func)
	self._last_world_camera_done_callback_id[world_camera_name] = self._last_world_camera_done_callback_id[world_camera_name] or 0
	self._last_world_camera_done_callback_id[world_camera_name] = self._last_world_camera_done_callback_id[world_camera_name] + 1
	self._world_camera_done_callback_list[world_camera_name] = self._world_camera_done_callback_list[world_camera_name] or {}
	self._world_camera_done_callback_list[world_camera_name][self._last_world_camera_done_callback_id[world_camera_name]] = func

	return self._last_world_camera_done_callback_id[world_camera_name]
end
function CoreWorldCameraManager:remove_world_camera_done_callback(world_camera_name, id)
	self._world_camera_done_callback_list[world_camera_name][id] = nil

	return 
end
function CoreWorldCameraManager:add_sequence_done_callback(sequence_name, func)
	self._last_sequence_done_callback_id[sequence_name] = self._last_sequence_done_callback_id[sequence_name] or 0
	self._last_sequence_done_callback_id[sequence_name] = self._last_sequence_done_callback_id[sequence_name] + 1
	self._sequence_done_callback_list[sequence_name] = self._sequence_done_callback_list[sequence_name] or {}
	self._sequence_done_callback_list[sequence_name][self._last_sequence_done_callback_id[sequence_name]] = func

	return self._last_sequence_done_callback_id[sequence_name]
end
function CoreWorldCameraManager:remove_sequence_done_callback(sequence_name, id)
	self._sequence_done_callback_list[sequence_name][id] = nil

	return 
end
function CoreWorldCameraManager:add_sequence_camera_clip_callback(sequence_name, clip, func)
	self._last_sequence_camera_clip_callback_id[sequence_name] = self._last_sequence_camera_clip_callback_id[sequence_name] or 0
	self._last_sequence_camera_clip_callback_id[sequence_name] = self._last_sequence_camera_clip_callback_id[sequence_name] + 1
	self._sequence_camera_clip_callback_list[sequence_name] = self._sequence_camera_clip_callback_list[sequence_name] or {}
	self._sequence_camera_clip_callback_list[sequence_name][clip] = self._sequence_camera_clip_callback_list[sequence_name][clip] or {}
	self._sequence_camera_clip_callback_list[sequence_name][clip][self._last_sequence_camera_clip_callback_id[sequence_name]] = func

	return self._last_sequence_camera_clip_callback_id[sequence_name]
end
function CoreWorldCameraManager:remove_sequence_camera_clip_callback(sequence_name, clip, id)
	self._sequence_camera_clip_callback_list[sequence_name][clip][id] = nil

	return 
end
function CoreWorldCameraManager:create_world_camera(world_camera_name)
	slot2 = self._world_cameras
	slot6 = "WorldCamera"

	if not rawget(slot4, _G) then
		slot6 = "CoreWorldCamera"
		slot3 = rawget(slot4, _G)
	end

	slot6 = world_camera_name
	slot2[world_camera_name] = slot3.new(slot4, slot3)

	return self._world_cameras[world_camera_name]
end
function CoreWorldCameraManager:remove_world_camera(world_camera_name)
	self._world_cameras[world_camera_name] = nil

	return 
end
function CoreWorldCameraManager:all_world_cameras()
	return self._world_cameras
end
function CoreWorldCameraManager:world_camera(world_camera)
	return self._world_cameras[world_camera]
end
function CoreWorldCameraManager:play_world_camera(world_camera_name)
	local s = {}
	slot6 = world_camera_name
	s[MULTRES] = self._camera_sequence_table(slot4, self)
	slot7 = s

	self.play_world_camera_sequence(slot4, self, nil)

	return 
end
function CoreWorldCameraManager:new_play_world_camera(world_camera_sequence)
	local world_camera = self._world_cameras[world_camera_sequence.name]

	if world_camera then
		if self._current_world_camera then
			slot5 = self._current_world_camera

			self._current_world_camera.stop(slot4)
		end

		self._current_world_camera = world_camera
		slot6 = world_camera_sequence
		local ok, msg = self._current_world_camera.play(slot4, self._current_world_camera)

		if not ok then
			slot7 = Application

			if Application.editor(slot6) then
				slot8 = msg

				managers.editor.output_error(slot6, managers.editor)
			end

			slot7 = self

			self.stop_world_camera(slot6)

			return 
		end
	else
		slot8 = "did not exist."

		Application.error(slot4, Application, "WorldCamera named", world_camera_sequence.name)
	end

	return 
end
function CoreWorldCameraManager:stop_world_camera()
	if not self._current_world_camera then
		return 
	end

	local stop_camera = self._current_world_camera
	slot4 = stop_camera

	stop_camera.stop(slot3)

	if self._current_sequence then
		if self._sequence_camera_clip_callback_list[self._current_sequence_name] and self._sequence_camera_clip_callback_list[self._current_sequence_name][self._sequence_index] then
			slot4 = self._sequence_camera_clip_callback_list[self._current_sequence_name][self._sequence_index]

			for id, func in pairs(slot3) do
				slot12 = id

				self.remove_sequence_camera_clip_callback(slot8, self, self._current_sequence_name, self._sequence_index)

				slot11 = id

				func(slot8, self._current_sequence_name, self._sequence_index)
			end
		end

		if self._sequence_index < #self._current_sequence then
			self._sequence_index = self._sequence_index + 1
			slot5 = self._current_sequence[self._sequence_index]

			self.new_play_world_camera(slot3, self)
		else
			self._current_world_camera = nil
			slot4 = self

			self._sequence_done(slot3)
		end
	end

	slot5 = stop_camera

	if self._world_camera_done_callback_list[stop_camera.name(slot4)] then
		slot7 = stop_camera
		slot4 = self._world_camera_done_callback_list[stop_camera.name(slot6)]

		for id, func in pairs(slot3) do
			slot12 = stop_camera

			self.remove_world_camera_done_callback(slot8, self, stop_camera.name(id))

			slot10 = id

			func(slot8, stop_camera)
		end
	end

	return 
end
function CoreWorldCameraManager:create_world_camera_sequence(name)
	self._world_camera_sequences[name] = {}

	return self._world_camera_sequences[name]
end
function CoreWorldCameraManager:remove_world_camera_sequence(name)
	self._world_camera_sequences[name] = nil

	return 
end
function CoreWorldCameraManager:all_world_camera_sequences()
	return self._world_camera_sequences
end
function CoreWorldCameraManager:world_camera_sequence(name)
	return self._world_camera_sequences[name]
end
function CoreWorldCameraManager:add_camera_to_sequence(name, c_name)
	local sequence = self._world_camera_sequences[name]

	if not sequence then
		slot9 = "did not exist."

		Application.error(slot5, Application, "World camera sequence named", name)

		return 
	end

	slot6 = sequence
	slot10 = c_name

	table.insert(slot5, self._camera_sequence_table(slot8, self))

	return #sequence
end
function CoreWorldCameraManager:insert_camera_to_sequence(name, camera_sequence_table, index)
	local sequence = self._world_camera_sequences[name]

	if not sequence then
		slot10 = "did not exist."

		Application.error(slot6, Application, "World camera sequence named", name)

		return 
	end

	slot9 = camera_sequence_table

	table.insert(slot6, sequence, index)

	return #sequence
end
function CoreWorldCameraManager:remove_camera_from_sequence(name, index)
	local sequence = self._world_camera_sequences[name]
	local camera_sequence_table = sequence[index]
	slot8 = index

	table.remove(slot6, sequence)

	return camera_sequence_table
end
function CoreWorldCameraManager:_camera_sequence_table(name)
	local t = {
		name = name,
		start = 0,
		stop = 1
	}

	return t
end
function CoreWorldCameraManager:_break_sequence()
	if self._current_sequence then
		slot3 = self

		self._sequence_done(slot2)
	end

	return 
end
function CoreWorldCameraManager:_sequence_done()
	if self._current_sequence_stay_active then
		return 
	end

	slot4 = false

	self._set_listener_enabled(slot2, self)

	slot3 = self

	self._reset_old_viewports(slot2)

	slot3 = self

	self.stop_dof(slot2)

	slot4 = false

	self._set_gui_visible(slot2, self)

	slot5 = false

	managers.sound_environment.set_check_object_active(slot2, managers.sound_environment, self._sound_environment_check_object)

	local done_sequence = self._current_sequence
	local done_sequence_name = self._current_sequence_name
	self._current_sequence = nil
	self._current_sequence_name = nil

	if self._sequence_done_callback_list[done_sequence_name] then
		slot5 = self._sequence_done_callback_list[done_sequence_name]

		for id, func in pairs(slot4) do
			slot12 = id

			self.remove_sequence_done_callback(slot9, self, done_sequence_name)

			slot11 = id

			func(slot9, done_sequence)
		end
	end

	if self._old_game_state_name then
		slot6 = self._old_game_state_name

		game_state_machine.change_state_by_name(slot4, game_state_machine)

		self._old_game_state_name = nil
	end

	return 
end
function CoreWorldCameraManager:stop_sequences()
	self._current_sequence_stay_active = false
	self._old_game_state_name = self._suspended_game_state_name

	if self._current_sequence then
		slot3 = self

		self._sequence_done(slot2)
	end

	self._suspended_game_state_name = nil

	return 
end
function CoreWorldCameraManager:play_world_camera_sequence(name, sequence, stay_active)
	slot6 = game_state_machine

	if game_state_machine.current_state_name(slot5) ~= "editor" and not stay_active then
		slot6 = game_state_machine
		self._old_game_state_name = game_state_machine.current_state_name(slot5)
	elseif stay_active and not self._suspended_game_state_name then
		slot6 = game_state_machine
		self._suspended_game_state_name = game_state_machine.current_state_name(slot5)
	end

	local sequence = self._world_camera_sequences[name] or sequence

	if not sequence then
		slot10 = "did not exist."

		Application.error(slot6, Application, "World camera sequence named", name)

		return 
	end

	if #sequence == 0 then
		slot10 = "did not have any cameras."

		Application.error(slot6, Application, "World camera sequence named", name)

		return 
	end

	slot8 = "world_camera"

	game_state_machine.change_state_by_name(slot6, game_state_machine)

	slot7 = self

	self._break_sequence(slot6)

	self._current_sequence = sequence
	self._current_sequence_name = name
	self._current_sequence_stay_active = stay_active

	if not self._sound_environment_check_object then
		slot8 = {
			primary = true,
			active = false,
			object = self._camera
		}
		self._sound_environment_check_object = managers.sound_environment.add_check_object(slot6, managers.sound_environment)
	end

	slot9 = true

	managers.sound_environment.set_check_object_active(slot6, managers.sound_environment, self._sound_environment_check_object)

	slot7 = self

	self._use_vp(slot6)

	slot8 = true

	self._set_gui_visible(slot6, self)

	slot8 = true

	self._set_listener_enabled(slot6, self)

	self._sequence_index = 1
	slot8 = self._current_sequence[self._sequence_index]

	self.new_play_world_camera(slot6, self)

	return 
end
function CoreWorldCameraManager:_use_vp()
	slot3 = self
	slot4 = true

	self.viewport(slot2).set_active(slot2, self.viewport(slot2))

	return 
end
function CoreWorldCameraManager:_reset_old_viewports()
	slot3 = self
	slot4 = false

	self.viewport(slot2).set_active(slot2, self.viewport(slot2))

	return 
end
function CoreWorldCameraManager:_set_listener_enabled(enabled)
	if enabled then
		if not self._listener_activation_id then
			slot6 = "world_camera"
			self._listener_activation_id = managers.listener.activate_set(slot3, managers.listener, "main")
		end
	elseif self._listener_activation_id then
		slot5 = self._listener_activation_id

		managers.listener.deactivate_set(slot3, managers.listener)

		self._listener_activation_id = nil
	end

	return 
end
function CoreWorldCameraManager:start_dof()
	if not self._using_dof then
		self._using_dof = true
		slot4 = self._dof
		self._dof_effect_id = managers.DOF.play(slot2, managers.DOF)
	end

	return 
end
function CoreWorldCameraManager:stop_dof()
	slot4 = self._dof_effect_id

	managers.DOF.stop(slot2, managers.DOF)

	self._dof_effect_id = nil
	self._using_dof = false

	return 
end
function CoreWorldCameraManager:using_dof()
	return self._using_dof
end
function CoreWorldCameraManager:update_dof_values(near_dof, far_dof, dof_padding, dof_clamp)
	self._current_near_dof = near_dof
	self._current_far_dof = far_dof
	self._current_dof_padding = dof_padding
	self._current_dof_clamp = dof_clamp
	slot10 = dof_clamp

	managers.DOF.set_effect_parameters(slot6, managers.DOF, self._dof_effect_id, {
		near_min = near_dof,
		near_max = near_dof - dof_padding,
		far_min = far_dof,
		far_max = far_dof + dof_padding
	})

	return 
end
function CoreWorldCameraManager:viewport()
	return self._viewport
end
function CoreWorldCameraManager:director()
	return self._director
end
function CoreWorldCameraManager:workspace()
	return self._workspace
end
function CoreWorldCameraManager:camera()
	return self._camera
end
function CoreWorldCameraManager:camera_controller()
	return self._camera_controller
end
CoreWorldCamera = CoreWorldCamera or class()
function CoreWorldCamera:init(world_camera_name)
	self._world_camera_name = world_camera_name
	self._points = {}
	self._positions = {}
	self._target_positions = {}
	self._duration = 2.5
	self._delay = 0
	self._playing = false
	self._target_offset = 1000
	self._in_accelerations = {}
	self._out_accelerations = {}
	self._in_accelerations.linear = 0.33
	self._out_accelerations.linear = 0.66
	self._in_accelerations.ease = 0
	self._out_accelerations.ease = 1
	self._in_accelerations.fast = 0.5
	self._out_accelerations.fast = 0.5
	self._in_acc = self._in_accelerations.linear
	self._out_acc = self._out_accelerations.linear
	self._old_viewport = nil
	self._keys = {}
	local time = 0
	local fov = managers.worldcamera.default_fov(slot4)
	local near_dof = managers.worldcamera.default_near_dof(managers.worldcamera)
	local far_dof = managers.worldcamera.default_far_dof(managers.worldcamera)
	slot9 = {
		roll = 0,
		time = time,
		fov = fov,
		near_dof = near_dof,
		far_dof = far_dof
	}

	table.insert(managers.worldcamera, self._keys)

	slot8 = managers.worldcamera
	self._dof_padding = managers.worldcamera.default_dof_padding(managers.worldcamera)
	slot8 = managers.worldcamera
	self._dof_clamp = managers.worldcamera.default_dof_clamp(managers.worldcamera)
	self._curve_type = "bezier"

	return 
end
function CoreWorldCamera:save_data_table()
	local t = {
		name = self._world_camera_name,
		duration = self._duration,
		delay = self._delay,
		in_acc = self._in_acc,
		out_acc = self._out_acc,
		positions = self._positions,
		target_positions = self._target_positions,
		keys = self._keys,
		dof_padding = self._dof_padding,
		dof_clamp = self._dof_clamp,
		curve_type = self._curve_type,
		spline_metadata = self._spline_metadata
	}

	return t
end
function CoreWorldCamera:load(values, translation, yaw)
	self._duration = values.duration
	self._delay = values.delay
	self._in_acc = values.in_acc
	self._out_acc = values.out_acc
	self._positions = values.positions
	self._target_positions = values.target_positions
	self._keys = values.keys
	self._dof_padding = values.dof_padding
	self._dof_clamp = values.dof_clamp
	self._curve_type = values.curve_type
	self._spline_metadata = values.spline_metadata
	slot9 = yaw

	Application.trace(slot5, Application, "[CoreWorldCamera:load]  ", translation)

	slot6 = self._positions

	for i, position in ipairs(slot5) do
		slot12 = position
		slot17 = 0
		self._positions[i] = position.rotate_with(slot11, Rotation(slot14, yaw, 0)) + translation
	end

	slot6 = self._target_positions

	for i, target_position in ipairs(slot5) do
		slot12 = target_position
		slot17 = 0
		self._target_positions[i] = target_position.rotate_with(slot11, Rotation(slot14, yaw, 0)) + translation
	end

	slot6 = self

	self._check_loaded_data(slot5)

	return 
end
function CoreWorldCamera:_check_loaded_data()
	slot3 = self._keys

	for _, key in pairs(slot2) do
		key.roll = key.roll or 0
	end

	return 
end
function CoreWorldCamera:old_load(node)
	slot7 = "duration"
	self._duration = tonumber(node.parameter(slot5, node))
	slot7 = "delay"
	self._delay = tonumber(node.parameter(slot5, node))
	slot5 = "in_acc"

	if node.has_parameter(slot3, node) then
		slot7 = "in_acc"
		self._in_acc = tonumber(node.parameter(slot5, node))
	end

	slot5 = "out_acc"

	if node.has_parameter(slot3, node) then
		slot7 = "out_acc"
		self._out_acc = tonumber(node.parameter(slot5, node))
	end

	slot4 = node

	for child in node.children(slot3) do
		slot8 = child

		if child.name(slot7) == "point" then
			slot11 = "index"
			local index = tonumber(child.parameter(slot9, child))
			slot9 = child

			for value in child.children(child.parameter) do
				slot13 = value

				if value.name(slot12) == "pos" then
					slot17 = "value"
					self._positions[index] = math.string_to_vector(value.parameter(slot15, value))
				else
					slot13 = value

					if value.name(slot12) == "t_pos" then
						slot17 = "value"
						self._target_positions[index] = math.string_to_vector(value.parameter(slot15, value))
					end
				end
			end
		else
			slot8 = child

			if child.name(slot7) == "value" then
				slot8 = child
				local name, value = parse_value_node(slot7)
				self[name] = value
			end
		end
	end

	return 
end
function CoreWorldCamera:duration()
	return self._duration
end
function CoreWorldCamera:set_duration(duration)
	self._duration = duration

	return 
end
function CoreWorldCamera:duration()
	return self._duration
end
function CoreWorldCamera:set_delay(delay)
	self._delay = delay

	return 
end
function CoreWorldCamera:delay()
	return self._delay
end
function CoreWorldCamera:set_dof_padding(dof_padding)
	self._dof_padding = dof_padding

	return 
end
function CoreWorldCamera:dof_padding()
	return self._dof_padding
end
function CoreWorldCamera:set_dof_clamp(dof_clamp)
	self._dof_clamp = dof_clamp

	return 
end
function CoreWorldCamera:dof_clamp()
	return self._dof_clamp
end
function CoreWorldCamera:name()
	return self._world_camera_name
end
function CoreWorldCamera:in_acc()
	return self._in_acc
end
function CoreWorldCamera:out_acc()
	return self._out_acc
end
function CoreWorldCamera:set_sine_segment_position(new_pos, segment_index, segments, ctrl_points)
	local old_pos = segments[segment_index]
	local offset = new_pos - old_pos

	if ctrl_points.p1 then
		ctrl_points.p1 = ctrl_points.p1 + offset
		segments[segment_index] = new_pos

		if ctrl_points.p2 then
			slot10 = new_pos

			mvector3.set(slot8, offset)

			slot10 = ctrl_points.p1

			mvector3.subtract(slot8, offset)

			slot9 = offset
			slot13 = ctrl_points.p2

			mvector3.set_length(slot8, mvector3.distance(slot11, old_pos))

			slot10 = new_pos

			mvector3.add(slot8, offset)

			ctrl_points.p2 = offset
		end
	elseif ctrl_points.p2 then
		ctrl_points.p2 = ctrl_points.p2 + offset
		segments[segment_index] = new_pos
	end

	return 
end
function CoreWorldCamera:set_control_point_length(len_p1, len_p2, segment_index)
	local positions = self._positions
	local temp_vector = nil

	if len_p1 and 1 < segment_index then
		temp_vector = self._spline_metadata.ctrl_points[segment_index].p1 - positions[segment_index]
		slot9 = len_p1

		mvector3.set_length(positions[segment_index], temp_vector)

		self._spline_metadata.ctrl_points[segment_index].p1 = positions[segment_index] + temp_vector
	end

	if len_p2 and segment_index < #positions then
		if temp_vector then
			slot9 = self._spline_metadata.ctrl_points[segment_index].p2

			mvector3.set(slot7, temp_vector)

			slot9 = positions[segment_index]

			mvector3.subtract(slot7, temp_vector)
		else
			temp_vector = self._spline_metadata.ctrl_points[segment_index].p2 - positions[segment_index]
		end

		slot9 = len_p2

		mvector3.set_length(slot7, temp_vector)

		slot9 = positions[segment_index]

		mvector3.add(slot7, temp_vector)

		self._spline_metadata.ctrl_points[segment_index].p2 = temp_vector
	end

	return 
end
function CoreWorldCamera:rotate_control_points(p2_p1_vec, segment_index)
	local positions = self._positions
	local temp_vector = nil

	if 1 < segment_index then
		slot8 = positions[segment_index]
		local p1_len = mvector3.distance(slot6, self._spline_metadata.ctrl_points[segment_index].p1)
		temp_vector = -p2_p1_vec
		slot9 = p1_len

		mvector3.set_length(self._spline_metadata.ctrl_points[segment_index].p1, temp_vector)

		self._spline_metadata.ctrl_points[segment_index].p1 = positions[segment_index] + temp_vector
	end

	if segment_index < #positions then
		slot8 = positions[segment_index]
		local p2_len = mvector3.distance(slot6, self._spline_metadata.ctrl_points[segment_index].p2)

		if temp_vector then
			slot8 = temp_vector

			mvector3.negate(slot7)
		else
			slot8 = p2_p1_vec
			temp_vector = mvector3.copy(slot7)
		end

		slot9 = p2_len

		mvector3.set_length(slot7, temp_vector)

		self._spline_metadata.ctrl_points[segment_index].p2 = positions[segment_index] + temp_vector
	end

	return 
end
function CoreWorldCamera:set_curve_type_bezier()
	self._curve_type = "bezier"
	self._spline_metadata = nil

	while 4 < #self._positions do
		slot3 = self._positions

		table.remove(slot2)

		slot3 = self._target_positions

		table.remove(slot2)
	end

	self._editor_random_access_data = nil

	return 
end
function CoreWorldCamera:set_curve_type_sine()
	self._curve_type = "sine"

	if 2 < #self._positions then
		slot3 = self

		self.extract_spline_metadata(slot2)
	end

	self._editor_random_access_data = nil

	return 
end
function CoreWorldCamera:in_acc_string()
	slot3 = self._in_accelerations

	for name, value in pairs(slot2) do
		if value == self._in_acc then
			return name
		end
	end

	return 
end
function CoreWorldCamera:out_acc_string()
	slot3 = self._out_accelerations

	for name, value in pairs(slot2) do
		if value == self._out_acc then
			return name
		end
	end

	return 
end
function CoreWorldCamera:set_in_acc(in_acc)
	self._in_acc = self._in_accelerations[in_acc]

	return 
end
function CoreWorldCamera:set_out_acc(out_acc)
	self._out_acc = self._out_accelerations[out_acc]

	return 
end
function CoreWorldCamera:positions_at_time_bezier(time)
	slot5 = time
	local acc = math.bezier(slot3, {
		0,
		self._in_acc,
		self._out_acc,
		1
	})

	if not self._bezier then
		slot5 = self
		local b_type = self.bezier_function(slot4)
	end

	if b_type then
		slot7 = acc
		local pos = b_type(slot5, self._positions)
		slot8 = acc
		local t_pos = b_type(self._positions, self._target_positions)

		return pos, t_pos
	end

	return self._positions[1], self._target_positions[1]
end
function CoreWorldCamera:update(t, dt)
	if self._timer < self._stop_timer then
		self._timer = self._timer + dt / self._duration
		local pos, t_pos = self.play_to_time(dt / self._duration, self)

		self.update_camera(self._timer, self, pos)

		slot7 = self
		slot12 = "fov"

		self.set_current_fov(self._timer, self.value_at_time(t_pos, self, self._timer))

		slot9 = "near_dof"
		local near_dof = self.value_at_time(self._timer, self, self._timer)
		slot10 = "far_dof"
		local far_dof = self.value_at_time(self, self, self._timer)
		slot13 = self._dof_clamp

		self.update_dof_values(self, self, near_dof, far_dof, self._dof_padding)

		slot14 = "roll"
		local rot = Rotation(self, self.value_at_time(t_pos - pos, self, self._timer))
		slot10 = managers.worldcamera
		slot10 = managers.worldcamera.camera_controller(t_pos - pos.normalized(near_dof))
		slot13 = rot

		managers.worldcamera.camera_controller(t_pos - pos.normalized(near_dof)).set_default_up(t_pos - pos.normalized(near_dof), rot.z(self))
	elseif 0 < self._delay and self._delay_timer < 1 then
		self._delay_timer = self._delay_timer + dt / self._delay
	else
		slot5 = managers.worldcamera

		managers.worldcamera.stop_world_camera(slot4)
	end

	return 
end
function CoreWorldCamera:positions_at_time(s_t)
	if self._curve_type == "sine" then
		if not self._editor_random_access_data then
			local metadata = self._spline_metadata
			slot8 = metadata.nr_subseg_per_seg
			local subsegment_positions, subsegment_distances = self.extract_editor_random_access_data(slot4, self, self._positions, metadata.ctrl_points)
			slot10 = metadata.nr_subseg_per_seg
			local tar_subsegment_positions, tar_subsegment_distances = self.extract_editor_random_access_data(self._positions, self, self._target_positions, metadata.tar_ctrl_points)
			self._editor_random_access_data = {
				subsegment_positions = subsegment_positions,
				subsegment_distances = subsegment_distances,
				tar_subsegment_positions = tar_subsegment_positions,
				tar_subsegment_distances = tar_subsegment_distances
			}
		end

		slot5 = s_t

		return self.positions_at_time_sine(slot3, self)
	else
		slot5 = s_t

		return self.positions_at_time_bezier(slot3, self)
	end

	return 
end
function CoreWorldCamera:play_to_time(s_t)
	if self._curve_type == "sine" then
		slot9 = 1
		local smooth_time = math.bezier(slot3, math.clamp(slot6, self._timer, 0))
		slot6 = smooth_time

		return self.play_to_time_sine({
			0,
			self._in_acc,
			self._out_acc,
			1
		}, self)
	else
		slot5 = self._timer

		return self.positions_at_time_bezier(slot3, self)
	end

	return 
end
function CoreWorldCamera:positions_at_time_sine(spline_t)
	local result_pos, result_look_pos = nil
	local positions = self._positions
	local tar_positions = self._target_positions

	if 2 < #positions then
		local rand_acc_data = self._editor_random_access_data
		local metadata = self._spline_metadata
		slot12 = metadata.spline_length
		local wanted_dis_in_spline = math.clamp(slot9, spline_t * metadata.spline_length, 0)
		local segment_lengths = metadata.segment_lengths
		slot12 = segment_lengths

		for seg_i, seg_dis in ipairs(0) do
			if wanted_dis_in_spline <= seg_dis or seg_i == #segment_lengths then
				local wanted_dis_in_segment = wanted_dis_in_spline - (segment_lengths[seg_i - 1] or 0)
				local subseg_positions = rand_acc_data.subsegment_positions[seg_i]
				local subseg_distances = rand_acc_data.subsegment_distances[seg_i]
				slot20 = subseg_distances

				for subseg_i, subseg_dis in ipairs(slot19) do
					if wanted_dis_in_segment <= subseg_dis or subseg_i == #subseg_distances then
						local wanted_dis_in_subseg = wanted_dis_in_segment - (subseg_distances[subseg_i - 1] or 0)
						local subseg_pos = subseg_positions[subseg_i]
						local prev_subseg_pos = subseg_positions[subseg_i - 1] or positions[seg_i]
						slot29 = prev_subseg_pos
						local subseg_len = mvector3.distance(slot27, subseg_pos)
						slot31 = 1
						local percent_in_subseg = math.clamp(subseg_pos, wanted_dis_in_subseg / subseg_len, 0)
						slot32 = percent_in_subseg
						result_pos = math.lerp(wanted_dis_in_subseg / subseg_len, prev_subseg_pos, subseg_pos)
						local percent_in_seg = wanted_dis_in_segment / (seg_dis - (segment_lengths[seg_i - 1] or 0))
						local tar_segment_lengths = metadata.tar_segment_lengths
						local tar_seg_len = tar_segment_lengths[seg_i] - (tar_segment_lengths[seg_i - 1] or 0)
						local wanted_dis_in_tar_seg = tar_seg_len * percent_in_seg
						local tar_subseg_positions = rand_acc_data.tar_subsegment_positions[seg_i]
						local tar_subseg_distances = rand_acc_data.tar_subsegment_distances[seg_i]
						slot36 = tar_subseg_distances

						for tar_subseg_i, tar_subseg_dis in ipairs(slot35) do
							if wanted_dis_in_tar_seg <= tar_subseg_dis or tar_subseg_i == #tar_subseg_distances then
								local wanted_dis_in_tar_subseg = wanted_dis_in_tar_seg - (tar_subseg_distances[tar_subseg_i - 1] or 0)
								local tar_subseg_pos = tar_subseg_positions[tar_subseg_i]
								local prev_tar_subseg_pos = tar_subseg_positions[tar_subseg_i - 1] or tar_positions[seg_i]
								slot45 = prev_tar_subseg_pos
								local tar_subseg_len = mvector3.distance(slot43, tar_subseg_pos)
								slot47 = 1
								local percent_in_tar_subseg = math.clamp(tar_subseg_pos, wanted_dis_in_tar_subseg / tar_subseg_len, 0)
								slot48 = percent_in_tar_subseg
								result_look_pos = result_pos + math.lerp(wanted_dis_in_tar_subseg / tar_subseg_len, prev_tar_subseg_pos, tar_subseg_pos)

								break
							end
						end

						return result_pos, result_look_pos
					end
				end
			end
		end
	elseif 1 < #positions then
		slot10 = spline_t
		result_pos = math.lerp(slot7, positions[1], positions[2])
		slot10 = spline_t
		result_look_pos = math.lerp(slot7, tar_positions[1], tar_positions[2])
		result_look_pos = result_pos + result_look_pos
	else
		result_pos = positions[1]
		result_look_pos = result_pos + tar_positions[1]
	end

	return result_pos, result_look_pos
end
function CoreWorldCamera:play_to_time_sine(s_t)
	local result_pos, result_look_pos = nil

	if 2 < #self._positions then
		local segments = self._positions
		local metadata = self._spline_metadata
		local runtime_data = self._spline_runtime_data.pos
		slot11 = metadata.spline_length
		local wanted_dis = math.clamp(slot8, s_t * metadata.spline_length, 0)
		local adv_seg = nil

		while runtime_data.seg_i == 0 or runtime_data.seg_dis < wanted_dis do
			runtime_data.seg_i = runtime_data.seg_i + 1
			runtime_data.seg_dis = metadata.segment_lengths[runtime_data.seg_i]
			adv_seg = true
		end

		if adv_seg then
			runtime_data.seg_len = metadata.segment_lengths[runtime_data.seg_i] - (metadata.segment_lengths[runtime_data.seg_i - 1] or 0)
			runtime_data.subseg_i = 0
			runtime_data.subseg_dis = 0
			runtime_data.subseg_len = nil
			runtime_data.subseg_pos = nil
			runtime_data.subseg_prev_pos = segments[runtime_data.seg_i]
		end

		local wanted_dis_in_seg = wanted_dis - (metadata.segment_lengths[runtime_data.seg_i - 1] or 0)
		local seg_pos = segments[runtime_data.seg_i]
		local next_seg_pos = segments[runtime_data.seg_i + 1]
		local seg_p1 = metadata.ctrl_points[runtime_data.seg_i + 1].p1
		local seg_p2 = metadata.ctrl_points[runtime_data.seg_i].p2

		while (not runtime_data.subseg_pos or runtime_data.subseg_dis < wanted_dis_in_seg) and runtime_data.subseg_i < metadata.nr_subseg_per_seg do
			runtime_data.subseg_i = runtime_data.subseg_i + 1
			slot21 = seg_p2
			local new_subseg_pos = self.position_at_time_on_segment(slot15, self, runtime_data.subseg_i / metadata.nr_subseg_per_seg, seg_pos, next_seg_pos, seg_p1)
			slot18 = new_subseg_pos
			runtime_data.subseg_len = mvector3.distance(slot16, runtime_data.subseg_pos or runtime_data.subseg_prev_pos)
			runtime_data.subseg_dis = runtime_data.subseg_dis + runtime_data.subseg_len
			runtime_data.subseg_prev_pos = runtime_data.subseg_pos or runtime_data.subseg_prev_pos
			runtime_data.subseg_pos = new_subseg_pos
		end

		local percentage_in_subseg = 1 - (runtime_data.subseg_dis - wanted_dis_in_seg) / runtime_data.subseg_len
		slot19 = percentage_in_subseg
		result_pos = math.lerp(slot16, runtime_data.subseg_prev_pos, runtime_data.subseg_pos)
		local percentage_in_seg = wanted_dis_in_seg / runtime_data.seg_len
		slot20 = runtime_data.seg_i
		result_look_pos = result_pos + 500 * self.cam_look_vec_on_segment(runtime_data.subseg_prev_pos, self, percentage_in_seg)
	elseif 1 < #self._positions then
		slot8 = s_t
		result_pos = math.lerp(slot5, self._positions[1], self._positions[2])
		slot8 = s_t
		result_look_pos = math.lerp(slot5, self._target_positions[1], self._target_positions[2])
		result_look_pos = result_pos + result_look_pos
	else
		result_pos = self._positions[1]
		result_look_pos = result_pos + self._target_positions[1]
	end

	return result_pos, result_look_pos
end
function CoreWorldCamera:cam_look_vec_on_segment(perc_in_seg, seg_i)
	local segments = self._target_positions
	local metadata = self._spline_metadata
	local runtime_data = self._spline_runtime_data.dir

	if runtime_data.seg_i ~= seg_i then
		runtime_data.seg_i = seg_i
		runtime_data.subseg_dis = 0
		runtime_data.subseg_i = 0
		runtime_data.subseg_pos = nil
		runtime_data.subseg_prev_pos = segments[runtime_data.seg_i]
	end

	local wanted_dis_in_seg = perc_in_seg * (metadata.tar_segment_lengths[seg_i] - (metadata.tar_segment_lengths[seg_i - 1] or 0))
	local seg_pos = segments[seg_i]
	local next_seg_pos = segments[seg_i + 1]
	local seg_p1 = metadata.tar_ctrl_points[seg_i + 1].p1
	local seg_p2 = metadata.tar_ctrl_points[seg_i].p2

	while (not runtime_data.subseg_pos or runtime_data.subseg_dis < wanted_dis_in_seg) and runtime_data.subseg_i < metadata.nr_subseg_per_seg do
		runtime_data.subseg_i = runtime_data.subseg_i + 1
		slot18 = seg_p2
		local new_subseg_pos = self.position_at_time_on_segment(slot12, self, runtime_data.subseg_i / metadata.nr_subseg_per_seg, seg_pos, next_seg_pos, seg_p1)
		slot15 = new_subseg_pos
		runtime_data.subseg_len = mvector3.distance(slot13, runtime_data.subseg_pos or runtime_data.subseg_prev_pos)
		runtime_data.subseg_dis = runtime_data.subseg_dis + runtime_data.subseg_len
		runtime_data.subseg_prev_pos = runtime_data.subseg_pos or runtime_data.subseg_prev_pos
		runtime_data.subseg_pos = new_subseg_pos
	end

	local percentage_in_subseg = 1 - (runtime_data.subseg_dis - wanted_dis_in_seg) / runtime_data.subseg_len
	slot16 = percentage_in_subseg
	local wanted_pos = math.lerp(slot13, runtime_data.subseg_prev_pos, runtime_data.subseg_pos)

	return wanted_pos
end
function CoreWorldCamera:position_at_time_on_segment(seg_t, pos_start, pos_end, p1, p2)
	slot10 = seg_t
	local ext_pos1 = math.lerp(slot7, pos_start, p2)
	slot11 = seg_t
	local ext_pos2 = math.lerp(pos_start, p1, pos_end)
	local xpo = (math.sin(p1) + 1) * 0.5
	slot13 = xpo

	return math.lerp((seg_t * 2 - 1) * 90, ext_pos1, ext_pos2)
end
function CoreWorldCamera:extract_spline_control_points(position_table, curviness, start_index, end_index)
	local control_points = {}
	start_index = start_index or 1
	slot9 = #position_table
	end_index = math.min(slot7, end_index or #position_table)

	if 2 < end_index then
		slot10 = end_index
		local i = math.clamp(slot7, start_index, 2)

		while i <= end_index do
			slot13 = curviness
			local segment_control_points = self.extract_control_points_at_index(slot8, self, position_table, control_points, i)
			control_points[i] = segment_control_points
			i = i + 1
		end
	end

	if start_index == 1 then
		slot12 = curviness
		local segment_control_points = self.extract_control_points_at_index(slot7, self, position_table, control_points, 1)
		control_points[1] = segment_control_points
	end

	return control_points
end
function CoreWorldCamera:extract_control_points_at_index(position_table, control_points, index, curviness)
	local pos = position_table[index]
	local segment_control_points = {}
	local tan_seg = nil

	if index == #position_table then
		local last_seg = pos - position_table[#position_table - 1]
		local last_vec = (control_points[#position_table - 1].p2 or position_table[1]) - position_table[#position_table - 1]
		slot13 = last_seg
		local last_angle = last_vec.angle(slot11, last_vec)
		slot14 = last_vec
		local last_rot = last_seg.cross(last_vec, last_seg)
		slot15 = 180 - 2 * last_angle
		last_rot = Rotation(last_seg, last_rot)
		slot15 = last_rot
		local w_vec = pos + last_vec.rotate_with(last_seg, last_vec)
		segment_control_points.p1 = w_vec
	elseif index == 1 then
		local first_vec = control_points[2].p1 - position_table[2]
		local first_seg = position_table[2] - position_table[1]
		slot13 = first_seg
		local first_angle = first_vec.angle(slot11, first_vec)
		slot14 = first_vec
		local first_rot = first_seg.cross(first_vec, first_seg)
		slot15 = 180 - 2 * first_angle
		first_rot = Rotation(first_seg, first_rot)
		slot16 = first_rot
		local w_vec = position_table[1] + first_vec.rotate_with(first_rot, first_vec)
		segment_control_points.p2 = w_vec
	else
		tan_seg = position_table[index + 1] - position_table[index - 1]
		slot14 = position_table[index - 1]
		slot11 = mvector3.distance(slot12, pos) * curviness

		mvector3.set_length(position_table[index - 1], tan_seg)

		segment_control_points.p1 = pos - tan_seg
		slot14 = position_table[index + 1]
		slot11 = mvector3.distance(slot12, pos) * curviness

		mvector3.set_length(position_table[index - 1], tan_seg)

		segment_control_points.p2 = pos + tan_seg
	end

	return segment_control_points
end
function CoreWorldCamera:extract_spline_metadata()
	local nr_subseg_per_seg = 30
	slot6 = 0.5
	local control_points = self.extract_spline_control_points(slot3, self, self._positions)
	slot8 = nr_subseg_per_seg
	local segment_lengths, spline_length = self.extract_segment_dis_markers(self, self, self._positions, control_points)
	slot9 = 0.5
	local tar_control_points = self.extract_spline_control_points(self._positions, self, self._target_positions)
	slot11 = nr_subseg_per_seg
	local tar_segment_lengths, tar_spline_length = self.extract_segment_dis_markers(self, self, self._target_positions, tar_control_points)
	self._spline_metadata = {
		ctrl_points = control_points,
		segment_lengths = segment_lengths,
		spline_length = spline_length,
		tar_ctrl_points = tar_control_points,
		tar_segment_lengths = tar_segment_lengths,
		tar_spline_length = tar_spline_length,
		nr_subseg_per_seg = nr_subseg_per_seg
	}

	return 
end
function CoreWorldCamera:extract_segment_dis_markers(segment_table, control_points, nr_subsegments)
	local segment_lengths = {}
	local spline_length = 0
	slot8 = segment_table

	for index, pos in ipairs(slot7) do
		if index == #segment_table then
			break
		end

		local next_seg_pos = segment_table[index + 1]
		local seg_p1 = control_points[index + 1].p1
		local seg_p2 = control_points[index].p2
		local seg_len = 0
		local subsegment_index = 1
		local prev_subseg_pos = pos

		while subsegment_index <= nr_subsegments do
			slot20 = subsegment_index / nr_subsegments
			local spline_t = math.min(slot18, 1)
			slot25 = seg_p2
			local subseg_pos = self.position_at_time_on_segment(1, self, spline_t, pos, next_seg_pos, seg_p1)
			slot22 = subseg_pos
			local subseg_len = mvector3.distance(self, prev_subseg_pos)
			seg_len = seg_len + subseg_len
			prev_subseg_pos = subseg_pos
			subsegment_index = subsegment_index + 1
		end

		spline_length = spline_length + seg_len
		slot20 = spline_length

		table.insert(slot18, segment_lengths)
	end

	return segment_lengths, spline_length
end
function CoreWorldCamera:extract_editor_random_access_data(segment_table, control_points, nr_subsegments)
	local subsegment_lengths = {}
	local subsegment_positions = {}
	slot8 = segment_table

	for index, pos in ipairs(slot7) do
		if index == #segment_table then
			break
		end

		local seg_subsegment_lengths = {}
		local seg_subsegment_positions = {}
		local next_seg_pos = segment_table[index + 1]
		local seg_p1 = control_points[index + 1].p1
		local seg_p2 = control_points[index].p2
		local seg_len = 0
		local subsegment_index = 1
		local prev_subseg_pos = pos

		while subsegment_index <= nr_subsegments do
			slot22 = subsegment_index / nr_subsegments
			local spline_t = math.min(slot20, 1)
			slot27 = seg_p2
			local subseg_pos = self.position_at_time_on_segment(1, self, spline_t, pos, next_seg_pos, seg_p1)
			slot24 = subseg_pos
			local subseg_len = mvector3.distance(self, prev_subseg_pos)
			seg_len = seg_len + subseg_len
			slot25 = seg_len

			table.insert(prev_subseg_pos, seg_subsegment_lengths)

			slot25 = subseg_pos

			table.insert(prev_subseg_pos, seg_subsegment_positions)

			prev_subseg_pos = subseg_pos
			subsegment_index = subsegment_index + 1
		end

		slot22 = seg_subsegment_lengths

		table.insert(slot20, subsegment_lengths)

		slot22 = seg_subsegment_positions

		table.insert(slot20, subsegment_positions)
	end

	return subsegment_positions, subsegment_lengths
end
function CoreWorldCamera:debug_draw_editor()
	local positions = self._positions
	local target_positions = self._target_positions
	local nr_segments = #positions

	if 0 < nr_segments then
		if 2 < nr_segments then
			if self._curve_type == "sine" then
				local metadata = self._spline_metadata
				local prev_subseg_pos = positions[1]
				slot8 = positions

				for seg_i, seg_pos in ipairs(slot7) do
					if seg_i == #positions then
						break
					end

					local seg_p1 = metadata.ctrl_points[seg_i + 1].p1
					local seg_p2 = metadata.ctrl_points[seg_i].p2
					local subsegment_index = 1
					local next_seg_pos = positions[seg_i + 1]

					while subsegment_index <= metadata.nr_subseg_per_seg do
						slot18 = subsegment_index / metadata.nr_subseg_per_seg
						local spline_t = math.min(slot16, 1)
						slot23 = seg_p2
						local subseg_pos = self.position_at_time_on_segment(1, self, spline_t, seg_pos, next_seg_pos, seg_p1)
						slot24 = 1

						Application.draw_line(self, Application, subseg_pos, prev_subseg_pos, 1, 1)

						prev_subseg_pos = subseg_pos
						subsegment_index = subsegment_index + 1
					end
				end
			else
				local step = 0.02
				local previous_pos = nil

				for i = step, 1, step do
					slot15 = self
					slot15 = self
					slot13 = i
					local acc = math.bezier(slot11, {
						0,
						self.in_acc(slot14),
						self.out_acc(slot14),
						1
					})
					slot14 = acc
					local cam_pos, cam_look_pos = self.positions_at_time_bezier(, self)

					if previous_pos then
						slot20 = 1

						Application.draw_line(slot14, Application, cam_pos, previous_pos, 1, 1)
					end

					previous_pos = cam_pos
					local look_dir = cam_look_pos - cam_pos
					slot17 = 100

					mvector3.set_length(slot15, look_dir)

					slot17 = cam_pos

					mvector3.add(slot15, look_dir)

					slot21 = 0

					Application.draw_line(slot15, Application, cam_pos, look_dir, 1, 1)
				end
			end
		end

		slot6 = positions

		for i, pos in ipairs(slot5) do
			if i ~= nr_segments then
				slot16 = 0.75

				Application.draw_line(slot10, Application, pos, positions[i + 1], 0.75, 0.75)
			end

			slot16 = 1

			Application.draw_sphere(slot10, Application, pos, 20, 1, 1)

			local t_pos = target_positions[i]
			slot16 = t_pos - pos
			slot17 = 0

			Application.draw_line(Application, Application, pos, pos + t_pos - pos.normalized(1) * 500, 1, 1)
		end
	end

	return 
end
function CoreWorldCamera:update_dof_values(...)
	slot3 = managers.worldcamera

	managers.worldcamera.update_dof_values(slot2, ...)

	return 
end
function CoreWorldCamera:set_current_fov(fov)
	slot5 = fov

	managers.worldcamera.set_fov(slot3, managers.worldcamera)

	return 
end
function CoreWorldCamera:play(sequence_data)
	if #self._positions == 0 then
		return false, "Camera " .. self._world_camera_name .. " didn't have any points."
	end

	if self._duration == 0 then
		return false, "Camera " .. self._world_camera_name .. " has duration 0, must be higher."
	end

	self._timer = sequence_data.start or 0
	self._stop_timer = sequence_data.stop or 1
	self._delay_timer = 0
	self._index = 1
	self._target_point = nil
	self._playing = true

	if not self._curve_type or self._curve_type == "bezier" then
		slot4 = self

		self.set_curve_type_bezier(slot3)

		slot4 = self
		self._bezier = self.bezier_function(slot3)
	end

	local runtime_data_pos = {
		seg_dis = 0,
		seg_len = 0,
		seg_i = 0,
		subseg_i = 0,
		subseg_prev_pos = self._positions[1]
	}
	local runtime_data_look_dir = {
		seg_i = 0,
		subseg_i = 0,
		subseg_prev_pos = self._target_positions[1]
	}
	self._spline_runtime_data = {
		pos = runtime_data_pos,
		dir = runtime_data_look_dir
	}

	self.update_camera(slot5, self, self._positions[1])

	slot6 = self
	slot11 = "fov"

	self.set_current_fov(slot5, self.value_at_time(self._target_positions[1], self, self._timer))

	return true
end
function CoreWorldCamera:stop()
	self._playing = false
	self._bezier = nil
	self._spline_runtime_data = nil

	return 
end
function CoreWorldCamera:bezier_function()
	if #self._positions == 2 then
		return math.linear_bezier
	elseif #self._positions == 3 then
		return math.quadratic_bezier
	elseif #self._positions == 4 then
		return math.bezier
	end

	return nil
end
function CoreWorldCamera:update_camera(pos, t_pos)
	slot5 = managers.worldcamera
	slot6 = pos

	managers.worldcamera.camera_controller(slot4).set_camera(slot4, managers.worldcamera.camera_controller(slot4))

	slot5 = managers.worldcamera
	slot6 = t_pos

	managers.worldcamera.camera_controller(slot4).set_target(slot4, managers.worldcamera.camera_controller(slot4))

	return 
end
function CoreWorldCamera:add_point(pos, rot)
	if self._curve_type == "sine" then
		slot6 = pos

		table.insert(slot4, self._positions)

		slot5 = self._target_positions
		slot8 = rot

		table.insert(slot4, rot.y(slot7))

		if #self._positions == 3 then
			slot5 = self

			self.extract_spline_metadata(slot4)
		elseif 3 < #self._positions then
			slot9 = #self._positions
			local new_control_points = self.extract_spline_control_points(slot4, self, self._positions, 0.5, #self._positions - 1)
			self._spline_metadata.ctrl_points[#self._positions - 1] = new_control_points[#self._positions - 1]
			self._spline_metadata.ctrl_points[#self._positions] = new_control_points[#self._positions]
			slot9 = self._spline_metadata.nr_subseg_per_seg
			local segment_lengths, spline_length = self.extract_segment_dis_markers(#self._positions, self, self._positions, self._spline_metadata.ctrl_points)
			self._spline_metadata.segment_lengths = segment_lengths
			self._spline_metadata.spline_length = spline_length
			slot12 = #self._target_positions
			new_control_points = self.extract_spline_control_points(self._positions, self, self._target_positions, 0.5, #self._target_positions - 1)
			self._spline_metadata.tar_ctrl_points[#self._target_positions - 1] = new_control_points[#self._target_positions - 1]
			self._spline_metadata.tar_ctrl_points[#self._target_positions] = new_control_points[#self._target_positions]
			slot11 = self._spline_metadata.nr_subseg_per_seg
			segment_lengths, spline_length = self.extract_segment_dis_markers(#self._target_positions, self, self._target_positions, self._spline_metadata.tar_ctrl_points)
			self._spline_metadata.tar_segment_lengths = segment_lengths
			self._spline_metadata.tar_spline_length = spline_length
		end

		slot5 = self

		self.delete_editor_random_access_data(slot4)
	elseif #self._positions < 4 then
		slot6 = pos

		table.insert(slot4, self._positions)

		slot8 = rot
		slot6 = pos + rot.y(slot7) * self._target_offset

		table.insert(slot4, self._target_positions)
	end

	return 
end
function CoreWorldCamera:get_points()
	return self._positions
end
function CoreWorldCamera:get_point(point)
	return {
		pos = self._positions[point],
		t_pos = self._target_positions[point]
	}
end
function CoreWorldCamera:delete_point(point)
	slot5 = point

	table.remove(slot3, self._positions)

	slot5 = point

	table.remove(slot3, self._target_positions)

	if self._curve_type == "sine" then
		if #self._positions < 3 then
			slot4 = self

			self.delete_spline_metadata(slot3)
		else
			slot5 = point

			table.remove(slot3, self._spline_metadata.ctrl_points)

			slot5 = point

			table.remove(slot3, self._spline_metadata.tar_ctrl_points)

			self._spline_metadata.ctrl_points[1].p1 = nil
			self._spline_metadata.ctrl_points[#self._positions].p2 = nil
			self._spline_metadata.tar_ctrl_points[1].p1 = nil
			self._spline_metadata.tar_ctrl_points[#self._target_positions].p2 = nil
			slot7 = self._spline_metadata.nr_subseg_per_seg
			local segment_lengths, spline_length = self.extract_segment_dis_markers(nil, self, self._positions, self._spline_metadata.ctrl_points)
			self._spline_metadata.segment_lengths = segment_lengths
			self._spline_metadata.spline_length = spline_length
			slot9 = self._spline_metadata.nr_subseg_per_seg
			segment_lengths, spline_length = self.extract_segment_dis_markers(self._positions, self, self._target_positions, self._spline_metadata.tar_ctrl_points)
			self._spline_metadata.tar_segment_lengths = segment_lengths
			self._spline_metadata.tar_spline_length = spline_length
		end

		slot4 = self

		self.delete_editor_random_access_data(slot3)
	end

	return 
end
function CoreWorldCamera:delete_spline_metadata()
	self._spline_metadata = nil

	return 
end
function CoreWorldCamera:delete_editor_random_access_data()
	self._editor_random_access_data = nil

	return 
end
function CoreWorldCamera:reset_control_points(segment_index)
	if self._curve_type == "sine" and 2 < #self._positions then
		slot8 = 0.5
		local control_points = self.extract_control_points_at_index(slot3, self, self._positions, self._spline_metadata.ctrl_points, segment_index)
		self._spline_metadata.ctrl_points[segment_index] = control_points
		slot8 = self._spline_metadata.nr_subseg_per_seg
		local segment_lengths, spline_length = self.extract_segment_dis_markers(self, self, self._positions, self._spline_metadata.ctrl_points)
		self._spline_metadata.spline_length = spline_length
		self._spline_metadata.segment_lengths = segment_lengths
		slot7 = self

		self.delete_editor_random_access_data(self._positions)
	end

	return 
end
function CoreWorldCamera:move_point(point, pos, rot)
	if self._curve_type == "sine" then
		if pos then
			if 2 < #self._positions then
				slot10 = self._spline_metadata.ctrl_points[point]

				self.set_sine_segment_position(slot5, self, pos, point, self._positions)

				slot9 = self._spline_metadata.nr_subseg_per_seg
				local segment_lengths, spline_length = self.extract_segment_dis_markers(slot5, self, self._positions, self._spline_metadata.ctrl_points)
				self._spline_metadata.spline_length = spline_length
				self._spline_metadata.segment_lengths = segment_lengths
			else
				self._positions[point] = pos
			end
		end

		if rot then
			if 2 < #self._positions then
				slot9 = rot
				slot10 = self._spline_metadata.tar_ctrl_points[point]

				self.set_sine_segment_position(slot5, self, rot.y(slot8), point, self._target_positions)

				slot10 = point + 1
				local new_control_points = self.extract_spline_control_points(slot5, self, self._target_positions, 0.5, point - 1)
				slot7 = new_control_points

				for k, v in pairs(self) do
					self._spline_metadata.tar_ctrl_points[k] = v
				end

				slot10 = self._spline_metadata.nr_subseg_per_seg
				local segment_lengths, spline_length = self.extract_segment_dis_markers(slot6, self, self._target_positions, self._spline_metadata.tar_ctrl_points)
				self._spline_metadata.tar_spline_length = spline_length
				self._spline_metadata.tar_segment_lengths = segment_lengths
			else
				slot7 = rot
				self._target_positions[point] = rot.y(slot6)
			end
		end

		slot6 = self

		self.delete_editor_random_access_data(slot5)
	else
		if pos then
			self._positions[point] = pos
		end

		if rot then
			slot6 = rot
			local t_pos = rot.y(slot5) * self._target_offset + self._positions[point]
			self._target_positions[point] = t_pos
		end
	end

	return 
end
function CoreWorldCamera:positions()
	return self._positions
end
function CoreWorldCamera:target_positions()
	return self._target_positions
end
function CoreWorldCamera:insert_point(index, position, rotation)
	return 
end
function CoreWorldCamera:keys()
	return self._keys
end
function CoreWorldCamera:key(i)
	return self._keys[i]
end
function CoreWorldCamera:next_key(time)
	local index = 1
	slot5 = self._keys

	for i, key in ipairs(slot4) do
		if key.time <= time then
			index = i + 1
		end
	end

	if #self._keys < index then
		index = #self._keys
	end

	return index
end
function CoreWorldCamera:prev_key(time, step)
	local index = 1
	slot6 = self._keys

	for i, key in ipairs(slot5) do
		if step then
			if key.time < time then
				index = i
			end
		elseif key.time <= time then
			index = i
		end
	end

	return index
end
function CoreWorldCamera:add_key(time)
	local index = 1
	local fov, near_dof, far_dof, roll = nil
	slot13 = "fov"
	fov = math.round(self.value_at_time(slot10, self, time))
	slot13 = "near_dof"
	near_dof = math.round(self.value_at_time(slot10, self, time))
	slot13 = "far_dof"
	far_dof = math.round(self.value_at_time(slot10, self, time))
	slot13 = "roll"
	roll = math.round(self.value_at_time(slot10, self, time))
	local key = {
		time = time,
		fov = fov,
		near_dof = near_dof,
		far_dof = far_dof,
		roll = roll
	}
	slot10 = self._keys

	for i, key in ipairs(self.value_at_time) do
		if key.time < time then
			index = i + 1
		else
			break
		end
	end

	slot12 = key

	table.insert(slot9, self._keys, index)

	return index, key
end
function CoreWorldCamera:delete_key(index)
	slot5 = index

	table.remove(slot3, self._keys)

	return 
end
function CoreWorldCamera:move_key(index, time)
	if #self._keys == 1 then
		self._keys[1].time = time

		return 1
	else
		local old_key = clone(slot4)
		slot7 = index

		self.delete_key(self._keys[index], self)

		slot7 = time
		local index, key = self.add_key(self._keys[index], self)
		key.fov = old_key.fov
		key.near_dof = old_key.near_dof
		key.far_dof = old_key.far_dof
		key.roll = old_key.roll

		return index
	end

	return 
end
function CoreWorldCamera:value_at_time(time, value)
	slot7 = value
	local prev_key = self.prev_value_key(slot4, self, time)
	slot8 = value
	local next_key = self.next_value_key(self, self, time)
	local mul = 1

	if next_key.time - prev_key.time ~= 0 then
		mul = (time - prev_key.time) / (next_key.time - prev_key.time)
	end

	local v = (next_key[value] - prev_key[value]) * mul + prev_key[value]

	return v
end
function CoreWorldCamera:prev_value_key(time, value)
	slot6 = time
	local index = self.prev_key(slot4, self)
	local key = self._keys[index]

	if key[value] then
		return key
	else
		slot9 = value

		return self.prev_value_key(slot6, self, key.time)
	end

	return 
end
function CoreWorldCamera:next_value_key(time, value)
	slot6 = time
	local index = self.next_key(slot4, self)
	local key = self._keys[index]

	if key[value] then
		return key
	else
		slot9 = value

		return self.next_value_key(slot6, self, key.time)
	end

	return 
end
function CoreWorldCamera:print_points()
	for i = 1, 4, 1 do
		slot10 = self._target_positions[i]

		cat_print(slot6, "debug", i, self._positions[i])
	end

	return 
end
function CoreWorldCamera:playing()
	return self._playing
end

return 
