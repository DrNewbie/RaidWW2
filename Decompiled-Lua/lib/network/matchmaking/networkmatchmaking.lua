-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
NetworkMatchMaking = NetworkMatchMaking or class()
NetworkMatchMaking.OPEN_SLOTS = 4
NetworkMatchMaking._BUILD_SEARCH_INTEREST_KEY = "raid_ww2_retail_1_0_18"
NetworkMatchMaking.RETRY_CONNECT_COUNT = 15
NetworkMatchMaking.init = function (self)
	slot4 = "matchmake = NetworkMatchMaking"

	cat_print(slot2, "lobby")

	self._callback_map = {}
	self._lobby_filters = {}
	self._distance_filter = -1
	self._difficulty_filter = 0
	self._lobby_return_count = 30
	self._try_re_enter_lobby = nil
	self._server_joinable = true

	return 
end
NetworkMatchMaking.register_callback = function (self, event, callback)
	self._callback_map[event] = callback

	return 
end
NetworkMatchMaking._call_callback = function (self, name, ...)
	if self._callback_map[name] then
		return self._callback_map[name](...)
	else
		slot5 = "Callback " .. name .. " not found."

		Application.error(slot3, Application)
	end

	return 
end
NetworkMatchMaking._has_callback = function (self, name)
	if self._callback_map[name] then
		return true
	end

	return false
end
NetworkMatchMaking._split_attribute_number = function (self, attribute_number, splitter)
	slot6 = attribute_number / splitter

	return attribute_number % splitter, math.floor(slot5)
end
NetworkMatchMaking.destroy_game = function (self)
	slot3 = self

	self.leave_game(slot2)

	return 
end
NetworkMatchMaking._load_globals = function (self)

	-- Decompilation error in this vicinity:
	if Global.empty and Global.empty.match then
		self.lobby_handler = Global.empty.match.lobby_handler
		self._lobby_attributes = Global.empty.match.lobby_attributes

		if self.lobby_handler then
			slot6 = NetworkMatchMaking._on_chat_message

			self.lobby_handler.setup_callbacks(slot2, self.lobby_handler, NetworkMatchMaking._on_memberstatus_change, NetworkMatchMaking._on_data_update)
		end

		self._try_re_enter_lobby = Global.empty.match.try_re_enter_lobby
		self._server_rpc = Global.empty.match.server_rpc
		self._lobby_filters = Global.empty.match.lobby_filters or self._lobby_filters
		self._distance_filter = Global.empty.match.distance_filter or self._distance_filter
		self._difficulty_filter = Global.empty.match.difficulty_filter or self._difficulty_filter
		self._lobby_return_count = Global.empty.match.lobby_return_count or self._lobby_return_count
		Global.empty.match = nil
	end

	return 
