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
NetworkMatchMakingSTEAM = NetworkMatchMakingSTEAM or class()
NetworkMatchMakingSTEAM.OPEN_SLOTS = 4
NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "raid_ww2_retail_1_0_18"
NetworkMatchMakingSTEAM.EMPTY_PLAYER_INFO = "-,-,-,-"
NetworkMatchMakingSTEAM.init = function (self)
	slot4 = "matchmake = NetworkMatchMakingSTEAM"

	cat_print(slot2, "lobby")

	self._callback_map = {}
	self._lobby_filters = {}
	self._distance_filter = 2
	self._difficulty_filter = 0
	self._lobby_return_count = 25
	self._try_re_enter_lobby = nil
	self._server_joinable = false

	return 
end
NetworkMatchMakingSTEAM.register_callback = function (self, event, callback)
	self._callback_map[event] = callback

	return 
end
NetworkMatchMakingSTEAM._call_callback = function (self, name, ...)
	if self._callback_map[name] then
		return self._callback_map[name](...)
	else
		slot5 = "Callback " .. name .. " not found."

		Application.error(slot3, Application)
	end

	return 
end
NetworkMatchMakingSTEAM._has_callback = function (self, name)
	if self._callback_map[name] then
		return true
	end

	return false
end
NetworkMatchMakingSTEAM._split_attribute_number = function (self, attribute_number, splitter)
	slot6 = attribute_number / splitter

	return attribute_number % splitter, math.floor(slot5)
end
NetworkMatchMakingSTEAM.destroy_game = function (self)
	slot3 = self

	self.leave_game(slot2)

	return 
end
NetworkMatchMakingSTEAM._load_globals = function (self)

	-- Decompilation error in this vicinity:
	if Global.steam and Global.steam.match then
		self.lobby_handler = Global.steam.match.lobby_handler
		self._lobby_attributes = Global.steam.match.lobby_attributes

		if self.lobby_handler then
			slot6 = NetworkMatchMakingSTEAM._on_chat_message

			self.lobby_handler.setup_callbacks(slot2, self.lobby_handler, NetworkMatchMakingSTEAM._on_memberstatus_change, NetworkMatchMakingSTEAM._on_data_update)
		end

		self._try_re_enter_lobby = Global.steam.match.try_re_enter_lobby
		self._server_rpc = Global.steam.match.server_rpc
		self._lobby_filters = Global.steam.match.lobby_filters or self._lobby_filters
		self._distance_filter = Global.steam.match.distance_filter or self._distance_filter
		self._difficulty_filter = Global.steam.match.difficulty_filter or self._difficulty_filter
		self._lobby_return_count = Global.steam.match.lobby_return_count or self._lobby_return_count
		Global.steam.match = nil
	end

	return 
end
NetworkMatchMakingSTEAM._save_globals = function (self)
	if not Global.steam then
		Global.steam = {}
	end

	Global.steam.match = {
		lobby_handler = self.lobby_handler,
		lobby_attributes = self._lobby_attributes,
		try_re_enter_lobby = self._try_re_enter_lobby,
		server_rpc = self._server_rpc,
		lobby_filters = self._lobby_filters,
		distance_filter = self._distance_filter,
		difficulty_filter = self._difficulty_filter,
		lobby_return_count = self._lobby_return_count
	}

	return 
end
NetworkMatchMakingSTEAM.set_join_invite_pending = function (self, lobby_id)
	self._join_invite_pending = lobby_id

	return 
end
NetworkMatchMakingSTEAM.update = function (self)
	slot3 = Steam

	Steam.update(slot2)

	if self._try_re_enter_lobby then
		if self._try_re_enter_lobby == "lost" then
			slot4 = "REQUESTING RE-OPEN LOBBY"

			Application.error(slot2, Application)

			slot4 = true

			self._server_rpc.re_open_lobby_request(slot2, self._server_rpc)

			self._try_re_enter_lobby = "asked"
		elseif self._try_re_enter_lobby == "asked" then
		elseif self._try_re_enter_lobby == "open" then
			self._try_re_enter_lobby = "joining"
			slot4 = "RE-ENTERING LOBBY"
			slot7 = self.lobby_handler

			Application.error(slot2, Application, self.lobby_handler.id(slot6))

			local function _join_lobby_result_f(result, handler)
				if result == "success" then
					slot5 = "SUCCESS!"

					Application.error(slot3, Application)

					self.lobby_handler = handler
					slot5 = false

					self._server_rpc.re_open_lobby_request(slot3, self._server_rpc)

					self._try_re_enter_lobby = nil
				else
					slot5 = "FAIL!"

					Application.error(slot3, Application)

					self._try_re_enter_lobby = "open"
				end

				return 
			end

			slot7 = self.lobby_handler

			Steam.join_lobby(Application, Steam, self.lobby_handler.id(_join_lobby_result_f))
		end
	end

	if self._join_invite_pending then
		slot3 = managers.network

		if not managers.network.session(slot2) then
			slot5 = true

			managers.network.matchmake.join_server_with_check(slot2, managers.network.matchmake, self._join_invite_pending)

			self._join_invite_pending = nil
		end
	end

	return 
end
NetworkMatchMakingSTEAM.leave_game = function (self)
	self._server_rpc = nil

	if self.lobby_handler then
		slot3 = self.lobby_handler

		self.lobby_handler.leave_lobby(slot2)
	end

	self.lobby_handler = nil
	self._server_joinable = true

	if self._try_re_enter_lobby then
		self._try_re_enter_lobby = nil
	end

	slot3 = "NetworkMatchMakingSTEAM:leave_game()"

	print(slot2)

	return 
