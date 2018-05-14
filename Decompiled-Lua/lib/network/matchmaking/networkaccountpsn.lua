slot2 = "lib/network/matchmaking/NetworkAccount"

require(slot1)

if not NetworkAccountPSN then
	slot2 = NetworkAccount
	slot0 = class(slot1)
end

NetworkAccountPSN = slot0
function NetworkAccountPSN:init()
	slot3 = self

	NetworkAccount.init(slot2)

	return 
end
function NetworkAccountPSN:signin_state()
	slot3 = PSN

	if PSN.is_online(slot2) == true then
		return "signed in"
	end

	return "not signed in"
end
function NetworkAccountPSN:local_signin_state()
	slot3 = PSN

	if not PSN.cable_connected(slot2) then
		return false
	end

	slot3 = PSN
	local n = PSN.get_localinfo(slot2)

	if not n then
		return false
	end

	if not n.local_ip then
		return false
	end

	return true
end
function NetworkAccountPSN:show_signin_ui()
	slot3 = PSN

	PSN.display_online_connection(slot2)

	return 
end
function NetworkAccountPSN:username_id()
	slot3 = PSN
	local online_name = PSN.get_npid_user(slot2)

	if online_name then
		return online_name
	else
		slot4 = PS3
		local local_user_info_name = PS3.get_userinfo(slot3)

		if local_user_info_name then
			return local_user_info_name
		end
	end

	slot5 = "menu_mp_player"

	return managers.localization.text(slot3, managers.localization)
end
function NetworkAccountPSN:player_id()
	slot3 = PSN

	if PSN.get_npid_user(slot2) == nil then
		slot3 = PSN
		local n = PSN.get_localinfo(slot2)

		if n and n.local_ip then
			return n.local_ip
		end

		slot5 = "Could not get local ip, returning \"player_id\" VERY BAD!."

		Application.error(slot3, Application)

		return "player_id"
	end

	slot3 = PSN

	return PSN.get_npid_user(slot2)
end
function NetworkAccountPSN:is_connected()
	return true
end
function NetworkAccountPSN:lan_connection()
	slot3 = PSN

	return PSN.cable_connected(slot2)
end
function NetworkAccountPSN:_lan_ip()
	slot3 = PSN
	local l = PSN.get_lan_info(slot2)

	if l and l.lan_ip then
		return l.lan_ip
	end

	return "player_lan"
end
function NetworkAccountPSN:publish_statistics(stats, force_store)
	slot6 = "NetworkAccountPSN:publish_statistics( stats, force_store )"

	Application.error(slot4, Application)

	slot5 = Application

	Application.stack_dump(slot4)

	return 
end
function NetworkAccountPSN:achievements_fetched()
	self._achievements_fetched = true

	return 
end
function NetworkAccountPSN:challenges_loaded()
	self._challenges_loaded = true

	return 
end
function NetworkAccountPSN:experience_loaded()
	self._experience_loaded = true

	return 
end

return 
