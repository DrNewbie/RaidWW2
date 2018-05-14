-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
slot3 = CopLogicBase
CopLogicIntimidated = class(slot2)
function CopLogicIntimidated.enter(data, new_logic_name, enter_params)
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
	my_data.detection = data.char_tweak.detection.combat
	my_data.vision = data.char_tweak.vision.combat
	my_data.aggressor_unit = enter_params and enter_params.aggressor_unit

	if data.attention_obj then
		CopLogicBase._set_attention_obj(slot6, data, nil)
	end

	if data.char_tweak.surrender_break_time then
		slot9 = data.char_tweak.surrender_break_time[2]
		slot5 = data.t + math.random(slot7, data.char_tweak.surrender_break_time[1], math.random())
	end

	my_data.surrender_break_t = slot5
	slot7 = data.unit

	if data.unit.anim_data(slot6).hands_tied then
		slot8 = nil

		CopLogicIntimidated._do_tied(slot6, data)
	else
		slot7 = data.unit
		slot8 = true

		data.unit.brain(slot6).set_update_enabled_state(slot6, data.unit.brain(slot6))
	end

	slot7 = data.unit
	slot8 = false

	data.unit.movement(slot6).set_allow_fire(slot6, data.unit.movement(slot6))

	if data.objective then
		slot8 = data.objective

		data.objective_failed_clbk(slot6, data.unit)
	end

	slot7 = managers.groupai
	slot7 = managers.groupai.state(slot6)

	if managers.groupai.state(slot6).rescue_state(slot6) then
		slot8 = my_data

		CopLogicIntimidated._add_delayed_rescue_SO(slot6, data)
	end

	slot7 = managers.groupai
	slot8 = data.unit
	slot14 = data

	managers.groupai.state(slot6).add_to_surrendered(slot6, managers.groupai.state(slot6), callback(slot10, CopLogicIntimidated, CopLogicIntimidated, "queued_update"))

	my_data.surrender_clbk_registered = true
	slot7 = data.unit
	slot9 = true

	data.unit.sound(slot6).say(slot6, data.unit.sound(slot6), "s01x")

	slot7 = data.unit
	slot8 = false

	data.unit.movement(slot6).set_cool(slot6, data.unit.movement(slot6))

	if my_data ~= data.internal_data then
		return 
	end

	slot7 = data.unit
	slot8 = {
		corpse_sneak = true
	}

	data.unit.brain(slot6).set_attention_settings(slot6, data.unit.brain(slot6))

	slot7 = managers.groupai
	slot9 = nil

	managers.groupai.state(slot6).register_rescueable_hostage(slot6, managers.groupai.state(slot6), data.unit)

	my_data.is_hostage = true
	slot7 = managers.groupai
	slot10 = true

	managers.groupai.state(slot6).on_hostage_state(slot6, managers.groupai.state(slot6), true, data.key)

	return 
end
function CopLogicIntimidated.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot7 = my_data

	CopLogicIntimidated._unregister_rescue_SO(data, data)

	if new_logic_name ~= "inactive" then
		slot6 = data.unit
		slot8 = 12

		data.unit.base(slot5).set_slot(slot5, data.unit.base(slot5), data.unit)
	end

	if new_logic_name ~= "inactive" then
		slot6 = data.unit
		slot7 = true

		data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))

		slot6 = data.unit
		slot9 = false

		data.unit.interaction(slot5).set_active(slot5, data.unit.interaction(slot5), false, true)
	end

	if my_data.tied then
		slot6 = managers.groupai
		slot6 = managers.groupai.state(slot5)
		slot9 = data.unit

		managers.groupai.state(slot5).on_enemy_untied(slot5, data.unit.key(slot8))
	end

	slot6 = managers.groupai
	slot7 = data.key

	managers.groupai.state(slot5).unregister_rescueable_hostage(slot5, managers.groupai.state(slot5))

	slot7 = my_data

	CopLogicIntimidated._unregister_harassment_SO(slot5, data)

	if my_data.surrender_clbk_registered then
		slot6 = managers.groupai
		slot7 = data.unit

		managers.groupai.state(slot5).remove_from_surrendered(slot5, managers.groupai.state(slot5))
	end

	if my_data.is_hostage then
		slot6 = managers.groupai
		slot9 = true

		managers.groupai.state(slot5).on_hostage_state(slot5, managers.groupai.state(slot5), false, data.key)
	end

	return 
