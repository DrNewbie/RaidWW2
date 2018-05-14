-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
NetworkMatchMakingPSN = NetworkMatchMakingPSN or class()
NetworkMatchMakingPSN.OPEN_SLOTS = 4
NetworkMatchMakingPSN.MAX_SEARCH_RESULTS = 20
NetworkMatchMakingPSN.init = function (self)
	slot4 = "matchmake = NetworkMatchMakingPSN"

	cat_print(slot2, "lobby")

	self._players = {}
	self._TRY_TIME_INC = 10
	self._PSN_TIMEOUT_INC = 20
	self._JOIN_SERVER_TRY_TIME_INC = self._PSN_TIMEOUT_INC + 5
	self._room_id = nil
	self._join_cb_room = nil
	self._server_rpc = nil
	self._is_server_var = false
	self._is_client_var = false
	self._difficulty_filter = 0
	self._private = false
	self._callback_map = {}
	self._hidden = false
	self._server_joinable = true
	self._connection_info = {}

	local function f(info)
		slot4 = info

		self._error_cb(slot2, self)

		return 
	end

	slot6 = f

	PSN.set_matchmaking_callback("lobby", PSN, "error")
	self._load_globals("lobby")

	self._cancelled = false
	self._peer_join_request_remove = {}

	local function f(...)
		slot2 = self

		self._custom_message_cb(slot1, ...)

		return 
	end

	slot7 = f

	PSN.set_matchmaking_callback(self, PSN, "custom_message")

	slot6 = "invitation_received_result"
	slot11 = "_invitation_received_result_cb"

	PSN.set_matchmaking_callback(self, PSN, callback(slot8, self, self))

	slot6 = "join_invite_accepted_xmb"
	slot11 = "_xmb_join_invite_cb"

	PSN.set_matchmaking_callback(self, PSN, callback(slot8, self, self))

	slot6 = "worlds_fetched"
	slot11 = "_worlds_fetched_cb"

	PSN.set_matchmaking_callback(self, PSN, callback(slot8, self, self))

	local function js(...)
		slot2 = self

		self.cb_connection_established(slot1, ...)

		return 
	end

	slot8 = js

	PSN.set_matchmaking_callback(PSN, PSN, "connection_etablished")

	return 
end
NetworkMatchMakingPSN._xmb_join_invite_cb = function (self, message)
	local function ok_func()
		slot2 = managers.network.account

		if managers.network.account.signin_state(slot1) == "not signed in" then
			slot2 = managers.network.account

			managers.network.account.show_signin_ui(slot1)
		end

		return 
	end

	slot6 = {
		ok_func = ok_func
	}

	managers.menu.show_invite_join_message(slot4, managers.menu)

	return 
end
NetworkMatchMakingPSN._start_time_out_check = function (self)
	slot4 = "fetch_session_attributes"
	slot9 = "_time_out_check_cb"

	PSN.set_matchmaking_callback(slot2, PSN, callback(slot6, self, self))

	slot3 = self

	self._trigger_time_out_check(slot2)

	return 
end
NetworkMatchMakingPSN._trigger_time_out_check = function (self)
	if self._room_id then
		slot3 = Application
		self._next_time_out_check_t = Application.time(slot2) + 4
		self._testing_connection = true
		slot5 = {
			numbers = {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			}
		}

		PSN.get_session_attributes(slot2, PSN, {
			self._room_id
		})
	else
		self._next_time_out_check_t = nil
	end

	return 
end
NetworkMatchMakingPSN._time_out_check_cb = function (self)
	slot3 = Application
	self._last_alive_t = Application.time(slot2)
	self._testing_connection = nil

	return 
end
NetworkMatchMakingPSN._end_time_out_check = function (self)
	self._next_time_out_check_t = nil
	self._last_alive_t = nil

	function slot5()
		return 
	end

	PSN.set_matchmaking_callback(slot2, PSN, "fetch_session_attributes")

	return 
end
NetworkMatchMakingPSN._on_disconnect_detected = function (self)
	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
	else
		slot3 = managers.network

		if managers.network.session(slot2) then
			slot3 = managers.network
			slot3 = managers.network.session(slot2)

			managers.network.session(slot2).psn_disconnected(slot2)
		elseif setup.IS_START_MENU then
			slot4 = false

			managers.menu.ps3_disconnect(slot2, managers.menu)
		end
	end

	return 
end
NetworkMatchMakingPSN._worlds_fetched_cb = function (self, ...)
	slot3 = "_worlds_fetched_cb"

	print(slot2)

	self._getting_world_list = nil
	slot4 = "get_world_list"

	managers.system_menu.close(slot2, managers.system_menu)

	if Global.boot_invite and Global.boot_invite.pending then
		function slot4(success)
			if not success then
				return 
			end

			slot3 = self

			self.join_boot_invite(slot2)

			return 
		end

		managers.menu.open_sign_in_menu(slot2, managers.menu)
	end

	return 
end
NetworkMatchMakingPSN._getting_world_list_failed = function (self)
	slot3 = "failed_getting_world_list"

	print(slot2)

	slot4 = true

	managers.menu.back(slot2, managers.menu)

	slot3 = managers.menu

	managers.menu.show_no_connection_to_game_servers_dialog(slot2)

	slot3 = self

	self._worlds_fetched_cb(slot2)

	return 
end
NetworkMatchMakingPSN.getting_world_list = function (self)
	slot3 = "getting_world_list"

	print(slot2)

	self._getting_world_list = true
	slot4 = {
		cancel_func = callback(slot6, self, self)
	}
	slot9 = "_getting_world_list_failed"

	managers.menu.show_get_world_list_dialog(slot2, managers.menu)

	return 
end
NetworkMatchMakingPSN._session_destroyed_cb = function (self, room_id, ...)
	slot5 = room_id

	print(slot3, "NetworkMatchMakingPSN:_session_destroyed_cb", ...)

	slot5 = "NetworkMatchMakingPSN:_session_destroyed_cb"

	cat_print(slot3, "lobby")

	if room_id == self._room_id then
		if not self._is_server_var then
			slot4 = managers.network

			managers.network.queue_stop_network(slot3)

			slot5 = self._room_id

			PSN.leave_session(slot3, PSN)

			self._room_id = nil
			slot4 = self

			self.leave_game(slot3)
		end

		self._room_id = nil
		slot4 = Network

		if Network.is_client(slot3) then
			slot4 = managers.network
		elseif self._joining_lobby then
			slot5 = {
				error = "80022b13"
			}

			self._error_cb(slot3, self)
		end
	end

	self._skip_destroy_cb = nil

	return 
end
NetworkMatchMakingPSN.room_id = function (self)
	return self._room_id
end
NetworkMatchMakingPSN.create_private_game = function (self, settings)
	self._cancelled = false
	self._private = true

	if Global.psn_invite_id then
		Global.psn_invite_id = Global.psn_invite_id + 1

		if 990 < Global.psn_invite_id then
			Global.psn_invite_id = 1
		end
	end

	self._last_settings = settings
	slot5 = true

	self._create_server(slot3, self)

	return 
