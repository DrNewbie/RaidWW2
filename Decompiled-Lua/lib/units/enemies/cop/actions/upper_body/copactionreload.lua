-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CopActionReload = CopActionReload or class()
function CopActionReload:init(action_desc, common_data)

	-- Decompilation error in this vicinity:
	self._unit = common_data.unit
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_inventory = common_data.ext_inventory
	self._body_part = action_desc.body_part
	self._common_data = common_data
	self._machine = common_data.machine
	local reload_t = nil
	slot6 = common_data.active_actions

	for _, other_action in ipairs(slot5) do
		if other_action and other_action.reload_t then
			reload_t = other_action.reload_t

			break
		end
	end

	return 
end
function CopActionReload:type()
	return "reload"
end
function CopActionReload:update(t)
	if self._modifier_on then
		local target_pos = nil

		if self._attention.handler then
			slot5 = self._attention.handler
			target_pos = self._attention.handler.get_attention_m_pos(slot4)
		elseif self._attention.unit then
			slot5 = self._attention.unit
			slot5 = self._attention.unit.movement(slot4)
			target_pos = self._attention.unit.movement(slot4).m_head_pos(slot4)
		else
			target_pos = self._attention.pos
		end

		local shoot_from_pos = math.UP * 130
		slot7 = self._common_data.pos

		mvector3.add(slot5, shoot_from_pos)

		local target_vec = target_pos - shoot_from_pos
		slot8 = target_vec

		self._modifier.set_target_y(shoot_from_pos, self._modifier)
	end

	if self._reload_t < t then
		slot4 = self._weapon_unit
		slot4 = self._weapon_unit.base(slot3)

		self._weapon_unit.base(slot3).on_reload(slot3)

		self._expired = true
	end

	if self._ext_anim.base_need_upd then
		slot4 = self._ext_movement

		self._ext_movement.upd_m_head_pos(slot3)
	end

	return 
end
function CopActionReload:_play_reload()
	slot4 = self._unit

	managers.voice_over.enemy_reload(slot2, managers.voice_over)

	slot4 = "reload"
	local redir_res = self._ext_movement.play_redirect(slot2, self._ext_movement)

	if not redir_res then
		slot5 = "[CopActionReload:_play_reload] redirect failed in"
		slot8 = self._machine
		slot11 = "base"

		cat_print(slot3, "george", self._machine.segment_state(slot7, Idstring(slot10)))

		return 
	end

	return redir_res
end
function CopActionReload:expired()
	return self._expired
end
function CopActionReload:on_attention(attention)
	if attention then
		self._modifier_on = true
		slot5 = self._modifier_name

		self._machine.force_modifier(slot3, self._machine)
	else
		self._modifier_on = nil
		slot5 = self._modifier_name

		self._machine.allow_modifier(slot3, self._machine)
	end

	self._attention = attention

	return 
end
function CopActionReload:on_exit()
	if self._modifier_on then
		self._modifier_on = nil
		slot4 = self._modifier_name

		self._machine.allow_modifier(slot2, self._machine)
	end

	return 
end
function CopActionReload:chk_block(action_type, t)
	slot7 = t

	return CopActionAct.chk_block(slot4, self, action_type)
end
function CopActionReload:need_upd()
	return true
end

return 
