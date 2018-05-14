slot2 = CivilianLogicBase
CivilianLogicEscort = class(slot1)
function CivilianLogicEscort.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	slot7 = data.unit
	slot8 = true

	data.unit.brain(data.unit.brain(slot5)).set_update_enabled_state(data.unit.brain(slot5), data.unit.brain(data.unit.brain(slot5)))

	if data.char_tweak.escort_idle_talk then
		slot7 = Application
		my_data._say_random_t = Application.time(slot6) + 45
	end

	slot8 = my_data

	CivilianLogicEscort._get_objective_path_data(slot6, data)

	data.internal_data = my_data
	slot7 = data.unit
	slot8 = "highlight"

	data.unit.contour(slot6).add(slot6, data.unit.contour(slot6))

	if not data.objective.allow_cool then
		slot7 = data.unit
		slot9 = "escort"

		data.unit.movement(slot6).set_cool(slot6, data.unit.movement(slot6), false)
	end

	slot7 = data.unit
	slot7 = data.unit.movement(slot6)
	slot8 = (data.is_tied and "cbt") or "hos"

	data.unit.movement(slot6).set_stance(slot6, slot7)

	slot8 = data.key
	my_data.advance_path_search_id = "CivilianLogicEscort_detailed" .. tostring(slot7)
	slot8 = data.key
	my_data.coarse_path_search_id = "CivilianLogicEscort_coarse" .. tostring(slot7)
	my_data.vision = data.char_tweak.vision
	slot7 = data.unit

	if data.unit.anim_data(tostring(slot7)).tied then
		local action_data = {
			clamp_to_graph = true,
			variant = "panic",
			body_part = 1,
			type = "act"
		}
		slot8 = data.unit
		slot9 = action_data

		data.unit.brain(slot7).action_request(slot7, data.unit.brain(slot7))
	end

	if not data.been_outlined and data.char_tweak.outline_on_discover then
		slot8 = data.key
		my_data.outline_detection_task_key = "CivilianLogicIdle._upd_outline_detection" .. tostring(slot7)
		slot11 = data.t + 2

		CopLogicBase.queue_task(tostring(slot7), my_data, my_data.outline_detection_task_key, CivilianLogicIdle._upd_outline_detection, data)
	end

	local attention_settings = nil

	if not data.char_tweak.immortal then
		attention_settings = {
			"custom_escort_cbt"
		}
	else
		attention_settings = {
			"civ_enemy_cbt",
			"civ_civ_cbt"
		}
	end

	slot8 = data.unit
	slot9 = attention_settings

	data.unit.brain(slot7).set_attention_settings(slot7, data.unit.brain(slot7))

	slot8 = 100
	my_data.safe_distance_offset = math.rand(slot7)

	return 
end
function CivilianLogicEscort.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	slot6 = data.unit
	slot7 = "highlight"

	data.unit.contour(data).remove(data, data.unit.contour(data))

	if new_logic_name ~= "inactive" then
		slot6 = data.unit
		slot7 = true

		data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))
	end

	my_data.last_avoidance_t = nil
	my_data.safe_distance_offset = nil

	return 
