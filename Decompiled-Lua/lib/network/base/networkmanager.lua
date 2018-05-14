-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.

-- Decompilation error in this vicinity:
slot2 = "lib/network/base/BaseNetworkSession"

require(slot1)

slot2 = "lib/network/base/ClientNetworkSession"

require(slot1)

slot2 = "lib/network/base/HostNetworkSession"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkAccount"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkAccountPSN"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkAccountSTEAM"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkAccountSTEAMDebug"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkAccountXBL"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkFriend"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkFriendsPSN"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkFriendsXBL"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkGenericPSN"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkGroupLobby"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkGroupLobbyPSN"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkMatchMaking"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkMatchMakingPSN"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkMatchMakingSTEAM"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkMatchMakingXBL"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkVoiceChatDisabled"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkVoiceChatPSN"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkVoiceChatSTEAM"

require(slot1)

slot2 = "lib/network/matchmaking/NetworkVoiceChatXBL"

require(slot1)

slot2 = "lib/network/base/NetworkPeer"

require(slot1)

slot2 = "lib/network/base/handlers/BaseNetworkHandler"

require(slot1)

slot2 = "lib/network/base/handlers/DefaultNetworkHandler"

require(slot1)

slot2 = "lib/network/base/handlers/ConnectionNetworkHandler"

require(slot1)

slot2 = "lib/network/base/handlers/PacketNetworkHandler"

require(slot1)

slot2 = "lib/network/handlers/UnitNetworkHandler"

require(slot1)

slot2 = "lib/units/beings/player/PlayerDamage"

require(slot1)

slot2 = "lib/units/beings/player/PlayerMovement"

require(slot1)

NetworkManager = NetworkManager or class()
slot3 = "X360"

if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
	NetworkManager.DEFAULT_PORT = 1000
else
	slot3 = "XB1"

	if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
		NetworkManager.DEFAULT_PORT = 43210
	else
		slot3 = "PS4"

		if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
			NetworkManager.DEFAULT_PORT = 22222
		else
			NetworkManager.DEFAULT_PORT = 9899
		end
	end
end

NetworkManager.DROPIN_ENABLED = true
slot3 = "X360"
NetworkManager.init = function (self)
	self.OVERWRITEABLE_MSGS = {
		set_look_dir = {
			clbk = NetworkManager.clbk_msg_overwrite
		},
		criminal_hurt = {
			clbk = PlayerDamage.clbk_msg_overwrite_criminal_hurt,
			indexes = {}
		},
		suspicion = {
			clbk = PlayerMovement.clbk_msg_overwrite_suspicion,
			indexes = {}
		}
	}
	slot4 = "PS3"

	if SystemInfo.platform() == Idstring(SystemInfo) then
		self._is_ps3 = true
	else
		slot4 = "X360"

		if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
			self._is_x360 = true
		else
			slot4 = "PS4"

			if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
				self._is_ps4 = true
			else
				slot4 = "XB1"

				if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
					self._is_xb1 = true
				else
					self._is_win32 = true
				end
			end
		end
	end

	self._spawn_points = {}

	if self._is_ps3 then
		slot4 = true

		Network.set_use_psn_network(slot2, Network)

		slot3 = PSN

		if #PSN.get_world_list(slot2) == 0 then
			slot3 = PSN

			PSN.init_matchmaking(slot2)
		end

		slot3 = self

		self._register_PSN_matchmaking_callbacks(slot2)
	elseif self._is_ps4 then
		slot4 = true

		Network.set_use_psn_network(slot2, Network)

		slot3 = PSN

		if #PSN.get_world_list(slot2) == 0 then
			slot3 = PSN

			PSN.init_matchmaking(slot2)
		end

		slot3 = self

		self._register_PSN_matchmaking_callbacks(slot2)
	elseif self._is_xb1 then
		slot3 = NetworkAccountXBL
		self.account = NetworkAccountXBL.new(slot2)
		slot3 = NetworkVoiceChatXBL
		self.voice_chat = NetworkVoiceChatXBL.new(slot2)
	elseif self._is_win32 then
		slot4 = "STEAM"

		if SystemInfo.distribution(slot2) == Idstring(SystemInfo) then
			slot3 = NetworkAccountSTEAM
			self.account = NetworkAccountSTEAM.new(slot2)
			slot3 = NetworkVoiceChatSTEAM
			self.voice_chat = NetworkVoiceChatSTEAM.new(slot2)
		else
			slot3 = NetworkAccount
			self.account = NetworkAccount.new(slot2)
			slot3 = NetworkVoiceChatDisabled
			self.voice_chat = NetworkVoiceChatDisabled.new(slot2)
		end
	elseif self._is_x360 then
		slot3 = NetworkAccountXBL
		self.account = NetworkAccountXBL.new(slot2)
		slot3 = NetworkVoiceChatXBL
		self.voice_chat = NetworkVoiceChatXBL.new(slot2)
	end

	self._started = false
	managers.network = self
	slot3 = self

	self._create_lobby(slot2)

	slot3 = self

	self.load(slot2)

	return 