end
NetworkMatchMakingPSN.cancel_find = function (self)
	self._cancelled = true
	self._is_server_var = false
	self._is_client_var = false
	self._players = {}
	self._server_rpc = nil
	self._try_list = nil
	self._try_index = nil
	self._trytime = nil
	slot3 = self

	self._end_time_out_check(slot2)

	slot3 = self

	self.destroy_game(slot2)

	self._room_id = nil
	slot3 = managers.network.group

	if managers.network.group.room_id(slot2) then
		slot3 = managers.network.voice_chat
		slot6 = managers.network.group

		managers.network.voice_chat.open_session(slot2, managers.network.group.room_id(slot5))
	end

	if not self._join_cb_room then
		slot4 = "cancel_done"

		self._call_callback(slot2, self)
	else
		slot3 = TimerManager
		slot3 = TimerManager.wall(slot2)
		self._cancel_time = TimerManager.wall(slot2).time(slot2) + 10
	end

	return 
end
NetworkMatchMakingPSN.remove_ping_watch = function (self)
	slot3 = self

	if self._is_client(slot2) then
		if self._server_rpc then
		end
	else
		slot3 = self._players

		for k, v in pairs(slot2) do
			if v.rpc then
			end
		end
	end

	return 
end
NetworkMatchMakingPSN.leave_game = function (self)
	local sent = false
	slot4 = self

	self.remove_ping_watch(slot3)

	slot4 = self

	self._end_time_out_check(slot3)

	self._no_longer_in_session = nil
	slot4 = self

	if self._is_client(slot3) then
		if self._server_rpc then
			sent = true
		end

		slot4 = managers.network.group

		if managers.network.group._is_client(slot3) then
			slot5 = "group_leader_left_match"

			self._call_callback(slot3, self)
		end
	else
		slot4 = self._players

		for k, v in pairs(slot3) do
			if v.rpc then
				sent = true
			end
		end
	end

	if sent then
		slot4 = managers.network
	else
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)
		self._leave_time = TimerManager.wall(slot3).time(slot3) + 0
	end

	return 
end
NetworkMatchMakingPSN.register_callback = function (self, event, callback)
	self._callback_map[event] = callback

	return 
end
NetworkMatchMakingPSN.join_game = function (self, id, private)
	return 
end
NetworkMatchMakingPSN.start_game = function (self)
	return 
end
NetworkMatchMakingPSN.end_game = function (self)
	return 
end
NetworkMatchMakingPSN.destroy_game = function (self)
	if self._room_id then
		self._no_longer_in_session = nil
		slot3 = self

		self._end_time_out_check(slot2)

		slot3 = self

		if self._is_client(slot2) then
			slot4 = self._room_id

			PSN.leave_session(slot2, PSN)
		else
			slot4 = self._room_id

			PSN.destroy_session(slot2, PSN)
		end
	else
		slot4 = "Dont got a room id!?"

		cat_print(slot2, "multiplayer")
	end

	return 
end
NetworkMatchMakingPSN.is_game_owner = function (self)
	slot3 = self

	return self._is_server(slot2) == true
end
NetworkMatchMakingPSN.game_owner_name = function (self)
	slot3 = self._game_owner_id

	return tostring(slot2)
end
NetworkMatchMakingPSN.is_full = function (self)
	if #self._players == self.OPEN_SLOTS - 1 then
		return true
	end

	return false
end
NetworkMatchMakingPSN.get_mm_id = function (self, name)
	slot4 = managers.network.account

	if name == managers.network.account.username(slot3) then
		slot4 = managers.network.account

		return managers.network.account.player_id(slot3)
	else
		slot4 = self._players

		for k, v in pairs(slot3) do
			if v.name == name then
				return v.pnid
			end
		end
	end

	return nil
end
NetworkMatchMakingPSN.user_in_lobby = function (self, id)
	if not self._room_id then
		return false
	end

	slot5 = self._room_id

	if not PSN.get_info_session(slot3, PSN) then
		return false
	end

	slot5 = self._room_id
	local memberlist = PSN.get_info_session(slot3, PSN).memberlist
	slot5 = memberlist

	for _, member in ipairs(PSN) do
		if member.user_id == id then
			return true
		end
	end

	return false
end
NetworkMatchMakingPSN.psn_disconnected = function (self)
	self._no_longer_in_session = nil
	Global.boot_invite = nil

	if self._joining_lobby then
		slot3 = self

		self._joining_lobby_done(slot2)
	end

	if self._searching_lobbys then
		slot3 = self

		self.search_lobby_done(slot2)
	end

	if self._creating_lobby then
		slot3 = self

		self._create_lobby_done(slot2)
	end

	return 
end
NetworkMatchMakingPSN.update = function (self, time)
	if self._queue_end_game then
		self._queue_end_game = self._queue_end_game - 1

		if self._queue_end_game < 0 then
			slot4 = "EXITING FOR INVITE"

			print(slot3)

			self._queue_end_game = nil
			slot4 = MenuCallbackHandler

			MenuCallbackHandler._dialog_end_game_yes(slot3)
		end
	end

	if self._no_longer_in_session then
		if self._no_longer_in_session == 0 then
			slot4 = Network

			if Network.is_client(slot3) then
				slot4 = managers.network
			else
				slot4 = Network

				if Network.is_server(slot3) then
					slot4 = managers.network

					if managers.network.session(slot3) then
						slot4 = game_state_machine

						if game_state_machine.current_state(slot3).on_disconnected then
							slot4 = game_state_machine
							slot4 = game_state_machine.current_state(slot3)

							game_state_machine.current_state(slot3).on_disconnected(slot3)
						end
					end
				end
			end

			self._no_longer_in_session = nil
		else
			self._no_longer_in_session = self._no_longer_in_session - 1
		end
	end

	if self._next_time_out_check_t then
		if self._last_alive_t then
			slot5 = Application
		elseif self._next_time_out_check_t then
			slot5 = Application

			if self._next_time_out_check_t < Application.time(slot4) then
				slot4 = self

				self._trigger_time_out_check(slot3)
			end
		end
	end

	if self._trytime then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)

		if self._trytime < TimerManager.wall(slot3).time(slot3) then
			self._trytime = nil
			slot7 = self

			print(slot3, inspect(slot6))

			local is_server = self._is_server_var
			self._is_server_var = false
			self._is_client_var = false
			slot6 = "Signed_in"

			managers.platform.set_presence("self._trytime run out!", managers.platform)

			self._players = {}
			self._server_rpc = nil

			if self._joining_lobby then
				slot6 = {
					error = "8002231d"
				}

				self._error_cb(slot4, self)
			end

			if self._room_id then
				if not is_server then
					slot6 = self._room_id

					print(slot4, " LEAVE SESSION BECAUSE OF TIME OUT")

					slot5 = self

					self.leave_game(slot4)
				end
			elseif not self._last_settings then
				slot6 = "cancel_done"

				self._call_callback(slot4, self)
			end
		end
	end

	if self._leave_time then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)

		if self._leave_time < TimerManager.wall(slot3).time(slot3) then
			local closed = false

			if self._room_id then
				slot5 = PSN

				if PSN.is_online(slot4) then
					slot5 = managers.network.group

					if managers.network.group.room_id(slot4) then
						slot5 = managers.network.voice_chat
						slot8 = managers.network.group

						managers.network.voice_chat.open_session(slot4, managers.network.group.room_id(slot7))
					end
				end

				if not self._call_server_timed_out then
					slot5 = TimerManager
					slot5 = TimerManager.wall(slot4)
					self._leaving_timer = TimerManager.wall(slot4).time(slot4) + 10
				end

				slot5 = self

				if self._is_client(slot4) then
					slot5 = "leave session HERE"

					print(slot4)

					slot6 = self._room_id
					closed = PSN.leave_session(slot4, PSN)
				else
					slot6 = self._room_id
					closed = PSN.destroy_session(slot4, PSN)
				end
			end

			self._players = {}
			self._game_owner_id = nil
			self._server_rpc = nil
			self._leave_time = nil
			self._is_client_var = false
			self._is_server_var = false

			if self._call_server_timed_out == true then
				self._call_server_timed_out = nil
				slot6 = "server_timedout"

				self._call_callback(slot4, self)
			elseif closed == false then
				slot5 = "left game callback"

				print(slot4)

				slot6 = "leaving_game"

				managers.system_menu.close(slot4, managers.system_menu)

				if self._invite_room_id then
					slot7 = true

					self.join_server_with_check(slot4, self, self._invite_room_id)
				end

				slot6 = "left_game"

				self._call_callback(slot4, self)
			end
		end
	end

	if self._leaving_timer then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)

		if self._leaving_timer < TimerManager.wall(slot3).time(slot3) then
			slot4 = "self._leaving_timer left_game"

			print(slot3)

			slot5 = "leaving_game"

			managers.system_menu.close(slot3, managers.system_menu)

			self._room_id = nil
			self._leaving_timer = nil
			slot5 = "left_game"

			self._call_callback(slot3, self)
		end
	end

	if self._cancel_time then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)

		if self._cancel_time < TimerManager.wall(slot3).time(slot3) then
			self._cancel_time = nil
			self._join_cb_room = nil
			slot5 = "cancel_done"

			self._call_callback(slot3, self)
		end
	end

	return 