end
function CivilianLogicEscort.update(data)
	local my_data = data.internal_data
	local unit = data.unit
	local objective = data.objective
	local t = data.t

	if my_data._say_random_t and my_data._say_random_t < t then
		slot7 = data.unit
		slot9 = true

		data.unit.sound(slot6).say(slot6, data.unit.sound(slot6), "a02x_any")

		slot8 = 60
		my_data._say_random_t = t + math.random(slot6, 30)
	end

	if my_data.has_old_action then
		slot8 = my_data

		CivilianLogicTravel._upd_stop_old_action(slot6, data)

		return 
	end

	slot7 = data
	local scared_reason = CivilianLogicEscort.too_scared_to_move(slot6)

	if scared_reason then
		if scared_reason == "abandoned" and not data.char_tweak.immortal then
			slot8 = data.unit
			slot9 = {
				"custom_escort_cbt"
			}

			data.unit.brain(slot7).set_attention_settings(slot7, data.unit.brain(slot7))
		end

		slot8 = data.unit

		if not data.unit.anim_data(slot7).panic then
			my_data.commanded_to_move = nil
			slot8 = data.unit
			slot9 = {
				clamp_to_graph = true,
				variant = "panic",
				body_part = 1,
				type = "act"
			}

			data.unit.movement(slot7).action_request(slot7, data.unit.movement(slot7))
		end
	elseif not data.char_tweak.immortal then
		slot8 = data.unit
		slot9 = {
			"civ_enemy_cbt",
			"civ_civ_cbt"
		}

		data.unit.brain(slot7).set_attention_settings(slot7, data.unit.brain(slot7))

		my_data.commanded_to_move = true
	end

	if my_data.processing_advance_path or my_data.processing_coarse_path then
		slot9 = my_data

		CivilianLogicEscort._upd_pathing(slot7, data)
	elseif not my_data.advancing then
		if my_data.getting_up then
		elseif my_data.advance_path and (not my_data.last_avoidance_t or my_data.last_avoidance_t + 0.75 < data.t) then
			if my_data.commanded_to_move then
				slot8 = data.unit

				if data.unit.anim_data(slot7).standing_hesitant then
					slot9 = my_data

					CivilianLogicEscort._begin_advance_action(slot7, data)
				else
					slot9 = my_data

					CivilianLogicEscort._begin_stand_hesitant_action(slot7, data)
				end
			end
		elseif objective then
			if my_data.coarse_path then
				local coarse_path = my_data.coarse_path
				local cur_index = my_data.coarse_path_index
				local total_nav_points = #coarse_path

				if total_nav_points <= cur_index then
					objective.in_place = true
					slot12 = objective

					data.objective_complete_clbk(slot10, unit)

					return 
				else
					local to_pos = coarse_path[cur_index + 1][2]
					my_data.processing_advance_path = true
					slot12 = unit
					slot14 = to_pos

					unit.brain(slot11).search_for_path(slot11, unit.brain(slot11), my_data.advance_path_search_id)
				end
			else
				slot8 = unit
				slot10 = objective.nav_seg

				if unit.brain(slot7).search_for_coarse_path(slot7, unit.brain(slot7), my_data.coarse_path_search_id) then
					my_data.processing_coarse_path = true
				end
			end
		else
			slot9 = "idle"

			CopLogicBase._exit(slot7, data.unit)
		end
	end

	slot8 = data.unit

	if data.unit.anim_data(slot7).walk and (not my_data.last_avoidance_t or my_data.last_avoidance_t + 1.5 < data.t) then
		slot11 = 100
		local pos = data.unit.position(slot7) + Vector3(data.unit, 0, 0)
		slot14 = data.unit
		slot14 = data.unit.rotation(slot13)
		slot14 = 21
		local avoidance_ray = data.unit.raycast(data.unit, data.unit, "ray", pos, pos + data.unit.rotation(slot13).y(slot13) * 20, "slot_mask")

		if not avoidance_ray then
			slot15 = data.unit
			slot15 = data.unit.rotation(slot14)
			slot15 = 21
			avoidance_ray = data.unit.raycast(slot9, data.unit, "ray", pos, pos + data.unit.rotation(slot14).x(slot14) * 20, "slot_mask")
		end

		if avoidance_ray then
			slot10 = avoidance_ray.unit

			if alive(slot9) then
				slot10 = avoidance_ray.unit

				if avoidance_ray.unit.anim_data(slot9).walk then
					slot10 = data.unit
					slot11 = {
						body_part = 1,
						type = "idle"
					}

					data.unit.movement(slot9).action_request(slot9, data.unit.movement(slot9))

					my_data.last_avoidance_t = data.t
				end
			end
		end
	end

	return 
end
function CivilianLogicEscort.on_intimidated(data, amount, aggressor_unit)
	return 
