CopActionCrouch = CopActionCrouch or class()
function CopActionCrouch:init(action_desc, common_data)
	self._ext_movement = common_data.ext_movement
	local enter_t = nil
	local ext_anim = common_data.ext_anim
	self._ext_anim = ext_anim

	if not common_data.ext_movement._actions.walk._walk_anim_lengths.crouch then
		slot10 = inspect(slot11)
		slot13 = common_data.machine
		slot16 = "base"

		debug_pause_unit(slot6, common_data.unit, "unit cannot crouch!", common_data.unit, common_data.machine.segment_state(action_desc, Idstring(slot15)))

		return 
	end

	if common_data.active_actions[2] and common_data.active_actions[2]._nav_link then
	end

	if ext_anim.move then
		local ids_base = Idstring(slot6)
		slot9 = ids_base
		local seg_rel_t = common_data.machine.segment_relative_time("base", common_data.machine)
		local walk_anim_length = nil

		if ext_anim.run_start_turn then
			local move_side = ext_anim.move_side
			walk_anim_length = common_data.ext_movement._actions.walk._walk_anim_lengths.crouch[common_data.stance.name].run_start_turn[move_side]
		elseif ext_anim.run_start then
			local move_side = ext_anim.move_side
			walk_anim_length = common_data.ext_movement._actions.walk._walk_anim_lengths.crouch[common_data.stance.name].run_start[move_side]
		elseif ext_anim.run_stop then
			local move_side = ext_anim.move_side
			walk_anim_length = common_data.ext_movement._actions.walk._walk_anim_lengths.crouch[common_data.stance.name].run_stop[move_side]
		else
			local pose = "crouch"
			local speed = (ext_anim.run and "run") or "walk"
			local side = ext_anim.move_side
			local walk_anim_lengths = common_data.ext_movement._actions.walk._walk_anim_lengths
			local walk_pose_tbl = walk_anim_lengths and walk_anim_lengths[pose][common_data.stance.name]
			local walk_speed_tbl = walk_pose_tbl and walk_pose_tbl[speed]
			walk_anim_length = (walk_speed_tbl and walk_speed_tbl[side]) or 29
		end

		enter_t = seg_rel_t * walk_anim_length
	end

	slot9 = enter_t
	local redir_result = common_data.ext_movement.play_redirect(slot6, common_data.ext_movement, "crouch")

	if redir_result then
		slot8 = Network

		if Network.is_server(slot7) then
			slot10 = 2

			common_data.ext_network.send(slot7, common_data.ext_network, "set_pose")
		end

		slot8 = self._ext_movement

		self._ext_movement.enable_update(slot7)

		return true
	else
		slot12 = common_data.machine
		slot15 = "base"

		cat_print(slot7, "george", "[CopActionCrouch:init] failed in", common_data.machine.segment_state(common_data.unit, Idstring(slot14)))
	end

	return 
end
function CopActionCrouch:update(t)
	if self._ext_anim.base_need_upd then
		slot4 = self._ext_movement

		self._ext_movement.upd_m_head_pos(slot3)
	else
		self._expired = true
	end

	return 
end
function CopActionCrouch:expired()
	return self._expired
end
function CopActionCrouch:type()
	return "crouch"
end

return 
