-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
NetworkFriendsPSN = NetworkFriendsPSN or class()
function NetworkFriendsPSN:init()
	slot4 = "friends = NetworkFriendsPSN"

	cat_print(slot2, "lobby")

	self._friends = {}
	self._callback = {}
	slot3 = PSN
	self._updated_list_friends = PSN.update_list_friends(slot2)
	self._last_info = {
		friends = 0,
		friends_map = {},
		friends_status_map = {}
	}

	function slot5()
		slot2 = managers.network.friends

		managers.network.friends.psn_update_friends(slot1)

		return 
	end

	PSN.set_matchmaking_callback(, PSN, "friends_updated")

	slot5 = 20

	PSN.update_async_friends(, PSN, true)

	return 
end
function NetworkFriendsPSN:destroy()
	function slot5()
		return 
	end

	PSN.set_matchmaking_callback(slot2, PSN, "friends_updated")

	slot5 = 20

	PSN.update_async_friends(slot2, PSN, false)

	return 
end
function NetworkFriendsPSN:set_visible(set)
	if set == true then
		slot6 = 5

		PSN.update_async_friends(slot3, PSN, true)
	else
		slot6 = 20

		PSN.update_async_friends(slot3, PSN, true)
	end

	return 
end
function NetworkFriendsPSN:call_callback(func, ...)
	if self._callback[func] then
		self._callback[func](...)
	else
		slot7 = "is not registred."

		Application.error(slot3, Application, "Callback", func)
	end

	return 
end
function NetworkFriendsPSN:call_silent_callback(func, ...)
	if self._callback[func] then
		self._callback[func](...)
	end

	return 
end
function NetworkFriendsPSN:get_friends_list()
	return self._friends

	local npids = {}
	local friends = PSN.get_list_friends(slot3)
	slot5 = friends

	for _, f in pairs(PSN) do
		slot11 = f

		table.insert(slot9, npids)
	end

	return npids
end
function NetworkFriendsPSN:get_names_friends_list()
	if not self._updated_list_friends then
		slot3 = PSN
		self._updated_list_friends = PSN.update_list_friends(slot2)
	end

	local names = {}
	slot4 = PSN
	local friends = PSN.get_list_friends(slot3)

	if not friends then
		return names
	end

	slot5 = friends

	for _, f in pairs(slot4) do
		slot11 = PSN

		if f.friend ~= PSN.get_local_userid(slot10) then
			slot10 = f.friend
			names[tostring(slot9)] = true
		end
	end

	return names
end
function NetworkFriendsPSN:get_npid_friends_list()
	local npids = {}
	slot4 = PSN
	local friends = PSN.get_list_friends(slot3)

	if not friends then
		return npids
	end

	slot5 = friends

	for _, f in pairs(slot4) do
		slot11 = PSN

		if f.friend ~= PSN.get_local_userid(slot10) then
			slot11 = f.friend

			table.insert(slot9, npids)
		end
	end

	return npids
