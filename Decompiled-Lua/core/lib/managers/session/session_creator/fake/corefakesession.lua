slot3 = "CoreFakeSession"

core.module(slot1, core)

slot3 = "CoreSession"

core.import(slot1, core)

Session = Session or class()
function Session:init()
	return 
end
function Session:delete_session()
	slot4 = "FakeSession: delete_session"

	cat_print(slot2, "debug")

	return 
end
function Session:start_session()
	slot4 = "FakeSession: start_session"

	cat_print(slot2, "debug")

	return 
end
function Session:end_session()
	slot4 = "FakeSession: end_session"

	cat_print(slot2, "debug")

	return 
end
function Session:join_local_user(local_user)
	slot8 = local_user
	slot5 = "FakeSession: Local user:'" .. local_user.gamer_name(slot7) .. "' joined!"

	cat_print(slot3, "debug")

	return 
end
function Session:join_remote_user(remote_user)
	slot8 = remote_user
	slot5 = "FakeSession: Remote user:'" .. remote_user.gamer_name(slot7) .. "' joined!"

	cat_print(slot3, "debug")

	return 
end

return 
