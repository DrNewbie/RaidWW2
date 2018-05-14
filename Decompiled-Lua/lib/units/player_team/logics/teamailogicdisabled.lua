-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/units/enemies/cop/logics/CopLogicAttack"

require(slot1)

slot2 = TeamAILogicAssault
TeamAILogicDisabled = class(slot1)
TeamAILogicDisabled.on_long_dis_interacted = TeamAILogicIdle.on_long_dis_interacted
function TeamAILogicDisabled.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	TeamAILogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.combat
	my_data.vision = data.char_tweak.vision.combat
	slot7 = data.unit
	slot7 = data.unit.inventory(data.unit.brain(slot5))
	slot7 = data.unit.inventory(data.unit.brain(slot5)).equipped_unit(data.unit.brain(slot5))
	local usage = data.unit.inventory(data.unit.brain(slot5)).equipped_unit(data.unit.brain(slot5)).base(data.unit.brain(slot5)).weapon_tweak_data(data.unit.brain(slot5)).usage
	my_data.weapon_range = data.char_tweak.weapon[usage].range
	slot9 = "enemies"
	my_data.enemy_detect_slotmask = managers.slot.get_mask(data.unit.inventory(data.unit.brain(slot5)).equipped_unit(data.unit.brain(slot5)).base(data.unit.brain(slot5)), managers.slot)

	if old_internal_data then
		slot10 = old_internal_data.best_cover

		CopLogicAttack._set_best_cover(slot7, data, my_data)

		slot9 = old_internal_data.nearest_cover

		CopLogicAttack._set_nearest_cover(slot7, my_data)

		my_data.attention_unit = old_internal_data.attention_unit
	end

	slot8 = data.key
	local key_str = tostring(slot7)
	my_data.detection_task_key = "TeamAILogicDisabled._upd_enemy_detection" .. key_str
	slot13 = data.t

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, TeamAILogicDisabled._upd_enemy_detection, data)

	my_data.stay_cool = nil
	slot9 = data.unit
	slot9 = data.unit.character_damage(key_str)

	if data.unit.character_damage(key_str).need_revive(key_str) then
		slot11 = "revive"

		TeamAILogicDisabled._register_revive_SO(slot8, data, my_data)
	end

	slot9 = data.unit
	slot10 = false

	data.unit.brain(slot8).set_update_enabled_state(slot8, data.unit.brain(slot8))

	slot9 = data.unit
	slot9 = data.unit.character_damage(slot8)

	if not data.unit.character_damage(slot8).bleed_out(slot8) then
		my_data.invulnerable = true
		slot9 = data.unit
		slot10 = true

		data.unit.character_damage(slot8).set_invulnerable(slot8, data.unit.character_damage(slot8))
	end

	if data.objective then
		slot11 = true

		data.objective_failed_clbk(slot8, data.unit, data.objective)

		slot9 = data.unit
		slot10 = nil

		data.unit.brain(slot8).set_objective(slot8, data.unit.brain(slot8))
	end

	return 
end
function TeamAILogicDisabled.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	TeamAILogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	my_data.exiting = true
	slot6 = my_data

	TeamAILogicDisabled._unregister_revive_SO(data)

	if my_data.invulnerable then
		slot6 = data.unit
		slot7 = false

		data.unit.character_damage(slot5).set_invulnerable(slot5, data.unit.character_damage(slot5))
	end

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(slot5)

	if new_logic_name ~= "inactive" then
		slot6 = data.unit
		slot7 = true

		data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))
	end

	return 
end
function TeamAILogicDisabled._upd_enemy_detection(data)
	slot3 = TimerManager
	data.t = TimerManager.game(slot2).time(slot2)
	local my_data = data.internal_data
	slot6 = nil
	local delay = CopLogicBase._upd_attention_obj_detection(TimerManager.game(slot2), data, AIAttentionObject.REACT_SURPRISED)
	slot8 = data.cool
	local new_attention, new_prio_slot, new_reaction = TeamAILogicIdle._get_priority_attention(data, data, data.detected_attention_objects, nil)
	slot10 = new_reaction

	TeamAILogicBase._set_attention_obj(nil, data, new_attention)

	slot9 = my_data

	TeamAILogicDisabled._upd_aim(nil, data)

	slot12 = data.t + delay

	CopLogicBase.queue_task(nil, my_data, my_data.detection_task_key, TeamAILogicDisabled._upd_enemy_detection, data)

	return 
end
function TeamAILogicDisabled.on_intimidated(data, amount, aggressor_unit)
	return 
