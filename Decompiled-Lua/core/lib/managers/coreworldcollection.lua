-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreWorldDefinition"

core.import(slot1, core)

CoreWorldCollection = CoreWorldCollection or class()
CoreWorldCollection.MAX_STITCHER_ID = 1000
CoreWorldCollection.STAGE_PREPARE = "STAGE_PREPARE"
CoreWorldCollection.STAGE_LOAD = "STAGE_LOAD"
CoreWorldCollection.STAGE_LOAD_FINISHED = "STAGE_LOAD_FINISHED"
CoreWorldCollection.STAGE_DESTROY = "STAGE_DESTROY"
CoreWorldCollection.STATES_NOT_ALOWED_TRANSITION = {
	"ingame_special_interaction",
	"world_camera",
	"event_complete_screen",
	"ingame_waiting_for_players",
	"ingame_driving"
}
function CoreWorldCollection:init(params)
	self.queued_client_mission_executions = {}
	self.queued_server_mission_executions = {}
	self.queued_world_creation = {}
	self.queued_world_prepare = {}
	self.queued_world_destruction = {}
	self.concurrent_prepare = 0
	self.concurrent_create = 0
	self._world_definitions = {}
	self._missions = {}
	self._mission_paths = {}
	self._mission_params = {}
	self._motion_paths = {}
	self._package_loading = {}
	self._predefined_worlds_file = "lib/utils/dev/editor/xml/predefined_worlds"
	slot4 = self

	self._load_predefined_worlds(slot3)

	self._world_id_counter = 1
	self._editor_world_names = {}
	self._world_spawns = {}
	self._input_elements = {}
	self._output_elements = {}
	self._world_loaded_callbacks = {}
	self._synced_peers = self._synced_peers or {}
	self._atleast_one_world_loaded = false
	self._stitcher_counter = CoreWorldCollection.MAX_STITCHER_ID
	self._first_pass = true
	slot4 = World
	slot5 = 25

	World.occlusion_manager(slot3).set_max_occluder_tests(slot3, World.occlusion_manager(slot3))

	return 
end
function CoreWorldCollection:first_pass()
	return self._first_pass
end
function CoreWorldCollection:unregister_editor_name(editor_name)
	self._editor_world_names[editor_name] = nil

	return 
end
function CoreWorldCollection:register_editor_name(editor_name, world)
	self._editor_world_names[editor_name] = self._editor_world_names[editor_name] or {}
	self._editor_world_names[editor_name].world = world

	return 
end
function CoreWorldCollection:register_editor_position(editor_name, position)
	self._editor_world_names[editor_name] = self._editor_world_names[editor_name] or {}
	self._editor_world_names[editor_name].position = position

	return 
end
function CoreWorldCollection:register_world_spawn(world_id, editor_name, spawn_loot)
	self._world_spawns[world_id] = {
		active = true,
		editor_name = editor_name,
		plant_loot = spawn_loot
	}

	if self._world_spawns[editor_name] then
		self._world_spawns[world_id].alarm = self._world_spawns[editor_name].alarm
		self._world_spawns[editor_name] = nil
	end

	return 
end
function CoreWorldCollection:register_world_despawn(world_id, editor_name)
	if not self._world_spawns[world_id] then
		return 
	end

	self._world_spawns[world_id].active = false
	self._input_elements[editor_name] = nil

	return 
end
function CoreWorldCollection:get_input_elements_for_world(world_editor_name, event)
	local res, world_id = nil
	slot7 = self._world_spawns

	for key, world in pairs(slot6) do
		if world_editor_name == world.editor_name and world.active then
			world_id = key
		end
	end

	if world_id and self._input_elements[world_id] then
		res = self._input_elements[world_id][event]
	end

	return res
end
function CoreWorldCollection:get_output_elements_for_world(world_id, event)
	local res = nil
	local world_spawn = self._world_spawns[world_id]

	if world_spawn and self._output_elements[world_spawn.editor_name] then
		res = self._output_elements[world_spawn.editor_name][event]
	end

	return res
end
function CoreWorldCollection:register_input_element(world_id, event, input_element)
	self._input_elements[world_id] = self._input_elements[world_id] or {}
	self._input_elements[world_id][event] = self._input_elements[world_id][event] or {}
	slot7 = input_element

	table.insert(self._input_elements[world_id][event] or , self._input_elements[world_id][event])

	return 
end
function CoreWorldCollection:unregister_input_element(world_id, event, input_element)
	slot10 = input_element

	Application.debug(slot5, Application, "[CoreWorldCollection:unregister_input_element(]", world_id, event)

	if self._input_elements[world_id] and self._input_elements[world_id][event] then
		slot7 = input_element

		table.delete(slot5, self._input_elements[world_id][event])
	end

	return 
end
function CoreWorldCollection:register_output_element(world_editor_name, event, output_element)
	self._output_elements[world_editor_name] = self._output_elements[world_editor_name] or {}
	self._output_elements[world_editor_name][event] = self._output_elements[world_editor_name][event] or {}
	slot7 = output_element

	table.insert(self._output_elements[world_editor_name][event] or , self._output_elements[world_editor_name][event])

	return 
end
function CoreWorldCollection:unregister_output_element(world_editor_name, event, output_element)
	slot10 = output_element

	Application.debug(slot5, Application, "[CoreWorldCollection:unregister_output_element(]", world_editor_name, event)

	if self._output_elements[world_editor_name] and self._output_elements[world_editor_name][event] then
		slot7 = output_element

		table.delete(slot5, self._output_elements[world_editor_name][event])
	end

	return 
end
function CoreWorldCollection:get_world_position(editor_name)
	if self._editor_world_names[editor_name] then
		return self._editor_world_names[editor_name].position
	end

	return 
end
function CoreWorldCollection:get_world_from_pos(position)
	local result = nil
	slot7 = true
	local nav_seg_id = managers.navigation.get_nav_seg_from_pos(slot4, managers.navigation, position)
	slot7 = nav_seg_id
	local world_id = managers.navigation.get_world_for_nav_seg(managers.navigation, managers.navigation)

	if world_id then
		result = self._world_definitions[world_id]
	end

	return result
end
function CoreWorldCollection:on_editor_changed_name(old_name, new_name)
	if self._editor_world_names[old_name] then
		self._editor_world_names[new_name] = self._editor_world_names[old_name]
		self._editor_world_names[old_name] = nil
	end

	return 
end
function CoreWorldCollection:_load_predefined_worlds()
	slot5 = self._predefined_worlds_file

	if DB.has(slot2, DB, "xml") then
		slot5 = self._predefined_worlds_file
		local file = DB.open(slot2, DB, "xml")
		slot4 = ScriptSerializer
		slot7 = file
		self._all_worlds = ScriptSerializer.from_generic_xml(DB, file.read(slot6))
		slot4 = self._all_worlds

		table.sort(DB)
	end

	return 
end
function CoreWorldCollection:get_next_world_id()
	self._world_id_counter = self._world_id_counter + 1
	local world_id_modulo = self._world_id_counter % WorldDefinition.MAX_WORLD_UNIT_ID

	if world_id_modulo == 0 then
		self._world_id_counter = self._world_id_counter + 1
		world_id_modulo = 1
	end

	while self._world_definitions[world_id_modulo] do
		self._world_id_counter = self._world_id_counter + 1
		world_id_modulo = self._world_id_counter % WorldDefinition.MAX_WORLD_UNIT_ID

		if world_id_modulo == 0 then
			self._world_id_counter = self._world_id_counter + 1
		end
	end

	self._world_id_counter = world_id_modulo

	return self._world_id_counter
end
function CoreWorldCollection:get_next_navstitcher_id()
	self._stitcher_counter = self._stitcher_counter - 1

	if self._stitcher_counter <= WorldDefinition.MAX_WORLD_UNIT_ID + 1 then
		self._stitcher_counter = CoreWorldCollection.MAX_STITCHER_ID
	end

	return self._stitcher_counter
