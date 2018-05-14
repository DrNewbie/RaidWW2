-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
NetworkMatchMakingXBL = NetworkMatchMakingXBL or class()
NetworkMatchMakingXBL.OPEN_SLOTS = 4
NetworkMatchMakingXBL.GAMEVERSION = 2
NetworkMatchMakingXBL.CANCEL_JOIN_SMARTMATCH_DELAY_T = 4
NetworkMatchMakingXBL.INEXACT_MATCH_CONFIRM_TIMEOUT = 30
NetworkMatchMakingXBL.SMARTMATCH_RE_ADVERTISE_PAUSE_T = 1
NetworkMatchMakingXBL.SMARTMATCH_HOST_TIMEOUT_T = 15
NetworkMatchMakingXBL.SMARTMATCH_CLIENT_TIMEOUT_T = 30
NetworkMatchMakingXBL.SMARTMATCH_CLIENT_TIMEOUT_T2 = 30
NetworkMatchMakingXBL.SMARTMATCH_STRICT = true
NetworkMatchMakingXBL.init = function (self)
	self._callback_map = {}
	self._distance_filter = -1
	self._difficulty_filter = 0
	self._try_re_enter_lobby = nil
	self._players = {}
	self._next_cancel_callback_id = 0
	self._cancel_callback_map = {}
	slot4 = true

	self.set_server_joinable(slot2, self)

	slot3 = "[NetworkMatchMakingXBL:init]"

	print(slot2)

	slot4 = "invite_accepted"
	slot9 = "invite_accepted_callback"

	managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))

	return 
end
NetworkMatchMakingXBL.invite_accepted_callback = function (self, invitee_xuid)
	slot5 = invitee_xuid

	print(slot3, "[NetworkMatchMakingXBL:invite_accepted_callback]")

	slot4 = XboxLive
	local invitation = XboxLive.accepted_invite(slot3)

	if not invitation then
		slot6 = "NetworkMatchMakingXBL:invite_accepted_callback Invitation didn't contain anything"

		Application.error(slot4, Application)

		return 
	end

	slot5 = invitee_xuid
	local invitee_xuid_str = tostring(slot4)
	Global.boot_invite = Global.boot_invite or {}

	if not Global.user_manager.user_index or not Global.user_manager.active_user_state_change_quit then
		slot6 = "BOOT UP INVITE"

		print(slot5)

		Global.boot_invite[invitee_xuid_str] = invitation

		return 
	end

	if self.OPEN_SLOTS <= invitation.properties.NUMPLAYERS then
		slot6 = "game was already full"

		print(slot5)

		slot6 = managers.menu

		managers.menu.show_game_is_full(slot5)

		return 
	end

	slot6 = managers.dlc

	if managers.dlc.is_installing(slot5) then
		Global.boot_invite = nil
		slot6 = managers.menu

		managers.menu.show_game_is_installing(nil)

		return 
	end

	if not invitation.is_same_user then
		slot6 = "INACTIVE USER RECIEVED INVITE"

		print(slot5)

		Global.boot_invite[invitee_xuid_str] = nil
		slot7 = {}

		managers.menu.show_inactive_user_accepted_invite(nil, managers.menu)

		slot6 = managers.user

		managers.user.invite_accepted_by_inactive_user(nil)

		return 
	end

	slot6 = game_state_machine

	if game_state_machine.current_state_name(slot5) ~= "menu_main" then
		slot6 = "INGAME INVITE"

		print(slot5)

		Global.boot_invite[invitee_xuid_str] = invitation
		slot6 = MenuCallbackHandler

		MenuCallbackHandler._dialog_end_game_yes(slot5)

		return 
	end

	slot6 = setup

	if setup.has_queued_exec(slot5) then
		Global.queued_invite = invitation
		Global.queued_player = player_index

		return 
	end

	slot7 = invitation

	self._check_invite_requirements(slot5, self)

	return 
end
NetworkMatchMakingXBL.join_boot_invite = function (self)
	slot6 = managers.user
	local invitation = Global.boot_invite[tostring(managers.user.get_platform_id(slot5))]
	slot5 = invitation

	print(slot3, "NetworkMatchMakingXBL:join_boot_invite()")

	if not invitation then
		return 
	end

	if self.OPEN_SLOTS <= invitation.properties.NUMPLAYERS then
		slot4 = "game was already full"

		print(slot3)

		slot4 = managers.menu

		managers.menu.show_game_is_full(slot3)

		slot7 = managers.user
		Global.boot_invite[tostring(managers.user.get_platform_id(slot6))] = nil

		return 
	end

	slot4 = managers.dlc

	if managers.dlc.is_installing(slot3) then
		Global.boot_invite = nil
		slot4 = managers.menu

		managers.menu.show_game_is_installing(nil)

		return 
	end

	slot5 = invitation

	self._check_invite_requirements(slot3, self)

	slot7 = managers.user
	Global.boot_invite[tostring(managers.user.get_platform_id(slot6))] = nil

	return 
end
NetworkMatchMakingXBL._check_invite_requirements = function (self, invitation)
	Global.game_settings.single_player = false
	self._test_invitation = invitation
	slot4 = "invitation\n"
	slot7 = invitation

	print(false, inspect(slot6))

	function slot5(success)
		if not success then
			return 
		end

		if self._session then
			slot4 = invitation.host_info

			if self._session.id(slot2) == invitation.host_info.id(self._session) then
				slot3 = "Allready in that session"

				print(slot2)

				return 
			end
		end

		slot3 = invitation.host_info

		if invitation.host_info.id(slot2) == "(empty)" then
			slot3 = managers.menu

			managers.menu.show_invite_wrong_room_message(slot2)

			slot3 = managers.menu

			managers.menu.leave_online_menu(slot2)

			return 
		end

		self._has_pending_invite = true
		slot5 = invitation.properties.GAMERHOSTNAME

		self._join_invite_accepted(true, self, invitation.host_info)

		return 
	end

	managers.menu.open_sign_in_menu(false, managers.menu)

	return 
end
NetworkMatchMakingXBL._join_invite_accepted = function (self, host_info, host_name)
	slot6 = "server_left_dialog"

	managers.system_menu.close(slot4, managers.system_menu)

	slot6 = host_info

	print(slot4, "_join_invite_accepted")

	self._has_pending_invite = nil
	self._invite_host_info = host_info

	if self._session then
		slot5 = "MUST LEAVE session"

		print(slot4)

		slot5 = MenuCallbackHandler

		MenuCallbackHandler._dialog_leave_lobby_yes(slot4)
	end

	slot5 = managers.system_menu

	managers.system_menu.force_close_all(slot4)

	slot8 = host_info
	slot8 = {
		info = host_info,
		host_name = host_name
	}

	self.join_server_with_check(slot4, self, host_info.id(slot7), true)

	return 
end
NetworkMatchMakingXBL.register_callback = function (self, event, callback)
	self._callback_map[event] = callback

	return 
end
NetworkMatchMakingXBL._call_callback = function (self, name, ...)
	if self._callback_map[name] then
		return self._callback_map[name](...)
	else
		slot5 = "Callback " .. name .. " not found."

		Application.error(slot3, Application)
	end

	return 
end
NetworkMatchMakingXBL._has_callback = function (self, name)
	if self._callback_map[name] then
		return true
	end

	return false
end
NetworkMatchMakingXBL._split_attribute_number = function (self, attribute_number, splitter)
	slot6 = attribute_number / splitter

	return attribute_number % splitter, math.floor(slot5)
