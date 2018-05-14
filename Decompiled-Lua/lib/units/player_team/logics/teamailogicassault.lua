-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/units/enemies/cop/logics/CopLogicAttack"

require(slot1)

slot2 = CopLogicAttack
TeamAILogicAssault = class(slot1)
TeamAILogicAssault._COVER_CHK_INTERVAL = 2
TeamAILogicAssault.on_cop_neutralized = TeamAILogicIdle.on_cop_neutralized
TeamAILogicAssault.on_objective_unit_damaged = TeamAILogicIdle.on_objective_unit_damaged
TeamAILogicAssault.on_alert = TeamAILogicIdle.on_alert
TeamAILogicAssault.on_intimidated = TeamAILogicIdle.on_intimidated
TeamAILogicAssault.on_long_dis_interacted = TeamAILogicIdle.on_long_dis_interacted
TeamAILogicAssault.on_new_objective = TeamAILogicIdle.on_new_objective
TeamAILogicAssault.on_objective_unit_destroyed = TeamAILogicBase.on_objective_unit_destroyed
TeamAILogicAssault.is_available_for_assignment = TeamAILogicIdle.is_available_for_assignment
TeamAILogicAssault.clbk_heat = TeamAILogicIdle.clbk_heat
function TeamAILogicAssault.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	TeamAILogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit
	slot6 = data.unit.brain(slot5)

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.combat
	my_data.vision = data.char_tweak.vision.combat
	my_data.cover_chk_t = data.t + TeamAILogicAssault._COVER_CHK_INTERVAL
	slot7 = data.unit
	slot7 = data.unit.inventory(TeamAILogicAssault._COVER_CHK_INTERVAL)
	slot7 = data.unit.inventory(TeamAILogicAssault._COVER_CHK_INTERVAL).equipped_unit(TeamAILogicAssault._COVER_CHK_INTERVAL)
	slot7 = data.unit.inventory(TeamAILogicAssault._COVER_CHK_INTERVAL).equipped_unit(TeamAILogicAssault._COVER_CHK_INTERVAL).base(TeamAILogicAssault._COVER_CHK_INTERVAL)
	local usage = data.unit.inventory(TeamAILogicAssault._COVER_CHK_INTERVAL).equipped_unit(TeamAILogicAssault._COVER_CHK_INTERVAL).base(TeamAILogicAssault._COVER_CHK_INTERVAL).weapon_tweak_data(TeamAILogicAssault._COVER_CHK_INTERVAL).usage
	my_data.weapon_range = data.char_tweak.weapon[usage].range

	if old_internal_data then
		my_data.attention_unit = old_internal_data.attention_unit
		slot10 = old_internal_data.best_cover

		CopLogicAttack._set_best_cover(slot7, data, my_data)

		slot9 = old_internal_data.nearest_cover

		CopLogicAttack._set_nearest_cover(slot7, my_data)
	end

	slot8 = data.key
	local key_str = tostring(slot7)
	my_data.detection_task_key = "TeamAILogicAssault._upd_enemy_detection" .. key_str
	slot13 = data.t

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, TeamAILogicAssault._upd_enemy_detection, data)

	if data.objective then
		my_data.attitude = data.objective.attitude
	end

	slot9 = data.unit
	slot10 = false

	data.unit.movement(slot8).set_cool(slot8, data.unit.movement(slot8))

	slot9 = data.unit
	slot10 = "hos"

	data.unit.movement(slot8).set_stance(slot8, data.unit.movement(slot8))

	slot10 = data.unit
	slot10 = data.unit.inventory(data.unit.movement(slot8))
	slot10 = data.unit.inventory(data.unit.movement(slot8)).equipped_unit(data.unit.movement(slot8))
	slot10 = data.unit.inventory(data.unit.movement(slot8)).equipped_unit(data.unit.movement(slot8)).base(data.unit.movement(slot8))
	my_data.weapon_range = data.char_tweak.weapon[data.unit.inventory(data.unit.movement(slot8)).equipped_unit(data.unit.movement(slot8)).base(data.unit.movement(slot8)).weapon_tweak_data(data.unit.movement(slot8)).usage].range

	return 
