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
slot3 = CopLogicBase
CopLogicSpotter = class(slot2)
CopLogicSpotter.damage_clbk = CopLogicBase.damage_clbk
CopLogicSpotter.is_available_for_assignment = CopLogicAttack.is_available_for_assignment
CopLogicSpotter.death_clbk = CopLogicAttack.death_clbk
function CopLogicSpotter.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	local objective = data.objective
	slot7 = data.unit
	slot7 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot7 = data.unit
	slot7 = data.unit.brain(data)

	data.unit.brain(data).reset_spotter(data)

	local old_internal_data = data.internal_data
	my_data.detection = data.char_tweak.detection.recon
	my_data.vision = data.char_tweak.vision.combat

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
	end

	data.internal_data = my_data
	slot10 = data.unit
	local key_str = tostring(data.unit.key(slot9))
	my_data.detection_task_key = "CopLogicSpotter._upd_enemy_detection" .. key_str
	slot12 = data

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CopLogicSpotter._upd_enemy_detection)

	if objective then
		my_data.wanted_stance = objective.stance
		my_data.wanted_pose = objective.pose
		my_data.attitude = objective.attitude or "avoid"
	end

	slot9 = data.unit
	slot10 = false

	data.unit.movement(slot8).set_cool(slot8, data.unit.movement(slot8))

	if my_data ~= data.internal_data then
		return 
	end

	slot9 = data.unit
	slot10 = {
		cbt = true
	}

	data.unit.brain(slot8).set_attention_settings(slot8, data.unit.brain(slot8))

	slot10 = data.unit
	slot10 = data.unit.inventory(data.unit.brain(slot8))
	slot10 = data.unit.inventory(data.unit.brain(slot8)).equipped_unit(data.unit.brain(slot8))
	slot10 = data.unit.inventory(data.unit.brain(slot8)).equipped_unit(data.unit.brain(slot8)).base(data.unit.brain(slot8))
	my_data.weapon_range = data.char_tweak.weapon[data.unit.inventory(data.unit.brain(slot8)).equipped_unit(data.unit.brain(slot8)).base(data.unit.brain(slot8)).weapon_tweak_data(data.unit.brain(slot8)).usage].range

	return 
end
function CopLogicSpotter.throw_flare_so(data)
	local action_desc = {
		variant = "spotter_cbt_sup_throw_flare",
		body_part = 1,
		type = "act",
		blocks = {
			light_hurt = -1,
			hurt = -1,
			action = -1,
			heavy_hurt = -1,
			aim = -1,
			walk = -1
		}
	}
	slot4 = data.unit
	slot5 = action_desc

	data.unit.movement(slot3).action_request(slot3, data.unit.movement(slot3))

	return 
end
function CopLogicSpotter.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicSpotter.super.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	return 
end
function CopLogicSpotter._upd_spotter_detection(data)
	slot5 = managers.player

	for _, player in pairs(managers.player.players(slot4)) do
		slot8 = managers.groupai
		slot11 = "empty"

		managers.groupai.state(slot7).on_spotter_detection_progress(slot7, managers.groupai.state(slot7), player, data.unit)
	end

	return 
end
function CopLogicSpotter._upd_enemy_detection(data)
	slot3 = managers.groupai

	managers.groupai.state(slot2).on_unit_detection_updated(slot2, managers.groupai.state(slot2))

	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	data.t = TimerManager.game(slot2).time(slot2)
	local my_data = data.internal_data
	local min_reaction = AIAttentionObject.REACT_AIM
	slot7 = nil
	local delay = CopLogicSpotter._upd_attention_obj_detection(data.unit, data, min_reaction)
	slot8 = CopLogicSpotter._chk_reaction_to_attention_object
	local new_attention, new_prio_slot, new_reaction = CopLogicBase._get_priority_attention(data, data, data.detected_attention_objects)
	local old_att_obj = data.attention_obj
	slot12 = new_reaction

	CopLogicBase._set_attention_obj(slot9, data, new_attention)

	slot11 = my_data

	CopLogicSpotter._upd_aim(slot9, data)

	if my_data ~= data.internal_data then
		return 
	end

	if data.important then
		delay = 0
	else
		delay = 0.5 + delay * 1.5
	end

	slot14 = data.t + delay

	CopLogicBase.queue_task(slot9, my_data, my_data.detection_task_key, CopLogicSpotter._upd_enemy_detection, data)

	return 
