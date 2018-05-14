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
local tmp_vec1 = Vector3()
slot3 = CopLogicBase
CopLogicIdle = class(slot2)
CopLogicIdle.allowed_transitional_actions = {
	{
		"idle",
		"hurt",
		"dodge"
	},
	{
		"idle",
		"turn"
	},
	{
		"idle",
		"reload"
	},
	{
		"hurt",
		"stand",
		"crouch"
	}
}
function CopLogicIdle.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit
	slot6 = data.unit.movement(slot5)
	local is_cool = data.unit.movement(slot5).cool(slot5)

	if is_cool then
		my_data.detection = data.char_tweak.detection.ntl
		my_data.vision = data.char_tweak.vision.idle
	else
		my_data.vision = data.char_tweak.vision.combat
		my_data.detection = data.char_tweak.detection.idle
	end

	my_data.vision_cool = data.char_tweak.vision.idle
	my_data.vision_not_cool = data.char_tweak.vision.combat
	local old_internal_data = data.internal_data

	if old_internal_data then
		my_data.turning = old_internal_data.turning

		if old_internal_data.firing then
			slot8 = data.unit
			slot9 = false

			data.unit.movement(slot7).set_allow_fire(slot7, data.unit.movement(slot7))
		end

		if old_internal_data.shooting then
			slot8 = data.unit
			slot9 = {
				body_part = 3,
				type = "idle"
			}

			data.unit.brain(slot7).action_request(slot7, data.unit.brain(slot7))
		end

		slot8 = data.unit
		local lower_body_action = data.unit.movement(slot7)._active_actions[2]

		if lower_body_action then
			slot9 = lower_body_action
		else
			my_data.advancing = nil
		end
	end

	data.internal_data = my_data
	slot10 = data.unit
	local key_str = tostring(data.unit.key(slot9))
	my_data.detection_task_key = "CopLogicIdle.update" .. key_str
	slot13 = data.t

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CopLogicIdle.queued_update, data)

	if my_data.nearest_cover or my_data.best_cover then
		my_data.cover_update_task_key = "CopLogicIdle._update_cover" .. key_str
		slot16 = data
		slot12 = data.t + 1

		CopLogicBase.add_delayed_clbk(key_str, my_data, my_data.cover_update_task_key, callback(slot12, CopLogicTravel, CopLogicTravel, "_update_cover"))
	end

	local objective = data.objective

	if objective then
		if (objective.nav_seg or objective.type == "follow") and not objective.in_place then
			slot12 = data.unit

			debug_pause_unit(slot9, data.unit, "[CopLogicIdle.enter] wrong logic, shoudln't be in idle")
		end

		my_data.scan = objective.scan

		if objective.rubberband_rotation then
			slot10 = data.unit
			slot10 = data.unit.movement(slot9)
			slot10 = data.unit.movement(slot9).m_rot(slot9)
			slot8 = data.unit.movement(slot9).m_rot(slot9).y(slot9)
		end

		my_data.rubberband_rotation = slot8
	else
		my_data.scan = true
	end

	if my_data.scan then
		my_data.stare_path_search_id = "stare" .. key_str
		my_data.wall_stare_task_key = "CopLogicIdle._chk_stare_into_wall" .. key_str
	end

	slot11 = my_data

	CopLogicBase._chk_has_old_action(slot9, data)

	if my_data.scan and (not objective or not objective.action) then
		slot14 = data.t

		CopLogicBase.queue_task(slot9, my_data, my_data.wall_stare_task_key, CopLogicIdle._scan_for_dangerous_areas, data)
	end

	if is_cool then
		slot10 = data.unit
		slot11 = {
			peaceful = true
		}

		data.unit.brain(slot9).set_attention_settings(slot9, data.unit.brain(slot9))
	else
		slot10 = data.unit
		slot11 = {
			cbt = true
		}

		data.unit.brain(slot9).set_attention_settings(slot9, data.unit.brain(slot9))
	end

	local inventory = data.unit.inventory(slot9)
	slot11 = inventory

	if inventory.equipped_unit(data.unit) then
		slot11 = inventory
		local base = inventory.equipped_unit(slot10).base(slot10)
		slot12 = base
		local weapon_tweak_data = base.weapon_tweak_data(inventory.equipped_unit(slot10))
		local usage = weapon_tweak_data.usage
		my_data.weapon_range = data.char_tweak.weapon[usage].range
	else
		my_data.weapon_range = {
			optimal = 2000,
			close = 1000
		}
	end

	slot11 = data.unit
	slot12 = false

	data.unit.brain(slot10).set_update_enabled_state(slot10, data.unit.brain(slot10))

	slot12 = data.unit

	managers.voice_over.guard_register_idle(slot10, managers.voice_over)

	slot13 = objective

	CopLogicIdle._perform_objective_action(slot10, data, my_data)

	return 