end
function TeamAILogicAssault.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	TeamAILogicBase.exit(slot4, data, new_logic_name)

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
function TeamAILogicAssault.update(data)
	slot3 = data

	TeamAILogicTravel._upd_ai_perceptors(slot2)

	local my_data = data.internal_data
	local t = data.t
	local unit = data.unit
	local focus_enemy = data.attention_obj
	local in_cover = my_data.in_cover
	local best_cover = my_data.best_cover
	slot10 = my_data

	CopLogicAttack._process_pathing_results(slot8, data)

	local focus_enemy = data.attention_obj

	if not focus_enemy or focus_enemy.reaction < AIAttentionObject.REACT_AIM then
		slot11 = true

		TeamAILogicAssault._upd_enemy_detection(slot9, data)

		if my_data ~= data.internal_data or not data.attention_obj or data.attention_obj.reaction <= AIAttentionObject.REACT_SCARED then
			return 
		end

		focus_enemy = data.attention_obj
	end

	local enemy_visible = focus_enemy.verified

	if not my_data.turning then
		slot11 = data.unit
		slot12 = "walk"
		local action_taken = data.unit.movement(slot10).chk_action_forbidden(slot10, data.unit.movement(slot10)) or my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data._turning_to_intimidate
	end

	slot13 = my_data
	my_data.want_to_take_cover = CopLogicAttack._chk_wants_to_take_cover(slot11, data)
	local want_to_take_cover = my_data.want_to_take_cover

	if not action_taken then
		slot14 = my_data
		action_taken = CopLogicAttack._upd_pose(slot12, data)
	end

	local move_to_cover = nil

	if action_taken then
	elseif want_to_take_cover then
		move_to_cover = true
	end

	if not my_data.processing_cover_path and not my_data.cover_path and not my_data.charge_path_search_id and not action_taken and best_cover and (not in_cover or best_cover[1] ~= in_cover[1]) then
		CopLogicAttack._cancel_cover_pathing(slot13, data)

		slot16 = unit
		local search_id = tostring(unit.key(my_data)) .. "cover"
		slot15 = data.unit
		slot18 = best_cover[NavigationManager.COVER_RESERVATION]

		if data.unit.brain(unit.key).search_for_path_to_cover(unit.key, data.unit.brain(unit.key), search_id, best_cover[1]) then
			my_data.cover_path_search_id = search_id
			my_data.processing_cover_path = best_cover
		end
	end

	if not action_taken and move_to_cover and my_data.cover_path then
		slot15 = my_data
		action_taken = CopLogicAttack._request_action_walk_to_cover(slot13, data)
	end

	if not data.objective and (not data.path_fail_t or 6 < data.t - data.path_fail_t) then
		slot14 = managers.groupai
		slot15 = unit

		managers.groupai.state(slot13).on_criminal_jobless(slot13, managers.groupai.state(slot13))

		if my_data ~= data.internal_data then
			return 
		end
	end

	if my_data.cover_chk_t < data.t then
		slot14 = data

		CopLogicAttack._update_cover(slot13)

		my_data.cover_chk_t = data.t + TeamAILogicAssault._COVER_CHK_INTERVAL
	end

	return 
