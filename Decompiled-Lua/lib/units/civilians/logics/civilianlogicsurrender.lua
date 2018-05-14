-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
slot3 = CivilianLogicBase
CivilianLogicSurrender = class(slot2)
CivilianLogicSurrender.on_new_objective = CivilianLogicIdle.on_new_objective
CivilianLogicSurrender.on_rescue_allowed_state = CivilianLogicFlee.on_rescue_allowed_state
CivilianLogicSurrender.wants_rescue = CivilianLogicFlee.wants_rescue
function CivilianLogicSurrender.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit
	slot6 = data.unit.brain(slot5)

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	data.internal_data = my_data

	if data.is_tied then
		slot7 = managers.groupai
		slot11 = true

		managers.groupai.state(slot6).on_hostage_state(slot6, managers.groupai.state(slot6), true, data.key, nil)

		my_data.is_hostage = true
		slot7 = data.unit

		if data.unit.anim_data(slot6).drop then
			slot7 = data.unit
			slot9 = true

			data.unit.interaction(slot6).set_tweak_data(slot6, data.unit.interaction(slot6), "hostage_move")

			slot7 = data.unit
			slot9 = true

			data.unit.interaction(slot6).set_active(slot6, data.unit.interaction(slot6), true)
		end
	end

	slot7 = data.unit

	if data.unit.anim_data(slot6).drop then
		slot7 = data.unit

		if not data.unit.anim_data(slot6).tied then
			slot7 = data.unit
			slot9 = true

			data.unit.interaction(slot6).set_active(slot6, data.unit.interaction(slot6), true)

			my_data.interaction_active = true
		end
	end

	slot7 = TimerManager
	slot7 = TimerManager.game(slot6)
	my_data.state_enter_t = TimerManager.game(slot6).time(slot6)
	slot7 = data.unit

	if not data.unit.anim_data(slot6).move then
		slot7 = managers.groupai
		slot7 = managers.groupai.state(slot6)

		if managers.groupai.state(slot6).rescue_state(slot6) then
			slot7 = managers.groupai
			slot7 = managers.groupai.state(slot6)
			slot10 = data.unit
			slot10 = data.unit.movement(slot9)
			slot10 = data.unit.movement(slot9).nav_tracker(slot9)

			if managers.groupai.state(slot6).is_nav_seg_safe(slot6, data.unit.movement(slot9).nav_tracker(slot9).nav_segment(slot9)) then
				slot8 = my_data

				CivilianLogicFlee._add_delayed_rescue_SO(slot6, data)
			end
		end
	end

	local scare_max = data.char_tweak.scare_max
	slot9 = scare_max[2]
	my_data.scare_max = math.lerp(slot7, scare_max[1], math.random())
	local submission_max = data.char_tweak.submission_max
	slot10 = submission_max[2]
	my_data.submission_max = math.lerp(scare_max[1], submission_max[1], math.random())
	my_data.scare_meter = 0
	my_data.submission_meter = 0
	my_data.last_upd_t = data.t
	my_data.nr_random_screams = 0
	my_data.vision = data.char_tweak.vision
	data.run_away_next_chk_t = nil
	slot9 = data.unit
	slot10 = false

	data.unit.brain(scare_max[1]).set_update_enabled_state(scare_max[1], data.unit.brain(scare_max[1]))

	slot9 = data.unit
	slot10 = false

	data.unit.movement(scare_max[1]).set_allow_fire(scare_max[1], data.unit.movement(scare_max[1]))

	slot9 = managers.groupai
	slot10 = data.unit
	slot16 = data

	managers.groupai.state(scare_max[1]).add_to_surrendered(scare_max[1], managers.groupai.state(scare_max[1]), callback(slot12, CivilianLogicSurrender, CivilianLogicSurrender, "queued_update"))

	my_data.surrender_clbk_registered = true
	slot9 = data.unit
	slot10 = (data.is_tied and "cbt") or "hos"

	data.unit.movement(scare_max[1]).set_stance(slot8, data.unit.movement(scare_max[1]))

	slot9 = data.unit
	slot10 = false

	data.unit.movement(slot8).set_cool(slot8, data.unit.movement(slot8))

	if my_data ~= data.internal_data then
		return 
	end

	local attention_settings = nil
	attention_settings = {
		"civ_enemy_cbt",
		"civ_civ_cbt",
		"civ_murderer_cbt"
	}
	slot10 = data.unit
	slot11 = attention_settings

	data.unit.brain(slot9).set_attention_settings(slot9, data.unit.brain(slot9))

	if not data.been_outlined and data.char_tweak.outline_on_discover then
		slot11 = data.key
		my_data.outline_detection_task_key = "CivilianLogicIdle._upd_outline_detection" .. tostring(slot10)
		slot14 = data.t + 2

		CopLogicBase.queue_task(tostring(slot10), my_data, my_data.outline_detection_task_key, CivilianLogicIdle._upd_outline_detection, data)
	end

	if data.objective and data.objective.aggressor_unit then
		if not data.objective.initial_act then
			slot13 = true

			CivilianLogicSurrender.on_intimidated(slot9, data, data.objective.amount, data.objective.aggressor_unit)
		else
			if data.objective.initial_act == "halt" then
				slot10 = managers.groupai
				slot12 = data.unit

				managers.groupai.state(slot9).register_fleeing_civilian(slot9, managers.groupai.state(slot9), data.key)
			end

			slot13 = data.objective.initial_act

			CivilianLogicSurrender._do_initial_act(slot9, data, data.objective.amount, data.objective.aggressor_unit)
		end
	end

	return 