end
NetworkMatchMakingSTEAM.get_friends_lobbies = function (self)
	local lobbies = {}
	local num_updated_lobbies = 0

	local function empty()
		return 
	end

	local function f(updated_lobby)
		slot4 = empty

		updated_lobby.setup_callback(slot2, updated_lobby)

		slot3 = "NetworkMatchMakingSTEAM:get_friends_lobbies f"

		print(slot2)

		num_updated_lobbies = num_updated_lobbies + 1

		if #lobbies <= num_updated_lobbies then
			local info = {
				room_list = {},
				attribute_list = {}
			}
			slot4 = lobbies

			for _, lobby in ipairs(slot3) do
				if NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY then
					slot10 = NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY
					local ikey = lobby.key_value(slot8, lobby)

					if ikey ~= "value_missing" and ikey ~= "value_pending" then
						slot11 = {
							owner_id = lobby.key_value(slot13, lobby),
							owner_name = lobby.key_value(slot13, lobby),
							room_id = lobby.id(slot13)
						}
						slot15 = "owner_id"
						slot15 = "owner_name"
						slot14 = lobby

						table.insert(slot9, info.room_list)

						slot11 = {
							numbers = self._lobby_to_numbers(slot13, self)
						}
						slot15 = lobby

						table.insert(slot9, info.attribute_list)
					end
				end
			end

			slot6 = info

			self._call_callback(slot3, self, "search_lobby")
		end

		return 
	end

	slot7 = Steam

	if Steam.logged_on(slot6) then
		slot7 = Steam

		if Steam.friends(slot6) then
			slot9 = Steam

			for _, friend in ipairs(Steam.friends(slot8)) do
				slot12 = friend
				local lobby = friend.lobby(slot11)

				if lobby then
					slot13 = Steam
					local user_id_to_filter_out = Steam.userid(slot12)

					if managers.criminals then
						slot14 = managers.criminals

						if 1 < managers.criminals.get_num_player_criminals(slot13) and managers.network then
							slot14 = managers.network

							if managers.network.session(slot13) then
								slot14 = managers.network
								slot14 = managers.network.session(slot13)

								if managers.network.session(slot13).all_peers(slot13) then
									slot14 = managers.network
									slot14 = managers.network.session(slot13)
									slot14 = managers.network.session(slot13).all_peers(slot13)[1]
									user_id_to_filter_out = managers.network.session(slot13).all_peers(slot13)[1].user_id(slot13)
								end
							end
						end
					end

					local add_lobby = true
					local filter_in_camp = tostring(slot14)
					local filter_difficulty = tostring(self._lobby_filters.state.value)
					slot17 = self._lobby_filters.job_id.value
					local filter_job = tostring(self._difficulty_filter)

					if filter_in_camp == "1" then
						slot19 = "state"
					elseif filter_difficulty ~= "0" then
						slot19 = "difficulty"
					elseif filter_job ~= "-1" then
						slot19 = "job_id"

						if filter_job ~= lobby.key_value(slot17, lobby) then
							add_lobby = false
						end
					end

					slot19 = "owner_id"

					if user_id_to_filter_out ~= lobby.key_value(slot17, lobby) and add_lobby then
						slot19 = lobby

						table.insert(slot17, lobbies)
					end
				end
			end
		end
	end

	if #lobbies == 0 then
		local info = {
			room_list = {},
			attribute_list = {}
		}
		slot10 = info

		self._call_callback(slot7, self, "search_lobby")
	else
		slot7 = lobbies

		for _, lobby in ipairs(slot6) do
			slot13 = f

			lobby.setup_callback(slot11, lobby)

			slot13 = "state"

			if lobby.key_value(slot11, lobby) == "value_pending" then
				slot12 = "NetworkMatchMakingSTEAM:get_friends_lobbies value_pending"

				print(slot11)

				slot12 = lobby

				lobby.request_data(slot11)
			else
				slot12 = lobby

				f(slot11)
			end
		end
	end

	return 
end
NetworkMatchMakingSTEAM.search_friends_only = function (self)
	return self._search_friends_only
end
NetworkMatchMakingSTEAM.set_search_friends_only = function (self, flag)
	self._search_friends_only = flag

	return 
end
NetworkMatchMakingSTEAM.distance_filter = function (self)
	return self._distance_filter
end
NetworkMatchMakingSTEAM.set_distance_filter = function (self, filter)
	self._distance_filter = filter

	return 
end
NetworkMatchMakingSTEAM.get_lobby_return_count = function (self)
	return self._lobby_return_count
end
NetworkMatchMakingSTEAM.set_lobby_return_count = function (self, lobby_return_count)
	self._lobby_return_count = lobby_return_count

	return 
end
NetworkMatchMakingSTEAM.lobby_filters = function (self)
	return self._lobby_filters
end
NetworkMatchMakingSTEAM.set_lobby_filters = function (self, filters)
	self._lobby_filters = filters or {}

	return 
end
NetworkMatchMakingSTEAM.add_lobby_filter = function (self, key, value, comparision_type)
	self._lobby_filters[key] = {
		key = key,
		value = value,
		comparision_type = comparision_type
	}

	return 
end
NetworkMatchMakingSTEAM.get_lobby_filter = function (self, key)
	return (self._lobby_filters[key] and self._lobby_filters[key].value) or false