end
function CopLogicIdle.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(data)

	slot7 = "path"

	data.brain.rem_pos_rsrv(data, data.brain)

	slot7 = data.unit

	managers.voice_over.guard_unregister_idle(data, managers.voice_over)

	return 
end
function CopLogicIdle.queued_update(data)
	local my_data = data.internal_data
	slot4 = data
	local delay = data.logic._upd_enemy_detection(slot3)

	if data.internal_data ~= my_data then
		slot5 = data.detected_attention_objects

		CopLogicBase._report_detections(slot4)

		return 
	end

	local objective = data.objective

	if my_data.has_old_action then
		slot8 = objective

		CopLogicBase._upd_stop_old_action(slot5, data, my_data)

		slot11 = data.important and true

		CopLogicBase.queue_task(slot5, my_data, my_data.detection_task_key, CopLogicIdle.queued_update, data, data.t + delay)

		return 
	end

	if data.team and data.team.id == "criminal1" and (not data.objective or data.objective.type == "free") and (not data.path_fail_t or 6 < data.t - data.path_fail_t) then
		slot6 = managers.groupai
		slot7 = data.unit

		managers.groupai.state(slot5).on_criminal_jobless(slot5, managers.groupai.state(slot5))

		if my_data ~= data.internal_data then
			return 
		end
	end

	slot6 = data

	if CopLogicBase._chk_relocate(slot5) then
		return 
	end

	slot8 = objective

	CopLogicIdle._perform_objective_action(slot5, data, my_data)

	slot8 = objective

	CopLogicIdle._upd_stance_and_pose(slot5, data, my_data)

	slot7 = my_data

	CopLogicIdle._upd_pathing(slot5, data)

	slot7 = my_data

	CopLogicIdle._upd_scan(slot5, data)

	if data.cool then
		slot6 = data

		CopLogicIdle.upd_suspicion_decay(slot5)
	end

	if data.internal_data ~= my_data then
		slot6 = data.detected_attention_objects

		CopLogicBase._report_detections(slot5)

		return 
	end

	delay = (data.important and 0) or delay or 0.1
	slot11 = data.important and true

	CopLogicBase.queue_task(slot5, my_data, my_data.detection_task_key, CopLogicIdle.queued_update, data, data.t + delay)

	return 