end
NetworkMatchMakingXBL.destroy_game = function (self)
	slot3 = self

	self.leave_game(slot2)

	return 
end
NetworkMatchMakingXBL.add_cancelable_callback = function (self)
	self._next_cancel_callback_id = self._next_cancel_callback_id + 1
	self._cancel_callback_map[self._next_cancel_callback_id] = false

	return self._next_cancel_callback_id
end
NetworkMatchMakingXBL._find_server_callback = function (self, cancel_id, servers, mode)

	-- Decompilation error in this vicinity:
	self._searching_lobbys = nil
	slot7 = cancel_id

	if self.check_callback_canceled(slot5, self) then
		return 
	end

	self._last_mode = mode
	slot7 = mode
	slot10 = servers

	print(slot5, "find_server_callback", inspect(slot9))

	if not servers then
		slot6 = "SEaRCH FAILED"

		print(slot5)

		return 
	end

	local info = {
		room_list = {},
		attribute_list = {}
	}
	slot7 = servers

	for _, server in ipairs(slot6) do
		self._test_server = server
		slot14 = server

		print(inspect(slot13))

		slot13 = {
			owner_name = server.properties.GAMERHOSTNAME,
			xuid = server.properties.GAMERHOSTXUID,
			room_id = server.info.id(slot15),
			info = server.info
		}
		slot16 = server.info

		table.insert(slot11, info.room_list)

		slot13 = {
			numbers = self._server_to_numbers(slot15, self)
		}
		slot17 = server

		table.insert(slot11, info.attribute_list)
	end

	slot9 = info

	self._call_callback(slot6, self, "search_lobby")

	slot7 = managers.user
	local player_index = managers.user.get_platform_id(slot6)

	return 
end
NetworkMatchMakingXBL.check_callback_canceled = function (self, id)
	local is_canceled = self._cancel_callback_map[id]
	self._cancel_callback_map[id] = nil
	slot5 = self._cancel_callback_map

	if not next(nil) then
		self._next_cancel_callback_id = 0
	end

	return is_canceled
end
NetworkMatchMakingXBL.leave_game = function (self)
	slot1 = print
	slot3 = "NetworkMatchMakingXBL:leave_game()"

	if self._session then
		slot6 = self._session
		slot4 = self._session.state(slot5)
	end

	slot1(slot2, slot3)

	slot3 = Application

	Application.stack_dump(slot2)

	slot3 = self._cancel_callback_map

	for id in pairs(slot2) do
		self._cancel_callback_map[id] = true
	end

	self._join_smartmatch = nil
	self._queued_join_by_smartmatch = nil

	if self._session then
		slot3 = XboxLive

		XboxLive.cancel_smartmatch(slot2)

		local player_index = managers.user.get_platform_id(slot2)
		slot4 = "managers.user:get_platform_id()"
		slot7 = managers.user

		print(managers.user, managers.user.get_platform_id(slot6))

		slot5 = self._session

		print(managers.user, "  _leave and destroy")

		slot6 = player_index

		XboxLive.leave_local(managers.user, XboxLive, self._session)

		slot4 = " has left"

		print(managers.user)

		slot5 = self._session

		XboxLive.delete_session(managers.user, XboxLive)

		slot4 = " has deleted"

		print(managers.user)

		slot4 = self

		if self._is_server(managers.user) then
			self._server_last_alive_t = nil
			self._next_time_out_check_t = nil
		end

		self._session = nil
		slot5 = true

		self.set_server_joinable(slot3, self)

		slot4 = "NetworkMatchMakingXBL:leave_game() done"

		print(slot3)

		slot4 = Application

		Application.stack_dump(slot3)
	else
		slot4 = "Dont have a session!?"

		cat_print(slot2, "multiplayer")
	end

	slot4 = false

	self._is_server(slot2, self)

	slot4 = false

	self._is_client(slot2, self)

	self._game_owner_name = nil

	return 
end
NetworkMatchMakingXBL._load_globals = function (self)
	if Global.xbl and Global.xbl.match then
		self._session = Global.xbl.match.session
		self._server_rpc = Global.xbl.match.server_rpc
		self._game_owner_name = Global.xbl.match.game_owner_name
		self._num_players = Global.xbl.match.num_players
		self._is_server_var = Global.xbl.match.is_server
		self._is_client_var = Global.xbl.match.is_client
		self._players = Global.xbl.match.players
		self._hopper_variables = Global.xbl.match.hopper_variables
		self._host_session_attributes = Global.xbl.match.host_session_attributes
		Global.xbl.match = nil
	end

	if Global.queued_invite then
		Global.boot_invite[Global.queued_player] = Global.queued_invite
		slot3 = MenuCallbackHandler

		MenuCallbackHandler._dialog_end_game_yes(Global.queued_player)

		Global.queued_invite = nil
	end

	return 
end
NetworkMatchMakingXBL._save_globals = function (self)
	Global.xbl = Global.xbl or {}
	Global.xbl.match = {
		session = self._session,
		server_rpc = self._server_rpc,
		game_owner_name = self._game_owner_name,
		num_players = self._num_players,
		is_server = self._is_server_var,
		is_client = self._is_client_var,
		players = self._players,
		hopper_variables = self._hopper_variables,
		host_session_attributes = self._host_session_attributes
	}

	return 
end
NetworkMatchMakingXBL.update = function (self)
	slot3 = self

	self._chk_advertise_session_for_smartmatch(slot2)

	slot3 = self

	self._update_queued_join_by_smartmatch(slot2)

	return 
end
NetworkMatchMakingXBL._chk_advertise_session_for_smartmatch = function (self)
	if self._session then
		slot3 = managers.network
	else
		self._smartmatch_idle_start_t = nil
	end

	return 
end
NetworkMatchMakingXBL.get_friends_lobbies = function (self)
	return 
end
NetworkMatchMakingXBL.search_friends_only = function (self)
	return self._search_friends_only
end
NetworkMatchMakingXBL.distance_filter = function (self)
	return self._distance_filter
end
NetworkMatchMakingXBL.set_distance_filter = function (self, filter)
	self._distance_filter = filter

	return 
end
NetworkMatchMakingXBL.difficulty_filter = function (self)
	return self._difficulty_filter
end
NetworkMatchMakingXBL.set_difficulty_filter = function (self, filter)
	self._difficulty_filter = filter

	return 
end
NetworkMatchMakingXBL.get_lobby_return_count = function (self)
	return 
end
NetworkMatchMakingXBL.set_lobby_return_count = function (self, lobby_return_count)
	return 
end
NetworkMatchMakingXBL.lobby_filters = function (self)
	return 
end
NetworkMatchMakingXBL.set_lobby_filters = function (self, filters)
	return 
end
NetworkMatchMakingXBL.add_lobby_filter = function (self, key, value, comparision_type)
	return 
end
NetworkMatchMakingXBL.search_lobby = function (self, friends_only)
	if self._searching_lobbys then
		slot4 = "Allready searching lobbys, waiting result"

		print(slot3)

		return 
	end

	self._search_friends_only = friends_only
	slot5 = "search_lobby"

	if not self._has_callback(slot3, self) then
		return 
	end

	local prop = {}
	slot5 = managers.experience
	prop.MINLEVEL = managers.experience.current_level(slot4)
	prop.GAMEVERSION = self.GAMEVERSION
	local con = {
		GAME_TYPE = "STANDARD",
		game_mode = "ONLINE"
	}
	self._searching_lobbys = true

	return 
