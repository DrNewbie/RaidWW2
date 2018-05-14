slot3 = "CoreSessionHandler"

core.module(slot1, core)

Session = Session or class()
function Session:joined_session()
	slot4 = "Joined Session!"

	cat_print(slot2, "debug")

	return 
end
function Session:session_ended()
	slot4 = "Session Ended"

	cat_print(slot2, "debug")

	return 
end
function Session:session_started()
	slot4 = "Session Started!"

	cat_print(slot2, "debug")

	return 
end

return 
