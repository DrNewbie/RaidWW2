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
slot2 = "lib/units/enemies/cop/logics/CopLogicBase"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicTravel"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicAttack"

require(slot1)

slot2 = TeamAILogicBase
TeamAILogicTravel = class(slot1)
TeamAILogicTravel.damage_clbk = TeamAILogicIdle.damage_clbk
TeamAILogicTravel.on_cop_neutralized = TeamAILogicIdle.on_cop_neutralized
TeamAILogicTravel.on_objective_unit_damaged = TeamAILogicIdle.on_objective_unit_damaged
TeamAILogicTravel.on_alert = TeamAILogicIdle.on_alert
TeamAILogicTravel.on_long_dis_interacted = TeamAILogicIdle.on_long_dis_interacted
TeamAILogicTravel.on_new_objective = TeamAILogicIdle.on_new_objective
TeamAILogicTravel.clbk_heat = TeamAILogicIdle.clbk_heat
TeamAILogicTravel._upd_pathing = CopLogicTravel._upd_pathing
TeamAILogicTravel._get_exact_move_pos = CopLogicTravel._get_exact_move_pos
TeamAILogicTravel.chk_should_turn = CopLogicTravel.chk_should_turn
TeamAILogicTravel._get_all_paths = CopLogicTravel._get_all_paths
TeamAILogicTravel._set_verified_paths = CopLogicTravel._set_verified_paths
TeamAILogicTravel.get_pathing_prio = CopLogicTravel.get_pathing_prio
TeamAILogicTravel.on_action_completed = CopLogicTravel.on_action_completed
TeamAILogicTravel.on_intimidated = TeamAILogicIdle.on_intimidated
function TeamAILogicTravel.enter(data, new_logic_name, enter_params)

	-- Decompilation error in this vicinity:
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit
	slot6 = data.unit.brain(slot5)

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	my_data.detection = data.char_tweak.detection.recon
	my_data.vision = data.char_tweak.vision.idle

	if old_internal_data then
		my_data.attention_unit = old_internal_data.attention_unit
	end

	data.internal_data = my_data
	local key_str = tostring(slot6)
	slot8 = data.unit
	slot8 = data.unit.movement(data.key)

	if not data.unit.movement(data.key).cool(data.key) then
		my_data.detection_task_key = "TeamAILogicTravel._upd_enemy_detection" .. key_str
		slot12 = data.t

		CopLogicBase.queue_task(key_str, my_data, my_data.detection_task_key, TeamAILogicTravel._upd_enemy_detection, data)
	end

	my_data.cover_update_task_key = "TeamAILogicTravel._update_cover" .. key_str

	if my_data.nearest_cover or my_data.best_cover then
		slot15 = data
		slot11 = data.t + 1

		CopLogicBase.add_delayed_clbk(slot7, my_data, my_data.cover_update_task_key, callback(slot11, CopLogicTravel, CopLogicTravel, "_update_cover"))
	end

	slot9 = data.key
	my_data.advance_path_search_id = "TeamAILogicTravel_detailed" .. tostring(slot8)
	slot9 = data.key
	my_data.coarse_path_search_id = "TeamAILogicTravel_coarse" .. tostring(slot8)
	slot10 = "player"
	my_data.path_ahead = data.team.id == tweak_data.levels.get_default_team_ID(slot8, tweak_data.levels)

	if data.objective then
		data.objective.called = false
		my_data.called = true

		if data.objective.follow_unit then
			my_data.cover_wait_t = {
				0,
				0
			}
		end

		if data.objective.path_style == "warp" then
			my_data.warp_pos = data.objective.pos
		end
	end

	slot8 = data.unit
	slot9 = false

	data.unit.movement(slot7).set_allow_fire(slot7, data.unit.movement(slot7))

	slot9 = data.unit
	slot9 = data.unit.inventory(data.unit.movement(slot7))
	slot9 = data.unit.inventory(data.unit.movement(slot7)).equipped_unit(data.unit.movement(slot7))
	slot9 = data.unit.inventory(data.unit.movement(slot7)).equipped_unit(data.unit.movement(slot7)).base(data.unit.movement(slot7))
	my_data.weapon_range = data.char_tweak.weapon[data.unit.inventory(data.unit.movement(slot7)).equipped_unit(data.unit.movement(slot7)).base(data.unit.movement(slot7)).weapon_tweak_data(data.unit.movement(slot7)).usage].range
	slot8 = data.unit
	slot9 = "walk"
	slot8 = Application

	if Application.production_build(slot7) then
		my_data.pathing_debug = {
			from_pos = Vector3(),
			to_pos = Vector3()
		}
	end

	return 
