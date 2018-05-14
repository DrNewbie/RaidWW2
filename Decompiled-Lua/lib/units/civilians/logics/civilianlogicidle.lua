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
slot3 = CivilianLogicBase
CivilianLogicIdle = class(slot2)
function CivilianLogicIdle.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	data.internal_data = my_data

	if not data.char_tweak.detection then
		slot8 = data.unit

		debug_pause_unit(slot5, data.unit, "missing detection tweak_data")
	end

	slot6 = data.unit
	slot6 = data.unit.movement(slot5)
	local is_cool = data.unit.movement(slot5).cool(slot5)

	if is_cool then
		my_data.detection = data.char_tweak.detection.ntl
	else
		my_data.detection = data.char_tweak.detection.cbt
	end

	my_data.vision = data.char_tweak.vision
	slot7 = data

	CopLogicBase._reset_attention(slot6)

	slot7 = data.unit
	slot8 = false

	data.unit.brain(slot6).set_update_enabled_state(slot6, data.unit.brain(slot6))

	slot7 = data.key
	local key_str = tostring(slot6)
	local objective = data.objective

	if objective then
		if objective.action then
			slot9 = data.unit
			slot10 = objective.action
			local action = data.unit.brain(slot8).action_request(slot8, data.unit.brain(slot8))

			if action and objective.action.type == "act" then
				my_data.acting = action

				if objective.action_start_clbk then
					slot10 = data.unit

					objective.action_start_clbk(slot9)

					if my_data ~= data.internal_data then
						return 
					end
				end
			end
		end

		if objective.action_duration then
			my_data.action_timeout_clbk_id = "CivilianLogicIdle_action_timeout" .. key_str
			local action_timeout_t = data.t + objective.action_duration
			slot17 = data
			slot13 = action_timeout_t

			CopLogicBase.add_delayed_clbk(slot9, my_data, my_data.action_timeout_clbk_id, callback(slot13, CivilianLogicIdle, CivilianLogicIdle, "clbk_action_timeout"))
		end
	end

	my_data.tmp_vec3 = Vector3()
	my_data.detection_task_key = "CivilianLogicIdle._upd_detection" .. key_str
	slot13 = data.t + 1

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CivilianLogicIdle._upd_detection, data)

	if not data.been_outlined and data.char_tweak.outline_on_discover then
		slot10 = data.key
		my_data.outline_detection_task_key = "CivilianLogicIdle._upd_outline_detection" .. tostring(slot9)
		slot13 = data.t + 2

		CopLogicBase.queue_task(tostring(slot9), my_data, my_data.outline_detection_task_key, CivilianLogicIdle._upd_outline_detection, data)
	end

	slot9 = data.unit
	slot9 = data.unit.movement(slot8)

	if not data.unit.movement(slot8).cool(slot8) then
		my_data.registered_as_fleeing = true
		slot9 = managers.groupai
		slot11 = data.unit

		managers.groupai.state(slot8).register_fleeing_civilian(slot8, managers.groupai.state(slot8), data.key)
	end

	if objective and objective.stance then
		slot9 = data.unit
		slot10 = objective.stance

		data.unit.movement(slot8).set_stance(slot8, data.unit.movement(slot8))
	end

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

	return 
end
function CivilianLogicIdle.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data

	if my_data.idle_attention then
		slot6 = my_data.idle_attention.unit

		if alive(slot5) then
			slot6 = data

			CopLogicBase._reset_attention(slot5)
		end
	end

	if my_data.enemy_weapons_hot_listen_id then
		slot6 = managers.groupai
		slot7 = my_data.enemy_weapons_hot_listen_id

		managers.groupai.state(slot5).remove_listener(slot5, managers.groupai.state(slot5))
	end

	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(slot5)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(slot5)

	if my_data.registered_as_fleeing then
		slot6 = managers.groupai
		slot7 = data.key

		managers.groupai.state(slot5).unregister_fleeing_civilian(slot5, managers.groupai.state(slot5))
	end

	return 