end
function CopLogicIntimidated.death_clbk(data, damage_info)
	slot5 = damage_info

	CopLogicIntimidated.super.death_clbk(slot3, data)

	return 
end
function CopLogicIntimidated.queued_update(rubbish, data)
	local my_data = data.internal_data
	slot6 = my_data

	CopLogicIntimidated._update_enemy_detection(slot4, data)

	if my_data ~= data.internal_data then
		return 
	end

	slot5 = managers.groupai
	slot6 = data.unit
	slot12 = data

	managers.groupai.state(slot4).add_to_surrendered(slot4, managers.groupai.state(slot4), callback(slot8, CopLogicIntimidated, CopLogicIntimidated, "queued_update"))

	return 
end
function CopLogicIntimidated._update_enemy_detection(data, my_data)
	slot4 = managers.groupai
	local robbers = managers.groupai.state(slot3).all_criminals(slot3)
	slot5 = data.unit
	slot5 = data.unit.movement(managers.groupai.state(slot3))
	local my_tracker = data.unit.movement(managers.groupai.state(slot3)).nav_tracker(managers.groupai.state(slot3))
	local chk_vis_func = my_tracker.check_visibility
	local fight = not my_data.tied

	if not my_data.surrender_break_t or data.t < my_data.surrender_break_t then
		slot8 = robbers

		for u_key, u_data in pairs(slot7) do
			if not u_data.is_deployable then
				slot14 = u_data.tracker

				if chk_vis_func(slot12, my_tracker) then
					local crim_unit = u_data.unit
					local crim_pos = u_data.m_pos
					slot17 = crim_pos
					local dis = mvector3.direction(slot14, tmp_vec1, data.m_pos)

					if dis < tweak_data.player.long_dis_interaction.intimidate_range_enemies * tweak_data.upgrades.values.player.intimidate_range_mul[1] * 1.05 then
						slot16 = crim_unit
						slot16 = crim_unit.movement(slot15)
						local crim_fwd = crim_unit.movement(slot15).m_head_rot(slot15).y(slot15)
						slot18 = 0

						mvector3.set_z(crim_unit.movement(slot15).m_head_rot(slot15), crim_fwd)

						slot17 = crim_fwd

						mvector3.normalize(crim_unit.movement(slot15).m_head_rot(slot15))

						slot18 = tmp_vec1

						if mvector3.dot(crim_unit.movement(slot15).m_head_rot(slot15), crim_fwd) < -0.2 then
							slot21 = data.unit
							slot21 = data.unit.movement(slot20)
							slot25 = "report"
							local vis_ray = World.raycast(slot16, World, "ray", data.unit.movement(slot20).m_head_pos(slot20), u_data.m_det_pos, "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

							if not vis_ray then
								fight = nil

								break
							end
						end
					end
				end
			end
		end
	end

	if fight then
		my_data.surrender_clbk_registered = nil
		slot9 = nil

		data.brain.set_objective(slot7, data.brain)

		slot9 = "idle"

		CopLogicBase._exit(slot7, data.unit)

		local new_action = {
			variant = "idle",
			body_part = 1,
			type = "act"
		}
		slot10 = {
			scan = true,
			type = "free",
			action = new_action
		}

		data.brain.set_objective(data.unit, data.brain)
	end

	return 
end
function CopLogicIntimidated.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action
	local action_type = action.type(slot4)

	if action_type == "act" then
		if my_data.being_harassed then
			my_data.being_harassed = nil
			slot7 = my_data

			CopLogicIntimidated._add_delayed_rescue_SO(slot5, data)
		elseif my_data.act_action then
			my_data.act_action = nil
		end
	end

	slot6 = data.unit
	slot7 = true

	data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))

	return 
