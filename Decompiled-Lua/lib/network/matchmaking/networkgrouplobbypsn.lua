-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/network/matchmaking/NetworkGroupLobby"

require(slot1)

if not NetworkGroupLobbyPSN then
	slot2 = NetworkGroupLobby
	slot0 = class(slot1)
end

NetworkGroupLobbyPSN = slot0
function NetworkGroupLobbyPSN:init()
	slot3 = self

	NetworkGroupLobby.init(slot2)

	slot4 = "group = NetworkGroupLobbyPSN"

	cat_print(slot2, "lobby")

	self.OPEN_SLOTS = 4
	self._players = {}
	self._returned_players = {}
	self._room_id = nil
	self._inlobby = false
	self._join_enable = true
	self._is_server_var = false
	self._is_client_var = false
	self._callback_map = {}

	local function f(...)
		slot2 = self

		self._custom_message_cb(slot1, ...)

		return 
	end

	slot6 = f

	PSN.set_matchmaking_callback("lobby", PSN, "custom_message")

	self._time_to_leave = nil
	slot4 = self

	self._load_globals("lobby")

	return 
end
function NetworkGroupLobbyPSN:_session_destroyed_cb(room_id)
	slot5 = "NetworkGroupLobbyPSN:_session_destroyed_cb"

	cat_print(slot3, "lobby")

	if room_id == self._room_id then
		slot4 = self

		self.leave_group_lobby_cb(slot3)
	end

	return 
end
function NetworkGroupLobbyPSN:destroy()
	return 
end
function NetworkGroupLobbyPSN:update(time)
	if self._time_to_leave then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)

		if self._time_to_leave < TimerManager.wall(slot3).time(slot3) then
			self._time_to_leave = nil
			slot4 = self

			self.leave_group_lobby_cb(slot3)
		end
	end

	if self._try_time then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)

		if self._try_time < TimerManager.wall(slot3).time(slot3) then
			self._try_time = nil
			slot5 = "join_failed"

			self.leave_group_lobby_cb(slot3, self)
		end
	end

	return 
end
function NetworkGroupLobbyPSN:create_group_lobby()
	cat_print(slot2, "lobby")

	self._players = {}
	slot3 = PSN
	local world_list = PSN.get_world_list(slot2)

	local function session_created(roomid)
		slot4 = roomid

		managers.network.group._created_group_lobby(slot2, managers.network.group)

		return 
	end

	slot7 = session_created

	PSN.set_matchmaking_callback("NetworkGroupLobbyPSN:create_group_lobby()", PSN, "session_created")

	slot10 = 0

	PSN.create_session("NetworkGroupLobbyPSN:create_group_lobby()", PSN, 0, world_list[1].world_id, 0, self.OPEN_SLOTS)

	return 
end
function NetworkGroupLobbyPSN:join_group_lobby(room_info)
	slot5 = false

	self._is_server(slot3, self)

	slot5 = true

	self._is_client(slot3, self)

	if Global.psn_invite_id then
		Global.psn_invite_id = Global.psn_invite_id + 1

		if 990 < Global.psn_invite_id then
			Global.psn_invite_id = 1
		end
	end

	self._room_id = room_info.room_id

	local function f(...)
		slot2 = self

		self._join_invite(slot1, ...)

		return 
	end

	slot7 = f

	PSN.set_matchmaking_callback(slot4, PSN, "connection_etablished")

	slot5 = TimerManager
	slot5 = TimerManager.wall(slot4)
	self._try_time = TimerManager.wall(slot4).time(slot4) + 30
	slot6 = self._room_id

	PSN.join_session(slot4, PSN)

	return 
end
function NetworkGroupLobbyPSN:send_go_to_lobby()
	slot3 = self

	if self._is_server(slot2) then
		slot3 = self._players

		for k, v in pairs(slot2) do
			if v.rpc then
				slot8 = v.rpc

				v.rpc.grp_go_to_lobby(slot7)
			end
		end
	end

	return 
end
function NetworkGroupLobbyPSN:go_to_lobby()
	if self._callback_map.go_to_lobby then
		slot4 = "go_to_lobby"

		self._call_callback(slot2, self)
	else
		slot3 = self

		self.leave_group_lobby(slot2)
	end

	return 
