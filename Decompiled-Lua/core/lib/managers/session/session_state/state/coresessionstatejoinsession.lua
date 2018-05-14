slot3 = "CoreSessionStateJoinSession"

core.module(slot1, core)

slot3 = "CoreSessionStateInSession"

core.import(slot1, core)

JoinSession = JoinSession or class()
function JoinSession:init(session_id)
	slot4 = self.session_state._join_session_requester

	self.session_state._join_session_requester.task_started(slot3)

	slot5 = session_id
	self._session = self.session_state._session_creator.join_session(slot3, self.session_state._session_creator)
	slot5 = self.session_state._factory
	self._session._session_handler = self.session_state._factory.create_session_handler(self.session_state._session_creator)
	self._session._session_handler._core_session_control = self.session_state

	return 
end
function JoinSession:destroy()
	slot3 = self.session_state._join_session_requester

	self.session_state._join_session_requester.task_completed(slot2)

	return 
end
function JoinSession:transition()
	return CoreSessionStateInSession.InSession, self._session
end

return 
