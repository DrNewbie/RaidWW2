-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
slot3 = CopLogicBase
CopLogicPhalanxMinion = class(slot2)
CopLogicPhalanxMinion._upd_aim = CopLogicAttack._upd_aim
CopLogicPhalanxMinion._get_all_paths = CopLogicIdle._get_all_paths
CopLogicPhalanxMinion._set_verified_paths = CopLogicIdle._set_verified_paths
CopLogicPhalanxMinion._upd_stance_and_pose = CopLogicIdle._upd_stance_and_pose
CopLogicPhalanxMinion._perform_objective_action = CopLogicIdle._perform_objective_action
CopLogicPhalanxMinion.allowed_transitional_actions = {
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
function CopLogicPhalanxMinion.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit
	slot6 = data.unit.movement(slot5)
	local is_cool = data.unit.movement(slot5).cool(slot5)
	my_data.detection = data.char_tweak.detection.combat
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
	my_data.detection_task_key = "CopLogicPhalanxMinion.update" .. key_str
	slot13 = data.t

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CopLogicPhalanxMinion.queued_update, data)

	local objective = data.objective
	objective.attitude = "engage"
	slot11 = my_data

	CopLogicBase._chk_has_old_action(my_data, data)

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

	slot11 = data.unit
	slot11 = data.unit.inventory(slot10)
	slot11 = data.unit.inventory(slot10).equipped_unit(slot10)
	slot11 = data.unit.inventory(slot10).equipped_unit(slot10).base(slot10)
	my_data.weapon_range = data.char_tweak.weapon[data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage].range
	slot11 = objective

	CopLogicPhalanxMinion.calc_initial_phalanx_pos(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage, data.m_pos)

	slot10 = data.unit
	slot11 = false

	data.unit.brain(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage).set_update_enabled_state(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage, data.unit.brain(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage))

	slot12 = objective

	CopLogicPhalanxMinion._perform_objective_action(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage, data, my_data)

	if my_data ~= data.internal_data then
		return 
	end

	return 
end
function CopLogicPhalanxMinion.exit(data, new_logic_name, enter_params)
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

	return 
end
function CopLogicPhalanxMinion.queued_update(data)
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

		CopLogicBase.queue_task(slot5, my_data, my_data.detection_task_key, CopLogicPhalanxMinion.queued_update, data, data.t + delay)

		return 
	end

	if data.team.id == "criminal1" and (not data.objective or data.objective.type == "free") and (not data.path_fail_t or 6 < data.t - data.path_fail_t) then
		slot6 = managers.groupai
		slot7 = data.unit

		managers.groupai.state(slot5).on_criminal_jobless(slot5, managers.groupai.state(slot5))

		if my_data ~= data.internal_data then
			return 
		end
	end

	slot8 = objective

	CopLogicPhalanxMinion._perform_objective_action(slot5, data, my_data)

	slot8 = objective

	CopLogicPhalanxMinion._upd_stance_and_pose(slot5, data, my_data)

	if data.internal_data ~= my_data then
		slot6 = data.detected_attention_objects

		CopLogicBase._report_detections(slot5)

		return 
	end

	delay = (data.important and 0) or delay or 0.3
	slot11 = data.important and true

	CopLogicBase.queue_task(slot5, my_data, my_data.detection_task_key, CopLogicPhalanxMinion.queued_update, data, data.t + delay)

	return 
end
function CopLogicPhalanxMinion.chk_should_turn(data, my_data)
end
function CopLogicPhalanxMinion.register_in_group_ai(unit)

	-- Decompilation error in this vicinity:
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	slot6 = unit

	if not managers.groupai.state(slot2).is_unit_in_phalanx_minion_data(slot2, unit.key(slot5)) then
		slot3 = managers.groupai
		slot4 = unit

		managers.groupai.state(slot2).register_phalanx_minion(slot2, managers.groupai.state(slot2))
	end

	return 
end
function CopLogicPhalanxMinion.chk_should_breakup()
	slot2 = managers.groupai
	slot2 = managers.groupai.state(slot1)
	local phalanx_minion_count = managers.groupai.state(slot1).get_phalanx_minion_count(slot1)
	local min_count_minions = tweak_data.group_ai.phalanx.minions.min_count

	if 0 < phalanx_minion_count and phalanx_minion_count <= min_count_minions then
		CopLogicPhalanxMinion.breakup()
	end

	return 
end
function CopLogicPhalanxMinion.chk_should_reposition()
	slot2 = managers.groupai
	slot2 = managers.groupai.state(slot1)
	local phalanx_minion_count = managers.groupai.state(slot1).get_phalanx_minion_count(slot1)

	if 1 < phalanx_minion_count then
		slot3 = nil

		CopLogicPhalanxMinion._reposition_phalanx(slot2)
	end

	return 