end
NetworkMatchMakingSTEAM.difficulty_filter = function (self)
	return self._difficulty_filter
end
NetworkMatchMakingSTEAM.set_difficulty_filter = function (self, filter)
	self._difficulty_filter = filter

	return 
end
NetworkMatchMakingSTEAM.search_lobby = function (self, friends_only)
	self._search_friends_only = friends_only
	slot5 = "search_lobby"

	if not self._has_callback(slot3, self) then
		return 
	end

	if friends_only then
		slot4 = self

		self.get_friends_lobbies(slot3)
	else
		local function refresh_lobby()
			if not self.browser then
				return 
			end

			slot2 = self.browser
			local lobbies = self.browser.lobbies(slot1)
			local info = {
				room_list = {},
				attribute_list = {}
			}

			if lobbies then
				slot4 = lobbies

				for _, lobby in ipairs(slot3) do
				end
			end

			slot6 = info

			self._call_callback(slot3, self, "search_lobby")

			return 
		end

		function slot6()
			return 
		end

		self.browser = LobbyBrowser(slot4, refresh_lobby)
		local interest_keys = {
			"owner_id",
			"owner_name",
			"level",
			"difficulty",
			"permission",
			"state",
			"num_players",
			"drop_in",
			"min_level",
			"kick_option",
			"job_class_min",
			"job_class_max"
		}

		if self._BUILD_SEARCH_INTEREST_KEY then
			slot7 = self._BUILD_SEARCH_INTEREST_KEY

			table.insert(slot5, interest_keys)
		end

		slot7 = interest_keys

		self.browser.set_interest_keys(slot5, self.browser)

		slot7 = self._distance_filter

		self.browser.set_distance_filter(slot5, self.browser)

		slot9 = "equal"

		self.browser.set_lobby_filter(slot5, self.browser, self._BUILD_SEARCH_INTEREST_KEY, "true")

		slot6 = Steam
		local user_id_to_filter_out = Steam.userid(slot5)

		if managers.criminals then
			slot7 = managers.criminals

			if 1 < managers.criminals.get_num_player_criminals(slot6) and managers.network then
				slot7 = managers.network

				if managers.network.session(slot6) then
					slot7 = managers.network
					slot7 = managers.network.session(slot6)

					if managers.network.session(slot6).all_peers(slot6) then
						slot7 = managers.network
						slot7 = managers.network.session(slot6)
						slot7 = managers.network.session(slot6).all_peers(slot6)[1]
						user_id_to_filter_out = managers.network.session(slot6).all_peers(slot6)[1].user_id(slot6)
					end
				end
			end
		end

		slot10 = "not_equal"

		self.browser.set_lobby_filter(slot6, self.browser, "owner_id", user_id_to_filter_out)

		slot7 = self._lobby_filters

		for key, data in pairs(slot6) do

			-- Decompilation error in this vicinity:
			if data.value and data.value ~= -1 then
				slot15 = data.comparision_type

				self.browser.set_lobby_filter(slot11, self.browser, data.key, data.value)
			end
		end

		slot8 = self._lobby_return_count

		self.browser.set_max_lobby_return_count(slot6, self.browser)

		if Global.game_settings.playing_lan then
			slot7 = self.browser

			self.browser.refresh_lan(slot6)
		else
			slot7 = self.browser

			self.browser.refresh(slot6)
		end
	end

	return 
end
NetworkMatchMakingSTEAM.search_lobby_done = function (self)
	slot4 = "find_server"

	managers.system_menu.close(slot2, managers.system_menu)

	self.browser = nil

	return 
end
NetworkMatchMakingSTEAM.game_owner_name = function (self)
	slot4 = "owner_name"

	return managers.network.matchmake.lobby_handler.get_lobby_data(slot2, managers.network.matchmake.lobby_handler)
end
NetworkMatchMakingSTEAM.is_server_ok = function (self, friends_only, room, attributes_numbers, is_invite)
	slot8 = attributes_numbers[3]
	local permission = tweak_data.index_to_permission(slot6, tweak_data)

	if (not NetworkManager.DROPIN_ENABLED or attributes_numbers[6] == 0) and attributes_numbers[4] ~= 1 then
		slot9 = "NetworkMatchMakingSTEAM:is_server_ok() server rejected. DROPING NOT ENABLED"

		Application.debug(slot7, Application)

		return false, 1
	end

	slot8 = managers.experience

	if managers.experience.current_level(slot7) < attributes_numbers[7] then
		slot9 = "NetworkMatchMakingSTEAM:is_server_ok() server rejected. REPUTATION CAP"

		Application.debug(slot7, Application)

		return false, 3
	end

	if not is_invite and permission == "private" then
		slot9 = "NetworkMatchMakingSTEAM:is_server_ok() server rejected. PRIVATE GAME"

		Application.debug(slot7, Application)

		return false, 2
	end

	if permission == "public" then
		return true
	end

	return true
