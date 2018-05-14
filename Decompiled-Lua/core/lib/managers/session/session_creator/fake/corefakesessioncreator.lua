slot3 = "CoreFakeSessionCreator"

core.module(slot1, core)

slot3 = "CoreFakeSession"

core.import(slot1, core)

Creator = Creator or class()
function Creator:init()
	return 
end
function Creator:create_session(session_info, player_slots)
	slot5 = session_info

	if session_info.is_ranked(slot4) then
		slot6 = "create_session: is_ranked"

		cat_print(slot4, "debug")
	end

	slot5 = session_info

	if session_info.can_join_in_progress(slot4) then
		slot6 = "create_session: is_ranked"

		cat_print(slot4, "debug")
	end

	slot5 = CoreFakeSession.Session

	return CoreFakeSession.Session.new(slot4)
end
function Creator:join_session(session_id)
	slot4 = CoreFakeSession.Session

	return CoreFakeSession.Session.new(slot3)
end
function Creator:find_session(session_info, callback)
	local fake_sessions = {
		{
			info = 2
		},
		{
			info = 3
		}
	}
	slot6 = fake_sessions

	callback(slot5)

	return 
end

return 
