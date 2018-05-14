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
slot2 = CivilianLogicBase
CivilianLogicFlee = class(slot1)
function CivilianLogicFlee.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.cbt
	slot7 = data.unit
	slot8 = false

	data.unit.brain(data.unit.brain(slot5)).set_update_enabled_state(data.unit.brain(slot5), data.unit.brain(data.unit.brain(slot5)))

	local key_str = tostring(data.unit.brain(slot5))
	slot8 = managers.groupai

	managers.groupai.state(data.key).register_fleeing_civilian(data.key, managers.groupai.state(data.key), data.key)

	slot8 = managers.groupai
	slot8 = managers.groupai.state(data.key)
	slot11 = data.unit
	slot11 = data.unit.movement(data.unit)
	slot11 = data.unit.movement(data.unit).nav_tracker(data.unit)
	my_data.panic_area = managers.groupai.state(data.key).get_area_from_nav_seg_id(data.key, data.unit.movement(data.unit).nav_tracker(data.unit).nav_segment(data.unit))
	my_data.vision = data.char_tweak.vision
	slot8 = data

	CivilianLogicFlee.reset_actions(data.key)

	if data.objective then
		if data.objective.alert_data then
			slot9 = data.objective.alert_data

			CivilianLogicFlee.on_alert(slot7, data)

			if my_data ~= data.internal_data then
				return 
			end

			slot8 = data.unit

			if data.unit.anim_data(slot7).react_enter then
				slot8 = data.unit

				if not data.unit.anim_data(slot7).idle then
					my_data.delayed_post_react_alert_id = "postreact_alert" .. key_str
					slot15 = {
						data = data,
						alert_data = clone(slot17)
					}
					slot18 = data.objective.alert_data
					slot13 = TimerManager
					slot15 = 8
					slot11 = TimerManager.game(CivilianLogicFlee).time(CivilianLogicFlee) + math.lerp(TimerManager.game(CivilianLogicFlee), 4, math.random())

					CopLogicBase.add_delayed_clbk(key_str, my_data, my_data.delayed_post_react_alert_id, callback(slot11, CivilianLogicFlee, CivilianLogicFlee, "post_react_alert_clbk"))
				end
			end
		elseif data.objective.dmg_info then
			slot9 = data.objective.dmg_info

			CivilianLogicFlee.damage_clbk(slot7, data)
		end
	end

	slot8 = data.unit
	slot9 = (data.is_tied and "cbt") or "hos"

	data.unit.movement(slot7).set_stance(slot7, data.unit.movement(slot7))

	slot8 = data.unit
	slot9 = false

	data.unit.movement(slot7).set_cool(slot7, data.unit.movement(slot7))

	if my_data ~= data.internal_data then
		return 
	end

	slot9 = my_data

	CivilianLogicFlee._chk_add_delayed_rescue_SO(slot7, data)

	if data.objective and data.objective.was_rescued then
		data.objective.was_rescued = nil
		slot8 = data

		if CivilianLogicFlee._get_coarse_flee_path(nil) then
			slot8 = managers.groupai
			slot8 = managers.groupai.state(slot7)

			managers.groupai.state(slot7).on_civilian_freed(slot7)
		end
	end

	if not data.been_outlined and data.char_tweak.outline_on_discover then
		my_data.outline_detection_task_key = "CivilianLogicFlee_upd_outline_detection" .. key_str
		slot12 = data.t + 2

		CopLogicBase.queue_task(key_str, my_data, my_data.outline_detection_task_key, CivilianLogicIdle._upd_outline_detection, data)
	end

	if not my_data.detection_task_key then
		slot8 = data.unit

		if data.unit.anim_data(slot7).react_enter then
			my_data.detection_task_key = "CivilianLogicFlee._upd_detection" .. key_str
			slot12 = data.t + 0

			CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CivilianLogicFlee._upd_detection, data)
		end
	end

	local attention_settings = nil
	attention_settings = {
		"civ_enemy_cbt",
		"civ_civ_cbt",
		"civ_murderer_cbt"
	}
	slot9 = data

	CivilianLogicFlee.schedule_run_away_clbk(slot8)

	if not my_data.delayed_post_react_alert_id then
		slot9 = data.unit
		slot9 = data.unit.movement(slot8)

		if data.unit.movement(slot8).stance_name(slot8) == "ntl" then
			my_data.delayed_post_react_alert_id = "postreact_alert" .. key_str
			slot16 = {
				data = data
			}
			slot14 = TimerManager
			slot16 = 8
			slot12 = TimerManager.game(CivilianLogicFlee).time(CivilianLogicFlee) + math.lerp(TimerManager.game(CivilianLogicFlee), 4, math.random())

			CopLogicBase.add_delayed_clbk(key_str, my_data, my_data.delayed_post_react_alert_id, callback(slot12, CivilianLogicFlee, CivilianLogicFlee, "post_react_alert_clbk"))
		end
	end

	slot9 = data.unit
	slot10 = attention_settings

	data.unit.brain(slot8).set_attention_settings(slot8, data.unit.brain(slot8))

	if data.char_tweak.calls_in then
		slot9 = managers.groupai
		slot9 = managers.groupai.state(slot8)

		if not managers.groupai.state(slot8).is_police_called(slot8) then
			my_data.call_police_clbk_id = "civ_call_police" .. key_str
			slot12 = TimerManager
			slot14 = 10
			slot10 = TimerManager.game(slot11).time(slot11) + math.lerp(TimerManager.game(slot11), 1, math.random())
			local call_t = math.max(slot8, data.call_police_delay_t or 0)
			slot17 = data
			slot13 = call_t

			CopLogicBase.add_delayed_clbk(data.call_police_delay_t or 0, my_data, my_data.call_police_clbk_id, callback(1, CivilianLogicFlee, CivilianLogicFlee, "clbk_chk_call_the_police"))
		end
	end

	my_data.next_action_t = 0

	return 