end
function TeamAILogicAssault._upd_enemy_detection(data, is_synchronous)
	slot4 = managers.groupai
	slot5 = data.unit

	managers.groupai.state(slot3).on_unit_detection_updated(slot3, managers.groupai.state(slot3))

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	data.t = TimerManager.game(slot3).time(slot3)
	local my_data = data.internal_data
	local max_reaction = nil

	if data.cool then
		max_reaction = AIAttentionObject.REACT_SURPRISED
	end

	slot8 = max_reaction
	local delay = CopLogicBase._upd_attention_obj_detection(slot5, data, nil)
	slot9 = nil
	local new_attention, new_prio_slot, new_reaction = TeamAILogicIdle._get_priority_attention(data, data, data.detected_attention_objects)
	local old_att_obj = data.attention_obj
	slot13 = new_reaction

	TeamAILogicBase._set_attention_obj(slot10, data, new_attention)

	slot12 = new_reaction

	TeamAILogicAssault._chk_exit_attack_logic(slot10, data)

	if my_data ~= data.internal_data then
		return 
	end

	if data.objective and data.objective.type == "follow" then
		slot13 = data.objective

		if TeamAILogicIdle._check_should_relocate(slot10, data, my_data) then
			slot11 = data.unit
			slot12 = "walk"

			if not data.unit.movement(slot10).chk_action_forbidden(slot10, data.unit.movement(slot10)) then
				data.objective.in_place = nil

				if new_prio_slot and 3 < new_prio_slot then
					data.objective.called = true
				end

				slot12 = "travel"

				TeamAILogicBase._exit(slot10, data.unit)

				return 
			end
		end
	end

	slot12 = my_data

	CopLogicAttack._upd_aim(slot10, data)

	if my_data._intimidate_t and my_data._intimidate_t + 2 < data.t and not my_data._turning_to_intimidate then
		slot11 = data.unit
		slot11 = data.unit.character_damage(slot10)

		if 0.5 < data.unit.character_damage(slot10).health_ratio(slot10) then
			slot11 = data.unit
			slot12 = "walk"
			local can_turn = not data.unit.movement(slot10).chk_action_forbidden(slot10, data.unit.movement(slot10)) and 3 < new_prio_slot
			slot12 = managers.groupai
			local is_assault = managers.groupai.state(slot11).get_assault_mode(slot11)
			slot15 = (is_assault and 800) or 1200
			local civ = TeamAILogicIdle.find_civilian_to_intimidate(managers.groupai.state(slot11), data.unit, (can_turn and 180) or 60)

			if civ then
			end
		end
	end

	if (not TeamAILogicAssault._mark_special_chk_t or TeamAILogicAssault._mark_special_chk_t + 0.75 < data.t) and (not TeamAILogicAssault._mark_special_t or TeamAILogicAssault._mark_special_t + 6 < data.t) and not my_data.acting then
		slot11 = data.unit
		slot11 = data.unit.sound(slot10)

		if not data.unit.sound(slot10).speaking(slot10) then
			slot11 = data.detected_attention_objects
			local nmy = TeamAILogicAssault.find_enemy_to_mark(slot10)
			TeamAILogicAssault._mark_special_chk_t = data.t

			if nmy then
				TeamAILogicAssault._mark_special_t = data.t
				slot16 = true

				TeamAILogicAssault.mark_enemy(data.t, data, data.unit, nmy, true)
			end
		end
	end

	slot12 = my_data

	TeamAILogicAssault._chk_request_combat_chatter(slot10, data)

	if not is_synchronous then
		slot15 = data.t + delay

		CopLogicBase.queue_task(slot10, my_data, my_data.detection_task_key, TeamAILogicAssault._upd_enemy_detection, data)
	end

	return 
end
function TeamAILogicAssault.find_enemy_to_mark(enemies)
	local best_nmy, best_nmy_wgt = nil
	slot5 = enemies

	for key, attention_info in pairs(slot4) do
		if attention_info.identified and (attention_info.verified or attention_info.nearly_visible) and attention_info.is_person and attention_info.char_tweak and attention_info.char_tweak.priority_shout and AIAttentionObject.REACT_COMBAT <= attention_info.reaction and (not attention_info.char_tweak.priority_shout_max_dis or attention_info.dis < attention_info.char_tweak.priority_shout_max_dis) and (not best_nmy_wgt or attention_info.verified_dis < best_nmy_wgt) then
			best_nmy_wgt = attention_info.verified_dis
			best_nmy = attention_info.unit
		end
	end

	return best_nmy
