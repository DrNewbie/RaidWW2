-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
NetworkVoiceChatXBL = NetworkVoiceChatXBL or class()
NetworkVoiceChatXBL._NUM_PEERS = 4
function NetworkVoiceChatXBL:init()
	self.DEFAULT_TEAM = 1
	self._paused = true
	slot3 = managers.user
	slot8 = "user_id_update"
	self._userid_callback_id = managers.user.add_user_state_changed_callback(slot2, callback(slot5, self, self))

	return 
end
function NetworkVoiceChatXBL:open_session()
	if self._paused == false then
		slot4 = "Trying to re-initialize voice chat"

		Application.throw_exception(slot2, Application)
	end

	slot3 = managers.user
	self._current_player_index = managers.user.get_platform_id(slot2)
	slot4 = NetworkVoiceChatXBL._NUM_PEERS

	XboxVoice.start(slot2, XboxVoice)

	if self._current_player_index then
		slot5 = self._current_player_index

		cat_print(slot2, "lobby", "Voice: Registring Talker")

		slot4 = self._current_player_index

		XboxVoice.register_talker(slot2, XboxVoice)
	end

	self._team = self.DEFAULT_TEAM
	self._peers = {}
	slot3 = self

	self._load_globals(slot2)

	self._has_headset = false
	self._can_communicate = true
	self._only_friends = false
	self._paused = false
	self._user_changed = true
	self._number_of_users = 1
	slot4 = "mute_list_changed"
	slot9 = "mute_callback"
	self._mute_callback_id = managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))
	slot4 = "voicechat_away"
	slot9 = "voicechat_away"
	self._voice_callback_id = managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))
	slot4 = "friend_added"
	slot9 = "friends_update"
	self._friendsadd_callback_id = managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))
	slot4 = "friend_remove"
	slot9 = "friends_update"
	self._friendsdel_callback_id = managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))
	slot4 = "signin_changed"
	slot9 = "user_update"
	self._signin_callback_id = managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))
	slot4 = "profile_setting_changed"
	slot9 = "user_update"
	self._profile_callback_id = managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))

	return 
end
function NetworkVoiceChatXBL:pause()
	slot4 = "NetworkVoiceChatXBL:pause"

	cat_print(slot2, "lobby")

	self._paused = true

	return 
end
function NetworkVoiceChatXBL:resume()
	slot4 = "NetworkVoiceChatXBL:resume"

	cat_print(slot2, "lobby")

	self._paused = false
	slot3 = self

	self._update_all(slot2)

	return 
end
function NetworkVoiceChatXBL:open_channel_to(player_info, context)

	-- Decompilation error in this vicinity:
	slot5 = "Opening Voice Channel to "
	slot8 = player_info

	print(slot4, inspect(slot7))

	slot5 = managers.user
	local player_index = managers.user.get_platform_id(slot4)

	if not player_index then
		slot7 = "Player map not ready yet."

		Application.error(slot5, Application)

		player_index = 0
	end

	local session = nil

	if context == "game" then
		session = managers.network.matchmake._session
	else
		slot11 = context
		slot8 = "Context '" .. tostring(slot10) .. "' not a valid context."

		Application.throw_exception(slot6, Application)
	end

	if session == nil then
		slot11 = context
		slot8 = "Session retreived from context '" .. tostring(slot10) .. "' is nil"

		Application.throw_exception(slot6, Application)
	end

	slot7 = managers.network
	slot7 = managers.network.session(slot6)
	slot11 = "TCP_IP"
	player_info.voice_rpc = Network.handshake(slot7, Network, internal_address, managers.network.DEFAULT_PORT)

	if player_info.voice_rpc then
		slot8 = "Voice: Created rpc"

		print(slot7)
	else
		slot9 = "failed to create voice rpc from here to there"

		Application.throw_exception(slot7, Application)
	end

	local peer_info = {
		xuid = player_info.player_id
	}
	slot9 = player_info.player_id
	peer_info.player_id = tostring(slot8)
	peer_info.rpc = player_info.voice_rpc
	peer_info.team = self.DEFAULT_TEAM
	peer_info.listen = true
	peer_info.talk = true
	peer_info.name = player_info.name
	peer_info.why = "open"
	peer_info.dead = false
	self._peers[peer_info.player_id] = peer_info
	slot10 = peer_info.xuid

	XboxVoice.register_talker(peer_info.player_id, XboxVoice)

	slot12 = peer_info.rpc

	XboxVoice.send_to(peer_info.player_id, XboxVoice, player_index, peer_info.xuid)

	return 
