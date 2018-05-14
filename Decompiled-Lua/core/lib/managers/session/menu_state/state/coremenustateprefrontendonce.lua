slot3 = "CoreMenuStatePreFrontEndOnce"

core.module(slot1, core)

slot3 = "CoreMenuStatePreFrontEnd"

core.import(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

slot3 = "CoreMenuStateLegal"

core.import(slot1, core)

PreFrontEndOnce = PreFrontEndOnce or class()
function PreFrontEndOnce:init()
	slot6 = self
	self._state = CoreFiniteStateMachine.FiniteStateMachine.new(slot2, CoreFiniteStateMachine.FiniteStateMachine, CoreMenuStateLegal.Legal, "pre_front_end_once")

	return 
end
function PreFrontEndOnce:transition()
	self._state.transition(slot2)

	local state = self.menu_state._game_state
	slot4 = state

	if not state.is_in_pre_front_end(self._state) or self.intro_screens_done then
		return CoreMenuStatePreFrontEnd.PreFrontEnd
	end

	return 
end

return 
