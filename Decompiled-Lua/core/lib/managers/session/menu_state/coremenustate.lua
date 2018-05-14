slot3 = "CoreMenuState"

core.module(slot1, core)

slot3 = "CoreSessionGenericState"

core.import(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

slot3 = "CoreMenuStateNone"

core.import(slot1, core)

if not MenuState then
	slot2 = CoreSessionGenericState.State
	slot0 = class(slot1)
end

MenuState = slot0
MenuState.init = function (self, game_state, menu_handler, player_slots)
	self._game_state = game_state
	slot6 = self._game_state

	assert(slot5)

	self._menu_handler = menu_handler
	self._player_slots = player_slots
	slot9 = self
	self._state = CoreFiniteStateMachine.FiniteStateMachine.new(slot5, CoreFiniteStateMachine.FiniteStateMachine, CoreMenuStateNone.None, "menu_state")

	return 
end
MenuState.set_debug = function (self, debug_on)
	slot5 = debug_on

	self._state.set_debug(slot3, self._state)

	return 
end
MenuState.default_data = function (data)
	data.start_state = "CoreMenuStateNone.None"

	return 
end
MenuState.save = function (self, data)
	slot5 = data.start_state

	self._state.save(slot3, self._state)

	return 
end
MenuState.transition = function (self)
	slot3 = self._state

	self._state.transition(slot2)

	return 
end
MenuState.game_state = function (self)
	return self._game_state
end

return 