end
NetworkMatchMakingPSN._load_globals = function (self)
	if Global.psn and Global.psn.match then
		self._game_owner_id = Global.psn.match._game_owner_id
		self._room_id = Global.psn.match._room_id
		self._is_server_var = Global.psn.match._is_server
		self._is_client_var = Global.psn.match._is_client
		self._players = Global.psn.match._players

		if Global.psn.match._server_ip then
			slot6 = "TCP_IP"
			slot1 = Network.handshake(slot2, Network, Global.psn.match._server_ip, nil)
		end

		self._server_rpc = slot1
		self._attributes_numbers = Global.psn.match._attributes_numbers
		self._connection_info = Global.psn.match._connection_info
		self._hidden = Global.psn.match._hidden
		self._num_players = Global.psn.match._num_players
		Global.psn.match = nil
		slot3 = self

		self._start_time_out_check(nil)

		if self._room_id then
			slot4 = self._room_id
			local info_session = PSN.get_info_session(slot2, PSN)

			if not info_session or #info_session.memberlist == 0 then
				self._no_longer_in_session = 1
			end
		end
	end

	return 
end
NetworkMatchMakingPSN._save_globals = function (self)
	if not Global.psn then
		Global.psn = {}
	end

	Global.psn.match = {
		_game_owner_id = self._game_owner_id,
		_room_id = self._room_id,
		_is_server = self._is_server_var,
		_is_client = self._is_client_var,
		_players = self._players
	}
	slot1 = Global.psn.match

	if self._server_rpc then
		slot5 = 0
		slot2 = self._server_rpc.ip_at_index(slot3, self._server_rpc)
	end

	slot1._server_ip = slot2
	Global.psn.match._attributes_numbers = self._attributes_numbers
	Global.psn.match._connection_info = self._connection_info
	Global.psn.match._hidden = self._hidden
	Global.psn.match._num_players = self._num_players

	return 
end
NetworkMatchMakingPSN._call_callback = function (self, name, ...)
	if self._callback_map[name] then
		return self._callback_map[name](...)
	else
		slot5 = "Callback " .. name .. " not found."

		Application.error(slot3, Application)
	end

	return 
end
NetworkMatchMakingPSN._clear_psn_callback = function (self, cb)
	local function f()
		return 
	end

	slot7 = f

	PSN.set_matchmaking_callback(slot4, PSN, cb)

	return 
end
NetworkMatchMakingPSN.psn_member_joined = function (self, info)
	slot4 = "psn_member_joined"

	print(slot3)

	slot6 = info

	print(inspect(slot5))

	if info and info.room_id == self._room_id then
		if not self._private then
			slot5 = self._room_id

			managers.network.voice_chat.open_session(slot3, managers.network.voice_chat)
		end

		slot5 = managers.network.account

		if info.user_id == managers.network.account.player_id(slot4) then
		else
			slot2 = 10
		end
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot5 = info.user_id
		self._peer_join_request_remove[tostring("   remove from remove list")] = nil
		slot7 = info.user_id

		print(tostring("   remove from remove list"), tostring(slot6))
	end

	return 
end
NetworkMatchMakingPSN.psn_member_left = function (self, info)
	if info and info.room_id == self._room_id then
		slot5 = managers.network.account

		if info.user_id == managers.network.account.player_id(slot4) then
			slot4 = "IT WAS ME WHO LEFT"

			print(slot3)

			self._skip_destroy_cb = true
			self._connection_info = {}
			slot5 = "Signed_in"

			managers.platform.set_presence(slot3, managers.platform)

			slot5 = "leaving_game"

			managers.system_menu.close(slot3, managers.system_menu)

			if self._try_time then
				self._trytime = nil

				if not self._last_settings then
					slot5 = "cancel_done"

					self._call_callback(slot3, self)
				end

				if self._invite_room_id then
					slot6 = true

					self.join_server_with_check(slot3, self, self._invite_room_id)
				end

				return 
			end

			if self._leaving_timer then
				self._room_id = nil
				self._leaving_timer = nil
				slot5 = "left_game"

				self._call_callback(slot3, self)

				if self._invite_room_id then
					slot6 = true

					self.join_server_with_check(slot3, self, self._invite_room_id)
				end

				return 
			end
		else
			slot5 = info.user_id

			print(slot3, "SOMEONE ELSE LEFT")

			local user_name = tostring(slot3)
			slot6 = info.user_id

			self._remove_peer_by_user_id(info.user_id, self)

			slot5 = self

			if self._is_server(info.user_id) then
				slot7 = info.user_id

				self._call_callback(slot4, self, "remove_reservation")
			end
		end
	end

	return 
end
NetworkMatchMakingPSN._remove_peer_by_user_id = function (self, user_id)
	self._connection_info[user_id] = nil
	slot4 = managers.network

	if not managers.network.session(nil) then
		return 
	end

	slot4 = user_id
	local user_name = tostring(slot3)
	slot7 = managers.network
	slot7 = managers.network.session(slot6)

	for pid, peer in pairs(managers.network.session(slot6).peers(slot6)) do
		slot10 = peer

		if peer.name(slot9) == user_name then
			slot13 = peer

			print(slot9, " _remove_peer_by_user_id on_peer_left", peer.id(pid))

			slot10 = managers.network
			slot12 = pid

			managers.network.session(slot9).on_peer_left(slot9, managers.network.session(slot9), peer)

			return 
		end
	end

	slot5 = Network

	if Network.is_server(slot4) then
		self._peer_join_request_remove[user_id] = true
		slot6 = user_id

		print(true, "queue to remove if we get a request")
	end

	return 
end
NetworkMatchMakingPSN.check_peer_join_request_remove = function (self, user_id)
	local has = self._peer_join_request_remove[user_id]
	self._peer_join_request_remove[user_id] = nil

	return has
