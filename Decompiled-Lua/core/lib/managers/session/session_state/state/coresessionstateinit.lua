slot3 = "CoreSessionStateInit"

core.module(slot1, core)

slot3 = "CoreSessionStateFindSession"

core.import(slot1, core)

Init = Init or class()
function Init:init()
	slot5 = self.session_state._quit_session_requester
	slot3 = not self.session_state._quit_session_requester.is_requested(slot4)

	assert(slot2)

	return 
end
function Init:transition()
	slot3 = self.session_state._join_session_requester

	if self.session_state._join_session_requester.is_requested(slot2) then
		slot3 = self.session_state
		slot3 = self.session_state.player_slots(slot2)

		if self.session_state.player_slots(slot2).has_primary_local_user(slot2) then
			return CoreSessionStateFindSession.FindSession
		end
	end

	return 
end

return 