end
NetworkManager.init_finalize = function (self)
	slot3 = "NetworkManager:init_finalize()"

	print(slot2)

	slot3 = Network

	if Network.multiplayer(slot2) then
		slot3 = Application

		if not Application.editor(slot2) then
			slot4 = false

			self._session.on_load_complete(slot2, self._session)

			slot3 = self._session

			if self._session.is_client(slot2) then
				slot3 = self._session

				if not self._session.server_peer(slot2) then
					slot3 = game_state_machine
					slot3 = game_state_machine.current_state(slot2)

					game_state_machine.current_state(slot2).on_server_left(slot2)
				end
			end
		end
	end

	return 
end
NetworkManager._create_lobby = function (self)
	if self._is_win32 then
		slot4 = "Online Lobby is PC"

		cat_print(slot2, "lobby")

		slot4 = "STEAM"

		if SystemInfo.distribution(slot2) == Idstring(SystemInfo) then
			slot3 = NetworkMatchMakingSTEAM
			self.matchmake = NetworkMatchMakingSTEAM.new(slot2)
		else
			slot3 = NetworkMatchMaking
			self.matchmake = NetworkMatchMaking.new(slot2)
		end
	elseif self._is_ps4 then
		slot4 = "Online Lobby is PS4"

		cat_print(slot2, "lobby")

		slot3 = NetworkFriendsPSN
		self.friends = NetworkFriendsPSN.new(slot2)
		slot3 = NetworkGroupLobbyPSN
		self.group = NetworkGroupLobbyPSN.new(slot2)
		slot3 = NetworkMatchMakingPSN
		self.matchmake = NetworkMatchMakingPSN.new(slot2)
		slot3 = NetworkGenericPSN
		self.shared_psn = NetworkGenericPSN.new(slot2)
		self.shared = self.shared_psn
		slot3 = NetworkAccountPSN
		self.account = NetworkAccountPSN.new(slot2)
		self.match = nil
		slot3 = self

		self.ps3_determine_voice(slot2)

		self._shared_update = self.shared_psn
	elseif self._is_xb1 then
		slot3 = NetworkFriendsXBL
		self.friends = NetworkFriendsXBL.new(slot2)
		slot3 = NetworkMatchMakingXBL
		self.matchmake = NetworkMatchMakingXBL.new(slot2)
	elseif self._is_ps3 then
		slot4 = "Online Lobby is PS3"

		cat_print(slot2, "lobby")

		slot3 = NetworkFriendsPSN
		self.friends = NetworkFriendsPSN.new(slot2)
		slot3 = NetworkGroupLobbyPSN
		self.group = NetworkGroupLobbyPSN.new(slot2)
		slot3 = NetworkMatchMakingPSN
		self.matchmake = NetworkMatchMakingPSN.new(slot2)
		slot3 = NetworkGenericPSN
		self.shared_psn = NetworkGenericPSN.new(slot2)
		self.shared = self.shared_psn
		slot3 = NetworkAccountPSN
		self.account = NetworkAccountPSN.new(slot2)
		self.match = nil
		slot3 = "voice chat _create_lobby"

		print(slot2)

		slot3 = self

		self.ps3_determine_voice(slot2)

		self._shared_update = self.shared_psn
	elseif self._is_x360 then
		slot3 = NetworkFriendsXBL
		self.friends = NetworkFriendsXBL.new(slot2)
		slot3 = NetworkMatchMakingXBL
		self.matchmake = NetworkMatchMakingXBL.new(slot2)
	else
		Global._boot_invite_mp = nil
		slot4 = "NetworkManager:create_lobby failed to get a valid lobby for online play."

		Application.error(nil, Application)

		return 
	end

	return 