end
function NetworkFriendsPSN:get_friends()
	slot4 = "NetworkFriendsPSN:get_friends()"

	cat_print(slot2, "lobby")

	if not self._updated_list_friends then
		slot3 = PSN
		self._updated_list_friends = PSN.update_list_friends(slot2)
	end

	self._friends = {}
	local name = managers.network.account.player_id(slot2)
	slot4 = PSN
	local friends = PSN.get_list_friends(managers.network.account)

	if friends then
		self._last_info.friends = #friends
		slot6 = friends

		self._fill_li_friends_map(#friends, self)

		self._last_info.friends_status_map = {}
		slot5 = friends

		for k, v in pairs() do
			slot10 = v.friend

			if tostring(slot9) ~= name then
				local online_status = "not_signed_in"
				local info_mod = 1
				slot13 = v.friend
				self._last_info.friends_status_map[tostring(slot12)] = v.status * info_mod
				slot13 = v.friend

				if managers.network.matchmake.user_in_lobby(tostring(slot12), managers.network.matchmake) then
					online_status = "in_group"
				else
					slot12 = managers.network

					if managers.network.session(slot11) then
						slot12 = managers.network
						slot12 = managers.network.session(slot11)
						slot15 = v.friend
					else
						slot13 = v.friend

						if managers.network.group.find(slot11, managers.network.group) then
							online_status = "in_group"
						elseif v.status == 0 then
						elseif v.status == 1 then
							online_status = "signed_in"
						elseif v.status == 2 then
							online_status = "signed_in"
						end
					end
				end

				slot16 = v.friend
				local f = NetworkFriend.new(slot11, NetworkFriend, v.friend, tostring(online_status))
				slot14 = f

				table.insert(NetworkFriend, self._friends)

				slot15 = f

				self.call_callback(NetworkFriend, self, "status_change")
			end
		end

		slot7 = self._friends

		self.call_callback(slot4, self, "get_friends_done")
	end

	return 
end
function NetworkFriendsPSN:register_callback(event, callback)
	self._callback[event] = callback

	return 
end
function NetworkFriendsPSN:send_friend_request(nickname)
	return 
end
function NetworkFriendsPSN:remove_friend(id)
	return 
end
function NetworkFriendsPSN:has_builtin_screen()
	return false
end
function NetworkFriendsPSN:accept_friend_request(player_id)
	return 
end
function NetworkFriendsPSN:ignore_friend_request(player_id)
	return 
end
function NetworkFriendsPSN:num_pending_friend_requests()
	return 0
end
function NetworkFriendsPSN:debug_update(t, dt)
	return 
end
function NetworkFriendsPSN:psn_disconnected()
	self._updated_list_friends = false

	return 
end
function NetworkFriendsPSN:psn_update_friends()
	slot3 = PSN
	local friends = PSN.get_list_friends(slot2) or {}

	if 0 <= #friends then
		local change_of_friends = false
		slot5 = friends

		for k, v in pairs(slot4) do
			slot11 = v.friend
			local friend_in_list = self._last_info.friends_map[tostring(slot10)]

			if not friend_in_list then
				change_of_friends = true

				break
			end

			slot12 = v.friend
			self._last_info.friends_map[tostring(slot11)] = nil
		end

		slot5 = self._last_info.friends_map

		for k, v in pairs(slot4) do
			change_of_friends = true

			break
		end

		slot6 = friends

		self._fill_li_friends_map(slot4, self)

		if change_of_friends then
			self._last_info.friends = #friends
			slot5 = PSN
			self._updated_list_friends = PSN.update_list_friends(#friends)
			slot6 = "friends_reset"

			self.call_silent_callback(#friends, self)

			return 
		else
			slot6 = friends

			if self._count_online(slot4, self) then
				slot6 = "friends_reset"

				self.call_silent_callback(slot4, self)

				return 
			end
		end
	end

	return 
end
function NetworkFriendsPSN:is_friend(id)
	slot4 = PSN
	local friends = PSN.get_list_friends(slot3)

	if not friends then
		return false
	end

	slot5 = friends

	for _, data in ipairs(slot4) do
		if data.friend == id then
			return true
		end
	end

	return false
end
function NetworkFriendsPSN:_fill_li_friends_map(friends)
	self._last_info.friends_map = {}
	slot4 = friends

	for k, v in pairs() do
		slot10 = v.friend
		self._last_info.friends_map[tostring(slot9)] = true
	end

	return 
end
function NetworkFriendsPSN:_fill_li_friends_status_map(friends)
	self._last_info.friends_status_map = {}
	slot4 = friends

	for k, v in pairs() do
		local info_mod = 1

		if v.status == 2 and v.info then
			slot11 = managers.platform

			if v.info == managers.platform.presence(slot10) then
				info_mod = -1
			end
		end

		slot11 = v.friend
		self._last_info.friends_status_map[tostring(slot10)] = v.status * info_mod
	end

	return 
end
function NetworkFriendsPSN:_count_online(friends)
	slot4 = managers.network.account
	local name = managers.network.account.player_id(slot3)
	local status_changed = false
	slot6 = friends

	for k, v in pairs(slot5) do
		slot12 = v.friend
		local friend_status = self._last_info.friends_status_map[tostring(slot11)] or 42
		local info_mod = 1
		slot13 = v.friend

		if tostring(slot12) ~= name and friend_status ~= v.status * info_mod then
			status_changed = true

			break
		end
	end

	if not status_changed then
		return false
	end

	slot7 = friends

	self._fill_li_friends_status_map(slot5, self)

	return true
end

return 
