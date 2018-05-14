-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
slot3 = CopLogicBase
CopLogicPhalanxVip = class(slot2)
CopLogicPhalanxVip._upd_aim = CopLogicAttack._upd_aim
CopLogicPhalanxVip._chk_reaction_to_attention_object = CopLogicAttack._chk_reaction_to_attention_object
CopLogicPhalanxVip._get_all_paths = CopLogicIdle._get_all_paths
CopLogicPhalanxVip._set_verified_paths = CopLogicIdle._set_verified_paths
CopLogicPhalanxVip._upd_stance_and_pose = CopLogicIdle._upd_stance_and_pose
CopLogicPhalanxVip._perform_objective_action = CopLogicIdle._perform_objective_action
CopLogicPhalanxVip.allowed_transitional_actions = {
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
function CopLogicPhalanxVip.enter(data, new_logic_name, enter_params)
	print(slot4)

	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter("CopLogicPhalanxVip.enter", data, new_logic_name, enter_params)

	slot6 = data.unit
	slot6 = data.unit.movement("CopLogicPhalanxVip.enter")
	local is_cool = data.unit.movement("CopLogicPhalanxVip.enter").cool("CopLogicPhalanxVip.enter")
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
	my_data.detection_task_key = "CopLogicPhalanxVip.update" .. key_str
	slot13 = data.t

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CopLogicPhalanxVip.queued_update, data)

	local objective = data.objective
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

	CopLogicPhalanxVip.calc_initial_phalanx_pos(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage, data.m_pos)

	slot10 = data.unit
	slot11 = false

	data.unit.brain(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage).set_update_enabled_state(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage, data.unit.brain(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage))

	slot12 = objective

	CopLogicPhalanxVip._perform_objective_action(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage, data, my_data)

	slot10 = managers.groupai
	slot10 = managers.groupai.state(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage)

	managers.groupai.state(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage).phalanx_damage_reduction_enable(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage)

	slot10 = data.unit
	slot13 = true

	data.unit.sound(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage).say(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage, data.unit.sound(data.unit.inventory(slot10).equipped_unit(slot10).base(slot10).weapon_tweak_data(slot10).usage), "cpw_a01", true)

	return 
