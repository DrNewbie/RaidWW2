-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
PlayerMovementState = PlayerMovementState or class()
function PlayerMovementState:init(unit)
	self._unit = unit

	return 
end
function PlayerMovementState:enter(state_data, enter_data)
	return 
end
function PlayerMovementState:exit(state_data)
	return 
end
function PlayerMovementState:update(t, dt)
	return 
end
function PlayerMovementState:chk_action_forbidden(action_type)
	if self._current_action then
		local unblock_data = self._current_action["unblock_" .. action_type .. "_t"]

		if unblock_data then
		end
	end

	return 
end
function PlayerMovementState:_reset_delay_action()
	self._delay_action = nil

	return 
end
function PlayerMovementState:_set_delay_action(action_data)
	if self._delay_action then
		slot4 = self

		self._reset_delay_action(slot3)
	end

	self._delay_action = action_data

	return 
end
function PlayerMovementState:_reset_current_action()
	local previous_action = self._current_action

	if previous_action and self["_end_action_" .. previous_action.type] then
		slot5 = previous_action

		self["_end_action_" .. previous_action.type](previous_action.type, self)

		if previous_action.root_blending_disabled then
			slot5 = true

			self._machine.set_root_blending(slot3, self._machine)
		end
	end

	self._current_action = nil

	return 
end
function PlayerMovementState:_set_current_action(action_data)
	if self._current_action then
		slot4 = self

		self._reset_current_action(slot3)
	end

	self._current_action = action_data

	return 
end
function PlayerMovementState:interaction_blocked()
	return false
end
function PlayerMovementState:save(data)
	return 
end
function PlayerMovementState:pre_destroy()
	return 
end
function PlayerMovementState:destroy()
	return 
end

return 