end
NetworkMatchMakingPSN._is_server = function (self, set)
	if set == true or set == false then
		self._is_server_var = set
	else
		return self._is_server_var
	end

	return 
end
NetworkMatchMakingPSN._is_client = function (self, set)
	if set == true or set == false then
		self._is_client_var = set
	else
		return self._is_client_var
	end

	return 
end
NetworkMatchMakingPSN._game_version = function (self)
	slot3 = PSN

	return PSN.game_version(slot2)
end
NetworkMatchMakingPSN.create_lobby = function (self, settings)
	slot4 = "NetworkMatchMakingPSN:create_group_lobby()"
	slot7 = settings

	print(slot3, inspect(slot6))

	self._server_joinable = true
	self._num_players = nil
	self._server_rpc = nil
	self._players = {}
	self._peer_join_request_remove = {}
	slot4 = PSN
	local world_list = PSN.get_world_list(slot3)

	local function session_created(roomid)
		slot4 = roomid

		managers.network.matchmake._created_lobby(slot2, managers.network.matchmake)

		return 
	end

	slot8 = session_created

	PSN.set_matchmaking_callback(inspect, PSN, "session_created")

	local numbers = (settings and settings.numbers) or {
		2,
		3,
		1,
		1,
		1,
		1,
		0,
		1
	}
	numbers[4] = 1
	slot7 = self
	numbers[5] = self._game_version(slot6)
	numbers[8] = 1
	local table_description = {
		numbers = numbers
	}
	self._attributes_numbers = numbers
	local dialog_data = {}
	slot10 = "dialog_creating_lobby_title"
	dialog_data.title = managers.localization.text(slot8, managers.localization)
	slot10 = "dialog_wait"
	dialog_data.text = managers.localization.text(slot8, managers.localization)
	dialog_data.id = "create_lobby"
	dialog_data.no_buttons = true
	slot10 = dialog_data

	managers.system_menu.show(slot8, managers.system_menu)

	self._creating_lobby = true
	slot14 = 0

	PSN.create_session(slot8, PSN, table_description, world_list[1].world_id, 0, self.OPEN_SLOTS)

	return 
end
NetworkMatchMakingPSN._create_lobby_failed = function (self)
	slot3 = self

	self._create_lobby_done(slot2)

	return 
end
NetworkMatchMakingPSN._create_lobby_done = function (self)
	self._creating_lobby = nil
	slot4 = "create_lobby"

	managers.system_menu.close(slot2, managers.system_menu)

	return 
end
NetworkMatchMakingPSN._created_lobby = function (self, room_id)
	slot4 = self

	self._create_lobby_done(slot3)

	slot4 = managers.menu

	managers.menu.created_lobby(slot3)

	slot5 = room_id

	print(slot3, "NetworkMatchMakingPSN:_created_lobby( room_id )")

	self._trytime = nil
	slot5 = true

	self._is_server(slot3, self)

	slot5 = false

	self._is_client(slot3, self)

	self._room_id = room_id
	slot5 = self._room_id

	managers.network.voice_chat.open_session(slot3, managers.network.voice_chat)

	local playerinfo = {}
	slot5 = managers.network.account
	playerinfo.name = managers.network.account.username(managers.network.voice_chat)
	slot5 = managers.network.account
	playerinfo.player_id = managers.network.account.player_id(managers.network.voice_chat)
	slot7 = managers.network.group
	playerinfo.group_id = tostring(managers.network.group.room_id(slot6))
	slot6 = "TCP_IP"
	playerinfo.rpc = Network.self(managers.network.voice_chat, Network)
	slot8 = true

	self._call_callback(managers.network.voice_chat, self, "found_game", self._room_id)

	slot7 = playerinfo

	self._call_callback(managers.network.voice_chat, self, "player_joined")

	slot5 = self

	self._start_time_out_check(managers.network.voice_chat)

	return 
end
NetworkMatchMakingPSN.searching_friends_only = function (self)
	return self._friends_only
end
NetworkMatchMakingPSN.difficulty_filter = function (self)
	return self._difficulty_filter
end
NetworkMatchMakingPSN.set_difficulty_filter = function (self, filter)
	self._difficulty_filter = filter

	return 
end
NetworkMatchMakingPSN.get_lobby_return_count = function (self)
	return 
end
NetworkMatchMakingPSN.set_lobby_return_count = function (self, lobby_return_count)
	return 
end
NetworkMatchMakingPSN.lobby_filters = function (self)
	return 
end
NetworkMatchMakingPSN.set_lobby_filters = function (self, filters)
	return 
end
NetworkMatchMakingPSN.add_lobby_filter = function (self, key, value, comparision_type)
	return 
end
NetworkMatchMakingPSN.start_search_lobbys = function (self, friends_only)
	if self._searching_lobbys then
		return 
	end

	self._searching_lobbys = true
	self._search_lobbys_index = 1
	self._lobbys_info_list = {}
	self._friends_only = friends_only

	if not self._friends_only then
		local function f(info)
			slot4 = info

			table.insert(slot2, self._lobbys_info_list)

			if 1 <= self._search_lobbys_index then
				slot3 = "--------------- search done"

				print(slot2)

				slot5 = self._lobbys_info_list

				self._call_callback(slot2, self, "search_lobby")
			else
				self._search_lobbys_index = self._search_lobbys_index + self.MAX_SEARCH_RESULTS
				slot3 = self

				self.search_lobby(self._search_lobbys_index + self.MAX_SEARCH_RESULTS)

				slot4 = self._search_lobbys_index

				print(self._search_lobbys_index + self.MAX_SEARCH_RESULTS, "search again")
			end

			return 
		end

		slot7 = f

		PSN.set_matchmaking_callback(slot4, PSN, "session_search")

		slot5 = self

		self.search_lobby(slot4)
	else
		print(slot3)

		local function f(results, ...)
			local room_ids = {}
			local info = {
				attribute_list = {},
				request_id = 0,
				room_list = {}
			}
			local reverse_lookup = {}
			slot6 = results.users

			for i_user, user_info in ipairs(slot5) do
				if user_info.joined_sessions then
					local room_id = user_info.joined_sessions[1]
					slot13 = room_id

					table.insert(slot11, room_ids)

					local friend_id = user_info.user_id
					slot13 = room_id
					reverse_lookup[tostring(room_ids)] = friend_id
				end
			end

			local function f2(results)
				if results.rooms then
					local info = {
						attribute_list = {},
						request_id = 0,
						room_list = {}
					}
					slot5 = info

					table.insert(slot3, self._lobbys_info_list)

					slot4 = results.rooms

					for _, room_info in ipairs(slot3) do
						local attributes = room_info.attributes
						local full = room_info.full
						local closed = room_info.closed
						local owner_id = room_info.owner
						local room_id = room_info.room_id
						slot15 = room_id
						local friend_id = reverse_lookup[tostring(slot14)]

						if not full and not closed then
							slot16 = self

							if attributes.numbers[5] == self._game_version(slot15) then
								slot16 = attributes

								table.insert(slot14, info.attribute_list)

								slot16 = {
									owner_id = owner_id,
									friend_id = friend_id,
									room_id = room_id
								}

								table.insert(slot14, info.room_list)
							end
						end
					end
				end

				slot5 = self._lobbys_info_list

				self._call_callback(slot2, self, "search_lobby")

				return 
			end

			if 0 < #room_ids then
				slot7 = self

				self._end_time_out_check(slot6)

				slot9 = f2

				PSN.set_matchmaking_callback(slot6, PSN, "fetch_session_attributes")

				local wanted_attributes = {
					numbers = {
						1,
						2,
						3,
						4,
						5,
						6,
						7,
						8
					}
				}
				slot10 = wanted_attributes

				PSN.get_session_attributes(PSN, PSN, room_ids)
			else
				slot9 = self._lobbys_info_list

				self._call_callback(slot6, self, "search_lobby")
			end

			return 
		end

		local friends = managers.network.friends.get_npid_friends_list("start_search_lobbys friends")
		slot8 = f

		PSN.set_matchmaking_callback(managers.network.friends, PSN, "fetch_user_info")
	end

	return 