end
function CopLogicPhalanxVip.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = managers.groupai
	slot6 = managers.groupai.state(data)

	managers.groupai.state(data).phalanx_damage_reduction_disable(data)

	slot6 = managers.groupai
	slot6 = managers.groupai.state(data)

	managers.groupai.state(data).force_end_assault_phase(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(data)

	slot7 = "path"

	data.brain.rem_pos_rsrv(data, data.brain)

	return 
end
function CopLogicPhalanxVip.queued_update(data)
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

		CopLogicBase.queue_task(slot5, my_data, my_data.detection_task_key, CopLogicPhalanxVip.queued_update, data, data.t + delay)

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

	CopLogicPhalanxVip._perform_objective_action(slot5, data, my_data)

	slot8 = objective

	CopLogicPhalanxVip._upd_stance_and_pose(slot5, data, my_data)

	if data.internal_data ~= my_data then
		slot6 = data.detected_attention_objects

		CopLogicBase._report_detections(slot5)

		return 
	end

	delay = (data.important and 0) or delay or 0.3
	slot11 = data.important and true

	CopLogicBase.queue_task(slot5, my_data, my_data.detection_task_key, CopLogicPhalanxVip.queued_update, data, data.t + delay)

	return 
end
function CopLogicPhalanxVip.damage_clbk(data, damage_info)
	slot5 = damage_info

	CopLogicBase.damage_clbk(slot3, data)

	slot4 = data

	CopLogicPhalanxVip._chk_should_breakup(slot3)

	return 
end
function CopLogicPhalanxVip.chk_should_turn(data, my_data)
end
function CopLogicPhalanxVip.register_in_group_ai(unit)
	slot3 = managers.groupai
	slot4 = unit

	managers.groupai.state(slot2).register_phalanx_vip(slot2, managers.groupai.state(slot2))

	return 
end
function CopLogicPhalanxVip._chk_should_breakup(data)

	-- Decompilation error in this vicinity:
	local flee_health_ratio = tweak_data.group_ai.phalanx.vip.health_ratio_flee
	slot4 = data.unit
	slot4 = data.unit.character_damage(slot3)
	local vip_health_ratio = data.unit.character_damage(slot3).health_ratio(slot3)

	if vip_health_ratio <= flee_health_ratio then
		CopLogicPhalanxVip.breakup()
	end

	return 
end
function CopLogicPhalanxVip.breakup(remote_call)
	slot3 = "CopLogicPhalanxVip.breakup"

	print(slot2)

	local groupai = managers.groupai.state(slot2)
	slot4 = groupai
	local phalanx_vip = groupai.phalanx_vip(managers.groupai)

	if phalanx_vip then
		slot5 = phalanx_vip

		if alive(slot4) then
			slot7 = false

			groupai.unit_leave_group(slot4, groupai, phalanx_vip)

			slot5 = managers.groupai
			slot5 = managers.groupai.state(slot4)

			managers.groupai.state(slot4).unregister_phalanx_vip(slot4)

			slot5 = phalanx_vip
			slot5 = phalanx_vip.movement(slot4)
			local nav_seg = phalanx_vip.movement(slot4).nav_tracker(slot4).nav_segment(slot4)
			slot6 = managers.groupai
			slot7 = nav_seg
			local flee_pos = managers.groupai.state(phalanx_vip.movement(slot4).nav_tracker(slot4)).flee_point(phalanx_vip.movement(slot4).nav_tracker(slot4), managers.groupai.state(phalanx_vip.movement(slot4).nav_tracker(slot4)))

			if flee_pos then
				local flee_nav_seg = managers.navigation.get_nav_seg_from_pos(slot6, managers.navigation)
				local new_objective = {
					attitude = "avoid",
					type = "flee",
					pos = flee_pos,
					nav_seg = flee_nav_seg
				}
				slot9 = phalanx_vip
				slot9 = phalanx_vip.brain(flee_pos)

				if phalanx_vip.brain(flee_pos).objective(flee_pos) then
					slot9 = "Setting VIP flee objective!"

					print(slot8)

					slot9 = phalanx_vip
					slot10 = new_objective

					phalanx_vip.brain(slot8).set_objective(slot8, phalanx_vip.brain(slot8))

					slot9 = phalanx_vip
					slot12 = true

					phalanx_vip.sound(slot8).say(slot8, phalanx_vip.sound(slot8), "cpw_a04", true)
				end
			else
				slot7 = "No flee_pos for VIP found, cannot set flee objective!"

				print(slot6)
			end
		end
	end

	if not remote_call then
		slot5 = true

		CopLogicPhalanxMinion.breakup(slot4)
	end

	return 
end
function CopLogicPhalanxVip._upd_enemy_detection(data)
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

	if new_reaction and AIAttentionObject.REACT_SHOOT <= new_reaction then
		my_data.last_violent_attention = new_attention
	end

	return delay
end
function CopLogicPhalanxVip.on_action_completed(data, action)
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
function CopLogicPhalanxVip.is_available_for_assignment(data, objective)
	return false
end
function CopLogicPhalanxVip.calc_initial_phalanx_pos(own_pos, objective)
	slot4 = managers.groupai

	return managers.groupai.state(slot3)._phalanx_center_pos
end
function CopLogicPhalanxVip.on_criminal_neutralized(data, criminal_key)
	local my_data = data.internal_data

	if my_data.last_violent_attention and my_data.last_violent_attention.u_key == criminal_key then
		slot5 = data.unit
		slot8 = true

		data.unit.sound(slot4).say(slot4, data.unit.sound(slot4), "cpw_a02", true)
	end

	return 
end

return 
