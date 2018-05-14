-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = CopLogicBase
CopLogicFlee = class(slot1)
function CopLogicFlee.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	my_data.detection = data.char_tweak.detection.combat
	my_data.vision = data.char_tweak.vision.combat
	data.internal_data = my_data
	slot7 = data.unit
	slot8 = "walk"

	if data.unit.movement(data.unit.brain(slot5)).chk_action_forbidden(data.unit.brain(slot5), data.unit.movement(data.unit.brain(slot5))) then
		my_data.wants_stop_old_walk_action = true
	end

	slot7 = data.key
	local key_str = tostring(slot6)
	my_data.detection_task_key = "CopLogicFlee._update_enemy_detection" .. key_str
	slot11 = data

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CopLogicFlee._update_enemy_detection)

	my_data.cover_update_task_key = "CopLogicFlee._update_cover" .. key_str
	slot12 = data.t + 1

	CopLogicBase.queue_task(key_str, my_data, my_data.cover_update_task_key, CopLogicFlee._update_cover, data)

	my_data.cover_path_search_id = key_str .. "cover"

	if data.attention_obj and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		my_data.want_cover = true
	end

	slot8 = data

	CopLogicBase._reset_attention(slot7)

	slot8 = data.unit
	slot9 = "wnd"

	data.unit.movement(slot7).set_stance(slot7, data.unit.movement(slot7))

	slot8 = data.unit
	slot9 = false

	data.unit.movement(slot7).set_cool(slot7, data.unit.movement(slot7))

	if my_data ~= data.internal_data then
		return 
	end

	slot8 = data.unit
	slot9 = {
		cbt = true
	}

	data.unit.brain(slot7).set_attention_settings(slot7, data.unit.brain(slot7))

	return 
end
function CopLogicFlee.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	slot7 = "path"

	data.brain.rem_pos_rsrv(data, data.brain)

	return 
