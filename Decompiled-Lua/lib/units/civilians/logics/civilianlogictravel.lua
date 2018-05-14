-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = CivilianLogicBase
CivilianLogicTravel = class(slot1)
CivilianLogicTravel.on_alert = CivilianLogicIdle.on_alert
CivilianLogicTravel.on_new_objective = CivilianLogicIdle.on_new_objective
CivilianLogicTravel.on_action_completed = CopLogicTravel.on_action_completed
CivilianLogicTravel.is_available_for_assignment = CopLogicTravel.is_available_for_assignment
function CivilianLogicTravel.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	data.internal_data = my_data
	slot7 = data.unit
	slot7 = data.unit.movement(data.unit.brain(slot5))
	local is_cool = data.unit.movement(data.unit.brain(slot5)).cool(data.unit.brain(slot5))

	if is_cool then
		my_data.detection = data.char_tweak.detection.ntl
	else
		my_data.detection = data.char_tweak.detection.cbt
	end

	slot8 = data.unit
	slot9 = true

	data.unit.brain(slot7).set_update_enabled_state(slot7, data.unit.brain(slot7))

	slot9 = my_data

	CivilianLogicEscort._get_objective_path_data(slot7, data)

	if data.is_tied then
		slot8 = managers.groupai
		slot12 = true

		managers.groupai.state(slot7).on_hostage_state(slot7, managers.groupai.state(slot7), true, data.key, nil)

		my_data.is_hostage = true
	end

	slot8 = data.key
	local key_str = tostring(slot7)

	if not data.been_outlined and data.char_tweak.outline_on_discover then
		my_data.outline_detection_task_key = "CivilianLogicIdle._upd_outline_detection" .. key_str
		slot13 = data.t + 2

		CopLogicBase.queue_task(key_str, my_data, my_data.outline_detection_task_key, CivilianLogicIdle._upd_outline_detection, data)
	end

	my_data.detection_task_key = "CivilianLogicTravel_upd_detection" .. key_str
	slot13 = data.t + 1

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CivilianLogicIdle._upd_detection, data)

	slot10 = data.key
	my_data.advance_path_search_id = "CivilianLogicTravel_detailed" .. tostring(my_data)
	slot10 = data.key
	slot8 = tostring(my_data)
	my_data.coarse_path_search_id = "CivilianLogicTravel_coarse" .. slot8
	my_data.vision = data.char_tweak.vision
	slot9 = data.unit
	slot9 = data.unit.movement(slot8)

	if not data.unit.movement(slot8).cool(slot8) then
		my_data.registered_as_fleeing = true
		slot9 = managers.groupai
		slot11 = data.unit

		managers.groupai.state(slot8).register_fleeing_civilian(slot8, managers.groupai.state(slot8), data.key)
	end

	if data.objective and data.objective.stance then
		slot9 = data.unit
		slot10 = data.objective.stance

		data.unit.movement(slot8).set_stance(slot8, data.unit.movement(slot8))
	end

	slot10 = my_data

	CivilianLogicTravel._chk_has_old_action(slot8, data)

	local attention_settings = nil

	if is_cool then
		attention_settings = {
			"civ_all_peaceful"
		}
	else
		attention_settings = {
			"civ_enemy_cbt",
			"civ_civ_cbt",
			"civ_murderer_cbt"
		}
	end

	slot10 = data.unit
	slot11 = attention_settings

	data.unit.brain(slot9).set_attention_settings(slot9, data.unit.brain(slot9))

	slot10 = TimerManager
	slot10 = TimerManager.game(slot9)
	my_data.state_enter_t = TimerManager.game(slot9).time(slot9)

	return 
end
function CivilianLogicTravel.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	if my_data.registered_as_fleeing then
		slot6 = managers.groupai
		slot7 = data.key

		managers.groupai.state(slot5).unregister_fleeing_civilian(slot5, managers.groupai.state(slot5))
	end

	if my_data.enemy_weapons_hot_listen_id then
		slot6 = managers.groupai
		slot7 = my_data.enemy_weapons_hot_listen_id

		managers.groupai.state(slot5).remove_listener(slot5, managers.groupai.state(slot5))
	end

	if my_data.is_hostage then
		slot6 = managers.groupai
		slot10 = true

		managers.groupai.state(slot5).on_hostage_state(slot5, managers.groupai.state(slot5), false, data.key, nil)

		my_data.is_hostage = nil
	end

	if new_logic_name ~= "inactive" then
		slot6 = data.unit
		slot7 = true

		data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))
	end

	return 
