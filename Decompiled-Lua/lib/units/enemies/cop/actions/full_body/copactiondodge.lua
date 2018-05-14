CopActionDodge = CopActionDodge or class()
CopActionDodge._apply_freefall = CopActionWalk._apply_freefall
CopActionDodge._VARIATIONS = {
	"side_step",
	"dive",
	"roll",
	"wheel"
}
CopActionDodge._SIDES = {
	"fwd",
	"bwd",
	"l",
	"r"
}
CopActionDodge.init = function (self, action_desc, common_data)
	self._common_data = common_data
	self._ext_base = common_data.ext_base
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._timeout = action_desc.timeout
	self._machine = common_data.machine
	slot5 = "base"
	self._ids_base = Idstring(slot4)
	slot6 = "dodge"
	local redir_res = self._ext_movement.play_redirect(slot4, self._ext_movement)

	if redir_res then
		self._descriptor = action_desc
		self._last_vel_z = 0
		slot6 = self

		self._determine_rotation_transition(slot5)

		slot7 = false

		self._ext_movement.set_root_blend(slot5, self._ext_movement)

		slot9 = 1

		self._machine.set_parameter(slot5, self._machine, redir_res, action_desc.variation)

		if action_desc.speed then
			slot8 = action_desc.speed

			self._machine.set_speed(slot5, self._machine, redir_res)
		end

		slot9 = 1

		self._machine.set_parameter(slot5, self._machine, redir_res, action_desc.side)

		slot6 = Network

		if Network.is_server(slot5) then
			slot8 = (action_desc.shoot_accuracy or 1) * 10
			slot8 = 10
			local accuracy = math.clamp(slot5, math.floor(slot7) / 10, 0)
			slot15 = math.UP
			slot14 = Rotation(action_desc.side, action_desc.direction)
			slot14 = accuracy

			common_data.ext_network.send(math.floor, common_data.ext_network, "action_dodge_start", self._body_part, CopActionDodge._get_variation_index(slot11), CopActionDodge._get_side_index(action_desc.variation), Rotation(action_desc.side, action_desc.direction).yaw(action_desc.side), action_desc.speed or 1)
		end

		slot6 = self._ext_movement

		self._ext_movement.enable_update(slot5)

		return true
	else
		slot12 = self._machine
		slot15 = "base"

		debug_pause_unit(slot5, self._unit, "[CopActionDodge:init] redirect", redir_name, "failed in", self._machine.segment_state(common_data.unit, Idstring(slot14)))

		return 
	end

	return 
end
CopActionDodge.on_exit = function (self)
	slot3 = Network

	if Network.is_client(slot2) then
		slot3 = self._ext_movement
		slot6 = self._ext_movement

		self._ext_movement.set_m_host_stop_pos(slot2, self._ext_movement.m_pos(slot5))
	elseif not self._expired then
		slot4 = "action_dodge_end"

		self._common_data.ext_network.send(slot2, self._common_data.ext_network)
	end

	return 
end
CopActionDodge.update = function (self, t)
	if self._ext_anim.dodge then
		slot4 = TimerManager
		local dt = TimerManager.game(slot3).delta_time(slot3)
		slot5 = self
		self._last_pos = CopActionHurt._get_pos_clamped_to_graph(TimerManager.game(slot3))
		slot6 = dt

		CopActionWalk._set_new_pos(TimerManager.game(slot3), self)

		local new_rot = nil

		if self._rot_transition then
			slot7 = self._ids_base
			local anim_rel_t = self._machine.segment_relative_time(slot5, self._machine)
			local rot_prog = anim_rel_t / self._rot_transition.end_anim_t

			if 1 < rot_prog then
				new_rot = self._rot_transition.end_rot
				self._rot_transition = nil
			else
				slot10 = rot_prog
				new_rot = self._rot_transition.start_rot.slerp(slot7, self._rot_transition.start_rot, self._rot_transition.end_rot)
			end
		else
			slot6 = self._unit
			new_rot = self._unit.get_animation_delta_rotation(slot5)
			new_rot = self._common_data.rot * new_rot
			slot9 = new_rot
			slot9 = 0

			mrotation.set_yaw_pitch_roll(slot5, new_rot, new_rot.yaw(slot8), 0)
		end

		slot7 = new_rot

		self._ext_movement.set_rotation(slot5, self._ext_movement)
	else
		self._expired = true
	end

	return 
end
CopActionDodge.type = function (self)
	return "dodge"
end
CopActionDodge.expired = function (self)
	return self._expired
end
CopActionDodge.need_upd = function (self)
	return true
end
CopActionDodge.chk_block = function (self, action_type, t)
	if action_type == "death" or action_type == "bleedout" or action_type == "fatal" then
		return false
	end

	return true
end
CopActionDodge.timeout = function (self)
	return self._timeout
end
CopActionDodge._get_variation_index = function (var_name)
	slot3 = CopActionDodge._VARIATIONS

	for index, test_var_name in ipairs(slot2) do
		if var_name == test_var_name then
			return index
		end
	end

	return 
end
CopActionDodge.get_variation_name = function (var_index)
	return CopActionDodge._VARIATIONS[var_index]
end
CopActionDodge._get_side_index = function (side_name)
	slot3 = CopActionDodge._SIDES

	for index, test_side_name in ipairs(slot2) do
		if side_name == test_side_name then
			return index
		end
	end

	return 
end
CopActionDodge.get_side_name = function (side_index)
	return CopActionDodge._SIDES[side_index]
end
CopActionDodge._determine_rotation_transition = function (self)
	local wanted_side = self._descriptor.side
	slot5 = math.UP
	local end_rot = Rotation(slot3, self._descriptor.direction)

	if wanted_side == "bwd" then
		slot8 = end_rot
		slot8 = 0

		mrotation.set_yaw_pitch_roll(slot4, end_rot, mrotation.yaw(slot7) + 180, 0)
	elseif wanted_side == "l" then
		slot8 = end_rot
		slot8 = 0

		mrotation.set_yaw_pitch_roll(slot4, end_rot, mrotation.yaw(slot7) - 90, 0)
	elseif wanted_side == "r" then
		slot8 = end_rot
		slot8 = 0

		mrotation.set_yaw_pitch_roll(slot4, end_rot, mrotation.yaw(slot7) + 90, 0)
	end

	slot6 = self._unit
	self._rot_transition = {
		end_anim_t = 0.3,
		end_rot = end_rot,
		start_rot = self._unit.rotation(slot5)
	}

	return 
end
CopActionDodge.accuracy_multiplier = function (self)
	return self._descriptor.shoot_accuracy or 1
end

return 
