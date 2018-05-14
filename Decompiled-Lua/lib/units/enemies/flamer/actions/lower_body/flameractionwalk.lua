-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local mvec3_set = mvector3.set
local mvec3_z = mvector3.z
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_lerp = mvector3.lerp
local mvec3_cpy = mvector3.copy
local mvec3_set_l = mvector3.set_length
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_len = mvector3.length
local mvec3_rot = mvector3.rotate_with
local mrot_lookat = mrotation.set_look_at
local mrot_slerp = mrotation.slerp
local math_abs = math.abs
local math_max = math.max
local math_min = math.min
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local tmp_vec4 = Vector3()
local temp_rot1 = Rotation()
slot28 = "base"
local idstr_base = Idstring(slot27)

if not FlamerActionWalk then
	slot29 = CopActionWalk
	slot27 = class(slot28)
end

FlamerActionWalk = slot27
FlamerActionWalk.DISTANCE_SPRINT_START = 30000
FlamerActionWalk.DISTANCE_SPRINT_END = 1200
FlamerActionWalk._walk_anim_velocities = {
	stand = {
		cbt = {
			walk = {
				bwd = 112.85,
				l = 118.53,
				fwd = 144,
				r = 122.48
			},
			run = {
				bwd = 357.23,
				l = 287.43,
				fwd = 361.5,
				r = 318.33
			}
		}
	}
}
FlamerActionWalk._walk_anim_velocities.stand.ntl = FlamerActionWalk._walk_anim_velocities.stand.cbt
FlamerActionWalk._walk_anim_velocities.stand.hos = FlamerActionWalk._walk_anim_velocities.stand.cbt
FlamerActionWalk._walk_anim_velocities.stand.wnd = FlamerActionWalk._walk_anim_velocities.stand.cbt
FlamerActionWalk._walk_anim_velocities.crouch = FlamerActionWalk._walk_anim_velocities.stand
FlamerActionWalk._walk_anim_lengths = {
	stand = {
		cbt = {
			walk = {
				bwd = 40,
				l = 40,
				fwd = 34,
				r = 38
			},
			run = {
				bwd = 21,
				l = 20,
				fwd = 20,
				r = 21
			}
		}
	}
}
slot29 = FlamerActionWalk._walk_anim_lengths

for pose, stances in pairs() do
	slot34 = stances

	for stance, speeds in pairs(slot33) do
		slot39 = speeds

		for speed, sides in pairs(slot38) do
			slot44 = sides

			for side, speed in pairs(slot43) do
				sides[side] = speed * 0.03333
			end
		end
	end
end

FlamerActionWalk._walk_anim_lengths.stand.ntl = FlamerActionWalk._walk_anim_lengths.stand.cbt
FlamerActionWalk._walk_anim_lengths.stand.hos = FlamerActionWalk._walk_anim_lengths.stand.cbt
FlamerActionWalk._walk_anim_lengths.stand.wnd = FlamerActionWalk._walk_anim_lengths.stand.cbt
FlamerActionWalk._walk_anim_lengths.crouch = FlamerActionWalk._walk_anim_lengths.stand
function FlamerActionWalk:_get_max_walk_speed()
	local speed = self._common_data.char_tweak.move_speed[self._ext_anim.pose][self._haste][self._stance.name]

	return speed