end
function TeamAILogicTravel.exit(data, new_logic_name, enter_params)
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
function TeamAILogicTravel.update(data)
	slot3 = data

	TeamAILogicTravel._upd_ai_perceptors(slot2)

	slot3 = data

	return CopLogicTravel.upd_advance(slot2)
end
function TeamAILogicTravel._upd_enemy_detection(data)
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	data.t = TimerManager.game(slot2).time(slot2)
	local my_data = data.internal_data
	local max_reaction = nil

	if data.cool then
		max_reaction = AIAttentionObject.REACT_SURPRISED
	end

	slot7 = max_reaction
	local delay = CopLogicBase._upd_attention_obj_detection(slot4, data, AIAttentionObject.REACT_CURIOUS)
	local new_attention, new_prio_slot, new_reaction = TeamAILogicIdle._get_priority_attention(data, data, data.detected_attention_objects)
	slot11 = new_reaction

	TeamAILogicBase._set_attention_obj(nil, data, new_attention)

	if new_attention then
		local objective = data.objective
		local allow_trans, obj_failed = nil
		local dont_exit = false
		slot13 = data.unit
		slot14 = "walk"

		if data.unit.movement(slot12).chk_action_forbidden(slot12, data.unit.movement(slot12)) then
			slot13 = data.unit
		else
			slot16 = new_attention
			allow_trans, obj_failed = CopLogicBase.is_obstructed(slot12, data, objective, nil)
		end

		if obj_failed and not dont_exit then
			if objective.type == "follow" then
				slot16 = obj_failed
				slot19 = objective

				debug_pause_unit(slot12, data.unit, "failing follow", allow_trans, inspect(slot18))
			end

			slot14 = data.objective

			data.objective_failed_clbk(slot12, data.unit)

			return 
		end
	end

	slot10 = my_data

	CopLogicAttack._upd_aim(slot8, data)

	if not my_data._intimidate_t or my_data._intimidate_t + 2 < data.t then
		slot12 = false
		local civ = TeamAILogicIdle.intimidate_civilians(slot8, data, data.unit, true)

		if civ then
			my_data._intimidate_t = data.t

			if not data.attention_obj then
				slot11 = civ

				CopLogicBase._set_attention_on_unit(slot9, data)

				slot11 = data.key
				local key = "RemoveAttentionOnUnit" .. tostring(data)
				slot17 = civ
				slot15 = data.t + 1.5

				CopLogicBase.queue_task(data, my_data, key, TeamAILogicTravel._remove_enemy_attention, {
					data = data,
					target_key = civ.key(slot16)
				})
			end
		end
	end

	slot10 = my_data

	TeamAILogicAssault._chk_request_combat_chatter(slot8, data)

	slot10 = my_data

	TeamAILogicIdle._upd_sneak_spotting(slot8, data)

	slot13 = data.t + delay

	CopLogicBase.queue_task(slot8, my_data, my_data.detection_task_key, TeamAILogicTravel._upd_enemy_detection, data)

	return 
end
function TeamAILogicTravel._remove_enemy_attention(param)
	local data = param.data

	if not data.attention_obj or data.attention_obj.u_key ~= param.target_key then
		return 
	end

	slot4 = data

	CopLogicBase._reset_attention(slot3)

	return 
end
function TeamAILogicTravel.is_available_for_assignment(data, new_objective)
	if new_objective and new_objective.forced then
		return true
	elseif data.objective and data.objective.type == "act" then
		if (not new_objective or (new_objective and new_objective.type == "free")) and data.objective.interrupt_dis == -1 then
			return true
		end

		return 
	else
		slot5 = new_objective

		return TeamAILogicAssault.is_available_for_assignment(slot3, data)
	end

	return 