end
function TeamAILogicAssault.mark_enemy(data, criminal, to_mark, play_sound, play_action)
	if play_sound then
		slot7 = criminal
		slot10 = to_mark
		slot10 = to_mark.base(slot9)
		slot9 = true

		criminal.sound(slot6).say(slot6, criminal.sound(slot6), to_mark.base(slot9).char_tweak(slot9).priority_shout)
	end

	if play_action then
		slot7 = criminal
		slot8 = "action"

		if not criminal.movement(slot6).chk_action_forbidden(slot6, criminal.movement(slot6)) then
			local new_action = {
				variant = "arrest",
				align_sync = true,
				body_part = 3,
				type = "act"
			}
			slot8 = criminal
			slot9 = new_action

			if criminal.brain(slot7).action_request(slot7, criminal.brain(slot7)) then
				data.internal_data.gesture_arrest = true
			end
		end
	end

	slot7 = to_mark
	slot9 = true

	to_mark.contour(slot6).add(slot6, to_mark.contour(slot6), "mark_enemy")

	return 
end
function TeamAILogicAssault.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action
	local action_type = action.type(slot4)

	if action_type == "walk" then
		my_data.advancing = nil

		if my_data.retreating then
			my_data.retreating = false
		elseif my_data.moving_to_cover then
			slot6 = action

			if action.expired(slot5) then
				my_data.in_cover = my_data.moving_to_cover
				my_data.cover_enter_t = data.t
				my_data.cover_sideways_chk = nil
			end

			my_data.moving_to_cover = nil
		elseif my_data.walking_to_cover_shoot_pos then
			my_data.walking_to_cover_shoot_pos = nil
		end
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "turn" then
		my_data.turning = nil

		if my_data._turning_to_intimidate then
			my_data._turning_to_intimidate = nil
			slot10 = my_data._primary_intimidation_target

			TeamAILogicIdle.intimidate_civilians(slot5, data, data.unit, true, true)

			my_data._primary_intimidation_target = nil
		end
	elseif action_type == "hurt" then
		slot6 = action

		if action.expired(slot5) then
			slot7 = my_data

			CopLogicAttack._upd_aim(slot5, data)
		end
	elseif action_type == "dodge" then
		slot7 = my_data

		CopLogicAttack._upd_aim(slot5, data)
	end

	return 
end
function TeamAILogicAssault.damage_clbk(data, damage_info)
	slot5 = damage_info

	TeamAILogicIdle.damage_clbk(slot3, data)

	return 
end
function TeamAILogicAssault.death_clbk(data, damage_info)
	return 
end
function TeamAILogicAssault.on_detected_enemy_destroyed(data, enemy_unit)
	slot4 = data
	slot7 = enemy_unit

	TeamAILogicIdle.on_cop_neutralized(slot3, enemy_unit.key(slot6))

	return 
end
function TeamAILogicAssault._chk_request_combat_chatter(data, my_data)
	local focus_enemy = data.attention_obj

	if focus_enemy and focus_enemy.verified and focus_enemy.is_person and AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
	end

	return 
end
function TeamAILogicAssault._chk_exit_attack_logic(data, new_reaction)
	slot5 = new_reaction
	local wanted_state = TeamAILogicBase._get_logic_state_from_reaction(slot3, data)

	if wanted_state ~= data.name then
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(slot4, data, data.objective, nil)

		if allow_trans or wanted_state == "idle" then
			if obj_failed then
				slot8 = data.objective

				data.objective_failed_clbk(slot6, data.unit)
			else
				slot8 = wanted_state

				TeamAILogicBase._exit(slot6, data.unit)
			end
		end
	end

	return 
end

return 