end
function CivilianLogicFlee.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)
	CopLogicBase._reset_attention(slot4)

	local my_data = data.internal_data
	slot7 = my_data

	CivilianLogicFlee._unregister_rescue_SO(data, data)

	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(data)

	slot6 = managers.groupai
	slot7 = data.key

	managers.groupai.state(data).unregister_fleeing_civilian(data, managers.groupai.state(data))

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	if my_data.enemy_weapons_hot_listen_id then
		slot6 = managers.groupai
		slot7 = my_data.enemy_weapons_hot_listen_id

		managers.groupai.state(slot5).remove_listener(slot5, managers.groupai.state(slot5))
	end

	if my_data.calling_the_police then
		slot6 = managers.groupai
		slot9 = "call_interrupted"

		managers.groupai.state(slot5).on_criminal_suspicion_progress(slot5, managers.groupai.state(slot5), nil, data.unit)
	end

	return 
end
function CivilianLogicFlee.update(data)
	local exit_state = nil
	local unit = data.unit
	local my_data = data.internal_data
	local objective = data.objective
	local t = data.t

	if my_data.calling_the_police then
	elseif my_data.flee_path_search_id or my_data.coarse_path_search_id then
		slot9 = my_data

		CivilianLogicFlee._update_pathing(slot7, data)
	elseif my_data.flee_path then
		slot8 = unit
		slot9 = "walk"

		if not unit.movement(slot7).chk_action_forbidden(slot7, unit.movement(slot7)) then
			slot9 = my_data

			CivilianLogicFlee._start_moving_to_cover(slot7, data)
		end
	elseif my_data.coarse_path then
		if not my_data.advancing and my_data.next_action_t < data.t then
			local coarse_path = my_data.coarse_path
			local cur_index = my_data.coarse_path_index
			local total_nav_points = #coarse_path

			if cur_index == total_nav_points then
				slot11 = data.unit

				if data.unit.unit_data(slot10).mission_element then
					slot11 = data.unit
					slot13 = data.unit

					data.unit.unit_data(slot10).mission_element.event(slot10, data.unit.unit_data(slot10).mission_element, "fled")
				end

				slot11 = data.unit
				slot13 = 0

				data.unit.base(slot10).set_slot(slot10, data.unit.base(slot10), unit)
			else
				local to_pos, to_cover = nil

				if cur_index == total_nav_points - 1 then
					to_pos = my_data.flee_target.pos
				else
					slot13 = managers.groupai
					slot14 = coarse_path[cur_index + 1][1]
					local next_area = managers.groupai.state(slot12).get_area_from_nav_seg_id(slot12, managers.groupai.state(slot12))
					slot15 = next_area.nav_segs
					local cover = managers.navigation.find_cover_in_nav_seg_1(managers.groupai.state(slot12), managers.navigation)

					if cover then
						slot17 = {
							cover
						}

						CopLogicAttack._set_best_cover(slot14, data, my_data)

						to_cover = my_data.best_cover
					else
						slot16 = 700
						to_pos = CopLogicTravel._get_pos_on_wall(slot14, coarse_path[cur_index + 1][2])
					end
				end

				slot14 = data.key
				my_data.flee_path_search_id = "civ_flee" .. tostring(slot13)

				if to_cover then
					my_data.pathing_to_cover = to_cover
					slot13 = unit

					unit.brain(slot12).search_for_path_to_cover(slot12, unit.brain(slot12), my_data.flee_path_search_id, to_cover[1], nil)
				else
					slot15 = {
						radius = 30,
						position = to_pos
					}

					data.brain.add_pos_rsrv(slot12, data.brain, "path")

					slot13 = unit
					slot15 = to_pos

					unit.brain(slot12).search_for_path(slot12, unit.brain(slot12), my_data.flee_path_search_id)
				end
			end
		end
	elseif my_data.best_cover then
		local best_cover = my_data.best_cover

		if not my_data.moving_to_cover or my_data.moving_to_cover ~= best_cover then
			if my_data.in_cover and my_data.in_cover == best_cover then
			else
				slot9 = unit

				if not unit.anim_data(slot8).panic then
					local action_data = {
						clamp_to_graph = true,
						variant = "panic",
						body_part = 1,
						type = "act"
					}
					slot10 = data.unit
					slot11 = action_data

					data.unit.brain(slot9).action_request(slot9, data.unit.brain(slot9))

					slot10 = data.unit
					slot11 = true

					data.unit.brain(slot9).set_update_enabled_state(slot9, data.unit.brain(slot9))

					slot10 = data

					CopLogicBase._reset_attention(slot9)
				end

				my_data.pathing_to_cover = my_data.best_cover
				slot10 = data.key
				local search_id = "civ_cover" .. tostring(slot9)
				my_data.flee_path_search_id = search_id
				slot10 = data.unit
				slot12 = my_data.best_cover[1]

				data.unit.brain(slot9).search_for_path_to_cover(slot9, data.unit.brain(slot9), search_id)
			end
		end
	end

	return 