end
NetworkMatchMakingXBL._find_server_callback = function (self, cancel_id, servers, mode)
	self._searching_lobbys = nil
	slot7 = cancel_id

	if self.check_callback_canceled(slot5, self) then
		return 
	end

	self._last_mode = mode
	slot7 = mode
	slot10 = servers

	print(slot5, "find_server_callback", inspect(slot9))

	if not servers then
		slot6 = "SEaRCH FAILED"

		print(slot5)

		return 
	end

	local info = {
		room_list = {},
		attribute_list = {}
	}
	slot7 = servers

	for _, server in ipairs(slot6) do
		self._test_server = server
		slot14 = server

		print(inspect(slot13))

		slot13 = {
			owner_name = server.properties.GAMERHOSTNAME,
			xuid = server.properties.GAMERHOSTXUID,
			room_id = server.info.id(slot15),
			info = server.info
		}
		slot16 = server.info

		table.insert(slot11, info.room_list)

		slot13 = {
			numbers = self._server_to_numbers(slot15, self)
		}
		slot17 = server

		table.insert(slot11, info.attribute_list)
	end

	slot9 = info

	self._call_callback(slot6, self, "search_lobby")

	return 
end
NetworkMatchMakingXBL.searching_lobbys = function (self)
	return self._searching_lobbys
end
NetworkMatchMakingXBL.search_lobby_done = function (self)
	slot4 = "find_server"

	managers.system_menu.close(slot2, managers.system_menu)

	self.browser = nil

	return 
end
NetworkMatchMakingXBL.game_owner_name = function (self)
	return self._game_owner_name
end
NetworkMatchMakingXBL.is_server_ok = function (self, friends_only, session_id, attributes_numbers)
	slot7 = attributes_numbers[3]
	local permission = tweak_data.index_to_permission(slot5, tweak_data)
	slot9 = 1000
	local level_index, job_index = self._split_attribute_number(tweak_data, self, attributes_numbers[1])
	slot10 = level_index

	if not tweak_data.levels.get_level_name_from_index(attributes_numbers[1], tweak_data.levels) then
		slot10 = "No level data for index " .. level_index .. ". Payday1 data not compatible with Payday2."

		Application.error(slot8, Application)

		return false
	end

	if (not NetworkManager.DROPIN_ENABLED or attributes_numbers[6] == 0) and attributes_numbers[4] ~= 1 then
		return false, 1
	end

	slot9 = managers.experience

	if managers.experience.current_level(slot8) < attributes_numbers[7] then
		return false, 3
	end

	if permission == "private" then
		return false, 2
	end

	if permission == "public" then
		return true
	end

	return true
end
NetworkMatchMakingXBL.join_server_with_check = function (self, session_id, skip_permission_check, data)
	slot7 = session_id

	print(slot5, "NetworkMatchMakingXBL:join_server_with_check")

	slot6 = managers.network
	slot6 = managers.network.session(slot5)

	if managers.network.session(slot5).has_other_peers(slot5) then
		slot8 = "dialog_err_already_hoasting"

		managers.menu.show_ok_only_dialog(slot5, managers.menu, "dialog_error_title")

		return 
	end

	local player_index = managers.user.get_platform_id(slot5)

	managers.menu.show_joining_lobby_dialog(managers.user)

	local function empty()
		return 
	end

	slot8 = self
	local cancel_id = self.add_cancelable_callback(managers.menu)

	local function f(servers)
		slot4 = cancel_id

		if self.check_callback_canceled(slot2, self) then
			return 
		end

		slot4 = servers

		print(slot2, "servers")

		if not servers or not servers[1] then
			slot4 = "join_server"

			managers.system_menu.close(slot2, managers.system_menu)

			slot3 = managers.user

			if managers.user.signed_in_state(slot2) ~= "signed_in_to_live" then
				slot3 = managers.menu

				managers.menu.xbox_disconnected(slot2)
			else
				slot3 = managers.menu

				managers.menu.show_game_no_longer_exists(slot2)
			end

			return 
		end

		slot3 = "NetworkMatchMakingXBL:join_server_with_check f"
		slot6 = servers[1]

		print(slot2, inspect(slot5))

		slot5 = player_index

		print(slot2, "SELF", self)

		local server_ok = true
		local ok_error = nil

		if server_ok then
			slot6 = servers[1].info

			print(slot4, "CALL JOIN SERVER")

			self._game_owner_name = data.host_name
			slot8 = true

			self.join_server(data.host_name, self, session_id, servers[1])
		else
			slot6 = "join_server"

			managers.system_menu.close(slot4, managers.system_menu)

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

	if data and data.info then
		slot10 = {
			{
				open_private_slots = 0,
				info = data.info,
				host_name = data.host_name
			}
		}

		f(slot9)
	else
		slot10 = "[NetworkMatchMakingXBL:join_server_with_check] Missing data."
		slot13 = data

		debug_pause(slot9, inspect(slot12))

		slot10 = {}

		f(slot9)
	end

	return 
end
NetworkMatchMakingXBL._on_data_update = function (...)
	return 
end
NetworkMatchMakingXBL._on_chat_message = function (user, message)
	slot6 = message

	print(slot3, "[NetworkMatchMakingXBL._on_chat_message]", user)

	return 
end
NetworkMatchMakingXBL._handle_chat_message = function (user, message)
	local s = "" .. message
	slot9 = user

	managers.chat.receive_message_by_name(slot4, managers.chat, ChatManager.GLOBAL, user.name(s))

	return 
end
NetworkMatchMakingXBL._update_queued_join_by_smartmatch = function (self)
	if not self._queued_join_by_smartmatch then
		return 
	end

	if self._last_join_smartmatch_cancel_t then
		slot3 = TimerManager
		slot3 = TimerManager.wall(slot2)

		if TimerManager.wall(slot2).time(slot2) - self._last_join_smartmatch_cancel_t < self.CANCEL_JOIN_SMARTMATCH_DELAY_T then
			slot7 = TimerManager
			slot7 = TimerManager.wall(slot6)
			slot4 = (self._last_join_smartmatch_cancel_t + self.CANCEL_JOIN_SMARTMATCH_DELAY_T) - TimerManager.wall(slot6).time(slot6)

			print(slot2, "timing out smartmatch join request")

			return 
		end
	end

	if self._join_smartmatch then
		slot3 = "[NetworkMatchMakingXBL:join_by_smartmatch] smartmatch already in progress"

		print(slot2)

		return 
	end

	local params = self._queued_join_by_smartmatch
	self._queued_join_by_smartmatch = nil
	slot6 = params.difficulty_filter

	self._join_by_smartmatch(slot3, self, params.job_id_filter)

	return 