end
function TeamAILogicDisabled._consider_surrender(data, my_data)
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	my_data.stay_cool_chk_t = TimerManager.game(slot3).time(slot3)
	slot4 = data.unit
	slot4 = data.unit.character_damage(slot3)
	local my_health_ratio = data.unit.character_damage(slot3).health_ratio(slot3)

	if my_health_ratio < 0.1 then
		return 
	end

	slot5 = data.unit
	local my_health = my_health_ratio * data.unit.character_damage(slot4)._HEALTH_BLEEDOUT_INIT
	local total_scare = 0
	slot7 = data.detected_attention_objects

	for e_key, e_data in pairs(slot6) do
		if e_data.verified then
			slot13 = data.enemy_slotmask

			if e_data.unit.in_slot(slot11, e_data.unit) then
				slot13 = e_data.unit
				local scare = tweak_data.character[e_data.unit.base(slot12)._tweak_table].HEALTH_INIT / my_health
				slot15 = 2500
				scare = scare * (1 - math.clamp(slot12, e_data.verified_dis - 300, 0) / 2500)
				total_scare = total_scare + scare
			end
		end
	end

	slot9 = managers.groupai
	slot9 = managers.groupai.state(slot8)

	for c_key, c_data in pairs(managers.groupai.state(slot8).all_player_criminals(slot8)) do
		if not c_data.status then
			local support = tweak_data.player.damage.HEALTH_INIT / my_health
			slot14 = data.m_pos
			local dis = mvector3.distance(slot12, c_data.m_pos)

			if dis < 700 then
				total_scare = 0

				break
			end

			slot17 = 2500
			support = 3 * support * (1 - math.clamp(slot14, dis - 300, 0) / 2500)
			total_scare = total_scare - support
		end
	end

	if 1 < total_scare then
		my_data.stay_cool = true

		if my_data.firing then
			slot7 = data.unit
			slot8 = false

			data.unit.movement(slot6).set_allow_fire(slot6, data.unit.movement(slot6))

			my_data.firing = nil
		end
	else
		my_data.stay_cool = false
	end

	return 
end
function TeamAILogicDisabled._upd_aim(data, my_data)
	local shoot, aim = nil
	local focus_enemy = data.attention_obj

	if my_data.stay_cool then
	elseif focus_enemy then
		if focus_enemy.verified then
			if focus_enemy.verified_dis < 2000 or (my_data.alert_t and data.t - my_data.alert_t < 7) then
				shoot = true
			end
		elseif focus_enemy.verified_t and data.t - focus_enemy.verified_t < 10 then
			aim = true

			if my_data.shooting and data.t - focus_enemy.verified_t < 3 then
				shoot = true
			end
		elseif focus_enemy.verified_dis < 600 and my_data.walking_to_cover_shoot_pos then
			aim = true
		end
	end

	if aim or shoot then
		if focus_enemy.verified then
			if my_data.attention_unit ~= focus_enemy.u_key then
				slot8 = focus_enemy

				CopLogicBase._set_attention(slot6, data)

				my_data.attention_unit = focus_enemy.u_key
			end
		elseif my_data.attention_unit ~= focus_enemy.verified_pos then
			slot7 = data
			slot10 = focus_enemy.verified_pos

			CopLogicBase._set_attention_on_pos(slot6, mvector3.copy(slot9))

			slot7 = focus_enemy.verified_pos
			my_data.attention_unit = mvector3.copy(slot6)
		end
	else
		if my_data.shooting then
			local new_action = nil
			slot8 = data.unit

			if data.unit.anim_data(slot7).reload then
				new_action = {
					body_part = 3,
					type = "reload"
				}
			else
				new_action = {
					body_part = 3,
					type = "idle"
				}
			end

			slot8 = data.unit
			slot9 = new_action

			data.unit.brain(slot7).action_request(slot7, data.unit.brain(slot7))
		end

		if my_data.attention_unit then
			slot7 = data

			CopLogicBase._reset_attention(slot6)

			my_data.attention_unit = nil
		end
	end

	if shoot then
		if not my_data.firing then
			slot7 = data.unit
			slot8 = true

			data.unit.movement(slot6).set_allow_fire(slot6, data.unit.movement(slot6))

			my_data.firing = true
		end
	elseif my_data.firing then
		slot7 = data.unit
		slot8 = false

		data.unit.movement(slot6).set_allow_fire(slot6, data.unit.movement(slot6))

		my_data.firing = nil
	end

	return 
end
function TeamAILogicDisabled.on_recovered(data, reviving_unit)
	local my_data = data.internal_data

	if reviving_unit and my_data.rescuer then
		slot6 = reviving_unit
	else
		slot5 = my_data

		TeamAILogicDisabled._unregister_revive_SO(slot4)
	end

	slot6 = "assault"

	CopLogicBase._exit(slot4, data.unit)

	return 
