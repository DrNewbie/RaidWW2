-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not AnimatedVehicleBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

AnimatedVehicleBase = slot0
function AnimatedVehicleBase:init(unit)
	slot6 = false

	AnimatedVehicleBase.super.init(slot3, self, unit)

	self._unit = unit
	slot4 = unit

	if unit.anim_state_machine(slot3) then
		slot5 = 0

		self._set_anim_lod(slot3, self)
	end

	slot6 = 0

	SoundDevice.set_rtpc(slot3, SoundDevice, "TRD_npc")

	self._body_name = self._body_name or "a_body"
	self._sync_objects = self._sync_objects or {
		"anim_body"
	}
	self._allow_sync = true
	self._stored_pos = nil
	self._stored_rot = nil

	return 
end
function AnimatedVehicleBase:update(unit, t, dt)
	slot6 = self._obj_com
	local new_pos = self._obj_com.position(slot5)

	if new_pos ~= self._last_pos then
		slot7 = self._listener_obj

		if alive(slot6) then
			local new_vel = new_pos - self._last_pos
			slot9 = dt

			mvector3.divide(slot7, new_vel)

			local veh_speed = new_vel.length(slot7)
			veh_speed = math.clamp(new_vel, veh_speed / 3, 0)
			local _veh_speed = veh_speed
			veh_speed = (veh_speed + _veh_speed) / 2
			self._last_pos = new_pos
			slot10 = self._listener_obj
			local listener_pos = self._listener_obj.position(veh_speed / 3)
			local listener_vec = listener_pos - new_pos
			local listener_dis = mvector3.normalize(100)
			slot14 = new_vel
			local vel_dot = mvector3.dot(listener_vec, listener_vec)
			slot16 = 1
			vel_dot = math.clamp(listener_vec, vel_dot / 15000, -1)
			slot16 = vel_dot

			self._sound_source.set_rtpc(listener_vec, self._sound_source, "vel_to_listener")
		end
	end

	return 
end
function AnimatedVehicleBase:_set_anim_lod(dis)
	if 9000 < dis then
		if self._lod_high then
			self._lod_high = false
		end
	elseif dis < 8000 and not self._lod_high then
		self._lod_high = true
	end

	return 
end
function AnimatedVehicleBase:start_doppler()
	slot4 = true

	self.set_enabled(slot2, self)

	slot3 = self._unit
	slot6 = self._body_name
	self._obj_com = self._unit.get_object(slot2, Idstring(slot5))
	slot3 = self._obj_com
	self._last_pos = self._obj_com.position(slot2)
	slot3 = managers.listener
	self._listener_obj = managers.listener.active_listener_obj(slot2)
	slot3 = self._unit
	self._sound_source = self._unit.sound_source(slot2)

	return 
end
function AnimatedVehicleBase:stop_doppler()
	slot4 = false

	self.set_enabled(slot2, self)

	self._listener_obj = nil
	self._sound_source = nil

	return 
end
function AnimatedVehicleBase:set_enabled(state)
	if state then
		if self._ext_enabled_count then
			self._ext_enabled_count = self._ext_enabled_count + 1
		else
			self._ext_enabled_count = 1
			slot7 = "base"
			slot6 = true

			self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))
		end
	elseif self._ext_enabled_count and 1 < self._ext_enabled_count then
		self._ext_enabled_count = self._ext_enabled_count - 1
	else
		self._ext_enabled_count = nil
		slot7 = "base"
		slot6 = false

		self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))
	end

	return 
end
function AnimatedVehicleBase:anim_clbk_empty_full_blend(unit)
	slot4 = self

	self.stop_doppler(slot3)

	slot4 = Application

	if not Application.editor(slot3) then
		slot5 = false

		unit.set_animations_enabled(slot3, unit)
	end

	return 
end
function AnimatedVehicleBase:anim_clbk_empty_exit(unit)
	slot4 = self

	self.start_doppler(slot3)

	slot5 = true

	unit.set_animations_enabled(slot3, unit)

	return 
end
function AnimatedVehicleBase:anim_clbk_animated_driving(unit, state)
	if state and self._driving ~= "animation" then
		slot6 = "animation"

		self._unit.set_driving(slot4, self._unit)

		self._driving = "animation"
	elseif not state and self._driving ~= "orientation_object" then
		slot6 = "orientation_object"

		self._unit.set_driving(slot4, self._unit)

		self._driving = "orientation_object"
	end

	return 