end
NetworkManager.ps3_determine_voice = function (self, lan)
	local voice = "voice_quiet"

	if lan == true then
		voice = "voice_quiet"
	else
		slot5 = PSN

		if PSN.is_online(slot4) then
			slot5 = PSN

			if PSN.online_chat_allowed(slot4) then
				voice = "voice_psn"
			else
				voice = "voice_disabled"
			end
		end
	end

	if self.voice_chat then
		slot5 = self.voice_chat

		if self.voice_chat.voice_type(slot4) == voice then
			return 
		end
	end

	if self.voice_chat then
		slot5 = self.voice_chat

		if self.voice_chat.voice_type(slot4) ~= voice then
			slot6 = true

			self.voice_chat.close_all(slot4, self.voice_chat)

			self.voice_chat = nil
		end
	end

	if voice == "voice_psn" then
		slot5 = NetworkVoiceChatPSN
		self.voice_chat = NetworkVoiceChatPSN.new(slot4)
	elseif voice == "voice_disabled" then
		slot5 = NetworkVoiceChatDisabled
		self.voice_chat = NetworkVoiceChatDisabled.new(slot4)
	else
		slot6 = true
		self.voice_chat = NetworkVoiceChatDisabled.new(slot4, NetworkVoiceChatDisabled)
	end

	return 
end
NetworkManager.session = function (self)
	return self._session
end
NetworkManager.shared_handler_data = function (self)
	return self._shared_handler_data
end
NetworkManager.load = function (self)
	if Global.network then
		self._network_bound = Global.network.network_bound
		slot3 = self

		self.start_network(slot2)

		if Global.network.session then
			if Global.network.session_host then
				slot3 = HostNetworkSession
				self._session = HostNetworkSession.new(slot2)
				slot4 = false

				self._session.create_local_peer(slot2, self._session)
			else
				slot3 = ClientNetworkSession
				self._session = ClientNetworkSession.new(slot2)
				slot4 = false

				self._session.create_local_peer(slot2, self._session)
			end
		end

		slot4 = Global.network.session

		self._session.load(slot2, self._session)

		slot3 = managers.network.matchmake

		managers.network.matchmake._load_globals(slot2)

		slot3 = managers.network.account

		managers.network.account._load_globals(slot2)

		if self._is_x360 then
			slot3 = managers.network.voice_chat

			managers.network.voice_chat.resume(slot2)
		else
			slot3 = managers.network.voice_chat

			managers.network.voice_chat._load_globals(slot2)
		end

		Global.network = nil

		if self._is_win32 then
			slot3 = managers.network.voice_chat

			managers.network.voice_chat.open(slot2)
		end
	end

	if Network.set_loading_state then
		slot4 = false

		Network.set_loading_state(slot2, Network)
	end

	return 
end
NetworkManager.save = function (self)
	if self._started then
		Global.network = {
			network_bound = self._network_bound
		}

		if self._session then
			slot4 = self._session
			Global.network.session_host = self._session.is_host(slot3)
			Global.network.session = {}
			slot4 = Global.network.session

			self._session.save(, self._session)
		end

		slot3 = managers.network.matchmake

		managers.network.matchmake._save_globals(slot2)

		slot3 = managers.network.account

		managers.network.account._save_globals(slot2)

		slot4 = true

		managers.network.voice_chat._save_globals(slot2, managers.network.voice_chat)

		if self._is_win32 then
			slot3 = managers.network.voice_chat

			managers.network.voice_chat.destroy_voice(slot2)
		end
	end

	return 
