-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CopActionIdle = CopActionIdle or class()
local mvec3_dir = mvector3.direction
local mvec3_rot = mvector3.rotate_with
local mvec3_dot = mvector3.dot
local mrot_set_lookat = mrotation.set_look_at
local mrot_slerp = mrotation.slerp
local mrot_y = mrotation.y
local tmp_rot = Rotation()
local idstr_look_upper_body = Idstring(slot8)
local idstr_look_head = Idstring("look_upper_body")
slot11 = "Head"
local idstr_head = Idstring("look_head")
function CopActionIdle:init(action_desc, common_data)
	if action_desc.non_persistent then
		return 
	end

	self._common_data = common_data
	self._unit = common_data.unit
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._machine = common_data.machine
	slot5 = Network

	if Network.is_client(slot4) then
		self._turn_allowed = true
		slot5 = common_data.rot
		self._start_fwd = common_data.rot.y(slot4)
	end

	local res = nil

	if self._body_part == 3 then
		if self._ext_anim.upper_body_active and not self._ext_anim.upper_body_empty then
			slot7 = "up_idle"
			res = self._ext_movement.play_redirect(slot5, self._ext_movement)
		end
	elseif action_desc.anim then
		slot7 = action_desc.anim
		local state_name = self._machine.index_to_state_name(slot5, self._machine)
		slot8 = state_name
		local redir_res = self._ext_movement.play_state_idstr(self._machine, self._ext_movement)

		if not redir_res then
			slot13 = self._machine
			slot16 = "base"

			print(slot7, "[CopActionIdle:init] state", state_name, "failed in", self._machine.segment_state(common_data.unit, Idstring(slot15)))
		end
	elseif not self._ext_anim.idle then
		if self._common_data.stance.code == 1 then
			slot7 = "exit"
			res = self._ext_movement.play_redirect(slot5, self._ext_movement)
		else
			slot7 = "idle"
			res = self._ext_movement.play_redirect(slot5, self._ext_movement)
		end

		slot6 = self._ext_movement

		self._ext_movement.enable_update(slot5)
	end

	if res == false then
		slot11 = self._machine
		slot14 = "upper_body"
		slot10 = self._unit

		debug_pause_unit(slot5, self._unit, "[CopActionIdle:init] idle failed in", self._machine.segment_state(slot9, Idstring(slot12)), self._machine.segment_state(self._machine, Idstring("base")))

		return 
	end

	slot6 = self._unit
	self._modifier_name = (self._unit.anim_data(slot5).ik_type == "head" and idstr_look_head) or idstr_look_upper_body
	slot7 = self._modifier_name
	self._modifier = self._machine.get_modifier(slot5, self._machine)
	slot7 = common_data.attention

	self.on_attention(slot5, self)

	if self._body_part == 1 or self._body_part == 2 then
		slot6 = Network

		if Network.is_server(slot5) then
			slot6 = self._unit
			slot7 = "stand"
			local stand_rsrv = self._unit.brain(slot5).get_pos_rsrv(slot5, self._unit.brain(slot5))
		end
	end

	if action_desc.sync then
		slot8 = self._body_part

		self._common_data.ext_network.send(slot5, self._common_data.ext_network, "action_idle_start")
	end

	slot7 = action_desc.blocks

	CopActionAct._create_blocks_table(slot5, self)

	return true
end
function CopActionIdle:on_exit()
	if self._modifier_on then
		self._modifier_on = nil
		slot4 = self._modifier_name

		self._machine.forbid_modifier(slot2, self._machine)
	end

	slot3 = self._modifier

	if 0 < self._modifier.blend(slot2) and self._look_vec then
		slot4 = self._look_vec

		mvector3.set(slot2, self._common_data.look_vec)
	end

	return 