end
NetworkMatchMakingXBL._join_by_smartmatch = function (self, job_id_filter, difficulty_filter)
	slot8 = difficulty_filter

	print(slot4, "[NetworkMatchMakingXBL:_join_by_smartmatch] job_id_filter", job_id_filter, "difficulty_filter")

	self._server_rpc = nil
	self._session = nil

	if job_id_filter == -1 then
		slot5 = "[NetworkMatchMakingXBL:_join_by_smartmatch] searching inexact"

		print(slot4)

		self._smartmatch_search_inexact = true
	else
		slot5 = "[NetworkMatchMakingXBL:_join_by_smartmatch] searching exact"

		print(slot4)

		self._smartmatch_search_inexact = nil
	end

	self._join_smartmatch = "search"
	slot5 = managers.user
	local player_index = managers.user.get_platform_id(slot4)

	if self._session then
		slot8 = player_index

		XboxLive.leave_local(slot5, XboxLive, self._session)

		slot7 = self._session

		XboxLive.delete_session(slot5, XboxLive)

		self._session = nil
	end

	slot8 = "STANDARD"

	XboxLive.set_context(slot5, XboxLive, "GAME_TYPE")

	slot8 = "ONLINE"

	XboxLive.set_context(slot5, XboxLive, "game_mode")

	slot4 = {
		NrHosts = 0,
		NrClients = 1
	}
	slot5 = tostring

	if job_id_filter ~= -1 or not job_id_filter then
		slot10 = job_id_filter
		slot7 = tweak_data.operations.get_index_from_raid_id(slot8, tweak_data.operations)
	end

	slot4.PrefMission = slot5(slot6)
	slot4.PrefDifficulty = difficulty_filter
	slot7 = self
	slot4.PlayerLevel = self._get_smartmatch_player_level(slot6)
	self._hopper_variables = slot4
	local clbk_params = {}
	slot7 = self
	clbk_params.cancel_id = self.add_cancelable_callback(slot6)
	slot10 = clbk_params
	local progress_clbk = callback(slot6, self, self, "clbk_create_client_lobby")
	slot11 = progress_clbk
	local status = XboxLive.create_session(self, XboxLive, "smartmatch_host_game_v1", false)
	slot10 = status

	print(XboxLive, " [NetworkMatchMakingXBL:join_by_smartmatch] create_session status")

	if not status then
		slot9 = " failed to create session"

		print(slot8)

		slot9 = managers.menu

		managers.menu.show_failed_joining_dialog(slot8)

		slot9 = self

		self.leave_game(slot8)

		return 
	end

	return 
end
NetworkMatchMakingXBL.join_by_smartmatch = function (self, job_id_filter, difficulty_filter)
	slot8 = difficulty_filter

	print(slot4, "[NetworkMatchMakingXBL:join_by_smartmatch] job_id_filter", job_id_filter, "difficulty_filter")

	if self._join_smartmatch then
		return 
	end

	if not self._queued_join_by_smartmatch then
		local dialog_params = {}
		slot8 = "clbk_btn_cancel_match"
		dialog_params.cancel_func = callback(slot5, self, self)
		slot7 = dialog_params

		managers.menu.show_searching_match_dialog(slot5, managers.menu)
	end

	self._queued_join_by_smartmatch = {
		job_id_filter = job_id_filter,
		difficulty_filter = difficulty_filter
	}

	return true
end
NetworkMatchMakingXBL.clbk_btn_cancel_match = function (self)
	slot3 = "[NetworkMatchMakingXBL:clbk_btn_cancel_match]"

	print(slot2)

	self._join_smartmatch = nil
	self._queued_join_by_smartmatch = nil
	slot3 = TimerManager
	slot3 = TimerManager.wall(slot2)
	self._last_join_smartmatch_cancel_t = TimerManager.wall(slot2).time(slot2)
	slot3 = self

	self.leave_game(slot2)

	return 
end
NetworkMatchMakingXBL.clbk_create_client_lobby = function (self, params, session)
	slot6 = session

	print(slot4, "[NetworkMatchMakingXBL:clbk_create_client_lobby] session")

	if not self._join_smartmatch then
		slot5 = self

		self.leave_game(slot4)

		return 
	end

	if not session then
		slot5 = self

		self.leave_game(slot4)

		slot5 = managers.menu

		managers.menu.show_failed_joining_dialog(slot4)

		return 
	end

	self._session = session
	local smartmatch_params = {
		become_host = false,
		timeout = self.SMARTMATCH_CLIENT_TIMEOUT_T,
		hopper_name = (self._smartmatch_search_inexact and "hopper_match_game_any_v1") or "hopper_match_game_strict_v1"
	}
	slot9 = {
		cancel_id = self.add_cancelable_callback(slot11),
		smartmatch_params = smartmatch_params
	}
	slot12 = self
	local progress_callback = callback(slot5, self, self, "clbk_smartmatch_client")
	slot9 = progress_callback
	local status = self._begin_smartmatch(self, self, smartmatch_params)

	if not status then
		slot8 = " smartmatch failed to start"

		print(slot7)

		slot8 = managers.menu

		managers.menu.show_failed_joining_dialog(slot7)

		slot8 = self

		self.leave_game(slot7)

		return 
	end

	return 