end
NetworkManager.update = function (self, t, dt)
	if self._stop_next_frame then
		slot6 = true

		self.stop_network(slot4, self)

		self._stop_next_frame = nil

		return 
	end

	if self._session then
		slot7 = dt

		self._session.update(slot4, self._session, t)
	end

	if self.matchmake then
		slot5 = self.matchmake

		self.matchmake.update(slot4)
	end

	if self.voice_chat then
		slot6 = t

		self.voice_chat.update(slot4, self.voice_chat)
	end

	if self.account then
		slot5 = self.account

		self.account.update(slot4)
	end

	return 
end
NetworkManager.end_update = function (self)
	if self._stop_network then
		self._stop_next_frame = true
		self._stop_network = nil
	end

	if self._session then
		slot3 = self._session

		self._session.end_update(slot2)
	end

	return 
end
NetworkManager.start_network = function (self)
	if not self._started then
		Global.category_print.multiplayer_base = true
		slot5 = ConnectionNetworkHandler

		self.register_handler(true, self, "connection")

		slot5 = PacketNetworkHandler

		self.register_handler(true, self, "packet")

		slot5 = UnitNetworkHandler

		managers.network.register_handler(true, managers.network, "unit")

		slot4 = (self._network_bound and -1) or self.DEFAULT_PORT
		slot7 = DefaultNetworkHandler

		Network.bind(slot2, Network, DefaultNetworkHandler.new(slot6))

		self._network_bound = true
		self._started = true
		slot4 = "[NetworkManager:start_network]"

		cat_print(slot2, "multiplayer_base")
	end

	return 
end
NetworkManager.register_handler = function (self, name, handler_class)
	if not self._handlers then
		self._handlers = {}
		self._shared_handler_data = {}
	end

	local new_handler = handler_class.new(slot4)
	self._handlers[name] = new_handler
	slot9 = name
	slot8 = new_handler

	Network.set_receiver(handler_class, Network, Idstring(slot8))

	return 
end
NetworkManager.prepare_stop_network = function (self, ...)
	if self._session then
		slot3 = self._session

		self._session.prepare_to_close(slot2, ...)

		if self.voice_chat and self._is_win32 then
			slot3 = self.voice_chat

			self.voice_chat.destroy_voice(slot2)
		end
	end

	return 
end
NetworkManager.stop_network = function (self, clean)
	slot5 = "NetworkRetryJoinAttempt"

	managers.queued_tasks.unqueue(slot3, managers.queued_tasks)

	if self._started then
		slot4 = self._session

		self._session.on_network_stopped(slot3)

		self._started = false

		if clean and self._session then
			local peers = self._session.peers(slot3)
			slot5 = peers

			for k, peer in pairs(self._session) do
				slot10 = peer
				local rpc = peer.rpc(slot9)

				if rpc then
					slot12 = rpc

					Network.reset_connection(slot10, Network)

					slot12 = rpc

					Network.remove_client(slot10, Network)
				end
			end
		end

		self._handlers = nil
		self._shared_handler_data = nil
		slot4 = self._session

		self._session.destroy(slot3)

		self._session = nil
		self._stop_network = nil
		self._stop_next_frame = nil
		self._network_bound = nil
		slot4 = Network

		Network.unbind(slot3)

		slot4 = Network

		Network.set_disconnected(slot3)

		slot4 = Application

		if not Application.editor(slot3) then
			slot5 = false

			Network.set_multiplayer(slot3, Network)
		end

		slot5 = "[NetworkManager:stop_network]"

		cat_print(slot3, "multiplayer_base")

		slot4 = "---------------------------------------------------------"

		print(slot3)
	end

	if self._restart_in_camp then
		Application.debug(slot3, Application, "[NetworkManager:stop_network] self._restart_in_camp")

		self._restart_in_camp = nil
		slot4 = self

		self._create_lobby(slot3)

		slot4 = managers.network

		managers.network.host_game(slot3)

		managers.network.matchmake._restart_in_camp = true
		slot4 = managers.network.matchmake
		slot7 = managers.network

		managers.network.matchmake.create_lobby(true, managers.network.get_matchmake_attributes(self._restart_in_camp))

		managers.worldcollection.level_transition_in_progress = false
		slot4 = self

		self.on_camp_restarted(false)
	end

	return 
