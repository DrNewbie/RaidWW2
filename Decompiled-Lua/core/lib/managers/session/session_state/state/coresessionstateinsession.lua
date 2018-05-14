slot3 = "CoreSessionStateInSession"

core.module(slot1, core)

slot3 = "CoreSessionStateQuitSession"

core.import(slot1, core)

InSession = InSession or class()
function InSession:init(session)
	slot4 = session

	assert(slot3)

	self._session = session
	slot4 = self._session._session_handler

	self._session._session_handler.joined_session(slot3)

	slot4 = self.session_state._game_state

	self.session_state._game_state.request_game(slot3)

	slot4 = self.session_state
	slot4 = self.session_state.player_slots(slot3)

	self.session_state.player_slots(slot3).create_players(slot3)

	return 
end
function InSession:destroy()
	slot3 = self.session_state
	slot3 = self.session_state.player_slots(slot2)

	self.session_state.player_slots(slot2).remove_players(slot2)

	return 
end
function InSession:transition()
	if self._start_session then
		return CoreSessionStateInSessionStart, self._session
	end

	slot3 = self.session_state._quit_session_requester

	if self.session_state._quit_session_requester.is_requested(slot2) then
		return CoreSessionStateQuitSession.QuitSession, self._session
	end

	return 
end
function InSession:start_session()
	self._start_session = true

	return 
end

return 
