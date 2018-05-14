slot3 = "CoreSessionStateCreateSession"

core.module(slot1, core)

slot3 = "CoreSessionStateInSession"

core.import(slot1, core)

CreateSession = CreateSession or class()
function CreateSession:init()
	local session_info = self.session_state._session_info
	local player_slots = self.session_state._player_slots
	slot7 = player_slots
	self._session = self.session_state._session_creator.create_session(slot4, self.session_state._session_creator, session_info)
	slot6 = self.session_state._factory
	self._session._session_handler = self.session_state._factory.create_session_handler(self.session_state._session_creator)
	self._session._session_handler._core_session_control = self.session_state
	local local_users = self.session_state._local_user_manager.users(self.session_state)
	slot6 = local_users

	for _, local_user in pairs(self.session_state._local_user_manager) do
		slot12 = local_user

		self._session.join_local_user(slot10, self._session)
	end

	return 
end
function CreateSession:transition()
	return CoreSessionStateInSession.InSession, self._session
end

return 