end
function FlamerActionWalk:update(t)
	local dt = nil
	slot5 = self._ext_base
	local vis_state = self._ext_base.lod_stage(slot4)
	vis_state = vis_state or 4

	if vis_state == 1 then
		dt = t - self._last_upd_t
		slot6 = TimerManager
		slot6 = TimerManager.game(slot5)
		self._last_upd_t = TimerManager.game(slot5).time(slot5)
	elseif self._skipped_frames < vis_state then
		self._skipped_frames = self._skipped_frames + 1

		return 
	else
		self._skipped_frames = 1
		dt = t - self._last_upd_t
		slot6 = TimerManager
		slot6 = TimerManager.game(slot5)
		self._last_upd_t = TimerManager.game(slot5).time(slot5)
	end

	local pos_new = nil

	if self._end_of_path and (not self._ext_anim.act or not self._ext_anim.walk) then
		if self._next_is_nav_link then
			slot8 = "_upd_nav_link_first_frame"

			self._set_updator(slot6, self)

			slot8 = t

			self.update(slot6, self)

			return 
		elseif self._persistent then
			slot8 = "_upd_wait"

			self._set_updator(slot6, self)
		else
			self._expired = true

			if self._end_rot then
				slot8 = self._end_rot

				self._ext_movement.set_rotation(slot6, self._ext_movement)
			end
		end
	else
		slot10 = vis_state

		self._nav_chk_walk(slot6, self, t, dt)
	end

	local move_dir = tmp_vec3
	slot9 = self._last_pos

	mvec3_set(slot7, move_dir)

	slot9 = self._common_data.pos

	mvec3_sub(slot7, move_dir)

	slot9 = 0

	mvec3_set_z(slot7, move_dir)

	if self._cur_vel < 0.1 or (self._ext_anim.act and self._ext_anim.walk) then
		move_dir = nil
	end

	local anim_data = self._ext_anim

	if move_dir and not self._expired then
		local face_fwd = tmp_vec1
		local wanted_walk_dir = nil
		slot11 = move_dir
		local move_dir_norm = move_dir.normalized(slot10)

		if self._no_strafe or self._walk_turn then
			wanted_walk_dir = "fwd"
		else
			if self._curve_path_end_rot then
				slot13 = self._footstep_pos
			elseif self._attention_pos then
				slot13 = self._attention_pos

				mvec3_set(slot11, face_fwd)

				slot13 = self._common_data.pos

				mvec3_sub(slot11, face_fwd)
			elseif self._footstep_pos then
				slot13 = self._footstep_pos

				mvec3_set(slot11, face_fwd)

				slot13 = self._common_data.pos

				mvec3_sub(slot11, face_fwd)
			else
				slot13 = self._common_data.fwd

				mvec3_set(slot11, face_fwd)
			end

			slot13 = 0

			mvec3_set_z(slot11, face_fwd)
			mvec3_norm(slot11)

			local face_right = tmp_vec2
			slot15 = math.UP

			mvec3_cross(face_fwd, face_right, face_fwd)

			slot13 = face_right

			mvec3_norm(face_fwd)

			slot14 = face_right
			local right_dot = mvec3_dot(face_fwd, move_dir_norm)
			slot15 = face_fwd
			local fwd_dot = mvec3_dot(move_dir_norm, move_dir_norm)
			slot16 = right_dot

			if math_abs(fwd_dot) < math_abs(move_dir_norm) then
				if (anim_data.move_l and right_dot < 0) or (anim_data.move_r and 0 < right_dot) then
					slot15 = fwd_dot
				elseif 0 < fwd_dot then
					wanted_walk_dir = "fwd"
				else
					wanted_walk_dir = "bwd"
				end
			elseif (anim_data.move_fwd and 0 < fwd_dot) or (anim_data.move_bwd and fwd_dot < 0) then
				slot15 = right_dot
			elseif 0 < right_dot then
				wanted_walk_dir = "r"
			else
				wanted_walk_dir = "l"
			end
		end

		local rot_new = nil

		if self._curve_path_end_rot then
			slot17 = self._footstep_pos
			slot14 = mvec3_dis(slot15, self._last_pos) / 140
			local dis_lerp = 1 - math.min(slot12, 1)
			rot_new = temp_rot1
			slot17 = dis_lerp

			mrot_slerp(slot13, rot_new, self._curve_path_end_rot, self._nav_link_rot or self._end_rot)
		else
			local wanted_u_fwd = tmp_vec1
			slot15 = move_dir_norm

			mvec3_set(slot13, wanted_u_fwd)

			slot15 = self._walk_side_rot[wanted_walk_dir]

			mvec3_rot(slot13, wanted_u_fwd)

			slot16 = math.UP

			mrot_lookat(slot13, temp_rot1, wanted_u_fwd)

			rot_new = temp_rot1
			slot16 = rot_new
			slot20 = dt * 5

			mrot_slerp(slot13, rot_new, self._common_data.rot, math.min(slot18, 1))
		end

		slot14 = rot_new

		self._ext_movement.set_rotation(slot12, self._ext_movement)

		if self._chk_stop_dis and not self._common_data.char_tweak.no_run_stop then
			slot15 = self._simplified_path[#self._simplified_path]
			slot14 = self._last_pos
			local end_dis = mvec3_dis(slot12, self._nav_point_pos(slot14))

			if end_dis < self._chk_stop_dis then

				-- Decompilation error in this vicinity:
				local fwd_dot = mvec3_dot(slot14, stop_anim_fwd)
				local move_dir_r_norm = tmp_vec3
				slot19 = math.UP

				mvec3_cross(move_dir_norm, move_dir_r_norm, move_dir_norm)

				slot18 = move_dir_norm
				local fwd_dot = mvec3_dot(move_dir_norm, stop_anim_fwd)
				local r_dot = mvec3_dot(stop_anim_fwd, stop_anim_fwd)
				local stop_anim_side = nil
				slot21 = r_dot

				if math.abs(fwd_dot) < math.abs(move_dir_r_norm) then
					if 0 < fwd_dot then
						stop_anim_side = "fwd"
					else
						stop_anim_side = "bwd"
					end
				elseif 0 < r_dot then
					stop_anim_side = "l"
				else
					stop_anim_side = "r"
				end

				local stop_pose = nil

				if self._action_desc.end_pose then
					stop_pose = self._action_desc.end_pose
				else
					stop_pose = self._ext_anim.pose
				end

				if stop_pose ~= self._ext_anim.pose then
					slot22 = stop_pose
					local pose_redir_res = self._ext_movement.play_redirect(slot20, self._ext_movement)

					if not pose_redir_res then
						slot25 = stop_pose

						debug_pause_unit(slot21, self._unit, "STOP POSE FAIL!!!", self._unit)
					end
				end

				local stop_dis = self._anim_movement[stop_pose]["run_stop_" .. stop_anim_side]

				if stop_dis and end_dis < stop_dis then
					self._stop_anim_side = stop_anim_side
					self._stop_anim_fwd = stop_anim_fwd
					self._stop_dis = stop_dis
					slot23 = "_upd_stop_anim_first_frame"

					self._set_updator(slot21, self)
				end
			end
		elseif self._walk_turn and not self._chk_stop_dis then
			slot14 = self._last_pos
			local end_dis = mvec3_dis(slot12, self._curve_path[self._curve_path_index + 1])

			if end_dis < 45 then
				slot15 = "_upd_walk_turn_first_frame"

				self._set_updator(slot13, self)
			end
		end

		pose = (0 < self._stance.values[4] and "wounded") or self._ext_anim.pose or "stand"
		local real_velocity = self._cur_vel
		local variant = self._haste

		if variant == "run" and not self._no_walk then
			if self._ext_anim.sprint then
				if 480 < real_velocity and self._ext_anim.pose == "stand" then
					variant = "sprint"
				elseif 250 < real_velocity then
					variant = "run"
				else
					variant = "walk"
				end
			elseif self._ext_anim.run then
				if not self._walk_anim_velocities[pose] then
					slot21 = self._walk_anim_velocities
					slot20 = self._unit

					debug_pause_unit(slot15, self._unit, "No walk anim velocities for pose:", pose, inspect(slot20))
				elseif not self._walk_anim_velocities[pose][self._stance.name] then
					slot23 = self._walk_anim_velocities[pose]
					slot22 = self._unit

					debug_pause_unit(slot15, self._unit, "No walk anim velocities for (pose, stance name):", pose, self._stance.name, inspect(slot21), inspect(self._walk_anim_velocities))
				elseif 530 < real_velocity and self._walk_anim_velocities[pose] and self._walk_anim_velocities[pose][self._stance.name] and self._walk_anim_velocities[pose][self._stance.name].sprint and self._ext_anim.pose == "stand" then
					variant = "sprint"
				elseif 250 < real_velocity then
					variant = "run"
				else
					variant = "walk"
				end
			elseif 530 < real_velocity and self._walk_anim_velocities[pose][self._stance.name].sprint and self._ext_anim.pose == "stand" then
				variant = "sprint"
			elseif 300 < real_velocity then
				variant = "run"
			else
				variant = "walk"
			end
		end

		slot18 = variant

		self._adjust_move_anim(slot15, self, wanted_walk_dir)

		if not self._walk_anim_velocities[pose] or not self._walk_anim_velocities[pose][self._stance.name] or not self._walk_anim_velocities[pose][self._stance.name][variant] or not self._walk_anim_velocities[pose][self._stance.name][variant][wanted_walk_dir] then
			slot26 = wanted_walk_dir
			slot29 = self._machine
			slot32 = "base"

			Application.error(slot15, Application, "Boom...", self._common_data.unit, "pose", pose, "stance", self._stance.name, "variant", variant, "wanted_walk_dir", self._machine.segment_state(slot28, Idstring(slot31)))

			return 
		end

		local anim_walk_speed = self._walk_anim_velocities[pose][self._stance.name][variant][wanted_walk_dir]
		local wanted_walk_anim_speed = real_velocity / anim_walk_speed
		slot18 = self._unit
		slot18 = self._unit.brain(slot17)
		local distance_to_target = self._unit.brain(slot17).distance_to_target(slot17)

		if distance_to_target and distance_to_target < FlamerActionWalk.DISTANCE_SPRINT_START and FlamerActionWalk.DISTANCE_SPRINT_END < distance_to_target then
			wanted_walk_anim_speed = wanted_walk_anim_speed * 1.5
		end

		slot21 = wanted_walk_anim_speed

		self._adjust_walk_anim_speed(slot18, self, dt)
	end

	slot10 = dt

	self._set_new_pos(slot8, self)

	return 
end

return 