end
function CivilianLogicIdle._upd_outline_detection(data)
	local my_data = data.internal_data

	if data.been_outlined or data.has_outline then
		return 
	end

	slot4 = TimerManager
	local t = TimerManager.game(slot3).time(slot3)
	slot6 = "AI_visibility"
	local visibility_slotmask = managers.slot.get_mask(TimerManager.game(slot3), managers.slot)
	local seen = false
	local seeing_unit = nil
	slot8 = data.unit
	slot8 = data.unit.movement(slot7)
	local my_tracker = data.unit.movement(slot7).nav_tracker(slot7)
	local chk_vis_func = my_tracker.check_visibility
	slot12 = managers.groupai
	slot12 = managers.groupai.state(slot11)

	for e_key, record in pairs(managers.groupai.state(slot11).all_criminals(slot11)) do
		slot16 = record.tracker

		if chk_vis_func(slot14, my_tracker) then
			local enemy_pos = record.m_det_pos
			slot16 = data.unit
			local my_pos = data.unit.movement(slot15).m_head_pos(slot15)
			slot18 = my_pos

			if mvector3.distance_sq(data.unit.movement(slot15), enemy_pos) < 1440000 then
				slot25 = "report"
				local not_hit = World.raycast(slot16, World, "ray", my_pos, enemy_pos, "slot_mask", visibility_slotmask, "ray_type", "ai_vision")

				if not not_hit then
					seen = true
					seeing_unit = record.unit

					break
				end
			end
		end
	end

	if seen then
		slot10 = data

		CivilianLogicIdle._enable_outline(slot9)
	else
		slot14 = t + 0.33

		CopLogicBase.queue_task(slot9, my_data, my_data.outline_detection_task_key, CivilianLogicIdle._upd_outline_detection, data)
	end

	return 
end
function CivilianLogicIdle._enable_outline(data)
	local my_data = data.internal_data
	slot4 = data.unit
	slot5 = "highlight_character"

	data.unit.contour(slot3).add(slot3, data.unit.contour(slot3))

	data.has_outline = true
	data.been_outlined = true
	my_data.outline_detection_task_key = nil

	return 
end
function CivilianLogicIdle.on_alert(data, alert_data)
	if data.is_tied then
		slot4 = data.unit

		if data.unit.anim_data(slot3).stand then
			slot4 = TimerManager
			slot4 = TimerManager.game(slot3)

			if 3 < TimerManager.game(slot3).time(slot3) - data.internal_data.state_enter_t then
				slot4 = data.unit
				slot6 = "stay"

				data.unit.brain(slot3).on_hostage_move_interaction(slot3, data.unit.brain(slot3), nil)
			end

			return 
		end
	end

	local my_data = data.internal_data
	local my_dis, alert_delay = nil
	slot7 = data.unit
	slot7 = data.unit.movement(slot6)
	local my_listen_pos = data.unit.movement(slot6).m_head_pos(slot6)
	local alert_epicenter = alert_data[2]
	slot11 = data.unit
	slot11 = data.unit.movement(slot10)
	slot10 = alert_data

	if CopLogicBase._chk_alert_obstructed(slot8, data.unit.movement(slot10).m_head_pos(slot10)) then
		return 
	end

	slot9 = alert_data[1]

	if CopLogicBase.is_alert_aggressive(slot8) then
		slot9 = data.unit
		slot9 = data.unit.movement(slot8)

		if not data.unit.movement(slot8).cool(slot8) then
			local aggressor = alert_data[5]

			if aggressor then
				slot10 = aggressor

				if aggressor.base(slot9) then
					local is_intimidation = nil
					slot11 = aggressor

					if aggressor.base(slot10).is_local_player then
						slot13 = "civ_calming_alerts"

						if managers.player.has_category_upgrade(slot10, managers.player, "player") then
							is_intimidation = true
						end
					else
						slot11 = aggressor

						if aggressor.base(slot10).is_husk_player then
							slot11 = aggressor
							slot13 = "civ_calming_alerts"

							if aggressor.base(slot10).upgrade_value(slot10, aggressor.base(slot10), "player") then
								is_intimidation = true
							end
						end
					end

					if is_intimidation then
						slot11 = data.brain

						if not data.brain.interaction_voice(slot10) then
							slot11 = data.unit
							slot13 = aggressor

							data.unit.brain(slot10).on_intimidated(slot10, data.unit.brain(slot10), 1)
						end

						return 
					end
				end
			end
		end

		slot9 = data.unit
		slot10 = false
		slot13 = managers.groupai
		slot15 = data.unit
		slot15 = alert_data

		data.unit.movement(slot8).set_cool(slot8, data.unit.movement(slot8), managers.groupai.state(slot12).analyse_giveaway(slot12, data.unit.base(slot14)._tweak_table, alert_data[5]))

		slot9 = data.unit
		slot10 = (data.is_tied and "cbt") or "hos"

		data.unit.movement(slot8).set_stance(slot8, data.unit.movement(slot8))
	end

	if alert_data[5] then
		slot9 = data
		slot12 = alert_data[5]
		slot7, slot8 = CopLogicBase.identify_attention_obj_instant(slot8, alert_data[5].key(slot11))
	end

	if my_data == data.internal_data and not data.char_tweak.ignores_aggression then

		-- Decompilation error in this vicinity:
		slot10 = alert_epicenter
		my_dis = mvector3.distance(slot8, my_listen_pos) or 3000
		slot10 = 4
		slot14 = my_dis / 2000
		alert_delay = math.lerp(slot8, 1, math.min(slot12, 1)) * math.random()

		if not my_data.delayed_alert_id then
			slot10 = data.key
			my_data.delayed_alert_id = "alert" .. tostring(slot9)
			slot16 = {
				data = data,
				alert_data = clone(slot18)
			}
			slot19 = alert_data
			slot14 = TimerManager
			slot14 = TimerManager.game(CivilianLogicIdle)
			slot12 = TimerManager.game(CivilianLogicIdle).time(CivilianLogicIdle) + alert_delay

			CopLogicBase.add_delayed_clbk(tostring(slot9), my_data, my_data.delayed_alert_id, callback(slot12, CivilianLogicIdle, CivilianLogicIdle, "_delayed_alert_clbk"))
		end
	end

	return 