end
NetworkMatchMakingSTEAM.join_server_with_check = function (self, room_id, is_invite)
	slot5 = managers.network

	if managers.network.session(slot4) then
		slot5 = managers.network
		slot5 = managers.network.session(slot4)

		if managers.network.session(slot4).has_other_peers(slot4) then
			slot5 = managers.raid_menu

			managers.raid_menu.show_dialog_already_in_game(slot4)

			return 
		end
	end

	if managers.raid_job then
		slot5 = managers.raid_job

		if managers.raid_job.is_in_tutorial(slot4) then
			slot7 = "dialog_err_cant_join_from_game"

			managers.menu.show_ok_only_dialog(slot4, managers.menu, "dialog_warning_title")

			return 
		end
	end

	if managers.raid_job then
		slot5 = managers.raid_job

		if not managers.raid_job.played_tutorial(slot4) then
			slot7 = "dialog_err_tutorial_not_finished"

			managers.menu.show_ok_only_dialog(slot4, managers.menu, "dialog_warning_title")

			return 
		end
	end

	if managers.player then
		slot5 = managers.player
		slot3 = managers.player.local_player_in_camp(slot4)
	end

	self._join_called_from_camp = slot3
	slot5 = managers.menu

	managers.menu.show_joining_lobby_dialog(slot4)

	slot6 = room_id
	local lobby = Steam.lobby(slot4, Steam)

	local function empty()
		return 
	end

	local function f()
		slot2 = "NetworkMatchMakingSTEAM:join_server_with_check f"

		print(slot1)

		slot3 = empty

		lobby.setup_callback(slot1, lobby)

		slot3 = lobby
		local attributes = self._lobby_to_numbers(slot1, self)

		if NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY then
			slot4 = NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY
			local ikey = lobby.key_value(slot2, lobby)

			if ikey == "value_missing" or ikey == "value_pending" then
				slot4 = "Wrong version!!"

				print(slot3)

				slot5 = "join_server"

				managers.system_menu.close(slot3, managers.system_menu)

				slot4 = managers.menu

				managers.menu.show_failed_joining_dialog(slot3)

				return 
			end
		end

		slot5 = attributes

		print(inspect(slot4))

		slot7 = is_invite
		local server_ok, ok_error = self.is_server_ok(slot2, self, nil, room_id, attributes)

		if server_ok then
			slot7 = true

			self.join_server(slot4, self, room_id)
		else
			slot6 = "join_server"

			managers.system_menu.close(slot4, managers.system_menu)

			managers.worldcollection.level_transition_in_progress = false

			if ok_error == 1 then
				slot5 = managers.menu

				managers.menu.show_game_started_dialog(slot4)
			elseif ok_error == 2 then
				slot5 = managers.menu

				managers.menu.show_game_permission_changed_dialog(slot4)
			elseif ok_error == 3 then
				slot5 = managers.menu

				managers.menu.show_too_low_level(slot4)
			elseif ok_error == 4 then
				slot5 = managers.menu

				managers.menu.show_does_not_own_heist(slot4)
			end

			slot5 = self
			slot8 = self

			self.search_lobby(slot4, self.search_friends_only(slot7))
		end

		return 
	end

	slot9 = f

	lobby.setup_callback(slot7, lobby)

	slot9 = "state"

	if lobby.key_value(slot7, lobby) == "value_pending" then
		slot8 = "NetworkMatchMakingSTEAM:join_server_with_check value_pending"

		print(slot7)

		slot8 = lobby

		lobby.request_data(slot7)
	else
		f()
	end

	return 
end
NetworkMatchMakingSTEAM._on_member_left = function (steam_id, status)
	slot4 = managers.network

	if not managers.network.session(slot3) then
		return 
	end

	slot4 = managers.network
	slot5 = steam_id
	local peer = managers.network.session(slot3).peer_by_user_id(slot3, managers.network.session(slot3))

	if not peer then
		return 
	end

	slot5 = managers.network
	slot5 = managers.network.session(slot4)

	if peer == managers.network.session(slot4).local_peer(slot4) then
		slot5 = managers.network
		slot5 = managers.network.session(slot4)
	else
		slot5 = managers.network
		slot6 = peer
		slot9 = peer

		managers.network.session(slot4).on_peer_left(slot4, managers.network.session(slot4), peer.id(slot8))

		slot5 = managers.network
		slot6 = peer

		managers.network.session(slot4).on_peer_left_lobby(slot4, managers.network.session(slot4))
	end

	return 
end
NetworkMatchMakingSTEAM._on_memberstatus_change = function (memberstatus)
	print(slot2, "[NetworkMatchMakingSTEAM._on_memberstatus_change]")

	slot6 = ":"
	local user, status = unpack(string.split(memberstatus, memberstatus))

	if status == "lost_steam_connection" or status == "left_become_owner" or status == "left" or status == "kicked" or status == "banned" or status == "invalid" then
		slot6 = status

		NetworkMatchMakingSTEAM._on_member_left(slot4, user)
	end

	return 
end
NetworkMatchMakingSTEAM._on_data_update = function (...)
	return 
end
NetworkMatchMakingSTEAM._on_chat_message = function (user, message)
	slot6 = message

	print(slot3, "[NetworkMatchMakingSTEAM._on_chat_message]", user)

	slot5 = message

	NetworkMatchMakingSTEAM._handle_chat_message(slot3, user)

	return 
end
NetworkMatchMakingSTEAM._handle_chat_message = function (user, message)
	local s = "" .. message
	slot9 = user

	managers.chat.receive_message_by_name(slot4, managers.chat, ChatManager.GLOBAL, user.name(s))

	return 