end
NetworkMatchMakingXBL.clbk_join_session_result = function (self, status)
	slot7 = status

	print(slot3, "[NetworkMatchMakingXBL:clbk_join_session_result] self._session", self._session, "status")

	slot5 = "join_server"

	managers.system_menu.close(slot3, managers.system_menu)

	slot5 = "search_match"

	managers.system_menu.close(slot3, managers.system_menu)

	if status == "search_failed" then
		slot4 = self

		self.leave_game(slot3)

		slot4 = managers.menu

		managers.menu.show_smartmatch_contract_not_found_dialog(slot3)

		return 
	elseif status == "p2p_error" then
		slot4 = self

		self.leave_game(slot3)

		slot4 = managers.menu

		managers.menu.show_failed_joining_dialog(slot3)

		return 
	elseif not status then
		slot4 = self._session
		local is_full = self.OPEN_SLOTS <= self._session.nr_members(slot3)
		slot5 = self

		self.leave_game(slot4)

		if is_full then
			slot5 = managers.menu

			managers.menu.show_game_is_full(slot4)
		else
			slot5 = managers.menu

			managers.menu.show_failed_joining_dialog(slot4)
		end

		return 
	end

	slot7 = self._session
	slot7 = "TCP_IP"
	self._server_rpc = Network.handshake(slot3, Network, self._session.ip(slot6), managers.network.DEFAULT_PORT)
	slot2 = print
	slot4 = " Server RPC:"

	if self._server_rpc then
		slot8 = 0
		slot5 = self._server_rpc.ip_at_index(slot6, self._server_rpc)
	end

	slot2(slot3, slot4)

	if not self._server_rpc then
		slot4 = self

		self.leave_game(slot3)

		slot4 = managers.menu

		managers.menu.show_failed_joining_dialog(slot3)

		return 
	end

	self._players = {}
	slot5 = false

	self._is_server(slot3, self)

	slot5 = true

	self._is_client(slot3, self)

	slot4 = managers.network.voice_chat

	managers.network.voice_chat.open_session(slot3)

	slot4 = managers.network

	managers.network.start_client(slot3)

	slot5 = {
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

	managers.menu.show_waiting_for_server_response(slot3, managers.menu)

	local function joined_game(res, level_index, difficulty_index, state_index)
		slot7 = "waiting_for_server_response"

		managers.system_menu.close(slot5, managers.system_menu)

		slot13 = state_index

		print(slot5, "[NetworkMatchMakingXBL:clbk_join_session_result:joined_game] res", res, "level_index", level_index, "difficulty_index", difficulty_index, "state_index")

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
		elseif res == "FAILED_CONNECT" or res == "AUTH_FAILED" or res == "AUTH_HOST_FAILED" then
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
		else
			slot8 = res

			Application.error(slot5, Application, "[NetworkMatchMakingXBL:join_server] FAILED TO START MULTIPLAYER!")
		end

		return 
	end

	slot7 = joined_game

	managers.network.join_game_at_host_rpc(managers.menu, managers.network, self._server_rpc)

	return 
end
NetworkMatchMakingXBL.join_server = function (self, session_id, server, skip_showing_dialog)
	local xs_info = server.info

	if not skip_showing_dialog then
		slot7 = managers.menu

		managers.menu.show_joining_lobby_dialog(slot6)
	end

	local player_index = managers.user.get_platform_id(slot6)
	slot9 = xs_info
	slot12 = xs_info

	print(managers.user, "[NetworkMatchMakingXBL:join_server]", xs_info.id(slot11))

	if self._session then
		slot10 = player_index

		XboxLive.leave_local(slot7, XboxLive, self._session)

		slot9 = self._session

		XboxLive.delete_session(slot7, XboxLive)
	end

	slot10 = "STANDARD"

	XboxLive.set_context(slot7, XboxLive, "GAME_TYPE")

	slot10 = "ONLINE"

	XboxLive.set_context(slot7, XboxLive, "game_mode")

	local permission = (0 < server.open_private_slots and "private") or "public"
	local pub_slots = self.OPEN_SLOTS
	local priv_slots = 0
	self._private = false

	if permission == "private" then
		pub_slots = 0
		priv_slots = self.OPEN_SLOTS
		self._private = true
	end

	slot16 = xs_info
	self._session = XboxLive.create_session_object_from_info(slot10, XboxLive, "live_multiplayer_standard", player_index, pub_slots, priv_slots)
	local result = "success"

	if not self._session then
		slot12 = " [NetworkMatchMakingXBL:join_server] FAILED TO CREATE CLIENT SESSION"

		print(slot11)

		result = "failed"
	end

	slot15 = self._private
	slot20 = "clbk_join_session_result"

	if not XboxLive.join_local(slot11, XboxLive, self._session, player_index, callback(slot17, self, self)) then
		slot12 = self

		self.leave_game(slot11)

		slot12 = managers.menu

		managers.menu.show_failed_joining_dialog(slot11)

		slot12 = self
		slot15 = self

		self.search_lobby(slot11, self.search_friends_only(slot14))
	end

	return 
end
NetworkMatchMakingXBL.send_join_invite = function (self, friend)
	return 
end
NetworkMatchMakingXBL.set_server_attributes = function (self, settings)
	slot5 = settings

	self.set_attributes(slot3, self)

	if self._session then
		slot5 = self._session

		XboxLive.modify_session(slot3, XboxLive)
	end

	return 
end
NetworkMatchMakingXBL.create_lobby = function (self, settings)
	local attributes_numbers = settings.numbers
	self._num_players = nil
	slot6 = true

	self.set_server_joinable(slot4, self)

	slot5 = "[NetworkMatchMakingXBL:create_lobby]"
	slot8 = settings

	print(slot4, inspect(slot7))

	settings.numbers[4] = 1
	slot6 = settings

	self.set_attributes(1, self)

	slot5 = managers.user
	local player_index = managers.user.get_platform_id(1)
	local gt = "STANDARD"
	local gm = "ONLINE"
	slot10 = gt

	XboxLive.set_context(slot7, XboxLive, "GAME_TYPE")

	slot10 = gm

	XboxLive.set_context(slot7, XboxLive, "game_mode")

	if self._session then
		slot8 = self._session

		if self._session.state(slot7) == "started" then
			slot10 = player_index

			XboxLive.leave_local(slot7, XboxLive, self._session)

			function slot10()
				slot2 = "DELETED SESSION"

				print(slot1)

				return 
			end

			XboxLive.delete_session(slot7, XboxLive, self._session)
		end
	end

	slot9 = attributes_numbers[3]
	local permission = tweak_data.index_to_permission(slot7, tweak_data)
	local pub_slots = self.OPEN_SLOTS
	local priv_slots = 0
	self._private = false

	if permission == "private" then
		pub_slots = 0
		priv_slots = self.OPEN_SLOTS
		self._private = true
	end

	local dialog_data = {}
	slot13 = "dialog_creating_lobby_title"
	dialog_data.title = managers.localization.text(slot11, managers.localization)
	slot13 = "dialog_wait"
	dialog_data.text = managers.localization.text(slot11, managers.localization)
	dialog_data.id = "create_lobby"
	dialog_data.no_buttons = true
	slot13 = dialog_data

	managers.system_menu.show(slot11, managers.system_menu)

	slot12 = self

	if self.is_host_lobby_public(slot11) then
		slot15 = tweak_data.operations
		slot18 = managers.raid_job
		slot13 = self
		self._hopper_variables = {
			NrHosts = 1,
			NrClients = 0,
			PrefMission = tostring(tweak_data.operations.get_index_from_raid_id(Global.game_settings.difficulty, managers.raid_job.current_job_id(slot17))),
			PrefDifficulty = tweak_data.difficulty_to_index(slot12, tweak_data),
			PlayerLevel = self._get_smartmatch_player_level(slot12)
		}
	end

	slot14 = true
	slot20 = {
		cancel_id = self.add_cancelable_callback(slot22),
		settings = settings
	}
	slot23 = self
	local success = XboxLive.create_session(slot11, XboxLive, "smartmatch_host_game_v1", callback(slot16, self, self, "_create_lobby_callback"))
	slot14 = success

	print(XboxLive, "[NetworkMatchMakingXBL:create_lobby] create_session result")

	return 
end
NetworkMatchMakingXBL._create_lobby_failed = function (self)
	slot3 = self

	self._create_lobby_done(slot2)

	local title = managers.localization.text(slot2, managers.localization)
	local dialog_data = {
		title = title,
		text = managers.localization.text("dialog_error_title", managers.localization)
	}
	slot8 = "dialog_ok"
	dialog_data.button_list = {
		{
			text = managers.localization.text("dialog_err_failed_creating_lobby", managers.localization)
		}
	}
	slot6 = dialog_data

	managers.system_menu.show(, managers.system_menu)

	return 
end
NetworkMatchMakingXBL._create_lobby_done = function (self)
	self._creating_lobby = nil
	slot4 = "create_lobby"

	managers.system_menu.close(slot2, managers.system_menu)

	return 
end
NetworkMatchMakingXBL.clbk_smartmatch_host = function (self, params, session, smartmatch_status)
	slot9 = params
	slot11 = smartmatch_status

	print(slot5, "[NetworkMatchMakingXBL:clbk_smartmatch_host] params\n", inspect(slot8), "session", session, "status:")

	return 
end
NetworkMatchMakingXBL._begin_smartmatch = function (self, params, progress_clbk)
	slot5 = "[NetworkMatchMakingXBL:_begin_smartmatch] self._hopper_variables"
	slot8 = self._hopper_variables

	print(slot4, inspect(slot7))

	slot11 = self._hopper_variables
	local status = XboxLive.begin_smartmatch(slot4, XboxLive, self._session, progress_clbk, params.timeout, params.hopper_name, params.become_host)

	if not status then
		slot7 = status

		print(slot5, "[NetworkMatchMakingXBL:_begin_smartmatch] smartmatch failed to start")
	end

	return status
end
NetworkMatchMakingXBL._create_lobby_callback = function (self, params, session)
	slot6 = params.cancel_id

	if self.check_callback_canceled(slot4, self) then
		slot6 = "create_server canceled"

		cat_print(slot4, "lobby")

		return 
	end

	slot5 = "[NetworkMatchMakingXBL:_create_lobby_callback]"
	slot8 = params.settings

	print(slot4, inspect(slot7))

	if not session then
		slot5 = " CREATE SESSION FAILED"

		print(slot4)

		slot5 = self

		self._create_lobby_failed(slot4)

		return 
	end

	slot5 = self._session

	if alive(slot4) then
		slot9 = self._session
		slot11 = self._session

		cat_print(slot4, "lobby", "Trying to remove self._session", self._session.id("in state"), self._session.state(slot10))

		slot5 = "lobby"

		cat_stack_dump(slot4)
	end

	self._session = session
	slot5 = " Created mm session "
	slot8 = self._session

	print(slot4, self._session.id(slot7))

	self._trytime = nil
	self._players = {}
	self._server_rpc = nil
	slot6 = true

	self._is_server(slot4, self)

	slot6 = false

	self._is_client(slot4, self)

	slot5 = managers.network.voice_chat

	managers.network.voice_chat.open_session(slot4)

	slot5 = self

	self._create_lobby_done(slot4)

	slot5 = managers.menu

	managers.menu.created_lobby(slot4)

	return 
end
NetworkMatchMakingXBL.clbk_smartmatch_client_inexact_join_yes = function (self)
	slot4 = true

	self.clbk_join_session_result(slot2, self)

	return 
end
NetworkMatchMakingXBL.clbk_smartmatch_client_inexact_join_no = function (self)
	slot4 = "join_server"

	managers.system_menu.close(slot2, managers.system_menu)

	slot4 = "search_match"

	managers.system_menu.close(slot2, managers.system_menu)

	slot3 = self

	self.leave_game(slot2)

	return 
end
NetworkMatchMakingXBL.clbk_smartmatch_client = function (self, params, session, smartmatch_status)
	slot9 = params
	slot11 = smartmatch_status

	print(slot5, "[NetworkMatchMakingXBL:clbk_smartmatch_client] params", inspect(slot8), "session", session, "status:")

	slot7 = params.cancel_id

	if self.check_callback_canceled(slot5, self) then
		slot7 = "smartmatch was canceled"

		cat_print(slot5, "lobby")

		return 
	end

	if self._server_rpc then
		return 
	end

	if self._join_smartmatch ~= "search" then
		return 
	end

	if smartmatch_status == "found" then
		slot6 = "[NetworkMatchMakingXBL:clbk_smartmatch_client] " .. ((self._smartmatch_search_inexact and "result any") or "result strict")

		print(slot5)

		local pref_mission = self._hopper_variables.PrefMission
		local pref_difficulty = self._hopper_variables.PrefDifficulty
		slot10 = "NUMBER"
		local session_mission_nr = session.get_property((self._smartmatch_search_inexact and "result any") or "result strict", session, "LEVELINDEX")

		if not session_mission_nr then
			slot9 = " broken session_mission_nr"

			print(slot8)

			self._session = session
			slot10 = false

			self.clbk_join_session_result(slot8, self)

			self._session = nil

			return 
		end

		slot9 = session_mission_nr / 1000
		session_mission_nr = math.floor(slot8)
		local session_mission = tostring(slot8)
		slot12 = "NUMBER"
		local session_difficulty = session.get_property(session_mission_nr, session, "DIFFICULTY")

		if not session_difficulty then
			slot11 = " broken session_difficulty"

			print(slot10)

			self._session = session
			slot12 = false

			self.clbk_join_session_result(slot10, self)

			self._session = nil

			return 
		end

		self._session = session
		slot14 = pref_difficulty

		print(slot10, "requested: pref_mission", pref_mission, "pref_difficulty")

		slot14 = session_difficulty

		print(slot10, "found: session_mission", session_mission, "session_difficulty")

		local is_inexact_match = nil

		if pref_mission == "-1" then
		elseif not is_inexact_match then
			if pref_mission ~= session_mission then
				is_inexact_match = true
				slot12 = " mission mismatch"

				print(slot11)
			elseif pref_difficulty ~= session_difficulty then
				is_inexact_match = true
				slot12 = " difficulty mismatch"

				print(slot11)
			end
		end

		if is_inexact_match then
			slot12 = " inexact match"

			print(slot11)

			slot13 = "search_match"

			managers.system_menu.close(slot11, managers.system_menu)

			self._join_smartmatch = "confirm_inexact"
			local params = {}
			slot15 = "clbk_smartmatch_client_inexact_join_yes"
			params.yes_clbk = callback(managers.system_menu, self, self)
			slot15 = "clbk_smartmatch_client_inexact_join_no"
			params.no_clbk = callback(managers.system_menu, self, self)
			slot15 = "clbk_smartmatch_client_inexact_join_no"
			params.timeout_clbk = callback(managers.system_menu, self, self)
			params.timeout = self.INEXACT_MATCH_CONFIRM_TIMEOUT
			slot15 = "STRING"
			params.host_name = session.get_property(managers.system_menu, session, "GAMERHOSTNAME")
			slot18 = session_mission_nr
			slot14 = tweak_data.operations.missions[tweak_data.operations.get_raid_name_from_index(slot16, tweak_data.operations)].name_id
			params.job_name = managers.localization.text(managers.system_menu, managers.localization)
			slot14 = tweak_data.difficulty_name_ids[tweak_data.difficulties[session_difficulty]]
			params.difficulty = managers.localization.text(managers.system_menu, managers.localization)
			slot14 = params

			managers.menu.show_smartmatch_inexact_match_dialog(managers.system_menu, managers.menu)
		else
			slot13 = true

			self.clbk_join_session_result(slot11, self)
		end
	elseif smartmatch_status == "failed" then
		local searching_again = nil

		if not self._smartmatch_search_inexact and self.SMARTMATCH_STRICT then
			slot7 = " searching inexact"

			print(slot6)

			slot8 = "search_match"
			local dialog = managers.system_menu.get_dialog(slot6, managers.system_menu)
			slot11 = "dialog_wait"
			local new_text = managers.localization.text(managers.system_menu, managers.localization) .. " " .. managers.localization.text("dialog_exact_match_not_found", managers.localization)
			slot11 = true

			dialog.set_text(managers.localization.text("dialog_exact_match_not_found", managers.localization), dialog, new_text)

			self._smartmatch_search_inexact = true
			local smartmatch_params = {
				hopper_name = "hopper_match_game_any_v1",
				become_host = false,
				timeout = self.SMARTMATCH_CLIENT_TIMEOUT_T2
			}
			slot13 = {
				cancel_id = self.add_cancelable_callback(slot15),
				smartmatch_params = smartmatch_params
			}
			slot16 = self
			local progress_callback = callback(dialog, self, self, "clbk_smartmatch_client")
			slot13 = progress_callback
			local status = self._begin_smartmatch(self, self, smartmatch_params)

			if status then
				searching_again = true
			else
				slot12 = " non-strict smartmatch failed to start"

				print(slot11)
			end
		end

		if not searching_again then
			self._session = session
			slot8 = "search_failed"

			self.clbk_join_session_result(slot6, self)

			self._session = nil
		end
	elseif smartmatch_status == "error" then
		self._session = session
		slot7 = "search_failed"

		self.clbk_join_session_result(slot5, self)

		self._session = nil
	elseif smartmatch_status == "p2p_error" then
		self._session = session
		slot7 = smartmatch_status

		self.clbk_join_session_result(slot5, self)

		self._session = nil
	end

	return 
end
NetworkMatchMakingXBL.set_num_players = function (self, num)
	slot5 = num

	print(slot3, "NetworkMatchMakingXBL:set_num_players")

	local player_index = managers.user.get_platform_id(slot3)
	self._num_players = num
	slot7 = self._num_players

	XboxLive.set_property(managers.user, XboxLive, "NUMPLAYERS")

	return 
end
NetworkMatchMakingXBL.set_server_state = function (self, state)
	local player_index = managers.user.get_platform_id(slot3)
	slot6 = state
	local state_id = tweak_data.server_state_to_index(managers.user, tweak_data)
	slot8 = state_id

	XboxLive.set_property(tweak_data, XboxLive, "SERVERSTATE")

	return 
end
NetworkMatchMakingXBL.set_server_joinable = function (self, state)
	slot5 = state

	print(slot3, "[NetworkMatchMakingXBL:set_server_joinable]")

	slot4 = Application

	Application.stack_dump(slot3)

	self._server_joinable_state = state

	if self._session then
		slot6 = state and true

		XboxLive.set_joinable(slot3, XboxLive, self._session)
	end

	return 
end
NetworkMatchMakingXBL.is_server_joinable = function (self)
	if self._server_joinable_state then
		slot4 = self._session
		slot1 = XboxLive.is_joinable(slot2, XboxLive)
	end

	return slot1
end
NetworkMatchMakingXBL.server_state_name = function (self)
	return 
end
NetworkMatchMakingXBL.on_peer_added = function (self, peer)

	-- Decompilation error in this vicinity:
	slot8 = peer
	slot8 = self._private

	print(slot3, "NetworkMatchMakingXBL:on_peer_added", peer.id(slot6), peer.xuid(peer), self._session)

	slot4 = managers.network

	if not self._session then
		slot5 = "NetworkMatchMakingXBL:on_peer_added, had no session!"

		Application.error(slot3, Application)

		return 
	end

	slot3 = peer.id(slot4)
	slot6 = peer
	self._players[slot3] = peer.xuid(peer)
	slot5 = self._session

	XboxLive.set_up_p2p_in_session(slot3, XboxLive)

	slot5 = "XB1"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		slot4 = peer

		if not peer.xnaddr(slot3) then
			return 
		end
	end

	slot8 = peer
	slot7 = self._private or false

	XboxLive.join_remote(slot3, XboxLive, self._session, peer.xuid(slot7))

	local player_info = {}
	slot5 = peer
	player_info.name = peer.name(XboxLive)
	slot5 = peer
	player_info.player_id = peer.xuid(XboxLive)
	slot5 = peer
	player_info.external_address = peer.xnaddr(XboxLive)
	slot7 = "game"

	managers.network.voice_chat.open_channel_to(XboxLive, managers.network.voice_chat, player_info)

	return 
end
NetworkMatchMakingXBL.on_peer_removed = function (self, peer)
	slot8 = peer
	slot7 = self._session

	print(slot3, "NetworkMatchMakingXBL:on_peer_removed", peer.id(peer), peer.xuid(peer))

	if type(peer.xuid(peer.id(peer))) == "string" then
		slot4 = "  Dont remove peer with empty string"

		print(slot3)

		return 
	end

	if not self._session then
		slot5 = "NetworkMatchMakingXBL:on_peer_removed, had no session!"

		Application.error(slot3, Application)

		return 
	end

	slot5 = peer
	self._players[peer.id(slot4)] = nil
	slot5 = self._session
	slot8 = peer

	XboxLive.leave_remote(peer.id(slot4), XboxLive, peer.xuid(slot7))

	local player_info = {}
	slot5 = peer
	player_info.name = peer.name(XboxLive)
	slot5 = peer
	player_info.player_id = peer.xuid(XboxLive)
	slot6 = player_info

	managers.network.voice_chat.close_channel_to(XboxLive, managers.network.voice_chat)

	return 
end
NetworkMatchMakingXBL.is_host_lobby_public = function (self)
	return self._host_session_attributes and self._host_session_attributes.numbers[3] == 1
end
NetworkMatchMakingXBL.set_attributes = function (self, settings)
	local player_index = managers.user.get_platform_id(slot3)
	slot7 = settings.numbers[1]

	XboxLive.set_property(managers.user, XboxLive, "LEVELINDEX")

	slot7 = settings.numbers[2]

	XboxLive.set_property(managers.user, XboxLive, "DIFFICULTY")

	slot7 = settings.numbers[3]

	XboxLive.set_property(managers.user, XboxLive, "PERMISSION")

	slot5 = XboxLive
	slot3 = XboxLive.set_property
	slot6 = "SERVERSTATE"

	if not settings.numbers[4] then
		slot10 = "SERVERSTATE"
		slot7 = XboxLive.get_property(slot8, XboxLive)
	end

	slot3(slot4, slot5, slot6)

	slot7 = self._num_players or 1

	XboxLive.set_property(slot4, XboxLive, "NUMPLAYERS")

	slot7 = settings.numbers[6]

	XboxLive.set_property(slot4, XboxLive, "ALLOWDROPIN")

	slot7 = settings.numbers[7]

	XboxLive.set_property(slot4, XboxLive, "MINLEVEL")

	slot7 = self.GAMEVERSION

	XboxLive.set_property(slot4, XboxLive, "GAMEVERSION")

	self._host_session_attributes = settings

	return 
end
NetworkMatchMakingXBL._server_to_numbers = function (self, server)
	local properties = server.properties
	slot6 = properties.LEVELINDEX
	slot6 = properties.DIFFICULTY
	slot6 = properties.PERMISSION
	slot6 = properties.SERVERSTATE
	slot6 = properties.NUMPLAYERS
	slot6 = properties.ALLOWDROPIN
	slot6 = properties.MINLEVEL

	return {
		tonumber(slot5),
		tonumber(slot5),
		tonumber(slot5),
		tonumber(slot5),
		tonumber(slot5),
		tonumber(slot5),
		tonumber(slot5)
	}
end
NetworkMatchMakingXBL.external_address = function (self, rpc)
	if not self._session then
		slot5 = "NetworkMatchMakingXBL:translate_to_xnaddr, had no session!"

		Application.error(slot3, Application)

		return ""
	end

	slot5 = rpc

	return XboxLive.external_address(slot3, XboxLive)
end
NetworkMatchMakingXBL.internal_address = function (self, xuid)
	if not self._session then
		slot5 = "NetworkMatchMakingXBL:internal_address, had no session!"

		Application.error(slot3, Application)

		slot5 = "error"

		Application.stack_dump(slot3, Application)

		return 
	end

	slot6 = xuid
	local address = XboxLive.internal_address(slot3, XboxLive, self._session)
	slot7 = address

	print(XboxLive, "[NetworkMatchMakingXBL:internal_address] xuid", xuid)

	slot5 = Application

	Application.stack_dump(XboxLive)

	return address
end
NetworkMatchMakingXBL.from_host_lobby_re_opened = function (self, status)
	slot6 = status

	print(slot3, "[NetworkMatchMakingXBL::from_host_lobby_re_opened]", self._try_re_enter_lobby)

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
NetworkMatchMakingXBL._test_search = function (self, settings)
	slot4 = managers.user
	local player_index = managers.user.get_platform_id(slot3)
	local prop = {
		MINLEVEL = managers.experience.current_level(slot5)
	}
	local con = {
		GAME_TYPE = settings.game_type,
		game_mode = settings.game_mode
	}
	slot12 = con
	slot17 = "_find_test_server_callback"
	slot20 = self

	XboxLive.search_session(managers.experience, XboxLive, "Find Matches", player_index, 25, prop, callback(slot14, self, self, self.add_cancelable_callback(slot19)))

	return 
end
NetworkMatchMakingXBL._find_test_server_callback = function (self, cancel_id, servers, mode)
	slot7 = cancel_id

	if self.check_callback_canceled(slot5, self) then
		return 
	end

	self._last_mode = mode
	slot7 = mode
	slot10 = servers

	print(slot5, "_find_test_server_callback", inspect(slot9))

	if not servers then
		slot6 = "SEaRCH FAILED"

		print(slot5)

		return 
	end

	self._test_servers = {}
	slot6 = servers

	for _, server in ipairs(slot5) do
		self._test_server = server

		table.insert(slot10, self._test_servers)

		slot13 = server

		print(inspect(server))
	end

	slot6 = managers.user
	local player_index = managers.user.get_platform_id(slot5)

	return 
end
NetworkMatchMakingXBL._test_join = function (self, xs_info, skip_showing_dialog)
	xs_info = xs_info or self._test_server.info
	local player_index = managers.user.get_platform_id(slot4)
	slot7 = xs_info

	print(managers.user, "_test_join")

	if self._session then
		slot8 = player_index

		XboxLive.leave_local(slot5, XboxLive, self._session)

		slot7 = self._session

		XboxLive.delete_session(slot5, XboxLive)
	end

	slot11 = xs_info
	self._session = XboxLive.create_session_object_from_info(slot5, XboxLive, "live_multiplayer_standard", player_index, 4, 0)

	if not self._session then
		slot6 = "FAILED CREATE CLIENT SESSION"

		print(slot5)

		return 
	end

	slot9 = true

	if not XboxLive.join_local(slot5, XboxLive, self._session, player_index) then
		return 
	end

	slot7 = self._session

	print(slot5, "self._session")

	local result = "failed"
	slot7 = "[NetworkMatchMakingXBL:join_server:f]"

	print("self._session")

	slot8 = "join_server"

	managers.system_menu.close("self._session", managers.system_menu)

	if result == "success" then
		slot7 = "Success!"

		print(slot6)

		slot8 = self._session.ip(slot9)
		slot11 = self._session

		print(slot6, "[NetworkMatchMakingXBL:join_server] server details", self._session.id(self._session))

		slot7 = "Gonna handshake now!"

		print(slot6)

		slot10 = self._session
		slot10 = "TCP_IP"
		self._server_rpc = Network.handshake(slot6, Network, self._session.ip(self._session.id), nil)
		slot7 = "Handshook!"

		print(slot6)

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

		slot7 = managers.network

		managers.network.start_client(slot6)

		slot8 = {
			cancel_func = function ()
				slot2 = managers.network
				slot2 = managers.network.session(slot1)

				managers.network.session(slot1).on_join_request_cancelled(slot1)

				return 
			end
		}

		managers.menu.show_waiting_for_server_response(slot6, managers.menu)

		local function joined_game(res, level_index, difficulty_index, state_index)
			slot7 = "waiting_for_server_response"

			managers.system_menu.close(slot5, managers.system_menu)

			slot10 = state_index

			print(slot5, "[NetworkMatchMakingXBL:join_server:joined_game]", res, level_index, difficulty_index)

			if res == "JOINED_LOBBY" then
				if managers.groupai then
					slot6 = managers.groupai

					managers.groupai.kill_all_AI(slot5)
				end

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.open_session(slot5)

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
			elseif res == "FAILED_CONNECT" or res == "AUTH_FAILED" or res == "AUTH_HOST_FAILED" then
				slot6 = managers.network.matchmake

				managers.network.matchmake.leave_game(slot5)

				slot6 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot5)

				slot6 = managers.network

				managers.network.queue_stop_network(slot5)

				slot6 = managers.menu

				managers.menu.show_failed_joining_dialog(slot5)
			else
				slot8 = res

				Application.error(slot5, Application, "[NetworkMatchMakingXBL:join_server] FAILED TO START MULTIPLAYER!")
			end

			return 
		end

		slot10 = joined_game

		managers.network.join_game_at_host_rpc(managers.menu, managers.network, self._server_rpc)
	else
		slot7 = managers.menu

		managers.menu.show_failed_joining_dialog(slot6)

		slot7 = self
		slot10 = self

		self.search_lobby(slot6, self.search_friends_only(slot9))
	end

	return 