end
function CivilianLogicFlee._upd_detection(data)

	-- Decompilation error in this vicinity:
	local my_data = data.internal_data
	slot4 = managers.groupai
	slot5 = data.unit

	managers.groupai.state(slot3).on_unit_detection_updated(slot3, managers.groupai.state(slot3))

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	data.t = TimerManager.game(slot3).time(slot3)
	local delay = CopLogicBase._upd_attention_obj_detection(slot3, data, nil)
	local new_attention, new_reaction = CivilianLogicIdle._get_priority_attention(data, data)
	slot9 = new_reaction

	CivilianLogicIdle._set_attention_obj(data.detected_attention_objects, data, new_attention)

	slot7 = managers.groupai
	slot7 = managers.groupai.state(data.detected_attention_objects)

	if not managers.groupai.state(data.detected_attention_objects).is_police_called(data.detected_attention_objects) then
		slot9 = new_attention

		CopLogicArrest._mark_call_in_event(slot6, data, my_data)
	end

	if not my_data.flee_target then
		slot8 = my_data

		CivilianLogicFlee._chk_add_delayed_rescue_SO(slot6, data)
	end

	delay = delay * 3
	slot11 = data.t + delay

	CopLogicBase.queue_task(slot6, my_data, my_data.detection_task_key, CivilianLogicFlee._upd_detection, data)

	return 
end
function CivilianLogicFlee._update_pathing(data, my_data)
	if data.pathing_results then
		local pathing_results = data.pathing_results
		data.pathing_results = nil
		my_data.has_cover_path = nil
		local path = my_data.flee_path_search_id and pathing_results[my_data.flee_path_search_id]

		if path then
			if path ~= "failed" then
				my_data.flee_path = path

				if my_data.pathing_to_cover then
					my_data.has_path_to_cover = my_data.pathing_to_cover
				end
			end

			my_data.pathing_to_cover = nil
			my_data.flee_path_search_id = nil
		end
	end

	return 
end
function CivilianLogicFlee.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action

	if action.type(slot4) == "walk" then
		slot5 = TimerManager
		slot7 = 8
		my_data.next_action_t = TimerManager.game(slot4).time(slot4) + math.lerp(TimerManager.game(slot4), 2, math.random())
		slot5 = action

		if action.expired(math.lerp(TimerManager.game(slot4), 2, math.random())) then
			if my_data.moving_to_cover then
				slot5 = data.unit
				slot7 = true

				data.unit.sound(slot4).say(slot4, data.unit.sound(slot4), "a03x_any")

				my_data.in_cover = my_data.moving_to_cover
				slot6 = my_data.in_cover

				CopLogicAttack._set_nearest_cover(slot4, my_data)

				slot6 = my_data

				CivilianLogicFlee._chk_add_delayed_rescue_SO(slot4, data)
			end

			if my_data.coarse_path_index then
				my_data.coarse_path_index = my_data.coarse_path_index + 1
			end
		end

		my_data.moving_to_cover = nil
		my_data.advancing = nil

		if not my_data.coarse_path_index then
			slot5 = data.unit
			slot6 = false

			data.unit.brain(slot4).set_update_enabled_state(slot4, data.unit.brain(slot4))
		end
	else
		slot5 = action

		if action.type(slot4) == "act" and my_data.calling_the_police then
			my_data.calling_the_police = nil

			if not my_data.called_the_police then
				slot5 = managers.groupai
				slot8 = "call_interrupted"

				managers.groupai.state(slot4).on_criminal_suspicion_progress(slot4, managers.groupai.state(slot4), nil, data.unit)
			end
		end
	end

	return 
end
function CivilianLogicFlee.on_alert(data, alert_data)
	local my_data = data.internal_data

	if my_data.coarse_path then
		return 
	end

	slot5 = alert_data[1]

	if CopLogicBase.is_alert_aggressive(slot4) then
		local aggressor = alert_data[5]

		if aggressor then
			slot6 = aggressor

			if aggressor.base(slot5) then
				local is_intimidation = nil
				slot7 = aggressor

				if aggressor.base(slot6).is_local_player then
					slot9 = "civ_calming_alerts"

					if managers.player.has_category_upgrade(slot6, managers.player, "player") then
						is_intimidation = true
					end
				else
					slot7 = aggressor

					if aggressor.base(slot6).is_husk_player then
						slot7 = aggressor
						slot9 = "civ_calming_alerts"

						if aggressor.base(slot6).upgrade_value(slot6, aggressor.base(slot6), "player") then
							is_intimidation = true
						end
					end
				end

				if is_intimidation then
					slot7 = data.unit
					slot9 = aggressor

					data.unit.brain(slot6).on_intimidated(slot6, data.unit.brain(slot6), 1)

					return 
				end
			end
		end
	end

	slot5 = data.unit
	local anim_data = data.unit.anim_data(slot4)

	if anim_data.react_enter and not anim_data.idle then
		if not my_data.delayed_post_react_alert_id then
			slot7 = data.key
			my_data.delayed_post_react_alert_id = "postreact_alert" .. tostring(slot6)
			slot13 = {
				data = data,
				alert_data = clone(slot15)
			}
			slot16 = alert_data
			slot11 = TimerManager
			slot11 = TimerManager.game(CivilianLogicFlee)
			slot9 = TimerManager.game(CivilianLogicFlee).time(CivilianLogicFlee) + 1

			CopLogicBase.add_delayed_clbk(tostring(slot6), my_data, my_data.delayed_post_react_alert_id, callback(slot9, CivilianLogicFlee, CivilianLogicFlee, "post_react_alert_clbk"))
		end

		return 
	end

	slot7 = alert_data

	CivilianLogicFlee._run_away_from_alert(slot5, data)

	return 