end
function TeamAILogicTravel._upd_ai_perceptors(data)
	if not TeamAILogicTravel._ai_perceptors_t then
		TeamAILogicTravel._ai_perceptors_t = data.t
	end

	if data.t < TeamAILogicTravel._ai_perceptors_t then
		return 
	end

	if not TeamAILogicTravel._ai_perceptors then
		TeamAILogicTravel._ai_perceptors = {}
		local players = managers.player.players()
		slot4 = players

		for _, p in ipairs(managers.player) do
			slot9 = managers.network
			slot10 = p
			slot9 = managers.network.session(slot8).peer_by_unit(slot8, managers.network.session(slot8))
			local id = managers.network.session(slot8).peer_by_unit(slot8, managers.network.session(slot8)).id(slot8)
			TeamAILogicTravel._ai_perceptors[id] = {
				is_moving = false,
				is_rotating = false,
				position = Vector3(),
				rotation = Rotation(),
				last_position = Vector3(),
				last_rotation = Rotation()
			}
			slot10 = TeamAILogicTravel._ai_perceptors[id].position
			slot13 = p

			mvector3.set(, p.position(slot12))

			slot10 = TeamAILogicTravel._ai_perceptors[id].last_position
			slot13 = p

			mvector3.set(, p.position(slot12))

			slot13 = p
			slot13 = p.camera(slot12)
			slot14 = p
			slot14 = p.camera(p.camera(slot12).rotation(slot12))
			slot12 = p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12)).pitch(p.camera(slot12).rotation(slot12))
			slot15 = p
			slot15 = p.camera(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12)))
			slot15 = p.camera(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))).rotation(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12)))

			mrotation.set_yaw_pitch_roll(, TeamAILogicTravel._ai_perceptors[id].rotation, p.camera(slot12).rotation(slot12).yaw(slot12), p.camera(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))).rotation(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))).roll(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))))

			slot13 = p
			slot13 = p.camera(slot12)
			slot14 = p
			slot14 = p.camera(p.camera(slot12).rotation(slot12))
			slot12 = p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12)).pitch(p.camera(slot12).rotation(slot12))
			slot15 = p
			slot15 = p.camera(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12)))
			slot15 = p.camera(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))).rotation(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12)))

			mrotation.set_yaw_pitch_roll(, TeamAILogicTravel._ai_perceptors[id].last_rotation, p.camera(slot12).rotation(slot12).yaw(slot12), p.camera(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))).rotation(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))).roll(p.camera(p.camera(slot12).rotation(slot12)).rotation(p.camera(slot12).rotation(slot12))))
		end

		TeamAILogicTravel._ai_perceptors_t = TeamAILogicTravel._ai_perceptors_t + 0.5

		return 
	end

	local DISTANCE_THRESHOLD = 0.1 * tweak_data.player.team_ai.movement.speed.WALKING_SPEED
	local ROTATION_THRESHOLD = 100
	local players = managers.player.players(slot4)
	slot6 = players

	for _, p in ipairs(managers.player) do
		slot11 = managers.network
		slot12 = p
		local id = managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10)).id(slot10)
		slot13 = TeamAILogicTravel._ai_perceptors[id].position

		mvector3.set(managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10)), TeamAILogicTravel._ai_perceptors[id].last_position)

		slot12 = TeamAILogicTravel._ai_perceptors[id].position
		slot15 = p

		mvector3.set(managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10)), p.position(slot14))

		slot14 = TeamAILogicTravel._ai_perceptors[id].rotation.pitch(TeamAILogicTravel._ai_perceptors[id].rotation)
		slot17 = TeamAILogicTravel._ai_perceptors[id].rotation

		mrotation.set_yaw_pitch_roll(managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10)), TeamAILogicTravel._ai_perceptors[id].last_rotation, TeamAILogicTravel._ai_perceptors[id].rotation.yaw(slot14), TeamAILogicTravel._ai_perceptors[id].rotation.roll(TeamAILogicTravel._ai_perceptors[id].rotation))

		slot15 = p
		slot15 = p.camera(slot14)
		slot16 = p
		slot16 = p.camera(p.camera(slot14).rotation(slot14))
		slot14 = p.camera(p.camera(slot14).rotation(slot14)).rotation(p.camera(slot14).rotation(slot14)).pitch(p.camera(slot14).rotation(slot14))
		slot17 = p
		slot17 = p.camera(p.camera(p.camera(slot14).rotation(slot14)).rotation(p.camera(slot14).rotation(slot14)))
		slot17 = p.camera(p.camera(p.camera(slot14).rotation(slot14)).rotation(p.camera(slot14).rotation(slot14))).rotation(p.camera(p.camera(slot14).rotation(slot14)).rotation(p.camera(slot14).rotation(slot14)))

		mrotation.set_yaw_pitch_roll(managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10)), TeamAILogicTravel._ai_perceptors[id].rotation, p.camera(slot14).rotation(slot14).yaw(slot14), p.camera(p.camera(p.camera(slot14).rotation(slot14)).rotation(p.camera(slot14).rotation(slot14))).rotation(p.camera(p.camera(slot14).rotation(slot14)).rotation(p.camera(slot14).rotation(slot14))).roll(p.camera(p.camera(slot14).rotation(slot14)).rotation(p.camera(slot14).rotation(slot14))))

		local dist_vec = TeamAILogicTravel._ai_perceptors[id].position - TeamAILogicTravel._ai_perceptors[id].last_position
		slot13 = dist_vec
		local dist = dist_vec.length(TeamAILogicTravel._ai_perceptors[id].rotation)
		TeamAILogicTravel._ai_perceptors[id].is_moving = true

		if dist <= DISTANCE_THRESHOLD then
			TeamAILogicTravel._ai_perceptors[id].is_moving = false
		end

		local rot_diff = Rotation.rotation_difference(slot13, Rotation, TeamAILogicTravel._ai_perceptors[id].rotation)
		slot17 = rot_diff
		local diff_sum = math.abs(rot_diff.yaw(TeamAILogicTravel._ai_perceptors[id].last_rotation))
		TeamAILogicTravel._ai_perceptors[id].is_rotating = true

		if diff_sum <= ROTATION_THRESHOLD then
			TeamAILogicTravel._ai_perceptors[id].is_rotating = false
		end
	end

	TeamAILogicTravel._ai_perceptors_t = TeamAILogicTravel._ai_perceptors_t + 0.5

	return 