end
function CopLogicPhalanxMinion.breakup(remote_call)
	local groupai = managers.groupai.state(slot2)
	local phalanx_minions = groupai.phalanx_minions(managers.groupai)
	slot5 = groupai
	local phalanx_spawn_group = groupai.phalanx_spawn_group(groupai)

	if phalanx_spawn_group then
		local phalanx_center_pos = groupai._phalanx_center_pos
		slot8 = phalanx_center_pos
		local phalanx_center_nav_seg = managers.navigation.get_nav_seg_from_pos(slot6, managers.navigation)
		local phalanx_area = groupai.get_area_from_nav_seg_id(managers.navigation, groupai)
		local grp_objective = {
			type = "hunt",
			area = phalanx_area,
			nav_seg = phalanx_center_nav_seg
		}
		slot12 = grp_objective

		groupai._set_objective_to_enemy_group(phalanx_center_nav_seg, groupai, phalanx_spawn_group)
	end

	slot6 = phalanx_minions

	for unit_key, unit in pairs(slot5) do
		slot11 = unit

		if alive(slot10) then
			slot11 = unit
			local brain = unit.brain(slot10)

			if brain then
				slot12 = brain

				if brain.objective(slot11) then
					slot15 = brain
					slot13 = brain.objective(slot14).type

					print(slot11, "CopLogicPhalanxMinion.breakup current objective type: ")

					slot13 = nil

					brain.set_objective(slot11, brain)
				end
			end
		end

		slot12 = unit_key

		groupai.unregister_phalanx_minion(slot10, groupai)
	end

	slot6 = groupai

	groupai.phalanx_despawned(slot5)

	if not remote_call then
		slot6 = true

		CopLogicPhalanxVip.breakup(slot5)
	end

	return 
end
function CopLogicPhalanxMinion._upd_enemy_detection(data)
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

	slot9 = my_data

	data.logic._upd_aim(slot7, data)

	return delay
end
function CopLogicPhalanxMinion._upd_turn_outwards(data, my_data)
	slot5 = my_data

	if not CopLogicAttack.action_taken(slot3, data) then
		if data.objective.angle then
			local center_pos = managers.groupai.state(slot3)._phalanx_center_pos
			slot8 = 2 * data.m_pos - center_pos
			local turn_angle = CopLogicBase._chk_turn_needed(managers.groupai, data, my_data, data.m_pos)

			if turn_angle then
				slot8 = turn_angle

				CopLogicBase._turn_by_spin(slot5, data, my_data)
			end
		else
			slot4 = nil

			CopLogicPhalanxMinion._reposition_phalanx(slot3)
		end
	end

	return 
end
function CopLogicPhalanxMinion.on_action_completed(data, action)
	slot4 = action
	local action_type = action.type(slot3)

	if action_type == "turn" then
		data.internal_data.turning = nil
	elseif action_type == "act" then
		local my_data = data.internal_data

		if my_data.action_started == action then
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
	end

	return 
end
function CopLogicPhalanxMinion.is_available_for_assignment(data, objective)
	return false
end
function CopLogicPhalanxMinion._calc_phalanx_circle_radius(phalanx_minion_count)
	local distance = tweak_data.group_ai.phalanx.minions.distance
	local circumfence = distance * phalanx_minion_count
	local radius = circumfence / math.pi / 2
	slot7 = distance

	return math.max(slot5, radius)
end
function CopLogicPhalanxMinion._calc_pos_on_phalanx_circle(center_pos, angle, phalanx_minion_count)
	local radius = CopLogicPhalanxMinion._calc_phalanx_circle_radius(slot4)
	slot6 = radius
	slot6 = Vector3(phalanx_minion_count)
	slot9 = angle
	local result = center_pos + Vector3(phalanx_minion_count).rotate_with(phalanx_minion_count, Rotation(slot8))

	return result
end
function CopLogicPhalanxMinion._i_am_nth_neighbour(diffs_to_fixed_angle, my_diff, fixed_angle_free)
	if my_diff == 0 then
		return 0
	end

	local result = 0
	local negative = my_diff < 0
	slot7 = diffs_to_fixed_angle

	for diff, unit in pairs(slot6) do
		if negative then
			if diff <= 0 and my_diff < diff then
				result = result - 1
			end
		elseif 0 <= diff and diff < my_diff then
			result = result + 1
		end
	end

	if negative and fixed_angle_free then
		result = result - 1
	end

	return result
end
function CopLogicPhalanxMinion._get_diff_to_angle(fixed_angle, angle)
	local diff = angle - fixed_angle
	slot5 = diff

	if 180 < math.abs(slot4) then
		local neg = false

		if 0 < diff then
			neg = true
		end

		slot6 = diff
		diff = 360 - math.abs(slot5)

		if neg then
			diff = diff * -1
		end
	end

	return diff
