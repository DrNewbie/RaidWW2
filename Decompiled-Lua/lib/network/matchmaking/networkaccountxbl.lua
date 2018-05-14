slot2 = "lib/network/matchmaking/NetworkAccount"

require(slot1)

if not NetworkAccountXBL then
	slot2 = NetworkAccount
	slot0 = class(slot1)
end

NetworkAccountXBL = slot0
function NetworkAccountXBL:init()
	slot3 = self

	NetworkAccount.init(slot2)

	return 
end
function NetworkAccountXBL:signin_state()
	slot6 = managers.user
	local xbl_state = managers.user.signed_in_state(slot2, managers.user.get_index(slot5))
	slot5 = xbl_state
	local game_signin_state = self._translate_signin_state(managers.user, self)

	return game_signin_state
end
function NetworkAccountXBL:local_signin_state()
	slot3 = managers.user
	slot6 = managers.user
	local xbl_state = managers.user.signed_in_state(slot2, managers.user.get_index(slot5))

	if xbl_state == "not_signed_in" then
		return "not signed in"
	end

	if xbl_state == "signed_in_locally" then
		return "signed in"
	end

	if xbl_state == "signed_in_to_live" then
		return "signed in"
	end

	return "not signed in"
end
function NetworkAccountXBL:show_signin_ui()
	return 
end
function NetworkAccountXBL:username_id()
	return (Global.user_manager.user_index and Global.user_manager.user_map[Global.user_manager.user_index].username) or ""
end
function NetworkAccountXBL:player_id()
	slot4 = nil

	return managers.user.get_xuid(slot2, managers.user)
end
function NetworkAccountXBL:is_connected()
	return true
end
function NetworkAccountXBL:lan_connection()
	return true
end
function NetworkAccountXBL:publish_statistics(stats, force_store)
	slot6 = "NetworkAccountXBL:publish_statistics( stats, force_store )"

	Application.error(slot4, Application)

	slot5 = Application

	Application.stack_dump(slot4)

	return 
end
function NetworkAccountXBL:challenges_loaded()
	self._challenges_loaded = true

	return 
end
function NetworkAccountXBL:experience_loaded()
	self._experience_loaded = true

	return 
end
function NetworkAccountXBL:_translate_signin_state(xbl_state)
	if xbl_state == "signed_in_to_live" then
		return "signed in"
	end

	return "not signed in"
end

return 
