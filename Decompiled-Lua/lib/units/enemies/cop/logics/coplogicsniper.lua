-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
slot3 = CopLogicBase
CopLogicSniper = class(slot2)
CopLogicSniper.damage_clbk = CopLogicBase.damage_clbk
CopLogicSniper.is_available_for_assignment = CopLogicAttack.is_available_for_assignment
CopLogicSniper.death_clbk = CopLogicAttack.death_clbk
function CopLogicSniper.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	local objective = data.objective
	slot7 = data.unit
	slot7 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	local old_internal_data = data.internal_data
	local my_data = {
		unit = data.unit,
		detection = data.char_tweak.detection.recon,
		vision = data.char_tweak.vision.combat
	}

	if old_internal_data then
		my_data.turning = old_internal_data.turning

		if old_internal_data.firing then
			slot9 = data.unit
			slot10 = false

			data.unit.movement(slot8).set_allow_fire(slot8, data.unit.movement(slot8))
		end

		if old_internal_data.shooting then
			slot9 = data.unit
			slot10 = {
				body_part = 3,
				type = "idle"
			}

			data.unit.brain(slot8).action_request(slot8, data.unit.brain(slot8))
		end
	end

	data.internal_data = my_data
	slot11 = data.unit
	local key_str = tostring(data.unit.key(slot10))
	my_data.detection_task_key = "CopLogicSniper._upd_enemy_detection" .. key_str
	slot13 = data

	CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, CopLogicSniper._upd_enemy_detection)

	if objective then
		my_data.wanted_stance = objective.stance
		my_data.wanted_pose = objective.pose
		my_data.attitude = objective.attitude or "avoid"
	end

	slot10 = data.unit
	slot11 = false

	data.unit.movement(slot9).set_cool(slot9, data.unit.movement(slot9))

	if my_data ~= data.internal_data then
		return 
	end

	slot10 = data.unit
	slot11 = {
		cbt = true
	}

	data.unit.brain(slot9).set_attention_settings(slot9, data.unit.brain(slot9))

	slot11 = data.unit
	slot11 = data.unit.inventory(data.unit.brain(slot9))
	slot11 = data.unit.inventory(data.unit.brain(slot9)).equipped_unit(data.unit.brain(slot9))
	slot11 = data.unit.inventory(data.unit.brain(slot9)).equipped_unit(data.unit.brain(slot9)).base(data.unit.brain(slot9))
	my_data.weapon_range = data.char_tweak.weapon[data.unit.inventory(data.unit.brain(slot9)).equipped_unit(data.unit.brain(slot9)).base(data.unit.brain(slot9)).weapon_tweak_data(data.unit.brain(slot9)).usage].range
	slot11 = data.unit
	slot11 = data.unit.inventory(data.unit.brain(slot9))
	slot11 = data.unit.inventory(data.unit.brain(slot9)).equipped_unit(data.unit.brain(slot9))
	slot11 = data.unit.inventory(data.unit.brain(slot9)).equipped_unit(data.unit.brain(slot9)).base(data.unit.brain(slot9))

	if data.char_tweak.weapon[data.unit.inventory(data.unit.brain(slot9)).equipped_unit(data.unit.brain(slot9)).base(data.unit.brain(slot9)).weapon_tweak_data(data.unit.brain(slot9)).usage].use_laser then
		slot10 = data.unit
		slot10 = data.unit.inventory(slot9)
		slot10 = data.unit.inventory(slot9).equipped_unit(slot9)
		slot11 = true

		data.unit.inventory(slot9).equipped_unit(slot9).base(slot9).set_laser_enabled(slot9, data.unit.inventory(slot9).equipped_unit(slot9).base(slot9))

		my_data.weapon_laser_on = true
		slot11 = data.key

		managers.enemy._destroy_unit_gfx_lod_data(slot9, managers.enemy)

		slot10 = managers.network
		slot14 = HuskCopBrain._NET_EVENTS.weapon_laser_on

		managers.network.session(slot9).send_to_peers_synched(slot9, managers.network.session(slot9), "sync_unit_event_id_16", data.unit, "brain")
	end

	return 
end
function CopLogicSniper.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	slot6 = data.unit
	slot6 = data.unit.brain(data)

	data.unit.brain(data).cancel_all_pathing_searches(data)

	slot6 = my_data

	CopLogicBase.cancel_queued_tasks(data)

	if my_data.weapon_laser_on then
		slot6 = data.unit
		slot6 = data.unit.inventory(slot5)

		if data.unit.inventory(slot5).equipped_unit(slot5) then
			slot6 = data.unit
			slot6 = data.unit.inventory(slot5)
			slot6 = data.unit.inventory(slot5).equipped_unit(slot5)
			slot7 = false

			data.unit.inventory(slot5).equipped_unit(slot5).base(slot5).set_laser_enabled(slot5, data.unit.inventory(slot5).equipped_unit(slot5).base(slot5))
		end

		slot6 = managers.network
		slot10 = HuskCopBrain._NET_EVENTS.weapon_laser_off

		managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_unit_event_id_16", data.unit, "brain")

		if new_logic_name ~= "inactive" then
			slot7 = data.unit

			managers.enemy._create_unit_gfx_lod_data(slot5, managers.enemy)
		end
	end

	return 