end
function NetworkGroupLobbyPSN:send_return_group_lobby()
	local playerid = managers.network.account.player_id(slot2)
	slot5 = "Now telling server that im back and ready. My playerid is: "
	slot8 = playerid

	cat_print(managers.network.account, "lobby", tostring(slot7))

	local timeout = 40
	slot5 = Application

	if Application.bundled("lobby") then
		timeout = 15
	end

	slot5 = self._server_rpc
	slot8 = managers.network.account

	self._server_rpc.lobby_return(slot4, managers.network.account.player_id(slot7))

	slot5 = self._players

	for k, v in pairs(slot4) do
		if v.is_server then
			slot17 = "_server_timed_out"
			slot15 = timeout

			managers.network.generic.ping_watch(slot9, managers.network.generic, self._server_rpc, false, callback(slot14, self, self), v.pnid)

			return 
		end
	end

	return 
end
function NetworkGroupLobbyPSN:_handle_returned_players()
	if #self._returned_players ~= 0 and self._callback_map.player_returned then
		slot4 = "We now have a return callback so now handling players"

		cat_print(slot2, "lobby")

		slot3 = self._returned_players

		for index, playerid in pairs(slot2) do
			local v, k = nil
			slot11 = playerid
			k, v = self.find(slot9, self)

			if k then
				slot12 = v
				local res = self._call_callback(slot9, self, "player_returned")

				if res == true then
					slot12 = "yes"

					v.rpc.lobby_return_answer(slot10, v.rpc)

					slot18 = "_client_timed_out"
					slot15 = v.pnid

					managers.network.generic.ping_watch(slot10, managers.network.generic, v.rpc, false, callback(slot15, self, self))
				else
					slot12 = "no"

					v.rpc.lobby_return_answer(slot10, v.rpc)
				end
			end
		end

		self._returned_players = {}
	end

	return 
end
function NetworkGroupLobbyPSN:return_group_lobby(playerid, sender)
	slot6 = "Client reports that it has returned to group lobby. "
	slot9 = playerid

	cat_print(slot4, "lobby", tostring(slot8))

	slot6 = playerid

	table.insert(slot4, self._returned_players)

	if self._callback_map.player_returned then
		slot5 = self

		self._handle_returned_players(slot4)
	else
		slot6 = "No player_returned callback so save these returns for later"

		cat_print(slot4, "lobby")
	end

	return 
end
function NetworkGroupLobbyPSN:lobby_return_answer(answer, sender)
	slot7 = tostring(slot8)
	slot10 = self._server_rpc

	cat_print(slot4, "lobby", "Group leader tell us lobby_return_answer. ", tostring(answer))

	if answer == "yes" then
		slot5 = self._players

		for k, v in pairs(slot4) do
			if v.is_server then
				slot17 = "_server_timed_out"
				slot14 = v.pnid

				managers.network.generic.ping_watch(slot9, managers.network.generic, sender, false, callback(slot14, self, self))

				return 
			end
		end
	else
		slot5 = self

		self.leave_group_lobby(slot4)
	end

	return 
end
function NetworkGroupLobbyPSN:find(playerid)
	slot4 = self._players

	for k, v in pairs(slot3) do
		slot10 = playerid

		if tostring(slot8) == tostring(v.playerid) then
			return k, v
		end
	end

	return nil, nil
end
function NetworkGroupLobbyPSN:leave_group_lobby(instant)
	slot4 = self

	if self._is_server(slot3) and #self._players == 0 then
		slot4 = self

		self.leave_group_lobby_cb(slot3)

		return nil
	end

	self._try_time = nil

	if not instant then
		slot4 = self

		if self._is_server(slot3) then
			slot4 = self._players

			for k, v in pairs(slot3) do
				managers.network.generic.ping_remove(slot8, managers.network.generic, v.rpc)

				slot12 = managers.network.account
				slot11 = true

				v.rpc.psn_grp_unregister_player(slot8, v.rpc, managers.network.account.player_id(false))
			end
		elseif self._server_rpc then
			slot7 = managers.network.account
			slot6 = false

			self._server_rpc.psn_grp_unregister_player(slot3, self._server_rpc, managers.network.account.player_id(slot6))

			slot5 = self._server_rpc

			managers.network.generic.ping_remove(slot3, managers.network.generic)
		end

		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)
		self._time_to_leave = TimerManager.wall(slot3).time(slot3) + 2
	else
		slot4 = self

		self.leave_group_lobby_cb(slot3)
	end

	return 