end
function CopLogicSpotter._chk_reaction_to_attention_object(data, attention_data, stationary)
	local record = attention_data.criminal_record

	if not record or not attention_data.is_person then
		return attention_data.settings.reaction
	end

	local att_unit = attention_data.unit
	slot7 = managers.groupai
	slot7 = managers.groupai.state(slot6)
	local assault_mode = managers.groupai.state(slot6).get_assault_mode(slot6)

	if attention_data.is_deployable or data.t < record.arrest_timeout then
		slot9 = AIAttentionObject.REACT_COMBAT

		return math.min(slot7, attention_data.settings.reaction)
	end

	if record.status == "disabled" then
		if record.assault_t and 0.6 < record.assault_t - record.disabled_t then
			slot9 = AIAttentionObject.REACT_COMBAT

			return math.min(slot7, attention_data.settings.reaction)
		end

		return AIAttentionObject.REACT_AIM
	elseif record.being_arrested then
		return AIAttentionObject.REACT_AIM
	end

	slot9 = AIAttentionObject.REACT_COMBAT

	return math.min(slot7, attention_data.settings.reaction)
end
function CopLogicSpotter._upd_attention_obj_detection(data, min_reaction, max_reaction)
	local t = data.t
	local detected_obj = data.detected_attention_objects
	local my_data = data.internal_data
	local my_key = data.key
	slot9 = data.unit
	slot9 = data.unit.movement(slot8)
	local my_pos = data.unit.movement(slot8).m_head_pos(slot8)
	local my_access = data.SO_access
	slot11 = managers.groupai
	local all_attention_objects = managers.groupai.state(slot10).get_AI_attention_objects_by_filter(slot10, managers.groupai.state(slot10), data.SO_access_str)
	slot12 = data.unit
	slot12 = data.unit.movement(managers.groupai.state(slot10))
	local my_tracker = data.unit.movement(managers.groupai.state(slot10)).nav_tracker(managers.groupai.state(slot10))
	local chk_vis_func = my_tracker.check_visibility
	slot14 = managers.groupai
	slot14 = managers.groupai.state(data.team)
	local is_detection_persistent = managers.groupai.state(data.team).is_detection_persistent(data.team)
	local delay = 1
	slot16 = data.unit
	slot20 = "enemies"
	local player_importance_wgt = data.unit.in_slot(slot15, managers.slot.get_mask(slot18, managers.slot)) and {}
	slot17 = managers.barrage

	if managers.barrage.is_barrage_running(slot16) then
		return delay
	end

	local player_skill = PlayerSkill
	slot18 = all_attention_objects

	for u_key, attention_info in pairs(slot17) do
		local human_player = false
		local undetectable = false
		slot25 = attention_info.unit

		if alive(slot24) then
			slot25 = attention_info.unit

			if attention_info.unit.base(slot24) then
				slot25 = attention_info.unit

				if not attention_info.unit.base(slot24).is_local_player then
					slot25 = attention_info.unit
					human_player = attention_info.unit.base(slot24).is_husk_player
				end

				if human_player then
					slot29 = attention_info.unit
					slot27 = (attention_info.unit.base(slot28).is_husk_player and attention_info.unit) or false
					undetectable = player_skill.has_skill(slot24, "player", "undetectable_by_spotters")
				end
			end

			if u_key ~= my_key and not detected_obj[u_key] and human_player and not undetectable then
			end
		end
	end

	slot18 = detected_obj

	for u_key, attention_info in pairs(slot17) do
		slot23 = attention_info.unit

		if alive(slot22) then
			if t < attention_info.next_verify_t then
				if AIAttentionObject.REACT_SUSPICIOUS <= attention_info.reaction then
					slot24 = delay
					delay = math.min(slot22, attention_info.next_verify_t - t)
				end
			else
				attention_info.next_verify_t = t + ((attention_info.identified and attention_info.verified and attention_info.settings.verification_interval) or attention_info.settings.notice_interval or attention_info.settings.verification_interval)
				slot24 = attention_info.settings.verification_interval
				delay = math.min(slot22, delay)

				if not attention_info.identified then
					local noticable = nil
					slot27 = my_pos
					local angle, dis_multiplier, speed_mul = CopLogicBase._angle_and_dis_chk(slot23, attention_info.handler, attention_info.settings, data)

					if angle then
						local attention_pos = attention_info.handler.get_detection_m_pos(slot26)
						slot35 = "ai_vision"
						local vis_ray = World.raycast(attention_info.handler, World, "ray", my_pos, attention_pos, "slot_mask", data.visibility_slotmask, "ray_type")
					end

					local dt = t - attention_info.prev_notice_chk_t
					local delta_prog = dt * -0.125

					if noticable then
						if angle == -1 then
							delta_prog = 1
						else
							local min_delay = my_data.detection.delay[1]
							local max_delay = my_data.detection.delay[2]
							slot32 = 1
							local angle_mul_mod = 0.25 * math.min(slot30, angle / my_data.detection.angle_max)
							local dis_mul_mod = 0.75 * dis_multiplier
							local notice_delay_mul = attention_info.settings.notice_delay_mul or 1

							if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
								notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
							end

							slot36 = dis_mul_mod + angle_mul_mod
							local notice_delay_modified = math.lerp(slot33, min_delay * notice_delay_mul, max_delay)
							delta_prog = dt / speed_mul
						end
					end

					if not attention_info.notice_progress then
						attention_info.notice_progress_wanted = 0
					end

					attention_info.notice_progress_wanted = attention_info.notice_progress_wanted or 0
					attention_info.notice_progress = attention_info.notice_progress_wanted
					attention_info.notice_progress_wanted = attention_info.notice_progress_wanted + delta_prog

					if 1 < attention_info.notice_progress then
						attention_info.notice_progress = nil
						attention_info.notice_progress_wanted = nil
						attention_info.prev_notice_chk_t = nil
						attention_info.identified = true
						attention_info.release_t = t + attention_info.settings.release_delay
						attention_info.identified_t = t
						noticable = true
						slot29 = managers.groupai
						slot32 = "barrage"

						managers.groupai.state(slot28).on_spotter_detection_progress(slot28, managers.groupai.state(slot28), attention_info.unit, data.unit)

						slot32 = "spotter"

						data.logic.on_attention_obj_identified(slot28, data, u_key, attention_info)
					elseif attention_info.notice_progress < 0 then
						noticable = false
						slot30 = attention_info

						CopLogicBase._detection_obj_lost(slot28, data)

						slot29 = managers.groupai
						slot32 = "remove"

						managers.groupai.state(slot28).on_spotter_detection_progress(slot28, managers.groupai.state(slot28), attention_info.unit, data.unit)
					else
						noticable = attention_info.notice_progress_wanted
						attention_info.prev_notice_chk_t = t
						slot29 = managers.groupai
						slot32 = noticable

						managers.groupai.state(slot28).on_spotter_detection_progress(slot28, managers.groupai.state(slot28), attention_info.unit, data.unit)
					end

					if noticable ~= false and attention_info.settings.notice_clbk then
						slot30 = noticable

						attention_info.settings.notice_clbk(slot28, data.unit)
					end
				end

				if attention_info.identified then
					delay = math.min(slot22, delay)
					attention_info.nearly_visible = nil
					local verified, vis_ray = nil
					local attention_pos = attention_info.handler.get_detection_m_pos(attention_info.settings.verification_interval)
					slot27 = attention_info.m_pos
					local dis = mvector3.distance(attention_info.handler, data.m_pos)

					if dis < my_data.detection.dis_max * 1.2 and (not attention_info.settings.max_range or dis < attention_info.settings.max_range * ((attention_info.settings.detection and attention_info.settings.detection.range_mul) or 1) * 1.2) then
						local detect_pos = attention_pos

						if attention_info.settings.notice_requires_FOV then
						else
							local in_FOV = true
						end

						if in_FOV then
							slot36 = "ai_vision"
							vis_ray = World.raycast(slot28, World, "ray", my_pos, detect_pos, "slot_mask", data.visibility_slotmask, "ray_type")
						end

						attention_info.verified = verified
					end

					attention_info.dis = dis
					attention_info.vis_ray = (vis_ray and vis_ray.dis) or nil

					if verified then
						attention_info.release_t = nil
						attention_info.verified_t = t
						slot28 = attention_pos

						mvector3.set(slot26, attention_info.verified_pos)

						slot27 = attention_pos
						attention_info.last_verified_pos = mvector3.copy(slot26)
						attention_info.verified_dis = dis
					elseif data.enemy_slotmask then
						slot28 = data.enemy_slotmask

						if attention_info.unit.in_slot(slot26, attention_info.unit) and attention_info.criminal_record and AIAttentionObject.REACT_COMBAT <= attention_info.settings.reaction then
							if not is_detection_persistent then
								slot28 = attention_info.criminal_record.pos
							else
								slot28 = delay
								delay = math.min(slot26, 0.2)
								slot27 = attention_info.criminal_record.pos
								attention_info.verified_pos = mvector3.copy(slot26)
								attention_info.verified_dis = dis

								if vis_ray then
									slot29 = u_key

									if data.logic._chk_nearly_visible_chk_needed(slot26, data, attention_info) then
										slot30 = attention_pos

										CopLogicBase._nearly_visible_chk(slot26, data, attention_info, my_pos)
									end
								end
							end
						elseif attention_info.release_t and attention_info.release_t < t then
							slot28 = attention_info

							CopLogicBase._destroy_detected_attention_object_data(slot26, data)
						else
							attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
						end
					elseif attention_info.release_t and attention_info.release_t < t then
						slot28 = attention_info

						CopLogicBase._destroy_detected_attention_object_data(slot26, data)
					else
						attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
					end
				end
			end
		end

		slot25 = my_pos

		CopLogicBase._chk_record_acquired_attention_importance_wgt(slot22, attention_info, player_importance_wgt)
	end

	if player_importance_wgt then
		slot18 = managers.groupai
		slot20 = player_importance_wgt

		managers.groupai.state(slot17).set_importance_weight(slot17, managers.groupai.state(slot17), data.key)
	end

	return delay