end
function CivilianLogicIdle._delayed_alert_clbk(ignore_this, params)
	local data = params.data
	local alert_data = params.alert_data
	local my_data = data.internal_data
	slot8 = my_data.delayed_alert_id

	CopLogicBase.on_delayed_clbk(slot6, my_data)

	my_data.delayed_alert_id = nil
	local alerting_unit = alert_data[5]
	slot8 = alerting_unit

	if alive(my_data) then
	end

	slot9 = alerting_unit

	if not CivilianLogicIdle.is_obstructed(slot7, data) then
		slot9 = data.key
		my_data.delayed_alert_id = "alert" .. tostring(slot8)
		slot15 = {
			data = data,
			alert_data = clone(slot17)
		}
		slot18 = alert_data
		slot13 = TimerManager
		slot13 = TimerManager.game(CivilianLogicIdle)
		slot11 = TimerManager.game(CivilianLogicIdle).time(CivilianLogicIdle) + 1

		CopLogicBase.add_delayed_clbk(tostring(slot8), my_data, my_data.delayed_alert_id, callback(slot11, CivilianLogicIdle, CivilianLogicIdle, "_delayed_alert_clbk"))

		return 
	end

	alert_data[5] = alerting_unit

	if not data.call_police_delay_t then
		slot8 = TimerManager
		slot8 = TimerManager.game(slot7)
		slot6 = TimerManager.game(slot7).time(slot7) + 20 + 10 * math.random()
	end

	data.call_police_delay_t = slot6
	slot8 = data.unit
	slot9 = {
		is_default = true,
		type = "free",
		alert_data = alert_data
	}

	data.unit.brain(slot7).set_objective(slot7, data.unit.brain(slot7))

	return 