end
NetworkMatchMakingPSN.search_lobby = function (self, settings)
	local numbers = (settings and settings.numbers) or {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8
	}
	local table_description = {
		numbers = numbers
	}
	local filter = {
		full = false
	}
	slot9 = managers.experience
	slot9 = self
	filter.numbers = {
		{
			3,
			"!=",
			3
		},
		{
			7,
			"<=",
			managers.experience.current_level(slot8)
		},
		{
			5,
			"==",
			self._game_version(slot8)
		}
	}

	if not NetworkManager.DROPIN_ENABLED then
		slot8 = {
			4,
			"==",
			1
		}

		table.insert(slot6, filter.numbers)
	end

	if self._difficulty_filter and self._difficulty_filter ~= 0 then
		slot8 = {
			2,
			"==",
			self._difficulty_filter
		}

		table.insert(slot6, filter.numbers)
	end

	slot12 = PSN
	slot13 = true

	PSN.search_session(slot6, PSN, table_description, filter, PSN.get_world_list(slot11)[1].world_id, self._search_lobbys_index, self.MAX_SEARCH_RESULTS)

	return 
end
NetworkMatchMakingPSN._search_lobby_failed = function (self)
	slot3 = self

	self.search_lobby_done(slot2)

	return 
end
NetworkMatchMakingPSN.search_lobby_done = function (self)
	self._searching_lobbys = nil
	slot4 = "find_server"

	managers.system_menu.close(slot2, managers.system_menu)

	return 
end
NetworkMatchMakingPSN.set_num_players = function (self, num)
	self._num_players = num

	if self._attributes_numbers then
		slot4 = self

		self._set_attributes(slot3)
	end

	return 
end
NetworkMatchMakingPSN._set_attributes = function (self, settings)
	if not self._room_id then
		return 
	end

	self._attributes_numbers = (settings and settings.numbers) or self._attributes_numbers
	local numbers = self._attributes_numbers
	numbers[8] = self._num_players or 1
	local attributes = {
		numbers = numbers
	}
	slot8 = attributes

	PSN.set_session_attributes(slot5, PSN, self._room_id)

	return 
end
NetworkMatchMakingPSN.set_server_attributes = function (self, settings)
	if not self._room_id then
		return 
	end

	self._attributes_numbers[1] = settings.numbers[1]
	self._attributes_numbers[2] = settings.numbers[2]
	self._attributes_numbers[3] = settings.numbers[3]
	self._attributes_numbers[6] = settings.numbers[6]
	self._attributes_numbers[7] = settings.numbers[7]
	slot5 = {
		numbers = self._attributes_numbers
	}

	self._set_attributes(settings.numbers[7], self)

	return 
end
NetworkMatchMakingPSN.set_server_state = function (self, state)
	if not self._room_id then
		return 
	end

	slot5 = state
	local state_id = tweak_data.server_state_to_index(slot3, tweak_data)
	self._attributes_numbers[4] = state_id
	slot6 = {
		numbers = self._attributes_numbers
	}

	self._set_attributes(tweak_data, self)

	return 
end
NetworkMatchMakingPSN.server_state_name = function (self)
	slot4 = self._attributes_numbers[4]

	return tweak_data.index_to_server_state(slot2, tweak_data)
end
NetworkMatchMakingPSN.test_search = function (self)
	local function f(info)
		slot5 = info

		print(inspect(slot4))

		slot5 = info.room_list[1]

		print(inspect(slot4))

		slot5 = info.room_list[1].owner_id

		print(inspect(slot4))

		slot5 = info.room_list[1].owner_id

		print(help(slot4))

		slot5 = info.room_list[1].room_id

		print(inspect(slot4))

		slot5 = info.room_list[1].room_id

		print(help(slot4))

		slot8 = info.room_list[1].room_id

		print(inspect(PSN.get_info_session(slot6, PSN)))

		return 
	end

	slot6 = f

	PSN.set_matchmaking_callback(slot3, PSN, "session_search")

	return 
end
NetworkMatchMakingPSN.test_search_session = function (self)
	local search_params = {
		numbers = {
			1,
			2,
			3,
			4
		}
	}
	slot9 = PSN
	slot7 = PSN.get_world_list(slot8)[1].world_id

	PSN.search_session(slot3, PSN, search_params, {})

	return 
end
NetworkMatchMakingPSN._custom_message_cb = function (self, message)
	slot4 = "_custom_message_cb"

	print(slot3)
	print(inspect(slot5))

	slot5 = message.sender

	print(slot3, "message.sender")

	slot4 = "message"
	slot7 = message

	print(slot3, inspect(message.custom_table))

	if message.custom_table and message.custom_table.join_invite then
		if self._room_id == message.room_id then
			return 
		end

		slot5 = self

		if message.custom_table.version ~= self._game_version(slot4) then
			return 
		end

		if (not self._game_owner_id or self._game_owner_id ~= message.sender) and not self._has_pending_invite then
			slot7 = managers.platform
			slot5 = managers.platform.presence(slot6) ~= "Idle"

			print(slot3, "managers.platform:presence() ~= Idle")

			slot4 = managers.platform

			if managers.platform.presence(slot3) ~= "Idle" then
				slot5 = message

				self._recived_join_invite(slot3, self)
			end
		end

		if self._join_enable then
		end
	end

	return 
end
NetworkMatchMakingPSN._invitation_received_cb = function (self, message, ...)
	slot4 = "_invitation_received_cb"

	print(slot3)
	print(inspect(slot5))

	slot5 = message.sender

	print(slot3, "message.sender")

	slot4 = "message"
	slot7 = message

	print(slot3, inspect(message.custom_table))

	slot4 = "..."

	print(slot3, inspect(...))

	return 