end
function NetworkVoiceChatXBL:playerid_to_name(player_id)
	slot5 = player_id

	return self._peers[tostring(slot4)].name
end
function NetworkVoiceChatXBL:ip_to_name(ip)
	slot4 = self._peers

	for k, v in pairs(slot3) do
		if v.rpc then
			slot12 = 0

			if ip == tostring(v.rpc.ip_at_index(slot10, v.rpc)) then
				return v.name
			end
		end
	end

	return 
end
function NetworkVoiceChatXBL:close_channel_to(player_info)
	slot8 = player_info.name

	cat_print(slot3, "lobby", tostring(slot7))

	slot4 = managers.user
	local player_index = managers.user.get_platform_id(slot3)
	slot6 = player_info.player_id
	local peer_info = self._peers[tostring("Closing Voice Channel to ")]

	if peer_info then
		slot7 = "Voice: Stop talking to "
		slot10 = player_info.name

		cat_print(slot5, "lobby", tostring(slot9))

		slot7 = peer_info

		self._close_peer(slot5, self)

		slot7 = player_info.player_id
		self._peers[tostring(self)] = nil
	end

	return 
end
function NetworkVoiceChatXBL:lost_peer(peer)
	if self._peers == nil then
		return 
	end

	local player_index = managers.user.get_platform_id(slot3)
	slot6 = "Voice: Lost peer "
	slot9 = peer

	cat_print(managers.user, "lobby", tostring(slot8))

	slot5 = self._peers

	for k, v in pairs(managers.user) do
		if v.rpc then
			slot11 = 0
			slot12 = 0

			if peer.ip_at_index(slot9, peer) == v.rpc.ip_at_index(peer, v.rpc) then
				slot12 = v.name

				cat_print(slot9, "lobby", "\tVoice: Lost Connection to Name = ")

				slot11 = v

				self._close_peer(slot9, self)

				slot11 = v

				self._peer_flags(slot9, self)

				self._peers[k] = nil
			end
		end
	end

	return 
end
function NetworkVoiceChatXBL:close_all()
	slot4 = "Voice: Close all channels "

	cat_print(slot2, "lobby")

	self._paused = true
	slot3 = XboxVoice

	XboxVoice.stop(slot2)

	slot4 = "Voice: Close all channels End "

	cat_print(slot2, "lobby")

	self._peers = {}
	self._team = self.DEFAULT_TEAM

	return 
end
function NetworkVoiceChatXBL:set_team(team)
	slot6 = team

	cat_print(slot3, "lobby", "Voice: set_team ")

	self._team = team
	slot4 = self._peers

	for k, v in pairs(slot3) do
		if v.rpc then
			slot12 = managers.network.account

			v.rpc.voice_team(slot8, v.rpc, managers.network.account.player_id(team))
		end
	end

	slot4 = self

	self._update_all(slot3)

	return 
end
function NetworkVoiceChatXBL:peer_team(xuid, team, rpc)
	slot6 = self._peers

	for k, v in pairs(slot5) do
		slot12 = xuid

		if v.player_id == tostring(slot11) then
			v.team = team
			slot11 = self

			self._update_all(slot10)

			return 
		end
	end

	return 
end
function NetworkVoiceChatXBL:clear_team()
	slot4 = "Voice: clear_team, eveyone can now speak to each other "

	cat_print(slot2, "lobby")

	self._team = self.DEFAULT_TEAM
	slot3 = self._peers

	for k, v in pairs(slot2) do
		v.team = self.DEFAULT_TEAM
	end

	slot3 = self

	self._update_all(slot2)

	return 
end
function NetworkVoiceChatXBL:update(time)
	if self._paused == true then
		return 
	end

	slot4 = managers.user
	local player_index = managers.user.get_platform_id(slot3)

	if self._current_player_index ~= player_index then
		slot9 = player_index

		cat_print(slot4, "lobby", "Voice: Talker Changing from ", self._current_player_index, " to ")

		if self._current_player_index then
			slot6 = self._current_player_index

			XboxVoice.unregister_talker(slot4, XboxVoice)
		end

		slot6 = player_index

		XboxVoice.register_talker(slot4, XboxVoice)

		self._current_player_index = player_index
	end

	if self._user_changed then
		slot6 = "Voice: Users (Login/Settings) has changed. Updating voice flags."

		cat_print(slot4, "lobby")

		self._user_changed = false
		slot5 = self

		self._update_numberofusers(slot4)

		slot5 = self

		self._update_all(slot4)
	end

	return 
