CopActionTurn = CopActionTurn or class()
local tmp_rot = Rotation()
local mrot_set_ypr = mrotation.set_yaw_pitch_roll
function CopActionTurn:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_base = common_data.ext_base
	self._machine = common_data.machine
	self._action_desc = action_desc
	slot5 = common_data.pos
	self._start_pos = mvector3.copy(slot4)

	if not self._ext_anim.idle then
		slot6 = "idle"
		local redir_res = self._ext_movement.play_redirect(slot4, self._ext_movement)

		if not redir_res then
			slot6 = "[CopActionTurn:init] idle redirect failed in"
			slot9 = self._machine
			slot12 = "base"

			debug_pause(slot5, self._machine.segment_state(slot8, Idstring(slot11)))

			return false
		end
	end

	self.update = self._upd_wait_full_blend
	slot5 = self._ext_movement

	self._ext_movement.enable_update(slot4)

	slot6 = action_desc.blocks

	CopActionAct._create_blocks_table(slot4, self)

	return true
end
function CopActionTurn:on_exit()
	slot4 = "script"

	self._common_data.unit.set_driving(slot2, self._common_data.unit)

	slot4 = true

	self._ext_movement.set_root_blend(slot2, self._ext_movement)

	slot4 = self._start_pos

	self._ext_movement.set_position(slot2, self._ext_movement)

	local end_rot = self._common_data.rot
	slot7 = end_rot
	slot7 = 0

	mrot_set_ypr(self._ext_movement, tmp_rot, mrotation.yaw(slot6), 0)

	slot5 = tmp_rot

	self._ext_movement.set_rotation(self._ext_movement, self._ext_movement)

	return 
end
function CopActionTurn:update(t)
	if not self._ext_anim.turn and self._ext_anim.idle_full_blend then
		self._expired = true
	end

	slot4 = self._ext_movement
	slot7 = self._common_data.unit

	self._ext_movement.set_m_rot(slot3, self._common_data.unit.rotation(slot6))

	return 
end
function CopActionTurn:_upd_wait_full_blend(t)
	if self._ext_anim.idle_full_blend then
		local angle = self._action_desc.angle
		local dir_str = (0 < angle and "l") or "r"
		local redir_name = "turn_" .. dir_str
		slot8 = redir_name
		local redir_res = self._ext_movement.play_redirect(slot6, self._ext_movement)

		if redir_res then
			slot8 = angle
			local abs_angle = math.abs(slot7)

			if 135 < abs_angle then
				slot12 = 1

				self._machine.set_parameter(slot8, self._machine, redir_res, "angle135")
			elseif 90 < abs_angle then
				local lerp = (abs_angle - 90) / 45
				slot13 = lerp

				self._machine.set_parameter(slot9, self._machine, redir_res, "angle135")

				slot13 = 1 - lerp

				self._machine.set_parameter(slot9, self._machine, redir_res, "angle90")
			elseif 45 < abs_angle then
				local lerp = (abs_angle - 45) / 45
				slot13 = lerp

				self._machine.set_parameter(slot9, self._machine, redir_res, "angle90")

				slot13 = 1 - lerp

				self._machine.set_parameter(slot9, self._machine, redir_res, "angle45")
			else
				slot12 = 1

				self._machine.set_parameter(slot8, self._machine, redir_res, "angle45")
			end

			slot9 = self._ext_base
			local vis_state = self._ext_base.lod_stage(slot8) or 4

			if 1 < vis_state then
				slot12 = vis_state

				self._machine.set_speed(slot9, self._machine, redir_res)
			end

			slot11 = "animation"

			self._common_data.unit.set_driving(slot9, self._common_data.unit)

			slot11 = false

			self._ext_movement.set_root_blend(slot9, self._ext_movement)

			slot10 = self._ext_base

			self._ext_base.chk_freeze_anims(slot9)

			self.update = nil
			slot11 = t

			self.update(slot9, self)
		else
			slot11 = " redirect failed in"
			slot14 = self._machine
			slot17 = "base"

			cat_print(slot7, "george", "[CopActionTurn:update] ", redir_name, self._machine.segment_state(slot13, Idstring(slot16)))

			self._expired = true
		end
	end

	return 
end
function CopActionTurn:type()
	return "turn"
end
function CopActionTurn:expired()
	return self._expired
end
function CopActionTurn:need_upd()
	return true
end

return 