end
function TeamAILogicTravel._is_player_camping(p)
	if not TeamAILogicTravel._ai_perceptors then
		return 
	end

	slot3 = managers.network
	slot4 = p
	slot3 = managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2))
	local id = managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2)).id(slot2)

	return not TeamAILogicTravel._ai_perceptors[id].is_moving and not TeamAILogicTravel._ai_perceptors[id].is_rotating
end
function TeamAILogicTravel._players_that_are_camping()
	slot2 = managers.player
	local players = managers.player.players(slot1)
	local campers = {}
	slot4 = players

	for _, p in ipairs(slot3) do
		slot9 = p

		if TeamAILogicTravel._is_player_camping(slot8) then
			slot10 = p

			table.insert(slot8, campers)
		end
	end

	return campers
end
function TeamAILogicTravel._unit_cones(units, cone_depth)
	local cones = {}
	slot5 = units

	for _, u in ipairs(slot4) do
		local cone_top = Vector3()
		slot14 = u

		mvector3.set(slot10, u.movement(slot13).m_head_pos(slot13))

		local rot = Rotation()
		slot15 = u
		slot15 = u.movement(u.movement(slot13))
		slot15 = u.movement(u.movement(slot13)).m_head_rot(u.movement(slot13))
		slot15 = 0

		mrotation.set_yaw_pitch_roll(cone_top, rot, u.movement(u.movement(slot13)).m_head_rot(u.movement(slot13)).yaw(u.movement(slot13)), 0)

		local rot_vec = rot.y(cone_top)

		mvector3.normalize(rot)

		local cone_base = cone_top + cone_depth * rot_vec
		local cone_angle = managers.user.get_setting(rot_vec, managers.user)
		local cone = {
			cone_top = cone_top,
			cone_base = cone_base,
			cone_angle = cone_angle
		}
		slot17 = cone

		table.insert("fov_standard", cones)
	end

	return cones
end
function TeamAILogicTravel._determine_destination_occupation(data, objective)
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
				slot8 = 700
				near_pos = CopLogicTravel._get_pos_on_wall(slot6, managers.navigation._nav_segments[objective.nav_seg].pos)
				occupation = {
					type = "defend",
					seg = objective.nav_seg,
					pos = near_pos,
					radius = objective.radius
				}
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

		local campers = TeamAILogicTravel._players_that_are_camping()
		slot13 = 400
		local cones_to_send = TeamAILogicTravel._unit_cones(slot11, campers)
		slot18 = cones_to_send
		local cover = managers.navigation.find_cover_in_nav_seg_excluding_cones(campers, managers.navigation, dest_area.nav_segs, nil, follow_pos, threat_pos)

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

			slot16 = max_dist
			local to_pos = CopLogicTravel._get_pos_on_wall(slot14, dest_area.pos)
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
		local rand_side_mul = (0.5 < math.random() and 1) or -1
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
function TeamAILogicTravel._draw_debug_unit_cones(cones)
	slot7 = 0.5
	slot5 = 2
	local brush = Draw.brush(slot2, Draw, Color.green.with_alpha(slot5, Color.green))
	slot4 = cones

	for _, c in ipairs(Draw) do
		slot9 = c.cone_top - c.cone_base
		local h = c.cone_top - c.cone_base.length(c.cone_base)
		local angle = c.cone_angle / 2
		local radius = math.tan(slot10) * h
		slot15 = radius

		brush.cone(angle, brush, c.cone_top, c.cone_base)
	end

	return 
end

return 