end
NetworkManager.on_camp_restarted = function (self)
	local last_world_id = managers.worldcollection._world_id_counter
	self._synced_worlds_temp = {
		[last_world_id] = {}
	}
	self._synced_worlds_temp[last_world_id][CoreWorldCollection.STAGE_LOAD] = true
	self._synced_worlds_temp[last_world_id][CoreWorldCollection.STAGE_LOAD_FINISHED] = true
	self._synced_worlds_temp[last_world_id][CoreWorldCollection.STAGE_PREPARE] = true

	return 
end
NetworkManager.queue_stop_network = function (self)
	self._stop_network = true

	return 
end
NetworkManager.is_ready_to_load = function (self)
	if self._stop_next_frame or self._stop_network then
		return false
	end

	if self._session then
		slot3 = self._session

		if not self._session.is_ready_to_close(slot2) then
			return false
		end
	end

	if self.account then
		slot3 = self.account

		if not self.account.is_ready_to_close(slot2) then
			return false
		end
	end

	return true
end
NetworkManager.stopping = function (self)
	if not self._started then
		return true
	end

	if self._stop_next_frame or self._stop_network then
		return true
	end

	return false
end
NetworkManager.start_client = function (self)
	slot4 = true

	self.stop_network(slot2, self)

	slot3 = self

	self.start_network(slot2)

	if self._is_win32 then
		slot3 = self.voice_chat

		self.voice_chat.open(slot2)
	end

	slot3 = ClientNetworkSession
	self._session = ClientNetworkSession.new(slot2)
	slot4 = true

	self._session.create_local_peer(slot2, self._session)

	return 
end
NetworkManager.discover_hosts = function (self, result_cb)
	slot5 = true

	self.stop_network(slot3, self)

	slot4 = self

	self.start_network(slot3)

	slot4 = ClientNetworkSession
	self._session = ClientNetworkSession.new(slot3)
	slot5 = true

	self._session.create_local_peer(slot3, self._session)

	self._discover_hosts_cb = result_cb
	slot4 = self._session

	self._session.discover_hosts(slot3)

	return 
end
NetworkManager.on_discover_host_received = function (self, sender)
	if Global.game_settings.single_player then
		return 
	end

	local level_name = Global.level_data.level
	slot6 = level_name
	local level_id = tweak_data.levels.get_index_from_world_name(slot4, tweak_data.levels)

	if level_id then
		level_name = ""
	else
		level_id = 1
	end

	slot6 = managers.network
	local peer = managers.network.session(slot5).local_peer(slot5)
	slot7 = peer
	local state = (peer.in_lobby(managers.network.session(slot5)) and 1) or 2
	local difficulty = Global.game_settings.difficulty
	slot10 = Global.game_settings.level_id
	level_id = tweak_data.levels.get_index_from_level_id(slot8, tweak_data.levels)
	slot10 = level_id

	print(slot8, "on_discover_host_received")

	local my_name = nil
	slot11 = "PS3"

	if SystemInfo.platform("on_discover_host_received") == Idstring(SystemInfo) then
		my_name = "Player 1"
	else
		slot10 = Network
		my_name = Network.hostname(slot9)
	end

	slot17 = 0
	slot16 = difficulty

	sender.discover_host_reply(slot9, sender, my_name, level_id, level_name, sender.ip_at_index(slot15, sender), state)

	return 
end
NetworkManager.on_discover_host_reply = function (self, host, host_name, level_name, my_ip, state, difficulty)
	slot14 = state

	print(slot8, "on_discover_host_reply", host, host_name, level_name, my_ip)

	if self._discover_hosts_cb then
		local cb = self._discover_hosts_cb
		slot16 = difficulty

		self._session.on_host_discovered(slot9, self._session, host, host_name, level_name, my_ip, state)

		slot15 = difficulty

		cb(slot9, host, host_name, level_name, my_ip, state)
	end

	return 