end
function CivilianLogicSurrender.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot7 = my_data

	CivilianLogicFlee._unregister_rescue_SO(data, data)

	slot6 = managers.groupai
	slot7 = data.key

	managers.groupai.state(data).unregister_fleeing_civilian(data, managers.groupai.state(data))

	if new_logic_name ~= "inactive" then
		slot6 = data.unit
		slot8 = 21

		data.unit.base(slot5).set_slot(slot5, data.unit.base(slot5), data.unit)
	end

	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(slot5)

	if new_logic_name ~= "trade" and my_data.interaction_active then
		slot6 = data.unit
		slot8 = true

		data.unit.interaction(slot5).set_active(slot5, data.unit.interaction(slot5), false)

		my_data.interaction_active = nil

		if data.has_outline then
			slot6 = data.unit
			slot7 = "highlight"

			data.unit.contour(slot5).add(slot5, data.unit.contour(slot5))
		end
	end

	if my_data.surrender_clbk_registered then
		slot6 = managers.groupai
		slot7 = data.unit

		managers.groupai.state(slot5).remove_from_surrendered(slot5, managers.groupai.state(slot5))
	end

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(slot5)

	if my_data.is_hostage then
		slot6 = managers.groupai
		slot10 = true

		managers.groupai.state(slot5).on_hostage_state(slot5, managers.groupai.state(slot5), false, data.key, nil)

		my_data.is_hostage = nil
	end

	slot6 = data

	CopLogicBase._reset_attention(slot5)

	if my_data.enemy_weapons_hot_listen_id then
		slot6 = managers.groupai
		slot7 = my_data.enemy_weapons_hot_listen_id

		managers.groupai.state(slot5).remove_listener(slot5, managers.groupai.state(slot5))
	end

	return 
end
function CivilianLogicSurrender.queued_update(rubbish, data)
	local my_data = data.internal_data
	slot6 = my_data

	CivilianLogicSurrender._update_enemy_detection(slot4, data)

	if my_data.submission_meter == 0 and not data.is_tied then
		slot5 = data.unit
	else
		slot6 = my_data

		CivilianLogicFlee._chk_add_delayed_rescue_SO(slot4, data)

		slot5 = managers.groupai
		slot6 = data.unit
		slot12 = data

		managers.groupai.state(slot4).add_to_surrendered(slot4, managers.groupai.state(slot4), callback(slot8, CivilianLogicSurrender, CivilianLogicSurrender, "queued_update"))
	end

	slot5 = data

	if CopLogicBase._chk_relocate(slot4) then
		return 
	end

	return 