end
function CivilianLogicFlee._run_away_from_alert(data, alert_data)
	local my_data = data.internal_data
	local avoid_pos = nil

	if alert_data[1] == "bullet" then
		local tail = alert_data[2]
		local head = alert_data[6]
		local alert_dir = head - tail
		local alert_len = mvector3.normalize(slot8)
		avoid_pos = data.m_pos - tail
		slot11 = avoid_pos
		local my_dot = mvector3.dot(alert_dir, alert_dir)
		slot12 = alert_dir

		mvector3.set(alert_dir, avoid_pos)

		slot12 = my_dot

		mvector3.multiply(alert_dir, avoid_pos)

		slot12 = tail

		mvector3.add(alert_dir, avoid_pos)
	elseif not alert_data[2] then
	end

	my_data.avoid_pos = avoid_pos

	if not my_data.cover_search_task_key then
		slot7 = data.key
		my_data.cover_search_task_key = "CivilianLogicFlee._find_hide_cover" .. tostring(slot6)
		slot10 = data.t + 0.5

		CopLogicBase.queue_task(tostring(slot6), my_data, my_data.cover_search_task_key, CivilianLogicFlee._find_hide_cover, data)
	end

	return 
end
function CivilianLogicFlee.post_react_alert_clbk(shait, params)

	-- Decompilation error in this vicinity:
	local data = params.data
	local alert_data = params.alert_data
	local my_data = data.internal_data
	local anim_data = data.unit.anim_data(slot6)
	slot9 = my_data.delayed_post_react_alert_id

	CopLogicBase.on_delayed_clbk(data.unit, my_data)

	if anim_data.react_enter then
		slot6 = CopLogicBase.add_delayed_clbk
		slot8 = my_data
		slot9 = my_data.delayed_post_react_alert_id
		slot10 = callback
		slot12 = CivilianLogicFlee
		slot13 = CivilianLogicFlee
		slot14 = "post_react_alert_clbk"
		slot15 = {
			data = data
		}
	end

	my_data.delayed_post_react_alert_id = nil

	if not anim_data.react then
		return 
	end

	if alert_data then
		slot8 = alert_data[5]

		if alive(slot7) then
			slot9 = alert_data

			CivilianLogicFlee._run_away_from_alert(slot7, data)

			return 
		end
	end

	if anim_data.react or anim_data.drop then
		local action_data = {
			clamp_to_graph = true,
			variant = "panic",
			body_part = 1,
			type = "act"
		}
		slot9 = data.unit
		slot10 = action_data

		data.unit.brain(slot8).action_request(slot8, data.unit.brain(slot8))

		slot9 = data.unit
		slot11 = true

		data.unit.sound(slot8).say(slot8, data.unit.sound(slot8), "a01x_any")

		slot9 = data.unit

		if data.unit.unit_data(slot8).mission_element then
			slot9 = data.unit
			slot11 = data.unit

			data.unit.unit_data(slot8).mission_element.event(slot8, data.unit.unit_data(slot8).mission_element, "panic")
		end

		slot9 = data

		CopLogicBase._reset_attention(slot8)

		slot9 = managers.groupai
		slot9 = managers.groupai.state(slot8)

		if not managers.groupai.state(slot8).enemy_weapons_hot(slot8) then
			local alert = {
				"vo_distress",
				nil,
				200
			}
			slot10 = data.unit
			slot10 = data.unit.movement(slot9)
			alert[2] = data.unit.movement(slot9).m_head_pos(slot9)
			alert[4] = data.SO_access
			alert[5] = data.unit
			slot10 = managers.groupai
			slot11 = alert

			managers.groupai.state(slot9).propagate_alert(slot9, managers.groupai.state(slot9))
		end

		return 
	end

	slot6 = CopLogicBase.add_delayed_clbk
	slot8 = my_data
	slot9 = my_data.delayed_post_react_alert_id
	slot10 = callback
	slot12 = CivilianLogicFlee
	slot13 = CivilianLogicFlee
	slot14 = "post_react_alert_clbk"
	slot15 = {
		data = data
	}
end
function CivilianLogicFlee._flee_coarse_path_verify_clbk(shait, nav_seg)
	slot4 = managers.groupai
	slot5 = nav_seg

	return managers.groupai.state(slot3).is_nav_seg_safe(slot3, managers.groupai.state(slot3))
end
function CivilianLogicFlee.on_intimidated(data, amount, aggressor_unit)

	-- Decompilation error in this vicinity:
	local my_data = data.internal_data

	if not my_data.delayed_intimidate_id then
		slot7 = data.key
		my_data.delayed_intimidate_id = "intimidate" .. tostring(slot6)
		local delay = 1 - amount + math.random() * 0.2
		slot14 = {
			data,
			amount,
			aggressor_unit
		}
		slot12 = TimerManager
		slot12 = TimerManager.game(CivilianLogicFlee)
		slot10 = TimerManager.game(CivilianLogicFlee).time(CivilianLogicFlee) + delay

		CopLogicBase.add_delayed_clbk(slot6, my_data, my_data.delayed_intimidate_id, callback(slot10, CivilianLogicFlee, CivilianLogicFlee, "_delayed_intimidate_clbk"))
	end

	return 
end
function CivilianLogicFlee._delayed_intimidate_clbk(ignore_this, params)
	local data = params[1]
	local my_data = data.internal_data
	slot7 = my_data.delayed_intimidate_id

	CopLogicBase.on_delayed_clbk(slot5, my_data)

	my_data.delayed_intimidate_id = nil
	slot6 = params[3]

	if not alive(slot5) then
		return 
	end

	slot8 = params[3]

	CivilianLogicIdle.on_intimidated(slot5, data, params[2])

	return 