end
NetworkManager.host_game = function (self)
	slot4 = true

	self.stop_network(slot2, self)

	slot3 = self

	self.start_network(slot2)

	if self._is_win32 then
		slot3 = self.voice_chat

		self.voice_chat.open(slot2)
	end

	slot3 = HostNetworkSession
	self._session = HostNetworkSession.new(slot2)
	slot4 = true

	self._session.create_local_peer(slot2, self._session)

	if self.is_ps3 then
		slot3 = self._session

		self._session.broadcast_server_up(slot2)
	end

	return 
end
NetworkManager.join_game_at_host_rpc = function (self, host_rpc, result_cb)
	self._discover_hosts_cb = nil

	if self._session then
		slot7 = result_cb

		self._session.request_join_host(slot4, self._session, host_rpc)
	else
		slot5 = "[NetworkManager:join_game_at_host_rpc] no session!!!"

		print(slot4)
	end

	return 
end
NetworkManager.register_spawn_point = function (self, id, data, spawner)
	slot7 = "[NetworkManager:register_spawn_point]"

	Application.debug(slot5, Application)

	local runtime_data = {
		pos_rot = {
			data.position,
			data.rotation
		},
		id = id,
		spawner = spawner
	}
	self._spawn_points[id] = runtime_data

	return 
end
NetworkManager.unregister_spawn_point = function (self, id)
	self._spawn_points[id] = nil

	return 
end
NetworkManager.unregister_all_spawn_points = function (self)
	self._spawn_points = {}
	self._session._spawn_point_beanbag = nil

	return 
end
NetworkManager.has_spawn_points = function (self)
	slot3 = self._spawn_points

	return next(slot2)
end
NetworkManager.spawn_point = function (self, sp_id)
	return self._spawn_points[sp_id]
end
NetworkManager._register_PSN_matchmaking_callbacks = function (self)
	slot5 = "clbk_PSN_event"
	local gen_clbk = callback(slot2, self, self)
	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "session_destroyed")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "session_created")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "session_kickout")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "member_left")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "member_joined")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "owner_changed")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "server_ready")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "lobby_refresh")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "lobby_joined")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "lobby_left")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "friends_updated")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "receive_group_invitation")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "room_custom_info")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "invitation_received")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "invitation_received_result")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "invitation_gui_opened")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "invitation_gui_closed")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "connection_etablished")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "session_search")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "custom_message")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "session_update")

	slot6 = gen_clbk

	PSN.set_matchmaking_callback(self, PSN, "error")

	return 
end
NetworkManager.clbk_PSN_event = function (self, ...)
	slot3 = "[NetworkManager:clbk_PSN_event]"

	print(slot2, inspect(...))

	return 
end
NetworkManager.search_ses = function (self)
	slot4 = "session_search"
	slot9 = "clbk_search_session"

	PSN.set_matchmaking_callback(slot2, PSN, callback(slot6, self, self))

	local search_params = {
		numbers = {
			1,
			3
		}
	}
	slot9 = PSN
	slot7 = PSN.get_world_list(self)[1].world_id

	PSN.search_session(PSN, PSN, search_params, {})

	return 
end
NetworkManager.clbk_search_session = function (self, search_results)
	slot5 = search_results

	print(slot3, "[NetworkManager:clbk_search_session]")

	slot4 = search_results

	for i, k in pairs(slot3) do
		slot7 = print
		slot9 = i

		if k then
			slot12 = k
			slot10 = inspect(slot11)
		end

		slot7(slot8, slot9)
	end

	return 
end
NetworkManager.clbk_msg_overwrite = function (overwrite_data, msg_queue, ...)
	if msg_queue then
		if overwrite_data.index then
			msg_queue[overwrite_data.index] = {
				...
			}
		else
			slot5 = {
				...
			}

			table.insert(slot3, msg_queue)

			overwrite_data.index = #msg_queue
		end
	else
		overwrite_data.index = nil
	end

	return 
end
NetworkManager.protocol_type = function (self)
	return self.PROTOCOL_TYPE
