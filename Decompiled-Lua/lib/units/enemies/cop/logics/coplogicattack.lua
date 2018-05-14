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
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_lerp = mvector3.lerp
local mvec3_norm = mvector3.normalize
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local temp_vec3 = Vector3()
slot14 = CopLogicBase
CopLogicAttack = class(slot13)
CopLogicAttack.super = CopLogicBase
function CopLogicAttack.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.combat
	my_data.vision = data.char_tweak.vision.combat
	slot7 = data.unit
	slot7 = data.unit.inventory(data.unit.brain(slot5))
	slot7 = data.unit.inventory(data.unit.brain(slot5)).equipped_unit(data.unit.brain(slot5))
	slot7 = data.unit.inventory(data.unit.brain(slot5)).equipped_unit(data.unit.brain(slot5)).base(data.unit.brain(slot5))
	local weapon_usage = data.unit.inventory(data.unit.brain(slot5)).equipped_unit(data.unit.brain(slot5)).base(data.unit.brain(slot5)).weapon_tweak_data(data.unit.brain(slot5)).usage
	my_data.weapon_range = data.char_tweak.weapon[weapon_usage].range
	my_data.weapon_range_max = data.char_tweak.weapon[weapon_usage].max_range
	my_data.additional_weapon_stats = data.char_tweak.weapon[weapon_usage].additional_weapon_stats

	if old_internal_data then
		my_data.turning = old_internal_data.turning
		my_data.firing = old_internal_data.firing
		my_data.shooting = old_internal_data.shooting
		my_data.attention_unit = old_internal_data.attention_unit
	end

	my_data.peek_to_shoot_allowed = true
	slot9 = data.key
	slot7 = tostring(slot8)
	my_data.detection_task_key = "CopLogicAttack._upd_enemy_detection" .. slot7
	slot12 = data.t

	CopLogicBase.queue_task(slot7, my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data)

	slot9 = my_data

	CopLogicBase._chk_has_old_action(slot7, data)

	my_data.attitude = (data.objective and data.objective.attitude) or "avoid"
	slot8 = data.unit
	slot9 = false

	data.unit.brain(slot7).set_update_enabled_state(slot7, data.unit.brain(slot7))

	if data.cool then
		slot8 = data.unit
		slot9 = false

		data.unit.movement(slot7).set_cool(slot7, data.unit.movement(slot7))
	end

	if not data.objective or not data.objective.stance then
		slot8 = data.unit
		slot8 = data.unit.movement(slot7)

		if data.unit.movement(slot7).stance_code(slot7) == 1 then
			slot8 = data.unit
			slot9 = "hos"

			data.unit.movement(slot7).set_stance(slot7, data.unit.movement(slot7))
		end
	end

	if my_data ~= data.internal_data then
		return 
	end

	slot9 = data.key
	my_data.update_queue_id = "CopLogicAttack.queued_update" .. tostring(slot8)
	slot10 = 0

	CopLogicAttack.queue_update(tostring(slot8), data, my_data)

	if data.objective and (data.objective.action_duration or (data.objective.action_timeout_t and data.t < data.objective.action_timeout_t)) then
		slot8 = data

		CopLogicBase.request_action_timeout_callback(slot7)
	end

	slot8 = data.unit
	slot9 = {
		cbt = true
	}

	data.unit.brain(slot7).set_attention_settings(slot7, data.unit.brain(slot7))

	return 
end
function CopLogicAttack.exit(data, new_logic_name, enter_params)
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

	slot6 = data.unit
	slot7 = true

	data.unit.brain(data).set_update_enabled_state(data, data.unit.brain(data))

	return 
end
function CopLogicAttack.queued_update(data)
	local my_data = data.internal_data
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	data.t = TimerManager.game(slot3).time(slot3)

	if my_data.has_old_action then
		slot5 = my_data

		CopLogicAttack._upd_stop_old_action(slot3, data)

		slot5 = my_data

		CopLogicAttack.queue_update(slot3, data)

		return 
	end

	slot4 = data

	if CopLogicBase._chk_relocate(slot3) then
		return 
	end

	slot5 = my_data

	CopLogicAttack._process_pathing_results(slot3, data)

	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
		slot5 = true

		CopLogicAttack._upd_enemy_detection(slot3, data)

		if my_data ~= data.internal_data or not data.attention_obj then
			return 
		end
	end

	if AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		slot5 = my_data
		my_data.want_to_take_cover = CopLogicAttack._chk_wants_to_take_cover(slot3, data)
		slot4 = data

		CopLogicAttack._update_cover(slot3)

		slot4 = data

		CopLogicAttack._upd_combat_movement(slot3)
	end

	if data.team.id == "criminal1" and (not data.objective or data.objective.type == "free") and (not data.path_fail_t or 6 < data.t - data.path_fail_t) then
		slot4 = managers.groupai
		slot5 = data.unit

		managers.groupai.state(slot3).on_criminal_jobless(slot3, managers.groupai.state(slot3))

		if my_data ~= data.internal_data then
			return 
		end
	end

	slot5 = my_data

	CopLogicAttack.queue_update(slot3, data)

	return 