end
function CivilianLogicSurrender.on_tied(data, aggressor_unit, not_tied)
	local my_data = data.internal_data

	if data.is_tied then
		return 
	end

	if not_tied then
		if data.has_outline then
			slot6 = data.unit
			slot7 = "highlight"

			data.unit.contour(slot5).remove(slot5, data.unit.contour(slot5))

			data.has_outline = nil
		end

		slot6 = data.unit
		slot6 = data.unit.inventory(slot5)

		data.unit.inventory(slot5).destroy_all_items(slot5)

		if my_data.interaction_active then
			slot6 = data.unit
			slot8 = true

			data.unit.interaction(slot5).set_active(slot5, data.unit.interaction(slot5), false)

			my_data.interaction_active = nil
		end

		slot6 = data.unit
		slot6 = data.unit.character_damage(slot5)

		data.unit.character_damage(slot5).drop_pickup(slot5)

		slot6 = data.unit
		slot7 = nil

		data.unit.character_damage(slot5).set_pickup(slot5, data.unit.character_damage(slot5))
	else
		local action_data = {
			variant = "tied",
			body_part = 1,
			type = "act",
			blocks = {
				heavy_hurt = -1,
				hurt_sick = -1,
				hurt = -1,
				light_hurt = -1,
				walk = -1
			}
		}
		slot7 = data.unit
		slot8 = action_data
		local action_res = data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))

		if action_res then
			slot8 = managers.groupai

			managers.groupai.state(slot7).on_hostage_state(slot7, managers.groupai.state(slot7), true, data.key, nil)

			my_data.is_hostage = true
			data.is_tied = true
			slot8 = data.unit
			slot9 = "hostage_move"

			data.unit.interaction(slot7).set_tweak_data(slot7, data.unit.interaction(slot7))

			slot8 = data.unit
			slot10 = true

			data.unit.interaction(slot7).set_active(slot7, data.unit.interaction(slot7), true)

			if data.has_outline then
				slot8 = data.unit
				slot9 = "highlight"

				data.unit.contour(slot7).remove(slot7, data.unit.contour(slot7))

				data.has_outline = nil
			end

			slot8 = data.unit
			slot8 = data.unit.inventory(slot7)

			data.unit.inventory(slot7).destroy_all_items(slot7)

			slot8 = managers.groupai
			slot8 = managers.groupai.state(slot7)
			slot11 = data.unit

			managers.groupai.state(slot7).on_civilian_tied(slot7, data.unit.key(slot10))

			slot8 = data.unit
			slot10 = 22

			data.unit.base(slot7).set_slot(slot7, data.unit.base(slot7), data.unit)

			slot8 = data.unit

			if data.unit.movement(slot7) then
				slot8 = data.unit
				slot8 = data.unit.movement(slot7)

				data.unit.movement(slot7).remove_giveaway(slot7)
			end

			if my_data.interaction_active then
				slot8 = data.unit
				slot10 = true

				data.unit.interaction(slot7).set_active(slot7, data.unit.interaction(slot7), false)

				my_data.interaction_active = nil
			end

			slot8 = data.unit
			slot8 = data.unit.character_damage(slot7)

			data.unit.character_damage(slot7).drop_pickup(slot7)

			slot8 = data.unit
			slot9 = nil

			data.unit.character_damage(slot7).set_pickup(slot7, data.unit.character_damage(slot7))

			slot8 = data.unit

			if data.unit.unit_data(slot7).mission_element then
				slot8 = data.unit
				slot10 = data.unit

				data.unit.unit_data(slot7).mission_element.event(slot7, data.unit.unit_data(slot7).mission_element, "tied")
			end

			slot9 = my_data

			CivilianLogicFlee._chk_add_delayed_rescue_SO(slot7, data)

			slot8 = managers.groupai
			slot11 = nil

			managers.groupai.state(slot7).on_criminal_suspicion_progress(slot7, managers.groupai.state(slot7), nil, data.unit)
		end
	end

	return 