end
function CivilianLogicIdle.on_intimidated(data, amount, aggressor_unit)

	-- Decompilation error in this vicinity:
	slot5 = data.unit
	slot6 = false
	slot9 = managers.groupai
	slot11 = data.unit

	data.unit.movement(slot4).set_cool(slot4, data.unit.movement(slot4), managers.groupai.state(slot8).analyse_giveaway(slot8, data.unit.base(aggressor_unit)._tweak_table))

	slot5 = data.unit
	slot6 = (data.is_tied and "cbt") or "hos"

	data.unit.movement(slot4).set_stance(slot4, data.unit.movement(slot4))

	slot5 = data
	slot8 = aggressor_unit
	local att_obj_data, is_new = CopLogicBase.identify_attention_obj_instant(slot4, aggressor_unit.key(slot7))
	slot8 = aggressor_unit

	if not CivilianLogicIdle.is_obstructed(slot6, data) then
		return 
	end

	slot7 = data.unit
	slot8 = {
		type = "surrender",
		amount = amount,
		aggressor_unit = aggressor_unit
	}

	data.unit.brain(slot6).set_objective(slot6, data.unit.brain(slot6))

	return 
end
function CivilianLogicIdle.damage_clbk(data, damage_info)
	slot4 = data.unit
	slot5 = false
	slot8 = managers.groupai
	slot10 = data.unit

	data.unit.movement(slot3).set_cool(slot3, data.unit.movement(slot3), managers.groupai.state(slot7).analyse_giveaway(slot7, data.unit.base(damage_info.attacker_unit)._tweak_table))

	slot4 = data.unit
	slot5 = (data.is_tied and "cbt") or "hos"

	data.unit.movement(slot3).set_stance(slot3, data.unit.movement(slot3))

	slot5 = damage_info.attacker_unit

	if not CivilianLogicIdle.is_obstructed(slot3, data) then
		return 
	end

	slot4 = data.unit
	slot5 = {
		is_default = true,
		type = "free",
		dmg_info = damage_info
	}

	data.unit.brain(slot3).set_objective(slot3, data.unit.brain(slot3))

	return 
end
function CivilianLogicIdle.on_new_objective(data, old_objective)
	local new_objective = data.objective
	slot6 = old_objective

	CivilianLogicBase.update_follow_unit(slot4, data)

	local my_data = data.internal_data

	if new_objective then
		if new_objective.type == "escort" then
			slot7 = "escort"

			CopLogicBase._exit(slot5, data.unit)
		else
			slot7 = new_objective

			if CopLogicIdle._chk_objective_needs_travel(slot5, data) then
				slot7 = "travel"

				CopLogicBase._exit(slot5, data.unit)
			elseif new_objective.type == "act" then
				slot7 = "idle"

				CopLogicBase._exit(slot5, data.unit)
			elseif data.is_tied then
				slot7 = "surrender"

				CopLogicBase._exit(slot5, data.unit)
			elseif new_objective.type == "free" then
				slot6 = data.unit
				slot6 = data.unit.movement(slot5)

				if data.unit.movement(slot5).cool(slot5) or not new_objective.is_default then
					slot7 = "idle"

					CopLogicBase._exit(slot5, data.unit)
				else
					slot7 = "flee"

					CopLogicBase._exit(slot5, data.unit)
				end
			elseif new_objective.type == "surrender" then
				slot7 = "surrender"

				CopLogicBase._exit(slot5, data.unit)
			end
		end
	else
		slot6 = data.unit
		slot6 = data.unit.movement(slot5)

		if data.unit.movement(slot5).cool(slot5) then
			slot7 = "idle"

			CopLogicBase._exit(slot5, data.unit)
		elseif data.is_tied then
			slot7 = "surrender"

			CopLogicBase._exit(slot5, data.unit)
		else
			slot7 = "flee"

			CopLogicBase._exit(slot5, data.unit)
		end
	end

	if new_objective and new_objective.stance then
		if new_objective.stance == "ntl" then
			slot6 = data.unit
			slot7 = true

			data.unit.movement(slot5).set_cool(slot5, data.unit.movement(slot5))
		else
			slot6 = data.unit
			slot7 = false

			data.unit.movement(slot5).set_cool(slot5, data.unit.movement(slot5))
		end

		slot6 = data.unit
		slot7 = new_objective.stance

		data.unit.movement(slot5).set_stance(slot5, data.unit.movement(slot5))
	end

	if old_objective and old_objective.fail_clbk then
		slot6 = data.unit

		old_objective.fail_clbk(slot5)
	end

	return 