end
function NetworkGroupLobbyPSN:leave_group_lobby_cb(error_callback)
	if self._room_id then
		slot4 = managers.network.voice_chat

		managers.network.voice_chat.close_session(slot3)

		slot4 = self

		if self._is_server(slot3) then
			slot5 = self._room_id

			PSN.destroy_session(slot3, PSN)
		else
			slot5 = self._room_id

			PSN.leave_session(slot3, PSN)
		end
	end

	self._room_id = nil
	self._inlobby = false
	self._is_server_var = false
	self._is_client_var = false
	self._players = {}

	if self._server_rpc then
		slot6 = false

		managers.network.generic.ping_remove(slot3, managers.network.generic, self._server_rpc)

		self._server_rpc = nil
	end

	slot5 = error_callback or "left_group"

	self._call_callback(slot3, self)

	return 
end
function NetworkGroupLobbyPSN:set_join_enabled(enabled)
	self._join_enable = enabled

	if enabled then
		slot4 = managers.network.systemlink
	else
		slot5 = "MPLobby_no_invite"

		managers.platform.set_presence(slot3, managers.platform)
	end

	return 
end
function NetworkGroupLobbyPSN:send_group_lobby_invite(network_friend)
	if self._room_id == nil then
		return false
	end

	slot4 = self._players

	for k, v in pairs(slot3) do
		slot10 = network_friend

		if tostring(slot8) == tostring(v.pnid) then
			return false
		end
	end

	slot4 = PSN
	local friends = PSN.get_list_friends(slot3)

	if friends then
		slot5 = friends

		for k, v in pairs(slot4) do
			slot11 = network_friend

			if tostring(slot9) == tostring(v.friend) and v.status == 2 and v.info then
				slot11 = managers.platform

				if v.info == managers.platform.presence(slot10) then
					local msg = {
						join_invite = true
					}

					if not Global.psn_invite_id then
						Global.psn_invite_id = 1
					end

					msg.invite_id = Global.psn_invite_id
					slot14 = msg

					PSN.send_message_custom(slot10, PSN, network_friend, self._room_id)

					return true
				end
			end
		end
	end

	return false
end
function NetworkGroupLobbyPSN:kick_player(player_id, timeout)
	local v, k, rpc = nil
	slot9 = player_id
	k, v = self.find(slot7, self)

	if k and v.rpc then
		rpc = v.rpc
		slot9 = "no"

		rpc.lobby_return_answer(slot7, rpc)
	end

	slot11 = rpc

	self._unregister_player(slot7, self, player_id, false)

	return 
end
function NetworkGroupLobbyPSN:accept_group_lobby_invite(room, accept)
	if accept == true then
		slot7 = room

		self._call_callback(slot4, self, "accepted_group_lobby_invite")
	end

	return 
end
function NetworkGroupLobbyPSN:send_game_id(id, private, created)
	if created and created == true then
		slot6 = self._players

		for k, v in pairs(slot5) do
			slot13 = v.pnid

			self._call_callback(slot10, self, "reserv_slot")
		end
	end

	slot6 = self._players

	for k, v in pairs(slot5) do
		slot15 = id
		slot13 = private

		v.rpc.psn_send_mm_id(slot10, v.rpc, PSN.convert_sessionid_to_string(slot13, PSN))
	end

	return 
end
function NetworkGroupLobbyPSN:register_callback(event, callback)
	self._callback_map[event] = callback

	return 
end
function NetworkGroupLobbyPSN:start_game()
	slot4 = "game_started"

	self._call_callback(slot2, self)

	return 
end
function NetworkGroupLobbyPSN:end_game()
	return 
end
function NetworkGroupLobbyPSN:ingame_start_game()
	if self._server_rpc then
		slot3 = self._players

		for k, v in pairs(slot2) do
			if v.is_server then
				slot15 = "_server_timed_out"
				slot12 = v.pnid

				managers.network.generic.ping_watch(slot7, managers.network.generic, self._server_rpc, false, callback(slot12, self, self))

				return 
			end
		end
	end

	return 
end
function NetworkGroupLobbyPSN:say(message)
	slot4 = self

	if self._is_server(slot3) then
		slot4 = self._players

		for k, v in pairs(slot3) do
			slot10 = message

			v.rpc.say_toclient(slot8, v.rpc)
		end
	end

	return 