end
function CivilianLogicFlee._cancel_pathing(data, my_data)
	slot4 = data.unit
	slot4 = data.unit.brain(slot3)

	data.unit.brain(slot3).cancel_all_pathing_searches(slot3)

	my_data.pathing_to_cover = nil
	my_data.has_path_to_cover = nil
	my_data.coarse_path_search_id = nil
	my_data.coarse_search_failed = nil
	my_data.coarse_path = nil
	my_data.flee_target = nil
	my_data.coarse_path_index = nil

	return 
end
function CivilianLogicFlee._find_hide_cover(data)
	local my_data = data.internal_data
	my_data.cover_search_task_key = nil
	slot4 = data.unit

	if data.unit.anim_data(slot3).dont_flee then
		return 
	end

	local avoid_pos = nil

	if my_data.avoid_pos then
		avoid_pos = my_data.avoid_pos
	elseif data.attention_obj and AIAttentionObject.REACT_SCARED <= data.attention_obj.reaction then
		avoid_pos = data.attention_obj.m_pos
	else
		local closest_crim, closest_crim_dis = nil
		slot7 = data.detected_attention_objects

		for u_key, att_data in pairs(slot6) do
			if not closest_crim_dis or att_data.dis < closest_crim_dis then
				closest_crim = att_data
				closest_crim_dis = att_data.dis
			end
		end

		if closest_crim then
			avoid_pos = closest_crim.m_pos
		else
			avoid_pos = Vector3()
			slot8 = math.UP

			mvector3.random_orthogonal(slot6, avoid_pos)

			slot8 = 100

			mvector3.multiply(slot6, avoid_pos)

			slot8 = 100

			mvector3.add(slot6, data.m_pos)
		end
	end

	if my_data.best_cover then
		local best_cover_vec = avoid_pos - my_data.best_cover[1][NavigationManager.COVER_POSITION]
		slot7 = my_data.best_cover[1][NavigationManager.COVER_FORWARD]

		if 0.7 < mvector3.dot(slot5, best_cover_vec) then
			return 
		end
	end

	slot8 = my_data.panic_area.nav_segs
	local cover = managers.navigation.find_cover_away_from_pos(slot4, managers.navigation, data.m_pos, avoid_pos)

	if cover then
		slot6 = data.unit

		if not data.unit.anim_data(slot5).panic then
			local action_data = {
				clamp_to_graph = true,
				variant = "panic",
				body_part = 1,
				type = "act"
			}
			slot7 = data.unit
			slot8 = action_data

			data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))
		end

		slot7 = my_data

		CivilianLogicFlee._cancel_pathing(slot5, data)

		slot8 = {
			cover
		}

		CopLogicAttack._set_best_cover(slot5, data, my_data)

		slot6 = data.unit
		slot7 = true

		data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))

		slot6 = data

		CopLogicBase._reset_attention(slot5)
	else
		slot6 = data.unit
	end

	return 
end
function CivilianLogicFlee._start_moving_to_cover(data, my_data)
	slot4 = data.unit
	slot6 = true

	data.unit.sound(slot3).say(slot3, data.unit.sound(slot3), "a03x_any")

	slot5 = my_data

	CivilianLogicFlee._unregister_rescue_SO(slot3, data)

	slot5 = my_data.flee_path

	CopLogicAttack._adjust_path_start_pos(slot3, data)
	CopLogicBase._reset_attention(slot3)

	local new_action_data = {
		variant = "run",
		body_part = 2,
		type = "walk",
		nav_path = my_data.flee_path
	}
	slot5 = data.unit
	slot6 = new_action_data
	my_data.advancing = data.unit.brain(data).action_request(data, data.unit.brain(data))
	my_data.flee_path = nil
	slot6 = "path"

	data.brain.rem_pos_rsrv(data, data.brain)

	if my_data.has_path_to_cover then
		my_data.moving_to_cover = my_data.has_path_to_cover
		my_data.has_path_to_cover = nil
	end

	return 
end
function CivilianLogicFlee._add_delayed_rescue_SO(data, my_data)
	if my_data.rescue_active then
		return 
	end

	if data.char_tweak.flee_type ~= "hide" then
		slot4 = data.unit

		if data.unit.unit_data(slot3) then
			slot4 = data.unit
		elseif my_data.delayed_clbks and my_data.delayed_clbks[my_data.delayed_rescue_SO_id] then
			slot8 = TimerManager
			slot8 = TimerManager.game(slot7)
			slot6 = TimerManager.game(slot7).time(slot7) + 1

			managers.enemy.reschedule_delayed_clbk(slot3, managers.enemy, my_data.delayed_rescue_SO_id)
		else
			if my_data.rescuer then
				slot4 = my_data.rescuer
				slot4 = my_data.rescuer.brain(slot3)
				local objective = my_data.rescuer.brain(slot3).objective(slot3)
				local rescuer = my_data.rescuer
				my_data.rescuer = nil
				slot6 = managers.groupai
				slot8 = objective

				managers.groupai.state(slot5).on_objective_failed(slot5, managers.groupai.state(slot5), rescuer)
			elseif my_data.rescue_SO_id then
				slot4 = managers.groupai
				slot5 = my_data.rescue_SO_id

				managers.groupai.state(slot3).remove_special_objective(slot3, managers.groupai.state(slot3))

				my_data.rescue_SO_id = nil
			end

			slot5 = data.key
			my_data.delayed_rescue_SO_id = "rescue" .. tostring(slot4)
			slot11 = data
			slot9 = TimerManager
			slot9 = TimerManager.game(CivilianLogicFlee)
			slot7 = TimerManager.game(CivilianLogicFlee).time(CivilianLogicFlee) + 1

			CopLogicBase.add_delayed_clbk(tostring(slot4), my_data, my_data.delayed_rescue_SO_id, callback(slot7, CivilianLogicFlee, CivilianLogicFlee, "register_rescue_SO"))
		end
	end

	my_data.rescue_active = true

	return 