end
function CoreWorldCollection:prepare_world(world, world_id, editor_name, spawn_counter, excluded_continents)
	slot8 = TimerManager
	local start = TimerManager.now(slot7)
	local file_type = "world"
	local file_path = world.meta_data.file .. "/world"
	local reverse = string.reverse(slot10)
	slot13 = "/"
	local i = string.find(file_path, reverse)
	slot16 = i
	local world_dir = string.reverse(string.sub(slot14, reverse))
	slot16 = file_path

	if not DB.has(string.sub, DB, file_type) then
		slot14 = file_path .. "." .. file_type .. " is not in the database!"

		error(slot13)
	end

	slot17 = spawn_counter

	Application.debug(slot13, Application, "[CoreWorldCollection:prepare_world()] world_id:", world_id)

	local params = {
		file_type = "world",
		file_path = file_path,
		world_dir = world_dir,
		translation = world.translation,
		world_id = world_id,
		excluded_continents = excluded_continents
	}
	slot16 = params
	local definition = CoreWorldDefinition.WorldDefinition.new(Application, CoreWorldDefinition.WorldDefinition)
	definition.is_created = false
	definition.editor_name = editor_name
	definition.creation_in_progress = true
	definition.spawn_counter = spawn_counter
	definition.meta_data = world.meta_data

	if self._drop_in_sync and self._drop_in_sync[world_id] and self._drop_in_sync[world_id].sync_units then
		slot16 = self._drop_in_sync[world_id].sync_units

		for _, synced_unit in ipairs(slot15) do
			slot23 = synced_unit.editor_id

			definition.sync_unit_reference_data(slot20, definition, synced_unit.unit_id)
		end

		self._drop_in_sync[world_id].sync_units = nil
	end

	self._world_definitions[world_id] = definition
	self._mission_paths[world_id] = world.meta_data.file .. "/mission"
	slot17 = world_id

	table.insert(world.meta_data.file .. "/mission", self.queued_world_creation)

	if definition.is_prepared then
		slot18 = CoreWorldCollection.STAGE_PREPARE

		self.complete_world_loading_stage(slot15, self, definition._world_id)
	end

	local t_end = TimerManager.now(slot15)
	slot19 = t_end - start

	Application.debug(TimerManager, Application, "[CoreWorldCollection:prepare_world( world )] DURATION")

	return 
end
function CoreWorldCollection:create(index, nav_graph_loaded)
	local definition = self._world_definitions[index]

	if not definition then
		return 
	end

	if definition.is_created or not definition.is_prepared then
		slot7 = "[CoreWorldCollection:create() skip!]"

		Application.debug(slot5, Application)

		return 
	end

	slot8 = index
	self._motion_paths[index] = MotionPathManager.new(slot6, MotionPathManager)
	definition.create_called = true
	slot10 = nav_graph_loaded

	definition.create(MotionPathManager.new(slot6, MotionPathManager), definition, "all", Vector3(), true)

	slot7 = MissionManager
	self._missions[index] = MissionManager.new(definition)
	self._mission_params[index] = {
		file_path = self._mission_paths[index],
		worlddefinition = definition,
		sync_id = index
	}
	slot6 = Application

	if not Application.editor() and not Global.running_slave then
		slot6 = World
		slot7 = 5

		World.occlusion_manager(slot5).merge_occluders(slot5, World.occlusion_manager(slot5))
	end

	return true
end
function CoreWorldCollection:set_world_counter(value)
	self.world_counter = value
	self.sync_world_counter = value

	return 
end
function CoreWorldCollection:on_world_loaded(index)
	slot6 = index

	Application.debug(slot3, Application, "[CoreWorldCollection:on_world_loaded]")

	if not self.world_counter or self.world_counter == 0 then
		slot4 = self

		self.execute_world_loaded_callbacks(slot3)
	end

	if self.world_counter and 0 < self.world_counter then
		self.world_counter = self.world_counter - 1
	end

	if 0 < index then
		slot4 = managers.viewport

		if managers.viewport.first_active_viewport(slot3) then
			slot4 = managers.viewport
			slot4 = managers.viewport.first_active_viewport(slot3)

			managers.viewport.first_active_viewport(slot3).set_force_feeder_update(slot3)
		end

		local definition = self._world_definitions[index]
		self._mission_params[definition._world_id] = nil
		slot5 = definition

		definition.init_done(definition._world_id)

		self._atleast_one_world_loaded = true
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self.queued_server_mission_executions

		for i, exec in ipairs(slot3) do
			slot10 = exec.mission_id
			local mission = managers.worldcollection.mission_by_id(slot8, managers.worldcollection)
			slot10 = mission._scripts

			for name, data in pairs(managers.worldcollection) do
				slot16 = exec.id
				local element = data.element(slot14, data)

				if element then
					slot17 = "[CoreWorldCollection:on_world_loaded] Firing queued execution on server:"
					slot20 = exec

					Application.debug(slot15, Application, inspect(slot19))

					slot17 = exec.unit

					element.on_executed(slot15, element)

					break
				end
			end

			self.queued_server_mission_executions[i] = nil
		end
	else
		slot4 = self

		self.check_queued_client_mission_executions(slot3)
	end

	slot4 = managers.mouse_pointer

	managers.mouse_pointer.acquire_input(slot3)

	return 
end
function CoreWorldCollection:check_queued_client_mission_executions()
	slot3 = self.queued_client_mission_executions

	for i, exec in ipairs(slot2) do
		slot9 = exec.mission_id
		local mission = managers.worldcollection.mission_by_id(slot7, managers.worldcollection)

		if mission and not exec.executed then
			local found = false
			slot10 = mission._scripts

			for name, data in pairs(slot9) do
				slot16 = exec.id

				if data.element(slot14, data) then
					slot16 = "[CoreWorldCollection:check_queued_client_mission_executions] Firing queued execution on client:"
					slot19 = exec

					Application.debug(slot14, Application, inspect(slot18))

					self.queued_client_mission_executions[i].executed = true
					slot16 = exec.id
					slot16 = exec.orientation_element_index

					data.element(true, data).set_synced_orientation_element_index(true, data.element(true, data))

					slot16 = exec.id

					if data.element(true, data).client_on_executed then
						slot16 = exec.id
						slot16 = exec.unit

						data.element(slot14, data).client_on_executed(slot14, data.element(slot14, data))
					end

					break
				end
			end
		end
	end

	return 
end
function CoreWorldCollection:check_all_worlds_prepared()
	local result = true
	slot4 = self._world_definitions

	for key, definition in pairs(slot3) do
		result = result and definition.is_prepared
	end

	return result
end
function CoreWorldCollection:reset_global_ref_counter()
	self._temp_package_ref_added = false

	if Global.package_ref_counter then
		slot3 = Global.package_ref_counter

		for key, _ in pairs(slot2) do
			Global.package_ref_counter[key] = 0
		end
	end

	return 
end
function CoreWorldCollection:add_one_package_ref_to_all()
	slot3 = Global.package_ref_counter

	for key, _ in pairs(slot2) do
		if 0 < Global.package_ref_counter[key] then
			Global.package_ref_counter[key] = Global.package_ref_counter[key] + 1
		end
	end

	self._temp_package_ref_added = true

	return 
end
function CoreWorldCollection:delete_one_package_ref_from_all()
	if self._temp_package_ref_added then
		slot3 = Global.package_ref_counter

		for key, _ in pairs(slot2) do
			if 1 < Global.package_ref_counter[key] then
				Global.package_ref_counter[key] = Global.package_ref_counter[key] - 1
			end
		end
	end

	self._temp_package_ref_added = false
	managers.raid_job.reload_mission_flag = false

	return 