end
NetworkMatchMakingSTEAM._joined_game = function (res, level_index, difficulty_index, state_index)
	local matchmake = managers.network.matchmake

	if res ~= "FAILED_CONNECT" or (matchmake._server_connect_retried and NetworkMatchMaking.RETRY_CONNECT_COUNT <= matchmake._server_connect_retried) then
		slot8 = "waiting_for_server_response"

		managers.system_menu.close(slot6, managers.system_menu)
	end

	slot11 = state_index

	print(slot6, "[NetworkMatchMakingSTEAM:join_server:joined_game]", res, level_index, difficulty_index)

	if res == "JOINED_LOBBY" then
		if managers.groupai then
			slot7 = managers.groupai

			managers.groupai.kill_all_AI(slot6)
		end

		slot7 = managers.menu

		managers.menu.on_enter_lobby(slot6)
	elseif res == "JOINED_GAME" then
		if managers.groupai then
			slot7 = managers.groupai

			managers.groupai.kill_all_AI(slot6)
		end

		slot8 = level_index
		local level_id = tweak_data.levels.get_level_name_from_index(slot6, tweak_data.levels)
		Global.game_settings.level_id = level_id
		slot8 = managers.network
		slot8 = managers.network.session(tweak_data.levels)
		slot9 = false

		managers.network.session(tweak_data.levels).local_peer(tweak_data.levels).set_in_lobby(tweak_data.levels, managers.network.session(tweak_data.levels).local_peer(tweak_data.levels))
	elseif res == "KICKED" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		slot7 = managers.menu

		managers.menu.show_peer_already_kicked_from_game_dialog(slot6)
	elseif res == "TIMED_OUT" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		slot7 = managers.menu

		managers.menu.show_request_timed_out_dialog(slot6)
	elseif res == "GAME_STARTED" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		slot7 = managers.menu

		managers.menu.show_failed_joining_dialog(slot6)
	elseif res == "DO_NOT_OWN_HEIST" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		slot7 = managers.menu

		managers.menu.show_does_not_own_heist(slot6)
	elseif res == "CANCELLED" then
		slot7 = matchmake

		matchmake._restart_network(slot6)
	elseif res == "FAILED_CONNECT" then
		if not matchmake._server_connect_retried or matchmake._server_connect_retried < NetworkMatchMaking.RETRY_CONNECT_COUNT then
			if not matchmake._server_connect_retried then
				matchmake._server_connect_retried = 1
			else
				matchmake._server_connect_retried = matchmake._server_connect_retried + 1
			end

			slot9 = matchmake._server_connect_retried

			Application.debug(slot6, Application, "[NetworkMatchMakingSTEAM:join_server] Retry to connect!")

			slot12 = 1.5

			managers.queued_tasks.queue(slot6, managers.queued_tasks, "NetworkRetryJoinAttempt", matchmake._retry_join, matchmake, nil)
		else
			slot8 = "[NetworkMatchMakingSTEAM:join_server] Fail to connect!"

			Application.debug(slot6, Application)

			slot7 = matchmake

			matchmake._restart_network(slot6)

			slot7 = managers.menu

			managers.menu.show_failed_joining_dialog(slot6)
		end
	elseif res == "GAME_FULL" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		slot7 = managers.menu

		managers.menu.show_game_is_full(slot6)
	elseif res == "LOW_LEVEL" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		slot7 = managers.menu

		managers.menu.show_too_low_level(slot6)
	elseif res == "WRONG_VERSION" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		slot7 = managers.menu

		managers.menu.show_wrong_version_message(slot6)
	elseif res == "AUTH_FAILED" or res == "AUTH_HOST_FAILED" then
		slot7 = matchmake

		matchmake._restart_network(slot6)

		Global.on_remove_peer_message = (res == "AUTH_HOST_FAILED" and "dialog_authentication_host_fail") or "dialog_authentication_fail"
		slot7 = managers.menu

		managers.menu.show_peer_kicked_dialog((res == "AUTH_HOST_FAILED" and "dialog_authentication_host_fail") or "dialog_authentication_fail")
	else
		slot9 = res

		Application.error(slot6, Application, "[NetworkMatchMakingSTEAM:join_server] FAILED TO START MULTIPLAYER!")
	end

	slot8 = true

	World.set_extensions_update_enabled(slot6, World)

	return 