end
function NetworkGroupLobbyPSN:membervoted(player, votes)
	slot5 = self

	if self._is_server(slot4) then
		slot5 = self._players

		for k, v in pairs(slot4) do
			slot12 = votes

			v.rpc.membervoted_toclient(slot9, v.rpc, player)
		end
	end

	return 
end
function NetworkGroupLobbyPSN:is_group_leader()
	slot3 = self

	return self._is_server(slot2) == true
end
function NetworkGroupLobbyPSN:has_pending_invite()
	return false
end
function NetworkGroupLobbyPSN:is_in_group()
	if self._inlobby then
		return true
	end

	return false
end
function NetworkGroupLobbyPSN:num_group_players()
	local x = 0
	slot4 = self._players

	for k, v in pairs(slot3) do
		x = x + 1
	end

	return x
end
function NetworkGroupLobbyPSN:get_group_players()
	return self._players
end
function NetworkGroupLobbyPSN:is_full()
	if #self._players == self.OPEN_SLOTS - 1 then
		return true
	end

	return false
end
function NetworkGroupLobbyPSN:get_leader_rpc()
	return self._server_rpc
end
function NetworkGroupLobbyPSN:get_members_rpcs()
	local rpcs = {}
	slot4 = self._players

	for _, v in pairs(slot3) do
		if v.rpc then
			slot10 = v.rpc

			table.insert(slot8, rpcs)
		else
			slot10 = "A player without an RPC. This is not good!"

			Application.throw_exception(slot8, Application)
		end
	end

	return rpcs
end
function NetworkGroupLobbyPSN:resync_screen()
	slot3 = managers.network

	managers.network.bind_port(slot2)

	slot3 = self

	if self.is_group_leader(slot2) then
		local playerinfo = {}
		slot4 = managers.network.account
		playerinfo.name = managers.network.account.username(slot3)
		slot4 = managers.network.account
		playerinfo.player_id = managers.network.account.player_id(slot3)
		slot4 = self._room_id
		playerinfo.group_id = tostring(slot3)
		slot5 = "TCP_IP"
		playerinfo.rpc = Network.self(slot3, Network)
		slot6 = playerinfo

		self._call_callback(slot3, self, "player_joined")
	else
		local playerinfo = {}
		slot4 = managers.network.account
		playerinfo.name = managers.network.account.username(slot3)
		slot4 = managers.network.account
		playerinfo.player_id = managers.network.account.player_id(slot3)
		slot4 = self._room_id
		playerinfo.group_id = tostring(slot3)
		slot5 = "TCP_IP"
		playerinfo.rpc = Network.self(slot3, Network)
		slot6 = playerinfo

		self._call_callback(slot3, self, "player_joined")
	end

	slot3 = self._players

	for k, v in pairs(slot2) do
		local playerinfo = {
			name = v.name,
			player_id = v.pnid,
			group_id = v.group,
			rpc = v.rpc
		}
		slot11 = playerinfo

		self._call_callback(slot8, self, "player_joined")
	end

	return 
end
function NetworkGroupLobbyPSN:room_id()
	return self._room_id
end
function NetworkGroupLobbyPSN:_load_globals()
	if Global.psn and Global.psn.group then
		self._room_id = Global.psn.group.room_id
		self._inlobby = Global.psn.group.inlobby
		self._is_server_var = Global.psn.group.is_server
		self._is_client_var = Global.psn.group.is_client
		self._players = Global.psn.group.players
		self._server_rpc = Global.psn.group.server_rpc
		self._returned_players = Global.psn.group._returned_players
		Global.psn.group = nil
	end

	return 
end
function NetworkGroupLobbyPSN:_save_global()
	if not Global.psn then
		Global.psn = {}
	end

	Global.psn.group = {
		room_id = self._room_id,
		inlobby = self._inlobby,
		is_server = self._is_server_var,
		is_client = self._is_client_var,
		players = self._players,
		server_rpc = self._server_rpc,
		_returned_players = self._returned_players
	}

	return 
end
function NetworkGroupLobbyPSN:_call_callback(name, ...)
	if self._callback_map[name] then
		return self._callback_map[name](...)
	else
		slot5 = "Callback " .. name .. " not found."

		Application.error(slot3, Application)
	end

	return 
end
function NetworkGroupLobbyPSN:_is_server(set)
	if set == true or set == false then
		self._is_server_var = set
	else
		return self._is_server_var
	end

	return 
end
function NetworkGroupLobbyPSN:_is_client(set)
	if set == true or set == false then
		self._is_client_var = set
	else
		return self._is_client_var
	end

	return 