end
function CivilianLogicIdle.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action

	if action.type(slot4) == "turn" then
		my_data.turning = nil
	else
		slot5 = action

		if action.type(slot4) == "act" and my_data.acting == action then
			my_data.acting = nil
			slot5 = action

			if action.expired(slot4) then
				if not my_data.action_timeout_clbk_id then
					slot6 = data.objective

					data.objective_complete_clbk(slot4, data.unit)
				end
			else
				slot6 = data.objective

				data.objective_failed_clbk(slot4, data.unit)
			end
		end
	end

	return 
end
function CivilianLogicIdle._upd_detection(data)
	slot3 = managers.groupai
	slot4 = data.unit

	managers.groupai.state(slot2).on_unit_detection_updated(slot2, managers.groupai.state(slot2))

	slot3 = TimerManager
	data.t = TimerManager.game(slot2).time(slot2)
	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(TimerManager.game(slot2), data, nil)
	local new_attention, new_reaction = CivilianLogicIdle._get_priority_attention(data, data)
	slot9 = new_reaction

	CivilianLogicIdle._set_attention_obj(data.detected_attention_objects, data, new_attention)

	if new_reaction and AIAttentionObject.REACT_SCARED <= new_reaction then
		local objective = data.objective
		slot11 = new_attention
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(slot7, data, objective, nil)

		if allow_trans then
			local alert = {
				"vo_cbt",
				new_attention.m_head_pos,
				[5] = new_attention.unit
			}
			slot12 = alert

			CivilianLogicIdle.on_alert(slot10, data)

			if my_data ~= data.internal_data then
				return 
			end
		end
	else
		slot8 = my_data

		CopLogicBase._chk_focus_on_attention_object(slot6, data)
	end

	slot7 = data.unit
	slot7 = data.unit.movement(slot6)

	if not data.unit.movement(slot6).cool(slot6) then
	end

	slot7 = data

	if CopLogicBase._chk_relocate(slot6) then
		return 
	end

	slot11 = data.t + delay

	CopLogicBase.queue_task(slot6, my_data, my_data.detection_task_key, CivilianLogicIdle._upd_detection, data)

	return 
end
function CivilianLogicIdle.is_available_for_assignment(data, objective)

	-- Decompilation error in this vicinity:
	if objective and objective.forced then
		return true
	end

	local my_data = data.internal_data
end
function CivilianLogicIdle.anim_clbk(data, info_type)
	if info_type == "reset_attention" and data.internal_data.idle_attention then
		data.internal_data.idle_attention = nil
		slot4 = data

		CopLogicBase._reset_attention(nil)
	end

	return 
end
function CivilianLogicIdle.clbk_action_timeout(ignore_this, data)
	local my_data = data.internal_data
	slot6 = my_data.action_timeout_clbk_id

	CopLogicBase.on_delayed_clbk(slot4, my_data)

	my_data.action_timeout_clbk_id = nil
	local old_objective = data.objective

	if not old_objective then
		slot7 = "[CivilianLogicIdle.clbk_action_timeout] missing objective"

		debug_pause_unit(slot5, data.unit)

		return 
	end

	if my_data.delayed_alert_id then
		slot7 = my_data.delayed_alert_id

		managers.enemy.force_delayed_clbk(slot5, managers.enemy)
	end

	if data.objective == old_objective then
		slot7 = old_objective

		data.objective_complete_clbk(slot5, data.unit)
	end

	return 
end
function CivilianLogicIdle.is_obstructed(data, aggressor_unit)
	slot4 = data.unit
	slot5 = "walk"

	if data.unit.movement(slot3).chk_action_forbidden(slot3, data.unit.movement(slot3)) then
		slot4 = data.unit

		if not data.unit.anim_data(slot3).act_idle then
			return 
		end
	end

	local objective = data.objective

	if not objective or objective.is_default or ((objective.in_place or not objective.nav_seg) and not objective.action and not objective.action_duration) then
		return true
	end

	if objective.interrupt_dis == -1 then
		return true
	end

	if aggressor_unit then
		slot5 = aggressor_unit

		if aggressor_unit.movement(slot4) and objective.interrupt_dis then
			slot6 = data.m_pos
			slot9 = aggressor_unit
			slot9 = aggressor_unit.movement(slot8)

			if mvector3.distance_sq(slot5, aggressor_unit.movement(slot8).m_pos(slot8)) < objective.interrupt_dis * objective.interrupt_dis then
				return true
			end
		end
	end

	if objective.interrupt_health then
		slot5 = data.unit
		slot5 = data.unit.character_damage(slot4)
		local health_ratio = data.unit.character_damage(slot4).health_ratio(slot4)

		if health_ratio < 1 and health_ratio < objective.interrupt_health then
			return true
		end
	end

	return 