end
function CivilianLogicFlee.register_rescue_SO(ignore_this, data)
	local my_data = data.internal_data
	slot6 = my_data.delayed_rescue_SO_id

	CopLogicBase.on_delayed_clbk(slot4, my_data)

	my_data.delayed_rescue_SO_id = nil
	slot5 = data.unit

	if data.unit.anim_data(slot4).dont_flee then
		return 
	end

	slot5 = data.unit
	local my_tracker = data.unit.movement(slot4).nav_tracker(slot4)
	local objective_pos = my_tracker.field_position(data.unit.movement(slot4))
	slot7 = data.unit
	slot7 = data.unit.movement(my_tracker)
	local side = data.unit.movement(my_tracker).m_rot(my_tracker).x(my_tracker)
	slot9 = 65

	mvector3.multiply(data.unit.movement(my_tracker).m_rot(my_tracker), side)

	local test_pos = mvector3.copy(data.unit.movement(my_tracker).m_rot(my_tracker))
	slot10 = side

	mvector3.add(objective_pos, test_pos)

	local so_pos, so_rot = nil
	local ray_params = {
		allow_entry = false,
		trace = true
	}
	slot12 = data.unit
	slot12 = data.unit.movement(slot11)
	ray_params.tracker_from = data.unit.movement(slot11).nav_tracker(slot11)
	ray_params.pos_to = test_pos
	slot13 = ray_params

	if not managers.navigation.raycast(slot11, managers.navigation) then
		so_pos = test_pos
		slot13 = math.UP
		so_rot = Rotation(slot11, -side)
	else
		slot12 = objective_pos
		test_pos = mvector3.copy(slot11)
		slot13 = side

		mvector3.subtract(slot11, test_pos)

		ray_params.pos_to = test_pos
		slot13 = ray_params

		if not managers.navigation.raycast(slot11, managers.navigation) then
			so_pos = test_pos
			slot13 = math.UP
			so_rot = Rotation(slot11, side)
		else
			slot12 = objective_pos
			so_pos = mvector3.copy(slot11)
			so_rot = nil
		end
	end

	local objective = {
		type = "act",
		interrupt_health = 0.75,
		destroy_clbk_key = false,
		stance = "hos",
		scan = true,
		interrupt_dis = 700,
		follow_unit = data.unit,
		pos = so_pos,
		rot = so_rot
	}
	slot13 = data.unit
	slot13 = data.unit.movement(slot12)
	slot13 = data.unit.movement(slot12).nav_tracker(slot12)
	objective.nav_seg = data.unit.movement(slot12).nav_tracker(slot12).nav_segment(slot12)
	slot16 = data
	objective.fail_clbk = callback(slot12, CivilianLogicFlee, CivilianLogicFlee, "on_rescue_SO_failed")
	slot16 = data
	objective.complete_clbk = callback(slot12, CivilianLogicFlee, CivilianLogicFlee, "on_rescue_SO_completed")
	objective.action = {
		variant = "untie",
		body_part = 1,
		type = "act",
		blocks = {
			action = -1,
			walk = -1
		}
	}
	objective.action_duration = tweak_data.interaction.free.timer
	slot13 = managers.groupai
	local receiver_areas = managers.groupai.state().get_areas_from_nav_seg_id(, managers.groupai.state())
	local so_descriptor = {
		interval = 10,
		search_dis_sq = 25000000,
		AI_group = "enemies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective
	}
	slot15 = data.m_pos
	so_descriptor.search_pos = mvector3.copy(objective.nav_seg)
	slot18 = data
	so_descriptor.admin_clbk = callback(objective.nav_seg, CivilianLogicFlee, CivilianLogicFlee, "on_rescue_SO_administered")
	slot18 = {
		logic_data = data,
		areas = receiver_areas
	}
	so_descriptor.verification_clbk = callback(objective.nav_seg, CivilianLogicFlee, CivilianLogicFlee, "rescue_SO_verification")
	slot16 = data.key
	local so_id = "rescue" .. tostring(CivilianLogicFlee)
	my_data.rescue_SO_id = so_id
	slot16 = managers.groupai
	slot18 = so_descriptor

	managers.groupai.state(CivilianLogicFlee).add_special_objective(CivilianLogicFlee, managers.groupai.state(CivilianLogicFlee), so_id)

	slot16 = managers.groupai
	slot18 = nil

	managers.groupai.state(CivilianLogicFlee).register_rescueable_hostage(CivilianLogicFlee, managers.groupai.state(CivilianLogicFlee), data.unit)

	return 