end
function CopLogicSpotter._upd_aim(data, my_data)
	if not data.logic._should_aim_or_shoot then
		return 
	end

	slot5 = my_data
	local aim, shoot = data.logic._should_aim_or_shoot(slot3, data)
	local focus_enemy = data.attention_obj

	if not my_data.turning then
		slot7 = data.unit
		slot8 = "walk"
		local action_taken = data.unit.movement(slot6).chk_action_forbidden(slot6, data.unit.movement(slot6))
	end

	if not action_taken then
		slot9 = my_data
		action_taken = data.logic._upd_aim_action(slot7, data)
	end

	if my_data.reposition and not action_taken and not my_data.advancing then
		local objective = data.objective
		slot10 = data.m_pos
		slot10 = objective.pos
		my_data.advance_path = {
			mvector3.copy(slot9),
			mvector3.copy(slot9)
		}
		slot12 = objective.rot

		if CopLogicTravel._chk_request_action_walk_to_advance_pos(slot8, data, my_data, objective.haste or "walk") then
			action_taken = true
		end
	end

	slot11 = shoot

	data.logic._aim_or_shoot(slot7, data, my_data, aim)

	slot11 = my_data

	CopLogicAttack.aim_allow_fire(slot7, shoot, aim, data)

	return 
end
function CopLogicSpotter._should_aim_or_shoot(data, my_data)
	local aim, shoot = nil
	local focus_enemy = data.attention_obj

	if focus_enemy then
		aim = true
		shoot = true
	end

	return aim, shoot