end
NetworkMatchMaking._save_globals = function (self)
	if not Global.empty then
		Global.empty = {}
	end

	Global.empty.match = {
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
NetworkMatchMaking.set_join_invite_pending = function (self, lobby_id)
	self._join_invite_pending = lobby_id

	return 
end
NetworkMatchMaking.update = function (self)
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

			function slot1(result, handler)
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
NetworkMatchMaking.leave_game = function (self)
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

	slot3 = "NetworkMatchMaking:leave_game()"

	print(slot2)

	return 
end
NetworkMatchMaking.get_friends_lobbies = function (self)
	local lobbies = {}
	local num_updated_lobbies = 0

	local function empty()
		return 
	end

	local function f(updated_lobby)
		slot4 = empty

		updated_lobby.setup_callback(slot2, updated_lobby)

		slot3 = "NetworkMatchMaking:get_friends_lobbies f"

		print(slot2)

		num_updated_lobbies = num_updated_lobbies + 1

		if #lobbies <= num_updated_lobbies then
			local info = {
				room_list = {},
				attribute_list = {}
			}
			slot4 = lobbies

			for _, lobby in ipairs(slot3) do
				if NetworkMatchMaking._BUILD_SEARCH_INTEREST_KEY then
					slot10 = NetworkMatchMaking._BUILD_SEARCH_INTEREST_KEY
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
				slot12 = "NetworkMatchMaking:get_friends_lobbies value_pending"

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
NetworkMatchMaking.search_friends_only = function (self)
	return self._search_friends_only
end
NetworkMatchMaking.distance_filter = function (self)
	return self._distance_filter
end
NetworkMatchMaking.set_distance_filter = function (self, filter)
	self._distance_filter = filter

	return 
end
NetworkMatchMaking.get_lobby_return_count = function (self)
	return self._lobby_return_count
end
NetworkMatchMaking.set_lobby_return_count = function (self, lobby_return_count)
	self._lobby_return_count = lobby_return_count

	return 
end
NetworkMatchMaking.lobby_filters = function (self)
	return self._lobby_filters
end
NetworkMatchMaking.set_lobby_filters = function (self, filters)
	self._lobby_filters = filters or {}

	return 
end
NetworkMatchMaking.add_lobby_filter = function (self, key, value, comparision_type)
	self._lobby_filters[key] = {
		key = key,
		value = value,
		comparision_type = comparision_type
	}

	return 
end
NetworkMatchMaking.get_lobby_filter = function (self, key)
	return (self._lobby_filters[key] and self._lobby_filters[key].value) or false
end
NetworkMatchMaking.difficulty_filter = function (self)
	return self._difficulty_filter
end
NetworkMatchMaking.set_difficulty_filter = function (self, filter)
	self._difficulty_filter = filter

	return 
end
NetworkMatchMaking.search_lobby = function (self, friends_only)
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

		slot10 = managers.experience

		self.browser.set_lobby_filter(slot5, self.browser, "min_level", managers.experience.current_level("equalto_less_than"))

		slot9 = "equal"

		self.browser.set_lobby_filter(slot5, self.browser, self._BUILD_SEARCH_INTEREST_KEY, "true")

		slot6 = self._lobby_filters

		for key, data in pairs(slot5) do

			-- Decompilation error in this vicinity:
			if data.value and data.value ~= -1 then
				slot14 = data.comparision_type

				self.browser.set_lobby_filter(slot10, self.browser, data.key, data.value)
			end
		end

		slot7 = self._lobby_return_count

		self.browser.set_max_lobby_return_count(slot5, self.browser)

		if Global.game_settings.playing_lan then
			slot6 = self.browser

			self.browser.refresh_lan(slot5)
		else
			slot6 = self.browser

			self.browser.refresh(slot5)
		end
	end

	return 
end
NetworkMatchMaking.search_lobby_done = function (self)
	slot4 = "find_server"

	managers.system_menu.close(slot2, managers.system_menu)

	self.browser = nil

	return 
end
NetworkMatchMaking.game_owner_name = function (self)
	slot4 = "owner_name"

	return managers.network.matchmake.lobby_handler.get_lobby_data(slot2, managers.network.matchmake.lobby_handler)
end
NetworkMatchMaking.is_server_ok = function (self, friends_only, room, attributes_numbers, is_invite)
	slot8 = attributes_numbers[3]
	local permission = tweak_data.index_to_permission(slot6, tweak_data)
	slot10 = 1000
	local level_index, job_index = self._split_attribute_number(tweak_data, self, attributes_numbers[1])
	slot11 = level_index

	if not tweak_data.levels.get_level_name_from_index(attributes_numbers[1], tweak_data.levels) then
		slot11 = "No level data for index " .. level_index .. ". Payday1 data not compatible with Payday2."

		Application.error(slot9, Application)

		return false
	end

	if (not NetworkManager.DROPIN_ENABLED or attributes_numbers[6] == 0) and attributes_numbers[4] ~= 1 then
		slot11 = "NetworkMatchMaking:is_server_ok() server rejected. DROPING NOT ENABLED"

		Application.debug(slot9, Application)

		return false, 1
	end

	slot10 = managers.experience

	if managers.experience.current_level(slot9) < attributes_numbers[7] then
		slot11 = "NetworkMatchMaking:is_server_ok() server rejected. REPUTATION CAP"

		Application.debug(slot9, Application)

		return false, 3
	end

	if not is_invite and permission == "private" then
		slot11 = "NetworkMatchMaking:is_server_ok() server rejected. PRIVATE GAME"

		Application.debug(slot9, Application)

		return false, 2
	end

	if permission == "public" then
		return true
	end

	return true
end
NetworkMatchMaking.join_server_with_check = function (self, room_id, is_invite)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)

	if managers.network.session(slot4).has_other_peers(slot4) then
		slot7 = "dialog_err_already_hoasting"

		managers.menu.show_ok_only_dialog(slot4, managers.menu, "dialog_error_title")

		return 
	end

	slot5 = managers.menu

	managers.menu.show_joining_lobby_dialog(slot4)

	return 