end
function CopLogicFlee.update(data)
	local exit_state = nil
	local unit = data.unit
	local my_data = data.internal_data
	local objective = data.objective
	local t = data.t

	if my_data.wants_stop_old_walk_action then
		slot8 = data.unit
		slot9 = "walk"

		if not data.unit.movement(slot7).chk_action_forbidden(slot7, data.unit.movement(slot7)) then
			slot8 = data.unit
			slot9 = {
				body_part = 2,
				type = "idle"
			}

			data.unit.movement(slot7).action_request(slot7, data.unit.movement(slot7))

			my_data.wants_stop_old_walk_action = nil
		end

		return 
	end

	if data.attention_obj and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
		slot9 = my_data

		CopLogicFlee._cancel_flee_pathing(slot7, data)

		slot9 = my_data

		CopLogicFlee._update_cover_pathing(slot7, data)

		if my_data.cover_pathing then
		elseif my_data.moving_to_cover then
		elseif my_data.cover_path then
			if not my_data.turning then
				slot8 = unit
				slot9 = "walk"

				if not unit.movement(slot7).chk_action_forbidden(slot7, unit.movement(slot7)) then
					slot9 = my_data.cover_path

					CopLogicAttack._adjust_path_start_pos(slot7, data)

					local new_action_data = {
						variant = "run",
						body_part = 2,
						type = "walk",
						nav_path = my_data.cover_path
					}
					my_data.cover_path = nil
					slot9 = unit
					slot10 = new_action_data

					if unit.brain(data).action_request(data, unit.brain(data)) then
						my_data.moving_to_cover = my_data.best_cover
						my_data.in_cover = nil
					end
				end
			end
		elseif my_data.best_cover and my_data.best_cover ~= my_data.in_cover then
			my_data.cover_pathing = true
			slot8 = unit
			slot10 = my_data.best_cover[1][NavigationManager.COVER_POSITION]

			unit.brain(slot7).search_for_path(slot7, unit.brain(slot7), my_data.cover_path_search_id)
		end
	else
		slot9 = my_data

		CopLogicFlee._cancel_cover_pathing(slot7, data)

		if my_data.advancing then
			slot8 = unit

			if not unit.anim_data(slot7).crouch then
				slot8 = data

				CopLogicAttack._request_action_crouch(slot7)
			end
		elseif my_data.processing_flee_path or my_data.processing_coarse_path then
			slot9 = my_data

			CopLogicFlee._update_pathing(slot7, data)
		elseif my_data.cover_leave_t then
			if not my_data.turning then
				slot8 = unit
				slot9 = "walk"

				if not unit.movement(slot7).chk_action_forbidden(slot7, unit.movement(slot7)) then
					if my_data.cover_leave_t < t then
						my_data.cover_leave_t = nil
					elseif my_data.best_cover then
						slot9 = my_data

						if not CopLogicTravel._chk_request_action_turn_to_cover(slot7, data) then
							slot8 = unit

							if not unit.anim_data(slot7).crouch then
								slot8 = data

								CopLogicAttack._request_action_crouch(slot7)
							end
						end
					end
				end
			end
		elseif my_data.flee_path then
			if my_data.path_blocked == false then
				slot8 = unit
				slot9 = "walk"

				if not unit.movement(slot7).chk_action_forbidden(slot7, unit.movement(slot7)) then
					local new_action_data = {
						body_part = 2,
						type = "walk",
						path_simplified = true,
						variant = "run",
						nav_path = my_data.flee_path
					}
					my_data.flee_path = nil
					slot9 = unit
					slot10 = new_action_data
					my_data.advancing = unit.brain(slot8).action_request(slot8, unit.brain(slot8))

					if my_data.advancing then
						my_data.in_cover = nil

						if my_data.cover_pathing then
							slot10 = my_data.cover_path_search_id

							managers.navigation.cancel_pathing_search(slot8, managers.navigation)

							my_data.cover_pathing = nil
						end
					end
				end
			end
		elseif my_data.flee_target then
			if my_data.coarse_path then
				local coarse_path = my_data.coarse_path
				local cur_index = my_data.coarse_path_index
				local total_nav_points = #coarse_path

				if cur_index == total_nav_points then
					slot11 = data.unit
					slot13 = 0

					data.unit.base(slot10).set_slot(slot10, data.unit.base(slot10), unit)
				elseif not my_data.processing_flee_path then
					local to_pos = nil

					if cur_index == total_nav_points - 1 then
						to_pos = my_data.flee_target.pos
					else
						local end_pos = coarse_path[cur_index + 1][2]
						local my_pos = data.m_pos
						local walk_dir = end_pos - my_pos
						local walk_dis = mvector3.normalize(slot14)
						slot20 = walk_dis - 100
						local cover_range = math.min(walk_dir, math.max(slot18, 0))
						slot21 = cover_range
						local cover = managers.navigation.find_cover_near_pos_1(700, managers.navigation, end_pos, end_pos + walk_dir * 700, cover_range)

						if cover then
							if my_data.best_cover then
								slot19 = my_data.best_cover[1]

								managers.navigation.release_cover(slot17, managers.navigation)
							end

							slot20 = data.pos_rsrv_id

							managers.navigation.reserve_cover(slot17, managers.navigation, cover)

							my_data.moving_to_cover = {
								cover
							}
							my_data.best_cover = my_data.moving_to_cover
							to_pos = cover[1]
						else
							to_pos = end_pos
						end
					end

					slot14 = unit
					my_data.flee_path_search_id = tostring(unit.key(slot13)) .. "flee"
					my_data.processing_flee_path = true
					my_data.path_blocked = nil
					slot12 = unit
					slot14 = to_pos

					unit.brain("flee").search_for_path("flee", unit.brain("flee"), my_data.flee_path_search_id)
				end
			else
				slot10 = unit
				local search_id = tostring(unit.key(slot9)) .. "coarseflee"
				local verify_clbk = nil

				if not my_data.coarse_search_failed then
					slot12 = "_flee_coarse_path_verify_clbk"
					verify_clbk = callback(slot9, CopLogicFlee, CopLogicFlee)
				end

				slot10 = unit
				slot13 = verify_clbk

				if unit.brain(slot9).search_for_coarse_path(slot9, unit.brain(slot9), search_id, my_data.flee_target.nav_seg) then
					my_data.coarse_path_search_id = search_id
					my_data.processing_coarse_path = true
				end
			end
		else
			slot8 = managers.groupai
			slot8 = managers.groupai.state(slot7)
			slot11 = data.unit
			slot11 = data.unit.movement(slot10)
			slot11 = data.unit.movement(slot10).nav_tracker(slot10)
			local flee_pos = managers.groupai.state(slot7).flee_point(slot7, data.unit.movement(slot10).nav_tracker(slot10).nav_segment(slot10))

			if flee_pos then
				slot10 = flee_pos
				local nav_seg = managers.navigation.get_nav_seg_from_pos(slot8, managers.navigation)
				my_data.flee_target = {
					nav_seg = nav_seg,
					pos = flee_pos
				}
			end
		end
	end

	return 