end
function CopLogicAttack._upd_combat_movement(data)
	local my_data = data.internal_data
	local unit = data.unit
	local t = data.t
	local focus_enemy = data.attention_obj
	local enemy_visible = focus_enemy.verified
	local enemy_spotted_last_2sec = focus_enemy.verified_t and t - focus_enemy.verified_t < 2
	local enemy_spotted_last_15sec = focus_enemy.verified_t and t - focus_enemy.verified_t < 15
	slot11 = my_data
	local action_taken = data.logic.action_taken(slot9, data)

	if not action_taken then
		slot12 = my_data
		action_taken = CopLogicAttack._upd_pose(slot10, data)
	end

	local in_cover = my_data.in_cover
	local want_to_take_cover = my_data.want_to_take_cover
	local move_to_cover = false
	local want_flank_cover = false

	if not my_data.peek_to_shoot_allowed and not enemy_spotted_last_15sec and (action_taken or want_to_take_cover or not in_cover) then
		my_data.peek_to_shoot_allowed = true
	end

	if my_data.stay_out_time and (enemy_spotted_last_2sec or not my_data.at_cover_shoot_pos or action_taken or want_to_take_cover) then
		my_data.stay_out_time = nil
	elseif my_data.attitude == "engage" and not my_data.stay_out_time and my_data.at_cover_shoot_pos and not enemy_spotted_last_2sec and not action_taken and not want_to_take_cover then
		my_data.stay_out_time = t + 7
	end

	if action_taken then
	elseif want_to_take_cover then
		move_to_cover = true
	elseif not enemy_spotted_last_2sec then
		if data.tactics and data.tactics.charge and data.objective and data.objective.grp_objective and data.objective.grp_objective.charge and (not my_data.charge_path_failed_t or 6 < data.t - my_data.charge_path_failed_t) then
			if my_data.charge_path then
				local path = my_data.charge_path
				my_data.charge_path = nil
				slot18 = path
				action_taken = CopLogicAttack._request_action_walk_to_cover_shoot_pos(slot15, data, my_data)
			elseif not my_data.charge_path_search_id and focus_enemy.nav_tracker then
				slot17 = focus_enemy.nav_tracker
				slot18 = nil
				my_data.charge_pos = CopLogicTravel._get_pos_on_wall(slot14, focus_enemy.nav_tracker.field_position(slot16), my_data.weapon_range.optimal, 45)

				if my_data.charge_pos then
					slot16 = data.key
					slot14 = tostring(slot15)
					my_data.charge_path_search_id = "charge" .. slot14
					slot15 = unit

					unit.brain(slot14).search_for_path(slot14, unit.brain(slot14), my_data.charge_path_search_id, my_data.charge_pos, nil, nil)
				else
					slot17 = data.unit

					debug_pause_unit(slot14, data.unit, "failed to find charge_pos")

					slot15 = TimerManager
					slot15 = TimerManager.game(slot14)
					my_data.charge_path_failed_t = TimerManager.game(slot14).time(slot14)
				end
			end
		elseif in_cover then
			if my_data.peek_to_shoot_allowed then
				local height = nil

				if in_cover[NavigationManager.COVER_RESERVED] then
					height = 150
				else
					height = 80
				end

				slot16 = data.unit
				local my_tracker = data.unit.movement(slot15).nav_tracker(slot15)
				slot21 = height
				local shoot_from_pos = CopLogicAttack._peek_for_pos_sideways(data.unit.movement(slot15), data, my_data, my_tracker, focus_enemy.m_head_pos)

				if shoot_from_pos then
					local path = {}
					slot19 = my_tracker
					path[1] = my_tracker.position(slot18)
					path[2] = shoot_from_pos
					slot22 = (math.random() < 0.5 and "run") or "walk"
					action_taken = CopLogicAttack._request_action_walk_to_cover_shoot_pos(slot18, data, my_data, path)
				else
					my_data.peek_to_shoot_allowed = false
				end
			elseif not enemy_spotted_last_15sec and math.random() < 0.05 then
				move_to_cover = true
				want_flank_cover = true
			end
		elseif my_data.walking_to_cover_shoot_pos then
		elseif my_data.at_cover_shoot_pos and my_data.stay_out_time < t then
			move_to_cover = true
		else
			move_to_cover = true
		end
	end

	local best_cover = my_data.best_cover

	if not action_taken and not my_data.processing_cover_path and not my_data.cover_path and not my_data.charge_path_search_id and best_cover and (not in_cover or best_cover[1] ~= in_cover[1]) and (not my_data.cover_path_failed_t or 5 < data.t - my_data.cover_path_failed_t) then
		CopLogicAttack._cancel_cover_pathing(slot15, data)

		slot18 = data.unit
		local search_id = tostring(data.unit.key(my_data)) .. "cover"
		slot17 = data.unit
		slot20 = best_cover[NavigationManager.COVER_RESERVATION]

		if data.unit.brain(data.unit.key).search_for_path_to_cover(data.unit.key, data.unit.brain(data.unit.key), search_id, best_cover[1]) then
			my_data.cover_path_search_id = search_id
			my_data.processing_cover_path = best_cover
		end
	end

	if not action_taken and move_to_cover and my_data.cover_path then
		slot17 = my_data
		action_taken = CopLogicAttack._request_action_walk_to_cover(slot15, data)
	end

	if want_flank_cover then
		if not my_data.flank_cover then
			local sign = (math.random() < 0.5 and -1) or 1
			local step = 30
			my_data.flank_cover = {
				step = step,
				angle = step * sign,
				sign = sign
			}
		end
	else
		my_data.flank_cover = nil
	end

	if data.important and not my_data.turning then
		slot16 = data.unit
		slot17 = "walk"

		if not data.unit.movement(slot15).chk_action_forbidden(slot15, data.unit.movement(slot15)) then
			slot16 = data

			if CopLogicAttack._can_move(slot15) and enemy_visible and (not in_cover or not in_cover[NavigationManager.COVER_RESERVED]) then
				if data.is_suppressed then
					slot17 = data.unit
					slot17 = data.unit.character_damage(slot16)

					if data.t - data.unit.character_damage(slot16).last_suppression_t(slot16) < 0.7 then
						slot17 = "scared"
						action_taken = CopLogicBase.chk_start_action_dodge(slot15, data)
					end
				end

				if not action_taken and focus_enemy.is_person and focus_enemy.dis < 2000 and ((data.group and 1 < data.group.size) or math.random() < 0.5) then
					local dodge = false

					if focus_enemy.is_local_player then
						slot17 = focus_enemy.unit
						local e_movement_state = focus_enemy.unit.movement(slot16).current_state(slot16)
						slot18 = e_movement_state

						if not e_movement_state._is_reloading(focus_enemy.unit.movement(slot16)) then
							slot18 = e_movement_state

							if not e_movement_state._interacting(slot17) then
								slot18 = e_movement_state

								if not e_movement_state.is_equipping(slot17) then
									dodge = true
								end
							end
						end
					else
						slot17 = focus_enemy.unit
						local e_anim_data = focus_enemy.unit.anim_data(slot16)

						if (e_anim_data.move or e_anim_data.idle) and not e_anim_data.reload then
							dodge = true
						end
					end

					if dodge and focus_enemy.aimed_at then
						slot18 = "preemptive"
						action_taken = CopLogicBase.chk_start_action_dodge(slot16, data)
					end
				end
			end
		end
	end

	if not action_taken and want_to_take_cover and not best_cover then
		slot17 = focus_enemy

		if CopLogicAttack._should_retreat(slot15, data) then
			slot19 = false
			action_taken = CopLogicAttack._start_action_move_back(slot15, data, my_data, focus_enemy)
		end
	end

	if not action_taken then
		slot17 = my_data
		action_taken = CopLogicAttack._start_action_move_out_of_the_way(slot15, data)
	end

	return 
end
function CopLogicAttack._should_retreat(data, focus_enemy)
	if focus_enemy and focus_enemy.nav_tracker and focus_enemy.verified and focus_enemy.dis < 250 then
		slot4 = data

		if CopLogicAttack._can_move(slot3) then
			return true
		end
	end

	return false
end
function CopLogicAttack._start_action_move_back(data, my_data, focus_enemy, engage)
	slot6 = data.m_pos
	local from_pos = mvector3.copy(slot5)
	local threat_tracker = focus_enemy.nav_tracker
	local threat_head_pos = focus_enemy.m_head_pos
	local max_walk_dis = 400
	local vis_required = engage
	slot16 = vis_required
	local retreat_to = CopLogicAttack._find_retreat_position(slot10, from_pos, focus_enemy.m_pos, threat_head_pos, threat_tracker, max_walk_dis)

	if not retreat_to then
		return 
	end

	slot13 = my_data

	CopLogicAttack._cancel_cover_pathing(slot11, data)

	local new_action_data = {
		variant = "walk",
		body_part = 2,
		type = "walk",
		nav_path = {
			from_pos,
			retreat_to
		}
	}
	slot13 = data.unit
	slot14 = new_action_data
	my_data.advancing = data.unit.brain(data).action_request(data, data.unit.brain(data))

	if my_data.advancing then
		my_data.retreating = true

		return true
	end

	return false
end
function CopLogicAttack._start_action_move_out_of_the_way(data, my_data)
	slot4 = data.unit
	slot4 = data.unit.movement(slot3)
	local my_tracker = data.unit.movement(slot3).nav_tracker(slot3)
	local reservation = {
		radius = 30,
		position = data.m_pos,
		filter = data.pos_rsrv_id
	}
	slot7 = reservation

	if not managers.navigation.is_pos_free(slot5, managers.navigation) then
		slot7 = 500
		local to_pos = CopLogicTravel._get_pos_on_wall(slot5, data.m_pos)

		if to_pos then
			local path = {}
			slot8 = my_tracker
			path[1] = my_tracker.position(slot7)
			path[2] = to_pos
			slot11 = "run"

			CopLogicAttack._request_action_walk_to_cover_shoot_pos(slot7, data, my_data, path)
		end
	end

	return 
end
function CopLogicAttack._peek_for_pos_sideways(data, my_data, from_racker, peek_to_pos, height)

	-- Decompilation error in this vicinity:
	local unit = data.unit
	local my_tracker = from_racker
	local enemy_pos = peek_to_pos
	slot10 = unit
	slot10 = unit.movement(slot9)
	local my_pos = unit.movement(slot9).m_pos(slot9)
	local back_vec = my_pos - enemy_pos
	slot13 = 0

	mvector3.set_z(slot11, back_vec)
	mvector3.set_length(slot11, back_vec)

	local back_pos = my_pos + back_vec
	local ray_params = {
		allow_entry = true,
		trace = true,
		tracker_from = my_tracker,
		pos_to = back_pos
	}
	slot15 = ray_params
	local ray_res = managers.navigation.raycast(75, managers.navigation)
	back_pos = ray_params.trace[1]
	local back_polar = back_pos - my_pos.to_polar(managers.navigation)
	slot17 = back_polar.spin + 90
	slot17 = 180
	local right_polar = back_polar.with_spin(back_pos - my_pos, back_polar).with_r(back_pos - my_pos, back_polar.with_spin(back_pos - my_pos, back_polar))
	slot17 = right_polar
	local right_vec = right_polar.to_vector(back_polar.with_spin(back_pos - my_pos, back_polar))
	local right_pos = back_pos + right_vec
	ray_params.pos_to = right_pos
	slot20 = ray_params
	local ray_res = managers.navigation.raycast(slot18, managers.navigation)
	slot27 = "ai_vision"
	local stand_ray = World.raycast(managers.navigation, World, "ray", ray_params.trace[1] + math.UP * height, enemy_pos, "slot_mask", data.visibility_slotmask, "ray_type")
	local min_visiblity_range = 150
	local left_pos = back_pos - right_vec
	ray_params.pos_to = left_pos
	slot24 = ray_params
	local ray_res = managers.navigation.raycast(slot22, managers.navigation)
	slot31 = "ai_vision"
	local stand_ray = World.raycast(managers.navigation, World, "ray", ray_params.trace[1] + math.UP * height, enemy_pos, "slot_mask", data.visibility_slotmask, "ray_type")

	return nil
