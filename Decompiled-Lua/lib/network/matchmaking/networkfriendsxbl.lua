NetworkFriendsXBL = NetworkFriendsXBL or class()
function NetworkFriendsXBL:init()
	self._callback = {}

	return 
end
function NetworkFriendsXBL:destroy()
	return 
end
function NetworkFriendsXBL:set_visible(set)
	return 
end
function NetworkFriendsXBL:get_friends_list()
	slot3 = managers.user
	local player_index = managers.user.get_platform_id(slot2)

	if not player_index then
		slot5 = "Player map not ready yet."

		Application.error(slot3, Application)

		player_index = 0
	end

	local friend_list = XboxLive.friends(slot3, XboxLive)
	local friends = {}
	slot6 = friend_list

	for i, friend in ipairs(player_index) do
		slot11 = friends
		slot16 = friend.gamertag

		table.insert(slot10, NetworkFriend.new(slot13, NetworkFriend, friend.xuid))
	end

	return friends
end
function NetworkFriendsXBL:get_friends_by_name()
	local player_index = managers.user.get_platform_id(slot2)
	local friend_list = XboxLive.friends(managers.user, XboxLive)
	local friends = {}
	slot6 = friend_list

	for i, friend in ipairs(player_index) do
		friends[friend.gamertag] = friend
	end

	return friends
end
function NetworkFriendsXBL:get_friends()
	if not self._initialized then
		self._initialized = true

		self._callback.initialization_done()
	end

	return 
end
function NetworkFriendsXBL:register_callback(event, callback)
	self._callback[event] = callback

	return 
end
function NetworkFriendsXBL:send_friend_request(nickname)
	return 
end
function NetworkFriendsXBL:remove_friend(id)
	return 
end
function NetworkFriendsXBL:has_builtin_screen()
	return true
end
function NetworkFriendsXBL:accept_friend_request(player_id)
	return 
end
function NetworkFriendsXBL:ignore_friend_request(player_id)
	return 
end
function NetworkFriendsXBL:num_pending_friend_requests()
	return 0
end

return 