end
NetworkMatchMaking._on_member_left = function (id, status)
	slot4 = managers.network

	if not managers.network.session(slot3) then
		return 
	end

	slot4 = managers.network
	slot5 = id
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
		slot5 = managers.network.session(slot4)

		if peer == managers.network.session(slot4).local_peer(slot4) then
			slot5 = managers.network
			slot5 = managers.network.session(slot4)

			if not managers.network.session(slot4).closing(slot4) then
				slot6 = "OMG I LEFT THE LOBBY"

				Application.error(slot4, Application)

				managers.network.matchmake._try_re_enter_lobby = "lost"
			end
		end
	end

	slot5 = managers.network
	slot6 = peer

	managers.network.session(slot4).on_peer_left_lobby(slot4, managers.network.session(slot4))

	return 
end
NetworkMatchMaking._on_memberstatus_change = function (memberstatus)
	print(slot2, "[NetworkMatchMaking._on_memberstatus_change]")

	slot6 = ":"
	local user, status = unpack(string.split(memberstatus, memberstatus))

	if status == "lost_connection" or status == "left_become_owner" or status == "left" or status == "kicked" or status == "banned" or status == "invalid" then
		slot6 = status

		NetworkMatchMaking._on_member_left(slot4, user)
	end

	return 
end
NetworkMatchMaking._on_data_update = function (...)
	return 
end
NetworkMatchMaking._on_chat_message = function (user, message)
	slot6 = message

	print(slot3, "[NetworkMatchMaking._on_chat_message]", user)

	slot5 = message

	NetworkMatchMaking._handle_chat_message(slot3, user)

	return 
end
NetworkMatchMaking._handle_chat_message = function (user, message)
	local s = "" .. message
	slot9 = user

	managers.chat.receive_message_by_name(slot4, managers.chat, ChatManager.GLOBAL, user.name(s))

	return 