end
function CopLogicIntimidated.update(data)
	slot3 = data.unit

	if data.unit.anim_data(slot2).surrender then
		return 
	end

	slot3 = data.unit
	slot4 = "walk"

	if not data.unit.movement(slot2).chk_action_forbidden(slot2, data.unit.movement(slot2)) then
		slot3 = data

		CopLogicIntimidated._start_action_hands_up(slot2)

		slot3 = data.unit
		slot4 = false

		data.unit.brain(slot2).set_update_enabled_state(slot2, data.unit.brain(slot2))
	end

	return 
end
function CopLogicIntimidated.can_activate()
	return false
end
function CopLogicIntimidated.on_intimidated(data, amount, aggressor_unit)
	local my_data = data.internal_data

	if not my_data.tied then
		if data.char_tweak.surrender_break_time then
			slot8 = data.char_tweak.surrender_break_time[2]
			slot4 = data.t + math.random(slot6, data.char_tweak.surrender_break_time[1], math.random())
		end

		my_data.surrender_break_t = slot4
		slot6 = data.unit
		local anim_data = data.unit.anim_data(slot5)
		local anim, blocks = nil

		if anim_data.hands_up then
			anim = "hands_back"
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				light_hurt = -1,
				walk = -1
			}
		elseif anim_data.hands_back then
			anim = "tied"
			blocks = {
				heavy_hurt = -1,
				hurt_sick = -1,
				action = -1,
				light_hurt = -1,
				hurt = -1,
				walk = -1
			}
		else
			slot9 = managers.groupai
			slot9 = managers.groupai.state(slot8)

			if managers.groupai.state(slot8).whisper_mode(slot8) then
				anim = "tied_all_in_one"
			else
				anim = "hands_up"
			end

			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				light_hurt = -1,
				walk = -1
			}
		end

		local action_data = {
			clamp_to_graph = true,
			type = "act",
			body_part = 1,
			variant = anim,
			blocks = blocks
		}
		slot10 = data.unit
		slot11 = action_data
		local act_action = data.unit.brain(slot9).action_request(slot9, data.unit.brain(slot9))
		slot11 = data.unit

		if data.unit.anim_data(data.unit.brain(slot9)).hands_tied then
			slot12 = aggressor_unit

			CopLogicIntimidated._do_tied(slot10, data)
		end
	end

	return 
end
function CopLogicIntimidated._register_harassment_SO(data, my_data)
	slot5 = data.unit
	slot5 = data.unit.rotation(data.unit)
	local objective_pos = data.unit.position(slot3) - data.unit.rotation(data.unit).y(data.unit) * 100
	slot5 = data.unit
	local objective_rot = data.unit.rotation(data.unit)
	local objective = {
		stance = "hos",
		interrupt_health = 0.85,
		type = "act",
		scan = true,
		interrupt_dis = 700,
		pos = objective_pos,
		rot = objective_rot
	}
	slot7 = data.unit
	slot7 = data.unit.movement(slot6)
	slot7 = data.unit.movement(slot6).nav_tracker(slot6)
	objective.nav_seg = data.unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6)
	slot10 = data
	objective.action_start_clbk = callback(slot6, CopLogicIntimidated, CopLogicIntimidated, "on_harassment_SO_action_start")
	slot10 = data
	objective.fail_clbk = callback(slot6, CopLogicIntimidated, CopLogicIntimidated, "on_harassment_SO_failed")
	objective.action = {
		variant = "kick_fwd",
		body_part = 1,
		type = "act",
		blocks = {
			action = -1,
			walk = -1
		}
	}
	local so_descriptor = {
		interval = 10,
		search_dis_sq = 2250000,
		AI_group = "friendlies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective
	}
	slot8 = data.m_pos
	so_descriptor.search_pos = mvector3.copy(CopLogicIntimidated)
	slot11 = data
	so_descriptor.admin_clbk = callback(CopLogicIntimidated, CopLogicIntimidated, CopLogicIntimidated, "on_harassment_SO_administered")
	slot11 = data.unit
	local so_id = "harass" .. tostring(data.unit.key("on_harassment_SO_administered"))
	my_data.harassment_SO_id = so_id
	slot9 = managers.groupai
	slot11 = so_descriptor

	managers.groupai.state(CopLogicIntimidated).add_special_objective(CopLogicIntimidated, managers.groupai.state(CopLogicIntimidated), so_id)

	return 