end
function CopLogicSniper._upd_enemy_detection(data)
	slot3 = managers.groupai

	managers.groupai.state(slot2).on_unit_detection_updated(slot2, managers.groupai.state(slot2))

	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	data.t = TimerManager.game(slot2).time(slot2)
	local my_data = data.internal_data
	local min_reaction = AIAttentionObject.REACT_AIM
	slot7 = nil
	local delay = CopLogicBase._upd_attention_obj_detection(data.unit, data, min_reaction)
	slot8 = CopLogicSniper._chk_reaction_to_attention_object
	local new_attention, new_prio_slot, new_reaction = CopLogicBase._get_priority_attention(data, data, data.detected_attention_objects)
	local old_att_obj = data.attention_obj
	slot12 = new_reaction

	CopLogicBase._set_attention_obj(slot9, data, new_attention)

	if new_reaction and AIAttentionObject.REACT_SCARED <= new_reaction then
		local objective = data.objective
		local wanted_state = nil
		slot15 = new_attention
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(slot11, data, objective, nil)

		if allow_trans and obj_failed then
			slot14 = data
			wanted_state = CopLogicBase._get_logic_state_from_reaction(slot13)
		end

		if wanted_state and wanted_state ~= data.name then
			if obj_failed then
				slot15 = data.objective

				data.objective_failed_clbk(slot13, data.unit)
			end

			if my_data == data.internal_data then
				slot15 = wanted_state

				CopLogicBase._exit(slot13, data.unit)
			end

			slot14 = data.detected_attention_objects

			CopLogicBase._report_detections(slot13)

			return 
		end
	end

	if my_data ~= data.internal_data then
		return 
	end

	slot11 = my_data

	CopLogicSniper._upd_aim(slot9, data)

	if my_data ~= data.internal_data then
		return 
	end

	if data.important then
		delay = 0
	else
		delay = 0.5 + delay * 1.5
	end

	slot14 = data.t + delay

	CopLogicBase.queue_task(slot9, my_data, my_data.detection_task_key, CopLogicSniper._upd_enemy_detection, data)

	slot10 = data.detected_attention_objects

	CopLogicBase._report_detections(slot9)

	return 
end
function CopLogicSniper._chk_stand_visibility(my_pos, target_pos, slotmask)
	slot6 = my_pos

	mvector3.set(slot4, tmp_vec1)

	slot6 = my_pos.z + 150

	mvector3.set_z(slot4, tmp_vec1)

	slot13 = "report"
	local ray = World.raycast(slot4, World, "ray", tmp_vec1, target_pos, "slot_mask", slotmask, "ray_type", "ai_vision")

	return ray
end
function CopLogicSniper._chk_crouch_visibility(my_pos, target_pos, slotmask)
	slot6 = my_pos

	mvector3.set(slot4, tmp_vec1)

	slot6 = my_pos.z + 50

	mvector3.set_z(slot4, tmp_vec1)

	slot13 = "report"
	local ray = World.raycast(slot4, World, "ray", tmp_vec1, target_pos, "slot_mask", slotmask, "ray_type", "ai_vision")

	return ray
end
function CopLogicSniper.on_action_completed(data, action)
	slot4 = action
	local action_type = action.type(slot3)
	local my_data = data.internal_data

	if action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "walk" then
		my_data.advacing = nil

		if action.expired then
			my_data.reposition = nil
		end
	elseif action_type == "hurt" then
		slot6 = action
	end

	return 
end
function CopLogicSniper._upd_aim(data, my_data)
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
function CopLogicSniper._upd_aim_action(data, my_data)
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
function CopLogicSniper._should_aim_or_shoot(data, my_data)
	local aim, shoot = nil
	local focus_enemy = data.attention_obj

	if focus_enemy then
		if focus_enemy.verified then
			shoot = true
		elseif my_data.wanted_stance == "cbt" then
			aim = true
		elseif focus_enemy.verified_t and data.t - focus_enemy.verified_t < 20 then
			aim = true
		end

		if aim and not shoot and my_data.shooting and focus_enemy.verified_t and data.t - focus_enemy.verified_t < 2 then
			shoot = true
		end
	end

	if shoot and focus_enemy.reaction < AIAttentionObject.REACT_SHOOT then
		shoot = nil
		aim = true
	end

	return aim, shoot
end
function CopLogicSniper._aim_or_shoot(data, my_data, aim, shoot)
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

		slot8 = my_data

		data.logic._request_action_shoot(slot6, data)
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
function CopLogicSniper._request_action_shoot(data, my_data)

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
function CopLogicSniper._chk_reaction_to_attention_object(data, attention_data, stationary)
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
function CopLogicSniper.should_duck_on_alert(data, alert_data)
	if data.internal_data.attitude == "avoid" then
		slot5 = alert_data
		slot2 = CopLogicBase.should_duck_on_alert(slot3, data)
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end

return 