end
NetworkMatchMakingSTEAM.join_server = function (self, room_id, skip_showing_dialog)
	if not skip_showing_dialog then
		slot5 = managers.menu

		managers.menu.show_joining_lobby_dialog(slot4)
	end

	setup.exit_to_main_menu = true

	if managers.player then
		slot5 = managers.player
		slot3 = managers.player.local_player_in_camp(slot4)
	end

	self._join_called_from_camp = slot3

	local function f(result, handler)
		slot6 = handler

		print(slot3, "[NetworkMatchMakingSTEAM:join_server:f]", result)

		slot5 = "join_server"

		managers.system_menu.close(slot3, managers.system_menu)

		managers.worldcollection.level_transition_in_progress = false

		if result == "success" then
			slot4 = "Success!"

			print(slot3)

			self.lobby_handler = handler
			slot4 = self.lobby_handler
			local _, host_id, owner = self.lobby_handler.get_server_details(slot3)
			slot9 = host_id

			print(slot6, "[NetworkMatchMakingSTEAM:join_server] server details", _)
			print(slot6)

			slot11 = host_id
			slot11 = "STEAM"
			self._server_rpc = Network.handshake("Gonna handshake now!", Network, host_id.tostring(slot10), nil)
			slot7 = "Handshook!"

			print(Network.handshake("Gonna handshake now!", Network, host_id.tostring(slot10), nil))

			slot5 = print
			slot7 = "Server RPC:"

			if self._server_rpc then
				slot11 = 0
				slot8 = self._server_rpc.ip_at_index(slot9, self._server_rpc)
			end

			slot5(slot6, slot7)

			if not self._server_rpc then
				return 
			end

			slot10 = NetworkMatchMakingSTEAM._on_chat_message

			self.lobby_handler.setup_callbacks(slot6, self.lobby_handler, NetworkMatchMakingSTEAM._on_memberstatus_change, NetworkMatchMakingSTEAM._on_data_update)

			slot8 = "Signed_in"

			managers.platform.set_presence(slot6, managers.platform)

			slot7 = managers.network

			managers.network.start_client(slot6)

			slot5 = managers.network

			if managers.player then
				slot8 = managers.player
				slot6 = managers.player.local_player_in_camp(slot7)
			end

			slot5._restart_in_camp = slot6
			slot8 = {
				cancel_func = function ()
					slot3 = "[ NetworkMatchMakingSTEAM:join_server:f] Pressed cancel"

					Application.debug(slot1, Application)

					slot2 = managers.network
					slot2 = managers.network.session(slot1)

					managers.network.session(slot1).on_join_request_cancelled(slot1)

					slot2 = managers.network

					managers.network.queue_stop_network(slot1)

					slot3 = true

					World.set_extensions_update_enabled(slot1, World)

					return 
				end
			}

			managers.menu.show_waiting_for_server_response(slot6, managers.menu)

			slot9 = self._joined_game

			managers.network.join_game_at_host_rpc(slot6, managers.network, self._server_rpc)
		else
			slot5 = true

			World.set_extensions_update_enabled(slot3, World)

			slot4 = managers.menu

			managers.menu.show_failed_joining_dialog(slot3)

			slot4 = self
			slot7 = self

			self.search_lobby(slot3, self.search_friends_only(slot6))
		end

		return 
	end

	slot7 = false

	World.set_extensions_update_enabled(slot5, World)

	slot8 = f

	Steam.join_lobby(slot5, Steam, room_id)

	return 
end
NetworkMatchMakingSTEAM._retry_join = function (self)
	slot4 = "[NetworkMatchMakingSTEAM:_retry_join]"

	Application.debug(slot2, Application)

	if self._server_rpc then
		slot5 = self._joined_game

		managers.network.join_game_at_host_rpc(slot2, managers.network, self._server_rpc)
	end

	return 
end
NetworkMatchMakingSTEAM._restart_network = function (self)
	if self._join_called_from_camp then
		slot3 = managers.menu

		managers.menu.hide_loading_screen(slot2)

		Global.dropin_loading_screen = nil
		slot3 = managers.network.matchmake

		managers.network.matchmake.leave_game(nil)

		slot3 = managers.network.voice_chat

		managers.network.voice_chat.destroy_voice(nil)

		slot3 = managers.network

		managers.network.queue_stop_network(nil)

		slot3 = managers.game_play_central

		managers.game_play_central.restart_the_game(nil)
	else
		slot3 = managers.network

		managers.network.prepare_stop_network(slot2)
	end

	return 
end
NetworkMatchMakingSTEAM.send_join_invite = function (self, friend)
	return 
end
NetworkMatchMakingSTEAM.set_server_attributes = function (self, settings)
	slot5 = settings

	self.set_attributes(slot3, self)

	return 
end
NetworkMatchMakingSTEAM.create_lobby = function (self, settings, return_to_camp_client)
	if Global.game_settings.single_player then
		return 
	end

	self._num_players = nil
	local dialog_data = {}
	slot7 = "dialog_creating_lobby_title"
	dialog_data.title = managers.localization.text(slot5, managers.localization)
	slot7 = "dialog_wait"
	dialog_data.text = managers.localization.text(slot5, managers.localization)
	dialog_data.id = "create_lobby"
	dialog_data.no_buttons = true
	slot7 = dialog_data

	managers.system_menu.show(slot5, managers.system_menu)

	local function f(result, handler)
		slot7 = handler

		print(slot3, "Create lobby callback!!", result, return_to_camp_client)

		if result == "success" then
			self.lobby_handler = handler
			slot5 = settings

			self.set_attributes(slot3, self)

			slot4 = self.lobby_handler

			self.lobby_handler.publish_server_details(slot3)

			self._server_joinable = true
			slot5 = true

			self.lobby_handler.set_joinable(true, self.lobby_handler)

			slot7 = NetworkMatchMakingSTEAM._on_chat_message

			self.lobby_handler.setup_callbacks(true, self.lobby_handler, NetworkMatchMakingSTEAM._on_memberstatus_change, NetworkMatchMakingSTEAM._on_data_update)

			slot5 = "create_lobby"

			managers.system_menu.close(true, managers.system_menu)

			if not return_to_camp_client then
				slot4 = managers.menu

				managers.menu.created_lobby(slot3)

				if self._restart_in_camp then
					self._restart_in_camp = nil
					slot5 = "Playing"

					managers.platform.set_presence(nil, managers.platform)

					slot4 = managers.network
					slot4 = managers.network.session(nil)
					slot5 = true

					managers.network.session(nil).local_peer(nil).set_synched(nil, managers.network.session(nil).local_peer(nil))

					slot4 = managers.network
					slot4 = managers.network.session(nil)
					slot5 = true

					managers.network.session(nil).local_peer(nil).set_loaded(nil, managers.network.session(nil).local_peer(nil))

					slot4 = managers.network
					slot4 = managers.network.session(nil)

					managers.network.session(nil).spawn_players(nil)

					slot5 = GlobalStateManager.EVENT_RESTART_CAMP

					managers.global_state.fire_event(nil, managers.global_state)
				end
			end
		else
			slot5 = "create_lobby"

			managers.system_menu.close(slot3, managers.system_menu)

			slot4 = managers.menu

			managers.menu.hide_loading_screen(slot3)

			local title = managers.localization.text(slot3, managers.localization)
			local dialog_data = {
				title = title,
				text = managers.localization.text("dialog_error_title", managers.localization)
			}
			slot9 = "dialog_ok"
			slot10 = "quit_to_main_menu"
			dialog_data.button_list = {
				{
					text = managers.localization.text("dialog_err_failed_creating_lobby", managers.localization),
					callback_func = callback("dialog_err_failed_creating_lobby", setup, setup)
				}
			}
			slot7 = dialog_data

			managers.system_menu.show(, managers.system_menu)
		end

		return 
	end

	slot10 = "invisible"

	return Steam.create_lobby(managers.system_menu, Steam, f, NetworkMatchMakingSTEAM.OPEN_SLOTS)