end
function CivilianLogicSurrender._do_initial_act(data, amount, aggressor_unit, initial_act)
	local my_data = data.internal_data
	local adj_sumbission = amount * data.char_tweak.submission_intimidate
	slot9 = my_data.submission_meter + adj_sumbission
	my_data.submission_meter = math.min(slot7, my_data.submission_max)
	local adj_scare = amount * data.char_tweak.scare_intimidate
	slot10 = my_data.scare_meter + adj_scare
	my_data.scare_meter = math.max(my_data.submission_max, 0)
	local action_data = {
		clamp_to_graph = true,
		body_part = 1,
		type = "act",
		variant = initial_act
	}
	slot10 = data.unit
	slot11 = action_data

	data.unit.brain(0).action_request(0, data.unit.brain(0))

	return 
end
function CivilianLogicSurrender.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action
	local action_type = action.type(slot4)

	if action_type == "act" and my_data.interaction_active then
		slot6 = data.unit
		slot8 = true

		data.unit.interaction(slot5).set_active(slot5, data.unit.interaction(slot5), false)

		my_data.interaction_active = nil
	end

	return 
end
function CivilianLogicSurrender.on_intimidated(data, amount, aggressor_unit, skip_delay)

	-- Decompilation error in this vicinity:
	if data.is_tied then
		return 
	end

	slot7 = data.unit
	local my_data = data.internal_data

	if not my_data.delayed_intimidate_id or not my_data.delayed_clbks or not my_data.delayed_clbks[my_data.delayed_intimidate_id] then
		if skip_delay then
			slot8 = {
				data,
				amount,
				aggressor_unit
			}

			CivilianLogicSurrender._delayed_intimidate_clbk(slot6, nil)
		else
			slot10 = data.unit
			my_data.delayed_intimidate_id = "intimidate" .. tostring(data.unit.key(slot9))
			slot8 = 1 - amount
			local delay = math.max(tostring(data.unit.key(slot9)), 0) + math.random() * 0.2
			slot15 = {
				data,
				amount,
				aggressor_unit
			}
			slot13 = TimerManager
			slot13 = TimerManager.game(CivilianLogicSurrender)
			slot11 = TimerManager.game(CivilianLogicSurrender).time(CivilianLogicSurrender) + delay

			CopLogicBase.add_delayed_clbk(0, my_data, my_data.delayed_intimidate_id, callback(slot11, CivilianLogicSurrender, CivilianLogicSurrender, "_delayed_intimidate_clbk"))
		end
	end

	return 