end
function CoreWorldCollection:unload_packages()
	slot3 = self._world_definitions

	for _, definition in pairs(slot2) do
		slot8 = definition

		definition.unload_packages(slot7)
	end

	return 
end
function CoreWorldCollection:_send_to_peers_world_prepared(world_definition)
	if not world_definition.prepare_synced then
		world_definition.prepare_synced = true
		slot4 = managers.network
		slot4 = managers.network.session(slot3)
		local peer = managers.network.session(slot3).local_peer(slot3)
		peer._synced_worlds[world_definition._world_id] = peer._synced_worlds[world_definition._world_id] or {}
		peer._synced_worlds[world_definition._world_id][CoreWorldCollection.STAGE_PREPARE] = true
		slot5 = managers.network
		slot10 = peer

		managers.network.session(CoreWorldCollection.STAGE_PREPARE).send_to_peers(CoreWorldCollection.STAGE_PREPARE, managers.network.session(CoreWorldCollection.STAGE_PREPARE), "sync_prepare_world", world_definition._world_id, peer.id(CoreWorldCollection.STAGE_PREPARE))
	end

	return 
end
function CoreWorldCollection:check_all_peers_synced_last_world(stage)
	if 1 < self._world_id_counter then
		slot6 = stage

		return self._check_all_peers_synced(slot3, self, self._world_id_counter)
	else
		return true
	end

	return 
end
function CoreWorldCollection:_check_all_peers_synced(world_id, stage)
	slot5 = managers.network

	if not managers.network.session(slot4) then
		return true
	end

	local result = true
	slot8 = managers.network
	slot8 = managers.network.session(slot7)

	for id, peer in pairs(managers.network.session(slot7).peers(slot7)) do
		if not peer._synced_worlds[world_id] or not peer._synced_worlds[world_id][stage] then
			slot17 = stage

			Application.debug(slot10, Application, "\twaiting - peer", id, "world_id", world_id, "stage")

			result = false
		end
	end

	return result
end
function CoreWorldCollection:complete_world_loading_stage(world_id, stage)
	local params = {
		world_id = world_id,
		stage = stage
	}

	if stage == CoreWorldCollection.STAGE_DESTROY then
		slot12 = nil

		managers.queued_tasks.queue(slot5, managers.queued_tasks, nil, self._do_complete_world_loading_stage, self, params, 3)
	else
		slot7 = params

		self._do_complete_world_loading_stage(slot5, self)
	end

	return 
end
function CoreWorldCollection:_do_complete_world_loading_stage(params)
	local world_id = params.world_id
	local stage = params.stage
	slot6 = managers.network

	if not managers.network.session(slot5) then
		return 
	end

	slot6 = managers.network
	slot6 = managers.network.session(slot5)
	local peer = managers.network.session(slot5).local_peer(slot5)
	peer._synced_worlds[world_id] = peer._synced_worlds[world_id] or {}
	peer._synced_worlds[world_id][stage] = true
	slot9 = world_id
	slot12 = peer

	Application.debug(true, Application, "[CoreWorldCollection:update] Sending world spawn sync: (world_id, peer)", peer.id(slot11))

	slot7 = managers.network
	slot12 = peer

	managers.network.session(true).send_to_peers(true, managers.network.session(true), "sync_prepare_world", world_id, peer.id(stage))

	return 
end
function CoreWorldCollection:update_synced_worlds_to_peer(peer)
	slot4 = managers.network
	local local_peer = managers.network.session(slot3).local_peer(slot3)
	slot5 = local_peer._synced_worlds

	for world_id, data in pairs(managers.network.session(slot3)) do
		slot15 = data[CoreWorldCollection.STAGE_LOAD_FINISHED] or false

		peer.send_queued_sync(slot9, peer, "sync_peer_world_data", world_id, data[CoreWorldCollection.STAGE_PREPARE] or false, data[CoreWorldCollection.STAGE_LOAD] or false)
	end

	return 
end
function CoreWorldCollection:update_synced_worlds_to_all_peers()
	slot4 = "[CoreWorldCollection:update_synced_worlds_to_all_peers()]"

	Application.trace(slot2, Application)

	slot3 = managers.network

	if not managers.network.session(slot2) then
		return 
	end

	slot5 = managers.network
	slot5 = managers.network.session(slot4)

	for peer_id, peer in pairs(managers.network.session(slot4).peers(slot4)) do
		slot9 = peer

		self.update_synced_worlds_to_peer(slot7, self)
	end

	return 
end
function CoreWorldCollection:sync_loading_status(t)
	slot4 = managers.network

	if not managers.network.session(slot3) then
		return 
	end

	if not self._next_loading_sync or self._next_loading_sync < t then
		self._next_loading_sync = t + 2
		slot4 = self

		self.update_synced_worlds_to_all_peers(slot3)
	end

	return 
end
function CoreWorldCollection:update(t, dt, paused_update)
	if managers.worldcollection.destroying then
		return 
	end

	slot6 = self

	self.check_queued_world_create(slot5)

	slot6 = self

	self.sync_loading_status_to_peers(slot5)

	if not self._skip_one_loading_frame then
		slot6 = self._world_definitions

		for key, definition in pairs(slot5) do
			if not definition.destroyed then
				if definition.is_prepared and definition.create_called then
					if definition.creation_in_progress then
						slot13 = CoreWorldCollection.STAGE_PREPARE
						local all_peers_prepared = self._check_all_peers_synced(slot10, self, definition._world_id)

						if all_peers_prepared then
							slot14 = dt

							definition.update_load(slot11, definition, t)
						else
							slot13 = "[CoreWorldCollection:update] All peers still not prepared, waiting..."

							Application.trace(slot11, Application)

							slot13 = t

							self.sync_loading_status(slot11, self)
						end

						if not definition.creation_in_progress then
							slot14 = CoreWorldCollection.STAGE_LOAD

							self.complete_world_loading_stage(slot11, self, definition._world_id)
						end
					elseif not definition.mission_scripts_created then
						slot13 = CoreWorldCollection.STAGE_LOAD
						local all_peers_spawned_world = self._check_all_peers_synced(slot10, self, definition._world_id)
						slot12 = TextureCache
						local texture_loaded = TextureCache.check_textures_loaded(self)

						if all_peers_spawned_world and texture_loaded then
							slot15 = definition._world_id

							Application.debug(slot12, Application, "[CoreWorldCollection:update] Creating mission params")

							if self._mission_params[definition._world_id] then
								slot14 = self._mission_params[definition._world_id]

								self._missions[definition._world_id].parse(definition._world_id, self._missions[definition._world_id])

								if self._drop_in_sync and self._drop_in_sync[definition._world_id] and self._drop_in_sync[definition._world_id].missions then
									slot14 = self._drop_in_sync[definition._world_id].missions

									self._missions[definition._world_id].load(definition._world_id, self._missions[definition._world_id])

									self._drop_in_sync[definition._world_id].missions = nil
								end
							end

							definition.mission_scripts_created = true

							break
						elseif not texture_loaded then
							slot14 = "[CoreWorldCollection:update] Waiting for textures..."

							Application.trace(slot12, Application)
						else
							slot14 = "[CoreWorldCollection:update] All peers still not spawned worlds, waiting..."

							Application.trace(slot12, Application)

							slot14 = t

							self.sync_loading_status(slot12, self)
						end
					elseif definition.mission_scripts_created and not definition.is_created then
						slot13 = CoreWorldCollection.STAGE_LOAD_FINISHED

						self.complete_world_loading_stage(slot10, self, definition._world_id)

						slot12 = definition._world_id

						self.on_world_loaded(slot10, self)

						self.concurrent_create = 0
					end
				elseif WorldDefinition.ASYNC_CALLBACKS then
					slot13 = dt

					definition.update_prepare(slot10, definition, t)
				end
			end
		end
	else
		self._skip_one_loading_frame = false
	end

	if not paused_update and not self.level_transition_in_progress then
		slot6 = self._world_definitions

		for key, definition in pairs(slot5) do
			if definition.is_created and not definition.destroyed then
				slot13 = dt

				self._missions[key].update(slot10, self._missions[key], t)

				slot13 = dt

				self._motion_paths[key].update(slot10, self._motion_paths[key], t)
			end

			slot11 = Application
			local now = Application.time(slot10)

			if definition._next_cleanup_t < now then
				slot12 = definition

				definition.cleanup_spawned_units(slot11)
			end
		end
	end

	slot6 = self

	self.check_drop_in_sync(slot5)

	slot6 = self

	self.check_queued_world_destroy(slot5)

	slot6 = self

	self.check_finished_destroy(slot5)

	return 
