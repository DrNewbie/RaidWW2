-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not HuskCopMovement then
	slot2 = CopMovement
	slot0 = class(slot1)
end

HuskCopMovement = slot0
function HuskCopMovement:init(unit)
	slot5 = unit

	CopMovement.init(slot3, self)

	self._queued_actions = {}
	slot4 = self._m_pos
	self._m_host_stop_pos = mvector3.copy(slot3)

	return 
end
function HuskCopMovement:_upd_actions(t)
	slot5 = t

	CopMovement._upd_actions(slot3, self)

	slot4 = self

	self._chk_start_queued_action(slot3)

	return 
end
function HuskCopMovement:action_request(action_desc)
	slot5 = false

	self.enable_update(slot3, self)

	local function _chk_would_interrupt(b_part)
		if self._active_actions[1] then
			slot3 = self._active_actions[1]

			if self._active_actions[1].type(slot2) == "idle" then
				return 
			end
		end

		return self._active_actions[b_part] or self._active_actions[1] or (b_part == 1 and (self._active_actions[2] or self._active_actions[3]))
	end

	slot6 = action_desc

	if not self.chk_action_forbidden(self, self) and not action_desc.client_interrupt then
		slot5 = self._queued_actions
	else
		local new_action_body_part = action_desc.body_part
		slot6 = self._active_actions

		for body_part, active_action in ipairs(slot5) do
			if active_action and active_action.get_husk_interrupt_desc and ((body_part == 1 and new_action_body_part ~= 4) or new_action_body_part == 1 or body_part == new_action_body_part) then
				local old_action_desc = active_action.get_husk_interrupt_desc(slot10)
				slot13 = old_action_desc

				self._push_front_queued_action(active_action, self)
			end
		end

		slot7 = action_desc
		local new_action = HuskCopMovement.super.action_request(slot5, self)
		slot7 = self

		self._chk_start_queued_action(self)

		return new_action
	end

	return 
end
function HuskCopMovement:chk_action_forbidden(action_desc)
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local t = TimerManager.game(slot3).time(slot3)
	local block_type = action_desc.block_type or action_desc.type
	slot6 = self._active_actions

	for i_action, action in ipairs(slot5) do
		if action then
			if action.chk_block_client then
				slot14 = t

				if action.chk_block_client(slot10, action, action_desc, block_type) then
					return true
				end
			elseif action.chk_block then
				slot13 = t

				if action.chk_block(slot10, action, block_type) then
					return true
				end
			end
		end
	end

	return 
end

return 