end
function CivilianLogicSurrender._delayed_intimidate_clbk(ignore_this, params)
	local data = params[1]
	local my_data = data.internal_data

	if my_data.delayed_intimidate_id then
		slot7 = my_data.delayed_intimidate_id

		CopLogicBase.on_delayed_clbk(slot5, my_data)

		my_data.delayed_intimidate_id = nil
	end

	slot6 = data.unit
	slot7 = "walk"

	if data.unit.movement(slot5).chk_action_forbidden(slot5, data.unit.movement(slot5)) then
		return 
	end

	local amount = params[2]
	slot7 = data.unit
	local anim_data = data.unit.anim_data(slot6)
	local adj_sumbission = amount * data.char_tweak.submission_intimidate
	slot10 = my_data.submission_meter + adj_sumbission
	my_data.submission_meter = math.min(slot8, my_data.submission_max)
	local adj_scare = amount * data.char_tweak.scare_intimidate
	slot11 = my_data.scare_meter + adj_scare
	my_data.scare_meter = math.max(my_data.submission_max, 0)

	if not anim_data.drop then
		if anim_data.react_enter and not anim_data.idle then
		elseif anim_data.react or anim_data.panic or anim_data.halt then
			local action_data = {
				clamp_to_graph = true,
				body_part = 1,
				type = "act",
				variant = (anim_data.move and "halt") or "drop"
			}
			slot11 = data.unit
			slot12 = action_data
			local action_res = data.unit.brain(slot10).action_request(slot10, data.unit.brain(slot10))

			if action_res and action_data.variant == "drop" then
				slot12 = managers.groupai
				slot13 = data.key

				managers.groupai.state(slot11).unregister_fleeing_civilian(slot11, managers.groupai.state(slot11))

				slot12 = data.unit
				slot13 = "intimidate"

				data.unit.interaction(slot11).set_tweak_data(slot11, data.unit.interaction(slot11))

				slot12 = data.unit
				slot14 = true

				data.unit.interaction(slot11).set_active(slot11, data.unit.interaction(slot11), true)

				my_data.interaction_active = true
			end
		else
			local action_data = {
				clamp_to_graph = true,
				variant = "panic",
				body_part = 1,
				type = "act"
			}
			slot11 = data.unit
			slot12 = action_data

			data.unit.brain(slot10).action_request(slot10, data.unit.brain(slot10))

			slot11 = data.unit
			slot13 = true

			data.unit.sound(slot10).say(slot10, data.unit.sound(slot10), "a02x_any")

			slot11 = data.unit

			if data.unit.unit_data(slot10).mission_element then
				slot11 = data.unit
				slot13 = data.unit

				data.unit.unit_data(slot10).mission_element.event(slot10, data.unit.unit_data(slot10).mission_element, "panic")
			end

			slot11 = managers.groupai
			slot11 = managers.groupai.state(slot10)

			if not managers.groupai.state(slot10).enemy_weapons_hot(slot10) then
				local alert = {
					"vo_distress",
					nil,
					200
				}
				slot12 = data.unit
				slot12 = data.unit.movement(slot11)
				alert[2] = data.unit.movement(slot11).m_head_pos(slot11)
				alert[4] = data.SO_access
				alert[5] = data.unit
				slot12 = managers.groupai
				slot13 = alert

				managers.groupai.state(slot11).propagate_alert(slot11, managers.groupai.state(slot11))
			end
		end
	end

	return 