end
NetworkMatchMaking.join_server = function (self, room_id, skip_showing_dialog)
	if not skip_showing_dialog then
		slot5 = managers.menu

		managers.menu.show_joining_lobby_dialog(slot4)
	end

	local function f(result, handler)
		slot6 = handler

		print(slot3, "[NetworkMatchMaking:join_server:f]", result)

		slot5 = "join_server"

		managers.system_menu.close(slot3, managers.system_menu)

		if result == "success" then
			slot4 = "Success!"

			print(slot3)

			self.lobby_handler = handler
			slot4 = self.lobby_handler
			local _, host_id, owner = self.lobby_handler.get_server_details(slot3)
			slot9 = host_id

			print(slot6, "[NetworkMatchMaking:join_server] server details", _)
			print(slot6)

			slot11 = host_id
			slot11 = "VOID"
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

			slot10 = NetworkMatchMaking._on_chat_message

			self.lobby_handler.setup_callbacks(slot6, self.lobby_handler, NetworkMatchMaking._on_memberstatus_change, NetworkMatchMaking._on_data_update)

			slot7 = managers.network

			managers.network.start_client(slot6)

			managers.network._restart_in_camp = true
			slot8 = {
				cancel_func = function ()
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

			managers.menu.show_waiting_for_server_response(true, managers.menu)

			local function joined_game(res, level_index, difficulty_index, state_index)
				slot7 = "waiting_for_server_response"

				managers.system_menu.close(slot5, managers.system_menu)

				slot10 = state_index

				print(slot5, "[NetworkMatchMaking:join_server:joined_game]", res, level_index, difficulty_index)

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

					slot7 = level_index
					local level_id = tweak_data.levels.get_level_name_from_index(slot5, tweak_data.levels)
					Global.game_settings.level_id = level_id
					slot7 = managers.network
					slot7 = managers.network.session(tweak_data.levels)
					slot8 = false

					managers.network.session(tweak_data.levels).local_peer(tweak_data.levels).set_in_lobby(tweak_data.levels, managers.network.session(tweak_data.levels).local_peer(tweak_data.levels))
				elseif res == "KICKED" then
					slot6 = managers.network.matchmake

					managers.network.matchmake.leave_game(slot5)

					slot6 = managers.network.voice_chat

					managers.network.voice_chat.destroy_voice(slot5)

					slot6 = managers.network

					managers.network.queue_stop_network(slot5)

					slot6 = managers.menu

					managers.menu.show_peer_kicked_dialog(slot5)
				elseif res == "TIMED_OUT" then
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
				elseif res == "FAILED_CONNECT" then
					slot6 = managers.network.matchmake

					managers.network.matchmake.leave_game(slot5)

					slot6 = managers.network.voice_chat

					managers.network.voice_chat.destroy_voice(slot5)

					slot6 = managers.network

					managers.network.queue_stop_network(slot5)

					slot6 = managers.menu

					managers.menu.show_failed_joining_dialog(slot5)
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
				elseif res == "AUTH_FAILED" or res == "AUTH_HOST_FAILED" then
					slot6 = managers.network.matchmake

					managers.network.matchmake.leave_game(slot5)

					slot6 = managers.network.voice_chat

					managers.network.voice_chat.destroy_voice(slot5)

					slot6 = managers.network

					managers.network.queue_stop_network(slot5)

					Global.on_remove_peer_message = (res == "AUTH_HOST_FAILED" and "dialog_authentication_host_fail") or "dialog_authentication_fail"
					slot6 = managers.menu

					managers.menu.show_peer_kicked_dialog((res == "AUTH_HOST_FAILED" and "dialog_authentication_host_fail") or "dialog_authentication_fail")
				else
					slot8 = res

					Application.error(slot5, Application, "[NetworkMatchMaking:join_server] FAILED TO START MULTIPLAYER!")
				end

				return 
			end

			slot10 = joined_game

			managers.network.join_game_at_host_rpc(managers.menu, managers.network, self._server_rpc)
		else
			slot4 = managers.menu

			managers.menu.show_failed_joining_dialog(slot3)

			slot4 = self
			slot7 = self

			self.search_lobby(slot3, self.search_friends_only(slot6))
		end

		return 
	end

	return 
end
NetworkMatchMaking.send_join_invite = function (self, friend)
	return 
end
NetworkMatchMaking.set_server_attributes = function (self, settings)
	slot5 = settings

	self.set_attributes(slot3, self)

	return 
end
NetworkMatchMaking.create_lobby = function (self, settings)
	self._num_players = nil
	local dialog_data = {}
	slot6 = "dialog_creating_lobby_title"
	dialog_data.title = managers.localization.text(slot4, managers.localization)
	slot6 = "dialog_wait"
	dialog_data.text = managers.localization.text(slot4, managers.localization)
	dialog_data.id = "create_lobby"
	dialog_data.no_buttons = true
	slot6 = dialog_data

	managers.system_menu.show(slot4, managers.system_menu)

	local function f(result, handler)
		slot6 = handler

		print(slot3, "Create lobby callback!!", result)

		if result == "success" then
			self.lobby_handler = handler
			slot5 = settings

			self.set_attributes(slot3, self)

			slot4 = self.lobby_handler

			self.lobby_handler.publish_server_details(slot3)

			self._server_joinable = true
			slot5 = true

			self.lobby_handler.set_joinable(true, self.lobby_handler)

			slot7 = NetworkMatchMaking._on_chat_message

			self.lobby_handler.setup_callbacks(true, self.lobby_handler, NetworkMatchMaking._on_memberstatus_change, NetworkMatchMaking._on_data_update)

			slot5 = "create_lobby"

			managers.system_menu.close(true, managers.system_menu)

			slot4 = managers.menu

			managers.menu.created_lobby(true)
		else
			slot5 = "create_lobby"

			managers.system_menu.close(slot3, managers.system_menu)

			local title = managers.localization.text(slot3, managers.localization)
			local dialog_data = {
				title = title,
				text = managers.localization.text("dialog_error_title", managers.localization)
			}
			slot9 = "dialog_ok"
			dialog_data.button_list = {
				{
					text = managers.localization.text("dialog_err_failed_creating_lobby", managers.localization)
				}
			}
			slot7 = dialog_data

			managers.system_menu.show(, managers.system_menu)
		end

		return 
	end

	return true
end
NetworkMatchMaking.set_num_players = function (self, num)
	slot5 = num

	print(slot3, "NetworkMatchMaking:set_num_players")

	self._num_players = num

	if self._lobby_attributes then
		self._lobby_attributes.num_players = num
		slot5 = self._lobby_attributes

		self.lobby_handler.set_lobby_data(slot3, self.lobby_handler)
	end

	return 
end
NetworkMatchMaking.set_server_state = function (self, state)
	if self._lobby_attributes then
		slot5 = state
		local state_id = tweak_data.server_state_to_index(slot3, tweak_data)
		self._lobby_attributes.state = state_id

		if self.lobby_handler then
			slot6 = self._lobby_attributes

			self.lobby_handler.set_lobby_data(slot4, self.lobby_handler)

			if not NetworkManager.DROPIN_ENABLED then
				slot6 = state == "in_lobby"

				self.lobby_handler.set_joinable(slot4, self.lobby_handler)
			end
		end
	end

	return 
end
NetworkMatchMaking.set_server_joinable = function (self, state)
	slot5 = state

	print(slot3, "[NetworkMatchMaking:set_server_joinable]")

	self._server_joinable = state

	if self.lobby_handler then
		slot5 = state

		self.lobby_handler.set_joinable(slot3, self.lobby_handler)
	end

	return 
end
NetworkMatchMaking.is_server_joinable = function (self)
	return self._server_joinable
end
NetworkMatchMaking.server_state_name = function (self)
	slot4 = self._lobby_attributes.state

	return tweak_data.index_to_server_state(slot2, tweak_data)
end
NetworkMatchMaking.set_attributes = function (self, settings)
	if not self.lobby_handler then
		return 
	end

	local permissions = {
		"public",
		"friend",
		"private"
	}
	local level_index, job_index = self._split_attribute_number(slot4, self, settings.numbers[1])
	local lobby_attributes = {}
	slot8 = managers.network.account
	lobby_attributes.owner_name = managers.network.account.username_id(1000)
	slot8 = managers.network.account
	lobby_attributes.owner_id = managers.network.account.player_id(1000)
	lobby_attributes.level = level_index
	lobby_attributes.difficulty = settings.numbers[2]
	lobby_attributes.permission = settings.numbers[3]
	lobby_attributes.state = settings.numbers[4] or (self._lobby_attributes and self._lobby_attributes.state) or 1
	lobby_attributes.min_level = settings.numbers[7] or 0
	lobby_attributes.num_players = self._num_players or 1
	lobby_attributes.drop_in = settings.numbers[6] or 1
	lobby_attributes.job_id = job_index or 0
	lobby_attributes.kick_option = settings.numbers[8] or 0
	lobby_attributes.job_class_min = settings.numbers[9] or 10
	lobby_attributes.job_class_max = settings.numbers[9] or 10
	lobby_attributes.job_plan = settings.numbers[10]

	if self._BUILD_SEARCH_INTEREST_KEY then
		lobby_attributes[self._BUILD_SEARCH_INTEREST_KEY] = "true"
	end

	self._lobby_attributes = lobby_attributes
	slot9 = lobby_attributes

	self.lobby_handler.set_lobby_data(slot7, self.lobby_handler)

	slot9 = permissions[settings.numbers[3]]

	self.lobby_handler.set_lobby_type(slot7, self.lobby_handler)

	return 
end
NetworkMatchMaking._lobby_to_numbers = function (self, lobby)
	slot8 = "level"
	slot9 = "job_id"
	slot8 = "difficulty"
	slot8 = "permission"
	slot8 = "state"
	slot8 = "num_players"
	slot8 = "drop_in"
	slot8 = "min_level"
	slot8 = "kick_option"
	slot8 = "job_class"
	slot8 = "job_plan"

	return {
		tonumber(lobby.key_value(slot6, lobby)) + 1000 * tonumber(lobby.key_value(lobby, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby)),
		tonumber(lobby.key_value(lobby.key_value, lobby))
	}
end
NetworkMatchMaking.from_host_lobby_re_opened = function (self, status)
	slot6 = status

	print(slot3, "[NetworkMatchMaking::from_host_lobby_re_opened]", self._try_re_enter_lobby)

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