end
function CopLogicFlee._update_enemy_detection(data)
	slot3 = managers.groupai

	managers.groupai.state(slot2).on_unit_detection_updated(slot2, managers.groupai.state(slot2))

	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	data.t = TimerManager.game(slot2).time(slot2)
	local my_data = data.internal_data
	local min_reaction = AIAttentionObject.REACT_COMBAT
	slot7 = nil
	local delay = CopLogicBase._upd_attention_obj_detection(data.unit, data, min_reaction)
	slot8 = CopLogicFlee._chk_reaction_to_attention_object
	local new_attention, new_prio_slot, new_reaction = CopLogicBase._get_priority_attention(data, data, data.detected_attention_objects)
	local old_att_obj = data.attention_obj
	slot12 = new_reaction

	CopLogicBase._set_attention_obj(slot9, data, new_attention)

	my_data.advance_blocked = nil
	my_data.path_blocked = false

	if new_attention then
		my_data.want_cover = true
		slot11 = my_data

		CopLogicFlee._upd_shoot(slot9, data)
	else
		if my_data.attention_unit then
			slot10 = data

			CopLogicBase._reset_attention(slot9)

			my_data.attention_unit = nil
		end

		if my_data.shooting then
			local new_action = {
				body_part = 3,
				type = "idle"
			}
			slot11 = data.unit
			slot12 = new_action

			data.unit.brain(slot10).action_request(slot10, data.unit.brain(slot10))

			slot11 = data.unit
			slot12 = false

			data.unit.movement(slot10).set_allow_fire(slot10, data.unit.movement(slot10))
		end

		my_data.want_cover = nil
	end

	if data.important then
		delay = 0
	else
		delay = 0.5 + delay * 1.5
	end

	slot14 = data.t + delay

	CopLogicBase.queue_task(slot9, my_data, my_data.detection_task_key, CopLogicFlee._update_enemy_detection, data)

	slot10 = data.detected_attention_objects

	CopLogicBase._report_detections(slot9)

	return 
end
function CopLogicFlee._upd_shoot(data, my_data)
	local shoot = nil
	local focus_enemy = data.attention_obj
	slot6 = data.unit
	slot7 = "walk"
	local action_taken = data.unit.movement(slot5).chk_action_forbidden(slot5, data.unit.movement(slot5)) or my_data.turning or my_data.moving_to_cover

	if not action_taken then
		if my_data.advance_blocked then
			slot7 = data.unit
		else
			slot10 = focus_enemy.m_pos

			if not CopLogicAttack._request_action_turn_to_enemy(slot6, data, my_data, data.m_pos) then
				slot7 = data.unit

				if not data.unit.anim_data(slot6).crouch then
					slot7 = data

					CopLogicAttack._request_action_crouch(slot6)
				end
			end
		end
	end

	if not my_data.shooting then
		slot7 = data.unit
	elseif my_data.attention_unit ~= focus_enemy.u_key then
		slot8 = focus_enemy

		CopLogicBase._set_attention(slot6, data)

		my_data.attention_unit = focus_enemy.u_key
	end

	slot7 = data.unit
	slot8 = (focus_enemy.verified and true) or false

	data.unit.movement(slot6).set_allow_fire(slot6, data.unit.movement(slot6))

	return 