end
function CopLogicAttack._cancel_pathing(data, my_data, path_search_id)
	if data.active_searches[path_search_id] then
		slot6 = path_search_id

		managers.navigation.cancel_pathing_search(slot4, managers.navigation)

		data.active_searches[path_search_id] = nil
	elseif data.pathing_results then
		data.pathing_results[path_search_id] = nil
	end

	return 
end
function CopLogicAttack._cancel_cover_pathing(data, my_data)
	my_data.cover_path = nil

	if not my_data.processing_cover_path then
		return 
	end

	slot6 = my_data.cover_path_search_id

	CopLogicAttack._cancel_pathing(slot3, data, my_data)

	my_data.processing_cover_path = nil
	my_data.cover_path_search_id = nil

	return 
end
function CopLogicAttack._cancel_charge(data, my_data)
	my_data.charge_pos = nil
	my_data.charge_path = nil

	if not my_data.charge_path_search_id then
		return 
	end

	slot6 = my_data.charge_path_search_id

	CopLogicAttack._cancel_pathing(slot3, data, my_data)

	my_data.charge_path_search_id = nil

	return 
end
function CopLogicAttack._cancel_expected_pos_path(data, my_data)
	my_data.expected_pos_path = nil

	if not my_data.expected_pos_path_search_id then
		return 
	end

	slot6 = my_data.expected_pos_path_search_id

	CopLogicAttack._cancel_pathing(slot3, data, my_data)

	my_data.expected_pos_path_search_id = nil

	return 
end
function CopLogicAttack._request_action_turn_to_enemy(data, my_data, my_pos, enemy_pos)
	slot6 = data.unit
	slot6 = data.unit.movement(slot5)
	slot6 = data.unit.movement(slot5).m_rot(slot5)
	local fwd = data.unit.movement(slot5).m_rot(slot5).y(slot5)
	local target_vec = enemy_pos - my_pos
	slot10 = math.UP
	local error_spin = target_vec.to_polar_with_reference(slot7, target_vec, fwd).spin
	slot9 = error_spin

	if 27 < math.abs(target_vec) then
		local new_action_data = {
			type = "turn",
			body_part = 2,
			angle = error_spin
		}
		slot10 = data.unit
		slot11 = new_action_data

		if data.unit.brain(slot9).action_request(slot9, data.unit.brain(slot9)) then
			my_data.turning = new_action_data.angle

			return true
		end
	end

	return 
end
function CopLogicAttack._cancel_walking_to_cover(data, my_data, skip_action)
	my_data.cover_path = nil

	if my_data.moving_to_cover then
		if not skip_action then
			local new_action = {
				body_part = 2,
				type = "idle"
			}
			slot6 = data.unit
			slot7 = new_action

			data.unit.brain(slot5).action_request(slot5, data.unit.brain(slot5))
		end
	elseif my_data.processing_cover_path then
		slot5 = data.unit
		slot5 = data.unit.brain(slot4)

		data.unit.brain(slot4).cancel_all_pathing_searches(slot4)

		my_data.cover_path_search_id = nil
		my_data.processing_cover_path = nil
	end

	return 
end
function CopLogicAttack._request_action_walk_to_cover(data, my_data)
	slot5 = my_data.cover_path

	CopLogicAttack._adjust_path_start_pos(slot3, data)

	local movement_mode = "walk"

	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_COMBAT or 500 < data.attention_obj.dis then
		slot6 = data.m_pos
	elseif data.attention_obj and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		slot8 = 0.75

		if math.lerp(slot5, my_data.weapon_range.optimal, my_data.weapon_range.far) < data.attention_obj.dis then
			movement_mode = "run"
		end
	end

	local end_pose = nil

	if my_data.moving_to_cover and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
		end_pose = "crouch"
	end

	local new_action_data = {
		type = "walk",
		body_part = 2,
		nav_path = my_data.cover_path,
		variant = movement_mode,
		end_pose = end_pose
	}
	my_data.cover_path = nil
	slot7 = data.unit
	slot8 = new_action_data
	my_data.advancing = data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))

	if my_data.advancing then
		my_data.moving_to_cover = my_data.best_cover
		my_data.at_cover_shoot_pos = nil
		my_data.in_cover = nil
		slot8 = "path"

		data.brain.rem_pos_rsrv(slot6, data.brain)
	end

	return 
end
function CopLogicAttack._adjust_path_start_pos(data, path)
	local first_nav_point = path[1]
	local my_pos = data.m_pos

	if first_nav_point.x ~= my_pos.x or first_nav_point.y ~= my_pos.y then
		slot7 = 1
		slot10 = my_pos

		table.insert(slot5, path, mvector3.copy(slot9))
	end

	return 
end
function CopLogicAttack._request_action_walk_to_cover_shoot_pos(data, my_data, path, speed)
	slot7 = my_data

	CopLogicAttack._cancel_cover_pathing(slot5, data)

	slot7 = my_data

	CopLogicAttack._cancel_charge(slot5, data)

	slot7 = path

	CopLogicAttack._adjust_path_start_pos(slot5, data)

	local new_action_data = {
		body_part = 2,
		type = "walk",
		nav_path = path,
		variant = speed or "walk"
	}
	my_data.cover_path = nil
	slot7 = data.unit
	slot8 = new_action_data
	my_data.advancing = data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))

	if my_data.advancing then
		my_data.walking_to_cover_shoot_pos = my_data.advancing
		my_data.at_cover_shoot_pos = nil
		my_data.in_cover = nil
		slot8 = "path"

		data.brain.rem_pos_rsrv(slot6, data.brain)
	end

	return 
end
function CopLogicAttack._request_action_crouch(data)

	-- Decompilation error in this vicinity:
	slot3 = data.unit
	local new_action_data = {
		body_part = 4,
		type = "crouch"
	}
	slot4 = data.unit
	slot5 = new_action_data
	local res = data.unit.brain(slot3).action_request(slot3, data.unit.brain(slot3))

	return res
end
function CopLogicAttack._request_action_stand(data)

	-- Decompilation error in this vicinity:
	slot3 = data.unit
	local new_action_data = {
		body_part = 4,
		type = "stand"
	}
	slot4 = data.unit
	slot5 = new_action_data
	local res = data.unit.brain(slot3).action_request(slot3, data.unit.brain(slot3))

	return res
end
function CopLogicAttack._update_cover(data)
	local my_data = data.internal_data
	local cover_release_dis_sq = 10000
	local best_cover = my_data.best_cover

	if not data.attention_obj or not data.attention_obj.nav_tracker or AIAttentionObject.REACT_COMBAT > data.attention_obj.reaction then
		if best_cover then
			slot7 = data.m_pos

			if cover_release_dis_sq < mvector3.distance_sq(slot5, best_cover[1][NavigationManager.COVER_POSITION]) then
				slot8 = nil

				CopLogicAttack._set_best_cover(slot5, data, my_data)
			end
		end

		return 
	end

	local in_cover = my_data.in_cover
	local find_new = not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.retreating

	if not find_new then
		if in_cover then
			local threat_pos = data.attention_obj.verified_pos
			slot14 = data.visibility_slotmask
			in_cover[NavigationManager.COVER_TRACKER], in_cover[NavigationManager.COVER_RESERVED] = CopLogicAttack._chk_covered(slot10, data, data.m_pos, threat_pos)
		end

		return 
	end

	local enemy_tracker = data.attention_obj.nav_tracker
	slot9 = enemy_tracker
	local threat_pos = enemy_tracker.field_position(slot8)

	if data.objective and data.objective.type == "follow" then
		slot12 = threat_pos

		CopLogicAttack._find_cover_for_follow(slot9, data, my_data)
	else
		slot12 = threat_pos

		CopLogicAttack._find_cover(slot9, data, my_data)
	end

	if in_cover then
		local threat_pos = data.attention_obj.verified_pos
		slot16 = data.visibility_slotmask
		in_cover[NavigationManager.COVER_TRACKER], in_cover[NavigationManager.COVER_RESERVED] = CopLogicAttack._chk_covered(slot12, data, data.m_pos, threat_pos)
	end

	return 