end
function NetworkVoiceChatXBL:_close_peer(peer)
	local player_index = managers.user.get_platform_id(slot3)
	slot8 = peer.rpc

	XboxVoice.stop_sending_to(managers.user, XboxVoice, player_index, peer.xuid)

	peer.dead = true
	peer.rpc = nil

	return 
end
function NetworkVoiceChatXBL:_peer_update(peer_info)
	return 
end
function NetworkVoiceChatXBL:_peer_flags(peer_info)
	return 
end
function NetworkVoiceChatXBL:_update_all()
	if self._paused == true then
		return 
	end

	slot3 = self._peers

	for k, v in pairs(slot2) do
		slot9 = v

		self._peer_flags(slot7, self)

		slot9 = v

		self._peer_update(slot7, self)
	end

	return 
end
function NetworkVoiceChatXBL:_save_globals()
	slot4 = "Voice: NetworkVoiceChatXBL:_save_globals "

	cat_print(slot2, "lobby")

	Global.xvoice = nil
	Global.xvoice = {
		peers = self._peers,
		team = self._team
	}
	slot3 = self

	self.pause(self._team)

	return 
end
function NetworkVoiceChatXBL:_load_globals()
	slot4 = "Voice: NetworkVoiceChatXBL:_load_globals "

	cat_print(slot2, "lobby")

	if Global.xvoice == nil then
		return 
	end

	self._team = Global.xvoice.team or self._team

	if Global.xvoice and Global.xvoice.peers then
		self._peers = Global.xvoice.peers
	end

	Global.xvoice = nil

	return 
end
function NetworkVoiceChatXBL:_update_numberofusers()
	self._number_of_users = 0
	local xuids = XboxLive.all_user_XUIDs(slot2)
	slot4 = xuids

	for _, xuid in pairs(XboxLive) do
		slot10 = xuid

		if XboxLive.signin_state(slot8, XboxLive) ~= "not_signed_in" then
			self._number_of_users = self._number_of_users + 1
		end
	end

	slot6 = self._number_of_users

	cat_print(slot3, "lobby", "   Voice: Number of users = ")

	return 
end
function NetworkVoiceChatXBL:_get_privilege(userindex)
	local cancommunicate = true
	local friendsonly = false
	slot7 = userindex

	if XboxLive.signin_state(slot5, XboxLive) ~= "not_signed_in" then
		slot8 = "communications"
		cancommunicate = XboxLive.check_privilege(slot5, XboxLive, userindex)
		slot8 = "communications_friends_only"
		friendsonly = XboxLive.check_privilege(slot5, XboxLive, userindex)

		if cancommunicate then
			friendsonly = false
		elseif friendsonly then
			cancommunicate = true
		end
	end

	return cancommunicate, friendsonly
end
function NetworkVoiceChatXBL:_check_privilege()
	local cancommunicate = true
	local friendsonly = false
	local usercancommunicate, userfriendsonly = nil
	local xuids = XboxLive.all_user_XUIDs(slot6)
	slot8 = xuids

	for _, xuid in pairs(XboxLive) do
		slot14 = xuid
		usercancommunicate, userfriendsonly = self._get_privilege(slot12, self)

		if usercancommunicate == false then
			cancommunicate = false
		end

		if userfriendsonly == true then
			friendsonly = true
		end
	end

	local flagsupdate = false
	slot11 = cancommunicate

	cat_print(slot8, "lobby", "   Voice: Can Communicate = ")

	if cancommunicate ~= self._can_communicate then
		self._can_communicate = cancommunicate
		flagsupdate = true

		return 
	end

	slot11 = friendsonly

	cat_print(slot8, "lobby", "   Voice: Friends only = ")

	if friendsonly ~= self._only_friends then
		self._only_friends = friendsonly
		flagsupdate = true
	end

	return flagsupdate
end
function NetworkVoiceChatXBL:num_peers()
	return true
end
function NetworkVoiceChatXBL:destroy_voice(disconnected)
	self._paused = true
	slot4 = XboxVoice

	XboxVoice.stop(slot3)

	return 
end
function NetworkVoiceChatXBL:set_volume(new_value)
	slot5 = new_value

	print(slot3, "new_value")

	return 
end
function NetworkVoiceChatXBL:is_muted(xuid)
	local player_index = managers.user.get_platform_id(slot3)
	slot6 = xuid

	return XboxVoice.muted(managers.user, XboxVoice)
