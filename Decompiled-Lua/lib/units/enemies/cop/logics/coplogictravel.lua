-- Decompilation Error: _run_step(_unwarp_expressions, node)

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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
slot4 = CopLogicBase
CopLogicTravel = class(slot3)
CopLogicTravel.death_clbk = CopLogicAttack.death_clbk
CopLogicTravel.on_criminal_neutralized = CopLogicAttack.on_criminal_neutralized
function CopLogicTravel.enter(data, new_logic_name, enter_params)
	if not data.objective then
		return 
	end

	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	slot7 = data.unit
	slot7 = data.unit.movement(data.unit.brain(slot5))
	local is_cool = data.unit.movement(data.unit.brain(slot5)).cool(data.unit.brain(slot5))

	if is_cool then
		my_data.detection = data.char_tweak.detection.ntl
		my_data.vision = data.char_tweak.vision.idle
	else
		my_data.detection = data.char_tweak.detection.recon
		my_data.vision = data.char_tweak.vision.combat
	end

	if old_internal_data then
		my_data.turning = old_internal_data.turning
		my_data.firing = old_internal_data.firing
		my_data.shooting = old_internal_data.shooting
		my_data.attention_unit = old_internal_data.attention_unit
	end

	if data.char_tweak.announce_incomming then
		my_data.announce_t = data.t + 2
	end

	data.internal_data = my_data
	slot8 = data.key
	local key_str = tostring(slot7)
	my_data.upd_task_key = "CopLogicTravel.queued_update" .. key_str
	slot10 = my_data

	CopLogicTravel.queue_update(key_str, data)

	my_data.cover_update_task_key = "CopLogicTravel._update_cover" .. key_str

	if my_data.nearest_cover or my_data.best_cover then
		slot16 = data
		slot12 = data.t + 1

		CopLogicBase.add_delayed_clbk(slot8, my_data, my_data.cover_update_task_key, callback(slot12, CopLogicTravel, CopLogicTravel, "_update_cover"))
	end

	slot10 = data.key
	my_data.advance_path_search_id = "CopLogicTravel_detailed" .. tostring(slot9)
	slot10 = data.key
	my_data.coarse_path_search_id = "CopLogicTravel_coarse" .. tostring(slot9)
	slot10 = my_data

	CopLogicBase._chk_has_old_action(tostring(slot9), data)

	local objective = data.objective
	local path_data = objective.path_data

	if objective.path_style == "warp" then
		my_data.warp_pos = objective.pos
	elseif path_data then
		local path_style = objective.path_style

		if path_style == "precise" then
			local path = {}
			slot13 = data.m_pos
			path[MULTRES] = mvector3.copy(slot12)
			slot13 = path_data.points

			for _, point in ipairs(slot12) do
				slot18 = path
				slot21 = point.position

				table.insert(slot17, mvector3.copy(slot20))
			end

			my_data.advance_path = path
			my_data.coarse_path_index = 1
			slot13 = data.unit
			slot13 = data.unit.movement(slot12)
			local start_seg = data.unit.movement(slot12).nav_tracker(slot12).nav_segment(slot12)
			local end_pos = mvector3.copy(data.unit.movement(slot12).nav_tracker(slot12))
			slot16 = end_pos
			local end_seg = managers.navigation.get_nav_seg_from_pos(path[#path], managers.navigation)
			my_data.coarse_path = {
				{
					start_seg
				},
				{
					end_seg,
					end_pos
				}
			}
			my_data.path_is_precise = true
		elseif path_style == "coarse" then
			local nav_manager = managers.navigation
			local f_get_nav_seg = nav_manager.get_nav_seg_from_pos
			slot14 = data.unit
			slot14 = data.unit.movement(slot13)
			slot14 = data.unit.movement(slot13).nav_tracker(slot13)
			local start_seg = data.unit.movement(slot13).nav_tracker(slot13).nav_segment(slot13)
			local path = {
				{
					start_seg
				}
			}
			slot16 = path_data.points

			for _, point in ipairs(slot15) do
				local pos = mvector3.copy(slot20)
				slot23 = pos
				local nav_seg = f_get_nav_seg(point.position, nav_manager)
				slot24 = {
					nav_seg,
					pos
				}

				table.insert(nav_manager, path)
			end

			my_data.coarse_path = path
			slot18 = path
			local i = CopLogicTravel.complete_coarse_path(slot15, data, my_data)

			if not i then
				slot18 = "[CopLogicTravel.enter1] coarse_path_index is nill?"
				slot21 = my_data.coarse_path

				Application.debug(slot16, Application, inspect(slot20))

				my_data.coarse_path_index = 1
			else
				my_data.coarse_path_index = i
			end
		elseif path_style == "coarse_complete" then
			slot12 = objective.path_data
			my_data.coarse_path = deep_clone(slot11)
			slot14 = my_data.coarse_path
			local i = CopLogicTravel.complete_coarse_path(slot11, data, my_data)

			if not i then
				slot14 = "[CopLogicTravel.enter2] coarse_path_index is nill?"
				slot17 = my_data.coarse_path

				Application.debug(slot12, Application, inspect(slot16))

				my_data.coarse_path_index = 1
			else
				my_data.coarse_path_index = i
			end
		end
	end

	if objective.stance then
		slot11 = data.unit
		local upper_body_action = data.unit.movement(slot10)._active_actions[3]
	end

	if data.attention_obj and AIAttentionObject.REACT_AIM < data.attention_obj.reaction then
		slot11 = data.unit
		slot12 = false
		slot15 = managers.groupai
		slot17 = data.unit
		slot16 = data.attention_obj.unit

		data.unit.movement(slot10).set_cool(slot10, data.unit.movement(slot10), managers.groupai.state(slot14).analyse_giveaway(slot14, data.unit.base(slot16)._tweak_table))
	end

	if is_cool then
		slot11 = data.unit
		slot12 = {
			peaceful = true
		}

		data.unit.brain(slot10).set_attention_settings(slot10, data.unit.brain(slot10))
	else
		slot11 = data.unit
		slot12 = {
			cbt = true
		}

		data.unit.brain(slot10).set_attention_settings(slot10, data.unit.brain(slot10))
	end

	my_data.attitude = data.objective.attitude or "avoid"
	slot12 = data.unit
	slot12 = data.unit.inventory(slot11)
	slot12 = data.unit.inventory(slot11).equipped_unit(slot11)
	slot12 = data.unit.inventory(slot11).equipped_unit(slot11).base(slot11)
	my_data.weapon_range = data.char_tweak.weapon[data.unit.inventory(slot11).equipped_unit(slot11).base(slot11).weapon_tweak_data(slot11).usage].range
	slot12 = data.unit
	slot12 = data.unit.inventory(slot11)
	slot12 = data.unit.inventory(slot11).equipped_unit(slot11)
	slot12 = data.unit.inventory(slot11).equipped_unit(slot11).base(slot11)
	my_data.weapon_range_max = data.char_tweak.weapon[data.unit.inventory(slot11).equipped_unit(slot11).base(slot11).weapon_tweak_data(slot11).usage].max_range
	slot12 = data.unit
	slot12 = data.unit.inventory(slot11)
	slot12 = data.unit.inventory(slot11).equipped_unit(slot11)
	slot12 = data.unit.inventory(slot11).equipped_unit(slot11).base(slot11)
	my_data.additional_weapon_stats = data.char_tweak.weapon[data.unit.inventory(slot11).equipped_unit(slot11).base(slot11).weapon_tweak_data(slot11).usage].additional_weapon_stats
	slot13 = "player"
	slot10 = tweak_data.levels.get_default_team_ID(slot11, tweak_data.levels)
	my_data.path_safely = data.team.foes[slot10]
	my_data.path_ahead = true
	slot11 = data.unit
	slot12 = false

	data.unit.brain(slot10).set_update_enabled_state(slot10, data.unit.brain(slot10))

	slot11 = Application

	if Application.production_build(slot10) then
		my_data.pathing_debug = {
			from_pos = Vector3(),
			to_pos = Vector3()
		}
	end

	return 
end
function CopLogicTravel.exit(data, new_logic_name, enter_params)
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

	slot6 = data.unit
	slot7 = true

	data.unit.brain(data).set_update_enabled_state(data, data.unit.brain(data))

	return 
end
function CopLogicTravel.queued_update(data)
	local my_data = data.internal_data
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	data.t = TimerManager.game(slot3).time(slot3)
	my_data.close_to_criminal = nil
	slot4 = data
	local delay = CopLogicTravel._upd_enemy_detection(slot3)

	if data.internal_data ~= my_data then
		return 
	end

	slot5 = data

	CopLogicTravel.upd_advance(slot4)

	if data.internal_data ~= my_data then
		return 
	end

	if not delay then
		slot6 = "crap!!!"
		slot9 = data

		debug_pause_unit(slot4, data.unit, inspect(slot8))

		delay = 1
	end

	slot7 = delay

	CopLogicTravel.queue_update(slot4, data, data.internal_data)

	return 
end
function CopLogicTravel.upd_advance(data)
	local unit = data.unit
	local my_data = data.internal_data
	local objective = data.objective
	slot6 = TimerManager
	slot6 = TimerManager.game(slot5)
	local t = TimerManager.game(slot5).time(slot5)
	data.t = t

	if my_data.has_old_action then
		slot8 = my_data

		CopLogicAttack._upd_stop_old_action(slot6, data)
	elseif my_data.warp_pos then
		slot7 = data.unit
		slot8 = objective.pos

		data.unit.movement(slot6).set_position(slot6, data.unit.movement(slot6))

		if objective.rot then
			slot7 = data.unit
			slot8 = objective.rot

			data.unit.movement(slot6).set_rotation(slot6, data.unit.movement(slot6))
		end

		slot7 = data

		CopLogicTravel._on_destination_reached(slot6)
	elseif my_data.advancing then
		if my_data.coarse_path then
			if my_data.announce_t and my_data.announce_t < t then
				slot8 = my_data

				CopLogicTravel._try_anounce(slot6, data)
			end

			slot8 = my_data

			CopLogicTravel._chk_stop_for_follow_unit(slot6, data)

			if my_data ~= data.internal_data then
				return 
			end
		end
	elseif my_data.advance_path then
		slot8 = my_data

		CopLogicTravel._chk_begin_advance(slot6, data)

		if my_data.advancing then
			slot7 = data

			CopLogicTravel._check_start_path_ahead(slot6)
		end
	elseif my_data.processing_advance_path or my_data.processing_coarse_path then
		slot8 = my_data

		CopLogicTravel._upd_pathing(slot6, data)

		if my_data ~= data.internal_data then
			return 
		end
	elseif my_data.cover_leave_t then
		if not my_data.turning then
			slot7 = unit
			slot8 = "walk"

			if not unit.movement(slot6).chk_action_forbidden(slot6, unit.movement(slot6)) then
				slot7 = data.unit

				if not data.unit.anim_data(slot6).reload then
					if my_data.cover_leave_t < t then
						my_data.cover_leave_t = nil
					elseif data.attention_obj and AIAttentionObject.REACT_SCARED <= data.attention_obj.reaction and (not my_data.best_cover or not my_data.best_cover[NavigationManager.COVER_RESERVED]) then
						slot7 = unit

						if not unit.anim_data(slot6).crouch and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
							slot7 = data

							CopLogicAttack._request_action_crouch(slot6)
						end
					end
				end
			end
		end
	elseif objective and (objective.nav_seg or objective.type == "follow") then
		slot8 = my_data.coarse_path
		local path_ok = CopLogicTravel._verifiy_coarse_path(slot6, objective.nav_seg)

		if my_data.coarse_path and path_ok then
			if my_data.coarse_path_index == #my_data.coarse_path then
				slot8 = data

				CopLogicTravel._on_destination_reached(slot7)

				return 
			else
				slot9 = my_data

				CopLogicTravel._chk_start_pathing_to_next_nav_point(slot7, data)
			end
		else
			slot9 = my_data

			CopLogicTravel._begin_coarse_pathing(slot7, data)
		end
	else
		slot8 = "idle"

		CopLogicBase._exit(slot6, data.unit)

		return 
	end

	return 
end
function CopLogicTravel._verifiy_coarse_path(nav_seg, path)
	if not nav_seg or not path then
		return true
	end

	if path[#path][1] == nav_seg then
		return true
	end

	return false
end
function CopLogicTravel._upd_enemy_detection(data)
	slot3 = managers.groupai
	slot4 = data.unit

	managers.groupai.state(slot2).on_unit_detection_updated(slot2, managers.groupai.state(slot2))

	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(managers.groupai.state(slot2), data, nil)
	slot7 = nil
	local new_attention, new_prio_slot, new_reaction = CopLogicBase._get_priority_attention(data, data, data.detected_attention_objects)
	local old_att_obj = data.attention_obj
	slot11 = new_reaction

	CopLogicBase._set_attention_obj(slot8, data, new_attention)

	local objective = data.objective
	slot13 = new_attention
	local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, data, objective, nil)

	if allow_trans and (obj_failed or not objective or objective.type ~= "follow") then
		slot12 = data
		local wanted_state = CopLogicBase._get_logic_state_from_reaction(slot11)

		if wanted_state and wanted_state ~= data.name then
			if obj_failed then
				slot14 = data.objective

				data.objective_failed_clbk(slot12, data.unit)
			end

			if my_data == data.internal_data and not objective.is_default then
				slot15 = data.unit
				slot18 = objective

				debug_pause_unit(slot12, data.unit, "[CopLogicTravel._upd_enemy_detection] exiting without discarding objective", inspect(slot17))

				slot14 = wanted_state

				CopLogicBase._exit(slot12, data.unit)
			end

			slot13 = data.detected_attention_objects

			CopLogicBase._report_detections(slot12)

			return delay
		end
	end

	if my_data == data.internal_data then
		if data.cool and new_reaction == AIAttentionObject.REACT_SUSPICIOUS then
			slot14 = new_attention
		elseif new_reaction and new_reaction <= AIAttentionObject.REACT_SCARED then
			slot12 = data.unit
			slot12 = data.unit.movement(slot11)
			local set_attention = data.unit.movement(slot11).attention(slot11)

			if not set_attention or set_attention.u_key ~= new_attention.u_key then
				slot15 = nil

				CopLogicBase._set_attention(slot12, data, new_attention)
			end
		end

		slot13 = my_data

		CopLogicAttack._upd_aim(slot11, data)
	end

	slot12 = data.detected_attention_objects

	CopLogicBase._report_detections(slot11)

	if new_attention and data.char_tweak.chatter.entrance and not data.entrance and new_attention.criminal_record and new_attention.verified and AIAttentionObject.REACT_SCARED <= new_reaction then
		slot12 = data.m_pos.z - new_attention.m_pos.z

		if math.abs(slot11) < 4000 then
			slot12 = data.unit
			slot15 = nil

			data.unit.sound(slot11).say(slot11, data.unit.sound(slot11), data.brain.entrance_chatter_cue or "entrance", true)

			data.entrance = true
		end
	end

	if data.cool then
		slot12 = data

		CopLogicTravel.upd_suspicion_decay(slot11)
	end

	return delay
end
function CopLogicTravel._upd_pathing(data, my_data)
	if data.pathing_results then
		local pathing_results = data.pathing_results
		data.pathing_results = nil
		local path = pathing_results[my_data.advance_path_search_id]

		if path and my_data.processing_advance_path then
			my_data.processing_advance_path = nil
			slot6 = data.unit
			data.unit.brain(slot5).path_failed = false

			if path ~= "failed" then
				my_data.advance_path = path
			else
				slot6 = Application

				if Application.production_build(slot5) then
					local txt = "[CopLogicTravel:_upd_pathing] advance_path failed"

					if false then
						slot7 = managers.groupai
					else
						slot9 = my_data.coarse_path_index
						slot12 = my_data.coarse_path

						print(slot6, txt, data.unit, inspect(slot11))
					end
				end

				data.path_fail_t = data.t
				slot6 = data.unit
				data.unit.brain(slot5).path_failed = true
				slot7 = data.objective

				data.objective_failed_clbk(true, data.unit)

				return 
			end
		end

		local path = pathing_results[my_data.coarse_path_search_id]

		if path and my_data.processing_coarse_path then
			my_data.processing_coarse_path = nil

			if path ~= "failed" then
				my_data.coarse_path = path
				my_data.coarse_path_index = 1
				slot7 = data.unit
				data.unit.brain(slot6).path_failed = false
			elseif my_data.path_safely then
				my_data.path_safely = nil
			else
				slot9 = my_data.coarse_path_index
				slot12 = my_data.coarse_path

				print(slot6, "[CopLogicTravel:_upd_pathing] coarse_path failed unsafe", data.unit, inspect(slot11))

				data.path_fail_t = data.t
				slot7 = data.unit
				data.unit.brain(slot6).path_failed = true
				slot8 = data.objective

				data.objective_failed_clbk(true, data.unit)

				return 
			end
		end
	end

	return 
end
function CopLogicTravel._update_cover(ignore_this, data)
	local my_data = data.internal_data
	slot6 = my_data.cover_update_task_key

	CopLogicBase.on_delayed_clbk(slot4, my_data)

	local cover_release_dis = 100
	local nearest_cover = my_data.nearest_cover
	local best_cover = my_data.best_cover
	local m_pos = data.m_pos

	if not my_data.in_cover and nearest_cover then
		slot10 = m_pos

		if cover_release_dis < mvector3.distance(slot8, nearest_cover[1][NavigationManager.COVER_POSITION]) then
			slot10 = nearest_cover[1]

			managers.navigation.release_cover(slot8, managers.navigation)

			my_data.nearest_cover = nil
			nearest_cover = nil
		end
	end

	if best_cover then
		slot10 = m_pos

		if cover_release_dis < mvector3.distance(slot8, best_cover[1][NavigationManager.COVER_POSITION]) then
			slot10 = best_cover[1]

			managers.navigation.release_cover(slot8, managers.navigation)

			my_data.best_cover = nil
			best_cover = nil
		end
	end

	if nearest_cover or best_cover then
		slot16 = data
		slot16 = 2.1
		slot12 = data.t + math.rand(CopLogicTravel, 1.9)

		CopLogicBase.add_delayed_clbk(slot8, my_data, my_data.cover_update_task_key, callback(slot12, CopLogicTravel, CopLogicTravel, "_update_cover"))
	end

	return 
end
function CopLogicTravel._chk_request_action_turn_to_cover(data, my_data)
	slot4 = data.unit
	slot4 = data.unit.movement(slot3)
	local fwd = data.unit.movement(slot3).m_rot(slot3).y(slot3)
	slot6 = my_data.best_cover[1][NavigationManager.COVER_FORWARD]

	mvector3.set(data.unit.movement(slot3).m_rot(slot3), tmp_vec1)

	slot5 = tmp_vec1

	mvector3.negate(data.unit.movement(slot3).m_rot(slot3))

	slot7 = math.UP
	local error_spin = tmp_vec1.to_polar_with_reference(data.unit.movement(slot3).m_rot(slot3), tmp_vec1, fwd).spin
	slot6 = error_spin

	if 25 < math.abs(tmp_vec1) then
		local new_action_data = {
			type = "turn",
			body_part = 2,
			angle = error_spin
		}
		slot7 = data.unit
		slot8 = new_action_data
		my_data.turning = data.unit.brain(slot6).action_request(slot6, data.unit.brain(slot6))

		if my_data.turning then
			return true
		end
	end

	return 
end
function CopLogicTravel._chk_cover_height(data, cover, slotmask)
	local ray_from = tmp_vec1
	slot7 = math.UP

	mvector3.set(slot5, ray_from)

	slot7 = 110

	mvector3.multiply(slot5, ray_from)

	slot7 = cover[1]

	mvector3.add(slot5, ray_from)

	local ray_to = tmp_vec2
	slot8 = cover[NavigationManager.COVER_FORWARD]

	mvector3.set(ray_from, ray_to)

	slot8 = 200

	mvector3.multiply(ray_from, ray_to)

	slot8 = ray_from

	mvector3.add(ray_from, ray_to)

	slot15 = "report"
	local ray = World.raycast(ray_from, World, "ray", ray_from, ray_to, "slot_mask", slotmask, "ray_type", "ai_vision")

	return ray
end
function CopLogicTravel.on_action_completed(data, action)
	local my_data = data.internal_data
	slot5 = action
	local action_type = action.type(slot4)

	if action_type == "walk" then
		slot6 = action

		if action.expired(slot5) and not my_data.starting_advance_action and my_data.coarse_path_index and not my_data.has_old_action and my_data.advancing and not my_data.skip_coarse then
			local step = my_data.coarse_path_step or 1
			my_data.coarse_path_step = 1
			my_data.coarse_path_index = my_data.coarse_path_index + step

			if #my_data.coarse_path < my_data.coarse_path_index then
				my_data.coarse_path_index = my_data.coarse_path_index - 1
			end
		end

		my_data.skip_coarse = false
		my_data.advancing = nil

		if my_data.moving_to_cover then
			slot6 = action

			if action.expired(slot5) then
				if my_data.best_cover then
					slot7 = my_data.best_cover[1]

					managers.navigation.release_cover(slot5, managers.navigation)
				end

				my_data.best_cover = my_data.moving_to_cover
				slot7 = my_data.cover_update_task_key

				CopLogicBase.chk_cancel_delayed_clbk(slot5, my_data)

				slot8 = data.visibility_slotmask
				local high_ray = CopLogicTravel._chk_cover_height(slot5, data, my_data.best_cover[1])
				my_data.best_cover[NavigationManager.COVER_RESERVED] = high_ray
				my_data.in_cover = true
				local cover_wait_time = (my_data.coarse_path_index == #my_data.coarse_path - 1 and 0.3) or 0.6 + 0.4 * math.random()
				slot9 = my_data

				if not CopLogicTravel._chk_close_to_criminal(slot7, data) then
					cover_wait_time = 0
				end

				slot10 = "player"
				local close_in_fast = data.team.foes[tweak_data.levels.get_default_team_ID(slot8, tweak_data.levels)] and not my_data.attention_unit

				if close_in_fast then
					cover_wait_time = 0
				end

				my_data.cover_leave_t = data.t + cover_wait_time
			else
				slot7 = my_data.moving_to_cover[1]

				managers.navigation.release_cover(slot5, managers.navigation)

				if my_data.best_cover then
					slot6 = my_data.best_cover[1][NavigationManager.COVER_POSITION]
					slot9 = data.unit
					slot9 = data.unit.movement(slot8)
					local dis = mvector3.distance(slot5, data.unit.movement(slot8).m_pos(slot8))

					if 100 < dis then
						slot8 = my_data.best_cover[1]

						managers.navigation.release_cover(slot6, managers.navigation)

						my_data.best_cover = nil
					end
				end
			end

			my_data.moving_to_cover = nil
		elseif my_data.best_cover then
			slot6 = my_data.best_cover[1][NavigationManager.COVER_POSITION]
			slot9 = data.unit
			slot9 = data.unit.movement(slot8)
			local dis = mvector3.distance(slot5, data.unit.movement(slot8).m_pos(slot8))

			if 100 < dis then
				slot8 = my_data.best_cover[1]

				managers.navigation.release_cover(slot6, managers.navigation)

				my_data.best_cover = nil
			end
		end

		slot6 = action

		if not action.expired(slot5) then
			if my_data.processing_advance_path then
				local pathing_results = data.pathing_results

				if pathing_results and pathing_results[my_data.advance_path_search_id] then
					data.pathing_results[my_data.advance_path_search_id] = nil
					my_data.processing_advance_path = nil
				end
			elseif my_data.advance_path then
				my_data.advance_path = nil
			end

			slot6 = data.unit
			slot7 = my_data.advance_path_search_id

			data.unit.brain(slot5).abort_detailed_pathing(slot5, data.unit.brain(slot5))
		end
	elseif action_type == "turn" then
		data.internal_data.turning = nil
	elseif action_type == "shoot" then
		data.internal_data.shooting = nil
	elseif action_type == "dodge" then
		local objective = data.objective
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(slot6, data, objective, nil)

		if allow_trans then
			slot9 = data
			local wanted_state = data.logic._get_logic_state_from_reaction(slot8)

			if wanted_state and wanted_state ~= data.name and obj_failed then

				-- Decompilation error in this vicinity:
				slot10 = data.unit
				slot14 = "enemies"

				if my_data == data.internal_data then
					slot11 = wanted_state

					CopLogicBase._exit(slot9, data.unit)
				end
			end
		end
	elseif action_type == "act" and action._action_desc and action._action_desc.complete_callback then
		slot6 = data.unit

		action._action_desc.complete_callback(slot5)
	end

	return 
end
function CopLogicTravel._get_pos_accross_door(guard_door, nav_seg)
	local rooms = guard_door.rooms
	local room_1_seg = guard_door.low_seg
	local accross_vec = guard_door.high_pos - guard_door.low_pos
	local rot_angle = 90

	if room_1_seg == nav_seg then
		if guard_door.low_pos.y == guard_door.high_pos.y then
			rot_angle = rot_angle * -1
		end
	elseif guard_door.low_pos.x == guard_door.high_pos.x then
		rot_angle = rot_angle * -1
	end

	slot11 = rot_angle

	mvector3.rotate_with(slot7, Rotation(slot10))

	local max_dis = 1500
	slot10 = 1500

	mvector3.set_length(accross_vec, accross_vec)

	local door_pos = guard_door.center
	slot13 = door_pos
	local door_tracker = managers.navigation.create_nav_tracker(accross_vec, mvector3.copy(slot12))
	slot13 = accross_vec
	local accross_positions = managers.navigation.find_walls_accross_tracker(managers.navigation, managers.navigation, door_tracker)

	if accross_positions then
		slot13 = max_dis
		local optimal_dis = math.lerp(slot11, max_dis * 0.6, math.random())
		local best_error_dis, best_pos, best_is_hit, best_is_miss, best_has_too_much_error = nil
		slot18 = accross_positions

		for _, accross_pos in ipairs(slot17) do
			slot26 = door_pos
			slot23 = mvector3.distance(slot24, accross_pos[1]) - optimal_dis
			local error_dis = math.abs(slot22)
			local too_much_error = 0.3 < error_dis / optimal_dis
			local is_hit = accross_pos[2]

			if best_is_hit then
				if is_hit then
					if error_dis < best_error_dis then
						best_pos = accross_pos[1]
						best_error_dis = error_dis
						best_has_too_much_error = too_much_error
					end
				elseif best_has_too_much_error then
					best_pos = accross_pos[1]
					best_error_dis = error_dis
					best_is_miss = true
					best_is_hit = nil
				end
			elseif best_is_miss then
				if not too_much_error then
					best_pos = accross_pos[1]
					best_error_dis = error_dis
					best_has_too_much_error = nil
					best_is_miss = nil
					best_is_hit = true
				end
			else
				best_pos = accross_pos[1]
				best_is_hit = is_hit
				best_is_miss = not is_hit
				best_has_too_much_error = too_much_error
				best_error_dis = error_dis
			end
		end

		slot19 = door_tracker

		managers.navigation.destroy_nav_tracker(slot17, managers.navigation)

		return best_pos
	end

	slot13 = door_tracker

	managers.navigation.destroy_nav_tracker(slot11, managers.navigation)

	return 
end
function CopLogicTravel.is_available_for_assignment(data, new_objective)
	if new_objective and new_objective.forced then
		return true
	elseif data.objective and data.objective.type == "act" then
		if (not new_objective or (new_objective and new_objective.type == "free")) and data.objective.interrupt_dis == -1 then
			return true
		end

		return 
	else
		slot5 = new_objective

		return CopLogicAttack.is_available_for_assignment(slot3, data)
	end

	return 
end
function CopLogicTravel.is_advancing(data)
	if data.internal_data.advancing and data.pos_rsrv.move_dest then
		return data.pos_rsrv.move_dest.position
	end

	return 
end
function CopLogicTravel._reserve_pos_along_vec(look_pos, wanted_pos)
	local step_vec = look_pos - wanted_pos
	slot7 = step_vec
	local max_pos_mul = math.floor(slot4)
	slot7 = 65

	mvector3.set_length(mvector3.length(slot6) / 65, step_vec)

	local data = {
		start_pos = wanted_pos,
		step_vec = step_vec,
		step_mul = (0 < max_pos_mul and 1) or -1,
		block = max_pos_mul == 0,
		max_pos_mul = max_pos_mul
	}
	local step_clbk = callback(slot6, CopLogicTravel, CopLogicTravel, "_rsrv_pos_along_vec_step_clbk")
	slot11 = TimerManager
	slot11 = TimerManager.game(data)
	slot14 = data.pos_rsrv_id
	local res_data = managers.navigation.reserve_pos(CopLogicTravel, managers.navigation, TimerManager.game(data).time(data), 1, wanted_pos, step_clbk, 30)

	return res_data
end
function CopLogicTravel._rsrv_pos_along_vec_step_clbk(shait, data, test_pos)
	local step_mul = data.step_mul
	local nav_manager = managers.navigation
	local step_vec = data.step_vec
	slot9 = step_vec

	mvector3.set(slot7, test_pos)

	slot9 = step_mul

	mvector3.multiply(slot7, test_pos)

	slot9 = data.start_pos

	mvector3.add(slot7, test_pos)

	local params = {
		allow_entry = false,
		pos_from = data.start_pos,
		pos_to = test_pos
	}
	slot10 = params
	local blocked = nav_manager.raycast(test_pos, nav_manager)

	if blocked then
		if data.block then
			return false
		end

		data.block = true

		if 0 < step_mul then
			data.step_mul = -step_mul
		else
			data.step_mul = -step_mul + 1

			if data.max_pos_mul < data.step_mul then
				return 
			end
		end

		slot12 = test_pos

		return CopLogicTravel._rsrv_pos_along_vec_step_clbk(slot9, shait, data)
	elseif data.block then
		slot10 = step_mul
		data.step_mul = step_mul + math.sign(slot9)

		if data.max_pos_mul < data.step_mul then
			return 
		end
	elseif 0 < step_mul then
		data.step_mul = -step_mul
	else
		data.step_mul = -step_mul + 1

		if data.max_pos_mul < data.step_mul then
			data.block = true
			data.step_mul = -data.step_mul
		end
	end

	return true
end
function CopLogicTravel._investigate_coarse_path_verify_clbk(shait, nav_seg)
	slot4 = managers.groupai
	slot5 = nav_seg

	return managers.groupai.state(slot3).is_nav_seg_safe(slot3, managers.groupai.state(slot3))
end
function CopLogicTravel.on_intimidated(data, amount, aggressor_unit)
	slot7 = aggressor_unit
	local surrender = CopLogicBase.on_intimidated(slot4, data, amount)

	if surrender and data.objective then
		slot7 = data.objective

		data.objective_failed_clbk(slot5, data.unit)
	end

	return 
end
function CopLogicTravel._chk_request_action_walk_to_advance_pos(data, my_data, speed, end_rot, no_strafe, end_pose)

	-- Decompilation error in this vicinity:
	slot8 = data.unit
	slot9 = "walk"

	return 
end
function CopLogicTravel._determine_destination_occupation(data, objective)
	local occupation = nil

	if objective.type == "defend_area" then
		if objective.cover then
			occupation = {
				type = "defend",
				seg = objective.nav_seg,
				cover = objective.cover,
				radius = objective.radius
			}
		elseif objective.pos then
			occupation = {
				type = "defend",
				seg = objective.nav_seg,
				pos = objective.pos,
				radius = objective.radius
			}
		else
			if objective.follow_unit then
				slot5 = objective.follow_unit
				slot5 = objective.follow_unit.movement(slot4)
				slot5 = objective.follow_unit.movement(slot4).nav_tracker(slot4)
				local near_pos = objective.follow_unit.movement(slot4).nav_tracker(slot4).field_position(slot4)
			end

			slot8 = near_pos
			local cover = CopLogicTravel._find_cover(slot5, data, objective.nav_seg)

			if cover then
				local cover_entry = {
					cover
				}
				occupation = {
					type = "defend",
					seg = objective.nav_seg,
					cover = cover_entry,
					radius = objective.radius
				}
			else
				local nav_seg = managers.navigation._nav_segments[objective.nav_seg]

				if nav_seg then
					slot9 = 700
					near_pos = CopLogicTravel._get_pos_on_wall(slot7, nav_seg.pos)
					occupation = {
						type = "defend",
						seg = objective.nav_seg,
						pos = near_pos,
						radius = objective.radius
					}
				else
					slot9 = inspect(slot10)
					slot12 = managers.navigation._nav_segments

					debug_pause(slot7, "[CopLogicTravel._determine_destination_occupation] Can't find nav_seg for the objective!?", inspect(objective))
				end
			end
		end
	elseif objective.type == "phalanx" then
		slot5 = data.unit
		slot6 = objective.type
		local logic = data.unit.brain(slot4).get_logic_by_name(slot4, data.unit.brain(slot4))
		slot6 = data.unit

		logic.register_in_group_ai(data.unit.brain(slot4))

		slot7 = objective
		local phalanx_circle_pos = logic.calc_initial_phalanx_pos(data.unit.brain(slot4), data.m_pos)
		occupation = {
			type = "defend",
			seg = objective.nav_seg,
			pos = phalanx_circle_pos,
			radius = objective.radius
		}
	elseif objective.type == "act" then
		occupation = {
			type = "act",
			seg = objective.nav_seg,
			pos = objective.pos
		}
	elseif objective.type == "follow" then
		local my_data = data.internal_data
		slot6 = objective.follow_unit
		slot6 = objective.follow_unit.movement(slot5)
		local follow_tracker = objective.follow_unit.movement(slot5).nav_tracker(slot5)
		local dest_nav_seg_id = my_data.coarse_path[#my_data.coarse_path][1]
		slot8 = managers.groupai
		slot9 = dest_nav_seg_id
		local dest_area = managers.groupai.state(slot7).get_area_from_nav_seg_id(slot7, managers.groupai.state(slot7))
		slot9 = follow_tracker
		local follow_pos = follow_tracker.field_position(managers.groupai.state(slot7))
		local threat_pos = nil

		if data.attention_obj and data.attention_obj.nav_tracker and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction then
			slot11 = data.attention_obj.nav_tracker
			threat_pos = data.attention_obj.nav_tracker.field_position(slot10)
		end

		slot15 = threat_pos
		local cover = managers.navigation.find_cover_in_nav_seg_3(slot10, managers.navigation, dest_area.nav_segs, nil, follow_pos)

		if cover then
			local cover_entry = {
				cover
			}
			occupation = {
				type = "defend",
				cover = cover_entry
			}
		else
			local max_dist = nil

			if objective.called then
				max_dist = 600
			end

			slot14 = max_dist
			local to_pos = CopLogicTravel._get_pos_on_wall(slot12, dest_area.pos)
			occupation = {
				type = "defend",
				pos = to_pos
			}
		end
	elseif objective.type == "revive" then

		-- Decompilation error in this vicinity:
		local is_local_player = objective.follow_unit.base(slot4).is_local_player
		local revive_u_mv = objective.follow_unit.movement(objective.follow_unit)
		slot7 = revive_u_mv
		local revive_u_tracker = revive_u_mv.nav_tracker(objective.follow_unit)
		local revive_u_fwd = revive_u_rot.y(slot8)
		local revive_u_right = revive_u_rot.x(revive_u_rot)
		slot11 = revive_u_tracker
		local ray_params = {
			trace = true,
			tracker_from = revive_u_tracker
		}
		slot13 = revive_u_tracker

		if revive_u_tracker.lost(slot12) then
			ray_params.pos_from = revive_u_pos
		end

		local stand_dis = nil

		if 0.5 < math.random() then
			slot12 = 1
		else
			local rand_side_mul = -1
		end

		local revive_pos = mvector3.copy(slot14)
		slot17 = rand_side_mul * stand_dis

		mvector3.multiply(revive_u_right, revive_pos)

		slot17 = revive_u_pos

		mvector3.add(revive_u_right, revive_pos)

		ray_params.pos_to = revive_pos
		slot17 = ray_params
		local ray_res = managers.navigation.raycast(revive_u_right, managers.navigation)

		if ray_res then
			local opposite_pos = mvector3.copy(slot16)
			slot19 = -rand_side_mul * stand_dis

			mvector3.multiply(revive_u_right, opposite_pos)

			slot19 = revive_u_pos

			mvector3.add(revive_u_right, opposite_pos)

			ray_params.pos_to = opposite_pos
			local old_trace = ray_params.trace[1]
			slot20 = ray_params
			local opposite_ray_res = managers.navigation.raycast(opposite_pos, managers.navigation)

			if opposite_ray_res then
				slot21 = revive_u_pos
				slot22 = revive_u_pos

				if mvector3.distance(ray_params.trace[1], revive_pos) < mvector3.distance(slot19, ray_params.trace[1]) then
					revive_pos = ray_params.trace[1]
				else
					revive_pos = old_trace
				end
			else
				revive_pos = ray_params.trace[1]
			end
		else
			revive_pos = ray_params.trace[1]
		end

		local revive_rot = revive_u_pos - revive_pos
		slot19 = math.UP
		local revive_rot = Rotation(slot17, revive_rot)
		occupation = {
			type = "revive",
			pos = revive_pos,
			rot = revive_rot
		}
	else
		occupation = {
			seg = objective.nav_seg,
			pos = objective.pos
		}
	end

	return occupation
end
function CopLogicTravel._get_pos_on_wall(from_pos, max_dist, step_offset, is_recurse)
	local nav_manager = managers.navigation
	local nr_rays = 7

	if not max_dist then
		local ray_dis = 1000
	end

	local step = 360 / nr_rays

	if not step_offset then
		slot10 = 360
		local offset = math.random(slot9)
	end

	local step_rot = Rotation(slot10)
	local offset_rot = Rotation(step)
	slot15 = 0
	local offset_vec = Vector3(offset, ray_dis, 0)
	slot15 = offset_rot

	mvector3.rotate_with(ray_dis, offset_vec)

	local to_pos = mvector3.copy(ray_dis)
	slot16 = offset_vec

	mvector3.add(from_pos, to_pos)

	slot16 = from_pos
	local from_tracker = nav_manager.create_nav_tracker(from_pos, nav_manager)
	local ray_params = {
		allow_entry = false,
		trace = true,
		tracker_from = from_tracker,
		pos_to = to_pos
	}
	local rsrv_desc = {
		false,
		60
	}
	local fail_position = nil

	repeat
		slot19 = from_pos
		to_pos = mvector3.copy(slot18)
		slot20 = offset_vec

		mvector3.add(slot18, to_pos)

		ray_params.pos_to = to_pos
		slot20 = ray_params
		local ray_res = nav_manager.raycast(slot18, nav_manager)

		if ray_res then
			rsrv_desc.position = ray_params.trace[1]
			slot21 = rsrv_desc
			local is_free = nav_manager.is_pos_free(slot19, nav_manager)

			if is_free then
				slot22 = from_tracker

				managers.navigation.destroy_nav_tracker(slot20, managers.navigation)

				return ray_params.trace[1]
			end
		elseif not fail_position then
			rsrv_desc.position = ray_params.trace[1]
			slot21 = rsrv_desc
			local is_free = nav_manager.is_pos_free(slot19, nav_manager)

			if is_free then
				fail_position = to_pos
			end
		end

		slot21 = step_rot

		mvector3.rotate_with(slot19, offset_vec)

		nr_rays = nr_rays - 1
	until nr_rays == 0

	slot20 = from_tracker

	managers.navigation.destroy_nav_tracker(slot18, managers.navigation)

	if fail_position then
		return fail_position
	end

	if not is_recurse then
		slot22 = true

		return CopLogicTravel._get_pos_on_wall(slot18, from_pos, ray_dis * 0.5, offset + step * 0.5)
	end

	return from_pos
end
function CopLogicTravel.queue_update(data, my_data, delay)
	if data.important then
		delay = 0
	elseif not delay then
		delay = 0.3
	end

	slot3 = CopLogicBase.queue_task
	slot5 = my_data
	slot6 = my_data.upd_task_key
	slot7 = CopLogicTravel.queued_update
	slot8 = data
	slot9 = data.t + delay

	if data.important then
		slot10 = true
	end

	slot3(slot4, slot5, slot6, slot7, slot8, slot9)

	return 
end
function CopLogicTravel._try_anounce(data, my_data)
	local my_pos = data.m_pos
	local max_dis_sq = 2250000
	local my_key = data.key
	local announce_type = data.char_tweak.announce_incomming
	slot10 = managers.enemy

	for u_key, u_data in pairs(managers.enemy.all_enemies(slot9)) do
		if u_key ~= my_key then
			slot14 = u_data.unit

			if tweak_data.character[u_data.unit.base(slot13)._tweak_table].chatter[announce_type] then
				slot14 = u_data.m_pos

				if mvector3.distance_sq(slot12, my_pos) < max_dis_sq then
					slot13 = u_data.unit
					slot14 = data.t

					if not u_data.unit.sound(slot12).speaking(slot12, u_data.unit.sound(slot12)) then
						slot13 = u_data.unit
					end
				end
			end
		end
	end

	return 
end
function CopLogicTravel._get_all_paths(data)
	return {
		advance_path = data.internal_data.advance_path
	}
end
function CopLogicTravel._set_verified_paths(data, verified_paths)
	data.internal_data.advance_path = verified_paths.advance_path

	return 
end
function CopLogicTravel.chk_should_turn(data, my_data)
	if not my_data.advancing and not my_data.turning and not my_data.has_old_action then
		slot4 = data.unit
		slot5 = "walk"
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end
function CopLogicTravel.complete_coarse_path(data, my_data, coarse_path)
	local first_seg_id = coarse_path[1][1]
	slot6 = data.unit
	slot6 = data.unit.movement(slot5)
	slot6 = data.unit.movement(slot5).nav_tracker(slot5)
	local current_seg_id = data.unit.movement(slot5).nav_tracker(slot5).nav_segment(slot5)
	local all_nav_segs = managers.navigation._nav_segments

	if not coarse_path[1][2] then
		slot9 = all_nav_segs[first_seg_id].pos
		coarse_path[1][2] = mvector3.copy(slot8)
	end

	if first_seg_id ~= current_seg_id then
		slot10 = {
			current_seg_id,
			mvector3.copy(slot12)
		}
		slot13 = data.m_pos

		table.insert(slot7, coarse_path, 1)
	end

	local i_nav_point = 1

	while i_nav_point < #coarse_path do
		local nav_seg_id = coarse_path[i_nav_point][1]
		local next_nav_seg_id = coarse_path[i_nav_point + 1][1]
		local nav_seg = all_nav_segs[nav_seg_id]

		if not nav_seg.neighbours[next_nav_seg_id] then
			local search_params = {
				id = "CopLogicTravel_complete_coarse_path",
				from_seg = nav_seg_id,
				to_seg = next_nav_seg_id,
				access_pos = data.SO_access
			}
			slot14 = search_params
			local ins_coarse_path = managers.navigation.search_coarse(slot12, managers.navigation)

			if not ins_coarse_path then
				slot15 = "[CopLogicTravel.complete_coarse_path] Coarse path failed, can't path from one nav_seg to other."

				Application.debug(slot13, Application)

				return 
			end

			local i_insert = #ins_coarse_path - 1

			while 1 < i_insert do
				slot17 = ins_coarse_path[i_insert]

				table.insert(slot14, coarse_path, i_nav_point + 1)

				i_insert = i_insert - 1
			end
		end

		i_nav_point = i_nav_point + 1
	end

	if #coarse_path == 1 then
		slot11 = {
			current_seg_id,
			mvector3.copy(slot13)
		}
		slot14 = data.m_pos

		table.insert(slot8, coarse_path, 1)
	end

	local start_index = nil
	slot10 = coarse_path

	for i, nav_point in ipairs(slot9) do
		if current_seg_id == nav_point[1] then
			start_index = i
		end
	end

	if start_index then
		slot11 = #coarse_path - 1
		start_index = math.min(slot9, start_index)

		return start_index
	end

	local to_search_segs = {
		current_seg_id
	}
	local found_segs = {
		[current_seg_id] = "init"
	}

	repeat
		local search_seg_id = table.remove(slot11, to_search_segs)
		local search_seg = all_nav_segs[search_seg_id]
		slot14 = search_seg.neighbours

		for other_seg_id, door_list in pairs(1) do
			local other_seg = all_nav_segs[other_seg_id]

			if not other_seg.disabled and not found_segs[other_seg_id] then
				found_segs[other_seg_id] = search_seg_id

				if other_seg_id == first_seg_id then
					local last_added_seg_id = other_seg_id

					while found_segs[last_added_seg_id] ~= "init" do
						last_added_seg_id = found_segs[last_added_seg_id]
						slot23 = {
							last_added_seg_id,
							all_nav_segs[last_added_seg_id].pos
						}

						table.insert(slot20, coarse_path, 1)
					end

					return 1
				else
					slot21 = other_seg_id

					table.insert(slot19, to_search_segs)
				end
			end
		end
	until #to_search_segs == 0

	return 1
end
function CopLogicTravel._chk_close_to_criminal(data, my_data)
	if my_data.close_to_criminal == nil then
		my_data.close_to_criminal = false
		slot4 = managers.groupai
		slot7 = data.unit
		slot7 = data.unit.movement(slot6)
		slot7 = data.unit.movement(slot6).nav_tracker(slot6)
		local my_area = managers.groupai.state(slot3).get_area_from_nav_seg_id(slot3, data.unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6))
		slot5 = my_area.criminal.units

		if next(managers.groupai.state(slot3)) then
			my_data.close_to_criminal = true
		else
			slot5 = my_area.neighbours

			for _, nbr in pairs(slot4) do
				slot10 = nbr.criminal.units

				if next(slot9) then
					my_data.close_to_criminal = true

					break
				end
			end
		end
	end

	return my_data.close_to_criminal
end
function CopLogicTravel.chk_group_ready_to_move(data, my_data)
	local my_objective = data.objective

	if not my_objective.grp_objective then
		return true
	end

	slot6 = my_data

	if not CopLogicTravel._chk_close_to_criminal(slot4, data) then
		return true
	end

	slot6 = data.m_pos
	local my_dis = mvector3.distance_sq(slot4, my_objective.area.pos)

	if 4000000 < my_dis then
		return true
	end

	my_dis = my_dis * 1.15 * 1.15
	slot6 = data.group.units

	for u_key, u_data in pairs(slot5) do
		if u_key ~= data.key then
			slot11 = u_data.unit
			slot11 = u_data.unit.brain(slot10)
			local his_objective = u_data.unit.brain(slot10).objective(slot10)

			if his_objective and his_objective.grp_objective == my_objective.grp_objective and not his_objective.in_place then
				slot13 = u_data.m_pos
				local his_dis = mvector3.distance_sq(slot11, his_objective.area.pos)

				if my_dis < his_dis then
					return false
				end
			end
		end
	end

	return true
end
function CopLogicTravel.apply_wall_offset_to_cover(data, my_data, cover, wall_fwd_offset)
	local to_pos_fwd = tmp_vec1
	slot8 = cover[NavigationManager.COVER_FORWARD]

	mvector3.set(slot6, to_pos_fwd)

	slot8 = wall_fwd_offset

	mvector3.multiply(slot6, to_pos_fwd)

	slot8 = cover[1]

	mvector3.add(slot6, to_pos_fwd)

	local ray_params = {
		trace = true,
		tracker_from = cover[NavigationManager.COVER_TRACKER],
		pos_to = to_pos_fwd
	}
	slot9 = ray_params
	local collision = managers.navigation.raycast(to_pos_fwd, managers.navigation)

	if not collision then
		return cover[1]
	end

	local col_pos_fwd = ray_params.trace[1]
	local space_needed = mvector3.distance(slot9, col_pos_fwd) + wall_fwd_offset * 1.05
	local to_pos_bwd = tmp_vec2
	slot13 = cover[NavigationManager.COVER_FORWARD]

	mvector3.set(to_pos_fwd, to_pos_bwd)

	slot13 = -space_needed

	mvector3.multiply(to_pos_fwd, to_pos_bwd)

	slot13 = cover[1]

	mvector3.add(to_pos_fwd, to_pos_bwd)

	local ray_params = {
		trace = true,
		tracker_from = cover[NavigationManager.COVER_TRACKER],
		pos_to = to_pos_bwd
	}
	slot14 = ray_params
	local collision = managers.navigation.raycast(to_pos_bwd, managers.navigation)

	if not collision or not ray_params.trace[1] then
		slot14 = to_pos_bwd
		slot12 = mvector3.copy(slot13)
	end

	return slot12
end
function CopLogicTravel._find_cover(data, search_nav_seg, near_pos)
	local cover = nil
	slot6 = managers.groupai
	slot7 = search_nav_seg
	local search_area = managers.groupai.state(slot5).get_area_from_nav_seg_id(slot5, managers.groupai.state(slot5))

	if not search_area then
		return 
	end

	slot7 = data.unit
	slot7 = data.unit.movement(slot6)

	if data.unit.movement(slot6).cool(slot6) then
		slot8 = search_area.nav_segs
		cover = managers.navigation.find_cover_in_nav_seg_1(slot6, managers.navigation)
	else
		local optimal_threat_dis, threat_pos = nil

		if data.objective.attitude == "engage" then
			optimal_threat_dis = data.internal_data.weapon_range.optimal
		else
			optimal_threat_dis = data.internal_data.weapon_range.far
		end

		if not near_pos then
			near_pos = search_area.pos
		end

		slot9 = managers.groupai
		slot9 = managers.groupai.state(slot8)
		local all_criminals = managers.groupai.state(slot8).all_char_criminals(slot8)
		local closest_crim_u_data, closest_crim_dis = nil
		slot12 = all_criminals

		for u_key, u_data in pairs(slot11) do
			slot17 = managers.groupai
			slot17 = managers.groupai.state(slot16)
			slot20 = u_data.tracker
			local crim_area = managers.groupai.state(slot16).get_area_from_nav_seg_id(slot16, u_data.tracker.nav_segment(slot19))

			if crim_area == search_area then
				threat_pos = u_data.m_pos

				break
			else
				slot19 = u_data.m_pos
				local crim_dis = mvector3.distance_sq(slot17, near_pos)

				if not closest_crim_dis or crim_dis < closest_crim_dis then
					threat_pos = u_data.m_pos
					closest_crim_dis = crim_dis
				end
			end
		end

		slot16 = threat_pos
		cover = managers.navigation.find_cover_from_threat(slot11, managers.navigation, search_area.nav_segs, optimal_threat_dis, near_pos)
	end

	return cover
end
function CopLogicTravel._get_allowed_travel_nav_segs(data, my_data, to_pos)
	local nav_segs = {}
	local added_segs = {}
	slot7 = my_data.coarse_path

	for _, nav_point in ipairs(slot6) do
		slot12 = managers.groupai
		slot13 = nav_point[1]
		local area = managers.groupai.state(slot11).get_area_from_nav_seg_id(slot11, managers.groupai.state(slot11))

		if not area then
			return nil
		end

		slot13 = area.nav_segs

		for nav_seg_id, _ in pairs(slot12) do
			if not added_segs[nav_seg_id] then
				added_segs[nav_seg_id] = true
				slot19 = nav_seg_id

				table.insert(slot17, nav_segs)
			end
		end
	end

	slot9 = true
	local end_nav_seg = managers.navigation.get_nav_seg_from_pos(slot6, managers.navigation, to_pos)
	slot8 = managers.groupai
	slot9 = end_nav_seg
	local end_area = managers.groupai.state(managers.navigation).get_area_from_nav_seg_id(managers.navigation, managers.groupai.state(managers.navigation))
	slot9 = end_area.nav_segs

	for nav_seg_id, _ in pairs(managers.groupai.state(managers.navigation)) do
		if not added_segs[nav_seg_id] then
			added_segs[nav_seg_id] = true
			slot15 = nav_seg_id

			table.insert(slot13, nav_segs)
		end
	end

	slot9 = data.unit
	slot9 = data.unit.movement(slot8)
	slot9 = data.unit.movement(slot8).nav_tracker(slot8)
	local standing_nav_seg = data.unit.movement(slot8).nav_tracker(slot8).nav_segment(slot8)

	if not added_segs[standing_nav_seg] then
		slot11 = standing_nav_seg

		table.insert(slot9, nav_segs)

		added_segs[standing_nav_seg] = true
	end

	return nav_segs
end
function CopLogicTravel._check_start_path_ahead(data)
	local my_data = data.internal_data

	if my_data.processing_advance_path then
		return 
	end

	local objective = data.objective
	local coarse_path = my_data.coarse_path

	if not my_data.coarse_path_index then
		local txt = "[CopLogicTravel._check_start_path_ahead] my_data.coarse_path_index is nill! "
		slot7 = managers.groupai

		if managers.groupai.visualization_enabled(slot6) then
			slot10 = my_data.coarse_path_index
			slot13 = my_data.coarse_path

			debug_pause_unit(slot6, data.unit, txt, data.unit, inspect(slot12))

			slot12 = 0

			Application.draw_line(slot6, Application, data.m_pos, my_data.pathing_debug.from_pos, 1, 0)

			slot13 = 0

			Application.draw_cone(slot6, Application, my_data.pathing_debug.to_pos, my_data.pathing_debug.from_pos, 20, 1, 0)
		else
			slot9 = my_data.coarse_path_index
			slot12 = my_data.coarse_path

			print(slot6, txt, data.unit, inspect(slot11))
		end

		return 
	end

	local next_index = my_data.coarse_path_index + my_data.coarse_path_step + 1
	local total_nav_points = #coarse_path

	if total_nav_points < next_index then
		return 
	end

	slot9 = next_index
	local to_pos = data.logic._get_exact_move_pos(slot7, data)

	if not to_pos then
		slot10 = my_data

		CopLogicTravel._begin_coarse_pathing(slot8, data)

		return 
	end

	my_data.processing_advance_path = true
	slot9 = data
	local prio = data.logic.get_pathing_prio(slot8)
	local from_pos = data.pos_rsrv.move_dest.position
	slot13 = to_pos
	local nav_segs = CopLogicTravel._get_allowed_travel_nav_segs(slot10, data, my_data)

	if not nav_segs then
		slot13 = my_data

		CopLogicTravel._begin_coarse_pathing(slot11, data)

		return 
	end

	slot12 = Application

	if Application.production_build(slot11) then
		slot13 = from_pos

		mvector3.set(slot11, my_data.pathing_debug.from_pos)

		slot13 = to_pos

		mvector3.set(slot11, my_data.pathing_debug.to_pos)
	end

	slot12 = data.unit
	slot18 = nav_segs

	data.unit.brain(slot11).search_for_path_from_pos(slot11, data.unit.brain(slot11), my_data.advance_path_search_id, from_pos, to_pos, prio, nil)

	return 
end
function CopLogicTravel.get_pathing_prio(data)
	local prio = nil
	local objective = data.objective

	if objective then
	end

	return prio
end
function CopLogicTravel._get_exact_move_pos(data, nav_index)
	local my_data = data.internal_data
	local objective = data.objective
	local to_pos = nil
	local coarse_path = my_data.coarse_path
	local total_nav_points = #coarse_path
	local reservation, wants_reservation = nil

	if total_nav_points <= nav_index then
		slot12 = objective
		local new_occupation = data.logic._determine_destination_occupation(slot10, data)

		if new_occupation then
			if new_occupation.type == "guard" then
				local guard_door = new_occupation.door
				slot14 = objective.nav_seg
				local guard_pos = CopLogicTravel._get_pos_accross_door(slot12, guard_door)

				if guard_pos then
					slot15 = guard_pos
					reservation = CopLogicTravel._reserve_pos_along_vec(slot13, guard_door.center)

					if reservation then
						local guard_object = {
							type = "door",
							door = guard_door,
							from_seg = new_occupation.from_seg
						}
						objective.guard_obj = guard_object
						to_pos = reservation.pos
					end
				end
			elseif new_occupation.type == "defend" then
				if new_occupation.cover then
					to_pos = new_occupation.cover[1][NavigationManager.COVER_POSITION]

					if data.char_tweak.wall_fwd_offset then
						slot15 = data.char_tweak.wall_fwd_offset
						to_pos = CopLogicTravel.apply_wall_offset_to_cover(slot11, data, my_data, new_occupation.cover[1])
					end

					if my_data.moving_to_cover then
						slot13 = my_data.moving_to_cover[1]

						managers.navigation.release_cover(slot11, managers.navigation)
					end

					local new_cover = new_occupation.cover
					slot15 = data.pos_rsrv_id

					managers.navigation.reserve_cover(slot12, managers.navigation, new_cover[1])

					my_data.moving_to_cover = new_cover
				elseif new_occupation.pos then
					to_pos = new_occupation.pos
				end

				wants_reservation = true
			elseif new_occupation.type == "act" then
				to_pos = new_occupation.pos
				wants_reservation = true
			elseif new_occupation.type == "revive" then
				to_pos = new_occupation.pos
				objective.rot = new_occupation.rot
				wants_reservation = true
			else
				to_pos = new_occupation.pos
				wants_reservation = true
			end
		end

		if not to_pos then
			slot13 = objective.nav_seg
			to_pos = managers.navigation.find_random_position_in_segment(slot11, managers.navigation)
			slot12 = to_pos
			to_pos = CopLogicTravel._get_pos_on_wall(slot11)
			wants_reservation = true
		end
	else
		if my_data.moving_to_cover then
			slot12 = my_data.moving_to_cover[1]

			managers.navigation.release_cover(slot10, managers.navigation)

			my_data.moving_to_cover = nil
		end

		local nav_seg = coarse_path[nav_index][1]
		slot12 = managers.groupai
		slot13 = nav_seg
		local area = managers.groupai.state(slot11).get_area_from_nav_seg_id(slot11, managers.groupai.state(slot11))

		if not area then
			return nil
		end

		slot14 = area.nav_segs
		local cover = managers.navigation.find_cover_in_nav_seg_1(slot12, managers.navigation)

		if cover then
			slot16 = data.pos_rsrv_id

			managers.navigation.reserve_cover(slot13, managers.navigation, cover)

			my_data.moving_to_cover = {
				cover
			}
			to_pos = cover[1]
		else
			to_pos = coarse_path[nav_index][2]
		end
	end

	if not reservation and wants_reservation then
		slot13 = {
			radius = 60,
			position = mvector3.copy(slot15)
		}
		slot16 = to_pos

		data.brain.add_pos_rsrv(slot10, data.brain, "path")
	end

	return to_pos
end
function CopLogicTravel._on_destination_reached(data)
	local objective = data.objective
	objective.in_place = true

	if objective.type == "free" or objective.type == "turret" then
		if not objective.action_duration then
			slot5 = objective

			data.objective_complete_clbk(slot3, data.unit)

			return 
		end
	elseif objective.type == "flee" then
		slot4 = data.unit
		slot5 = false

		data.unit.brain(slot3).set_active(slot3, data.unit.brain(slot3))

		slot4 = data.unit
		slot6 = 0

		data.unit.base(slot3).set_slot(slot3, data.unit.base(slot3), data.unit)

		return 
	elseif objective.type == "defend_area" then
		if objective.grp_objective and objective.grp_objective.type == "retire" then
			if not objective.grp_objective.action then
				slot4 = data.unit
				slot5 = false

				data.unit.brain(slot3).set_active(slot3, data.unit.brain(slot3))

				slot4 = data.unit
				slot6 = 0

				data.unit.base(slot3).set_slot(slot3, data.unit.base(slot3), data.unit)

				return 
			else
				objective.grp_objective.type = "act"
			end
		else
			slot4 = managers.groupai
			slot6 = objective

			managers.groupai.state(slot3).on_defend_travel_end(slot3, managers.groupai.state(slot3), data.unit)
		end
	end

	slot4 = data

	data.logic.on_new_objective(slot3)

	return 
end
function CopLogicTravel._chk_start_pathing_to_next_nav_point(data, my_data)
	slot5 = my_data

	if not CopLogicTravel.chk_group_ready_to_move(slot3, data) then
		return 
	end

	local total_nav_points = #my_data.coarse_path
	local step = 1

	if 1 < total_nav_points - my_data.coarse_path_index then
		step = 1
	end

	my_data.coarse_path_step = step
	slot7 = my_data.coarse_path_index + step
	local to_pos = CopLogicTravel._get_exact_move_pos(slot5, data)

	if not to_pos then
		slot8 = my_data

		CopLogicTravel._begin_coarse_pathing(slot6, data)

		return 
	end

	my_data.processing_advance_path = true
	local prio = data.logic.get_pathing_prio(slot6)
	slot10 = to_pos
	local nav_segs = CopLogicTravel._get_allowed_travel_nav_segs(data, data, my_data)

	if not nav_segs then
		slot10 = my_data

		CopLogicTravel._begin_coarse_pathing(slot8, data)

		return 
	end

	slot9 = Application

	if Application.production_build(slot8) then
		slot10 = data.m_pos

		mvector3.set(slot8, my_data.pathing_debug.from_pos)

		slot10 = to_pos

		mvector3.set(slot8, my_data.pathing_debug.to_pos)
	end

	slot9 = data.unit
	slot14 = nav_segs

	data.unit.brain(slot8).search_for_path(slot8, data.unit.brain(slot8), my_data.advance_path_search_id, to_pos, prio, nil)

	return 
end
function CopLogicTravel._begin_coarse_pathing(data, my_data)
	local verify_clbk = nil

	if my_data.path_safely then
		slot7 = "_investigate_coarse_path_verify_clbk"
		verify_clbk = callback(slot4, CopLogicTravel, CopLogicTravel)
	end

	local nav_seg = nil

	if data.objective.follow_unit then
		slot8 = data.objective.follow_unit
		slot8 = data.objective.follow_unit.movement(slot7)
	else
		nav_seg = data.objective.nav_seg
	end

	slot6 = data.unit
	slot9 = verify_clbk

	if data.unit.brain(slot5).search_for_coarse_path(slot5, data.unit.brain(slot5), my_data.coarse_path_search_id, nav_seg) then
		my_data.processing_coarse_path = true
	end

	return 
end
function CopLogicTravel._chk_begin_advance(data, my_data)
	slot4 = data.unit
	slot5 = "walk"

	if data.unit.movement(slot3).chk_action_forbidden(slot3, data.unit.movement(slot3)) then
		return 
	end

	local objective = data.objective
	local haste = nil

	if objective and objective.haste then
		haste = objective.haste
	else
		slot6 = data.unit
		slot6 = data.unit.movement(slot5)

		if data.unit.movement(slot5).cool(slot5) then
			haste = "walk"
		else
			haste = "run"
		end
	end

	local pose = nil

	if not data.char_tweak.crouch_move then
		pose = "stand"
	elseif data.char_tweak.allowed_poses and not data.char_tweak.allowed_poses.stand then
		pose = "crouch"
	elseif data.is_suppressed then
		pose = "crouch"
	elseif not objective or not objective.pose then
		pose = "stand"
	end

	slot7 = data.unit

	if not data.unit.anim_data(slot6)[pose] then
		slot7 = data

		CopLogicAttack["_request_action_" .. pose]("_request_action_" .. pose)
	end

	local end_rot = nil

	if #my_data.coarse_path - 1 <= my_data.coarse_path_index and objective then
		end_rot = objective.rot
	end

	local no_strafe = false
	slot9 = data.unit
	slot9 = data.unit.movement(slot8)

	if not data.unit.movement(slot8).cool(slot8) then
		slot11 = "player"

		if data.team.foes[tweak_data.levels.get_default_team_ID(slot9, tweak_data.levels)] then
			slot7 = not my_data.attention_unit
		end
	else
		slot7 = false

		if false then
			local close_in_fast = true
		end
	end

	if close_in_fast then
		pose = "stand"
		haste = "run"
		no_strafe = true
	end

	local end_pose = nil

	if my_data.moving_to_cover and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
		end_pose = "crouch"
	end

	slot11 = data.unit

	if data.unit.brain(slot10).is_flamer then
		no_strafe = true
	end

	slot16 = end_pose

	CopLogicTravel._chk_request_action_walk_to_advance_pos(slot10, data, my_data, haste, end_rot, no_strafe)

	return 
end
function CopLogicTravel._chk_stop_for_follow_unit(data, my_data)

	-- Decompilation error in this vicinity:
	local objective = data.objective

	if not my_data.coarse_path_index then
		slot8 = inspect(slot9)
		slot11 = my_data

		debug_pause_unit(slot4, data.unit, "[CopLogicTravel._chk_stop_for_follow_unit]", data.unit, inspect(data))

		return 
	end

	slot5 = data.objective.follow_unit
	slot5 = data.objective.follow_unit.movement(slot4)
	local follow_unit_nav_seg = data.objective.follow_unit.movement(slot4).nav_tracker(slot4).nav_segment(slot4)
	slot6 = data.unit
	slot6 = data.unit.movement(data.objective.follow_unit.movement(slot4).nav_tracker(slot4))
	slot6 = data.unit.movement(data.objective.follow_unit.movement(slot4).nav_tracker(slot4)).nav_tracker(data.objective.follow_unit.movement(slot4).nav_tracker(slot4))
	local my_nav_seg = data.unit.movement(data.objective.follow_unit.movement(slot4).nav_tracker(slot4)).nav_tracker(data.objective.follow_unit.movement(slot4).nav_tracker(slot4)).nav_segment(data.objective.follow_unit.movement(slot4).nav_tracker(slot4))

	if follow_unit_nav_seg == my_nav_seg then
		objective.in_place = true
		slot7 = data

		data.logic.on_new_objective(slot6)
	end

	return 
end

return 