end
function CopLogicIdle._upd_enemy_detection(data)
	slot3 = data.unit

	if data.unit.brain(slot2).dead then
		return 
	end

	slot3 = managers.groupai
	slot4 = data.unit

	managers.groupai.state(slot2).on_unit_detection_updated(slot2, managers.groupai.state(slot2))

	slot3 = TimerManager
	data.t = TimerManager.game(slot2).time(slot2)
	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(TimerManager.game(slot2), data, nil)
	slot6 = data.detected_attention_objects
	local new_attention, new_prio_slot, new_reaction = CopLogicBase._get_priority_attention(data, data)
	slot10 = new_reaction

	CopLogicBase._set_attention_obj(slot7, data, new_attention)

	if new_reaction and AIAttentionObject.REACT_SUSPICIOUS < new_reaction then
		local objective = data.objective
		local wanted_logic = nil
		slot13 = new_attention
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(slot9, data, objective, nil)

		if allow_trans then
			slot12 = data
			wanted_logic = CopLogicBase._get_logic_state_from_reaction(slot11)
		end

		if wanted_logic and wanted_logic ~= data.name then
			if obj_failed then
				slot13 = data.objective

				data.objective_failed_clbk(slot11, data.unit)
			end

			if my_data == data.internal_data then
				slot12 = data.unit

				if not data.unit.brain(slot11).logic_queued_key then
					local params = nil
					slot13 = managers.groupai
					slot13 = managers.groupai.state(slot12)

					if managers.groupai.state(slot12).whisper_mode(slot12) and my_data.vision.detection_delay then
						params = {
							delay = my_data.vision.detection_delay
						}
					end

					slot15 = params

					CopLogicBase._exit(slot12, data.unit, wanted_logic)
				end
			end
		end
	end

	if my_data == data.internal_data then
		slot8 = data

		CopLogicBase._chk_call_the_police(slot7)

		if my_data ~= data.internal_data then
			return delay
		end
	end

	return delay