end
function CopLogicSpotter._upd_aim_action(data, my_data)
	local focus_enemy = data.attention_obj
	local action_taken = nil
	slot6 = data.unit
	local anim_data = data.unit.anim_data(slot5)

	if anim_data.reload and not anim_data.crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
		slot7 = data
		action_taken = CopLogicAttack._request_action_crouch(slot6)
	end

	if action_taken then
	elseif my_data.attitude == "engage" and not data.is_suppressed then
		if focus_enemy then
			slot5 = CopLogicAttack._request_action_turn_to_enemy
			slot7 = data
			slot8 = my_data
			slot9 = data.m_pos
			slot10 = focus_enemy.verified_pos or focus_enemy.m_head_pos

			if not slot5(slot6, slot7, slot8, slot9) and not focus_enemy.verified and not anim_data.reload then
				if anim_data.crouch then
					if not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand then
						slot9 = data.visibility_slotmask

						if not CopLogicSniper._chk_stand_visibility(slot6, data.m_pos, focus_enemy.m_head_pos) then
							slot7 = data

							CopLogicAttack._request_action_stand(slot6)
						end
					end
				elseif not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch then
					slot9 = data.visibility_slotmask

					if not CopLogicSniper._chk_crouch_visibility(slot6, data.m_pos, focus_enemy.m_head_pos) then
						slot7 = data

						CopLogicAttack._request_action_crouch(slot6)
					end
				end
			end
		elseif my_data.wanted_pose and not anim_data.reload then
			if my_data.wanted_pose == "crouch" then
				if not anim_data.crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
					slot7 = data
					action_taken = CopLogicAttack._request_action_crouch(slot6)
				end
			elseif not anim_data.stand and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand) then
				slot7 = data
				action_taken = CopLogicAttack._request_action_stand(slot6)
			end
		end
	elseif focus_enemy then
		slot5 = CopLogicAttack._request_action_turn_to_enemy
		slot7 = data
		slot8 = my_data
		slot9 = data.m_pos
		slot10 = focus_enemy.verified_pos or focus_enemy.m_head_pos

		if not slot5(slot6, slot7, slot8, slot9) and focus_enemy.verified and anim_data.stand and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
			slot9 = data.visibility_slotmask

			if CopLogicSniper._chk_crouch_visibility(slot6, data.m_pos, focus_enemy.m_head_pos) then
				slot7 = data

				CopLogicAttack._request_action_crouch(slot6)
			end
		end
	elseif my_data.wanted_pose and not anim_data.reload then
		if my_data.wanted_pose == "crouch" then
			if not anim_data.crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
				slot7 = data
				action_taken = CopLogicAttack._request_action_crouch(slot6)
			end
		elseif not anim_data.stand and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.stand) then
			slot7 = data
			action_taken = CopLogicAttack._request_action_stand(slot6)
		end
	end

	return action_taken