end
function CoreWorldCollection:sync_loading_status_to_peers()
	if self._sync_loading_status_to_peers and self._sync_loading_packages == 0 then
		self._sync_loading_status_to_peers = false
		slot3 = managers.network
		slot3 = managers.network.session(slot2)

		managers.network.session(slot2).send_loading_finished_to_peers(slot2)
	end

	return 
end
function CoreWorldCollection:check_drop_in_sync()
	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		local local_peer = managers.network.session(slot2).local_peer(slot2)
		slot4 = self

		if self.all_worlds_created(managers.network.session(slot2)) then
			slot4 = local_peer

			if local_peer.is_drop_in(slot3) and self._atleast_one_world_loaded then
				slot5 = "[CoreWorldCollection:check_drop_in_sync] all worlds created, sending set_member_ready!"

				Application.debug(slot3, Application)

				slot5 = false

				Application.set_pause(slot3, Application)

				slot5 = true

				managers.navigation.set_data_ready_flag(slot3, managers.navigation)

				slot4 = managers.network
				slot5 = true

				managers.network.session(slot3).chk_send_local_player_ready(slot3, managers.network.session(slot3))

				slot5 = false

				local_peer.set_drop_in(slot3, local_peer)

				slot4 = managers.mission

				managers.mission.start_root_level_script(slot3)

				slot4 = self

				self.remove_dropin_package_references(slot3)
			end
		end

		slot4 = managers.vehicle

		managers.vehicle.process_state_change_queue(slot3)
	end

	return 
end
function CoreWorldCollection:check_queued_world_prepare()
	if 0 < self.concurrent_prepare then
		return 
	end

	for i = #self.queued_world_prepare, 1, -1 do
		local data = self.queued_world_prepare[i]
		slot9 = i

		table.remove(slot7, self.queued_world_prepare)

		self.concurrent_prepare = self.concurrent_prepare + 1
		slot12 = data.spawn_counter

		managers.worldcollection.prepare_world(slot7, managers.worldcollection, data.world, data.world_id, data.editor_name)

		break
	end

	return 
end
function CoreWorldCollection:check_queued_world_create()
	if 0 < self.concurrent_create then
		return 
	end

	for i = #self.queued_world_creation, 1, -1 do
		local world_id = self.queued_world_creation[i]
		slot10 = false
		local ok = self.create(slot7, self, world_id)

		if ok then
			self.concurrent_create = world_id
			slot10 = i

			table.remove(slot8, self.queued_world_creation)
		end

		break
	end

	return 
end
function CoreWorldCollection:check_queued_world_destroy()
	if not self.level_transition_in_progress then
		return 
	end

	for i = #self.queued_world_destruction, 1, -1 do
		local world_id = self.queued_world_destruction[i]
		slot9 = world_id

		self.destroy_world(slot7, self)

		slot9 = i

		table.remove(slot7, self.queued_world_destruction)
	end

	return 
end
function CoreWorldCollection:check_finished_destroy()
	slot3 = self._world_definitions

	for key, definition in pairs(slot2) do
		if not definition.queued_destroyed then
			if definition.destroyed then
				slot10 = CoreWorldCollection.STAGE_DESTROY
				local all_peers_destroyed = self._check_all_peers_synced(slot7, self, key)
			end

			if all_peers_destroyed then
				definition.queued_destroyed = true
				slot15 = nil

				managers.queued_tasks.queue(slot8, managers.queued_tasks, nil, self.finish_destroy, self, {
					world_id = key
				}, 0.8)

				slot11 = managers.network
				slot11 = managers.network.session(nil)

				for _, peer in pairs(managers.network.session(nil).all_peers(nil)) do
					peer._synced_worlds[key] = nil
				end
			end
		end
	end

	return 
end
function CoreWorldCollection:worlddefinitions()
	return self._world_definitions
end
function CoreWorldCollection:worlddefinition_by_id(id)
	if id == 0 then
		return managers.worlddefinition
	else
		return self._world_definitions[id]
	end

	return 
end
function CoreWorldCollection:missions()
	return self._missions
end
function CoreWorldCollection:mission_by_id(id)
	return self._missions[id]
end
function CoreWorldCollection:motion_path_by_id(id)
	return self._motion_paths[id]
end
function CoreWorldCollection:mission_element_groups(type)
	local result = {}
	slot5 = self._missions

	for _, mission in pairs(slot4) do
		local t = {}

		table.insert(slot10, result)

		slot13 = mission

		for name, script in pairs(mission.scripts(t)) do
			slot17 = type
			t[name] = script.element_group(slot15, script)
		end
	end

	return result
end
function CoreWorldCollection:pre_destroy()
	slot3 = self._missions

	for _, mission in pairs(slot2) do
		slot8 = mission

		mission.pre_destroy(slot7)
	end

	return 
end
function CoreWorldCollection:destroy()
	slot3 = self._missions

	for _, mission in pairs(slot2) do
		slot8 = mission

		mission.destroy(slot7)
	end

	return 
end
function CoreWorldCollection:destroy_world(id)
	slot6 = id

	Application.debug(slot3, Application, "[CoreWorldCollection:destroy_world]")

	local mission = self._missions[id]

	if mission then
		slot5 = mission._scripts

		for key, script in pairs(slot4) do
			slot10 = script._elements

			for element_id, element in pairs(slot9) do
				if element.unspawn_all_units then
					slot15 = element

					element.unspawn_all_units(slot14)
				end

				if element.unregister then
					slot15 = element

					element.unregister(slot14)
				end
			end
		end

		slot5 = mission

		mission.pre_destroy(slot4)

		slot5 = mission

		mission.destroy(slot4)

		self._missions[id] = nil
		self._mission_paths[id] = nil
	end

	slot6 = id

	managers.objectives.remove_objective_for_world(slot4, managers.objectives)

	local motion_path = self._motion_paths[id]

	if motion_path then
		slot6 = motion_path

		motion_path.delete_paths(slot5)

		self._motion_paths[id] = nil
	end

	slot7 = id

	managers.vehicle.freeze_vehicles_on_world(slot5, managers.vehicle)

	local definition = self._world_definitions[id]

	if definition then
		slot7 = definition._all_units

		for _, unit in pairs(slot6) do
			slot12 = unit

			if alive(slot11) then
				slot12 = unit

				if not unit.vehicle_driving(slot11) then
					slot13 = unit

					managers.interaction.remove_unit(slot11, managers.interaction)

					slot13 = 0

					unit.set_slot(slot11, unit)
				else
					slot12 = unit

					if unit.unit_data(slot11).continent_name then
						slot12 = unit
						local cont_vehicle = unit.unit_data(slot11).continent_name == WorldDefinition.VEHICLES_CONTINENT_NAME
					end

					if not cont_vehicle then
						slot14 = unit

						managers.vehicle.remove_vehicle(slot12, managers.vehicle)
					end
				end
			end
		end

		slot7 = definition._spawned_units

		for _, unit in ipairs(slot6) do
			slot12 = unit

			if alive(slot11) then
				slot13 = 0

				unit.set_slot(slot11, unit)
			end
		end

		slot7 = definition

		definition.destroy(slot6)
	end

	slot8 = id

	managers.world_instance.remove_instances_for_world(slot6, managers.world_instance)

	slot8 = id

	managers.world_instance.remove_instance_params(slot6, managers.world_instance)

	slot8 = id

	managers.world_instance.unregister_input_elements(slot6, managers.world_instance)

	slot8 = id

	managers.world_instance.unregister_output_event_elements(slot6, managers.world_instance)

	slot8 = id

	managers.navigation.on_world_destroyed(slot6, managers.navigation)

	slot9 = CoreWorldCollection.STAGE_DESTROY

	self.complete_world_loading_stage(slot6, self, id)

	return 
