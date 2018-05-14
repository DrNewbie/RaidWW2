slot3 = "CoreGameStateMachine"

core.module(slot1, core)

slot3 = "CoreInitState"

core.import(slot1, core)

GameStateMachine = GameStateMachine or class()
function GameStateMachine:init(start_state)
	self._states = {}
	self._transitions = {}
	local init = CoreInitState._InitState.new(slot3, CoreInitState._InitState)
	slot6 = init
	self._states[init.name(self)] = init
	self._transitions[init] = self._transitions[init] or {}
	self._transitions[init][start_state] = init.default_transition
	self._current_state = init
	self._queued_transitions = {
		{
			start_state
		}
	}
	slot5 = self

	self._do_state_change()

	return 
end
function GameStateMachine:destroy()
	slot3 = self._states

	for _, state in pairs(slot2) do
		slot8 = state

		state.destroy(slot7)
	end

	self._states = {}
	self._transitions = {}

	return 
end
function GameStateMachine:add_transition(from, to, trans_func)
	slot7 = from
	self._states[from.name(slot6)] = from
	slot7 = to
	self._states[to.name(slot6)] = to
	self._transitions[from] = self._transitions[from] or {}
	self._transitions[from][to] = trans_func

	return 
end
function GameStateMachine:current_state()
	return self._current_state
end
function GameStateMachine:can_change_state(state)
	local state_from = (self._queued_transitions and self._queued_transitions[#self._queued_transitions][1]) or self._current_state
	local valid_transitions = self._transitions[state_from]

	return valid_transitions and valid_transitions[state] ~= nil
end
function GameStateMachine:change_state(state, params)
	slot6 = "[GameStateMachine][change_state]"
	slot11 = state

	Application.trace(slot4, Application, tostring(state.name(slot10)))

	slot6 = "[GameStateMachine][change_state]"

	Application.debug(slot4, Application, debug.traceback())

	if self._doing_state_change then
		slot6 = "[GameStateMachine][change_state] State change during transition!"

		Application.error(slot4, Application)

		slot5 = Application

		Application.stack_dump(slot4)
	end

	slot6 = tostring(self.last_queued_state_name(slot9))
	slot11 = state
	local transition_debug_string = string.format(slot4, "'%s' --> '%s'", tostring(state.name(self)))
	slot8 = transition_debug_string

	Application.info("'%s' --> '%s'", Application, "[GameStateMachine][change_state] Requested state change ")

	slot7 = state

	if not self.can_change_state("'%s' --> '%s'", self) then
	else
		self._queued_transitions = self._queued_transitions or {}
		slot7 = {
			state,
			params
		}

		table.insert(slot5, self._queued_transitions)
	end

	return 
end
function GameStateMachine:current_state_name()
	slot3 = self._current_state

	return self._current_state.name(slot2)
end
function GameStateMachine:can_change_state_by_name(state_name)
	slot8 = state_name
	slot5 = "[GameStateMachine] Name '" .. tostring(slot7) .. "' does not correspond to a valid state."
	local state = assert(slot3, self._states[state_name])
	slot6 = state

	return self.can_change_state(self._states[state_name], self)
end
function GameStateMachine:change_state_by_name(state_name, params)
	slot9 = state_name
	slot6 = "[GameStateMachine] Name '" .. tostring(slot8) .. "' does not correspond to a valid state."
	local state = assert(slot4, self._states[state_name])
	slot8 = params

	self.change_state(self._states[state_name], self, state)

	return 
end
function GameStateMachine:update(t, dt)
	if self._current_state.update then
		slot7 = dt

		self._current_state.update(slot4, self._current_state, t)
	end

	return 
end
function GameStateMachine:paused_update(t, dt)
	if self._current_state.paused_update then
		slot7 = dt

		self._current_state.paused_update(slot4, self._current_state, t)
	end

	return 
end
function GameStateMachine:end_update(t, dt)
	if self._queued_transitions then
		slot5 = self

		self._do_state_change(slot4)
	end

	return 
end
function GameStateMachine:_do_state_change()
	if not self._queued_transitions then
		return 
	end

	self._doing_state_change = true
	slot3 = self._queued_transitions

	for i_transition, transition in ipairs(slot2) do
		local new_state = transition[1]
		local params = transition[2]
		local old_state = self._current_state
		local trans_func = self._transitions[old_state][new_state]
		slot18 = old_state
		slot20 = new_state
		slot13 = "[GameStateMachine] Executing state change '" .. tostring(old_state.name(slot17)) .. "' --> '" .. tostring(new_state.name(slot19)) .. "'"

		cat_print(slot11, "game_state_machine")

		self._current_state = new_state

		if trans_func then
			slot14 = params

			trans_func(slot11, old_state, new_state)
		else
			slot16 = old_state
			slot18 = new_state

			Application.error(slot11, Application, "[GameStateMachine]  trying to execute a state change that has not been allowed. From: ", old_state.name("  to: "), new_state.name(slot17))
		end
	end

	self._queued_transitions = nil
	self._doing_state_change = false
	slot3 = Network

	if Network.is_server(slot2) and managers.network then
		slot3 = managers.network

		if managers.network.session(slot2) then
			slot3 = managers.network
			slot3 = managers.network.session(slot2)

			managers.network.session(slot2).chk_server_joinable_state(slot2)
		end
	end

	return 
end
function GameStateMachine:last_queued_state_name()
	if self._queued_transitions then
		slot3 = self._queued_transitions[#self._queued_transitions][1]

		return self._queued_transitions[#self._queued_transitions][1].name(#self._queued_transitions)
	else
		slot3 = self

		return self.current_state_name(slot2)
	end

	return 
end

return 