end
function CivilianLogicTravel.update(data)
	local my_data = data.internal_data
	local unit = data.unit
	local objective = data.objective
	local t = data.t

	if my_data.has_old_action then
		slot8 = my_data

		CivilianLogicTravel._upd_stop_old_action(slot6, data)
	elseif my_data.processing_advance_path or my_data.processing_coarse_path then
		slot8 = my_data

		CivilianLogicEscort._upd_pathing(slot6, data)
	elseif my_data.advancing then
	elseif my_data.advance_path then
		slot8 = my_data.advance_path

		CopLogicAttack._adjust_path_start_pos(slot6, data)

		local end_rot = nil

		if my_data.coarse_path_index == #my_data.coarse_path - 1 then
			end_rot = objective and objective.rot
		end

		local haste = (objective and objective.haste) or "walk"
		local new_action_data = {
			type = "walk",
			body_part = 2,
			nav_path = my_data.advance_path,
			variant = haste,
			end_rot = end_rot
		}
		my_data.starting_advance_action = true
		slot10 = data.unit
		slot11 = new_action_data
		my_data.advancing = data.unit.brain(slot9).action_request(slot9, data.unit.brain(slot9))
		my_data.starting_advance_action = false

		if my_data.advancing then
			my_data.advance_path = nil
			slot11 = "path"

			data.brain.rem_pos_rsrv(slot9, data.brain)
		end
	elseif objective then
		if my_data.coarse_path then
			local coarse_path = my_data.coarse_path
			local cur_index = my_data.coarse_path_index
			local total_nav_points = #coarse_path

			if total_nav_points <= cur_index then
				objective.in_place = true

				if objective.type ~= "escort" and objective.type ~= "act" and objective.type ~= "follow" and not objective.action_duration then
					slot11 = objective

					data.objective_complete_clbk(slot9, unit)
				else
					slot10 = data

					CivilianLogicTravel.on_new_objective(slot9)
				end

				return 
			else
				slot11 = "path"

				data.brain.rem_pos_rsrv(slot9, data.brain)

				local to_pos = nil

				if cur_index == total_nav_points - 1 then
					slot12 = objective
					to_pos = CivilianLogicTravel._determine_exact_destination(slot10, data)
				else
					to_pos = coarse_path[cur_index + 1][2]
				end

				my_data.processing_advance_path = true
				slot11 = unit
				slot13 = to_pos

				unit.brain(slot10).search_for_path(slot10, unit.brain(slot10), my_data.advance_path_search_id)
			end
		else
			local nav_seg = nil

			if objective.follow_unit then
				slot8 = objective.follow_unit
				slot8 = objective.follow_unit.movement(slot7)
				slot8 = objective.follow_unit.movement(slot7).nav_tracker(slot7)
				nav_seg = objective.follow_unit.movement(slot7).nav_tracker(slot7).nav_segment(slot7)
			else
				nav_seg = objective.nav_seg
			end

			slot8 = unit
			slot10 = nav_seg

			if unit.brain(slot7).search_for_coarse_path(slot7, unit.brain(slot7), my_data.coarse_path_search_id) then
				my_data.processing_coarse_path = true
			end
		end
	else
		slot8 = "idle"

		CopLogicBase._exit(slot6, data.unit)
	end

	return 
end
function CivilianLogicTravel.on_intimidated(data, amount, aggressor_unit)
	slot6 = aggressor_unit

	if not CivilianLogicIdle.is_obstructed(slot4, data) then
		return 
	end

	local new_objective = {
		type = "surrender",
		amount = amount,
		aggressor_unit = aggressor_unit
	}
	slot6 = data.unit
	local anim_data = data.unit.anim_data(slot5)

	if anim_data.run then
		new_objective.initial_act = "halt"
	end

	slot7 = data.unit
	slot9 = true

	data.unit.sound(slot6).say(slot6, data.unit.sound(slot6), "a02x_any")

	slot7 = data.unit
	slot8 = new_objective

	data.unit.brain(slot6).set_objective(slot6, data.unit.brain(slot6))

	return 
end
function CivilianLogicTravel._determine_exact_destination(data, objective)
	if objective.pos then
		return objective.pos
	elseif objective.type == "follow" then
		local follow_pos, follow_nav_seg = nil
		slot6 = objective.follow_unit

		if objective.follow_unit.brain(slot5) then
			slot6 = objective.follow_unit
			slot6 = objective.follow_unit.brain(slot5)
			local follow_unit_objective = objective.follow_unit.brain(slot5).objective(slot5)
		end

		slot7 = objective.follow_unit
		slot7 = objective.follow_unit.movement(slot6)
		slot7 = objective.follow_unit.movement(slot6).nav_tracker(slot6)
		follow_pos = objective.follow_unit.movement(slot6).nav_tracker(slot6).field_position(slot6)
		slot7 = objective.follow_unit
		slot7 = objective.follow_unit.movement(slot6)
		slot7 = objective.follow_unit.movement(slot6).nav_tracker(slot6)
		follow_nav_seg = objective.follow_unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6)
	else
		slot5 = 700

		return CopLogicTravel._get_pos_on_wall(slot3, managers.navigation._nav_segments[objective.nav_seg].pos)
	end

	return 
end
function CivilianLogicTravel._chk_has_old_action(data, my_data)
	slot4 = data.unit
	local anim_data = data.unit.anim_data(slot3)
	my_data.has_old_action = anim_data.to_idle or (anim_data.act and anim_data.needs_idle)

	return 
end
function CivilianLogicTravel._upd_stop_old_action(data, my_data, objective)
	slot5 = data.unit

	if not data.unit.anim_data(slot4).to_idle then
		slot5 = data.unit
		slot6 = "idle"

		if not data.unit.movement(slot4).chk_action_forbidden(slot4, data.unit.movement(slot4)) then
			slot5 = data.unit

			if data.unit.anim_data(slot4).act then
				slot5 = data.unit

				if data.unit.anim_data(slot4).needs_idle then
					slot5 = data

					CopLogicIdle._start_idle_action_from_act(slot4)
				end
			end
		end

		slot6 = my_data

		CivilianLogicTravel._chk_has_old_action(slot4, data)
	end

	return 
end
function CivilianLogicTravel.is_available_for_assignment(data, objective)
	if objective and objective.forced then
		return true
	end

	return not data.is_tied
end

return 