end
function CoreWorldCollection:finish_destroy(data)
	slot6 = data.world_id

	Application.debug(slot3, Application, "[CoreWorldCollection:finish_destroy]")

	local definition = self._world_definitions[data.world_id]
	slot5 = Application

	if not Application.editor(Application) then
		slot5 = definition

		definition.unload_packages(slot4)
	end

	self._world_definitions[data.world_id] = nil

	return 
end
function CoreWorldCollection:_create_test(params)
	slot4 = "CoreWorldCollection:_create_test( params )"
	slot7 = params

	print(slot3, inspect(slot6))

	local worlds = {}

	if true or false then
		slot6 = {
			level_path = "levels/tests/stealth_test_garden",
			translation = {
				position = Vector3(slot9, 0, 0),
				rotation = Rotation(slot9, 0, 0)
			}
		}
		slot12 = 5000
		slot12 = 0

		table.insert(slot4, worlds)

		slot6 = {
			level_path = "levels/tests/stealth_test_garden",
			translation = {
				position = Vector3(slot9, 0, 5000),
				rotation = Rotation(slot9, 0, 0)
			}
		}
		slot12 = 2500
		slot12 = 0

		table.insert(slot4, worlds)

		slot6 = {
			level_path = "levels/tests/stealth_test_garden",
			translation = {
				position = Vector3(slot9, 5000, 0),
				rotation = Rotation(slot9, 0, 0)
			}
		}
		slot12 = 2500
		slot12 = 0

		table.insert(slot4, worlds)
	end

	return worlds
end
function CoreWorldCollection:_new_random_world(worlds, ordered)
	local files = {
		"levels/tests/world_part1",
		"levels/tests/world_part2",
		"levels/tests/world_part3",
		"levels/tests/world_part4",
		"levels/tests/world_part5",
		"levels/tests/world_part6",
		"levels/tests/world_part7",
		"levels/tests/world_part8",
		"levels/tests/world_part2"
	}
	local s = 4
	local k = 0
	local l = 0
	local s_pos = -800 * s / 2

	for i = 0, s, 1 do
		for j = 0, s, 1 do

			-- Decompilation error in this vicinity:
			slot20 = 0
			local pos = Vector3(slot17, s_pos + i * 800, s_pos + j * 800)
			slot22 = 0
			local rot = Rotation(slot19, yaw, 0)
			local file = nil

			if ordered then
				file = files[k + 1]
			else
				slot22 = #files
				file = files[math.random(slot21)]
			end

			slot23 = {
				level_path = file,
				translation = {
					position = pos,
					rotation = rot
				}
			}

			table.insert(slot21, worlds)

			slot23 = #files
			k = math.mod(slot21, k + 1)
			l = l + 1
		end
	end

	return 
end
function CoreWorldCollection:on_simulation_ended()
	slot4 = "CoreWorldCollection:on_simulation_ended()"

	Application.trace(slot2, Application)

	slot3 = self._world_definitions

	for key, definition in pairs(slot2) do
		slot9 = key

		self.destroy_world(slot7, self)
	end

	slot3 = managers.vehicle

	managers.vehicle.delete_all_vehicles(slot2)

	self._world_definitions = {}
	self._missions = {}
	self._mission_paths = {}
	self._world_spawns = {}
	self._input_elements = {}
	self._output_elements = {}
	self._synced_peers = {}
	self._atleast_one_world_loaded = false
	self._world_id_counter = 1
	slot3 = managers.portal

	managers.portal.kill_all_effects(slot2)

	slot3 = managers.portal

	managers.portal.clear(slot2)

	if managers.worlddefinition then
		slot3 = MassUnitManager

		MassUnitManager.delete_all_units(slot2)

		slot4 = managers.worlddefinition._definition.brush
		slot9 = 0

		managers.worlddefinition._create_massunit(slot2, managers.worlddefinition, Vector3(slot6, 0, 0))
	end

	return 
end
function CoreWorldCollection:clear()
	slot3 = self

	self.on_simulation_ended(slot2)

	slot3 = MassUnitManager

	MassUnitManager.delete_all_units(slot2)

	slot3 = managers.sound_environment

	managers.sound_environment.destroy(slot2)

	slot3 = managers.portal

	managers.portal.kill_all_effects(slot2)

	slot3 = managers.environment_area

	managers.environment_area.remove_all_areas(slot2)

	slot3 = managers.portal

	managers.portal.clear(slot2)

	slot3 = managers.world_instance

	managers.world_instance.clear(slot2)

	slot3 = managers.world_instance

	managers.world_instance.on_simulation_ended(slot2)

	managers.navigation._has_loaded = nil
	slot3 = managers.navigation

	managers.navigation.clear(nil)

	slot3 = self

	self.pre_destroy(nil)

	return 
end
function CoreWorldCollection:get_worlddefinition_by_unit_id(unit_id)
	if unit_id < WorldDefinition.UNIT_ID_BASE then
		return managers.worlddefinition
	else
		slot4 = unit_id / WorldDefinition.UNIT_ID_BASE
		local world_id = math.floor(slot3)
		local def = managers.worldcollection._world_definitions[world_id]

		if not def then
			slot9 = world_id

			Application.error(slot5, Application, "[CoreWorldCollection:get_worlddefinition_by_unit_id] World definition not found!", unit_id, debug.traceback())
		end

		return def
	end

	return 
end
function CoreWorldCollection:sync_save(data)
	slot5 = "[CoreWorldCollection:sync_save]"
	slot8 = self._synced_peers

	Application.debug(slot3, Application, inspect(slot7))

	local state = {
		missions = {},
		synced_units = {}
	}
	slot5 = self._missions

	for i, mission in pairs(Application) do
		state.missions[i] = {}
		slot11 = state.missions[i]

		mission.save(, mission)
	end

	state.stitcher_counter = self._stitcher_counter
	state.unique_id_counter = self._unique_id_counter
	state.world_id_counter = self._world_id_counter
	state.sync_world_counter = self.sync_world_counter
	slot5 = self._world_definitions

	for world_id, world in pairs(slot4) do
		slot11 = {
			world_id = world_id,
			units = world._units_synced_on_dropin
		}

		table.insert(slot9, state.synced_units)
	end

	data.CoreWorldCollection = state

	return 
end
function CoreWorldCollection:sync_load(data)
	local state = data.CoreWorldCollection
	self._drop_in_sync = {}
	slot5 = state.missions

	for i, mission in pairs(slot4) do
		if self._missions[i] then
			slot11 = mission

			self._missions[i].load(slot9, self._missions[i])
		else
			self._drop_in_sync[i] = {
				missions = state.missions[i]
			}
		end
	end

	self._stitcher_counter = state.stitcher_counter
	self._unique_id_counter = state.unique_id_counter
	self._world_id_counter = state.world_id_counter
	self.sync_world_counter = state.sync_world_counter
	self.world_counter = state.sync_world_counter
	slot5 = state.synced_units

	for _, synced_units in ipairs(slot4) do
		local world_id = synced_units.world_id
		local all_units = synced_units.units
		slot13 = world_id
		local world_definition = self.worlddefinition_by_id(slot11, self)

		if all_units then
			if world_definition then
				slot13 = all_units

				for _, synced_unit in ipairs(slot12) do
					slot20 = synced_unit.editor_id

					world_definition.sync_unit_reference_data(slot17, world_definition, synced_unit.unit_id)
				end
			else
				slot15 = world_id

				Application.debug(slot12, Application, "[CoreWorldCollection:sync_load] World definition not available, will sync unit references later for world:")

				self._drop_in_sync[world_id] = self._drop_in_sync[world_id] or {}
				self._drop_in_sync[world_id].sync_units = all_units
			end
		end
	end

	self._atleast_one_world_loaded = true
	self._first_pass = false

	return 