end
function CopLogicAttack._find_cover_for_follow(data, my_data, threat_pos)

	-- Decompilation error in this vicinity:
	slot5 = data.objective.follow_unit
	slot5 = data.objective.follow_unit.movement(slot4)
	local near_pos = data.objective.follow_unit.movement(slot4).m_pos(slot4)
	slot6 = managers.groupai
	slot9 = data.objective.follow_unit
	slot9 = data.objective.follow_unit.movement(slot8)
	slot9 = data.objective.follow_unit.movement(slot8).nav_tracker(slot8)
	local follow_unit_area = managers.groupai.state(slot5).get_area_from_nav_seg_id(slot5, data.objective.follow_unit.movement(slot8).nav_tracker(slot8).nav_segment(slot8))
	slot11 = threat_pos
	local found_cover = managers.navigation.find_cover_in_nav_seg_3(managers.groupai.state(slot5), managers.navigation, follow_unit_area.nav_segs, (data.objective.distance and data.objective.distance * 0.9) or nil, near_pos)

	if not found_cover then
		return 
	end

	slot9 = found_cover[NavigationManager.COVER_TRACKER]

	if not follow_unit_area.nav_segs[found_cover[NavigationManager.COVER_TRACKER].nav_segment(slot8)] then
		slot9 = "cover in wrong area"

		debug_pause_unit(slot7, data.unit)
	end

	local better_cover = {
		found_cover
	}
	slot11 = better_cover

	CopLogicAttack._set_best_cover(slot8, data, my_data)

	slot11 = threat_pos
	local offset_pos = CopLogicAttack._get_cover_offset_pos(slot8, data, better_cover)

	if offset_pos then
		better_cover[NavigationManager.COVER_RESERVATION] = offset_pos
	end

	return 
end
function CopLogicAttack._find_cover(data, my_data, threat_pos)
	local want_to_take_cover = my_data.want_to_take_cover
	local flank_cover = my_data.flank_cover
	local best_cover = my_data.best_cover
	local min_dis, max_dis = nil

	if want_to_take_cover then
		slot11 = data.attention_obj.dis - 200
		min_dis = math.max(slot9, data.attention_obj.dis * 0.9)
	end

	if not my_data.processing_cover_path and not my_data.charge_path_search_id and not flank_cover and best_cover then
		slot13 = max_dis

		if CopLogicAttack._verify_cover(slot9, best_cover[1], threat_pos, min_dis) then
			return 
		end
	end

	local target_to_unit_vec = data.m_pos - threat_pos

	if flank_cover then
		slot11 = target_to_unit_vec
		slot14 = flank_cover.angle

		mvector3.rotate_with(slot10, Rotation(slot13))
	end

	slot11 = target_to_unit_vec
	local optimal_distance = target_to_unit_vec.length(slot10)
	local max_dis = nil

	if want_to_take_cover then
		if optimal_distance < my_data.weapon_range.far then
			optimal_distance = optimal_distance + 400
			slot14 = optimal_distance

			mvector3.set_length(slot12, target_to_unit_vec)
		end

		slot14 = my_data.weapon_range.far
		max_dis = math.max(slot12, optimal_distance + 800)
	elseif my_data.weapon_range.optimal * 1.2 < optimal_distance then
		optimal_distance = my_data.weapon_range.optimal
		slot14 = optimal_distance

		mvector3.set_length(slot12, target_to_unit_vec)

		max_dis = my_data.weapon_range.far
	end

	local optimal_position = threat_pos + target_to_unit_vec
	slot15 = max_dis

	mvector3.set_length(slot13, target_to_unit_vec)

	local furthest_position = threat_pos + target_to_unit_vec

	if flank_cover then
		local angle = flank_cover.angle
		local sign = flank_cover.sign
		slot17 = angle

		if math.sign(slot16) ~= sign then
			angle = -angle + flank_cover.step * sign
			slot17 = angle

			if 90 < math.abs(flank_cover.step * sign) then
				flank_cover.failed = true
			else
				flank_cover.angle = angle
			end
		else
			flank_cover.angle = -angle
		end
	end

	local cone_angle = nil

	if flank_cover then
		cone_angle = flank_cover.step
	else
		slot17 = 60
		slot21 = optimal_distance / 3000
		cone_angle = math.lerp(slot15, 90, math.min(slot19, 1))
	end

	local search_nav_seg = nil

	if data.objective and data.objective.type == "defend_area" then
		search_nav_seg = (data.objective.area and data.objective.area.nav_segs) or data.objective.nav_seg
	end

	slot23 = data.pos_rsrv_id
	local found_cover = managers.navigation.find_cover_in_cone_from_threat_pos(slot16, managers.navigation, threat_pos, furthest_position, optimal_position, cone_angle, search_nav_seg)

	if found_cover then
	end

	return 
end
function CopLogicAttack._verify_cover(cover, threat_pos, min_dis, max_dis)
	slot8 = threat_pos
	local threat_dis = mvector3.direction(slot5, temp_vec1, cover[1])

	if (min_dis and threat_dis < min_dis) or (max_dis and max_dis < threat_dis) then
		return false
	end

	slot8 = cover[NavigationManager.COVER_FORWARD]
	local cover_dot = mvector3.dot(slot6, temp_vec1)

	if cover_dot < 0.67 then
		return false
	end

	return true
end
function CopLogicAttack._verify_follow_cover(cover, near_pos, threat_pos, min_dis, max_dis)
	slot10 = max_dis

	if CopLogicAttack._verify_cover(slot6, cover, threat_pos, min_dis) then
		slot8 = cover[1]

		if mvector3.distance(slot6, near_pos) < 600 then
			return true
		end
	end

	return 
end
function CopLogicAttack._chk_covered(data, cover_pos, threat_pos, slotmask)
	local ray_from = temp_vec1
	slot8 = math.UP

	mvec3_set(slot6, ray_from)

	slot8 = 80

	mvector3.multiply(slot6, ray_from)

	slot8 = cover_pos

	mvector3.add(slot6, ray_from)

	local ray_to_pos = temp_vec2
	slot11 = 300

	mvector3.step(ray_from, ray_to_pos, ray_from, threat_pos)

	slot13 = slotmask
	local low_ray = World.raycast(ray_from, World, "ray", ray_from, ray_to_pos, "slot_mask")
	local high_ray = nil

	if low_ray then
		slot11 = ray_from.z + 60

		mvector3.set_z(slot9, ray_from)

		slot13 = 300

		mvector3.step(slot9, ray_to_pos, ray_from, threat_pos)

		slot15 = slotmask
		high_ray = World.raycast(slot9, World, "ray", ray_from, ray_to_pos, "slot_mask")
	end

	return low_ray, high_ray
end
function CopLogicAttack._process_pathing_results(data, my_data)
	if not data.pathing_results then
		return 
	end

	local pathing_results = data.pathing_results
	local path = pathing_results[my_data.cover_path_search_id]

	if path then
		if path ~= "failed" then
			my_data.cover_path = path
		else
			slot8 = nil

			CopLogicAttack._set_best_cover(slot5, data, my_data)

			slot6 = TimerManager
			slot6 = TimerManager.game(slot5)
			my_data.cover_path_failed_t = TimerManager.game(slot5).time(slot5)
		end

		my_data.processing_cover_path = nil
		my_data.cover_path_search_id = nil
	end

	path = pathing_results[my_data.charge_path_search_id]

	if path then
		if path ~= "failed" then
			my_data.charge_path = path
		end

		my_data.charge_path_search_id = nil
		slot6 = TimerManager
		slot6 = TimerManager.game(slot5)
		my_data.charge_path_failed_t = TimerManager.game(slot5).time(slot5)
	end

	path = pathing_results[my_data.expected_pos_path_search_id]

	if path then
		if path ~= "failed" then
			my_data.expected_pos_path = path
		end

		my_data.expected_pos_path_search_id = nil
	end

	data.pathing_results = nil

	return 