end
function AnimatedVehicleBase:anim_clbk_save_pose(unit, pose_id)
	self._saved_poses = self._saved_poses or {}
	slot7 = unit
	slot7 = unit
	self._saved_poses[pose_id] = {
		position = unit.position(slot6),
		rotation = unit.rotation(slot6)
	}

	return 
end
function AnimatedVehicleBase:anim_clbk_recall_pose(unit, pose_id, delete)
	local pose_info = self._saved_poses[pose_id]
	slot8 = pose_info.position

	self._unit.set_position(slot6, self._unit)

	slot8 = pose_info.rotation

	self._unit.set_rotation(slot6, self._unit)

	if delete then
		self._saved_poses[pose_id] = nil
		slot7 = self._saved_poses

		if not next(nil) then
			self._saved_poses = nil
		end
	end

	return 
end
function AnimatedVehicleBase:spawn_module(module_unit_name, align_obj_name, module_id)
	slot6 = self._unit
	slot9 = align_obj_name
	local align_obj = self._unit.get_object(slot5, Idstring(slot8))
	local module_unit = nil
	slot8 = module_unit_name

	if type_name(Idstring) == "string" then
		slot8 = Network

		if Network.is_server(slot7) then
			local spawn_pos = align_obj.position(slot7)
			local spawn_rot = align_obj.rotation(align_obj)
			slot12 = module_unit_name
			slot12 = spawn_rot
			module_unit = safe_spawn_unit(align_obj, Idstring(slot11), spawn_pos)
			slot10 = module_unit
			module_unit.unit_data(align_obj).parent_unit = self._unit
		end
	else
		module_unit = module_unit_name
	end

	if not module_unit then
		return 
	end

	self._modules = self._modules or {}
	local destroy_clbk_key = nil
	slot9 = module_unit

	if module_unit.base(slot8) then
		slot9 = module_unit

		if module_unit.base(slot8).add_destroy_listener then
			slot8 = tostring(self._unit.key(slot11))
			destroy_clbk_key = "AnimatedVehicleBase" .. slot8
			slot9 = module_unit
			slot10 = destroy_clbk_key
			slot16 = module_id

			module_unit.base(slot8).add_destroy_listener(slot8, module_unit.base(slot8), callback(self._unit, self, self, "clbk_module_unit_destroyed"))
		end
	end

	slot12 = align_obj_name
	slot14 = module_unit
	slot14 = module_unit.orientation_object(slot13)
	slot13 = true

	self._unit.link(slot8, self._unit, Idstring(slot11), module_unit, module_unit.orientation_object(slot13).name(slot13))

	local module_entry = {
		align_obj_name = align_obj_name,
		destroy_clbk_key = destroy_clbk_key,
		unit = module_unit
	}
	self._modules[module_id] = module_entry
	slot10 = Network

	if Network.is_server(self._unit) then
		slot10 = managers.network
		slot16 = "base"

		managers.network.session(slot9).send_to_peers_synched(slot9, managers.network.session(slot9), "sync_unit_module", self._unit, module_unit, align_obj_name, module_id)
	end

	return 
end
function AnimatedVehicleBase:run_module_sequence(module_id, sequence_name)
	if not self._modules then
		return 
	end

	if not sequence_name then
		slot9 = self._unit
		slot8 = "\n"

		Application.error(slot4, Application, "No sequence_name param passed\n", self._unit.model_filename(slot8))

		return 
	end

	slot5 = self._modules[module_id].unit
	slot6 = sequence_name

	if self._modules[module_id].unit.damage(slot4).has_sequence(slot4, self._modules[module_id].unit.damage(slot4)) then
		slot5 = self._modules[module_id].unit
		slot6 = sequence_name

		self._modules[module_id].unit.damage(slot4).run_sequence_simple(slot4, self._modules[module_id].unit.damage(slot4))
	else
		slot7 = "sequence does not exist in:\n"
		slot10 = self._modules[module_id].unit

		Application.error(slot4, Application, sequence_name, self._modules[module_id].unit.name(slot9))
	end

	return 
end
function AnimatedVehicleBase:clbk_module_unit_destroyed(module_id, module_unit)
	if not self._modules then
		return 
	end

	local entry = self._modules[module_id]
	self._modules[module_id] = nil
	slot6 = self._modules

	if not next(nil) then
		self._modules = nil
	end

	return 