end
NetworkMatchMakingPSN._invitation_received_result_cb = function (self, message)
	slot4 = "_invitation_received_result_cb"

	print(slot3)
	print(inspect(slot5))

	slot5 = message.sender

	print(slot3, "message.sender")

	slot4 = "message"
	slot7 = message

	print(slot3, inspect(message.custom_table))

	if not Global.user_manager.user_index or not Global.user_manager.active_user_state_change_quit then
		slot4 = "BOOT UP INVITE"

		print(slot3)

		Global.boot_invite = message
		Global.boot_invite.used = false
		Global.boot_invite.pending = true

		return 
	end

	slot4 = managers.dlc

	if managers.dlc.is_installing(slot3) then
		slot4 = managers.menu

		managers.menu.show_game_is_installing(slot3)

		return 
	end

	slot4 = game_state_machine

	if game_state_machine.current_state_name(slot3) ~= "menu_main" then
		slot4 = "INGAME INVITE"

		print(slot3)

		if self._room_id == message.room_id then
			return 
		end

		Global.boot_invite = message
		Global.boot_invite.used = false
		Global.boot_invite.pending = true
		self._queue_end_game = 15

		return 
	end

	slot4 = setup

	if setup.has_queued_exec(slot3) then
		Global.boot_invite.used = false
		Global.boot_invite.pending = true

		return 
	end

	function slot5(success)

		-- Decompilation error in this vicinity:
		if not success then
			return 
		end

		slot6 = message.room_id

		print(slot2, "SELF ", self._room_id, " INVITE ")

		if self._room_id == message.room_id then
			return 
		end

		slot4 = self

		if message.version ~= self._game_version(slot3) then
			slot3 = managers.menu

			managers.menu.show_invite_wrong_version_message(slot2)

			return 
		end

		slot4 = message.room_id

		self._join_invite_accepted(slot2, self)

		return 
	end

	managers.menu.open_sign_in_menu(slot3, managers.menu)

	return 
end
NetworkMatchMakingPSN.join_boot_invite = function (self)

	-- Decompilation error in this vicinity:
	slot3 = "[NetworkMatchMakingPSN:join_boot_invite]"
	slot6 = Global.boot_invite

	print(slot2, inspect(slot5))

	if not Global.boot_invite.pending then
		return 
	end

	Global.boot_invite.used = true
	Global.boot_invite.pending = false
	slot3 = managers.dlc

	if managers.dlc.is_installing(false) then
		slot3 = managers.menu

		managers.menu.show_game_is_installing(slot2)

		return 
	end

	local message = Global.boot_invite

	if not message then
		slot4 = "[NetworkMatchMakingPSN:join_boot_invite] PSN:get_boot_invitation failed"

		print(slot3)

		return 
	end

	slot5 = message

	print(slot3, "[NetworkMatchMakingPSN:join_boot_invite] message: ")

	slot4 = message

	for i, k in pairs(slot3) do
		slot10 = k

		print(slot8, i)
	end

	slot7 = message.room_id

	print(slot3, "JSELF ", self._room_id, " INVITE ")

	if self._room_id == message.room_id then
		slot4 = "[NetworkMatchMakingPSN:join_boot_invite] we are already joined"

		print(slot3)

		return 
	end

	slot5 = self

	if message.version ~= self._game_version(slot4) then
		slot4 = "[NetworkMatchMakingPSN:join_boot_invite] WRONG VERSION, INFORM USER"

		print(slot3)

		slot4 = managers.menu

		managers.menu.show_invite_wrong_version_message(slot3)

		return 
	end

	Global.game_settings.single_player = false
	slot5 = false

	managers.network.ps3_determine_voice(false, managers.network)

	slot5 = message.room_id

	self._join_invite_accepted(false, self)

	return 
end
NetworkMatchMakingPSN.is_server_ok = function (self, friends_only, owner_id, attributes_numbers, skip_permission_check)

	-- Decompilation error in this vicinity:
	slot8 = managers.experience

	if managers.experience.current_level(slot7) < attributes_numbers[7] then
		slot8 = "[NetworkMatchMakingPSN:is_server_ok] Discard server due to reputation level limit"

		print(slot7)

		return false, 3
	end

	if friends_only then
	end

	if skip_permission_check or permission == "public" then
		return true
	end

	if permission == "friends_only" then
		slot9 = owner_id

		if not managers.network.friends.is_friend(slot7, managers.network.friends) then
			slot8 = "[NetworkMatchMakingPSN:is_server_ok] Discard server cause friends only perimssion"

			print(slot7)
		end

		slot9 = owner_id

		return managers.network.friends.is_friend(slot7, managers.network.friends), 2
	end

	slot8 = "[NetworkMatchMakingPSN:is_server_ok] Discard server"

	print(slot7)

	return false, 2
end
NetworkMatchMakingPSN.check_server_attributes_failed = function (self)
	slot3 = self

	self.check_server_attributes_done(slot2)

	return 
end
NetworkMatchMakingPSN.check_server_attributes_done = function (self)
	self._checking_server_attributes = nil
	self._check_room_id = nil

	return 
end
NetworkMatchMakingPSN.join_server_with_check = function (self, room_id, skip_permission_check)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)

	if managers.network.session(slot4).has_other_peers(slot4) then
		slot7 = "dialog_err_already_hoasting"

		managers.menu.show_ok_only_dialog(slot4, managers.menu, "dialog_error_title")

		return 
	end

	self._joining_lobby = true
	slot6 = "join_server"

	if not managers.system_menu.is_active_by_id(slot4, managers.system_menu) then
		slot5 = managers.menu

		managers.menu.show_joining_lobby_dialog(slot4)
	end

	self._check_room_id = room_id
	self._checking_server_attributes = true

	local function f(results)
		local room_id = self._check_room_id
		slot4 = self

		self.check_server_attributes_done(slot3)

		if not results.rooms then
			slot5 = room_id

			self.join_server(slot3, self)

			return 
		end

		local room_info = results.rooms[1]
		local attributes = room_info.attributes
		local owner_id = room_info.owner
		slot11 = skip_permission_check
		local server_ok, ok_error = self.is_server_ok(slot6, self, nil, owner_id, attributes.numbers)

		if server_ok then
			slot10 = room_id

			self.join_server(slot8, self)
		else
			slot9 = self

			self._joining_lobby_done(slot8)

			if ok_error == 1 then
				slot9 = managers.menu

				managers.menu.show_game_started_dialog(slot8)
			elseif ok_error == 2 then
				slot9 = managers.menu

				managers.menu.show_game_permission_changed_dialog(slot8)
			elseif ok_error == 3 then
				slot9 = managers.menu

				managers.menu.show_too_low_level(slot8)
			elseif ok_error == 4 then
				slot9 = managers.menu

				managers.menu.show_does_not_own_heist(slot8)
			end

			slot10 = self._friends_only

			managers.network.matchmake.start_search_lobbys(slot8, managers.network.matchmake)
		end

		return 
	end

	slot6 = self

	self._end_time_out_check(slot5)

	slot8 = f

	PSN.set_matchmaking_callback(slot5, PSN, "fetch_session_attributes")

	local wanted_attributes = {
		numbers = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8
		}
	}
	slot9 = wanted_attributes

	PSN.get_session_attributes(PSN, PSN, {
		room_id
	})

	return 
end
NetworkMatchMakingPSN.update_session_attributes = function (self, rooms, cb_func)
	if self._joining_lobby then
		slot5 = nil

		cb_func(slot4)

		return 
	end

	if #rooms <= 0 then
		slot5 = {}

		cb_func(slot4)

		return 
	end

	self._update_session_attributes_cb = cb_func
	slot5 = self

	self._end_time_out_check(slot4)

	slot6 = "fetch_session_attributes"
	slot11 = "_update_session_attributes_result"

	PSN.set_matchmaking_callback(slot4, PSN, callback(slot8, self, self))

	local wanted_attributes = {
		numbers = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8
		}
	}
	slot8 = wanted_attributes

	PSN.get_session_attributes(PSN, PSN, rooms)

	return 