end
function CopLogicAttack._upd_enemy_detection(data, is_synchronous)
	slot4 = managers.groupai
	slot5 = data.unit

	managers.groupai.state(slot3).on_unit_detection_updated(slot3, managers.groupai.state(slot3))

	slot4 = TimerManager
	data.t = TimerManager.game(slot3).time(slot3)
	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(TimerManager.game(slot3), data, nil)
	local desired_attention, new_prio_slot, new_reaction = CopLogicBase._get_priority_attention(data, data, data.detected_attention_objects)
	slot11 = new_reaction

	CopLogicBase._set_attention_obj(nil, data, desired_attention)

	slot10 = new_reaction

	CopLogicAttack._chk_exit_attack_logic(nil, data)

	if my_data ~= data.internal_data then
		return 
	end

	local old_att_obj = data.attention_obj

	if desired_attention then
		if old_att_obj and old_att_obj.u_key ~= desired_attention.u_key then
			slot11 = my_data

			CopLogicAttack._cancel_charge(slot9, data)

			my_data.flank_cover = nil
			slot10 = data.unit
			slot11 = "walk"

			if not data.unit.movement(slot9).chk_action_forbidden(slot9, data.unit.movement(slot9)) then
				slot11 = my_data

				CopLogicAttack._cancel_walking_to_cover(slot9, data)
			end

			slot12 = nil

			CopLogicAttack._set_best_cover(slot9, data, my_data)
		end
	elseif old_att_obj then
		slot11 = my_data

		CopLogicAttack._cancel_charge(slot9, data)

		my_data.flank_cover = nil
	end

	slot10 = data

	CopLogicBase._chk_call_the_police(slot9)

	if my_data ~= data.internal_data then
		return 
	end

	slot11 = my_data

	data.logic._upd_aim(slot9, data)

	if not is_synchronous then
		slot15 = data.important and true

		CopLogicBase.queue_task(slot9, my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data, delay and data.t + delay)
	end

	slot10 = data.detected_attention_objects

	CopLogicBase._report_detections(slot9)

	return 
end
function CopLogicAttack._find_retreat_position(from_pos, threat_pos, threat_head_pos, threat_tracker, max_dist, vis_required)
	local nav_manager = managers.navigation
	local ct_rays = 5
	local step = 180 / ct_rays
	local step_rot = Rotation(slot10)
	local offset = math.random(step)
	slot13 = offset
	local offset_rot = Rotation(step)
	local dir = (math.random() < 0.5 and -1) or 1
	step = step * dir
	local ray_dis = max_dist or 1000
	local offset_vec = mvector3.copy(slot15)
	slot18 = from_pos

	mvector3.subtract(threat_pos, offset_vec)

	slot17 = offset_vec

	mvector3.normalize(threat_pos)

	slot18 = ray_dis

	mvector3.multiply(threat_pos, offset_vec)

	slot17 = offset_vec
	slot20 = (90 + offset) * dir

	mvector3.rotate_with(threat_pos, Rotation(slot19))

	slot18 = from_pos
	local from_tracker = nav_manager.create_nav_tracker(threat_pos, nav_manager)
	local ray_params = {
		trace = true,
		tracker_from = from_tracker
	}
	local rsrv_desc = {
		radius = 60
	}
	local fail_position = nil

	for i_ray = 1, ct_rays, 1 do
		local to_pos = mvector3.copy(slot24)
		slot27 = offset_vec

		mvector3.add(from_pos, to_pos)

		ray_params.pos_to = to_pos
		slot27 = ray_params
		local ray_res = nav_manager.raycast(from_pos, nav_manager)

		if ray_res then
			rsrv_desc.position = ray_params.trace[1]
			slot28 = rsrv_desc
			local is_free = nav_manager.is_pos_free(slot26, nav_manager)

			if is_free then
			end
		elseif not fail_position then
			rsrv_desc.position = ray_params.trace[1]
			slot28 = rsrv_desc
			local is_free = nav_manager.is_pos_free(slot26, nav_manager)

			if is_free then
				fail_position = ray_params.trace[1]
			end
		end

		slot28 = step_rot

		mvector3.rotate_with(slot26, offset_vec)
	end

	slot22 = from_tracker

	managers.navigation.destroy_nav_tracker(slot20, managers.navigation)

	if fail_position then
		return fail_position
	end

	return nil
end
function CopLogicAttack._is_threat_visible(retreat_pos, threat_pos, threat_head_pos, threat_tracker)
	local ray_params = {
		trace = true,
		pos_from = retreat_pos,
		tracker_to = threat_tracker
	}
	slot8 = ray_params
	local walk_ray_res = managers.navigation.raycast(slot6, managers.navigation)

	if not walk_ray_res then
		return ray_params.trace[1]
	end

	local retreat_head_pos = mvector3.copy(slot7)
	slot9 = retreat_head_pos
	slot14 = 150

	mvector3.add(retreat_pos, Vector3(slot11, 0, 0))

	slot10 = "AI_visibility"
	local slotmask = managers.slot.get_mask(retreat_pos, managers.slot)
	slot17 = "ai_vision"
	local ray_res = World.raycast(managers.slot, World, "ray", retreat_head_pos, threat_head_pos, "slot_mask", slotmask, "ray_type")

	if not ray_res then
		return walk_ray_res or ray_params.trace[1]
	end

	return false
end
function CopLogicAttack.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action
	local action_type = action.type(slot4)

	if action_type == "walk" then
		my_data.advancing = nil
		slot7 = my_data

		CopLogicAttack._cancel_cover_pathing(slot5, data)

		slot7 = my_data

		CopLogicAttack._cancel_charge(slot5, data)

		if my_data.retreating then
			my_data.retreating = false
		elseif my_data.moving_to_cover then
			slot6 = action

			if action.expired(slot5) then
				my_data.in_cover = my_data.moving_to_cover
				my_data.cover_enter_t = data.t
			end

			my_data.moving_to_cover = nil
		elseif my_data.walking_to_cover_shoot_pos then
			my_data.walking_to_cover_shoot_pos = nil
			my_data.at_cover_shoot_pos = true
		end
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "hurt" then
		slot7 = my_data

		CopLogicAttack._cancel_cover_pathing(slot5, data)

		if data.important then
			slot6 = action

			if action.expired(slot5) then
				slot7 = "hit"

				if not CopLogicBase.chk_start_action_dodge(slot5, data) then
					slot7 = my_data

					CopLogicAttack._upd_aim(slot5, data)
				end
			end
		end
	elseif action_type == "dodge" then
		slot6 = action
		local timeout = action.timeout(slot5)

		if timeout then
			slot7 = TimerManager
			slot9 = timeout[2]
			data.dodge_timeout_t = TimerManager.game(slot6).time(slot6) + math.lerp(TimerManager.game(slot6), timeout[1], math.random())
		end

		slot8 = my_data

		CopLogicAttack._cancel_cover_pathing(slot6, data)

		slot7 = action

		if action.expired(slot6) then
			slot8 = my_data

			CopLogicAttack._upd_aim(slot6, data)
		end
	end

	return 