end
function AnimatedVehicleBase:run_module_function(module_id, extension_name, func_name, param1, param2)
	if not self._modules then
		return 
	end

	local entry = self._modules[module_id]

	if not entry then
		return 
	end

	slot9 = Network

	if Network.is_server(slot8) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-21, warpins: 2 ---
		if not param1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 1 ---
			slot7 = ""
			--- END OF BLOCK #0 ---



		end

		slot8 = " "
		slot9 = param2 or ""
		local params = slot7 .. " " .. (param2 or "")
		slot10 = managers.network
		slot17 = params

		managers.network.session(param2 or "").send_to_peers_synched(param2 or "", managers.network.session(param2 or ""), "run_unit_module_function", self._unit, module_id, "base", extension_name, func_name)

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 22-22, warpins: 1 ---
		slot9 = ""
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 23-38, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	slot14 = param2

	self.run_module_function_unsafe(slot8, self, module_id, extension_name, func_name, param1)

	return 
end
function AnimatedVehicleBase:run_module_function_unsafe(module_id, extension_name, func_name, param1, param2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not self._modules then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	local entry = self._modules[module_id]

	if not entry then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-19, warpins: 2 ---
	local extension = entry.unit[extension_name](slot8)
	slot12 = param2

	extension[func_name](entry.unit, extension, param1)

	return 
	--- END OF BLOCK #2 ---



end
function AnimatedVehicleBase:clbk_send_modules(module_units_to_sync)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot4 = self._unit
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-16, warpins: 2 ---
	slot4 = module_units_to_sync

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-53, warpins: 0 ---
	for _, module_unit in pairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 1 ---
		slot9 = module_unit

		if alive(slot8) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-25, warpins: 1 ---
			slot9 = self._modules

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 26-51, warpins: 0 ---
			for module_id, module_entry in pairs(slot8) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-34, warpins: 1 ---
				slot15 = module_unit

				if module_entry.unit.key(slot13) == module_unit.key(module_entry.unit) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-49, warpins: 1 ---
					slot14 = managers.network
					slot20 = "base"

					managers.network.session(slot13).send_to_peers_synched(slot13, managers.network.session(slot13), "sync_unit_module", self._unit, module_unit, module_entry.align_obj_name, module_id)

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 50-50, warpins: 1 ---
					break
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 50-51, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 52-53, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 54-54, warpins: 1 ---
	return 
	--- END OF BLOCK #3 ---



end
function AnimatedVehicleBase:anim_clbk_blackhawk_1_at_loop_end(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self._wants_anim_redirect then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-12, warpins: 1 ---
		slot4 = self._unit
		slot7 = self._wants_anim_redirect

		self._unit.play_redirect(slot3, Idstring(slot6))

		self._wants_anim_redirect = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function AnimatedVehicleBase:clbk_request_anim_redirect(redirect_name)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	self._wants_anim_redirect = redirect_name
	slot4 = self._unit
	slot5 = "int_seq_unbend_blades"

	if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-19, warpins: 1 ---
		slot4 = self._unit
		slot5 = "int_seq_unbend_blades"

		self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-20, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function AnimatedVehicleBase:save(save_data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self._modules then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		local module_units_to_sync = {}
		slot5 = self._modules

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-15, warpins: 0 ---
		for module_id, module_entry in pairs(slot4) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-13, warpins: 1 ---
			slot11 = module_entry.unit

			table.insert(slot9, module_units_to_sync)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-15, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 16-42, warpins: 1 ---
		slot11 = self._unit
		slot12 = module_units_to_sync
		slot10 = TimerManager
		slot10 = TimerManager.game(self)
		slot8 = TimerManager.game(self).time(self) + 0.1

		managers.enemy.add_delayed_clbk(slot4, managers.enemy, "clbk_send_modules" .. tostring(self._unit.key(slot10)), callback(slot8, self, self, "clbk_send_modules"))
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 43-45, warpins: 2 ---
	if self._saved_poses then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-48, warpins: 1 ---
		if not save_data.anim_vehicle_base then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-49, warpins: 1 ---
			slot2 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-53, warpins: 2 ---
		save_data.anim_vehicle_base = slot2
		save_data.anim_vehicle_base.saved_poses = self._saved_poses
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 54-56, warpins: 2 ---
	if self._sync_objects then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-59, warpins: 1 ---
		if not save_data.anim_vehicle_base then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-60, warpins: 1 ---
			slot2 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 61-68, warpins: 2 ---
		save_data.anim_vehicle_base = slot2
		save_data.anim_vehicle_base.sync_objects = {}
		slot4 = self._sync_objects

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 69-91, warpins: 0 ---
		for _, name in ipairs() do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 69-77, warpins: 1 ---
			slot9 = self._unit
			slot12 = name
			local object = self._unit.get_object(slot8, Idstring(slot11))

			if object then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-89, warpins: 1 ---
				slot12 = object
				slot12 = object
				save_data.anim_vehicle_base.sync_objects[name] = {
					pos = object.position(slot11),
					rot = object.rotation(slot11)
				}
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 90-91, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 92-94, warpins: 2 ---
	if self._allow_sync and self._stored_pos ~= nil and self._stored_rot ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-113, warpins: 1 ---
		slot4 = managers.network
		slot9 = self._stored_rot

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_stored_pos", self._unit, self._allow_sync, self._stored_pos)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 114-114, warpins: 4 ---
	return 
	--- END OF BLOCK #4 ---



end
function AnimatedVehicleBase:load(save_data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not save_data.anim_vehicle_base then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 2 ---
	self._saved_poses = save_data.anim_vehicle_base.saved_poses

	if save_data.anim_vehicle_base.sync_objects then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		slot4 = save_data.anim_vehicle_base.sync_objects

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-40, warpins: 0 ---
		for name, object in pairs(slot3) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-38, warpins: 1 ---
			slot9 = self._unit
			slot12 = name
			slot10 = object.pos

			self._unit.get_object(slot8, Idstring(slot11)).set_position(slot8, self._unit.get_object(slot8, Idstring(slot11)))

			slot9 = self._unit
			slot12 = name
			slot10 = object.rot

			self._unit.get_object(slot8, Idstring(slot11)).set_rotation(slot8, self._unit.get_object(slot8, Idstring(slot11)))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 39-40, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-41, warpins: 2 ---
	return 
	--- END OF BLOCK #2 ---



end
function AnimatedVehicleBase:destroy(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self._modules then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		local modules = self._modules
		self._modules = nil
		slot5 = modules

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-25, warpins: 0 ---
		for module_id, entry in pairs(slot4) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-23, warpins: 1 ---
			slot10 = entry.unit
			slot11 = entry.destroy_clbk_key

			entry.unit.base(slot9).remove_destroy_listener(slot9, entry.unit.base(slot9))

			slot11 = 0

			entry.unit.set_slot(slot9, entry.unit)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-25, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-26, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function AnimatedVehicleBase:allow_sync_stored_pos(sync)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	self._allow_sync = sync

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:store_current_pos()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-49, warpins: 1 ---
	slot7 = self._unit
	local pos = Vector3(slot2, self._unit.position(slot4).x / 10, self._unit.position(self._unit).y / 10)
	slot6 = self._unit
	slot7 = self._unit
	slot8 = self._unit
	slot8 = self._unit.rotation(self._unit.rotation(self._unit.rotation(self._unit.position(self._unit).z / 10)))
	slot6 = self._unit.rotation(self._unit.rotation(self._unit.rotation(self._unit.position(self._unit).z / 10))).roll(self._unit.rotation(self._unit.rotation(self._unit.position(self._unit).z / 10))) / 10
	local rot = Vector3(self._unit.position(slot4).x / 10, self._unit.rotation(self._unit.position(self._unit).z / 10).yaw(self._unit.position(self._unit).z / 10) / 10, self._unit.rotation(self._unit.rotation(self._unit.position(self._unit).z / 10)).pitch(self._unit.rotation(self._unit.position(self._unit).z / 10)) / 10)
	self._stored_pos = pos
	self._stored_rot = rot

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:move_to_stored_pos()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self._stored_pos ~= nil and self._stored_rot ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-49, warpins: 1 ---
		slot3 = self._unit
		slot6 = "std/empty"

		self._unit.play_state(slot2, Idstring(slot5))

		slot5 = self._stored_pos.z * 10
		local pos = Vector3(slot2, self._stored_pos.x * 10, self._stored_pos.y * 10)
		slot6 = self._stored_rot.z * 10
		local rot = Vector3(self._stored_pos.x * 10, self._stored_rot.x * 10, self._stored_rot.y * 10)
		slot6 = pos

		self._unit.set_position(self._stored_rot.x * 10, self._unit)

		slot5 = self._unit
		slot10 = rot.z

		self._unit.set_rotation(self._stored_rot.x * 10, Rotation(slot7, rot.x, rot.y))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-50, warpins: 3 ---
	return 
	--- END OF BLOCK #1 ---



end
function AnimatedVehicleBase:sync_stored_pos(sync, pos, rot)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	self._allow_sync = sync
	self._stored_pos = pos
	self._stored_rot = rot

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:set_local_anim_position_start(x, y, z)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot7 = tonumber(y)
	slot10 = z
	self._local_anim_position_start = Vector3(slot5, tonumber(slot7), tonumber(x)) * 100

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:set_local_anim_position_end(x, y, z)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot7 = tonumber(y)
	slot10 = z
	self._local_anim_position_end = Vector3(slot5, tonumber(slot7), tonumber(x)) * 100

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:set_local_anim_rotation_start(h, p, b)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot7 = b
	slot7 = p
	slot7 = h
	self._local_anim_rotation_start = {
		tonumber(slot6),
		tonumber(slot6),
		tonumber(slot6)
	}

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:set_local_anim_rotation_end(h, p, b)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot7 = b
	slot7 = p
	slot7 = h
	self._local_anim_rotation_end = {
		tonumber(slot6),
		tonumber(slot6),
		tonumber(slot6)
	}

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:offset_position_rotation_forward()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-66, warpins: 1 ---
	local current_rot = self._unit.rotation(slot2)
	slot8 = current_rot
	local rot = Rotation(self._unit, current_rot.yaw(slot5), current_rot.roll(current_rot))
	local offset_vec = self._local_anim_position_end - self._local_anim_position_start
	slot7 = rot

	mvector3.rotate_with(current_rot.pitch(current_rot), offset_vec)

	local current_pos = self._unit.position(current_rot.pitch(current_rot))
	slot8 = current_pos + offset_vec

	self._unit.set_position(self._unit, self._unit)

	local dyaw = self._local_anim_rotation_end[1] - self._local_anim_rotation_start[1]
	local dpitch = self._local_anim_rotation_end[2] - self._local_anim_rotation_start[2]
	local droll = self._local_anim_rotation_end[3] - self._local_anim_rotation_start[3]
	slot10 = self._unit
	slot17 = current_rot
	slot15 = current_rot.roll(current_rot) + droll

	self._unit.set_rotation(slot9, Rotation(slot12, current_rot.yaw(slot14) + dyaw, current_rot.pitch(current_rot) + dpitch))

	return 
	--- END OF BLOCK #0 ---



end
function AnimatedVehicleBase:offset_position_rotation_backward()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-75, warpins: 1 ---
	local dyaw = 180 - self._local_anim_rotation_end[1] - self._local_anim_rotation_start[1]
	local dpitch = self._local_anim_rotation_end[2] - self._local_anim_rotation_start[2]
	local droll = self._local_anim_rotation_end[3] - self._local_anim_rotation_start[3]
	local current_rot = self._unit.rotation(slot5)
	slot11 = current_rot
	slot9 = current_rot.roll(current_rot) + droll
	local rot = Rotation(self._unit, current_rot.yaw(slot8) + dyaw, current_rot.pitch(current_rot) + dpitch)
	local offset_vec = self._local_anim_position_end - self._local_anim_position_start
	slot10 = rot

	mvector3.rotate_with(current_rot.pitch(current_rot) + dpitch, offset_vec)

	local current_pos = self._unit.position(current_rot.pitch(current_rot) + dpitch)
	slot11 = current_pos + offset_vec

	self._unit.set_position(self._unit, self._unit)

	dyaw = self._local_anim_rotation_end[1] - self._local_anim_rotation_start[1]
	slot10 = self._unit
	slot17 = current_rot
	slot15 = current_rot.roll(current_rot) - droll

	self._unit.set_rotation(self._local_anim_rotation_start[1], Rotation(slot12, current_rot.yaw(slot14) - dyaw, current_rot.pitch(current_rot) - dpitch))

	return 
	--- END OF BLOCK #0 ---



end

return 