end
function CopLogicFlee._update_pathing(data, my_data)
	if data.pathing_results then
		local path = my_data.flee_path_search_id and data.pathing_results[my_data.flee_path_search_id]

		if path then
			if path ~= "failed" then
				my_data.flee_path = path
			else
				slot6 = "CopLogicFlee:_update_pathing() flee_path failed!"

				cat_print(slot4, "george")
			end

			data.pathing_results[my_data.flee_path_search_id] = nil
			my_data.processing_flee_path = nil
			my_data.flee_path_search_id = nil
		end

		path = data.pathing_results[my_data.coarse_path_search_id]

		if path then
			if path ~= "failed" then
				my_data.coarse_path = path
				my_data.coarse_path_index = 1
			else
				if my_data.coarse_search_failed then
					slot6 = "CopLogicFlee:_update_pathing() coarse_path failed unsafe!"

					cat_print(slot4, "george")

					my_data.flee_target = nil
				end

				my_data.coarse_search_failed = true
			end

			data.pathing_results[my_data.coarse_path_search_id] = nil
			my_data.processing_coarse_path = nil
			my_data.coarse_path_search_id = nil
		end

		data.pathing_results = nil
		my_data.cover_pathing = nil
	end

	return 
end
function CopLogicFlee._update_cover_pathing(data, my_data)
	if data.pathing_results then
		local path = data.pathing_results[my_data.cover_path_search_id]

		if path then
			if path ~= "failed" then
				my_data.cover_path = path
			else
				slot6 = "CopLogicFlee:_update_cover_pathing() cover pathing failed!"

				cat_print(slot4, "george")
			end

			my_data.cover_pathing = nil
		end

		data.pathing_results = nil
		my_data.processing_flee_path = nil
		my_data.flee_path_search_id = nil
		my_data.processing_coarse_path = nil
		my_data.coarse_path_search_id = nil
	end

	return 
end
function CopLogicFlee._chk_reaction_to_attention_object(data, attention_data, stationary)
	local record = attention_data.criminal_record

	if not record or not attention_data.is_person then
		return attention_data.settings.reaction
	end

	local att_unit = attention_data.unit
	slot7 = managers.groupai
	slot7 = managers.groupai.state(slot6)
	local assault_mode = managers.groupai.state(slot6).get_assault_mode(slot6)

	if record.status == "disabled" then
		if (not record.assault_t or 0.6 < record.assault_t - record.disabled_t) and record.engaged_force >= 5 and attention_data.is_human_player then
			slot9 = data.key

			if CopLogicBase._is_important_to_player(slot7, record) then
				slot9 = AIAttentionObject.REACT_COMBAT

				return math.min(slot7, attention_data.reaction)
			end
		end
	elseif not record.being_arrested then
		local my_vec = data.m_pos - attention_data.m_pos
		slot9 = my_vec
		local dis = mvector3.normalize(slot8)

		if dis < 500 then
			slot11 = AIAttentionObject.REACT_COMBAT

			return math.min(slot9, attention_data.settings.reaction)
		elseif dis < 3000 then
			slot10 = att_unit
			slot10 = att_unit.movement(slot9)
			local criminal_fwd = att_unit.movement(slot9).m_head_rot(slot9).y(slot9)
			slot12 = criminal_fwd
			local criminal_look_dot = mvector3.dot(att_unit.movement(slot9).m_head_rot(slot9), my_vec)

			if 0.9 < criminal_look_dot then
				local aggression_age = record.assault_t and data.t - record.assault_t

				if aggression_age and aggression_age < 2 then
					slot14 = AIAttentionObject.REACT_COMBAT

					return math.min(slot12, attention_data.settings.reaction)
				end
			end

			if record.engaged_force ~= 0 and record.engaged_force == 1 then
				slot13 = data.unit

				if record.engaged[data.unit.key(slot12)] then
					slot13 = AIAttentionObject.REACT_COMBAT

					return math.min(slot11, attention_data.settings.reaction)
				end
			end

			local my_data = data.internal_data

			if my_data.flee_path then
				slot13 = my_data.flee_path[2]
				local walk_to_pos = CopLogicBase._nav_point_pos(slot12)
				local move_dir = walk_to_pos - data.m_pos
				slot15 = move_dir

				mvector3.normalize(slot14)

				slot16 = move_dir
				local move_dot = mvector3.dot(slot14, my_vec)

				if move_dot < -0.5 then
					my_data.path_blocked = true
					slot17 = AIAttentionObject.REACT_COMBAT

					return math.min(slot15, attention_data.settings.reaction)
				else
					my_data.path_blocked = false
				end
			end
		end
	end

	return AIAttentionObject.REACT_IDLE