end
function CopLogicAttack._upd_aim(data, my_data)
	local shoot, aim, expected_pos = nil
	local focus_enemy = data.attention_obj

	if not my_data.weapon_range then
		my_data.weapon_range = {
			close = 10000,
			far = 20000
		}
	end

	if focus_enemy and AIAttentionObject.REACT_AIM <= focus_enemy.reaction then
		slot8 = data.unit
		slot8 = data.unit.character_damage(slot7)
		local last_sup_t = data.unit.character_damage(slot7).last_suppression_t(slot7)

		if focus_enemy.verified or focus_enemy.nearly_visible then
			slot9 = data.unit

			if data.unit.anim_data(slot8).run then
				slot12 = 0

				if math.lerp(slot9, my_data.weapon_range.close, my_data.weapon_range.optimal) < focus_enemy.dis then
					slot9 = data.unit
					slot9 = data.unit.movement(slot8)
					local walk_to_pos = data.unit.movement(slot8).get_walk_to_pos(slot8)

					if walk_to_pos then
						slot12 = walk_to_pos

						mvector3.direction(slot9, temp_vec1, data.m_pos)

						slot12 = focus_enemy.m_pos

						mvector3.direction(slot9, temp_vec2, data.m_pos)

						slot11 = temp_vec2
						local dot = mvector3.dot(slot9, temp_vec1)

						if dot < 0.6 then
							shoot = false
							aim = false
						end
					end
				end
			end

			if aim == nil and AIAttentionObject.REACT_AIM <= focus_enemy.reaction then
				if AIAttentionObject.REACT_SHOOT <= focus_enemy.reaction then
					if my_data.advancing then

						-- Decompilation error in this vicinity:
						slot9 = my_data.advancing
						slot9 = my_data.advancing
						local running = my_data.advancing.haste(slot8) == "run"
					end

					if last_sup_t and data.t - last_sup_t < 7 * ((running and 0.3) or 1) * ((focus_enemy.verified and 1) or (focus_enemy.vis_ray and 500 < focus_enemy.vis_ray.distance and 0.5) or 0.2) then
						shoot = true
					elseif focus_enemy.verified and focus_enemy.verified_dis < data.internal_data.weapon_range.close then
						shoot = true
					elseif focus_enemy.verified and focus_enemy.criminal_record then
						if not my_data.weapon_range_max or focus_enemy.verified_dis < my_data.weapon_range_max then
							shoot = true
						end
					else
						slot10 = focus_enemy.unit

						if focus_enemy.unit.vehicle(slot9) then
							shoot = true
						end
					end

					if not shoot and my_data.attitude == "engage" then
						if focus_enemy.verified then
							if focus_enemy.verified_dis < ((running and data.internal_data.weapon_range.close) or data.internal_data.weapon_range.far) or focus_enemy.reaction == AIAttentionObject.REACT_SHOOT then
								shoot = true
							end
						else
							local time_since_verification = focus_enemy.verified_t and data.t - focus_enemy.verified_t

							if my_data.firing and time_since_verification and time_since_verification < 3.5 then
								shoot = true
							else
								slot15 = my_data.key
								slot13 = focus_enemy.unit

								data.brain.search_for_path_to_unit(slot10, data.brain, "hunt" .. tostring(slot14))
							end
						end
					end

					if not shoot and focus_enemy.char_tweak and focus_enemy.char_tweak.is_escort and not focus_enemy.char_tweak.immortal then
						slot10 = focus_enemy.unit
						local escort_ext = focus_enemy.unit.escort(slot9)

						if escort_ext then
							slot11 = escort_ext

							if not escort_ext.is_safe(slot10) then
								shoot = true
							end
						end
					end

					aim = aim or shoot

					if not aim and focus_enemy.verified_dis < ((running and data.internal_data.weapon_range.close) or data.internal_data.weapon_range.far) then
						aim = true
					end
				else
					aim = true
				end
			end
		elseif AIAttentionObject.REACT_AIM <= focus_enemy.reaction then
			local time_since_verification = focus_enemy.verified_t and data.t - focus_enemy.verified_t
		else
			slot10 = my_data
			expected_pos = CopLogicAttack._get_expected_attention_position(slot8, data)

			if expected_pos then
				aim = true
			end
		end
	end

	local weapon_cooldown = false

	if shoot and my_data.additional_weapon_stats and my_data.additional_weapon_stats.shooting_duration then
		my_data.additional_weapon_stats.shooting_t = my_data.additional_weapon_stats.shooting_t or data.t + my_data.additional_weapon_stats.shooting_duration

		if my_data.additional_weapon_stats.shooting_t < data.t then
			slot11 = 100
			local rand_shoot = my_data.additional_weapon_stats.shooting_duration + math.random(slot9, 0) / 150
			slot12 = 100
			local rand_cooldown = my_data.additional_weapon_stats.cooldown_duration + math.random(0, 0) / 400
			my_data.additional_weapon_stats.shooting_t = data.t + rand_shoot + rand_shoot + rand_cooldown
			my_data.additional_weapon_stats.cooldown_t = data.t + rand_cooldown
		elseif my_data.additional_weapon_stats.cooldown_t and data.t < my_data.additional_weapon_stats.cooldown_t then
			weapon_cooldown = true
		end
	end

	if shoot and weapon_cooldown then
		shoot = false
		aim = true
	end

	if not aim and data.char_tweak.always_face_enemy and focus_enemy and AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
		aim = true
	end

	slot10 = my_data

	if data.logic.chk_should_turn(slot8, data) and (focus_enemy or expected_pos) then
		local enemy_pos = expected_pos or ((focus_enemy.verified or focus_enemy.nearly_visible) and focus_enemy.m_pos) or focus_enemy.verified_pos
		slot13 = enemy_pos

		CopLogicAttack._request_action_turn_to_enemy(slot9, data, my_data, data.m_pos)
	end

	if aim or shoot then
		if expected_pos then
			if my_data.attention_unit ~= expected_pos then
				slot9 = data
				slot12 = expected_pos

				CopLogicBase._set_attention_on_pos(slot8, mvector3.copy(slot11))

				slot9 = expected_pos
				my_data.attention_unit = mvector3.copy(slot8)
			end
		elseif focus_enemy.verified or focus_enemy.nearly_visible then
			if my_data.attention_unit ~= focus_enemy.u_key then
				slot10 = focus_enemy

				CopLogicBase._set_attention(slot8, data)

				my_data.attention_unit = focus_enemy.u_key
			end
		else
			local look_pos = focus_enemy.last_verified_pos or focus_enemy.verified_pos

			if my_data.attention_unit ~= look_pos then
				slot10 = data
				slot13 = look_pos

				CopLogicBase._set_attention_on_pos(slot9, mvector3.copy(slot12))

				slot10 = look_pos
				my_data.attention_unit = mvector3.copy(slot9)
			end
		end

		if not my_data.shooting then
			slot9 = data.unit

			if not data.unit.anim_data(slot8).reload then
				slot9 = data.unit
				slot10 = "action"

				if not data.unit.movement(slot8).chk_action_forbidden(slot8, data.unit.movement(slot8)) then
					local shoot_action = {
						body_part = 3,
						type = "shoot"
					}
					slot10 = data.unit
					slot11 = shoot_action

					if data.unit.brain(slot9).action_request(slot9, data.unit.brain(slot9)) then
						my_data.shooting = true
					end
				end
			end
		end
	else
		if my_data.shooting then
			local new_action = nil
			slot10 = data.unit

			if data.unit.anim_data(slot9).reload then
				new_action = {
					body_part = 3,
					type = "reload"
				}
			else
				new_action = {
					body_part = 3,
					type = "idle"
				}
			end

			slot10 = data.unit
			slot11 = new_action

			data.unit.brain(slot9).action_request(slot9, data.unit.brain(slot9))
		end

		if my_data.attention_unit then
			slot9 = data

			CopLogicBase._reset_attention(slot8)

			my_data.attention_unit = nil
		end
	end

	slot12 = my_data

	CopLogicAttack.aim_allow_fire(slot8, shoot, aim, data)

	return 
end
function CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
	local focus_enemy = data.attention_obj

	if shoot then
		if not my_data.firing then
			slot7 = data.unit
			slot8 = true

			data.unit.movement(slot6).set_allow_fire(slot6, data.unit.movement(slot6))

			my_data.firing = true
			slot8 = 16

			if not data.unit.in_slot(slot6, data.unit) and data.char_tweak.chatter.aggressive then
				slot7 = managers.groupai
				slot10 = "aggressive"

				managers.groupai.state(slot6).chk_say_enemy_chatter(slot6, managers.groupai.state(slot6), data.unit, data.m_pos)
			end
		end
	elseif my_data.firing then
		slot7 = data.unit
		slot8 = false

		data.unit.movement(slot6).set_allow_fire(slot6, data.unit.movement(slot6))

		my_data.firing = nil
	end

	return 