end
function CivilianLogicEscort.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action
	local action_type = action.type(slot4)

	if action_type == "walk" then
		my_data.advancing = nil
		slot6 = action

		if action.expired(slot5) and my_data.coarse_path_index then
			my_data.coarse_path_index = my_data.coarse_path_index + 1
		end
	elseif action_type == "act" and my_data.getting_up then
		my_data.getting_up = nil
	end

	return 
end
function CivilianLogicEscort._upd_pathing(data, my_data)
	if data.pathing_results then
		local pathing_results = data.pathing_results
		data.pathing_results = nil
		local path = pathing_results[my_data.advance_path_search_id]

		if path and my_data.processing_advance_path then
			my_data.processing_advance_path = nil

			if path ~= "failed" then
				my_data.advance_path = path
			else
				slot6 = "[CivilianLogicEscort:_upd_pathing] advance_path failed"

				print(slot5)

				slot6 = managers.groupai
				slot8 = data.objective

				managers.groupai.state(slot5).on_civilian_objective_failed(slot5, managers.groupai.state(slot5), data.unit)

				return 
			end
		end

		path = pathing_results[my_data.coarse_path_search_id]

		if path and my_data.processing_coarse_path then
			my_data.processing_coarse_path = nil

			if path ~= "failed" then
				my_data.coarse_path = path
				my_data.coarse_path_index = 1
			else
				slot6 = managers.groupai
				slot8 = data.objective

				managers.groupai.state(slot5).on_civilian_objective_failed(slot5, managers.groupai.state(slot5), data.unit)

				return 
			end
		end
	end

	return 
end
function CivilianLogicEscort.on_new_objective(data, old_objective)
	slot5 = old_objective

	CivilianLogicIdle.on_new_objective(slot3, data)

	return 
end
function CivilianLogicEscort.damage_clbk(data, damage_info)
	return 