end
function CoreWorldCollection:get_world_meta_data(key)
	local result = self._all_worlds[key]

	if not result then
		slot7 = key

		Application.error(slot4, Application, "[CoreWorldCollection:get_world_meta_data] Meta data for world does not exist: ")
	end

	return result
end
function CoreWorldCollection:get_all_worlds()
	local res = {}
	slot4 = self._all_worlds

	for k, v in pairs(slot3) do
		slot10 = k

		table.insert(slot8, res)
	end

	slot4 = res

	table.sort(slot3)

	return res
end
function CoreWorldCollection:get_unit_with_id(id, cb, world_id)
	local unit = nil

	if 0 < world_id then
		local world_def = self._world_definitions[world_id]

		if cb then
			slot10 = cb
			unit = world_def.get_unit_on_load(slot7, world_def, id)
		else
			slot9 = id
			unit = world_def.get_unit_by_id(slot7, world_def)
		end
	elseif Global.running_simulation then
		slot8 = id
		unit = managers.editor.unit_with_id(slot6, managers.editor)
	elseif cb then
		slot9 = cb
		unit = managers.worlddefinition.get_unit_on_load(slot6, managers.worlddefinition, id)
	else
		slot8 = id
		unit = managers.worlddefinition.get_unit_by_id(slot6, managers.worlddefinition)
	end

	return unit
end
function CoreWorldCollection:debug_print_stats()
	slot3 = World
	slot3 = World.unit_manager(slot2)
	local all_units = World.unit_manager(slot2).get_units(slot2)
	local i = 0
	slot5 = all_units

	for key, u in pairs(slot4) do
		i = i + 1
	end

	local j = 0
	local k = 0
	slot7 = managers.worldcollection._world_definitions

	for _, definition in pairs(slot6) do
		slot12 = definition._all_units

		for _, _ in pairs(slot11) do
			j = j + 1
		end

		k = k + #definition._spawned_units
	end

	local l = 0
	slot8 = managers.navigation._pos_reservations

	for _, _ in pairs(slot7) do
		l = l + 1
	end

	slot10 = i

	Application.debug(slot7, Application, "World:unit_manager(): ")

	slot10 = j

	Application.debug(slot7, Application, "WorldDefinition:all_units:")

	slot10 = k

	Application.debug(slot7, Application, "WorldDefinition:spawned_units:")

	slot10 = l

	Application.debug(slot7, Application, "NavigationManager:pos_reservations:")

	return 
end
function CoreWorldCollection:get_unit_with_real_id(id)
	slot4 = World
	slot4 = World.unit_manager(slot3)
	local all_units = World.unit_manager(slot3).get_units(slot3)
	local unit = nil
	slot6 = all_units

	for key, u in pairs(slot5) do
		slot11 = u

		if u.id(slot10) == id then
			unit = u

			break
		end
	end

	return unit
end
function CoreWorldCollection:__get_unit_with_real_id(id)
	slot4 = World
	slot5 = id

	return World.unit_manager(slot3).get_unit_by_id(slot3, World.unit_manager(slot3))
end
function CoreWorldCollection:world_name_ids()
	local names = {}
	slot4 = self._editor_world_names

	for key, value in pairs(slot3) do
		slot10 = key

		table.insert(slot8, names)
	end

	return names
end
function CoreWorldCollection:world_names()
	return self._editor_world_names
end
function CoreWorldCollection:get_mission_elements_from_script(name, element_class)
	local path = self._all_worlds[name].file .. "/" .. "world/world"
	slot10 = path
	local instance_data = self._serialize_to_script("world/world", self, Idstring(slot9))
	local mission_elements = {}
	slot8 = instance_data

	for script, script_data in pairs("mission") do
		slot13 = script_data.elements

		for _, element in ipairs(slot12) do
			if element.class == element_class then
				slot19 = element.values.event

				table.insert(slot17, mission_elements)
			end
		end
	end

	slot8 = mission_elements

	table.sort(slot7)

	return mission_elements
end
function CoreWorldCollection:_serialize_to_script(type, name)
	slot5 = Application

	if Application.editor(slot4) then
		slot6 = type.id(slot7)
		slot9 = name

		return PackageManager.editor_load_script_data(slot4, PackageManager, name.id(type))
	else
		slot6 = type.id(slot7)
		slot9 = name

		if not PackageManager.has(slot4, PackageManager, name.id(type)) then
			slot6 = "Script data file " .. name .. " of type " .. type .. " has not been loaded."

			Application.throw_exception(slot4, Application)
		end

		slot6 = type.id(slot7)
		slot9 = name

		return PackageManager.script_data(slot4, PackageManager, name.id(type))
	end

	return 
end
function CoreWorldCollection:add_package_ref(package)
	Global.package_ref_counter = Global.package_ref_counter or {}
	Global.package_ref_counter[package] = Global.package_ref_counter[package] or 0
	Global.package_ref_counter[package] = Global.package_ref_counter[package] + 1

	return 
end
function CoreWorldCollection:delete_package_ref(package)
	Global.package_ref_counter[package] = Global.package_ref_counter[package] or 1

	if 0 < Global.package_ref_counter[package] then
		Global.package_ref_counter[package] = Global.package_ref_counter[package] - 1
	end

	return 
end
function CoreWorldCollection:has_queued_unloads()
	local cnt = 0

	if Global.package_ref_counter then
		slot4 = Global.package_ref_counter

		for package, count in pairs(slot3) do
			if count == 0 then
				cnt = cnt + 1
			end
		end
	end

	if 0 < cnt then
		return true
	else
		return false
	end

	return 
end
function CoreWorldCollection:register_spawned_unit(unit, pos)
	slot7 = true
	local nav_seg_id = managers.navigation.get_nav_seg_from_pos(slot4, managers.navigation, pos)
	slot7 = nav_seg_id
	local def_id = managers.navigation.get_world_for_nav_seg(managers.navigation, managers.navigation)
	slot8 = def_id
	local definition = self.worlddefinition_by_id(managers.navigation, self)

	if definition then
		slot9 = unit

		definition.register_spawned_unit(slot7, definition)
	end

	return 
end
function CoreWorldCollection:register_spawned_unit_on_last_world(unit)
	local definition = nil
	slot5 = Application

	if Application.editor(slot4) then
		definition = managers.worlddefinition
	else
		definition = self._world_definitions[self._world_id_counter]
	end

	slot6 = unit

	definition.register_spawned_unit(slot4, definition)

	return 
end
function CoreWorldCollection:get_alarm_for_world(world_id)
	if world_id == 0 then
		return managers.worlddefinition.alarmed
	else
		local world_spawn = self._world_spawns[world_id]

		if world_spawn then
			return world_spawn.alarm
		else
			return false
		end
	end

	return 
end
function CoreWorldCollection:set_alarm_for_world(editor_name, alarm)
	local found = false
	slot6 = self._world_spawns

	for _, world in pairs(slot5) do
		if world.active and world.editor_name == editor_name then
			found = true
			world.alarm = alarm
		end
	end

	if not found then
		self._world_spawns[editor_name] = {
			alarm = alarm
		}
	end

	return 
