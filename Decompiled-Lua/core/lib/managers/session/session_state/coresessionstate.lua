slot3 = "CoreSessionState"

core.module(slot1, core)

slot3 = "CorePortableSessionCreator"

core.import(slot1, core)

slot3 = "CorePlayerSlots"

core.import(slot1, core)

slot3 = "CoreRequester"

core.import(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

slot3 = "CoreSessionStateInit"

core.import(slot1, core)

slot3 = "CoreSessionInfo"

core.import(slot1, core)

slot3 = "CoreSessionGenericState"

core.import(slot1, core)

if not SessionState then
	slot2 = CoreSessionGenericState.State
	slot0 = class(slot1)
end

SessionState = slot0
function SessionState:init(factory, player_slots, game_state)
	self._factory = factory
	slot7 = self
	self._session_creator = CorePortableSessionCreator.Creator.new(slot5, CorePortableSessionCreator.Creator)
	slot6 = CoreRequester.Requester
	self._join_session_requester = CoreRequester.Requester.new(slot5)
	slot6 = CoreRequester.Requester
	self._quit_session_requester = CoreRequester.Requester.new(slot5)
	slot6 = CoreRequester.Requester
	self._start_session_requester = CoreRequester.Requester.new(slot5)
	self._player_slots = player_slots
	self._game_state = game_state
	slot9 = self
	self._state = CoreFiniteStateMachine.FiniteStateMachine.new(slot5, CoreFiniteStateMachine.FiniteStateMachine, CoreSessionStateInit.Init, "session_state")
	slot6 = CoreSessionInfo.Info
	self._session_info = CoreSessionInfo.Info.new(slot5)
	slot6 = self

	self._set_stable_for_loading(slot5)

	return 
end
function SessionState:transition()
	slot3 = self._state

	self._state.transition(slot2)

	return 
end
function SessionState:player_slots()
	return self._player_slots
end
function SessionState:join_standard_session()
	slot3 = self._join_session_requester

	self._join_session_requester.request(slot2)

	return 
end
function SessionState:start_session()
	slot3 = self._state
	slot3 = self._state.state(slot2)

	self._state.state(slot2).start_session(slot2)

	return 
end
function SessionState:quit_session()
	slot3 = self._quit_session_requester

	self._quit_session_requester.request(slot2)

	return 
end
function SessionState:end_session()
	slot3 = self._state
	slot3 = self._state.state(slot2)

	self._state.state(slot2).end_session(slot2)

	return 
end
function SessionState:session_info()
	return self._session_info
end

return 