end
function CivilianLogicIdle._get_priority_attention(data, attention_objects)
	local best_target, best_target_priority, best_target_reaction = nil
	slot7 = attention_objects

	for u_key, attention_data in pairs(slot6) do
		local att_unit = attention_data.unit

		if not attention_data.identified then
		elseif attention_data.pause_expire_t then
			if attention_data.pause_expire_t < data.t then
				if not attention_data.settings.attract_chance or math.random() < attention_data.settings.attract_chance then
					attention_data.pause_expire_t = nil
				else
					slot15 = attention_data.settings.pause[2]
					attention_data.pause_expire_t = data.t + math.lerp(slot13, attention_data.settings.pause[1], math.random())
				end
			end
		elseif attention_data.stare_expire_t and attention_data.stare_expire_t < data.t then
			if attention_data.settings.pause then
				attention_data.stare_expire_t = nil
				slot15 = attention_data.settings.pause[2]
				attention_data.pause_expire_t = data.t + math.lerp(slot13, attention_data.settings.pause[1], math.random())
			end
		else
			local distance = attention_data.dis
			local reaction = attention_data.settings.reaction
			local reaction_too_mild = nil

			if not reaction or (best_target_reaction and reaction < best_target_reaction) then
				reaction_too_mild = true
			elseif distance < 150 and reaction == AIAttentionObject.REACT_IDLE then
				reaction_too_mild = true
			end

			if not reaction_too_mild then
				if data.current_attention and data.current_attention.u_key == u_key then
					distance = distance * 0.8
				end

				local target_priority = distance

				if not best_target_priority or target_priority < best_target_priority then
					best_target = attention_data
					best_target_reaction = reaction
					best_target_priority = target_priority
				end
			end
		end
	end

	return best_target, best_target_reaction
end
function CivilianLogicIdle._set_attention_obj(data, new_att_obj, new_reaction)
	local old_att_obj = data.attention_obj
	data.attention_obj = new_att_obj

	if new_att_obj then
		new_reaction = new_reaction or new_att_obj.settings.reaction
		new_att_obj.reaction = new_reaction
		local is_same_obj = nil

		if old_att_obj and old_att_obj.u_key == new_att_obj.u_key then
			is_same_obj = true

			if new_att_obj.stare_expire_t and new_att_obj.stare_expire_t < data.t then
				if new_att_obj.settings.pause then
					new_att_obj.stare_expire_t = nil
					slot9 = new_att_obj.settings.pause[2]
					new_att_obj.pause_expire_t = data.t + math.lerp(slot7, new_att_obj.settings.pause[1], math.random())
				end
			elseif new_att_obj.pause_expire_t and new_att_obj.pause_expire_t < data.t then
				if not new_att_obj.settings.attract_chance or math.random() < new_att_obj.settings.attract_chance then
					new_att_obj.pause_expire_t = nil
					slot9 = new_att_obj.settings.duration[2]
					new_att_obj.stare_expire_t = data.t + math.lerp(slot7, new_att_obj.settings.duration[1], math.random())
				else
					slot8 = "[CivilianLogicIdle._set_attention_obj] skipping attraction"

					debug_pause_unit(slot6, data.unit)

					slot9 = new_att_obj.settings.pause[2]
					new_att_obj.pause_expire_t = data.t + math.lerp(data.unit, new_att_obj.settings.pause[1], math.random())
				end
			end
		end

		if not is_same_obj and new_att_obj.settings.duration then
			slot9 = new_att_obj.settings.duration[2]
			new_att_obj.stare_expire_t = data.t + math.lerp(slot7, new_att_obj.settings.duration[1], math.random())
			new_att_obj.pause_expire_t = nil
		end
	end

	return 
end

return 
