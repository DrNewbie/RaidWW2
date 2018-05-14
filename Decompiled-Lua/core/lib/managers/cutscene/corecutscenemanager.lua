-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/CoreCutscene"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutsceneKeys"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutsceneCast"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutscenePlayer"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutsceneActorDatabase"

require(slot1)

if not CoreCutsceneManager then
	slot3 = BasicEventHandling
	slot0 = mixin(slot1, class())
end

CoreCutsceneManager = slot0
function CoreCutsceneManager:cutscene_actor_unit_type(original_unit_type)
	return (Global.__CutsceneManager__replaced_actor_unit_types and Global.__CutsceneManager__replaced_actor_unit_types[original_unit_type]) or original_unit_type
end
function CoreCutsceneManager:replace_cutscene_actor_unit_type(original_unit_type, replacement_unit_type)
	slot9 = original_unit_type
	slot5 = DB.has(slot6, DB, "unit")
	slot8 = "Unrecognized Unit \"%s\"."
	slot11 = original_unit_type

	assert(slot4, string.format(DB, original_unit_type.t(slot10)))

	slot3 = assert

	if replacement_unit_type ~= nil then
		slot9 = replacement_unit_type
		slot5 = DB.has(slot6, DB, "unit")

		if DB.has(slot6, DB, "unit") then
			slot5 = false
		end
	else
		slot5 = true
	end

	slot8 = "Unrecognized Unit \"%s\"."
	slot11 = replacement_unit_type or ""

	slot3(slot4, string.format(slot7, replacement_unit_type or "".t(slot10)))

	Global.__CutsceneManager__replaced_actor_unit_types = Global.__CutsceneManager__replaced_actor_unit_types or {}

	if replacement_unit_type then
		slot5 = "cutscene"
		slot10 = replacement_unit_type

		cat_print(slot4, string.format(slot7, "[CoreCutsceneManager] Replacing all \"%s\" actors with instances of \"%s\".", original_unit_type))
	elseif Global.__CutsceneManager__replaced_actor_unit_types[original_unit_type] then
		slot5 = "cutscene"
		slot9 = original_unit_type

		cat_print(slot4, string.format(slot7, "[CoreCutsceneManager] Undoing replacement of all \"%s\" actors."))
	end

	Global.__CutsceneManager__replaced_actor_unit_types[original_unit_type] = replacement_unit_type

	return 
end
function CoreCutsceneManager:init()
	slot5 = {
		"cutscene"
	}

	managers.listener.add_set(slot2, managers.listener, "cutscene")

	slot3 = TimerManager
	self._timer = TimerManager.game_animation(slot2)
	slot3 = "CutsceneActorDatabase"
	self._actor_database = core_or_local(slot2)
	slot3 = managers.controller
	self._input_controller = managers.controller.create_controller(slot2)
	slot3 = self
	self._gui_workspace = self._create_gui_workspace(slot2)
	slot3 = self
	self._video_workspace = self._create_video_workspace(slot2)

	return 
end
function CoreCutsceneManager:post_init()
	slot3 = self

	self._prime_cutscenes_in_world(slot2)

	return 
end
function CoreCutsceneManager:destroy()
	if self._player then
		slot3 = self._player

		self._player.destroy(slot2)

		self._player = nil
	end

	slot3 = self

	self._destroy_units_with_cutscene_data_extension(slot2)

	slot3 = self._video_workspace

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._video_workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))
	end

	self._video_workspace = nil
	slot3 = self._gui_workspace

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._gui_workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))
	end

	self._gui_workspace = nil

	if self._input_controller then
		slot3 = self._input_controller

		self._input_controller.destroy(slot2)

		self._input_controller = nil
	end

	slot4 = "cutscene"

	managers.listener.remove_set(slot2, managers.listener)

	return 
end
function CoreCutsceneManager:timer()
	return self._timer
end
function CoreCutsceneManager:set_timer(timer)
	slot5 = "Must supply a timer."
	self._timer = assert(slot3, timer)

	if self._player then
		slot5 = timer

		self._player.set_timer(slot3, self._player)
	end

	slot4 = self

	if self.gui_workspace(slot3) then
		slot4 = self
		slot5 = self._timer

		self.gui_workspace(slot3).set_timer(slot3, self.gui_workspace(slot3))
	end

	slot4 = self

	if self.video_workspace(slot3) then
		slot4 = self
		slot5 = self._timer

		self.video_workspace(slot3).set_timer(slot3, self.video_workspace(slot3))
	end

	return 
