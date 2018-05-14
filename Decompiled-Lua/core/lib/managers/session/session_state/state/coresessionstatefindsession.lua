slot3 = "CoreSessionStateFindSession"

core.module(slot1, core)

slot3 = "CoreSessionStateCreateSession"

core.import(slot1, core)

slot3 = "CoreSessionStateJoinSession"

core.import(slot1, core)

FindSession = FindSession or class()
function FindSession:init()
	slot4 = self.session_state._session_info
	slot9 = "_sessions_found"

	self.session_state._session_creator.find_session(slot2, self.session_state._session_creator, callback(slot6, self, self))

	return 
end
function FindSession:destroy()
	return 
end
function FindSession:_sessions_found(sessions)
	if not sessions then
		self._session_to_join = false
	end

	self._session_id_to_join = sessions[1].info

	return 
end
function FindSession:transition()
	if self._session_id_to_join == false then
		return CoreSessionStateCreateSession.CreateSession
	elseif self._session_id_to_join ~= nil then
		return CoreSessionStateJoinSession.JoinSession, self._session_id_to_join
	end

	return 
end

return 