end
function CopLogicPhalanxMinion._get_next_neighbour_angle(neighbour_num, phalanx_minion_count, fixed_angle)
	local angle_step = 360 / phalanx_minion_count
	local result = fixed_angle + neighbour_num * angle_step

	if result < 0 then
		result = result + 360
	else
		result = result % 360
	end

	return result
end
function CopLogicPhalanxMinion._get_random_angle()
	slot2 = 360

	return math.random(slot1)
end
function CopLogicPhalanxMinion._reposition_phalanx(fixed_angle)
	slot3 = managers.groupai
	local phalanx_minion_count = managers.groupai.state(slot2).get_phalanx_minion_count(slot2)
	slot4 = managers.groupai
	local center_pos = managers.groupai.state(managers.groupai.state(slot2))._phalanx_center_pos
	fixed_angle = fixed_angle or CopLogicPhalanxMinion._get_random_angle()
	slot6 = 2
	fixed_angle = math.round(slot4, fixed_angle)
	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)
	local phalanx_minions = managers.groupai.state(slot4).phalanx_minions(slot4)
	local diffs_to_fixed_angle = {}
	local fixed_angle_free = true
	slot8 = phalanx_minions

	for unit_key, unit in pairs(slot7) do
		slot13 = unit
		slot13 = unit.brain(slot12)

		if unit.brain(slot12).objective(slot12) then
			local added_phalanx = false
			slot14 = unit
			slot14 = unit.brain(slot13)

			if not unit.brain(slot13).objective(slot13).angle then
				added_phalanx = true
			end

			slot14 = unit
			slot14 = unit.brain(slot13)
			local angle = unit.brain(slot13).objective(slot13).angle or fixed_angle
			slot16 = angle
			local diff = CopLogicPhalanxMinion._get_diff_to_angle(slot14, fixed_angle)

			if diffs_to_fixed_angle[diff] then
				if added_phalanx then
					local temp_unit = diffs_to_fixed_angle[diff]
					local temp_diff = diff + 1
					diffs_to_fixed_angle[temp_diff] = temp_unit
				else
					diff = diff + 1
				end
			end

			if diff == 0 then
				fixed_angle_free = false
			end

			diffs_to_fixed_angle[diff] = unit
		end
	end

	slot8 = diffs_to_fixed_angle

	for diff, unit in pairs(slot7) do
		slot15 = fixed_angle_free
		local neighbour_num = CopLogicPhalanxMinion._i_am_nth_neighbour(slot12, diffs_to_fixed_angle, diff)
		slot16 = fixed_angle
		local angle_to_move_to = CopLogicPhalanxMinion._get_next_neighbour_angle(diffs_to_fixed_angle, neighbour_num, phalanx_minion_count)
		slot15 = unit

		if unit.brain(neighbour_num) then
			slot15 = unit
			slot15 = unit.brain(slot14)

			if unit.brain(slot14).objective(slot14) then
				slot15 = unit
				local phalanx_objective = unit.brain(slot14).objective(slot14)
				phalanx_objective.type = "phalanx"
				phalanx_objective.angle = angle_to_move_to
				slot18 = phalanx_minion_count
				phalanx_objective.pos = CopLogicPhalanxMinion._calc_pos_on_phalanx_circle(unit.brain(slot14), center_pos, angle_to_move_to)
				phalanx_objective.in_place = nil
				slot16 = unit
				slot17 = phalanx_objective

				unit.brain(unit.brain(slot14)).set_objective(unit.brain(slot14), unit.brain(unit.brain(slot14)))
			end
		end
	end

	return 
end
function CopLogicPhalanxMinion.calc_initial_phalanx_pos(own_pos, objective)
	if not objective.angle then
		local center_pos = managers.groupai.state(slot3)._phalanx_center_pos
		slot5 = managers.groupai
		slot5 = managers.groupai.state(managers.groupai)
		local phalanx_current_minion_count = managers.groupai.state(managers.groupai).get_phalanx_minion_count(managers.groupai)
		local total_minion_amount = tweak_data.group_ai.phalanx.minions.amount
		slot8 = center_pos
		local fixed_angle = own_pos.angle(slot6, own_pos)
		fixed_angle = (fixed_angle + 180) % 360
		slot10 = fixed_angle
		local angle_to_move_to = CopLogicPhalanxMinion._get_next_neighbour_angle(own_pos, phalanx_current_minion_count - 1, total_minion_amount)
		objective.angle = angle_to_move_to
		slot11 = total_minion_amount
		objective.pos = CopLogicPhalanxMinion._calc_pos_on_phalanx_circle(phalanx_current_minion_count - 1, center_pos, angle_to_move_to)
	end

	return objective.pos
end

return 