end
function CopLogicIntimidated.on_harassment_SO_administered(ignore_this, data, receiver_unit)
	local my_data = data.internal_data
	my_data.harassment_SO_id = nil

	return 
end
function CopLogicIntimidated.on_harassment_SO_action_start(ignore_this, data, receiver_unit)
	local my_data = data.internal_data
	local action = {
		variant = "harassed_kicked_from_behind",
		body_part = 1,
		type = "act",
		blocks = {
			light_hurt = -1,
			hurt = -1,
			action = -1,
			heavy_hurt = -1,
			walk = -1
		}
	}
	slot7 = data.unit
	slot8 = action
	my_data.being_harassed = data.unit.movement(slot6).action_request(slot6, data.unit.movement(slot6))
	slot7 = managers.groupai
	slot8 = "cop_harassment"

	managers.groupai.state(slot6).on_occasional_event(slot6, managers.groupai.state(slot6))

	slot8 = my_data

	CopLogicIntimidated._unregister_rescue_SO(slot6, data)

	return 
end
function CopLogicIntimidated.on_harassment_SO_failed(ignore_this, data, receiver_unit)
	local my_data = data.internal_data

	if my_data.being_harassed then
		local action_data = {
			variant = "tied",
			body_part = 1,
			type = "act",
			blocks = {
				light_hurt = -1,
				hurt = -1,
				heavy_hurt = -1,
				walk = -1
			}
		}
		slot7 = data.unit
		slot8 = action_data

		data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))

		my_data.being_harassed = nil
	end

	return 
end
function CopLogicIntimidated._unregister_harassment_SO(data, my_data)
	local my_data = data.internal_data

	if my_data.harassment_SO_id then
		slot5 = managers.groupai
		slot6 = my_data.harassment_SO_id

		managers.groupai.state(slot4).remove_special_objective(slot4, managers.groupai.state(slot4))

		my_data.harassment_SO_id = nil
	end

	return 
end
function CopLogicIntimidated._do_tied(data, aggressor_unit)
	local my_data = data.internal_data
	slot5 = aggressor_unit

	if alive(slot4) then
	end

	if my_data.surrender_clbk_registered then
		slot5 = managers.groupai
		slot6 = data.unit

		managers.groupai.state(slot4).remove_from_surrendered(slot4, managers.groupai.state(slot4))

		my_data.surrender_clbk_registered = nil
	end

	my_data.tied = true
	slot5 = data.unit
	slot5 = data.unit.inventory(slot4)

	data.unit.inventory(slot4).destroy_all_items(slot4)

	slot5 = data.unit
	slot6 = false

	data.unit.brain(slot4).set_update_enabled_state(slot4, data.unit.brain(slot4))

	if my_data.update_task_key then
		slot6 = my_data.update_task_key

		managers.enemy.unqueue_task(slot4, managers.enemy)

		my_data.update_task_key = nil
	end

	slot6 = "stand"

	data.brain.rem_pos_rsrv(slot4, data.brain)

	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)
	slot8 = data.unit

	managers.groupai.state(slot4).on_enemy_tied(slot4, data.unit.key(slot7))

	slot5 = data.unit
	slot7 = 22

	data.unit.base(slot4).set_slot(slot4, data.unit.base(slot4), data.unit)

	slot5 = data

	CopLogicIntimidated._chk_begin_alarm_pager(slot4)

	slot5 = data.brain

	if not data.brain.is_pager_started(slot4) then
		slot5 = data.unit
		slot6 = "hostage_convert"

		data.unit.interaction(slot4).set_tweak_data(slot4, data.unit.interaction(slot4))

		slot5 = data.unit
		slot8 = false

		data.unit.interaction(slot4).set_active(slot4, data.unit.interaction(slot4), true, true)
	end

	slot5 = data.unit

	if data.unit.unit_data(slot4).mission_element then
		slot5 = data.unit
		slot7 = data.unit

		data.unit.unit_data(slot4).mission_element.event(slot4, data.unit.unit_data(slot4).mission_element, "tied")
	end

	if aggressor_unit then
		slot5 = data.unit
		slot5 = data.unit.character_damage(slot4)

		data.unit.character_damage(slot4).drop_pickup(slot4)

		slot5 = data.unit
		slot6 = nil

		data.unit.character_damage(slot4).set_pickup(slot4, data.unit.character_damage(slot4))
	end

	slot5 = managers.groupai
	slot8 = nil

	managers.groupai.state(slot4).on_criminal_suspicion_progress(slot4, managers.groupai.state(slot4), nil, data.unit)

	return 