end
function CoreCutsceneManager:register_unit_with_cutscene_data_extension(unit)
	self._units_with_cutscene_data_extension = self._units_with_cutscene_data_extension or {}
	slot5 = unit

	table.insert(slot3, self._units_with_cutscene_data_extension)

	return 
end
function CoreCutsceneManager:unregister_unit_with_cutscene_data_extension(unit)
	if self._units_with_cutscene_data_extension then
		slot5 = unit

		table.delete(slot3, self._units_with_cutscene_data_extension)

		if #self._units_with_cutscene_data_extension == 0 then
			self._units_with_cutscene_data_extension = nil
		end
	end

	return 
end
function CoreCutsceneManager:_prime_cutscenes_in_world()
	slot1 = ipairs
	slot3 = self._units_with_cutscene_data_extension or {}

	for _, unit in slot1(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			local player = unit.cutscene_data(slot7).cutscene_player(slot7)
			slot9 = "cutscene"
			slot12 = "[CoreCutsceneManager] Priming in-world cutscene \"%s\"."
			slot15 = player

			cat_print(unit.cutscene_data(slot7), string.format(slot11, player.cutscene_name(slot14)))

			slot9 = player

			player.prime(unit.cutscene_data(slot7))
		end
	end

	return 
end
function CoreCutsceneManager:_destroy_units_with_cutscene_data_extension()
	slot3 = self._units_with_cutscene_data_extension or {}
	local units_to_destroy = table.list_copy(slot2)
	slot4 = units_to_destroy

	for _, unit in ipairs(slot3) do
		slot10 = unit

		self.unregister_unit_with_cutscene_data_extension(slot8, self)

		slot9 = unit

		if alive(slot8) then
			slot9 = "cutscene"
			slot12 = "[CoreCutsceneManager] Destroying Unit with CutsceneData extension \"%s\"."
			slot15 = unit

			cat_print(slot8, string.format(slot11, unit.name(slot14)))

			slot10 = unit

			World.delete_unit(slot8, World)
		end
	end

	slot5 = "Not all units with the CutsceneData extension were destroyed."

	assert(slot3, self._units_with_cutscene_data_extension == nil)

	return 
end
function CoreCutsceneManager:register_cutscene_actor(unit)
	slot6 = unit
	slot5 = "Zombie unit registered as cutscene actor."

	assert(slot3, alive(slot5))

	if unit.unit_data then
		slot4 = unit
		local actor_name = unit.unit_data(slot3).cutscene_actor
	end

	slot6 = "Unnamed unit registered as cutscene actor."

	assert(slot4, actor_name and actor_name ~= "")

	slot5 = self
	local existing_unit = self.cutscene_actors_in_world(slot4)[actor_name]

	if existing_unit ~= nil then
		return existing_unit == unit
	end

	slot6 = self
	slot7 = unit

	self.actor_database(slot5).append_unit_info(slot5, self.actor_database(slot5))

	self._cutscene_actors = self._cutscene_actors or {}
	self._cutscene_actors[actor_name] = unit

	return true
end
function CoreCutsceneManager:unregister_cutscene_actor(unit)
	slot6 = unit
	slot5 = "Zombie unit unregistered as cutscene actor."

	assert(slot3, alive(slot5))

	if unit.unit_data then
		slot4 = unit
		local actor_name = unit.unit_data(slot3).cutscene_actor
	end

	slot6 = "Unnamed unit unregistered as cutscene actor."

	assert(slot4, actor_name and actor_name ~= "")

	slot5 = self
	local existing_unit = self.cutscene_actors_in_world(slot4)[actor_name]

	if existing_unit == nil then
		return false
	end

	self._cutscene_actors[actor_name] = nil
	slot6 = self._cutscene_actors

	if table.empty(nil) then
		self._cutscene_actors = nil
	end

	return true
end
function CoreCutsceneManager:cutscene_actors_in_world()
	if self._cutscene_actors == nil then
		return {}
	end

	function slot4(unit)
		slot3 = unit

		return not alive(slot2) or nil
	end

	local dead_units = table.collect(slot2, self._cutscene_actors)
	slot4 = dead_units

	for dead_unit_name, _ in pairs(self._cutscene_actors) do
		self._cutscene_actors[dead_unit_name] = nil
	end

	return self._cutscene_actors
end
function CoreCutsceneManager:actor_database()
	return self._actor_database
end
function CoreCutsceneManager:debug_next_exec(scene_name)
	slot4 = self

	self.delay_cutscene_debug(slot3)

	Global.debug_cutscene = scene_name

	return 
end
function CoreCutsceneManager:delay_cutscene_debug()
	self._delay_cutscene_debug = true

	return 
end
function CoreCutsceneManager:start_delayed_cutscene()
	if not Global.debug_cutscene then
		slot3 = "-debugcs"
		local debug_scene = arg_value(slot2)
	end

	if not self._delay_cutscene_debug and debug_scene then
		self._stop_playback = nil
		self._disable_events = true
		slot4 = self

		self._cleanup(slot3)

		self._disable_events = nil
		slot5 = debug_scene

		managers.cutscene.play_cutscene(slot3, managers.cutscene)

		self._manager_locked = true
		Global.debug_cutscene = nil

		function slot6()
			managers.cutscene._manager_locked = nil

			return 
		end

		self.connect(nil, self, "EVT_PLAYBACK_FINISHED")
	end

	return 
end
function CoreCutsceneManager:update()
	return 

	local time = self._timer.time(slot2)
	slot4 = self._timer
	local delta_time = self._timer.delta_time(self._timer)

	if self._stop_playback then
		slot5 = self

		self._cleanup(slot4)

		self._stop_playback = nil
		self._disable_events = nil
	else
		if self._player then
			slot5 = self._player

			if not self._player.is_primed(slot4) then
				slot5 = self._player

				self._player.prime(slot4)
			end

			if self._start_playback then
				slot5 = self

				if not self.is_paused(slot4) then
					slot5 = self._player

					self._player.play(slot4)

					self._start_playback = nil
				end
			end

			slot5 = self._player

			if self._player.is_presentable(slot4) then
				slot5 = self._player

				if not self._player.is_viewport_enabled(slot4) then
					slot6 = true

					self._player.set_viewport_enabled(slot4, self._player)

					slot6 = true

					self.set_gui_visible(slot4, self)

					slot5 = self

					self._on_playback_started(slot4, self._player.cutscene_name(slot7))

					slot6 = "EVT_PLAYBACK_STARTED"
					slot9 = self._player

					self._send_event(slot4, self, self._player.cutscene_name(self._player))
				end
			end
		end

		if self._player then

			-- Decompilation error in this vicinity:
			slot7 = delta_time
			slot5 = self
			local just_finished_playing_in_game_cutscene = self._video(slot4) == nil
		end

		slot6 = self
	end

	return 
end
function CoreCutsceneManager:paused_update()
	slot3 = self

	self.update(slot2)

	return 
end
function CoreCutsceneManager:play_overlay_effect(effect_data)
	slot4 = self

	self.stop_overlay_effect(slot3)

	effect_data.play_paused = true
	slot4 = self
	effect_data.timer = self.timer(slot3)
	slot5 = effect_data
	self.__overlay_effect_id = managers.overlay_effect.play_effect(slot3, managers.overlay_effect)

	return 
end
function CoreCutsceneManager:stop_overlay_effect(fade_out)
	if self.__overlay_effect_id then
		slot2 = assert
	end

	return 
end
function CoreCutsceneManager:_create_gui_workspace()
	return nil
end
function CoreCutsceneManager:_create_video_workspace()
	local res = RenderSettings.resolution
	slot4 = Overlay
	slot9 = managers.viewport
	slot10 = res.y
	local workspace = Overlay.newgui(slot3).create_scaled_screen_workspace(slot3, Overlay.newgui(slot3), res.x, res.x / managers.viewport.aspect_ratio(slot8), 0, 0, res.x)
	slot6 = self._timer

	workspace.set_timer(Overlay.newgui(slot3), workspace)

	return workspace
end
function CoreCutsceneManager:input_controller()
	return self._input_controller
end
function CoreCutsceneManager:gui_workspace()
	return self._gui_workspace
end
function CoreCutsceneManager:video_workspace()
	return self._video_workspace
end
function CoreCutsceneManager:_video()

	-- Decompilation error in this vicinity:
	slot3 = self
	local panel = self.video_workspace(slot2).panel(slot2)
	slot4 = panel
end
function CoreCutsceneManager:set_gui_visible(visible)
	slot4 = self

	if not self.gui_workspace(slot3) then
		slot4 = visible
		local gui_workspace = responder(slot3)
	end

	slot5 = gui_workspace

	if gui_workspace.visible(slot4) ~= visible then
		slot5 = gui_workspace

		gui_workspace[(visible and "show") or "hide"](slot4)
	end

	local input_controller = self.input_controller(slot4)
	slot6 = input_controller

	input_controller[(visible and "enable") or "disable"](self)

	return 
end
function CoreCutsceneManager:get_cutscene_names()
	slot4 = "cutscene"

	return managers.database.list_entries_of_type(slot2, managers.database)
end
function CoreCutsceneManager:prime(name, time)
	time = time or 0
	slot6 = name
	local cutscene = self.get_cutscene(slot4, self)

	if self._player == nil then
		slot7 = cutscene
		self._player = self._player_for_cutscene(slot5, self)
	else
		slot6 = self._player

		if self._player.cutscene_name(slot5) ~= name then
			slot7 = true

			self._cleanup(slot5, self)

			slot7 = cutscene
			self._player = self._player_for_cutscene(slot5, self)
		end
	end

	slot8 = true

	self._player.seek(slot5, self._player, time)

	return 
end
function CoreCutsceneManager:_player_for_cutscene(cutscene)
	slot4 = cutscene
	local orientation_unit = cutscene.find_spawned_orientation_unit(slot3)

	if orientation_unit and orientation_unit.cutscene_data then
		slot5 = orientation_unit
		local cutscene_data = orientation_unit.cutscene_data(slot4)
	end

	if cutscene_data then
		slot6 = cutscene_data

		return cutscene_data.cutscene_player(slot5)
	else
		slot7 = cutscene
		local player = core_or_local(slot5, "CutscenePlayer")
		slot7 = player

		player.add_keys("CutscenePlayer")

		return player
	end

	return 
end
function CoreCutsceneManager:play_cutscene(name)
	if not self._manager_locked then
		slot5 = name

		self.prime(slot3, self)

		slot4 = self

		self.play(slot3)
	end

	return 
end
function CoreCutsceneManager:play()
	if self._player ~= nil then
		slot3 = self._player

		if not self._player.is_playing(slot2) then
			if not self._is_overriding_user_music then
				slot4 = true

				managers.music.override_user_music(slot2, managers.music)

				self._is_overriding_user_music = true
			end

			slot3 = self._player

			self._player.preroll_cutscene_keys(slot2)

			self._start_playback = true
		end
	end

	return 
end
function CoreCutsceneManager:stop(disable_events)
	self._start_playback = nil
	self._stop_playback = true
	self._paused = nil
	self._disable_events = disable_events

	return 
end
function CoreCutsceneManager:skip()
	if self._player then
		slot3 = self._player

		self._player.skip_to_end(slot2)
	end

	slot4 = false

	self.stop(slot2, self)

	return 
end
function CoreCutsceneManager:_cleanup(called_from_prime)
	if self._is_overriding_user_music then
		slot5 = false

		managers.music.override_user_music(slot3, managers.music)

		self._is_overriding_user_music = nil
	end

	local playing_cutscene_name = nil

	if self._player then
		if called_from_prime then
			slot5 = self._player

			self._player.skip_to_end(slot4)
		end

		slot5 = self._player
		playing_cutscene_name = self._player.cutscene_name(slot4)
		slot5 = self._player

		self._player.destroy(slot4)

		self._player = nil
	end

	if not called_from_prime then
		slot6 = false

		self.set_gui_visible(slot4, self)
	end

	slot5 = self

	if self._video(slot4) then
		slot5 = self
		slot5 = self._video(slot4)

		self._video(slot4).pause(slot4)

		slot5 = self
		slot5 = self.video_workspace(slot4)
		slot5 = self.video_workspace(slot4).panel(slot4)

		self.video_workspace(slot4).panel(slot4).clear(slot4)
	end

	if playing_cutscene_name and not self._disable_events then
		slot7 = playing_cutscene_name

		self._send_event(slot4, self, "EVT_PLAYBACK_FINISHED")

		slot6 = playing_cutscene_name

		self._on_playback_finished(slot4, self)
	end

	return 
end
function CoreCutsceneManager:pause()
	self._paused = true
	slot3 = self

	if self.is_playing(slot2) then
		if self._is_overriding_user_music then
			slot4 = false

			managers.music.override_user_music(slot2, managers.music)

			self._is_overriding_user_music = nil
		end

		slot3 = self._player

		self._player.pause(slot2)

		slot4 = "EVT_PLAYBACK_PAUSED"
		slot7 = self._player

		self._send_event(slot2, self, self._player.cutscene_name(slot6))
	end

	return 
end
function CoreCutsceneManager:resume()
	slot3 = self

	if self.is_paused(slot2) then
		self._paused = nil
		slot3 = self

		self.play(slot2)
	end

	return 
end
function CoreCutsceneManager:evaluate_at_time(name, time)
	slot7 = time

	self.prime(slot4, self, name)

	slot5 = self._player

	self._player.evaluate_current_frame(slot4)

	return 
end
function CoreCutsceneManager:evaluate_at_frame(name, frame)
	slot10 = name
	slot9 = self.get_cutscene(slot8, self)
	slot7 = frame / self.get_cutscene(slot8, self).frames_per_second(slot8)

	self.evaluate_at_time(slot4, self, name)

	return 
end
function CoreCutsceneManager:is_playing_cutscene(name)
	slot4 = self

	if self.is_playing(slot3) then
		slot4 = self._player

		return self._player.cutscene_name(slot3) == name
	end
end
function CoreCutsceneManager:is_playing()
end
function CoreCutsceneManager:is_paused()

	-- Decompilation error in this vicinity:
	return self._paused ~= nil
end
function CoreCutsceneManager:add_playing_changed_callback(object, func_or_name)

	-- Decompilation error in this vicinity:
	slot5 = func_or_name
	slot9 = true

	self.connect(slot5, self, "EVT_PLAYBACK_STARTED", func)

	slot9 = false

	self.connect(slot5, self, "EVT_PLAYBACK_FINISHED", func)

	return 
end
function CoreCutsceneManager:get_cutscene(name)
	local cutscene = self._cutscenes and self._cutscenes[name]

	if cutscene == nil then
		slot7 = name

		if not DB.has(slot4, DB, "cutscene") then
			slot8 = name
			slot5 = "Cutscene \"" .. tostring(slot7) .. "\" does not exist."

			error(slot4)
		end

		slot10 = name
		slot7 = self
		cutscene = core_or_local(slot4, "Cutscene", DB.load_node(slot7, DB, "cutscene"))
		slot5 = Application

		if not Application.ews_enabled(slot4) then
			slot7 = cutscene
			slot9 = name
			slot6 = "Cutscene \"" .. tostring(slot8) .. "\" is production-only (un-optimized)."

			assert(slot4, cutscene.is_optimized(slot6))
		end

		self._cutscenes = self._cutscenes or {}
		self._cutscenes[name] = cutscene
	end

	return cutscene
end
function CoreCutsceneManager:_on_playback_started(cutscene_name)
	return 
end
function CoreCutsceneManager:_on_playback_finished(cutscene_name)
	return 
end
function CoreCutsceneManager:_debug_persistent_keys_per_cutscene()
	local persistent_keys_per_cutscene = {}
	slot6 = self

	for _, name in ipairs(self.get_cutscene_names(slot5)) do
		slot10 = name
		local cutscene = self.get_cutscene(slot8, self)
		local persistent_keys = cutscene._debug_persistent_keys(self)
		slot11 = persistent_keys
		persistent_keys_per_cutscene[name] = table.map_keys(cutscene)
	end

	return persistent_keys_per_cutscene
end
function CoreCutsceneManager:_debug_persistent_keys_report()
	local output_string = "Persistent Cutscene Keys Report\n"
	output_string = output_string .. "-------------------------------\n"
	slot6 = self

	for cutscene_name, persistent_keys in pairs(self._debug_persistent_keys_per_cutscene(slot5)) do
		slot9 = persistent_keys

		if not table.empty(slot8) then
			output_string = output_string .. "\n" .. cutscene_name .. "\n"
			slot9 = persistent_keys

			for _, persistent_key_description in ipairs("\n") do
				output_string = output_string .. "\t" .. persistent_key_description .. "\n"
			end
		end
	end

	return output_string
end
function CoreCutsceneManager:_debug_dump_persistent_keys_report(path)
	if path then
		slot6 = "w"
		local file = SystemFS.open(slot3, SystemFS, path)
		slot5 = file
		slot8 = self

		file.write(SystemFS, self._debug_persistent_keys_report(slot7))

		slot5 = file

		file.close(SystemFS)

		slot6 = "Persistent Keys report written to \"" .. path .. "\""

		cat_print(SystemFS, "debug")
	else
		slot5 = ""

		cat_print(slot3, "debug")

		slot4 = "debug"
		slot7 = self

		cat_print(slot3, self._debug_persistent_keys_report(slot6))
	end

	return 
end
function CoreCutsceneManager:set_active_camera()
	slot3 = "CoreCutsceneManager:set_active_camera() is deprecated. The camera is now kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:attempt_switch_to_active_camera()
	slot3 = "CoreCutsceneManager:attempt_switch_to_active_camera() is deprecated. The camera is now kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:set_cutscene_camera_enabled()
	slot3 = "CoreCutsceneManager:set_cutscene_camera_enabled() is deprecated. The camera is now kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:set_listener_enabled()
	slot3 = "CoreCutsceneManager:set_listener_enabled() is deprecated. The listener is now kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:set_camera_attribute()
	slot3 = "CoreCutsceneManager:set_camera_attribute() is deprecated. The camera is now kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:play_camera_shake()
	slot3 = "CoreCutsceneManager:play_camera_shake() is deprecated. The camera is now kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:load()
	slot4 = "CoreCutsceneManager:load() is deprecated. There is no need to call it."

	Application.stack_dump_error(slot2, Application)

	return 
end
function CoreCutsceneManager:save()
	slot3 = "CoreCutsceneManager:save() is deprecated. The new Cutscene Editor uses CoreCutsceneEditorProjects."

	error(slot2)

	return 
end
function CoreCutsceneManager:save_all()
	slot3 = "CoreCutsceneManager:save_all() is deprecated. The new Cutscene Editor uses CoreCutsceneEditorProjects."

	error(slot2)

	return 
end
function CoreCutsceneManager:pre_load_cutscene_units()
	slot4 = "CoreCutsceneManager:pre_load_cutscene_units() is deprecated. There is no need to call it."

	Application.stack_dump_error(slot2, Application)

	return 
end
function CoreCutsceneManager:internal_load()
	slot4 = "CoreCutsceneManager:internal_load() is deprecated. There is no need to call it."

	Application.stack_dump_error(slot2, Application)

	return 
end
function CoreCutsceneManager:stop_cutscene()
	slot4 = "CoreCutsceneManager:stop_cutscene() is deprecated. Use CoreCutsceneManager:stop() instead."

	Application.stack_dump_error(slot2, Application)

	slot3 = self

	self.stop(slot2)

	return 
end
function CoreCutsceneManager:set_stop_at_end()
	slot4 = "CoreCutsceneManager:set_stop_at_end() is deprecated. There is no need to call it."

	Application.stack_dump_error(slot2, Application)

	return 
end
function CoreCutsceneManager:get_current_frame_nr()
	slot3 = "CoreCutsceneManager:get_current_frame_nr() is deprecated. The playhead state is kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:get_frame_count()
	slot3 = "CoreCutsceneManager:get_frame_count() is deprecated. The frame count is part of the CoreCutscene, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:move_to_frame()
	slot3 = "CoreCutsceneManager:move_to_frame() is deprecated. The playhead state is kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end
function CoreCutsceneManager:evaluate_current_frame()
	slot3 = "CoreCutsceneManager:evaluate_current_frame() is deprecated. The playhead state is kept in CoreCutscenePlayer, but is not exposed here."

	error(slot2)

	return 
end

return 