end
function NetworkGroupLobbyPSN:_custom_message_cb(message)
	if message.custom_table and message.custom_table.join_invite and self._join_enable then
		self._invite_id = message.custom_table.invite_id
		slot7 = message.sender

		self._call_callback(slot3, self, "receive_group_lobby_invite", message)
	end

	return 
end
function NetworkGroupLobbyPSN:_recv_game_id(id, private)
	slot8 = private

	self._call_callback(slot4, self, "receive_game_id", id)

	return 
end
function NetworkGroupLobbyPSN:_created_group_lobby(room_id)
	if not room_id then
		slot5 = "create_group_failed"

		self._call_callback(slot3, self)

		return 
	end

	function slot6()
		return 
	end

	PSN.set_matchmaking_callback(slot3, PSN, "session_created")

	slot5 = "created_group"

	self._call_callback(slot3, self)

	slot5 = "NetworkGroupLobbyPSN:_created_group_lobby()"

	cat_print(slot3, "lobby")

	self._room_id = room_id
	slot5 = self._room_id

	PSN.hide_session(slot3, PSN)

	self._inlobby = true
	slot5 = self._room_id
	self._room_info = PSN.get_info_session(slot3, PSN)
	slot5 = true

	self._is_server(slot3, self)

	slot5 = false

	self._is_client(slot3, self)

	slot4 = managers.network

	managers.network.bind_port(slot3)

	slot5 = self._room_id

	managers.network.voice_chat.open_session(slot3, managers.network.voice_chat)

	local playerinfo = {}
	slot5 = managers.network.account
	playerinfo.name = managers.network.account.username(managers.network.voice_chat)
	slot5 = managers.network.account
	playerinfo.player_id = managers.network.account.player_id(managers.network.voice_chat)
	slot5 = room_id
	playerinfo.group_id = tostring(managers.network.voice_chat)
	slot6 = "TCP_IP"
	playerinfo.rpc = Network.self(managers.network.voice_chat, Network)
	slot7 = playerinfo

	self._call_callback(managers.network.voice_chat, self, "player_joined")

	return 
end
function NetworkGroupLobbyPSN:_clear_psn_callback(cb)
	local function f()
		return 
	end

	slot7 = f

	PSN.set_matchmaking_callback(slot4, PSN, cb)

	return 
end
function NetworkGroupLobbyPSN:_join_invite(info)
	if info.room_id == self._room_id and info.user_id == info.owner_id then
		slot5 = "connection_etablished"

		self._clear_psn_callback(slot3, self)

		self._try_time = nil
		slot5 = self._room_id
		self._room_info = PSN.get_info_session(slot3, PSN)
		slot6 = info.port
		self._server_rpc = Network.handshake(slot3, Network, info.external_ip)

		if not self._server_rpc then
			slot5 = "Could not connect with rpc"

			Application.error(slot3, Application)

			return 
		end

		slot6 = 10

		Network.set_timeout(slot3, Network, self._server_rpc)

		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)
		self._try_time = TimerManager.wall(slot3).time(slot3) + 10
		slot5 = self._invite_id

		self._server_rpc.psn_grp_hello(slot3, self._server_rpc)
	end

	return 
end
function NetworkGroupLobbyPSN:_server_alive(server)
	if self._server_rpc then
		slot5 = 0
		slot6 = 0

		if self._server_rpc.ip_at_index(slot3, self._server_rpc) == server.ip_at_index(self._server_rpc, server) then
			self._try_time = nil

			Network.set_timeout(slot3, Network, self._server_rpc)

			slot8 = managers.network.account
			slot11 = managers.network.group
			slot8 = false

			self._server_rpc.psn_grp_register_player(slot3, self._server_rpc, managers.network.account.username(3000), managers.network.account.player_id(managers.network.account), tostring(managers.network.group.room_id(slot10)))

			self._inlobby = true
			slot4 = TimerManager
			slot4 = TimerManager.wall(slot3)
			self._try_time = TimerManager.wall(slot3).time(slot3) + 10
		end
	end

	return 