end
function CoreWorldCollection:set_alarm_for_world_id(world_id, alarm)
	slot8 = alarm

	Application.trace(slot4, Application, "[CoreWorldCollection:set_alarm_for_world_id]", world_id)

	if world_id == 0 then
		managers.worlddefinition.alarmed = alarm
	else
		self._world_spawns[world_id] = self._world_spawns[world_id] or {}
		self._world_spawns[world_id].alarm = alarm
	end

	return 
end
function CoreWorldCollection:sync_world_prepared(world_id, peer, stage)
	slot6 = managers.network

	if not managers.network.session(slot5) then
		return 
	end

	slot10 = stage

	Application.trace(slot5, Application, "[CoreWorldCollection:sync_world_prepared]", world_id, peer)

	slot6 = managers.network
	slot7 = peer
	local p = managers.network.session(slot5).peer(slot5, managers.network.session(slot5))
	p._synced_worlds = p._synced_worlds or {}
	p._synced_worlds[world_id] = p._synced_worlds[world_id] or {}
	local old_stage_value = p._synced_worlds[world_id][stage]
	p._synced_worlds[world_id][stage] = true
	slot8 = Network

	if Network.is_server(true) and stage == CoreWorldCollection.STAGE_LOAD and not old_stage_value then
	end

	return 
end
function CoreWorldCollection:send_loaded_packages(peer)
	slot5 = "[CoreWorldCollection:send_loaded_packages]"

	Application.trace(slot3, Application)

	slot4 = Global.package_ref_counter

	for package, count in pairs(slot3) do
		if 0 < count then
			slot12 = count

			Application.trace(slot8, Application, "[CoreWorldCollection:send_loaded_packages] sending string:", package)

			slot12 = count

			peer.send(slot8, peer, "send_loaded_packages", package)
		end
	end

	return 
end
function CoreWorldCollection:remove_dropin_package_references()
	if not self._packages_packed then
		return 
	end

	slot3 = self._packages_packed

	for _, pkg in ipairs(slot2) do
		if 0 < pkg.count then
			Global.package_ref_counter[pkg.package] = Global.package_ref_counter[pkg.package] - pkg.count
		end
	end

	self._packages_packed = nil

	return 
end
function CoreWorldCollection:sync_loaded_packages(packages_packed)
	slot5 = "[CoreWorldCollection:sync_loaded_packages]"
	slot8 = packages_packed

	Application.trace(slot3, Application, inspect(slot7))

	if not packages_packed then
		return 
	end

	slot7 = "unit"

	PackageManager.set_resource_loaded_clbk(slot3, PackageManager, Idstring(nil))

	self._sync_loading_packages = 0
	slot4 = self

	self.reset_global_ref_counter(slot3)

	self._packages_packed = packages_packed
	slot4 = packages_packed

	for _, pkg in ipairs(slot3) do
		if 0 < pkg.count then
			Global.package_ref_counter = Global.package_ref_counter or {}
			Global.package_ref_counter[pkg.package] = pkg.count
			slot10 = pkg.package

			if not PackageManager.loaded(pkg.package, PackageManager) then
				slot11 = pkg.package

				Application.trace(slot8, Application, "[CoreWorldCollection:sync_loaded_packages] Loading package:")

				if Global.STREAM_ALL_PACKAGES then
					self._sync_loading_packages = self._sync_loading_packages + 1

					function slot11()
						slot4 = pkg.package

						Application.trace(slot1, Application, "[CoreWorldCollection:sync_loaded_packages] DONE")

						self._sync_loading_packages = self._sync_loading_packages - 1

						if self._sync_loading_packages == 0 then
							slot2 = managers.sequence

							managers.sequence.preload(slot1)

							slot3 = Idstring(slot4)
							slot8 = "clbk_pkg_manager_unit_loaded"

							PackageManager.set_resource_loaded_clbk(slot1, PackageManager, callback("unit", managers.sequence, managers.sequence))
						end

						return 
					end

					PackageManager.load(slot8, PackageManager, pkg.package)
				else
					slot10 = pkg.package

					PackageManager.load(slot8, PackageManager)
				end
			else
				slot11 = pkg.package

				Application.trace(slot8, Application, "[CoreWorldCollection:sync_load] Package already loaded:")
			end
		end
	end

	self._sync_loading_status_to_peers = true

	if not Global.STREAM_ALL_PACKAGES then
		slot4 = managers.sequence

		managers.sequence.preload(slot3)

		slot5 = Idstring(slot6)
		slot10 = "clbk_pkg_manager_unit_loaded"

		PackageManager.set_resource_loaded_clbk(slot3, PackageManager, callback("unit", managers.sequence, managers.sequence))
	end

	return 
end
function CoreWorldCollection:all_worlds_created()
	local res = true
	slot4 = self._world_definitions

	for _, world in pairs(slot3) do
		res = res and world.is_created
	end

	return res
end
function CoreWorldCollection:level_transition_cleanup()
	slot4 = "[CoreWorldCollection:level_transition_cleanup()]"

	Application.trace(slot2, Application)

	local player = managers.player.local_player(slot2)
	slot4 = managers.player

	managers.player.clear_synced_turret(managers.player)

	slot4 = player

	if alive(managers.player) then
		slot4 = player
		slot4 = player.base(slot3)

		player.base(slot3)._unregister(slot3)

		slot5 = player

		World.delete_unit(slot3, World)
	end

	slot5 = false

	World.set_extensions_update_enabled(slot3, World)

	slot4 = managers.gold_economy

	managers.gold_economy.reset_camp_units(slot3)

	slot4 = World
	slot4 = World.occlusion_manager(slot3)

	World.occlusion_manager(slot3).clear_occluders(slot3)

	slot4 = MassUnitManager

	MassUnitManager.delete_all_units(slot3)

	slot4 = managers.objectives

	managers.objectives.on_level_transition(slot3)

	slot4 = managers.trade

	managers.trade.remove_all_criminals_to_respawn(slot3)

	slot4 = managers.hud

	managers.hud.clear_hit_direction_indicators(slot3)

	slot4 = managers.hud

	managers.hud.clear_suspicion_direction_indicators(slot3)

	slot4 = managers.hud

	managers.hud.clear_waypoints(slot3)

	slot4 = managers.hud

	managers.hud.pd_cancel_progress(slot3)

	slot6 = false

	managers.hud.hide_interaction_bar(slot3, managers.hud, false)

	slot4 = managers.music

	managers.music.stop(slot3)

	slot4 = managers.groupai

	managers.groupai.kill_all_AI(slot3)

	slot9 = managers.groupai
	slot11 = true

	managers.queued_tasks.queue(slot3, managers.queued_tasks, nil, managers.groupai.state(slot7).clean_up, managers.groupai.state(managers.groupai), nil, 0.1, nil)

	slot4 = managers.game_play_central

	managers.game_play_central.on_level_tranistion(slot3)

	slot4 = managers.portal

	managers.portal.clear(slot3)

	slot4 = managers.drop_loot

	managers.drop_loot.clear(slot3)

	return 