end
function CopLogicFlee.on_action_completed(data, action)
	slot4 = action
	local action_type = action.type(slot3)

	if action_type == "walk" then
		local my_data = data.internal_data

		if my_data.moving_to_cover then
			slot6 = action

			if action.expired(slot5) then
				if my_data.best_cover then
					slot7 = my_data.best_cover[1]

					managers.navigation.release_cover(slot5, managers.navigation)
				end

				my_data.best_cover = my_data.moving_to_cover
				slot8 = data.pos_rsrv_id

				managers.navigation.reserve_cover(slot5, managers.navigation, my_data.best_cover[1])

				my_data.in_cover = my_data.best_cover

				if my_data.advancing then
					slot8 = 4
					my_data.cover_leave_t = data.t + math.random(slot6, 2)
				end
			end

			my_data.moving_to_cover = nil
		elseif my_data.best_cover then
			slot6 = my_data.best_cover[1][NavigationManager.COVER_POSITION]
			slot9 = data.unit
			slot9 = data.unit.movement(slot8)
			local dis = mvector3.distance(slot5, data.unit.movement(slot8).m_pos(slot8))

			if 100 < dis then
				slot8 = my_data.best_cover[1]

				managers.navigation.release_cover(slot6, managers.navigation)

				my_data.best_cover = nil
			end
		end

		if my_data.advancing then
			slot6 = action

			if action.expired(slot5) then
				my_data.coarse_path_index = my_data.coarse_path_index + 1
			end

			my_data.advancing = nil
		end
	elseif action_type == "turn" then
		data.internal_data.turning = nil
	elseif action_type == "shoot" then
		data.internal_data.shooting = nil
	elseif action_type == "hurt" then
		if data.important then
			slot5 = action

			if action.expired(slot4) then
				slot6 = "hit"
				local action_data = CopLogicBase.chk_start_action_dodge(slot4, data)
				local my_data = data.internal_data

				if action_data then
					slot8 = my_data

					CopLogicFlee._cancel_cover_pathing(slot6, data)

					slot8 = my_data

					CopLogicFlee._cancel_flee_pathing(slot6, data)
				end
			end
		end
	elseif action_type == "dodge" then
		local my_data = data.internal_data
		slot7 = my_data

		CopLogicFlee._cancel_cover_pathing(slot5, data)

		slot7 = my_data

		CopLogicFlee._cancel_flee_pathing(slot5, data)
	end

	return 