end
function NetworkGroupLobbyPSN:_register_player(name, pnid, group, rpc, is_server)
	if self.OPEN_SLOTS <= #self._players + 1 then
		return 
	end

	self._try_time = nil
	local new_player = {
		name = name,
		pnid = pnid,
		playerid = pnid,
		group = group
	}
	slot9 = self

	if self._is_server(slot8) then
		new_player.rpc = rpc
		slot13 = managers.network.account
		slot16 = managers.network.group
		slot13 = true

		rpc.psn_grp_register_player(slot8, rpc, managers.network.account.username(slot11), managers.network.account.player_id(managers.network.account), tostring(managers.network.group.room_id(slot15)))

		slot9 = self._players

		for k, v in pairs(slot8) do
			slot18 = false

			v.rpc.psn_grp_register_player(slot13, v.rpc, name, pnid, group)

			slot18 = false

			rpc.psn_grp_register_player(slot13, rpc, v.name, v.pnid, v.group)
		end

		slot16 = "_client_timed_out"
		slot13 = pnid

		managers.network.generic.ping_watch(slot8, managers.network.generic, rpc, false, callback(slot13, self, self))
	end

	if is_server and is_server == true then
		new_player.is_server = true
		slot16 = "_server_timed_out"

		managers.network.generic.ping_watch(slot8, managers.network.generic, self._server_rpc, false, callback(slot13, self, self))

		slot10 = self._room_id

		managers.network.voice_chat.open_session(slot8, managers.network.voice_chat)

		slot11 = {
			player_id = managers.network.account.player_id(pnid),
			group_id = tostring(pnid),
			name = managers.network.account.username(pnid),
			rpc = Network.self(pnid, Network)
		}
		slot14 = managers.network.account
		slot14 = self._room_id
		slot14 = managers.network.account
		slot15 = "TCP_IP"

		self._call_callback(slot8, self, "player_joined")
	end

	slot10 = new_player

	table.insert(slot8, self._players)

	if MPFriendsScreen.instance then
		slot9 = MPFriendsScreen.instance

		MPFriendsScreen.instance.reset_list(slot8)
	end

	local playerinfo = {
		name = name,
		player_id = pnid,
		group_id = group,
		rpc = rpc
	}
	slot12 = playerinfo

	self._call_callback(slot9, self, "player_joined")

	return 
end
function NetworkGroupLobbyPSN:_unregister_player(pnid, is_server, rpc)
	slot6 = self

	if self._is_client(slot5) and is_server == true then
		slot6 = self

		self.leave_group_lobby_cb(slot5)

		return 
	end

	slot7 = "_unregister_player: didn't leave group"

	cat_print(slot5, "lobby")

	local new_list = {}
	slot7 = self._players

	for k, v in pairs("lobby") do
		if v.pnid ~= pnid then
			slot13 = v

			table.insert(slot11, new_list)
		end
	end

	self._players = new_list

	if MPFriendsScreen.instance then
		slot7 = MPFriendsScreen.instance

		MPFriendsScreen.instance.reset_list(slot6)
	end

	slot7 = self

	if self._is_server(slot6) then
		slot9 = false

		managers.network.generic.ping_remove(slot6, managers.network.generic, rpc)

		slot7 = self._players

		for k, v in pairs(slot6) do
			slot14 = false

			v.rpc.psn_grp_unregister_player(slot11, v.rpc, pnid)
		end
	end

	slot9 = {
		reason = "went home to mama",
		player_id = pnid
	}

	self._call_callback(slot6, self, "player_left")

	return 
end
function NetworkGroupLobbyPSN:_in_list(id)
	slot4 = self._players

	for k, v in pairs(slot3) do
		slot10 = id

		if tostring(slot8) == tostring(v.pnid) then
			return true
		end
	end

	return false
end
function NetworkGroupLobbyPSN:_server_timed_out(rpc)
	slot5 = rpc

	NetworkGroupLobby._server_timed_out(slot3, self)

	slot7 = rpc

	self._unregister_player(slot3, self, nil, true)

	return 
end
function NetworkGroupLobbyPSN:_client_timed_out(rpc)
	slot4 = self._players

	for k, v in pairs(slot3) do
		if v.rpc then
			slot10 = 0
			slot11 = 0

			if v.rpc.ip_at_index(slot8, v.rpc) == rpc.ip_at_index(v.rpc, rpc) then
				slot12 = v.rpc

				self._unregister_player(slot8, self, v.pnid, false)

				return 
			end
		end
	end

	return 
end
function NetworkGroupLobbyPSN:leaving_game()
	slot3 = self

	if self._is_server(slot2) then
		slot4 = true

		self.leave_group_lobby(slot2, self)
	end

	return 
end

return 