end
function CopLogicIntimidated.on_enemy_weapons_hot(data)
	if data.internal_data.tied then
		slot3 = data.unit
		slot4 = "hostage_convert"

		data.unit.interaction(slot2).set_tweak_data(slot2, data.unit.interaction(slot2))

		slot3 = data.unit
		slot6 = false

		data.unit.interaction(slot2).set_active(slot2, data.unit.interaction(slot2), true, true)
	end

	return 
end
function CopLogicIntimidated.on_new_objective(data, old_objective)
	slot5 = old_objective

	CopLogicBase.update_follow_unit(slot3, data)

	return 
end
function CopLogicIntimidated.on_alert(data, alert_data)
	local alert_unit = alert_data[5]

	if alert_unit then
		slot6 = data.enemy_slotmask

		if alert_unit.in_slot(slot4, alert_unit) then
			slot5 = data
			slot8 = alert_unit
			local att_obj_data, is_new = CopLogicBase.identify_attention_obj_instant(slot4, alert_unit.key(slot7))

			if not att_obj_data then
				return 
			end

			local alert_type = alert_data[1]

			if alert_type == "bullet" or alert_type == "aggression" or alert_type == "explosion" then
				slot8 = TimerManager
				slot8 = TimerManager.game(slot7)
				att_obj_data.alert_t = TimerManager.game(slot7).time(slot7)
			end

			if att_obj_data.criminal_record then
				slot8 = managers.groupai
				slot9 = alert_unit

				managers.groupai.state(slot7).criminal_spotted(slot7, managers.groupai.state(slot7))

				if alert_type == "bullet" or alert_type == "aggression" or alert_type == "explosion" then
					slot8 = managers.groupai
					slot9 = alert_unit

					managers.groupai.state(slot7).report_aggression(slot7, managers.groupai.state(slot7))
				end
			end
		end
	end

	return 
end
function CopLogicIntimidated.is_available_for_assignment(data, objective)
	if objective and objective.forced then
		return true
	end

	return false
end
function CopLogicIntimidated._add_delayed_rescue_SO(data, my_data)
	if data.char_tweak.flee_type ~= "hide" then
		slot4 = data.unit

		if data.unit.unit_data(slot3) then
			slot4 = data.unit
		elseif my_data.delayed_clbks and my_data.delayed_clbks[my_data.delayed_rescue_SO_id] then
			slot8 = TimerManager
			slot8 = TimerManager.game(slot7)
			slot6 = TimerManager.game(slot7).time(slot7) + 10

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

			my_data.delayed_rescue_SO_id = "rescue" .. tostring(data.unit.key(slot6))
			slot11 = data
			slot9 = TimerManager
			slot9 = TimerManager.game(CopLogicIntimidated)
			slot7 = TimerManager.game(CopLogicIntimidated).time(CopLogicIntimidated) + 10

			CopLogicBase.add_delayed_clbk(tostring(data.unit.key(slot6)), my_data, my_data.delayed_rescue_SO_id, callback(data.unit, CopLogicIntimidated, CopLogicIntimidated, "register_rescue_SO"))
		end
	end

	return 