end
function CopLogicSpotter._aim_or_shoot(data, my_data, aim, shoot)
	local focus_enemy = data.attention_obj

	if aim or shoot then
		if focus_enemy.verified then
			slot8 = focus_enemy.unit

			if my_data.attention_unit ~= focus_enemy.unit.key(slot7) then
				slot8 = focus_enemy

				CopLogicBase._set_attention(slot6, data)

				slot7 = focus_enemy.unit
				my_data.attention_unit = focus_enemy.unit.key(slot6)
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

	return 
end
function CopLogicSpotter._request_action_shoot(data, my_data)

	-- Decompilation error in this vicinity:
	local shoot_action = {
		body_part = 3,
		type = "shoot"
	}
	slot5 = data.unit
	slot6 = shoot_action

	if data.unit.brain(slot4).action_request(slot4, data.unit.brain(slot4)) then
		my_data.shooting = true
	end

	return 
end
function CopLogicSpotter._upd_look_for_player(data, attention_info)
	return 
end
function CopLogicSpotter.on_alert(data, alert_data)
	return 
end
function CopLogicSpotter.on_attention_obj_identified(data, attention_u_key, attention_info)
	slot5 = data.unit

	if not data.unit.brain(slot4).on_cooldown then
		slot5 = data

		CopLogicSpotter.throw_flare_so(slot4)

		slot5 = data.unit
		data.unit.brain(slot4)._spotted_unit = attention_info.unit
		slot5 = data.unit
		slot6 = BarrageManager.SPOTTER_COOLDOWN + tweak_data.barrage.flare_timer

		data.unit.brain(attention_info.unit).schedule_spotter_reset(attention_info.unit, data.unit.brain(attention_info.unit))
	end

	slot7 = attention_info

	CopLogicBase.on_attention_obj_identified(slot4, data, attention_u_key)

	return 
end

return 