end
function CopLogicFlee._update_cover(data)
	local my_data = data.internal_data
	local cover_release_dis = 100
	local best_cover = my_data.best_cover
	local nearest_cover = my_data.nearest_cover
	local want_cover = my_data.want_cover

	if want_cover and data.attention_obj then
		local threat_pos = data.attention_obj.verified_pos
		local min_threat_dis = 700

		if not my_data.moving_to_cover then
		end
	else
		if nearest_cover then
			slot9 = data.m_pos

			if cover_release_dis < mvector3.distance(slot7, nearest_cover[1][NavigationManager.COVER_POSITION]) then
				slot9 = nearest_cover[1]

				managers.navigation.release_cover(slot7, managers.navigation)

				my_data.nearest_cover = nil
			end
		end

		if best_cover then
			slot9 = data.m_pos

			if cover_release_dis < mvector3.distance(slot7, best_cover[1][NavigationManager.COVER_POSITION]) then
				slot9 = best_cover[1]

				managers.navigation.release_cover(slot7, managers.navigation)

				my_data.best_cover = nil
			end
		end
	end

	local delay = (want_cover and 2) or 3
	slot13 = data.t + delay

	CopLogicBase.queue_task(slot8, my_data, my_data.cover_update_task_key, CopLogicFlee._update_cover, data)

	return 
end
function CopLogicFlee._cancel_cover_pathing(data, my_data)
	if my_data.cover_pathing then
		if data.active_searches[my_data.cover_path_search_id] then
			slot5 = my_data.cover_path_search_id

			managers.navigation.cancel_pathing_search(slot3, managers.navigation)

			data.active_searches[my_data.cover_path_search_id] = nil
		elseif data.pathing_results then
			data.pathing_results[my_data.cover_path_search_id] = nil
		end

		my_data.cover_pathing = nil
	end

	my_data.cover_path = nil

	return 
end
function CopLogicFlee._cancel_flee_pathing(data, my_data)
	if my_data.flee_path_search_id then
		if data.active_searches[my_data.flee_path_search_id] then
			slot5 = my_data.flee_path_search_id

			managers.navigation.cancel_pathing_search(slot3, managers.navigation)
		elseif data.pathing_results then
			data.pathing_results[my_data.flee_path_search_id] = nil
		end

		my_data.processing_flee_path = nil
		my_data.flee_path_search_id = nil
	end

	if my_data.coarse_path_search_id then
		if data.active_searches[my_data.coarse_path_search_id] then
			slot5 = my_data.coarse_path_search_id

			managers.navigation.cancel_coarse_search(slot3, managers.navigation)
		elseif data.pathing_results then
			data.pathing_results[my_data.coarse_path_search_id] = nil
		end

		my_data.processing_coarse_path = nil
		my_data.coarse_path_search_id = nil
	end

	return 
end
function CopLogicFlee.damage_clbk(data, damage_info)
	slot5 = damage_info

	CopLogicBase.damage_clbk(slot3, data)

	return 
end
function CopLogicFlee.death_clbk(data, damage_info)
	slot5 = damage_info

	CopLogicAttack.death_clbk(slot3, data)

	return 
end
function CopLogicFlee.is_available_for_assignment(data, objective)
	if objective and objective.forced then
		return true
	end

	return false
end
function CopLogicFlee._flee_coarse_path_verify_clbk(shait, nav_seg)
	slot4 = managers.groupai
	slot5 = nav_seg

	return managers.groupai.state(slot3).is_nav_seg_safe(slot3, managers.groupai.state(slot3))
end
function CopLogicFlee.on_new_objective(data, old_objective)
	slot5 = old_objective

	CopLogicBase.update_follow_unit(slot3, data)

	return 
end
function CopLogicFlee.on_intimidated(data, amount, aggressor_unit)
	slot6 = amount

	CopLogicBase._surrender(slot4, data)

	return 
end
function CopLogicFlee._get_all_paths(data)
	return {
		flee_path = data.internal_data.flee_path
	}
end
function CopLogicFlee._set_verified_paths(data, verified_paths)
	data.internal_data.flee_path = verified_paths.flee_path

	return 
end

return 