end
NetworkManager.set_packet_throttling_enabled = function (self, state)
	if self._session and self._is_win32 then
		slot5 = state

		self._session.set_packet_throttling_enabled(slot3, self._session)
	end

	return 
end
NetworkManager.on_peer_added = function (self, peer, peer_id)

	-- Decompilation error in this vicinity:
	slot8 = peer_id

	cat_print(slot4, "multiplayer_base", "NetworkManager:on_peer_added", peer)

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = managers.network.matchmake
		slot8 = managers.network
		slot8 = managers.network.session(slot7)

		managers.network.matchmake.set_num_players(slot4, managers.network.session(slot7).amount_of_players(slot7))
	end

	slot6 = "X360"

	if managers.chat then
		slot6 = ChatManager.GAME
		slot11 = {
			name = peer.name(slot13)
		}
		slot14 = peer

		managers.chat.feed_system_message(slot4, managers.chat, managers.localization.text(slot8, managers.localization, "menu_chat_peer_added"))
	end

	return 
end
NetworkManager.update_matchmake_attributes = function (self)
	slot3 = self.matchmake
	slot6 = self

	self.matchmake.set_server_attributes(slot2, self.get_matchmake_attributes(slot5))

	return 
end
NetworkManager.get_matchmake_attributes = function (self)
	slot4 = "WIN32"
	local is_win32 = SystemInfo.platform(slot2) == Idstring(SystemInfo)
	slot5 = Global.game_settings.difficulty
	local difficulty_id = tweak_data.difficulty_to_index(slot3, tweak_data)
	slot6 = Global.game_settings.permission
	local permission_id = tweak_data.permission_to_index(tweak_data, tweak_data)
	local min_lvl = Global.game_settings.reputation_permission or 0
	local drop_in = (Global.game_settings.drop_in_allowed and 1) or 0
	slot8 = managers.network.matchmake
	local level_id, job_id, progress, mission_type, server_state_id = managers.network.matchmake.get_job_info_by_current_job(slot7)
	local region = 1

	if Global.game_settings.level_id and tweak_data.operations and tweak_data.operations.missions and tweak_data.operations.missions[Global.game_settings.level_id] and tweak_data.operations.missions[Global.game_settings.level_id].region then
		slot15 = tweak_data.operations.missions[Global.game_settings.level_id].region
		region = tweak_data.operations.get_region_index_from_name(slot13, tweak_data.operations)
	end

	local attributes = {
		numbers = {
			level_id,
			difficulty_id,
			permission_id,
			server_state_id,
			[6] = drop_in,
			[7] = min_lvl
		}
	}

	if is_win32 then
		local kick_option = Global.game_settings.kick_option
		slot17 = kick_option

		table.insert(slot15, attributes.numbers)
	end

	attributes.numbers[11] = region
	slot15 = managers.challenge_cards
	local active_card = managers.challenge_cards.get_active_card(slot14)
	local card_key = "nocards"

	if active_card and (active_card.status == ChallengeCardsManager.CARD_STATUS_NORMAL or active_card.status == ChallengeCardsManager.CARD_STATUS_ACTIVE) then
		card_key = active_card[ChallengeCardsTweakData.KEY_NAME_FIELD]
	end

	attributes.numbers[12] = card_key
	slot17 = managers.network.matchmake
	local players_info = managers.network.matchmake.get_all_players_info(slot16)
	attributes.numbers[13] = "-"
	attributes.numbers[14] = job_id
	attributes.numbers[15] = progress
	attributes.numbers[16] = mission_type
	attributes.numbers[17] = players_info[1]
	attributes.numbers[18] = players_info[2]
	attributes.numbers[19] = players_info[3]
	attributes.numbers[20] = players_info[4]

	return attributes
end
NetworkManager.start_matchmake_attributes_update = function (self)
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network

		managers.network.update_matchmake_attributes(slot2)
	else
		slot3 = managers.network
		slot4 = "update_matchmake_attributes"

		managers.network.session(slot2).send_to_host(slot2, managers.network.session(slot2))
	end

	return 
end

return 