end
NetworkMatchMakingSTEAM.set_num_players = function (self, num)
	slot5 = num

	print(slot3, "NetworkMatchMakingSTEAM:set_num_players")

	self._num_players = num

	if self._lobby_attributes then
		self._lobby_attributes.num_players = num
		slot5 = self._lobby_attributes

		self.lobby_handler.set_lobby_data(slot3, self.lobby_handler)
	end

	return 
end
NetworkMatchMakingSTEAM.set_job_info_by_current_job = function (self)
	slot3 = managers.network.matchmake
	local level_id, job_id, progress, mission_type, server_state_id = managers.network.matchmake.get_job_info_by_current_job(slot2)

	if self._lobby_attributes and self.lobby_handler then
		self._lobby_attributes.level = level_id
		self._lobby_attributes.job_id = job_id
		self._lobby_attributes.progress = progress
		self._lobby_attributes.mission_type = mission_type
		self._lobby_attributes.state = server_state_id
		slot9 = self._lobby_attributes

		self.lobby_handler.set_lobby_data(slot7, self.lobby_handler)
	end

	return 
end
NetworkMatchMakingSTEAM.set_challenge_card_info = function (self)
	slot3 = managers.challenge_cards
	local active_card = managers.challenge_cards.get_active_card(slot2)

	if self._lobby_attributes then
		if active_card then
			self._lobby_attributes.challenge_card_id = active_card.key_name
		else
			self._lobby_attributes.challenge_card_id = "nocards"
		end

		slot5 = self._lobby_attributes

		self.lobby_handler.set_lobby_data(slot3, self.lobby_handler)
	end

	return 
end
NetworkMatchMakingSTEAM.get_job_info_by_current_job = function (self)

	-- Decompilation error in this vicinity:
	local level_id = OperationsTweakData.IN_LOBBY
	local job_id = OperationsTweakData.IN_LOBBY
	local progress = "-"
	local server_state_id = 1
	slot7 = managers.raid_job

	return level_id, job_id, progress, mission_type, server_state_id
end
NetworkMatchMakingSTEAM.get_all_players_info = function (self)

	-- Decompilation error in this vicinity:
	slot3 = managers.experience
	local host_level = managers.experience.current_level(slot2) or "-"
	slot4 = managers.skilltree
	local host_class = managers.skilltree.get_character_profile_class(slot3) or "-"
	slot7 = managers.network.account
	slot7 = ""
	local host_name = string.gsub(slot4, managers.network.account.username(slot6) or "", ",")
	slot6 = managers.network
	players_data[1] = host_level .. "," .. host_class .. "," .. host_name .. "," .. host_nationality

	return players_data
end
NetworkMatchMakingSTEAM.remove_player_info = function (self, peer_id)
	if self._lobby_attributes then
		self._lobby_attributes["players_info_" .. peer_id] = NetworkMatchMakingSTEAM.EMPTY_PLAYER_INFO
		slot5 = self._lobby_attributes

		self.lobby_handler.set_lobby_data("players_info_" .. peer_id, self.lobby_handler)
	end

	return 
end
NetworkMatchMakingSTEAM.add_player_info = function (self, peer_id)
	if self._lobby_attributes then
		local players_info = NetworkMatchMakingSTEAM.EMPTY_PLAYER_INFO
		local player_data = self._lobby_attributes["players_info_" .. peer_id]

		if managers.network then
			slot6 = managers.network

			if managers.network.session(slot5) then
				slot6 = managers.network
				slot6 = managers.network.session(slot5)

				if managers.network.session(slot5).all_peers(slot5) then
					slot6 = managers.network
					slot6 = managers.network.session(slot5)
					local peer_data = managers.network.session(slot5).all_peers(slot5)[peer_id]

					if peer_data then
						slot7 = peer_data
						local peer_level = peer_data.level(slot6) or ""
						slot8 = managers.network
						slot8 = managers.network.session(slot7)
						slot8 = managers.network.session(slot7).all_peers(slot7)[peer_id]
						local peer_class = managers.network.session(slot7).all_peers(slot7)[peer_id].blackmarket_outfit(slot7).skills or ""
						slot11 = peer_data
						slot11 = ""
						local peer_name = string.gsub(slot8, peer_data.name(slot10) or "", ",")
						slot10 = peer_data
						local peer_nationality = peer_data.character(peer_data.name(slot10) or "") or ""
						players_info = peer_level .. "," .. peer_class .. "," .. peer_name .. "," .. peer_nationality
					end
				end
			end
		end

		self._lobby_attributes["players_info_" .. peer_id] = players_info
		slot7 = self._lobby_attributes

		self.lobby_handler.set_lobby_data("players_info_" .. peer_id, self.lobby_handler)
	end

	return 