end
function CoreWorldCollection:level_transition_started()
	slot6 = self.world_counter

	Application.trace(slot2, Application, "[CoreWorldCollection:world_transition_started()]", self._first_pass)

	self.level_transition_in_progress = true
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	managers.network.session(slot2).local_peer(slot2).loading_worlds = true
	managers.player._players_spawned = false
	managers.player.dropin = false

	if not self._first_pass then
		slot4 = true

		managers.dialog.quit_dialog(slot2, managers.dialog)

		slot4 = false

		managers.navigation.set_data_ready_flag(slot2, managers.navigation)

		slot3 = self

		self._reset_loot_planting_flags(slot2)

		slot3 = Network

		if Network.is_server(slot2) then
			slot3 = managers.network
			slot4 = "loading"

			managers.network.session(slot2).set_state(slot2, managers.network.session(slot2))
		end
	else
		self.first_login_check = true
		self._first_pass = false
	end

	slot6 = true

	managers.queued_tasks.unqueue_all(slot2, managers.queued_tasks, nil, nil)

	slot3 = managers.player

	managers.player.remove_all_specials(slot2)

	slot4 = true

	managers.player.clear_carry(slot2, managers.player)

	slot3 = managers.environment_effects

	managers.environment_effects.kill_all_mission_effects(slot2)

	slot3 = managers.enemy

	managers.enemy.dispose_all_corpses(slot2)

	slot3 = managers.enemy

	managers.enemy.unqueue_all_tasks(slot2)

	slot3 = managers.enemy

	managers.enemy.remove_delayed_clbks(slot2)

	slot3 = managers.enemy

	managers.enemy.on_level_tranistion(slot2)

	slot3 = managers.sequence

	managers.sequence.on_level_transition(slot2)

	slot3 = managers.hud

	managers.hud.clean_up(slot2)

	slot3 = managers.barrage

	managers.barrage.stop_barrages(slot2)

	slot3 = managers.network

	managers.network.unregister_all_spawn_points(slot2)

	slot3 = managers.menu

	managers.menu.close_all_menus(slot2)

	slot3 = managers.system_menu

	managers.system_menu.force_close_all(slot2)

	slot4 = "stop_all"

	Global.music_manager.source.post_event(slot2, Global.music_manager.source)

	slot3 = Network

	if Network.is_server(slot2) then
		slot5 = managers.groupai
		slot5 = managers.groupai.state(slot4)

		for _, data in pairs(managers.groupai.state(slot4).all_AI_criminals(slot4)) do
			if data then
				slot8 = data.unit

				if alive(slot7) then
					slot10 = data.unit

					Application.trace(slot7, Application, "[CoreWorldCollection:level_transition_started()] unregister")

					slot8 = data.unit
					slot9 = false

					data.unit.brain(slot7).set_active(slot7, data.unit.brain(slot7))

					slot9 = 0

					data.unit.set_slot(slot7, data.unit)

					slot8 = data.unit
					slot8 = data.unit.base(slot7)

					data.unit.base(slot7).unregister(slot7)

					slot8 = data.unit

					data.unit._clear_damage_transition_callbacks(slot7)
				end
			end
		end
	end

	slot4 = "standard"

	managers.player.set_player_state(slot2, managers.player)

	if false then
		slot4 = "[CoreWorldCollection:level_transition_started()] event_complete_screen"

		Application.trace(slot2, Application)

		slot4 = "event_complete_screen"

		game_state_machine.change_state_by_name(slot2, game_state_machine)
	else
		slot3 = game_state_machine

		if game_state_machine.current_state_name(slot2) ~= "ingame_loading" then
			slot4 = "ingame_loading"

			game_state_machine.change_state_by_name(slot2, game_state_machine)
		end
	end

	slot9 = nil

	managers.queued_tasks.queue(slot2, managers.queued_tasks, nil, managers.worldcollection.level_transition_cleanup, managers.worldcollection, nil, 1)

	return 
end
function CoreWorldCollection:level_transition_ended()
	slot4 = "[CoreWorldCollection:world_transition_ended()]"

	Application.trace(slot2, Application)

	slot4 = true

	managers.raid_menu.set_pause_menu_enabled(slot2, managers.raid_menu)

	slot4 = true

	managers.navigation.set_data_ready_flag(slot2, managers.navigation)

	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	managers.network.session(slot2).local_peer(slot2).loading_worlds = false
	slot3 = Network

	if Network.is_server(false) then
		slot3 = managers.network
		slot4 = "in_game"

		managers.network.session(slot2).set_state(slot2, managers.network.session(slot2))

		slot3 = self

		self._plant_loot_on_spawned_levels(slot2)

		slot8 = 0.1

		managers.queued_tasks.queue(slot2, managers.queued_tasks, nil, self._do_spawn_players, self, nil)

		slot3 = managers.gold_economy

		managers.gold_economy.layout_camp(slot2)

		slot3 = managers.progression

		managers.progression.layout_camp(slot2)
	else
		self.level_transition_in_progress = false
	end

	slot4 = true

	World.set_extensions_update_enabled(slot2, World)

	slot4 = false

	managers.game_play_central.set_restarting(slot2, managers.game_play_central)

	slot9 = nil

	managers.queued_tasks.queue(slot2, managers.queued_tasks, nil, self._fire_level_loaded_event, self, nil, ElementPlayerSpawner.HIDE_LOADING_SCREEN_DELAY + 0.1)

	slot3 = self

	self.delete_one_package_ref_from_all(slot2)

	if managers.network.matchmake and not managers.network.matchmake.lobby_handler then
		slot6 = managers.network

		managers.network.matchmake.create_lobby(slot2, managers.network.matchmake, managers.network.get_matchmake_attributes(true))
	end

	return 
end
function CoreWorldCollection:_do_spawn_players()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)

	managers.network.session(slot2).spawn_players(slot2)

	self.level_transition_in_progress = false

	return 
end
function CoreWorldCollection:_fire_level_loaded_event()
	slot4 = "[CoreWorldCollection:_fire_level_loaded_event()]"

	Application.trace(slot2, Application)

	slot4 = "system_level_loaded"

	managers.global_state.fire_event(slot2, managers.global_state)

	return 
end
function CoreWorldCollection:world_spawn(world_id)
	if not world_id then
		return 
	end

	return self._world_spawns[world_id]
end
function CoreWorldCollection:count_world_spawns()
	local cnt = 0
	slot4 = self._world_spawns

	for world_id, data in pairs(slot3) do
		cnt = cnt + 1
	end

	return cnt
end
function CoreWorldCollection:_plant_loot_on_spawned_levels()

	-- Decompilation error in this vicinity:
	slot3 = managers.raid_job
	local job_data = managers.raid_job.current_job(slot2)
	local job_id = job_data and job_data.job_id
	local total_value = LootDropTweakData.TOTAL_LOOT_VALUE_DEFAULT

	if job_data and job_data.dogtags_min and job_data.dogtags_max then
		slot7 = job_data.dogtags_max
		total_value = math.random(slot5, job_data.dogtags_min)
	end

	return 
end
function CoreWorldCollection:_reset_loot_planting_flags()
	slot3 = self._world_spawns

	for world_id, data in pairs(slot2) do
		data.plant_loot = false
	end

	return 
end
function CoreWorldCollection:test_package_loading(pkg)
	return self._package_loading[pkg]
end
function CoreWorldCollection:on_server_left()
	slot4 = "CoreWorldCollection:on_server_left()"

	Application.trace(slot2, Application)

	slot3 = self

	self.destroy_all_worlds(slot2)

	self._skip_one_loading_frame = true

	return 
end
function CoreWorldCollection:destroy_all_worlds()
	slot3 = self._world_definitions

	for w_id, w in pairs(slot2) do
		slot9 = w_id

		table.insert(slot7, managers.worldcollection.queued_world_destruction)
	end

	slot3 = managers.menu

	managers.menu.hide_loading_screen(slot2)

	return 
end
function CoreWorldCollection:add_world_loaded_callback(obj)
	slot5 = obj

	table.insert(slot3, self._world_loaded_callbacks)

	return 
end
function CoreWorldCollection:execute_world_loaded_callbacks()
	slot4 = "[CoreWorldCollection:execute_world_loaded_callbacks()]"

	Application.trace(slot2, Application)

	slot3 = self._world_loaded_callbacks

	for _, obj in ipairs(slot2) do
		slot8 = obj

		obj.on_world_loaded(slot7)
	end

	self._world_loaded_callbacks = {}

	return 
end

return 