end
function CivilianLogicFlee._unregister_rescue_SO(data, my_data)
	if my_data.rescuer then
		local rescuer = my_data.rescuer
		my_data.rescuer = nil
		slot5 = managers.groupai
		slot6 = rescuer
		slot9 = rescuer
		slot9 = rescuer.brain(slot8)

		managers.groupai.state(slot4).on_objective_failed(slot4, managers.groupai.state(slot4), rescuer.brain(slot8).objective(slot8))
	elseif my_data.rescue_SO_id then
		slot4 = managers.groupai
		slot5 = my_data.rescue_SO_id

		managers.groupai.state(slot3).remove_special_objective(slot3, managers.groupai.state(slot3))

		my_data.rescue_SO_id = nil
		slot4 = managers.groupai
		slot5 = data.key

		managers.groupai.state(slot3).unregister_rescueable_hostage(slot3, managers.groupai.state(slot3))
	elseif my_data.delayed_rescue_SO_id then
		slot5 = my_data.delayed_rescue_SO_id

		CopLogicBase.chk_cancel_delayed_clbk(slot3, my_data)

		my_data.delayed_rescue_SO_id = nil
	end

	my_data.rescue_active = nil

	return 
end
function CivilianLogicFlee.on_rescue_SO_administered(ignore_this, data, receiver_unit)
	slot5 = managers.groupai

	managers.groupai.state(slot4).on_civilian_try_freed(slot4)

	local my_data = data.internal_data
	my_data.rescuer = receiver_unit
	my_data.rescue_SO_id = nil
	slot6 = managers.groupai
	slot7 = data.key

	managers.groupai.state(managers.groupai.state(slot4)).unregister_rescueable_hostage(managers.groupai.state(slot4), managers.groupai.state(managers.groupai.state(slot4)))

	return 
end
function CivilianLogicFlee.rescue_SO_verification(ignore_this, params, unit)

	-- Decompilation error in this vicinity:
	local areas = params.areas
	local data = params.logic_data
	slot7 = unit
	slot7 = unit.base(slot6)
	slot7 = unit
	slot7 = unit.movement(slot6)
	local u_nav_seg = unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6)
	slot8 = areas

	for _, area in ipairs(unit.movement(slot6).nav_tracker(slot6)) do
		if area.nav_segs[u_nav_seg] then
			return true
		end
	end

	return 
end
function CivilianLogicFlee.on_rescue_SO_failed(ignore_this, data)
	local my_data = data.internal_data

	if my_data.rescuer then
		my_data.rescue_active = nil
		my_data.rescuer = nil
		slot6 = data.internal_data

		CivilianLogicFlee._add_delayed_rescue_SO(slot4, data)
	end

	return 
end
function CivilianLogicFlee.on_rescue_SO_completed(ignore_this, data, good_pig)
	if data.internal_data.rescuer then
		slot6 = data.internal_data.rescuer

		if good_pig.key(slot4) == data.internal_data.rescuer.key(good_pig) then
			data.internal_data.rescue_active = nil
			data.internal_data.rescuer = nil

			if data.name == "surrender" then
				local new_action = nil
				slot6 = data.unit

				if data.unit.anim_data(slot5).stand and data.is_tied then
					slot8 = "release"

					data.brain.on_hostage_move_interaction(slot5, data.brain, nil)
				else
					slot6 = data.unit
				end

				if new_action then
					data.is_tied = nil
					slot6 = data.unit
					slot8 = true

					data.unit.interaction(slot5).set_active(slot5, data.unit.interaction(slot5), false)

					slot6 = data.unit
					slot7 = new_action

					data.unit.brain(slot5).action_request(slot5, data.unit.brain(slot5))
				end

				slot6 = data.unit
				slot7 = {
					is_default = true,
					was_rescued = true,
					type = "free"
				}

				data.unit.brain(slot5).set_objective(slot5, data.unit.brain(slot5))
			else
				slot5 = data

				if not CivilianLogicFlee._get_coarse_flee_path(slot4) then
					return 
				end
			end
		end
	end

	slot5 = data.unit
	slot6 = true

	data.unit.brain(slot4).set_update_enabled_state(slot4, data.unit.brain(slot4))

	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)

	managers.groupai.state(slot4).on_civilian_freed(slot4)

	slot5 = good_pig
	slot7 = true

	good_pig.sound(slot4).say(slot4, good_pig.sound(slot4), "h01")

	return 
end
function CivilianLogicFlee._get_coarse_flee_path(data)
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	slot6 = data.unit
	slot6 = data.unit.movement(slot5)
	slot6 = data.unit.movement(slot5).nav_tracker(slot5)
	local flee_point = managers.groupai.state(slot2).safe_flee_point(slot2, data.unit.movement(slot5).nav_tracker(slot5).nav_segment(slot5))

	if not flee_point then
		return 
	end

	local my_data = data.internal_data
	slot7 = "_flee_coarse_path_verify_clbk"
	local verify_clbk = callback(slot4, CivilianLogicFlee, CivilianLogicFlee)
	local search_params = {}
	slot7 = data.unit
	search_params.from_tracker = data.unit.movement(CivilianLogicFlee).nav_tracker(CivilianLogicFlee)
	search_params.to_seg = flee_point.nav_seg
	slot8 = data.key
	slot6 = tostring(data.unit.movement(CivilianLogicFlee))
	search_params.id = "CivilianLogicFlee._get_coarse_flee_path" .. slot6
	search_params.access_pos = data.char_tweak.access
	slot9 = "_flee_coarse_path_verify_clbk"
	search_params.verify_clbk = callback(slot6, CivilianLogicFlee, CivilianLogicFlee)
	slot8 = search_params
	local coarse_path = managers.navigation.search_coarse(slot6, managers.navigation)

	if not coarse_path then
		return 
	end

	slot8 = managers.groupai
	slot9 = coarse_path

	managers.groupai.state(slot7).trim_coarse_path_to_areas(slot7, managers.groupai.state(slot7))

	my_data.coarse_path_index = 1
	my_data.coarse_path = coarse_path
	my_data.flee_target = flee_point

	return true
