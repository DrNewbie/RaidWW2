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
slot14 = CopLogicAttack
FlamerLogicAttack = class(slot13)
function FlamerLogicAttack.enter(data, new_logic_name, enter_params)
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
		slot10 = old_internal_data.best_cover

		CopLogicAttack._set_best_cover(slot7, data, my_data)
	end

	my_data.peek_to_shoot_allowed = false
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
	my_data.update_queue_id = "FlamerLogicAttack.queued_update" .. tostring(slot8)
	slot9 = my_data

	FlamerLogicAttack.queue_update(tostring(slot8), data)

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
function FlamerLogicAttack.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot7 = my_data

	FlamerLogicAttack._cancel_chase_attempt(data, data)

	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	slot7 = "path"

	data.brain.rem_pos_rsrv(data, data.brain)

	slot6 = data.unit
	slot7 = true

	data.unit.brain(data).set_update_enabled_state(data, data.unit.brain(data))

	return 
end
function FlamerLogicAttack.update(data)
	local t = data.t
	local unit = data.unit
	local my_data = data.internal_data

	if my_data.has_old_action then
		slot7 = my_data

		CopLogicAttack._upd_stop_old_action(slot5, data)

		return 
	end

	slot6 = data

	if CopLogicBase._chk_relocate(slot5) then
		return 
	end

	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
		slot7 = true

		CopLogicAttack._upd_enemy_detection(slot5, data)

		if my_data ~= data.internal_data or not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
			return 
		end
	end

	local focus_enemy = data.attention_obj
	slot8 = my_data

	FlamerLogicAttack._process_pathing_results(slot6, data)

	local enemy_visible = focus_enemy.verified
	local engage = my_data.attitude == "engage"

	if not my_data.turning then
		slot9 = data.unit
		slot10 = "walk"
		local action_taken = data.unit.movement(slot8).chk_action_forbidden(slot8, data.unit.movement(slot8)) or my_data.walking_to_chase_pos
	end

	if action_taken then
		return 
	end

	slot10 = unit

	if unit.anim_data(slot9).crouch then
		slot10 = data
		action_taken = CopLogicAttack._request_action_stand(slot9)
	end

	if action_taken then
		return 
	end

	local enemy_pos = (enemy_visible and focus_enemy.m_pos) or focus_enemy.verified_pos
	slot14 = enemy_pos
	action_taken = CopLogicAttack._request_action_turn_to_enemy(slot10, data, my_data, data.m_pos)

	if action_taken then
		return 
	end

	local chase = nil
	slot12 = data.m_pos.z - focus_enemy.m_pos.z
	local z_dist = math.abs(slot11)

	if AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
		if enemy_visible then
			if z_dist < 300 or 2000 < focus_enemy.verified_dis or (engage and 500 < focus_enemy.verified_dis) then
				chase = true
			end

			if focus_enemy.verified_dis < 800 then
				slot13 = unit

				if unit.anim_data(slot12).run then
					local new_action = {
						body_part = 2,
						type = "idle"
					}
					slot14 = data.unit
					slot15 = new_action

					data.unit.brain(slot13).action_request(slot13, data.unit.brain(slot13))
				end
			end
		elseif z_dist < 300 or 2000 < focus_enemy.verified_dis or (engage and (not focus_enemy.verified_t or 5 < t - focus_enemy.verified_t or 700 < focus_enemy.verified_dis)) then
			chase = true
		end
	end

	if chase then
		if my_data.walking_to_chase_pos then
		elseif my_data.pathing_to_chase_pos then
		elseif my_data.chase_path then
			local dist = focus_enemy.verified_dis
			local run_dist = (focus_enemy.verified and 1500) or 800
			local walk = dist < run_dist
			slot18 = (walk and "walk") or "run"

			FlamerLogicAttack._chk_request_action_walk_to_chase_pos(slot15, data, my_data)
		elseif my_data.chase_pos then
			slot15 = unit
			my_data.chase_path_search_id = tostring(unit.key(slot14)) .. "chase"
			my_data.pathing_to_chase_pos = true
			local to_pos = my_data.chase_pos
			my_data.chase_pos = nil
			slot16 = {
				radius = 60,
				position = mvector3.copy(slot18)
			}
			slot19 = to_pos

			data.brain.add_pos_rsrv(unit.key, data.brain, "path")

			slot14 = unit
			slot16 = to_pos

			unit.brain(unit.key).search_for_path(unit.key, unit.brain(unit.key), my_data.chase_path_search_id)
		elseif focus_enemy.nav_tracker then
			slot15 = focus_enemy.nav_tracker
			my_data.chase_pos = CopLogicAttack._find_flank_pos(slot12, data, my_data)
		end
	else
		slot14 = my_data

		FlamerLogicAttack._cancel_chase_attempt(slot12, data)
	end

	return 