end
NetworkMatchMakingSTEAM.set_server_state = function (self, state)
	if self._lobby_attributes then
		slot5 = state
		local state_id = tweak_data.server_state_to_index(slot3, tweak_data)
		self._lobby_attributes.state = state_id

		if state_id == 3 then
			slot5 = managers.raid_job

			if not managers.raid_job.current_job(slot4) then
				self._lobby_attributes.state = 1
			end
		end

		if self.lobby_handler then
			slot6 = self._lobby_attributes

			self.lobby_handler.set_lobby_data(slot4, self.lobby_handler)
		end

		slot5 = managers.network
		slot5 = managers.network.session(slot4)

		managers.network.session(slot4).chk_server_joinable_state(slot4)
	end

	return 
end
NetworkMatchMakingSTEAM.set_server_joinable = function (self, state)
	if state == self._server_joinable then
		return 
	end

	self._server_joinable = state

	if self.lobby_handler then
		slot5 = state

		self.lobby_handler.set_joinable(slot3, self.lobby_handler)
	end

	return 
end
NetworkMatchMakingSTEAM.is_server_joinable = function (self)
	return self._server_joinable
end
NetworkMatchMakingSTEAM.server_state_name = function (self)
	slot4 = self._lobby_attributes.state

	return tweak_data.index_to_server_state(slot2, tweak_data)
end
NetworkMatchMakingSTEAM.set_attributes = function (self, settings)
	if not self.lobby_handler then
		return 
	end

	local permissions = {
		"public",
		"friend",
		"private"
	}
	local lobby_attributes = {}
	slot6 = managers.network.account
	lobby_attributes.owner_name = managers.network.account.username_id(slot5)
	slot6 = managers.network.account
	lobby_attributes.owner_id = managers.network.account.player_id(slot5)
	lobby_attributes.custom_text = Global.game_settings.custom_text or ""
	lobby_attributes.level = settings.numbers[1]
	lobby_attributes.difficulty = settings.numbers[2]
	lobby_attributes.permission = settings.numbers[3]
	lobby_attributes.state = settings.numbers[4] or (self._lobby_attributes and self._lobby_attributes.state) or 1
	lobby_attributes.min_level = settings.numbers[7] or 0
	lobby_attributes.num_players = self._num_players or 1
	lobby_attributes.drop_in = settings.numbers[6] or 1
	lobby_attributes.job_id = settings.numbers[14] or 0
	lobby_attributes.kick_option = settings.numbers[8] or 0
	lobby_attributes.job_class_min = settings.numbers[9] or 10
	lobby_attributes.job_class_max = settings.numbers[9] or 10
	lobby_attributes.job_plan = settings.numbers[10]
	lobby_attributes.region = settings.numbers[11]
	lobby_attributes.challenge_card_id = settings.numbers[12]
	lobby_attributes.progress = settings.numbers[15]
	lobby_attributes.mission_type = settings.numbers[16]
	lobby_attributes.players_info_1 = settings.numbers[17]
	lobby_attributes.players_info_2 = settings.numbers[18]
	lobby_attributes.players_info_3 = settings.numbers[19]
	lobby_attributes.players_info_4 = settings.numbers[20]

	if self._BUILD_SEARCH_INTEREST_KEY then
		lobby_attributes[self._BUILD_SEARCH_INTEREST_KEY] = "true"
	end

	self._lobby_attributes = lobby_attributes
	slot7 = lobby_attributes

	self.lobby_handler.set_lobby_data(slot5, self.lobby_handler)

	slot7 = permissions[settings.numbers[3]]

	self.lobby_handler.set_lobby_type(slot5, self.lobby_handler)

	return 
end
NetworkMatchMakingSTEAM._lobby_to_numbers = function (self, lobby)
	slot8 = "difficulty"
	slot8 = "permission"
	slot8 = "state"
	slot8 = "num_players"
	slot8 = "drop_in"
	slot8 = "min_level"
	slot8 = "kick_option"
	slot8 = "job_class"
	slot8 = "job_plan"
	slot8 = "region"
	slot6 = "challenge_card_id"
	slot6 = "players_info"
	slot6 = "job_id"
	slot6 = "progress"
	slot6 = "mission_type"
	slot6 = "players_info_1"
	slot6 = "players_info_2"
	slot6 = "players_info_3"
	slot6 = "players_info_4"

	return {
		lobby.key_value(slot4, lobby),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		tonumber(lobby.key_value("level", lobby)),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby),
		lobby.key_value(slot4, lobby)
	}
end
NetworkMatchMakingSTEAM.from_host_lobby_re_opened = function (self, status)
	slot6 = status

	print(slot3, "[NetworkMatchMakingSTEAM::from_host_lobby_re_opened]", self._try_re_enter_lobby)

	if self._try_re_enter_lobby == "asked" then
		if status then
			self._try_re_enter_lobby = "open"
		else
			self._try_re_enter_lobby = nil
			slot4 = managers.network.matchmake

			managers.network.matchmake.leave_game(slot3)
		end
	end

	return 
end

return 