end
function CivilianLogicSurrender.on_alert(data, alert_data)
	local alert_type = alert_data[1]

	if alert_type ~= "aggression" and alert_type ~= "bullet" and alert_type ~= "explosion" then
		return 
	end

	local anim_data = data.unit.anim_data(slot4)
	slot6 = alert_data[1]

	if CopLogicBase.is_alert_aggressive(data.unit) then
		local aggressor = alert_data[5]

		if aggressor then
			slot7 = aggressor

			if aggressor.base(slot6) then
				local is_intimidation = nil
				slot8 = aggressor

				if aggressor.base(slot7).is_local_player then
					slot10 = "civ_calming_alerts"

					if managers.player.has_category_upgrade(slot7, managers.player, "player") then
						is_intimidation = true
					end
				else
					slot8 = aggressor

					if aggressor.base(slot7).is_husk_player then
						slot8 = aggressor
						slot10 = "civ_calming_alerts"

						if aggressor.base(slot7).upgrade_value(slot7, aggressor.base(slot7), "player") then
							is_intimidation = true
						end
					end
				end

				if is_intimidation and not data.is_tied then
					slot8 = data.unit
					slot10 = aggressor

					data.unit.brain(slot7).on_intimidated(slot7, data.unit.brain(slot7), 1)

					return 
				end
			end
		end
	end

	slot6 = TimerManager
	slot6 = TimerManager.game(slot5)
	data.t = TimerManager.game(slot5).time(slot5)
	slot6 = alert_data[1]

	if not CopLogicBase.is_alert_dangerous(slot5) then
		return 
	end

	local my_data = data.internal_data
	local scare_modifier = data.char_tweak.scare_shot

	if anim_data.halt or anim_data.react or anim_data.stand then
		scare_modifier = scare_modifier * 4
	end

	slot9 = my_data.scare_meter + scare_modifier
	my_data.scare_meter = math.min(slot7, my_data.scare_max)

	if my_data.scare_meter == my_data.scare_max and 5 < data.t - my_data.state_enter_t then
		slot8 = data.unit
		slot10 = true

		data.unit.sound(slot7).say(slot7, data.unit.sound(slot7), "a01x_any")

		if data.is_tied or not my_data.inside_intimidate_aura then
			if data.is_tied then
				if anim_data.stand then
					slot8 = data.unit
					slot10 = "stay"

					data.unit.brain(slot7).on_hostage_move_interaction(slot7, data.unit.brain(slot7), alert_data[5])
				end
			else
				slot8 = data.unit
				slot9 = {
					is_default = true,
					type = "free",
					alert_data = clone(slot11)
				}
				slot12 = alert_data

				data.unit.brain(slot7).set_objective(slot7, data.unit.brain(slot7))
			end
		end
	else
		slot8 = data.unit
		slot8 = data.unit.sound(slot7)
		slot11 = TimerManager
		slot11 = TimerManager.game(slot10)

		if not data.unit.sound(slot7).speaking(slot7, TimerManager.game(slot10).time(slot10)) then
			local rand = math.random()
			slot10 = alert_data[2]
			local alert_dis_sq = mvector3.distance_sq(slot8, data.m_pos)
			local max_scare_dis_sq = 4000000

			if alert_dis_sq < max_scare_dis_sq then
				slot15 = alert_dis_sq
				slot13 = math.min(slot14) / 4000000
				rand = math.lerp(slot10, rand, rand * 2)
				local scare_mul = (max_scare_dis_sq - alert_dis_sq) / max_scare_dis_sq
				local max_nr_random_screams = 8
				slot15 = my_data.nr_random_screams / max_nr_random_screams
				scare_mul = scare_mul * math.lerp(rand * 2, 1, 0.3)
				local chance_voice_1 = 0.3 * scare_mul
				local chance_voice_2 = 0.3 * scare_mul

				if data.char_tweak.female then
					chance_voice_1 = chance_voice_1 * 1.2
					chance_voice_2 = chance_voice_2 * 1.2
				end

				if rand < chance_voice_1 then
					slot15 = data.unit
					slot17 = true

					data.unit.sound(slot14).say(slot14, data.unit.sound(slot14), "a01x_any")

					slot16 = max_nr_random_screams
					my_data.nr_random_screams = math.min(slot14, my_data.nr_random_screams + 1)
				elseif rand < chance_voice_1 + chance_voice_2 then
					slot15 = data.unit
					slot17 = true

					data.unit.sound(slot14).say(slot14, data.unit.sound(slot14), "a02x_any")

					slot16 = max_nr_random_screams
					my_data.nr_random_screams = math.min(slot14, my_data.nr_random_screams + 1)
				end
			end
		end
	end

	return 