end
function FlamerLogicAttack.queued_update(data)
	local my_data = data.internal_data
	my_data.update_queued = false
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	data.t = TimerManager.game(slot3).time(slot3)
	slot4 = data

	FlamerLogicAttack.update(slot3)

	if my_data == data.internal_data then
		slot5 = data.internal_data

		FlamerLogicAttack.queue_update(slot3, data)
	end

	return 
end
function FlamerLogicAttack._process_pathing_results(data, my_data)
	if data.pathing_results then
		local pathing_results = data.pathing_results
		data.pathing_results = nil
		local path = pathing_results[my_data.chase_path_search_id]

		if path then
			if path ~= "failed" then
				my_data.chase_path = path
			else
				slot6 = "[FlamerLogicAttack._process_pathing_results] chase path failed"

				print(slot5)
			end

			my_data.pathing_to_chase_pos = nil
			my_data.chase_path_search_id = nil
		end
	end

	return 
end
function FlamerLogicAttack._cancel_chase_attempt(data, my_data)
	my_data.chase_path = nil

	if my_data.walking_to_chase_pos then
		local new_action = {
			body_part = 2,
			type = "idle"
		}
		slot5 = data.unit
		slot6 = new_action

		data.unit.brain(slot4).action_request(slot4, data.unit.brain(slot4))
	elseif my_data.pathing_to_chase_pos then
		slot5 = "path"

		data.brain.rem_pos_rsrv(slot3, data.brain)

		if data.active_searches[my_data.chase_path_search_id] then
			slot5 = my_data.chase_path_search_id

			managers.navigation.cancel_pathing_search(slot3, managers.navigation)

			data.active_searches[my_data.chase_path_search_id] = nil
		elseif data.pathing_results then
			data.pathing_results[my_data.chase_path_search_id] = nil
		end

		my_data.chase_path_search_id = nil
		my_data.pathing_to_chase_pos = nil
		slot4 = data.unit
		slot4 = data.unit.brain(slot3)

		data.unit.brain(slot3).cancel_all_pathing_searches(slot3)
	elseif my_data.chase_pos then
		my_data.chase_pos = nil
	end

	return 
end
function FlamerLogicAttack.on_action_completed(data, action)
	slot4 = action
	local action_type = action.type(slot3)
	local my_data = data.internal_data

	if action_type == "walk" then
		my_data.advancing = nil

		if my_data.walking_to_chase_pos then
			my_data.walking_to_chase_pos = nil
		end
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "hurt" then
		slot6 = action

		if action.expired(slot5) then
			slot7 = my_data

			CopLogicAttack._upd_aim(slot5, data)
		end
	end

	return 
end
function FlamerLogicAttack.chk_should_turn(data, my_data)
end
function FlamerLogicAttack.queue_update(data, my_data)
	my_data.update_queued = true
	slot9 = data.important

	CopLogicBase.queue_task(slot3, my_data, my_data.update_queue_id, FlamerLogicAttack.queued_update, data, data.t + 1.5)

	return 
end
function FlamerLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, speed, end_rot)

	-- Decompilation error in this vicinity:
	slot6 = data.unit
	slot7 = "walk"

	if not data.unit.movement(slot5).chk_action_forbidden(slot5, data.unit.movement(slot5)) then
		local new_action_data = {
			no_strafe = false,
			type = "walk",
			body_part = 2,
			nav_path = my_data.chase_path,
			variant = speed or "run",
			end_rot = end_rot
		}
		my_data.chase_path = nil
		slot7 = data.unit
		slot8 = new_action_data
		my_data.walking_to_chase_pos = data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))

		if my_data.walking_to_chase_pos then
			slot8 = "path"

			data.brain.rem_pos_rsrv(slot6, data.brain)
		end
	end

	return 
end
function FlamerLogicAttack.is_advancing(data)
	if data.internal_data.walking_to_chase_pos and data.pos_rsrv.move_dest then
		return data.pos_rsrv.move_dest.position
	end

	return 
end
function FlamerLogicAttack._get_all_paths(data)
	return {
		chase_path = data.internal_data.chase_path
	}
end
function FlamerLogicAttack._set_verified_paths(data, verified_paths)
	data.internal_data.chase_path = verified_paths.chase_path

	return 
end

return 