end
function CopLogicAttack.chk_should_turn(data, my_data)
end
function CopLogicAttack._get_cover_offset_pos(data, cover_data, threat_pos)

	-- Decompilation error in this vicinity:
	local threat_vec = threat_pos - cover_data[1][1]
	slot7 = 0

	mvector3.set_z(slot5, threat_vec)

	slot8 = math.UP
	local threat_polar = threat_vec.to_polar_with_reference(slot5, threat_vec, cover_data[1][2])
	local threat_spin = threat_polar.spin
	local rot = nil

	if threat_spin < -20 then
		slot9 = 90
		rot = Rotation(slot8)
	elseif 20 < threat_spin then
		slot9 = -90
		rot = Rotation(slot8)
	else
		slot9 = 180
		rot = Rotation(slot8)
	end

	local offset_pos = mvector3.copy(slot8)
	slot11 = rot

	mvector3.rotate_with(cover_data[1][2], offset_pos)

	slot11 = 25

	mvector3.set_length(cover_data[1][2], offset_pos)

	slot11 = cover_data[1][1]

	mvector3.add(cover_data[1][2], offset_pos)

	local ray_params = {
		trace = true,
		tracker_from = cover_data[1][3],
		pos_to = offset_pos
	}
	slot12 = ray_params

	managers.navigation.raycast(offset_pos, managers.navigation)

	return ray_params.trace[1]
end
function CopLogicAttack._find_flank_pos(data, my_data, flank_tracker, max_dist)
	slot6 = flank_tracker
	local pos = flank_tracker.position(slot5)
	local vec_to_pos = pos - data.m_pos
	slot9 = 0

	mvector3.set_z(slot7, vec_to_pos)

	local max_dis = max_dist or 1500
	slot10 = max_dis

	mvector3.set_length(slot8, vec_to_pos)

	slot13 = 5
	local accross_positions = managers.navigation.find_walls_accross_tracker(slot8, managers.navigation, flank_tracker, vec_to_pos, 160)

	if accross_positions then
		local optimal_dis = max_dis
		local best_error_dis, best_pos, best_is_hit, best_is_miss, best_has_too_much_error = nil
		slot16 = accross_positions

		for _, accross_pos in ipairs(slot15) do
			slot24 = pos
			slot21 = mvector3.distance(slot22, accross_pos[1]) - optimal_dis
			local error_dis = math.abs(slot20)
			local too_much_error = 0.2 < error_dis / optimal_dis
			local is_hit = accross_pos[2]

			if best_is_hit then
				if is_hit then
					if error_dis < best_error_dis then
						local reservation = {
							radius = 30,
							position = accross_pos[1],
							filter = data.pos_rsrv_id
						}
						slot26 = reservation

						if managers.navigation.is_pos_free(slot24, managers.navigation) then
							best_pos = accross_pos[1]
							best_error_dis = error_dis
							best_has_too_much_error = too_much_error
						end
					end
				elseif best_has_too_much_error then
					local reservation = {
						radius = 30,
						position = accross_pos[1],
						filter = data.pos_rsrv_id
					}
					slot26 = reservation

					if managers.navigation.is_pos_free(slot24, managers.navigation) then
						best_pos = accross_pos[1]
						best_error_dis = error_dis
						best_is_miss = true
						best_is_hit = nil
					end
				end
			elseif best_is_miss then
				if not too_much_error then
					local reservation = {
						radius = 30,
						position = accross_pos[1],
						filter = data.pos_rsrv_id
					}
					slot26 = reservation

					if managers.navigation.is_pos_free(slot24, managers.navigation) then
						best_pos = accross_pos[1]
						best_error_dis = error_dis
						best_has_too_much_error = nil
						best_is_miss = nil
						best_is_hit = true
					end
				end
			else
				local reservation = {
					radius = 30,
					position = accross_pos[1],
					filter = data.pos_rsrv_id
				}
				slot26 = reservation

				if managers.navigation.is_pos_free(slot24, managers.navigation) then
					best_pos = accross_pos[1]
					best_is_hit = is_hit
					best_is_miss = not is_hit
					best_has_too_much_error = too_much_error
					best_error_dis = error_dis
				end
			end
		end

		return best_pos
	end

	return 
end
function CopLogicAttack.damage_clbk(data, damage_info)
	slot5 = damage_info

	CopLogicBase.damage_clbk(slot3, data)

	return 
end
function CopLogicAttack.is_available_for_assignment(data, new_objective)
	local my_data = data.internal_data

	if my_data.exiting then
		return 
	end

	if new_objective and new_objective.forced then
		return true
	end

	slot5 = data.unit
	slot6 = "walk"

	if data.unit.movement(slot4).chk_action_forbidden(slot4, data.unit.movement(slot4)) then
		return 
	end

	if data.path_fail_t and data.t < data.path_fail_t + 6 then
		return 
	end

	if data.is_suppressed then
		return 
	end

	local att_obj = data.attention_obj

	if not att_obj or att_obj.reaction < AIAttentionObject.REACT_AIM then
		return true
	end

	if not new_objective or new_objective.type == "free" then
		return true
	end

	if new_objective then
		slot8 = 0.2
		local allow_trans, obj_fail = CopLogicBase.is_obstructed(slot5, data, new_objective)

		if obj_fail then
			return 
		end
	end

	return true
end
function CopLogicAttack._chk_wants_to_take_cover(data, my_data)

	-- Decompilation error in this vicinity:
	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_COMBAT then
		return false
	end

	slot4 = data.unit
	slot4 = data.unit.inventory(slot3)
	slot4 = data.unit.inventory(slot3).equipped_unit(slot3)
	slot4 = data.unit.inventory(slot3).equipped_unit(slot3).base(slot3)
	local ammo_max, ammo = data.unit.inventory(slot3).equipped_unit(slot3).base(slot3).ammo_info(slot3)

	if ammo / ammo_max < 0.2 then
		return true
	end

	return false
end
function CopLogicAttack._set_best_cover(data, my_data, cover_data)
	local best_cover = my_data.best_cover

	if best_cover then
		slot7 = best_cover[1]

		managers.navigation.release_cover(slot5, managers.navigation)

		slot7 = my_data

		CopLogicAttack._cancel_cover_pathing(slot5, data)
	end

	if cover_data then
		slot8 = data.pos_rsrv_id

		managers.navigation.reserve_cover(slot5, managers.navigation, cover_data[1])

		my_data.best_cover = cover_data

		if not my_data.in_cover and not my_data.walking_to_cover_shoot_pos and not my_data.moving_to_cover then
			slot7 = data.m_pos

			if mvec3_dis_sq(slot5, cover_data[1][1]) < 100 then
				my_data.in_cover = my_data.best_cover
				my_data.cover_enter_t = data.t
			end
		end
	else
		my_data.best_cover = nil
		my_data.flank_cover = nil
	end

	return 
end
function CopLogicAttack._set_nearest_cover(my_data, cover_data)
	local nearest_cover = my_data.nearest_cover

	if nearest_cover then
		slot6 = nearest_cover[1]

		managers.navigation.release_cover(slot4, managers.navigation)
	end

	if cover_data then
		slot5 = my_data.unit
		local pos_rsrv_id = my_data.unit.movement(slot4).pos_rsrv_id(slot4)
		slot8 = pos_rsrv_id

		managers.navigation.reserve_cover(my_data.unit.movement(slot4), managers.navigation, cover_data[1])

		my_data.nearest_cover = cover_data
	else
		my_data.nearest_cover = nil
	end

	return 
end
function CopLogicAttack._can_move(data)
	return not data.objective or not data.objective.pos or not data.objective.in_place
end
function CopLogicAttack.queue_update(data, my_data, delay)
	local update_delay = delay
	update_delay = update_delay or (data.important and 0.5) or 2
	slot11 = true

	CopLogicBase.queue_task(slot5, my_data, my_data.update_queue_id, data.logic.queued_update, data, data.t + update_delay)

	return 
