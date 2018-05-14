NetworkGenericPSN = NetworkGenericPSN or class()
function NetworkGenericPSN:init()
	slot4 = "generic = NetworkGenericPSN"

	cat_print(slot2, "lobby")

	local function f()
		return 
	end

	slot6 = f

	PSN.set_matchmaking_callback("lobby", PSN, "room_invitation")

	local function psn_left(...)
		slot2 = self

		self.psn_member_left(slot1, ...)

		return 
	end

	slot7 = psn_left

	PSN.set_matchmaking_callback(PSN, PSN, "member_left")

	local function psn_join(...)
		slot2 = self

		self.psn_member_joined(slot1, ...)

		return 
	end

	slot8 = psn_join

	PSN.set_matchmaking_callback(PSN, PSN, "member_joined")

	local function psn_destroyed(...)
		slot2 = self

		self.psn_session_destroyed(slot1, ...)

		return 
	end

	slot9 = psn_destroyed

	PSN.set_matchmaking_callback(PSN, PSN, "session_destroyed")

	return 
end
function NetworkGenericPSN:update(time)
	slot4 = managers.network.voice_chat

	managers.network.voice_chat.update(slot3)

	return 
end
function NetworkGenericPSN:start_game()
	Global.rendezvous = {}
	slot4 = managers.network.shared_rdv
	Global.rendezvous.rendevous = managers.network.shared_rdv.rendezvousonline(slot3)
	slot4 = managers.network.shared_rdv
	slot2 = managers.network.shared_rdv.is_online(slot3)
	Global.rendezvous.is_online = slot2
	slot4 = true

	managers.network.voice_chat._save_globals(slot2, managers.network.voice_chat)

	slot3 = managers.network.group

	managers.network.group._save_global(slot2)

	slot3 = managers.network.matchmake

	managers.network.matchmake._save_global(slot2)

	return 
end
function NetworkGenericPSN:end_game()
	Global.rendezvous = {}
	slot4 = managers.network.shared_rdv
	Global.rendezvous.rendevous = managers.network.shared_rdv.rendezvousonline(slot3)
	slot4 = managers.network.shared_rdv
	Global.rendezvous.is_online = managers.network.shared_rdv.is_online(slot3)
	slot4 = true

	managers.network.generic.set_entermenu(managers.network.shared_rdv.is_online(slot3), managers.network.generic)

	slot6 = managers.network.group
	slot4 = managers.network.group.room_id(slot5) or false

	managers.network.voice_chat._save_globals(slot2, managers.network.voice_chat)

	slot3 = managers.network.group

	managers.network.group._save_global(slot2)

	return 
end
function NetworkGenericPSN:psn_member_joined(info)
	slot5 = info

	managers.network.matchmake.psn_member_joined(slot3, managers.network.matchmake)

	return 
end
function NetworkGenericPSN:psn_member_left(info)
	slot5 = info

	managers.network.matchmake.psn_member_left(slot3, managers.network.matchmake)

	return 
end
function NetworkGenericPSN:psn_session_destroyed(info)
	slot5 = "NetworkGenericPSN:_session_destroyed_cb"

	cat_print(slot3, "lobby")

	slot5 = info

	cat_print_inspect(slot3, "lobby")

	slot5 = info.room_id

	managers.network.voice_chat.psn_session_destroyed(slot3, managers.network.voice_chat)

	slot5 = info.room_id

	managers.network.matchmake._session_destroyed_cb(slot3, managers.network.matchmake)

	slot5 = info.room_id

	managers.network.group._session_destroyed_cb(slot3, managers.network.group)

	return 
end

return 