end
NetworkMatchMakingPSN._update_session_attributes_result = function (self, results)
	local info_list = {}
	local info = {
		attribute_list = {},
		request_id = 0,
		room_list = {}
	}
	slot7 = info

	table.insert(slot5, info_list)

	if results.rooms then
		slot6 = results.rooms

		for _, room_info in ipairs(slot5) do
			local attributes = room_info.attributes
			local full = room_info.full
			local closed = room_info.closed
			local owner_id = room_info.owner
			local room_id = room_info.room_id

			if not full and not closed then
				slot17 = self

				if attributes.numbers[5] == self._game_version(slot16) then
					slot17 = attributes

					table.insert(slot15, info.attribute_list)

					slot17 = {
						owner_id = owner_id,
						room_id = room_id
					}

					table.insert(slot15, info.room_list)
				end
			end
		end
	end

	if self._room_id then
		slot6 = self

		self._start_time_out_check(slot5)
	end

	if self._update_session_attributes_cb then
		slot6 = info_list

		self._update_session_attributes_cb(slot5)
	end

	return 
end
NetworkMatchMakingPSN.join_server = function (self, room_id)
	local room = {
		room_id = room_id
	}
	slot6 = room

	self._join_server(slot4, self)

	return 
end
NetworkMatchMakingPSN._join_server = function (self, room)
	self._connection_info = {}
	self._joining_lobby = true
	self._server_rpc = nil
	self._players = {}
	slot5 = false

	self._is_server(slot3, self)

	slot5 = true

	self._is_client(slot3, self)

	self._room_id = room.room_id
	slot5 = "join_server"

	if not managers.system_menu.is_active_by_id(slot3, managers.system_menu) then
		slot4 = managers.menu

		managers.menu.show_joining_lobby_dialog(slot3)
	end

	self._join_cb_room = self._room_id
	slot5 = room.room_id

	PSN.join_session(slot3, PSN)

	slot4 = TimerManager
	slot4 = TimerManager.wall(slot3)
	self._trytime = TimerManager.wall(slot3).time(slot3) + self._JOIN_SERVER_TRY_TIME_INC
	slot4 = self

	self._start_time_out_check(self._JOIN_SERVER_TRY_TIME_INC)

	return 
end
NetworkMatchMakingPSN._joining_lobby_done_failed = function (self)
	slot3 = self

	self._joining_lobby_done(slot2)

	return 
end
NetworkMatchMakingPSN._joining_lobby_done = function (self)
	slot4 = "join_server"

	managers.system_menu.close(slot2, managers.system_menu)

	self._joining_lobby = nil

	return 
end
NetworkMatchMakingPSN.on_peer_added = function (self, peer)
	slot4 = "NetworkMatchMakingPSN:on_peer_added"

	print(slot3)

	return 
end
NetworkMatchMakingPSN.on_peer_removed = function (self, peer)
	slot5 = peer

	managers.network.voice_chat.close_channel_to(slot3, managers.network.voice_chat)

	return 
end
NetworkMatchMakingPSN.cb_connection_established = function (self, info)
	if self._is_server_var then
		return 
	end

	slot4 = "NetworkMatchMakingPSN:cb_connection_established"

	print(slot3)

	slot6 = info

	print(inspect(slot5))

	slot5 = info.user_id

	print(slot3, "connection established to")

	slot5 = info.user_id
	self._connection_info[tostring("connection established to")] = info

	if info.dead then
		slot4 = managers.network

		if managers.network.session(slot3) then
			slot4 = managers.network
			slot4 = managers.network.session(slot3)
			slot7 = info.user_id
			local peer = managers.network.session(slot3).peer_by_name(slot3, tostring(slot6))

			if peer then
				slot5 = managers.network
				slot6 = peer
				slot9 = peer

				managers.network.session(slot4).on_peer_lost(slot4, managers.network.session(slot4), peer.id(slot8))
			end
		end

		return 
	end

	self._invite_room_id = nil

	if info.room_id == self._room_id and info.user_id == info.owner_id then
		slot4 = self

		self._joining_lobby_done(slot3)

		self._room_id = info.room_id
		self._game_owner_id = info.owner_id

		if info.external_ip and info.port then
			slot7 = "TCP_IP"
			self._server_rpc = Network.handshake(slot3, Network, info.external_ip, info.port)

			if not self._server_rpc then
				slot4 = TimerManager
				slot4 = TimerManager.wall(slot3)
				self._trytime = TimerManager.wall(slot3).time(slot3)

				return 
			end
		else
			slot4 = TimerManager
			slot4 = TimerManager.wall(slot3)
			self._trytime = TimerManager.wall(slot3).time(slot3)

			return 
		end

		self._trytime = nil
		slot4 = managers.network

		managers.network.start_client(slot3)

		slot5 = self._room_id

		managers.network.voice_chat.open_session(slot3, managers.network.voice_chat)

		slot5 = {
			cancel_func = function ()
				slot2 = managers.network

				managers.network.queue_stop_network(slot1)

				slot3 = true

				World.set_extensions_update_enabled(slot1, World)

				return 
			end
		}

		managers.menu.show_waiting_for_server_response(slot3, managers.menu)

		local function f(res, level_index, difficulty_index, state_index)
			slot7 = "waiting_for_server_response"

			managers.system_menu.close(slot5, managers.system_menu)

			if res == "JOINED_LOBBY" then
				if managers.groupai then
					slot6 = managers.groupai

					managers.groupai.kill_all_AI(slot5)
				end

				slot6 = managers.menu

				managers.menu.on_enter_lobby(slot5)
			elseif res == "JOINED_GAME" then
				if managers.groupai then
					slot6 = managers.groupai

					managers.groupai.kill_all_AI(slot5)
				end

				slot7 = {
					room_id = self._room_id
				}

				managers.network.voice_chat.set_drop_in(slot5, managers.network.voice_chat)

				slot7 = level_index
				local level_id = tweak_data.levels.get_level_name_from_index(slot5, tweak_data.levels)
				Global.game_settings.level_id = level_id
			elseif res == "KICKED" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_peer_kicked_dialog(slot5)
			elseif res == "TIMED_OUT" or res == "FAILED_CONNECT" or res == "AUTH_FAILED" or res == "AUTH_HOST_FAILED" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_request_timed_out_dialog(slot5)
			elseif res == "GAME_STARTED" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_game_started_dialog(slot5)
			elseif res == "DO_NOT_OWN_HEIST" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_does_not_own_heist(slot5)
			elseif res == "CANCELLED" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)
			elseif res == "GAME_FULL" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_game_is_full(slot5)
			elseif res == "LOW_LEVEL" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_too_low_level(slot5)
			elseif res == "WRONG_VERSION" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_wrong_version_message(slot5)
			else
				slot7 = "[NetworkMatchMakingPSN:connect_to_host_rpc] FAILED TO START MULTIPLAYER!"

				Application.error(slot5, Application)
			end

			return 
		end

		slot7 = f

		managers.network.join_game_at_host_rpc(managers.menu, managers.network, self._server_rpc)
	elseif info then
		slot4 = managers.network

		if managers.network.session(slot3) then
			slot4 = managers.network
			slot7 = info.user_id

			managers.network.session(slot3).on_PSN_connection_established(slot3, managers.network.session(slot3), tostring(info.external_ip .. ":" .. info.port))
		end
	end

	if self._join_cb_room and info.room_id == self._join_cb_room then
		if self._cancelled == true then
			self._cancel_time = nil
			slot5 = "cancel_done"

			self._call_callback(slot3, self)
		end

		self._join_cb_room = nil
	end

	return 