end
function CopLogicIntimidated.register_rescue_SO(ignore_this, data)
	local my_data = data.internal_data
	slot6 = my_data.delayed_rescue_SO_id

	CopLogicBase.on_delayed_clbk(slot4, my_data)

	my_data.delayed_rescue_SO_id = nil
	slot5 = data.unit
	local my_tracker = data.unit.movement(slot4).nav_tracker(slot4)
	slot6 = my_tracker
	local objective_pos = my_tracker.field_position(data.unit.movement(slot4))
	local followup_objective = {
		scan = true,
		type = "act",
		stance = "hos",
		action = {
			variant = "idle",
			body_part = 1,
			type = "act",
			blocks = {
				action = -1,
				walk = -1
			}
		},
		action_duration = tweak_data.interaction.free.timer
	}
	local objective = {
		interrupt_health = 0.85,
		stance = "hos",
		type = "act",
		scan = true,
		destroy_clbk_key = false,
		interrupt_dis = 700,
		follow_unit = data.unit
	}
	slot9 = objective_pos
	objective.pos = mvector3.copy(slot8)
	slot9 = data.unit
	slot9 = data.unit.movement(slot8)
	slot9 = data.unit.movement(slot8).nav_tracker(slot8)
	objective.nav_seg = data.unit.movement(slot8).nav_tracker(slot8).nav_segment(slot8)
	slot12 = data
	objective.fail_clbk = callback(slot8, CopLogicIntimidated, CopLogicIntimidated, "on_rescue_SO_failed")
	slot12 = data
	objective.complete_clbk = callback(slot8, CopLogicIntimidated, CopLogicIntimidated, "on_rescue_SO_completed")
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
	objective.followup_objective = followup_objective
	local so_descriptor = {
		interval = 10,
		search_dis_sq = 1000000,
		AI_group = "enemies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective
	}
	slot10 = data.m_pos
	so_descriptor.search_pos = mvector3.copy(CopLogicIntimidated)
	slot13 = data
	so_descriptor.admin_clbk = callback(CopLogicIntimidated, CopLogicIntimidated, CopLogicIntimidated, "on_rescue_SO_administered")
	slot13 = data
	so_descriptor.verification_clbk = callback(CopLogicIntimidated, CopLogicIntimidated, CopLogicIntimidated, "rescue_SO_verification")
	slot13 = data.unit
	local so_id = "rescue" .. tostring(data.unit.key("rescue_SO_verification"))
	my_data.rescue_SO_id = so_id
	slot11 = managers.groupai
	slot13 = so_descriptor

	managers.groupai.state(CopLogicIntimidated).add_special_objective(CopLogicIntimidated, managers.groupai.state(CopLogicIntimidated), so_id)

	return 
end
function CopLogicIntimidated._unregister_rescue_SO(data, my_data)
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
	elseif my_data.delayed_rescue_SO_id then
		slot5 = my_data.delayed_rescue_SO_id

		CopLogicBase.chk_cancel_delayed_clbk(slot3, my_data)
	end

	return 
end
function CopLogicIntimidated.on_rescue_SO_administered(ignore_this, data, receiver_unit)
	local my_data = data.internal_data
	my_data.rescuer = receiver_unit
	my_data.rescue_SO_id = nil

	return 
end
function CopLogicIntimidated.rescue_SO_verification(ignore_this, data, unit)
	slot5 = unit
	slot5 = unit.base(slot4)

	if unit.base(slot4).char_tweak(slot4).rescue_hostages then
		slot5 = unit
		slot5 = unit.movement(slot4)

		if not unit.movement(slot4).cool(slot4) then
			slot6 = unit
			slot6 = unit.movement(slot5)
			slot3 = not data.team.foes[unit.movement(slot5).team(slot5).id]
		else
			slot3 = false

			if false then
				slot3 = true
			end
		end
	end

	return slot3