end
function CopLogicIdle._upd_pathing(data, my_data)
	if not data.pathing_results then
		return 
	end

	local path = my_data.stare_path_search_id and data.pathing_results[my_data.stare_path_search_id]

	if not path then
		return 
	end

	data.pathing_results[my_data.stare_path_search_id] = nil
	slot5 = data.pathing_results

	if not next(my_data.stare_path_search_id) then
		data.pathing_results = nil
	end

	if path ~= "failed" then
		my_data.stare_path = path
		slot9 = data.t

		CopLogicBase.queue_task(slot4, my_data, my_data.wall_stare_task_key, CopLogicIdle._smooth_stare_path, data)
	else
		slot8 = data.unit

		print(slot4, data.unit.key(slot7))

		local path_jobs = my_data.stare_path_pos
		slot6 = path_jobs

		table.remove("[CopLogicIdle:_upd_pathing] stare path failed!")

		if #path_jobs ~= 0 then
			slot6 = data.unit
			slot8 = path_jobs[#path_jobs]

			data.unit.brain(slot5).search_for_path(slot5, data.unit.brain(slot5), my_data.stare_path_search_id)
		else
			my_data.stare_path_pos = nil
		end
	end

	return 
end
function CopLogicIdle._upd_scan(data, my_data)

	-- Decompilation error in this vicinity:
	slot5 = my_data

	if CopLogicBase._chk_focus_on_attention_object(slot3, data) then
		return 
	end

	slot4 = data

	if not my_data.stare_pos or not my_data.next_scan_t or data.t < my_data.next_scan_t then
		if not my_data.turning and my_data.fwd_offset then
			slot7 = data.unit
			slot7 = data.unit.movement(slot6)
			slot7 = data.unit.movement(slot6).m_rot(slot6)
			slot6 = math.UP
			local return_spin = my_data.rubberband_rotation.to_polar_with_reference(slot3, my_data.rubberband_rotation, data.unit.movement(slot6).m_rot(slot6).y(slot6)).spin
			slot5 = return_spin

			if math.abs(my_data.rubberband_rotation) < 15 then
				my_data.fwd_offset = nil
			end

			slot7 = return_spin

			CopLogicBase._turn_by_spin(slot4, data, my_data)
		end

		return 
	end

	local scan_target_positions = my_data.scan_target_positions

	if not scan_target_positions then
		scan_target_positions = {}
		slot5 = my_data.stare_pos

		for i_pos, pos in ipairs(slot4) do
			slot11 = pos

			table.insert(slot9, scan_target_positions)
		end

		my_data.scan_target_positions = scan_target_positions
	end

	slot5 = #scan_target_positions
	local scan_target_index = math.random(slot4)
	local scan_pos = scan_target_positions[scan_target_index]

	if #scan_target_positions == 1 then
		my_data.scan_target_positions = nil
	else
		scan_target_positions[scan_target_positions] = scan_target_positions[#scan_target_positions]
		slot7 = scan_target_positions

		table.remove(slot6)
	end

	slot8 = scan_pos

	CopLogicBase._set_attention_on_pos(slot6, data)

	slot10 = scan_pos
	local should_turn = CopLogicBase._chk_request_action_turn_to_look_pos(slot6, data, my_data, data.m_pos)

	if should_turn then
		if my_data.rubberband_rotation then
			my_data.fwd_offset = true
		end

		slot8 = data.unit
		local upper_body_action = data.unit.movement(slot7)._active_actions[3]

		if not upper_body_action then
			local idle_action = {
				body_part = 3,
				type = "idle"
			}
			slot10 = data.unit
			slot11 = idle_action

			data.unit.movement(slot9).action_request(slot9, data.unit.movement(slot9))
		end
	end

	slot10 = 10
	my_data.next_scan_t = data.t + math.random(slot8, 3)

	return 
end
function CopLogicIdle._chk_reaction_to_attention_object(data, attention_data, stationary)
	local record = attention_data.criminal_record
	slot6 = data
	local can_arrest = CopLogicBase._can_arrest(slot5)

	if not record or not attention_data.is_person then
		if attention_data.settings.reaction == AIAttentionObject.REACT_ARREST and not can_arrest then
			return AIAttentionObject.REACT_AIM
		else
			return attention_data.settings.reaction
		end
	end

	local att_unit = attention_data.unit

	if attention_data.is_deployable or data.t < record.arrest_timeout then
		slot9 = AIAttentionObject.REACT_COMBAT

		return math.min(slot7, attention_data.settings.reaction)
	end

	if record.status == "dead" then
		slot9 = AIAttentionObject.REACT_AIM

		return math.min(slot7, attention_data.settings.reaction)
	elseif record.status == "disabled" then
		if record.assault_t and 0.6 < record.assault_t - record.disabled_t then
			slot9 = AIAttentionObject.REACT_COMBAT

			return math.min(slot7, attention_data.settings.reaction)
		else
			slot9 = AIAttentionObject.REACT_AIM

			return math.min(slot7, attention_data.settings.reaction)
		end
	elseif record.being_arrested then
		slot9 = AIAttentionObject.REACT_AIM

		return math.min(slot7, attention_data.settings.reaction)
	elseif can_arrest then
	end

	slot9 = AIAttentionObject.REACT_COMBAT

	return math.min(slot7, attention_data.settings.reaction)
end
function CopLogicIdle._area_has_enemies(data, area)
	slot4 = data.unit
	slot8 = "enemies"
	local is_enemy = data.unit.in_slot(slot3, managers.slot.get_mask(slot6, managers.slot))

	if is_enemy then
		slot5 = area.criminal.units

		if next(slot4) then
			return true
		end
	else
		slot5 = area.police.units

		if next(slot4) then
			return true
		end
	end

	return false
end
function CopLogicIdle._scan_for_dangerous_areas(data)
	slot3 = data.unit
	local nav_tracker = data.unit.movement(slot2).nav_tracker(slot2)
	slot4 = managers.groupai
	slot4 = managers.groupai.state(data.unit.movement(slot2))
	local current_area = managers.groupai.state(data.unit.movement(slot2)).get_area_from_nav_seg_id(data.unit.movement(slot2), nav_tracker.nav_segment(slot6))
	local found_areas = {
		[current_area] = true
	}
	local areas_to_search = {
		current_area
	}
	local dangerous_far_areas = {}
	slot9 = current_area

	if CopLogicIdle._area_has_enemies(nav_tracker, data) then
		return 
	end

	slot8 = areas_to_search

	while next(slot7) do
		slot9 = 1
		local test_area = table.remove(slot7, areas_to_search)
		slot10 = test_area

		if CopLogicIdle._area_has_enemies(areas_to_search, data) then
			if test_area == current_area then
				slot9 = "[CopLogic] Found enemies in the area that the unit is in, should not be possible to happen"

				debug_pause(slot8)
			end

			dangerous_far_areas[test_area] = true
		else
			slot9 = test_area.neighbours

			for n_area_id, n_area in pairs(slot8) do
				if not found_areas[n_area] then
					found_areas[n_area] = test_area
					slot15 = n_area

					table.insert(slot13, areas_to_search)
				end
			end
		end
	end

	local dangerous_near_areas = {}
	slot9 = dangerous_far_areas

	for area, _ in pairs(slot8) do
		local backwards_area = area

		while found_areas[backwards_area] ~= current_area do
			backwards_area = found_areas[backwards_area]
		end

		dangerous_near_areas[backwards_area] = true
	end

	slot9 = data.unit
	slot9 = data.unit.movement(slot8)
	local ray_from_pos = data.unit.movement(slot8).m_stand_pos(slot8)
	local ray_to_pos = Vector3()
	local nav_manager = managers.navigation
	local all_nav_segs = nav_manager._nav_segments
	local walk_params = {
		tracker_from = nav_tracker
	}
	local slotmask = data.visibility_slotmask
	local mvec3_set = mvector3.set
	local mvec3_set_z = mvector3.set_z
	local stare_pos = {}
	local path_tasks = {}
	slot19 = dangerous_near_areas

	for area, _ in pairs(slot18) do
		local nav_seg_id = area.pos_nav_seg
		local nav_seg = all_nav_segs[area.pos_nav_seg]

		if not nav_seg.disabled then
			slot27 = nav_seg_id
			local seg_pos = nav_manager.find_random_position_in_segment(slot25, nav_manager)
			walk_params.pos_to = seg_pos
			slot28 = walk_params
			local ray_hit = nav_manager.raycast(nav_manager, nav_manager)

			if ray_hit then
				slot29 = seg_pos

				mvec3_set(slot27, ray_to_pos)

				slot29 = ray_to_pos.z + 160

				mvec3_set_z(slot27, ray_to_pos)

				slot33 = slotmask
				ray_hit = World.raycast(slot27, World, "ray", ray_from_pos, ray_to_pos, "slot_mask")

				if ray_hit then
					slot29 = seg_pos

					table.insert(slot27, path_tasks)
				else
					slot29 = ray_to_pos

					table.insert(slot27, stare_pos)
				end
			else
				slot29 = seg_pos + math.UP * 160

				table.insert(slot27, stare_pos)
			end
		end
	end

	local my_data = data.internal_data

	if 0 < #stare_pos then
		my_data.stare_pos = stare_pos
		my_data.next_scan_t = 0
	end

	if 0 < #path_tasks then
		my_data.stare_path_pos = path_tasks
		slot20 = data.unit
		slot22 = path_tasks[#path_tasks]

		data.unit.brain(slot19).search_for_path(slot19, data.unit.brain(slot19), my_data.stare_path_search_id)
	end

	return 
end
function CopLogicIdle._smooth_stare_path(data)
	local my_data = data.internal_data
	local slotmask = data.visibility_slotmask
	local stare_path = my_data.stare_path

	if not stare_path or #stare_path == 0 then
		slot7 = "[CopLogic] No stare path, should be at least one present"

		Application.error(slot5, Application)

		return 
	end

	local f_nav_point_pos = CopLogicBase._nav_point_pos
	slot7 = stare_path

	for i, nav_point in ipairs(slot6) do
		slot12 = nav_point
		stare_path[i] = f_nav_point_pos(slot11)
	end

	local mvec3_dis = mvector3.distance
	local mvec3_lerp = mvector3.lerp
	local mvec3_set_z = mvector3.set_z
	local segment_distances = {}
	local total_distance = 0
	local ct_nodes = #stare_path
	local i_node = 1
	local current_pos = stare_path[1]

	repeat
		local next_pos = stare_path[i_node + 1]
		slot17 = next_pos
		local distance = mvec3_dis(slot15, current_pos)
		slot18 = distance

		table.insert(current_pos, segment_distances)

		total_distance = total_distance + distance
		current_pos = next_pos
		i_node = i_node + 1
	until i_node == ct_nodes

	local path_steps = 5
	local distance_step = total_distance / (path_steps + 1)
	slot17 = data.unit
	slot17 = data.unit.movement(slot16)
	local ray_from_pos = data.unit.movement(slot16).m_stand_pos(slot16)
	local ray_to_pos = Vector3()
	local current_step_distance = 0
	local i_node = ct_nodes
	local i_step = 0

	repeat
		current_step_distance = current_step_distance + distance_step
		local segment_distance = segment_distances[i_node - 1]

		while segment_distance < current_step_distance do
			i_node = i_node - 1
			current_step_distance = current_step_distance - segment_distance
			segment_distance = segment_distances[i_node - 1]
		end

		slot26 = current_step_distance / segment_distance

		mvec3_lerp(slot22, ray_to_pos, stare_path[i_node], stare_path[i_node - 1])

		slot24 = ray_to_pos.z + 160

		mvec3_set_z(slot22, ray_to_pos)

		slot30 = "ai_vision"
		local hit = World.raycast(slot22, World, "ray", ray_from_pos, ray_to_pos, "slot_mask", slotmask, "ray_type")

		if not hit then
			if not my_data.stare_pos then
				my_data.next_scan_t = 0
				my_data.stare_pos = {}
			end

			slot25 = ray_to_pos

			table.insert(slot23, my_data.stare_pos)

			break
		end

		i_step = i_step + 1
	until i_step == path_steps

	my_data.stare_path = nil
	local path_jobs = my_data.stare_path_pos
	slot23 = path_jobs

	table.remove(slot22)

	if 0 < #path_jobs then
		slot23 = data.unit
		slot25 = path_jobs[#path_jobs]

		data.unit.brain(slot22).search_for_path(slot22, data.unit.brain(slot22), my_data.stare_path_search_id)
	else
		my_data.stare_path_pos = nil
		slot27 = data.t + 2

		CopLogicBase.queue_task(slot22, my_data, my_data.wall_stare_task_key, CopLogicIdle._scan_for_dangerous_areas, data)
	end

	return 
end
function CopLogicIdle.on_area_safety(data, nav_seg, safe, event)
	if safe or event.reason ~= "criminal" then
		return 
	end

	local my_data = data.internal_data
	local u_criminal = event.record.unit
	slot8 = u_criminal
	local key_criminal = u_criminal.key(slot7)

	if not data.detected_attention_objects[key_criminal] then
		slot9 = managers.groupai
		slot10 = data.SO_access_str
		local attention_info = managers.groupai.state(slot8).get_AI_attention_objects_by_filter(slot8, managers.groupai.state(slot8))[key_criminal]

		if attention_info then
			slot14 = data.team
			local settings = attention_info.handler.get_attention(slot9, attention_info.handler, data.SO_access, nil, nil)

			if settings then
				slot16 = settings
				data.detected_attention_objects[key_criminal] = CopLogicBase._create_detected_attention_object_data(slot11, data.t, data.unit, key_criminal, attention_info)
			end
		end
	end

	return 
end
function CopLogicIdle.on_action_completed(data, action)
	slot4 = action
	local action_type = action.type(slot3)

	if action_type == "turn" then
		data.internal_data.turning = nil

		if data.internal_data.fwd_offset then
			slot8 = data.unit
			slot8 = data.unit.movement(slot7)
			slot8 = data.unit.movement(slot7).m_rot(slot7)
			slot7 = math.UP
			local return_spin = data.internal_data.rubberband_rotation.to_polar_with_reference(slot4, data.internal_data.rubberband_rotation, data.unit.movement(slot7).m_rot(slot7).y(slot7)).spin
			slot6 = return_spin

			if math.abs(data.internal_data.rubberband_rotation) < 15 then
				data.internal_data.fwd_offset = nil
			end
		end
	elseif action_type == "act" then
		local my_data = data.internal_data

		if my_data.action_started == action then
			if my_data.scan and not my_data.exiting and not my_data.stare_path_pos and (not my_data.queued_tasks or not my_data.queued_tasks[my_data.wall_stare_task_key]) then
				slot10 = data.t

				CopLogicBase.queue_task(slot5, my_data, my_data.wall_stare_task_key, CopLogicIdle._scan_for_dangerous_areas, data)
			end

			slot6 = action

			if action.expired(slot5) then
				if not my_data.action_timeout_clbk_id then
					slot7 = data.objective

					data.objective_complete_clbk(slot5, data.unit)
				end
			elseif not my_data.action_timed_out then
				slot7 = data.objective

				data.objective_failed_clbk(slot5, data.unit)
			end
		end

		if action._action_desc and action._action_desc.complete_callback then
			slot6 = data.unit

			action._action_desc.complete_callback(slot5)
		end
	elseif action_type == "hurt" and data.important then
		slot5 = action

		if action.expired(slot4) then
			slot6 = "hit"

			CopLogicBase.chk_start_action_dodge(slot4, data)
		end
	end

	return 
end
function CopLogicIdle.is_available_for_assignment(data, objective)
	if objective and objective.forced then
		return true
	end

	local my_data = data.internal_data

	if data.objective and data.objective.action then
		if my_data.action_started then
			slot5 = data.unit

			if not data.unit.anim_data(slot4).act_idle then
				return false
			end
		else
			return false
		end
	end

	if my_data.exiting or (data.path_fail_t and data.t < data.path_fail_t + 6) then
		return false
	end

	return true
end
function CopLogicIdle._can_move(data)
	return not data.objective or not data.objective.pos or not data.objective.in_place
end
function CopLogicIdle._exit_non_walkable_area(data)

	-- Decompilation error in this vicinity:
	local my_data = data.internal_data
	slot4 = data.unit
	local nav_tracker = data.unit.movement(slot3).nav_tracker(slot3)
	slot5 = nav_tracker

	if not nav_tracker.obstructed(data.unit.movement(slot3)) then
		return false
	end

	if data.objective and data.objective.nav_seg then
		slot5 = nav_tracker
		local nav_seg_id = nav_tracker.nav_segment(slot4)

		if not managers.navigation._nav_segments[nav_seg_id].disabled then
			data.objective.in_place = nil
			slot7 = data.objective

			CopLogicBase.on_new_objective(nil, data)

			return true
		end
	end

	return 
end
function CopLogicIdle._get_all_paths(data)
	return {
		stare_path = data.internal_data.stare_path
	}
end
function CopLogicIdle._set_verified_paths(data, verified_paths)
	data.internal_data.stare_path = verified_paths.stare_path

	return 
end
function CopLogicIdle._upd_curious_reaction(data)
	local my_data = data.internal_data
	local attention_obj = data.attention_obj
	slot5 = data.unit
	slot5 = data.unit.movement(slot4)
	local has_attention = data.unit.movement(slot4).attention(slot4)

	if not has_attention or has_attention.u_key ~= attention_obj.u_key then
		slot7 = attention_obj

		CopLogicBase._set_attention(slot5, data)
	end

	local turn_angle_limit = 70
	local distance = attention_obj.dis

	if (not attention_obj.settings.turn_around_range or distance < attention_obj.settings.turn_around_range) and data.objective and data.objective.rot then
		slot11 = data.unit
		slot11 = data.unit.movement(slot10)
		slot11 = data.unit.movement(slot10).m_rot(slot10)
		slot10 = math.UP
		local angle_to_att_obj = attention_obj.m_pos - data.m_pos.to_polar_with_reference(data.m_pos, attention_obj.m_pos - data.m_pos, data.unit.movement(slot10).m_rot(slot10).y(slot10)).spin

		if turn_angle_limit < angle_to_att_obj then
			slot11 = angle_to_att_obj

			CopLogicBase._turn_by_spin(slot8, data, my_data)

			if my_data.rubberband_rotation then
				my_data.fwd_offset = true
			end
		end
	end

	is_suspicious = data.cool and attention_obj.reaction == AIAttentionObject.REACT_SUSPICIOUS

	if is_suspicious then
		slot11 = attention_obj

		return CopLogicBase._upd_suspicion(slot8, data, my_data)
	end

	return 
end
function CopLogicIdle._chk_objective_needs_travel(data, objective)
	if not objective.nav_seg and objective.type ~= "follow" then
		return false
	end

	if objective.in_place then
		return false
	end

	if objective.pos then
		return true
	end

	if objective.area then
		slot5 = data.unit
		slot5 = data.unit.movement(slot4)
		slot5 = data.unit.movement(slot4).nav_tracker(slot4)

		if objective.area.nav_segs[data.unit.movement(slot4).nav_tracker(slot4).nav_segment(slot4)] then
			objective.in_place = true

			return false
		end
	end

	return true
end
function CopLogicIdle._upd_stance_and_pose(data, my_data, objective)
	slot5 = data.unit
	slot6 = "walk"

	if data.unit.movement(slot4).chk_action_forbidden(slot4, data.unit.movement(slot4)) then
		return 
	end

	local applied_objective_stance, applied_objective_pose = nil

	if objective then
		if objective.stance and (not data.char_tweak.allowed_stances or data.char_tweak.allowed_stances[objective.stance]) then
			applied_objective_stance = true
			slot7 = data.unit
			local upper_body_action = data.unit.movement(slot6)._active_actions[3]
		end

		if objective.pose and not data.is_suppressed and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses[objective.pose]) then
			applied_objective_pose = true

			if objective.pose == "crouch" then
				slot7 = data

				CopLogicAttack._request_action_crouch(slot6)
			elseif objective.pose == "stand" then
				slot7 = data

				CopLogicAttack._request_action_stand(slot6)
			end
		end
	end

	if not applied_objective_stance and data.char_tweak.allowed_stances then
		slot8 = data.unit

		if not data.char_tweak.allowed_stances[data.unit.anim_data(slot7).stance] then
			slot7 = data.char_tweak.allowed_stances

			for stance_name, allowed in pairs(slot6) do
				if allowed then
					slot12 = data.unit
					slot13 = stance_name

					data.unit.movement(slot11).set_stance(slot11, data.unit.movement(slot11))

					break
				end
			end
		end
	end

	if not applied_objective_pose then
		if data.is_suppressed then
			slot7 = data.unit
		elseif data.char_tweak.allowed_poses then
			slot8 = data.unit

			if not data.char_tweak.allowed_poses[data.unit.anim_data(slot7).pose] then
				slot7 = data.char_tweak.allowed_poses

				for pose_name, state in pairs(slot6) do
					if state then
						if pose_name == "crouch" then
							slot12 = data

							CopLogicAttack._request_action_crouch(slot11)

							break
						end

						if pose_name == "stand" then
							slot12 = data

							CopLogicAttack._request_action_stand(slot11)
						end

						break
					end
				end
			end
		end
	end

	return 
end
function CopLogicIdle._perform_objective_action(data, my_data, objective)

	-- Decompilation error in this vicinity:
	if objective.action then
		slot5 = data.unit
		slot6 = objective.action
		my_data.action_started = data.unit.brain(slot4).action_request(slot4, data.unit.brain(slot4))
	else
		my_data.action_started = true
	end

	if my_data.action_started then
		if objective.action_duration or objective.action_timeout_t then
			slot5 = data

			CopLogicBase.request_action_timeout_callback(slot4)
		end

		if objective.action_start_clbk then
			slot5 = data.unit

			objective.action_start_clbk(slot4)
		end
	end

	return 
end

return 