end
function CopActionIdle:update(t)
	if self._attention then
		local ik_enable = true
		slot5 = self._ext_movement
		local look_from_pos = self._ext_movement.m_head_pos(slot4)
		local target_vec = self._look_vec

		if self._attention.handler then
			slot8 = look_from_pos
			slot11 = self._attention.handler

			mvec3_dir(slot6, target_vec, self._attention.handler.get_detection_m_pos(slot10))
		elseif self._attention.unit then
			slot8 = look_from_pos
			slot11 = self._attention.unit
			slot11 = self._attention.unit.movement(slot10)

			mvec3_dir(slot6, target_vec, self._attention.unit.movement(slot10).m_head_pos(slot10))
		else
			slot9 = self._attention.pos

			mvec3_dir(slot6, target_vec, look_from_pos)
		end

		if self._look_trans then
			local look_trans = self._look_trans
			local prog = (t - look_trans.start_t) / look_trans.duration

			if 1 < prog then
				self._look_trans = nil
			else
				slot10 = prog
				local prog_smooth = math.bezier(slot8, {
					0,
					0,
					1,
					1
				})
				slot12 = math.UP

				mrot_set_lookat(, tmp_rot, target_vec)

				slot13 = prog_smooth

				mrot_slerp(, tmp_rot, look_trans.start_rot, tmp_rot)

				slot11 = target_vec

				mrot_y(, tmp_rot)

				slot11 = self._common_data.fwd

				if mvec3_dot(, target_vec) < 0.2 then
					ik_enable = false
				end
			end
		else
			slot8 = self._common_data.fwd

			if mvec3_dot(slot6, target_vec) < 0.2 then
				ik_enable = false
			end
		end

		if ik_enable then
			if not self._modifier_on then
				self._modifier_on = true
				slot8 = self._modifier_name

				self._machine.force_modifier(slot6, self._machine)
			end

			if self._turn_allowed then
				local active_actions = self._common_data.active_actions
				local queued_actions = self._common_data.queued_actions

				if not active_actions[1] and not active_actions[2] and (not queued_actions or (not queued_actions[1] and not queued_actions[2])) then
					slot10 = "walk"

					if not self._ext_movement.chk_action_forbidden(slot8, self._ext_movement) then
						slot11 = math.UP
						local spin = target_vec.to_polar_with_reference(slot8, target_vec, self._common_data.fwd).spin
						slot10 = spin

						if 70 < math.abs(target_vec) then
							self._rot_offset = -spin
							local new_action_data = {
								body_part = 2,
								type = "turn",
								angle = spin
							}
							slot12 = new_action_data

							self._ext_movement.action_request(slot10, self._ext_movement)
						end
					end
				end
			end
		elseif self._modifier_on then
			self._modifier_on = false
			slot8 = self._modifier_name

			self._machine.forbid_modifier(slot6, self._machine)
		end

		slot8 = target_vec

		self._modifier.set_target_z(slot6, self._modifier)
	elseif self._rot_offset then
		local new_action_data = {
			body_part = 2,
			type = "turn"
		}
		slot7 = math.UP
		new_action_data.angle = self._start_fwd.to_polar_with_reference(slot4, self._start_fwd, self._common_data.fwd).spin
		slot6 = new_action_data

		self._ext_movement.action_request(slot4, self._ext_movement)

		self._rot_offset = nil
	end

	if self._ext_anim.base_need_upd then
		slot4 = self._ext_movement

		self._ext_movement.upd_m_head_pos(slot3)
	end

	return 
end
function CopActionIdle:type()
	return "idle"
end
function CopActionIdle:on_attention(attention)
	if self._body_part ~= 1 and self._body_part ~= 3 then
		return 
	end

	if attention then
		slot4 = self._ext_movement
		local shoot_from_pos = self._ext_movement.m_head_pos(slot3)
		local target_vec = Vector3()

		if attention then
			if attention.handler then
				slot7 = shoot_from_pos
				slot10 = attention.handler

				mvec3_dir(slot5, target_vec, attention.handler.get_detection_m_pos(slot9))
			elseif attention.unit then
				slot7 = shoot_from_pos
				slot10 = attention.unit
				slot10 = attention.unit.movement(slot9)

				mvec3_dir(slot5, target_vec, attention.unit.movement(slot9).m_head_pos(slot9))
			else
				slot8 = attention.pos

				mvec3_dir(slot5, target_vec, shoot_from_pos)
			end
		end

		local start_vec = nil
		slot7 = self._modifier

		if 0 < self._modifier.blend(slot6) then
			start_vec = self._look_vec or self._common_data.look_vec
		else
			slot8 = idstr_head
			slot7 = self._unit.get_object(slot6, self._unit)
			slot7 = self._unit.get_object(slot6, self._unit).rotation(slot6)
			start_vec = self._unit.get_object(slot6, self._unit).rotation(slot6).z(slot6)
		end

		slot12 = start_vec
		slot9 = target_vec.angle(slot10, target_vec) / 180
		local duration = math.lerp(slot6, 0.35, 1)
		local start_rot = Rotation()
		slot11 = math.UP

		mrot_set_lookat(1, start_rot, start_vec)

		slot10 = TimerManager
		slot10 = TimerManager.game(start_rot)
		slot8 = TimerManager.game(start_rot).time(start_rot)
		self._look_trans = {
			start_t = slot8,
			duration = duration,
			start_rot = start_rot
		}
		slot9 = self._ext_movement

		self._ext_movement.enable_update(slot8)

		slot9 = start_vec
		self._look_vec = mvector3.copy(slot8)
	else
		self._modifier_on = nil
		slot5 = self._modifier_name

		self._machine.forbid_modifier(slot3, self._machine)

		slot4 = self._modifier

		if 0 < self._modifier.blend(slot3) and self._look_vec then
			slot5 = self._look_vec

			mvector3.set(slot3, self._common_data.look_vec)
		end
	end

	self._attention = attention
	slot4 = self._ext_movement

	self._ext_movement.enable_update(slot3)

	return 
end
function CopActionIdle:need_upd()
	return (self._attention and (self._attention.unit or self._look_trans) and true) or false
end
function CopActionIdle:save(save_data)
	if self._body_part == 1 then
		save_data.is_save = true
		save_data.type = "idle"
		save_data.body_part = 1
		slot7 = "base"
		local state_name = self._machine.segment_state(slot3, Idstring(slot6))
		slot6 = state_name
		local state_index = self._machine.state_name_to_index(self._machine, self._machine)
		save_data.anim = state_index
	end

	return 
end

return 