end
function CivilianLogicEscort._get_objective_path_data(data, my_data)
	local objective = data.objective
	local path_data = objective.path_data
	local path_style = objective.path_style

	if path_data then
		if path_style == "precise" then
			local path = {}
			slot8 = data.m_pos
			path[MULTRES] = mvector3.copy(slot7)
			slot8 = path_data.points

			for _, point in ipairs(slot7) do
				slot14 = point.position

				table.insert(slot12, path)
			end

			my_data.advance_path = path
			my_data.coarse_path_index = 1
			slot8 = data.unit
			slot8 = data.unit.movement(slot7)
			local start_seg = data.unit.movement(slot7).nav_tracker(slot7).nav_segment(slot7)
			local end_pos = mvector3.copy(data.unit.movement(slot7).nav_tracker(slot7))
			slot11 = end_pos
			local end_seg = managers.navigation.get_nav_seg_from_pos(path[#path], managers.navigation)
			my_data.coarse_path = {
				{
					start_seg
				},
				{
					end_seg,
					end_pos
				}
			}
		elseif path_style == "coarse" then
			local t_ins = table.insert
			my_data.coarse_path_index = 1
			slot8 = data.unit
			slot8 = data.unit.movement(slot7)
			slot8 = data.unit.movement(slot7).nav_tracker(slot7)
			local start_seg = data.unit.movement(slot7).nav_tracker(slot7).nav_segment(slot7)
			my_data.coarse_path = {
				{
					start_seg
				}
			}
			local coarse_path = my_data.coarse_path
			local points = path_data.points
			local i_point = 1

			while i_point <= #path_data.points do
				local next_pos = points[i_point].position
				slot14 = next_pos
				local next_seg = managers.navigation.get_nav_seg_from_pos(slot12, managers.navigation)
				slot15 = {
					next_seg,
					mvector3.copy(slot17)
				}
				slot18 = next_pos

				t_ins(managers.navigation, coarse_path)

				i_point = i_point + 1
			end
		elseif path_style == "destination" then
			my_data.coarse_path_index = 1
			slot7 = data.unit
			slot7 = data.unit.movement(slot6)
			local start_seg = data.unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6)
			local end_pos = mvector3.copy(data.unit.movement(slot6).nav_tracker(slot6))
			slot10 = end_pos
			local end_seg = managers.navigation.get_nav_seg_from_pos(path_data.points[#path_data.points].position, managers.navigation)
			my_data.coarse_path = {
				{
					start_seg
				},
				{
					end_seg,
					end_pos
				}
			}
		end
	end

	return 
end
function CivilianLogicEscort.too_scared_to_move(data)
	local my_data = data.internal_data
	local nobody_close = true
	local min_dis_sq = (data.char_tweak.escort_safe_dist or 1000) + my_data.safe_distance_offset
	min_dis_sq = min_dis_sq * min_dis_sq
	slot8 = managers.groupai
	slot8 = managers.groupai.state(slot7)

	for c_key, c_data in pairs(managers.groupai.state(slot7).all_player_criminals(slot7)) do
		slot12 = data.m_pos

		if mvector3.distance_sq(slot10, c_data.m_pos) < min_dis_sq then
			nobody_close = nil

			break
		end
	end

	if nobody_close then
		return "abandoned"
	end

	slot7 = "player"
	local player_team_id = tweak_data.levels.get_default_team_ID(slot5, tweak_data.levels)
	local nobody_close = true
	local min_dis_sq = data.char_tweak.escort_scared_dist
	min_dis_sq = min_dis_sq * min_dis_sq
	slot11 = managers.enemy

	for c_key, c_data in pairs(managers.enemy.all_enemies(slot10)) do
		slot14 = c_data.unit

		if not c_data.unit.anim_data(slot13).surrender then
			slot14 = c_data.unit

			if c_data.unit.brain(slot13)._current_logic_name ~= "trade" then
				slot14 = c_data.unit
				slot14 = c_data.unit.movement(slot13)

				if not not c_data.unit.movement(slot13).team(slot13).foes[player_team_id] then
					slot15 = data.m_pos

					if mvector3.distance_sq(slot13, c_data.m_pos) < min_dis_sq then
						slot14 = c_data.m_pos.z - data.m_pos.z

						if math.abs(slot13) < 250 then
							nobody_close = nil

							break
						end
					end
				end
			end
		end
	end

	if not nobody_close then
		return "pigs"
	end

	return 
end
function CivilianLogicEscort._begin_advance_action(data, my_data)
	slot5 = my_data.advance_path

	CopLogicAttack._adjust_path_start_pos(slot3, data)

	local objective = data.objective
	local haste = (objective and objective.haste) or "walk"
	local new_action_data = {
		type = "walk",
		body_part = 2,
		nav_path = my_data.advance_path,
		variant = haste,
		end_rot = objective.rot
	}
	slot7 = data.unit
	slot8 = new_action_data
	my_data.advancing = data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))

	if my_data.advancing then
		slot8 = "path"

		data.brain.rem_pos_rsrv(slot6, data.brain)

		my_data.advance_path = nil
	else
		slot7 = "[CivilianLogicEscort._begin_advance_action] failed to start"

		debug_pause(slot6)
	end

	return 
end
function CivilianLogicEscort._begin_stand_hesitant_action(data, my_data)
	local action = {
		clamp_to_graph = true,
		type = "act",
		body_part = 1,
		variant = "cm_so_escort_get_up_hesitant",
		blocks = {
			heavy_hurt = -1,
			hurt = -1,
			action = -1,
			walk = -1
		}
	}
	slot5 = data.unit
	slot6 = action
	my_data.getting_up = data.unit.movement(slot4).action_request(slot4, data.unit.movement(slot4))

	return 
end
function CivilianLogicEscort._get_all_paths(data)
	return {
		advance_path = data.internal_data.advance_path
	}
end
function CivilianLogicEscort._set_verified_paths(data, verified_paths)
	data.internal_data.stare_path = verified_paths.stare_path

	return 
end
function CivilianLogicEscort.on_alert()
	return 
end

return 