end
NetworkMatchMakingXBL._join_server_callback = function (self)
	return 
end
NetworkMatchMakingXBL._get_smartmatch_player_level = function (self)
	slot5 = managers.experience
	slot3 = managers.experience.current_level(slot4) / 20

	return math.floor(slot2)
end
NetworkMatchMakingXBL._test_create = function (self, settings)
	slot4 = "settings\n"
	slot7 = settings

	print(slot3, inspect(slot6))

	if settings == nil then
	end

	local gt = settings.game_type
	local gm = settings.game_mode
	local skl = settings.skill
	local player_index = managers.user.get_platform_id(slot6)
	slot10 = gt

	XboxLive.set_context(managers.user, XboxLive, "GAME_TYPE")

	slot10 = gm

	XboxLive.set_context(managers.user, XboxLive, "game_mode")

	if self._session then
		slot8 = self._session

		if self._session.state(slot7) == "started" then
			slot10 = player_index

			XboxLive.leave_local(slot7, XboxLive, self._session)

			function slot10()
				slot2 = "DELETED SESSION"

				print(slot1)

				return 
			end

			XboxLive.delete_session(slot7, XboxLive, self._session)
		end
	end

	local create_prop = {
		"group_lobby"
	}

	if self._uses_arbitration == true then
		slot10 = "uses_arbitration"

		table.insert(slot8, create_prop)
	end

	local pub_slots = self.OPEN_SLOTS
	local priv_slots = 0
	slot11 = "creating session\n"
	slot14 = create_prop

	print(slot10, inspect(slot13))

	slot15 = priv_slots
	slot20 = "_create_server_callback"
	slot23 = self
	local session = XboxLive.create_session(slot10, XboxLive, "live_multiplayer_standard", player_index, pub_slots, callback(slot17, self, self, self.add_cancelable_callback(slot22)))
	slot13 = session

	print(XboxLive, "create return value")

	return 