end
NetworkMatchMakingPSN.get_connection_info = function (self, npid_name)
	return self._connection_info[npid_name]
end
NetworkMatchMakingPSN._in_list = function (self, id)
	slot4 = self._players

	for k, v in pairs(slot3) do
		slot10 = id

		if tostring(slot8) == tostring(v.pnid) then
			return true
		end
	end

	return false
end
NetworkMatchMakingPSN._translate_settings = function (self, settings, value)
	if value == "game_mode" then
		local game_mode_in_settings = settings.game_mode

		if game_mode_in_settings == "coop" then
			return 1
		end

		slot7 = "Not a supported game mode"

		Application.error(slot5, Application)
	end

	return 
end
NetworkMatchMakingPSN._error_cb = function (self, info)
	if info then
		slot4 = " _error_cb"

		print(slot3)

		slot6 = info

		print(inspect(slot5))

		slot5 = "join_server"

		managers.system_menu.close(slot3, managers.system_menu)

		slot5 = info

		self._error_message_solver(slot3, self)

		if info.error == "8002232c" then
		end

		if info.error ~= "8002233a" and info.error == "8002231d" then
		end

		if self._checking_server_attributes then
			slot4 = self

			self.check_server_attributes_failed(slot3)
		end

		if self._searching_lobbys then
			slot4 = self

			self._search_lobby_failed(slot3)
		end

		if self._creating_lobby then
			slot4 = self

			self._create_lobby_failed(slot3)
		end

		if self._joining_lobby then
			slot4 = self

			self._joining_lobby_done_failed(slot3)
		end

		if info.error == "ffffffff80550c36" and setup.IS_START_MENU and not self._room_id then
			slot4 = self

			self._on_disconnect_detected(slot3)
		end

		if self._getting_world_list then
			slot4 = self

			self._getting_world_list_failed(slot3)
		end

		if (info.error == "80022b19" or info.error == "80022b0f" or info.error == "80022b15" or info.error == "80022b13") and not self._invite_room_id then
			slot5 = self._friends_only

			managers.network.matchmake.start_search_lobbys(slot3, managers.network.matchmake)
		end

		self._invite_room_id = nil

		if info.error == "80022b19" or info.error == "80022b0f" or info.error == "80022328" or info.error == "8002232c" or info.error == "80022b13" or (info.error == "80022b15" and self._trytime) then
			self._trytime = 0
			self._room_id = nil
		end
	end

	return 
end
NetworkMatchMakingPSN._error_message_solver = function (self, info)

	-- Decompilation error in this vicinity:
	if info.error == "8002232c" then
		return 
	end

	if info.error == "8002233a" and self._testing_connection then
		self._testing_connection = nil

		return 
	end

	local error_texts = {
		80022b15 = "dialog_err_room_no_longer_exists",
		80022328 = "dialog_err_room_allready_joined",
		80022b0f = "dialog_err_room_is_closed",
		80022b19 = "dialog_err_room_is_full",
		80022b13 = "dialog_err_room_no_longer_exists",
		8002233a = (self._creating_lobby and "dialog_err_failed_creating_lobby") or (self._searching_lobbys and "dialog_err_failed_searching_lobbys") or (self._joining_lobby and "dialog_err_failed_joining_lobby") or nil,
		8002231d = (self._creating_lobby and "dialog_err_failed_creating_lobby") or (self._searching_lobbys and "dialog_err_failed_searching_lobbys") or (self._joining_lobby and "dialog_err_failed_joining_lobby") or nil
	}
	local text_id = error_texts[info.error]
	slot7 = "dialog_error_title"
	slot7 = Application
	local title = managers.localization.text(slot5, managers.localization) .. ((Application.production_build(managers.localization) and " [" .. info.error .. "]") or "")
	local dialog_data = {
		title = title
	}
end
NetworkMatchMakingPSN.send_join_invite = function (self, friend)
	if not self._room_id then
		return 
	end

	slot5 = "dialog_mp_invite_message"
	local body = managers.localization.text(slot3, managers.localization)
	slot5 = body
	local len = string.len(managers.localization)

	for i = 1, 512 - len, 1 do
		body = body .. " "
	end

	slot7 = {
		type = "INVITE",
		attachment = {
			version = self._game_version(slot10),
			room_id = self._room_id
		},
		body = body,
		subject = managers.localization.text(self._room_id, managers.localization),
		list_npid = {
			tostring(managers.localization)
		}
	}
	slot11 = self
	slot11 = "dialog_mp_invite_title"
	slot11 = friend

	PSN.send_message_gui(slot5, PSN)

	return 
end
NetworkMatchMakingPSN._recived_join_invite = function (self, message)
	self._has_pending_invite = true

	print(slot3)

	local dialog_data = {}
	slot6 = "dialog_mp_groupinvite_title"
	dialog_data.title = managers.localization.text("_recived_join_invite", managers.localization)
	slot7 = {
		GROUP = tostring(slot9)
	}
	slot10 = message.sender
	dialog_data.text = managers.localization.text("_recived_join_invite", managers.localization, "dialog_mp_groupinvite_message")
	local yes_button = {}
	slot7 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	slot9 = message.room_id
	yes_button.callback_func = callback(managers.localization, self, self, "_join_invite_accepted")
	local no_button = {}
	slot8 = "dialog_no"
	no_button.text = managers.localization.text(self, managers.localization)
	no_button.callback_func = function ()
		self._has_pending_invite = nil

		return 
	end
	no_button.class = RaidGUIControlButtonShortSecondary
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot8 = dialog_data

	managers.system_menu.show(self, managers.system_menu)

	return 
end
NetworkMatchMakingPSN._join_invite_accepted = function (self, room_id)
	slot5 = room_id

	print(slot3, "_join_invite_accepted")

	Global.game_settings.single_player = false
	self._has_pending_invite = nil
	self._invite_room_id = room_id

	if self._room_id then
		slot4 = "MUST LEAVE ROOM"

		print(slot3)

		slot4 = MenuCallbackHandler

		MenuCallbackHandler._dialog_leave_lobby_yes(slot3)

		return 
	end

	slot4 = managers.system_menu

	managers.system_menu.force_close_all(slot3)

	slot6 = true

	self.join_server_with_check(slot3, self, room_id)

	return 
end
NetworkMatchMakingPSN._set_room_hidden = function (self, set)
	if set == self._hidden or not self._room_id then
		return 
	end

	slot6 = not set

	PSN.set_session_visible(slot3, PSN, self._room_id)

	slot6 = not set

	PSN.set_session_open(slot3, PSN, self._room_id)

	self._hidden = set

	return 
end
NetworkMatchMakingPSN._server_timed_out = function (self, rpc)
	return 
end
NetworkMatchMakingPSN._client_timed_out = function (self, rpc)
	slot4 = self._players

	for k, v in pairs(slot3) do
		slot10 = 0
		slot11 = 0

		if v.rpc.ip_at_index(slot8, v.rpc) == rpc.ip_at_index(v.rpc, rpc) then
			return 
		end
	end

	return 
end
NetworkMatchMakingPSN.set_server_joinable = function (self, state)
	self._server_joinable = state
	slot5 = not state

	self._set_room_hidden(slot3, self)

	return 
end
NetworkMatchMakingPSN.is_server_joinable = function (self)
	return self._server_joinable
end

return 
