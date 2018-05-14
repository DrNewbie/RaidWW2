slot3 = "CoreGameState"

core.module(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

slot3 = "CoreGameStateInit"

core.import(slot1, core)

slot3 = "CoreSessionGenericState"

core.import(slot1, core)

slot3 = "CoreRequester"

core.import(slot1, core)

if not GameState then
	slot2 = CoreSessionGenericState.State
	slot0 = class(slot1)
end

GameState = slot0
GameState.init = function (self, player_slots, session_manager)
	self._player_slots = player_slots
	self._session_manager = session_manager
	slot5 = CoreRequester.Requester
	self._game_requester = CoreRequester.Requester.new(slot4)
	slot5 = CoreRequester.Requester
	self._front_end_requester = CoreRequester.Requester.new(slot4)
	slot5 = self._session_manager

	assert(slot4)

	slot8 = self
	self._state = CoreFiniteStateMachine.FiniteStateMachine.new(slot4, CoreFiniteStateMachine.FiniteStateMachine, CoreGameStateInit.Init, "game_state")

	return 
end
GameState.set_debug = function (self, debug_on)
	slot5 = debug_on

	self._state.set_debug(slot3, self._state)

	return 
end
GameState.default_data = function (data)
	data.start_state = "GameStateInit"

	return 
end
GameState.save = function (self, data)
	slot5 = data.start_state

	self._state.save(slot3, self._state)

	return 
end
GameState.update = function (self, t, dt)
	slot5 = self._state

	if self._state.state(slot4).update then
		slot7 = dt

		self._state.update(slot4, self._state, t)
	end

	return 
end
GameState.end_update = function (self, t, dt)
	slot5 = self._state

	if self._state.state(slot4).end_update then
		slot5 = self._state
		slot7 = dt

		self._state.state(slot4).end_update(slot4, self._state.state(slot4), t)
	end

	return 
end
GameState.transition = function (self)
	slot3 = self._state

	self._state.transition(slot2)

	return 
end
GameState.player_slots = function (self)
	return self._player_slots
end
GameState.is_in_pre_front_end = function (self)
	return self._is_in_pre_front_end
end
GameState.is_in_front_end = function (self)
	return self._is_in_front_end
end
GameState.is_in_init = function (self)
	return self._is_in_init
end
GameState.is_in_editor = function (self)
	return self._is_in_editor
end
GameState.is_in_game = function (self)
	return self._is_in_game
end
GameState.is_preparing_for_loading_game = function (self)
	return self._is_preparing_for_loading_game
end
GameState.is_preparing_for_loading_front_end = function (self)
	return self._is_preparing_for_loading_front_end
end
GameState._session_info = function (self)
	slot3 = self._session_manager
	slot3 = self._session_manager.session(slot2)

	return self._session_manager.session(slot2).session_info(slot2)
end
GameState.request_game = function (self)
	slot3 = self._game_requester

	self._game_requester.request(slot2)

	return 
end
GameState.request_front_end = function (self)
	slot3 = self._front_end_requester

	self._front_end_requester.request(slot2)

	return 
end

return 