end
NetworkMatchMakingXBL._create_server_callback = function (self, cancel_id, session)
	slot6 = cancel_id

	if self.check_callback_canceled(slot4, self) then
		slot6 = "create_server canceled"

		cat_print(slot4, "lobby")

		return 
	end

	slot5 = "NetworkMatchMakingXBL:_create_server_callback"

	print(slot4)

	slot5 = managers.user
	local player_index = managers.user.get_platform_id(slot4)

	if not session then
		slot6 = "CREATE SESSION FAILED"

		print(slot5)

		return 
	end

	slot9 = self._private

	if not XboxLive.join_local(slot5, XboxLive, session, player_index) then
		return 
	end

	slot6 = self._session

	if alive(slot5) then
		slot10 = self._session
		slot12 = self._session

		cat_print(slot5, "lobby", "Trying to remove self._session", self._session.id("in state"), self._session.state(slot11))

		slot6 = "lobby"

		cat_stack_dump(slot5)
	end

	self._session = session
	slot6 = " Created mm session "
	slot9 = self._session

	print(slot5, self._session.id(slot8))

	self._players = {}
	self._server_rpc = nil

	return 
end
NetworkMatchMakingXBL._is_server = function (self, set)
	if set == true or set == false then
		self._is_server_var = set
	else
		return self._is_server_var
	end

	return 
end
NetworkMatchMakingXBL._is_client = function (self, set)
	if set == true or set == false then
		self._is_client_var = set
	else
		return self._is_client_var
	end

	return 
end

return 