end
function CivilianLogicSurrender._update_enemy_detection(data, my_data)
	slot4 = managers.groupai

	managers.groupai.state(slot3).on_unit_detection_updated(slot3, managers.groupai.state(slot3))

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local t = TimerManager.game(slot3).time(slot3)
	local delta_t = t - my_data.last_upd_t
	slot6 = data.unit
	local my_pos = data.unit.movement(data.unit).m_head_pos(data.unit)
	slot7 = managers.groupai
	slot7 = managers.groupai.state(data.unit.movement(data.unit))
	local enemies = managers.groupai.state(data.unit.movement(data.unit)).all_criminals(data.unit.movement(data.unit))
	visible, closest_dis, closest_enemy, my_data.inside_intimidate_aura = nil
	slot11 = data.unit
	slot11 = data.unit.movement(slot10)
	local my_tracker = data.unit.movement(slot10).nav_tracker(slot10)
	local chk_vis_func = my_tracker.check_visibility
	slot13 = enemies

	for e_key, u_data in pairs(slot12) do
		if not u_data.is_deployable then
			slot19 = u_data.tracker

			if chk_vis_func(slot17, my_tracker) then
				local enemy_unit = u_data.unit
				local enemy_pos = u_data.m_det_pos
				local my_vec = tmp_vec1
				slot23 = my_pos
				local dis = mvector3.direction(slot20, my_vec, enemy_pos)
				local inside_aura = nil
				slot23 = u_data.unit

				if u_data.unit.base(enemy_pos).is_local_player then
					slot25 = "intimidate_aura"

					if managers.player.has_category_upgrade(slot22, managers.player, "player") then
						slot26 = 0

						if dis < managers.player.upgrade_value(slot22, managers.player, "player", "intimidate_aura") then
							inside_aura = true
						end
					end
				else
					slot23 = u_data.unit

					if u_data.unit.base(slot22).is_husk_player then
						slot23 = u_data.unit
						slot25 = "intimidate_aura"

						if u_data.unit.base(slot22).upgrade_value(slot22, u_data.unit.base(slot22), "player") then
							slot23 = u_data.unit
							slot25 = "intimidate_aura"

							if dis < u_data.unit.base(slot22).upgrade_value(slot22, u_data.unit.base(slot22), "player") then
								inside_aura = true
							end
						end
					end
				end

				if (inside_aura or dis < 700) and (not closest_dis or dis < closest_dis) then
					closest_dis = dis
					closest_enemy = enemy_unit
				end

				if inside_aura then
					my_data.inside_intimidate_aura = true
				elseif dis < 700 then
					slot23 = enemy_unit
					slot23 = enemy_unit.movement(slot22)
					local look_dir = enemy_unit.movement(slot22).m_head_rot(slot22).y(slot22)
					slot25 = look_dir

					if 0.65 < mvector3.dot(enemy_unit.movement(slot22).m_head_rot(slot22), my_vec) then
						visible = true
					end
				end
			end
		end
	end

	slot13 = data.unit
	slot13 = data.unit.movement(slot12)
	local attention = data.unit.movement(slot12).attention(slot12)
	local attention_unit = (attention and attention.unit) or nil

	if not attention_unit then
		if closest_enemy and closest_dis < 700 then
			slot15 = data.unit

			if data.unit.anim_data(slot14).ik_type then
				slot16 = closest_enemy

				CopLogicBase._set_attention_on_unit(slot14, data)
			end
		end
	else
		slot15 = my_pos
		slot18 = attention_unit
		slot18 = attention_unit.movement(slot17)
	end

	if my_data.inside_intimidate_aura then
		my_data.submission_meter = my_data.submission_max
	elseif visible then
		slot16 = my_data.submission_meter + delta_t
		my_data.submission_meter = math.min(slot14, my_data.submission_max)
	else
		slot16 = my_data.submission_meter - delta_t
		my_data.submission_meter = math.max(slot14, 0)
	end

	slot15 = managers.groupai
	slot15 = managers.groupai.state(slot14)

	if managers.groupai.state(slot14).rescue_state(slot14) then
		slot15 = managers.groupai
		slot15 = managers.groupai.state(slot14)
		slot18 = data.unit
		slot18 = data.unit.movement(slot17)
		slot18 = data.unit.movement(slot17).nav_tracker(slot17)

		if managers.groupai.state(slot14).is_nav_seg_safe(slot14, data.unit.movement(slot17).nav_tracker(slot17).nav_segment(slot17)) and not my_data.rescue_active then
			slot16 = my_data

			CivilianLogicFlee._add_delayed_rescue_SO(slot14, data)
		end
	elseif my_data.rescue_active then
		slot16 = my_data

		CivilianLogicFlee._unregister_rescue_SO(slot14, data)
	end

	slot16 = my_data.scare_meter - delta_t
	my_data.scare_meter = math.max(slot14, 0)
	my_data.last_upd_t = t

	return 
end
function CivilianLogicSurrender.is_available_for_assignment(data, objective)
	if objective and objective.forced then
		return true
	end

	slot4 = data.unit

	return not data.unit.anim_data(slot3).tied and ((objective and objective.type == "revive") or (5 < data.t - data.internal_data.state_enter_t and data.internal_data.submission_meter / data.internal_data.submission_max < 0.95))
end

return 