end
function CopLogicIntimidated.on_rescue_SO_failed(ignore_this, data)
	local my_data = data.internal_data

	if my_data.rescuer then
		my_data.rescuer = nil
		my_data.delayed_rescue_SO_id = "rescue" .. tostring(data.unit.key(slot7))
		slot12 = data
		slot10 = TimerManager
		slot10 = TimerManager.game(CopLogicIntimidated)
		slot8 = TimerManager.game(CopLogicIntimidated).time(CopLogicIntimidated) + 10

		CopLogicBase.add_delayed_clbk(tostring(data.unit.key(slot7)), my_data, my_data.delayed_rescue_SO_id, callback(data.unit, CopLogicIntimidated, CopLogicIntimidated, "register_rescue_SO"))
	end

	return 
end
function CopLogicIntimidated.on_rescue_SO_completed(ignore_this, data, good_pig)
	slot5 = data.unit
	slot5 = data.unit.inventory(slot4)

	if not data.unit.inventory(slot4).equipped_unit(slot4) then
		slot5 = data.unit
		slot5 = data.unit.inventory(slot4)

		if data.unit.inventory(slot4).num_selections(slot4) <= 0 then
			slot5 = data.unit
			slot5 = data.unit.base(slot4)
			local weap_name = data.unit.base(slot4).default_weapon_name(slot4)

			if weap_name then
				slot6 = data.unit
				slot9 = true

				data.unit.inventory(slot5).add_unit_by_name(slot5, data.unit.inventory(slot5), weap_name, true)
			end
		else
			slot5 = data.unit
			slot7 = true

			data.unit.inventory(slot4).equip_selection(slot4, data.unit.inventory(slot4), 1)
		end
	end

	slot5 = data.unit

	if data.unit.anim_data(slot4).hands_tied then
		local new_action = {
			variant = "stand",
			body_part = 1,
			type = "act"
		}
		slot6 = data.unit
		slot7 = new_action

		data.unit.brain(slot5).action_request(slot5, data.unit.brain(slot5))
	end

	slot6 = "idle"

	CopLogicBase._exit(slot4, data.unit)

	return 
end
function CopLogicIntimidated.on_rescue_allowed_state(data, state)
	if state then
		slot4 = data.unit

		if not data.unit.anim_data(slot3).move then
			slot5 = data.internal_data

			CopLogicIntimidated._add_delayed_rescue_SO(slot3, data)
		end
	else
		slot5 = data.internal_data

		CopLogicIntimidated._unregister_rescue_SO(slot3, data)
	end

	return 
end
function CopLogicIntimidated.anim_clbk(data, event_type)
	local my_data = data.internal_data

	if event_type == "harass_end" and my_data.being_harassed then
		my_data.being_harassed = nil
		slot6 = data.internal_data

		CopLogicIntimidated._add_delayed_rescue_SO(slot4, data)
	end

	return 
end
function CopLogicIntimidated._start_action_hands_up(data)
	local my_data = data.internal_data
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)
	local anim_name = (managers.groupai.state(slot3).whisper_mode(slot3) and "tied_all_in_one") or "hands_up"
	local action_data = {
		clamp_to_graph = true,
		type = "act",
		body_part = 1,
		variant = anim_name,
		blocks = {
			light_hurt = -1,
			hurt = -1,
			heavy_hurt = -1,
			walk = -1
		}
	}
	slot6 = data.unit
	slot7 = action_data
	my_data.act_action = data.unit.brain(slot5).action_request(slot5, data.unit.brain(slot5))

	if my_data.act_action then
		slot6 = data.unit

		if data.unit.anim_data(slot5).hands_tied then
			slot7 = my_data.aggressor_unit

			CopLogicIntimidated._do_tied(slot5, data)
		end
	end

	return 
end
function CopLogicIntimidated._chk_begin_alarm_pager(data)
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)

	if managers.groupai.state(slot2).whisper_mode(slot2) then
		slot3 = data.unit

		if data.unit.unit_data(slot2).has_alarm_pager then
			slot3 = data.brain

			data.brain.begin_alarm_pager(slot2)
		end
	end

	return 
end

return 