end
function CopLogicAttack._get_expected_attention_position(data, my_data)
	local main_enemy = data.attention_obj
	local e_nav_tracker = main_enemy.nav_tracker

	if not e_nav_tracker then
		return 
	end

	slot6 = data.unit
	slot6 = data.unit.movement(slot5)
	slot6 = data.unit.movement(slot5).nav_tracker(slot5)
	local my_nav_seg = data.unit.movement(slot5).nav_tracker(slot5).nav_segment(slot5)
	local e_pos = main_enemy.m_pos
	slot8 = e_nav_tracker
	local e_nav_seg = e_nav_tracker.nav_segment(slot7)

	if e_nav_seg == my_nav_seg then
		slot10 = e_pos

		mvec3_set(slot8, temp_vec1)

		slot10 = temp_vec1.z + tweak_data.player.PLAYER_EYE_HEIGHT

		mvec3_set_z(slot8, temp_vec1)

		return temp_vec1
	end

	local expected_path = my_data.expected_pos_path
	local from_nav_seg, to_nav_seg = nil

	if expected_path then
		local i_from_seg = nil
		slot13 = expected_path

		for i, k in ipairs(slot12) do
			if k[1] == my_nav_seg then
				i_from_seg = i

				break
			end
		end

		if i_from_seg then
			local function _find_aim_pos(from_nav_seg, to_nav_seg)
				local closest_dis = 1000000000
				local closest_door = nil
				local min_point_dis_sq = 10000
				slot8 = from_nav_seg
				slot14 = to_nav_seg
				local found_doors = managers.navigation.find_segment_doors(slot6, managers.navigation, callback(slot10, CopLogicAttack, CopLogicAttack, "_chk_is_right_segment"))
				slot8 = found_doors

				for _, door in pairs(managers.navigation) do
					slot14 = door

					mvec3_set(slot12, temp_vec1)

					slot14 = temp_vec1
					local dis = mvec3_dis_sq(slot12, e_pos)

					if dis < closest_dis then
						closest_dis = dis
						closest_door = door
					end
				end

				if closest_door then
					slot9 = closest_door

					mvec3_set(slot7, temp_vec1)

					slot9 = data.m_pos

					mvec3_sub(slot7, temp_vec1)

					slot9 = 0

					mvec3_set_z(slot7, temp_vec1)

					slot8 = temp_vec1

					if min_point_dis_sq < mvector3.length_sq(slot7) then
						slot9 = closest_door

						mvec3_set(slot7, temp_vec1)

						slot9 = temp_vec1.z + tweak_data.player.PLAYER_EYE_HEIGHT

						mvec3_set_z(slot7, temp_vec1)

						return temp_vec1
					else
						return false, true
					end
				end

				return 
			end

			local i = #expected_path

			while 0 < i do
				if expected_path[i][1] == e_nav_seg then
					slot17 = i_from_seg + 1
					to_nav_seg = expected_path[math.clamp(slot14, i, i_from_seg - 1)][1]
					slot16 = to_nav_seg
					local aim_pos, too_close = _find_aim_pos(slot14, my_nav_seg)

					if aim_pos then
						return aim_pos

						break
					end

					if too_close then
						slot19 = i_from_seg + 2
						local next_nav_seg = expected_path[math.clamp(slot16, i, i_from_seg - 2)][1]

						if next_nav_seg ~= to_nav_seg then
							local from_nav_seg = to_nav_seg
							to_nav_seg = next_nav_seg
							slot20 = to_nav_seg
							aim_pos = _find_aim_pos(slot18, from_nav_seg)
						end

						return aim_pos
					end

					break
				end

				i = i - 1
			end
		end

		if not i_from_seg or not to_nav_seg then
			expected_path = nil
			my_data.expected_pos_path = nil
		end
	end

	if not expected_path and not my_data.expected_pos_path_search_id then
		slot13 = data.key
		slot11 = tostring(slot12)
		my_data.expected_pos_path_search_id = "ExpectedPos" .. slot11
		slot12 = data.unit
		slot14 = e_nav_seg

		data.unit.brain(slot11).search_for_coarse_path(slot11, data.unit.brain(slot11), my_data.expected_pos_path_search_id)
	end

	return 
end
function CopLogicAttack._chk_is_right_segment(ignore_this, enemy_nav_seg, test_nav_seg)
	return enemy_nav_seg == test_nav_seg
end
function CopLogicAttack.is_advancing(data)
	if data.internal_data.moving_to_cover then
		return data.internal_data.moving_to_cover[1][NavigationManager.COVER_POSITION]
	end

	if data.internal_data.walking_to_cover_shoot_pos then
		return data.internal_data.walking_to_cover_shoot_pos._last_pos
	end

	return 
end
function CopLogicAttack._get_all_paths(data)
	return {
		cover_path = data.internal_data.cover_path,
		flank_path = data.internal_data.flank_path
	}
end
function CopLogicAttack._set_verified_paths(data, verified_paths)
	data.internal_data.cover_path = verified_paths.cover_path
	data.internal_data.flank_path = verified_paths.flank_path

	return 
end
function CopLogicAttack._chk_exit_attack_logic(data, new_reaction)
	slot4 = data.unit
	slot5 = "walk"

	if not data.unit.movement(slot3).chk_action_forbidden(slot3, data.unit.movement(slot3)) then
		slot5 = new_reaction
		local wanted_state = CopLogicBase._get_logic_state_from_reaction(slot3, data)

		if wanted_state ~= data.name then
			local allow_trans, obj_failed = CopLogicBase.is_obstructed(slot4, data, data.objective, nil)

			if allow_trans then
				if obj_failed then
					slot8 = data.objective

					data.objective_failed_clbk(slot6, data.unit)
				end

				slot7 = data.detected_attention_objects

				CopLogicBase._report_detections(slot6)
			end
		end
	end

	return 
end
function CopLogicAttack.action_taken(data, my_data)
	if not my_data.turning and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.retreating and not my_data.has_old_action then
		slot4 = data.unit
		slot5 = "walk"
		slot2 = data.unit.movement(slot3).chk_action_forbidden(slot3, data.unit.movement(slot3))
	end

	return slot2
end
function CopLogicAttack._upd_stop_old_action(data, my_data)
	slot4 = data.unit

	if data.unit.anim_data(slot3).to_idle then
		return 
	end

	slot4 = data.unit
	slot5 = "walk"

	if data.unit.movement(slot3).chk_action_forbidden(slot3, data.unit.movement(slot3)) then
		slot4 = data.unit
		slot5 = "idle"

		if not data.unit.movement(slot3).chk_action_forbidden(slot3, data.unit.movement(slot3)) then
			slot4 = data

			CopLogicBase._start_idle_action_from_act(slot3)
		end
	else
		slot4 = data.unit

		if data.unit.anim_data(slot3).act then
			slot4 = data.unit

			if data.unit.anim_data(slot3).needs_idle then
				slot4 = data

				CopLogicBase._start_idle_action_from_act(slot3)
			end
		end
	end

	slot5 = my_data

	CopLogicBase._chk_has_old_action(slot3, data)

	return 
end
function CopLogicAttack._upd_pose(data, my_data)
	local unit_can_stand = not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand
	local unit_can_crouch = not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch
	local stand_objective = data.objective and data.objective.pose == "stand"
	local crouch_objective = data.objective and data.objective.pose == "crouch"
	local need_cover = my_data.want_to_take_cover and (not my_data.in_cover or not my_data.in_cover[NavigationManager.COVER_RESERVED])

	if not unit_can_stand or (need_cover and not stand_objective) or crouch_objective then
		slot9 = data.unit

		if not data.unit.anim_data(slot8).crouch and unit_can_crouch then
			slot9 = data

			return CopLogicAttack._request_action_crouch(slot8)
		end
	elseif not unit_can_crouch or (not my_data.peek_to_shoot_allowed and not crouch_objective) or stand_objective then
		slot9 = data.unit

		if data.unit.anim_data(slot8).crouch and unit_can_stand then
			slot9 = data

			return CopLogicAttack._request_action_stand(slot8)
		end
	end

	return 
end
function CopLogicAttack._exit_non_walkable_area(data)

	-- Decompilation error in this vicinity:
	local my_data = data.internal_data
	slot4 = data.unit
	local my_tracker = data.unit.movement(slot3).nav_tracker(slot3)
	slot5 = my_tracker

	if not my_tracker.obstructed(data.unit.movement(slot3)) then
		return 
	end

	if data.objective and data.objective.nav_seg then
		slot5 = my_tracker
		local nav_seg_id = my_tracker.nav_segment(slot4)

		if not managers.navigation._nav_segments[nav_seg_id].disabled then
			data.objective.in_place = nil
			slot7 = data.objective

			CopLogicAttack.on_new_objective(nil, data)

			return true
		end
	end

	return 
end

return 