end
function CivilianLogicFlee.on_new_objective(data, old_objective)
	slot5 = old_objective

	CivilianLogicIdle.on_new_objective(slot3, data)

	return 
end
function CivilianLogicFlee.on_rescue_allowed_state(data, state)
	return 
end
function CivilianLogicFlee.wants_rescue(data)
	return data.internal_data.rescue_SO_id
end
function CivilianLogicFlee._get_all_paths(data)
	return {
		flee_path = data.internal_data.flee_path
	}
end
function CivilianLogicFlee._set_verified_paths(data, verified_paths)
	data.internal_data.flee_path = verified_paths.flee_path

	return 
end
function CivilianLogicFlee.reset_actions(data)
	slot3 = data.unit
	local walk_action = data.unit.movement(slot2)._active_actions[2]

	if walk_action then
		slot4 = walk_action

		if walk_action.type(slot3) == "walk" then
			local action = {
				body_part = 2,
				type = "idle"
			}
			slot5 = data.unit
			slot6 = action

			data.unit.movement(slot4).action_request(slot4, data.unit.movement(slot4))
		end
	end

	return 
end
function CivilianLogicFlee._chk_add_delayed_rescue_SO(data, my_data)
	if not my_data.exiting then
		slot4 = data.unit
	elseif my_data.rescue_active then
		slot5 = my_data

		CivilianLogicFlee._unregister_rescue_SO(slot3, data)
	end

	return 
end
function CivilianLogicFlee.clbk_chk_run_away(ignore_this, data)
	local my_data = data.internal_data
	slot6 = my_data.run_away_clbk_id

	CopLogicBase.on_delayed_clbk(slot4, my_data)

	my_data.run_away_clbk_id = nil

	if not my_data.coarse_path then
		slot5 = data

		if CivilianLogicFlee._get_coarse_flee_path(slot4) then
			slot5 = data.unit
			slot6 = true

			data.unit.brain(slot4).set_update_enabled_state(slot4, data.unit.brain(slot4))
		end
	end

	slot5 = TimerManager
	slot7 = 8
	data.run_away_next_chk_t = TimerManager.game(slot4).time(slot4) + math.lerp(TimerManager.game(slot4), 5, math.random())
	slot5 = data

	CivilianLogicFlee.schedule_run_away_clbk(math.lerp(TimerManager.game(slot4), 5, math.random()))

	return 
end
function CivilianLogicFlee.schedule_run_away_clbk(data)
	local my_data = data.internal_data

	if my_data.run_away_clbk_id or not data.char_tweak.run_away_delay then
		return 
	end

	if not data.run_away_next_chk_t then
		slot6 = data.char_tweak.run_away_delay[2]
		slot2 = data.t + math.lerp(slot4, data.char_tweak.run_away_delay[1], math.random())
	end

	data.run_away_next_chk_t = slot2
	slot5 = data.key
	my_data.run_away_clbk_id = "runaway_chk" .. tostring(slot4)
	slot11 = data
	slot7 = data.run_away_next_chk_t

	CopLogicBase.add_delayed_clbk(tostring(slot4), my_data, my_data.run_away_clbk_id, callback(slot7, CivilianLogicFlee, CivilianLogicFlee, "clbk_chk_run_away"))

	return 
end
function CivilianLogicFlee.clbk_chk_call_the_police(ignore_this, data)
	local my_data = data.internal_data
	slot6 = my_data.call_police_clbk_id

	CopLogicBase.on_delayed_clbk(slot4, my_data)

	my_data.call_police_clbk_id = nil
	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)

	if managers.groupai.state(slot4).is_police_called(slot4) then
		return 
	end

	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)
	slot8 = data.unit
	slot8 = data.unit.movement(slot7)
	local my_areas = managers.groupai.state(slot4).get_areas_from_nav_seg_id(slot4, data.unit.movement(slot7).nav_tracker(slot7).nav_segment(slot7))
	local already_calling = false
	slot9 = managers.enemy

	for u_key, u_data in pairs(managers.enemy.all_civilians(data.unit.movement(slot7).nav_tracker(slot7))) do
		slot12 = u_data.unit
		slot12 = u_data.unit.movement(slot11)
		slot12 = u_data.unit.movement(slot11).nav_tracker(slot11)
		local civ_nav_seg = u_data.unit.movement(slot11).nav_tracker(slot11).nav_segment(slot11)

		if my_areas[civ_nav_seg] then
			slot13 = u_data.unit

			if u_data.unit.anim_data(slot12).call_police then
				already_calling = true

				break
			end
		end
	end

	if not already_calling then
	end

	slot8 = data.key
	my_data.call_police_clbk_id = "civ_call_police" .. tostring(slot7)
	slot14 = data
	slot12 = TimerManager
	slot14 = 20
	slot10 = TimerManager.game(CivilianLogicFlee).time(CivilianLogicFlee) + math.lerp(TimerManager.game(CivilianLogicFlee), 15, math.random())

	CopLogicBase.add_delayed_clbk(tostring(slot7), my_data, my_data.call_police_clbk_id, callback(slot10, CivilianLogicFlee, CivilianLogicFlee, "clbk_chk_call_the_police"))

	return 
end
function CivilianLogicFlee._say_call_the_police(data, my_data)
	slot4 = data.unit
	slot7 = false

	data.unit.sound(slot3).say(slot3, data.unit.sound(slot3), "911_call", true)

	return 
end
function CivilianLogicFlee.on_police_call_success(data)
	data.internal_data.called_the_police = true

	return 
end

return 