end
function NetworkVoiceChatXBL:set_muted(xuid, state)
	local player_index = managers.user.get_platform_id(slot4)
	slot8 = state

	XboxVoice.set_muted(managers.user, XboxVoice, xuid)

	return 
end
function NetworkVoiceChatXBL:user_id_update(id, changed_player_map)
	return 
end
function NetworkVoiceChatXBL:mute_callback()
	slot4 = "Voice: Mute list changed"

	cat_print(slot2, "lobby")

	slot3 = "Voice: Mute list changed"

	print(slot2)

	slot3 = self

	self._update_all(slot2)

	return 
end
function NetworkVoiceChatXBL:voicechat_away(b)
	slot5 = "Voice: voicechat_away: "
	slot8 = b

	cat_print(slot3, "lobby", tostring(slot7))

	slot4 = "Voice: voicechat_away: "
	slot7 = b

	print(slot3, tostring(tostring))

	return 
end
function NetworkVoiceChatXBL:friends_update(id)
	slot5 = "Voice: Friends update: "

	cat_print(slot3, "lobby")

	slot4 = "Voice: Friends update: "

	print(slot3)

	slot4 = self

	self._update_all(slot3)

	return 
end
function NetworkVoiceChatXBL:user_update()
	slot4 = "Voice: NetworkVoiceChatXBL:user_update"

	cat_print(slot2, "lobby")

	slot3 = "Voice: NetworkVoiceChatXBL:user_update"

	print(slot2)

	self._user_changed = true

	return 
end
function NetworkVoiceChatXBL:info()
	slot3 = self

	self.info_script(slot2)

	slot3 = self

	self.info_engine(slot2)

	return 
end
function NetworkVoiceChatXBL:info_script()
	slot4 = "Voice Script Info"

	cat_print(slot2, "lobby")

	slot5 = self._current_player_index

	cat_print(slot2, "lobby", "\tActive Player:     ")

	slot5 = self._has_headset

	cat_print(slot2, "lobby", "\tHas Headset:     ")

	slot5 = self._can_communicate

	cat_print(slot2, "lobby", "\tCan Communicate: ")

	slot5 = self._paused

	cat_print(slot2, "lobby", "\tVoice Paused:    ")

	slot5 = self._only_friends

	cat_print(slot2, "lobby", "\tOnly Friends:    ")

	slot5 = self._team

	cat_print(slot2, "lobby", "\tSelf Team:       ")

	slot3 = self._peers

	for k, v in pairs(slot2) do
		local info = "\t\t" .. v.name
		slot11 = v.team
		info = info .. " Team=" .. tostring(slot10)
		slot11 = v.listen
		info = info .. ", Listen=" .. tostring(slot10)
		slot11 = v.talk
		info = info .. ", talk=" .. tostring(slot10)
		slot11 = v.why
		info = info .. ", why=" .. tostring(slot10)
		slot10 = info

		cat_print(", why=", "lobby")
	end

	return 
end
function NetworkVoiceChatXBL:info_engine()
	slot4 = "Voice Engine Info"

	cat_print(slot2, "lobby")

	slot4 = "   Registred Talkers"

	cat_print(slot2, "lobby")

	local talkers = XboxVoice.registered_talkers(slot2)
	slot4 = talkers

	for k, v in pairs(XboxVoice) do
		local info = nil
		slot10 = v

		if type(slot9) == "number" then
			slot11 = v
			info = "      " .. tostring(slot10) .. " - Local Player"
		else
			slot11 = v
			slot14 = v
			info = "      " .. tostring(slot10) .. " - " .. self.playerid_to_name(slot12, self)
		end

		slot11 = info

		cat_print(slot9, "lobby")
	end

	slot5 = "   Registred Sends"

	cat_print(slot3, "lobby")

	local sends = XboxVoice.active_sends(slot3)
	slot5 = sends

	for k, v in pairs(XboxVoice) do
		local num_peers = v.num_peers(slot9)
		slot15 = k
		slot17 = num_peers
		slot12 = "      " .. tostring(slot14) .. " - " .. tostring(slot16)

		cat_print(v, "lobby")

		local PeerNumber = 0

		while PeerNumber < num_peers do
			slot13 = PeerNumber
			local ip = v.ip_at_index(slot11, v)
			slot17 = ip
			slot20 = ip
			slot14 = "         " .. tostring(slot16) .. " - " .. self.ip_to_name(slot18, self)

			cat_print(v, "lobby")

			PeerNumber = PeerNumber + 1
		end
	end

	return 
end

return 