end
function TeamAILogicDisabled._register_revive_SO(data, my_data, rescue_type)
	local followup_objective = {
		scan = true,
		type = "act",
		action = {
			variant = "crouch",
			body_part = 1,
			type = "act",
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				aim = -1,
				walk = -1
			}
		}
	}
	local objective = {
		type = "revive",
		called = true,
		scan = true,
		destroy_clbk_key = false,
		follow_unit = data.unit
	}
	slot7 = data.unit
	slot7 = data.unit.movement(slot6)
	objective.nav_seg = data.unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6)
	slot10 = data
	objective.fail_clbk = callback(slot6, TeamAILogicDisabled, TeamAILogicDisabled, "on_revive_SO_failed")
	objective.action = {
		align_sync = true,
		type = "act",
		body_part = 1,
		variant = rescue_type,
		blocks = {
			light_hurt = -1,
			hurt = -1,
			action = -1,
			heavy_hurt = -1,
			aim = -1,
			walk = -1
		}
	}
	objective.action_duration = tweak_data.interaction[(data.name == "surrender" and "free") or "revive"].timer
	objective.followup_objective = followup_objective
	local so_descriptor = {
		interval = 6,
		search_dis_sq = 1000000,
		AI_group = "friendlies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective
	}
	slot8 = data.m_pos
	so_descriptor.search_pos = mvector3.copy(data.unit.movement(slot6).nav_tracker(slot6))
	slot11 = data
	so_descriptor.admin_clbk = callback(data.unit.movement(slot6).nav_tracker(slot6), TeamAILogicDisabled, TeamAILogicDisabled, "on_revive_SO_administered")
	slot9 = data.key
	local so_id = "TeamAIrevive" .. tostring(TeamAILogicDisabled)
	my_data.SO_id = so_id
	slot9 = managers.groupai
	slot11 = so_descriptor

	managers.groupai.state(TeamAILogicDisabled).add_special_objective(TeamAILogicDisabled, managers.groupai.state(TeamAILogicDisabled), so_id)

	slot9 = data.unit
	my_data.deathguard_SO_id = PlayerBleedOut._register_deathguard_SO(TeamAILogicDisabled)

	return 
end
function TeamAILogicDisabled._unregister_revive_SO(my_data)
	if my_data.deathguard_SO_id then
		slot3 = my_data.deathguard_SO_id

		PlayerBleedOut._unregister_deathguard_SO(slot2)

		my_data.deathguard_SO_id = nil
	end

	if my_data.rescuer then
		local rescuer = my_data.rescuer
		my_data.rescuer = nil
		slot4 = rescuer
		slot4 = rescuer.brain(slot3)

		if rescuer.brain(slot3).objective(slot3) then
			slot4 = managers.groupai
			slot5 = rescuer
			slot8 = rescuer
			slot8 = rescuer.brain(slot7)

			managers.groupai.state(slot3).on_criminal_objective_failed(slot3, managers.groupai.state(slot3), rescuer.brain(slot7).objective(slot7))
		end
	elseif my_data.SO_id then
		slot3 = managers.groupai
		slot4 = my_data.SO_id

		managers.groupai.state(slot2).remove_special_objective(slot2, managers.groupai.state(slot2))

		my_data.SO_id = nil
	end

	return 
end
function TeamAILogicDisabled.is_available_for_assignment(data, new_objective)
	return false
end
function TeamAILogicDisabled.damage_clbk(data, damage_info)
	local my_data = data.internal_data
	slot5 = data.unit
	slot5 = data.unit.character_damage(slot4)

	if data.unit.character_damage(slot4).need_revive(slot4) and not my_data.SO_id and not my_data.rescuer then
		slot7 = "revive"

		TeamAILogicDisabled._register_revive_SO(slot4, data, my_data)
	end

	if damage_info.result.type == "fatal" then
		slot5 = my_data

		CopLogicBase.cancel_queued_tasks(slot4)

		if not my_data.invulnerable then
			my_data.invulnerable = true
			slot5 = data.unit
			slot6 = true

			data.unit.character_damage(slot4).set_invulnerable(slot4, data.unit.character_damage(slot4))
		end
	end

	slot6 = damage_info

	TeamAILogicIdle.damage_clbk(slot4, data)

	return 
end
function TeamAILogicDisabled.on_revive_SO_administered(ignore_this, data, receiver_unit)
	local my_data = data.internal_data
	my_data.rescuer = receiver_unit
	my_data.SO_id = nil

	return 
end
function TeamAILogicDisabled.on_revive_SO_failed(ignore_this, data)
	local my_data = data.internal_data

	if my_data.rescuer then
		slot5 = data.unit
		slot5 = data.unit.character_damage(slot4)
	end

	return 
end
function TeamAILogicDisabled.on_new_objective(data, old_objective)
	slot5 = old_objective

	TeamAILogicBase.on_new_objective(slot3, data)

	if old_objective and old_objective.fail_clbk then
		slot4 = data.unit

		old_objective.fail_clbk(slot3)
	end

	return 
end

return 
