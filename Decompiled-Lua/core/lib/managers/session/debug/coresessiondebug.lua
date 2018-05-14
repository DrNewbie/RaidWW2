slot3 = "CoreSessionDebug"

core.module(slot1, core)

SessionDebug = SessionDebug or class()
function SessionDebug:init(session_state)
	self._session_state = session_state
	slot4 = self

	self._parse_standard_arguments(slot3)

	return 
end
function SessionDebug:_parse_standard_arguments()
	local level = nil
	local args = Application.argv(slot3)
	slot5 = args

	for i, arg in ipairs(Application) do
		if arg == "-level" then
			level = true
		elseif level then
			level_name = arg
			local session_info = self._session_state.session_info(slot9)
			slot12 = level_name

			session_info.set_level_name(self._session_state, session_info)

			slot11 = self._session_state
			slot11 = self._session_state.player_slots(self._session_state)
			slot11 = self._session_state.player_slots(self._session_state).primary_slot(self._session_state)

			self._session_state.player_slots(self._session_state).primary_slot(self._session_state).request_debug_local_user_binding(self._session_state)

			slot11 = self._session_state

			self._session_state.join_standard_session(self._session_state)

			break
		end
	end

	return 
end

return 
