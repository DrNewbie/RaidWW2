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
if not ClientNetworkSession then
	slot2 = BaseNetworkSession
	slot0 = class(slot1)
end

ClientNetworkSession = slot0
ClientNetworkSession.HOST_SANITY_CHECK_INTERVAL = 4
ClientNetworkSession.HOST_REQUEST_JOIN_INTERVAL = 2
ClientNetworkSession.JOIN_REQUEST_TIMEOUT = 20
function ClientNetworkSession:request_join_host(host_rpc, result_cb)

	-- Decompilation error in this vicinity:
	slot7 = result_cb

	print(slot4, "[ClientNetworkSession:request_join_host]", host_rpc)

	self._cb_find_game = result_cb
	local host_name = managers.network.matchmake.game_owner_name(slot4)
	slot6 = SystemInfo
	local ticket = peer.create_ticket(slot8)
	self._server_peer = peer
	slot11 = true

	Network.set_multiplayer(peer, Network)

	slot11 = host_rpc

	Network.set_client(peer, Network)

	slot10 = SystemInfo
	slot14 = self
	local join_req_id = self._get_join_attempt_identifier(slot13)
	slot17 = self._local_peer
	slot17 = managers.blackmarket
	self._join_request_params = {
		host_rpc = request_rpc,
		params = {
			self._local_peer.name(slot16),
			managers.blackmarket.get_preferred_character_string(slot16),
			managers.dlc.dlcs_string(slot16),
			xuid,
			lvl,
			gameversion,
			join_req_id,
			ticket
		}
	}
	slot15 = request_rpc
	slot18 = self._join_request_params.params

	request_rpc.request_join(, unpack(managers.dlc))

	slot15 = TimerManager
	slot15 = TimerManager.wall()
	self._first_join_request_t = TimerManager.wall().time()
	self._last_join_request_t = self._first_join_request_t

	return 
end
function ClientNetworkSession:on_join_request_reply(reply, my_peer_id, my_character, level_index, difficulty_index, state_index, server_character, user_id, mission, job_id_index, job_stage, alternative_job_stage, interupt_job_stage_level_index, xuid, auth_ticket, sender)
	slot17 = print
	slot19 = "[ClientNetworkSession:on_join_request_reply] "

	if self._server_peer then
		slot22 = self._server_peer
		slot20 = self._server_peer.user_id(slot21)
	end

	slot25 = 0
	slot22 = sender.ip_at_index(slot23, sender)
	slot26 = 0

	slot17(slot18, slot19, slot20, user_id, sender.protocol_at_index(sender, sender))

	if not self._server_peer or not self._cb_find_game then
		return 
	end

	slot19 = self._server_peer

	if self._server_peer.ip(slot18) then
		slot20 = 0
		slot20 = self._server_peer

		if sender.ip_at_index(slot18, sender) ~= self._server_peer.ip(sender) then
			slot20 = self._server_peer.ip(slot21)
			slot24 = 0

			print(slot18, "[ClientNetworkSession:on_join_request_reply] wrong host replied", sender.ip_at_index(self._server_peer, sender))

			return 
		end
	end

	self._last_join_request_t = nil
	slot19 = SystemInfo

	if SystemInfo.platform(slot18) == self._ids_WIN32 then
		slot19 = self._server_peer

		if self._server_peer.user_id(slot18) then
			slot19 = self._server_peer
		else
			slot20 = 0

			if sender.protocol_at_index(slot18, sender) == "STEAM" then
				self._server_protocol = "STEAM"
			else
				self._server_protocol = "TCP_IP"
			end

			slot20 = self._server_protocol

			print(slot18, "self._server_protocol")

			slot20 = sender

			self._server_peer.set_rpc(slot18, self._server_peer)

			slot20 = true

			self._server_peer.set_ip_verified(slot18, self._server_peer)

			slot20 = sender

			Network.set_client(slot18, Network)
		end
	else
		self._server_protocol = "TCP_IP"
		slot20 = sender

		self._server_peer.set_rpc(slot18, self._server_peer)

		slot20 = true

		self._server_peer.set_ip_verified(slot18, self._server_peer)

		slot20 = sender

		Network.set_client(slot18, Network)
	end

	local cb = self._cb_find_game
	self._cb_find_game = nil

	if reply == 1 then

		-- Decompilation error in this vicinity:
		slot20 = TimerManager
		self._host_sanity_send_t = TimerManager.wall(slot19).time(slot19) + self.HOST_SANITY_CHECK_INTERVAL
		slot19 = tweak_data.levels.get_level_name_from_index(TimerManager.wall(slot19), tweak_data.levels)
		Global.game_settings.level_id = slot19
		slot20 = tweak_data
		slot24 = difficulty_index

		tweak_data.set_difficulty(slot19, tweak_data.index_to_difficulty(level_index, tweak_data))

		Global.game_settings.mission = mission
		slot21 = server_character

		self._server_peer.set_character(slot19, self._server_peer)

		slot21 = xuid

		self._server_peer.set_xuid(slot19, self._server_peer)

		slot21 = "X360"
		slot21 = my_peer_id

		self.register_local_peer(slot19, self)

		slot21 = my_character

		self._local_peer.set_character(slot19, self._local_peer)

		slot20 = self._local_peer
		slot23 = managers.skilltree

		self._local_peer.set_class(slot19, managers.skilltree.get_character_profile_class(slot22))

		slot21 = 1

		self._server_peer.set_id(slot19, self._server_peer)

		slot21 = auth_ticket

		if not self._server_peer.begin_ticket_session(slot19, self._server_peer) then
			slot22 = 1

			self.remove_peer(slot19, self, self._server_peer)

			slot20 = "AUTH_HOST_FAILED"

			cb(slot19)

			if managers.game_play_central then
				slot20 = managers.game_play_central

				if managers.game_play_central.is_restarting(slot19) then
					slot21 = false

					managers.game_play_central.is_restarting(slot19, managers.game_play_central)
				end
			end

			return 
		end

		slot21 = state_index == 1

		self._server_peer.set_in_lobby_soft(slot19, self._server_peer)

		slot21 = state_index ~= 1

		self._server_peer.set_synched_soft(slot19, self._server_peer)

		slot21 = "PS3"

		if SystemInfo.platform(slot19) == Idstring(SystemInfo) then
		end

		slot20 = self

		self._chk_send_proactive_outfit_loaded(slot19)

		local data = {
			instant = true
		}

		if job_id_index ~= 0 then
			slot25 = job_stage

			Application.debug(slot20, Application, "[[ClientNetworkSession:on_join_request_reply]] Mission:", mission, job_id_index)

			Global.game_settings.world_setting = nil
			local job_id = nil

			if job_stage == 0 then
				slot23 = job_id_index
				job_id = tweak_data.operations.get_raid_name_from_index(slot21, tweak_data.operations)
			else
				slot23 = job_id_index
				job_id = tweak_data.operations.get_operation_name_from_index(slot21, tweak_data.operations)
			end

			slot23 = job_id
			local mission = tweak_data.operations.mission_data(slot21, tweak_data.operations)
			data.background = tweak_data.operations.missions[job_id].loading.image
			data.loading_text = tweak_data.operations.missions[job_id].loading.text
			data.mission = mission
			mission.job_type = OperationsTweakData.JOB_TYPE_RAID
			slot24 = job_id

			self._server_peer.verify_job(tweak_data.operations, self._server_peer)

			slot23 = managers.raid_job

			managers.raid_job.on_mission_started(tweak_data.operations)
		else
			slot22 = RaidJobManager.CAMP_ID
			mission = tweak_data.operations.mission_data(slot20, tweak_data.operations)
			data.background = tweak_data.operations.missions[RaidJobManager.CAMP_ID].loading.image
			data.loading_text = tweak_data.operations.missions[RaidJobManager.CAMP_ID].loading.text
			data.mission = mission
		end

		Global.dropin_loading_screen = data
		slot22 = data

		managers.menu.show_loading_screen(slot20, managers.menu)

		slot22 = "[ClientNetworkSession:on_join_request_reply] Shown loading screen!"
		slot25 = managers.menu._loading_screen

		Application.debug(slot20, Application, inspect(slot24))

		slot24 = state_index

		cb(slot20, (state_index == 1 and "JOINED_LOBBY") or "JOINED_GAME", level_index, difficulty_index)
	elseif reply == 2 then
		slot22 = 1

		self.remove_peer(slot19, self, self._server_peer)

		slot20 = "KICKED"

		cb(slot19)
	elseif reply == 0 then
		if managers.network.matchmake._server_connect_retried and NetworkMatchMaking.RETRY_CONNECT_COUNT <= managers.network.matchmake._server_connect_retried then
			slot22 = 1

			self.remove_peer(slot19, self, self._server_peer)
		end

		slot20 = "FAILED_CONNECT"

		cb(slot19)
	elseif reply == 3 then
		slot22 = 1

		self.remove_peer(slot19, self, self._server_peer)

		slot20 = "GAME_STARTED"

		cb(slot19)
	elseif reply == 4 then
		slot22 = 1

		self.remove_peer(slot19, self, self._server_peer)

		slot20 = "DO_NOT_OWN_HEIST"

		cb(slot19)
	elseif reply == 5 then
		slot22 = 1

		self.remove_peer(slot19, self, self._server_peer)

		slot20 = "GAME_FULL"

		cb(slot19)
	elseif reply == 6 then
		slot22 = 1

		self.remove_peer(slot19, self, self._server_peer)

		slot20 = "LOW_LEVEL"

		cb(slot19)
	elseif reply == 7 then
		slot22 = 1

		self.remove_peer(slot19, self, self._server_peer)

		slot20 = "WRONG_VERSION"

		cb(slot19)
	elseif reply == 8 then
		slot22 = 1

		self.remove_peer(slot19, self, self._server_peer)

		slot20 = "AUTH_FAILED"

		cb(slot19)
	end

	if reply ~= 1 and managers.game_play_central then
		slot20 = managers.game_play_central

		if managers.game_play_central.is_restarting(slot19) then
			slot21 = false

			managers.game_play_central.set_restarting(slot19, managers.game_play_central)
		end
	end

	return 
end
function ClientNetworkSession:on_join_request_timed_out()
	local cb = self._cb_find_game
	self._cb_find_game = nil
	slot4 = "TIMED_OUT"

	cb(slot3)

	if managers.game_play_central then
		slot5 = false

		managers.game_play_central.set_restarting(slot3, managers.game_play_central)
	end

	return 
end
function ClientNetworkSession:on_join_request_cancelled()
	local cb = self._cb_find_game

	if cb then
		self._cb_find_game = nil

		if self._server_peer then
			slot6 = 1

			self.remove_peer(slot3, self, self._server_peer)
		end

		slot4 = "CANCELLED"

		cb(slot3)
	end

	if managers.game_play_central then
		slot5 = false

		managers.game_play_central.set_restarting(slot3, managers.game_play_central)
	end

	return 
end
function ClientNetworkSession:discover_hosts()
	self._discovered_hosts = {}
	slot4 = NetworkManager.DEFAULT_PORT
	slot3 = Network.broadcast(slot2, Network)

	Network.broadcast(slot2, Network).discover_host(slot2)

	return 
end
function ClientNetworkSession:on_host_discovered(new_host, new_host_name, level_name, my_ip, state, difficulty)
	if self._discovered_hosts then
		local new_host_data = {
			rpc = new_host,
			host_name = new_host_name,
			level_name = level_name,
			my_ip = my_ip,
			state = state,
			difficulty = difficulty
		}
		local already_known = nil
		slot11 = self._discovered_hosts

		for i_host, host_data in ipairs(slot10) do
			if host_data.host_name == new_host_name then
				slot17 = 0
				slot18 = 0

				if host_data.rpc.ip_at_index(slot15, host_data.rpc) == new_host.ip_at_index(host_data.rpc, new_host) then
					self._discovered_hosts[i_host] = new_host_data
					already_known = true

					break
				end
			end
		end

		if not already_known then
			slot12 = new_host_data

			table.insert(slot10, self._discovered_hosts)
		end
	end

	return 
end
function ClientNetworkSession:on_server_up_received(host_rpc)
	if self._discovered_hosts then
		slot4 = host_rpc

		host_rpc.request_host_discover_reply(slot3)
	end

	return 
end
function ClientNetworkSession:discovered_hosts()
	return self._discovered_hosts
end
function ClientNetworkSession:send_to_host(...)
	if self._server_peer then
		slot3 = self._server_peer

		self._server_peer.send(slot2, ...)
	else
		slot3 = "[ClientNetworkSession:send_to_host] no host"

		print(slot2)
	end

	return 
end
function ClientNetworkSession:is_host()
	return false
end
function ClientNetworkSession:is_client()
	return true
end
function ClientNetworkSession:load_level(...)
	slot6 = self._load_counter

	self.send_to_host(slot2, self, "set_loading_state", true)

	slot3 = self

	self._load_level(slot2, ...)

	return 
end
function ClientNetworkSession:load_lobby(...)
	slot6 = self._load_counter

	self.send_to_host(slot2, self, "set_loading_state", true)

	slot3 = self

	self._load_lobby(slot2, ...)

	return 
end
function ClientNetworkSession:peer_handshake(name, peer_id, peer_user_id, in_lobby, loading, synched, character, mask_set, xuid, xnaddr)

	-- Decompilation error in this vicinity:
	slot23 = xnaddr

	print(slot12, "ClientNetworkSession:peer_handshake", name, peer_id, peer_user_id, in_lobby, loading, synched, character, mask_set, xuid)

	if self._peers[peer_id] then
		print(slot12)

		local peer = self._peers[peer_id]
		slot14 = peer

		if peer.ip_verified("ALREADY HAD PEER returns here") then
			slot16 = peer_id

			self._server_peer.send(slot13, self._server_peer, "connection_established")
		end

		return 
	end

	local rpc = nil

	if self._server_protocol == "STEAM" then
		slot17 = "STEAM"
		rpc = Network.handshake(slot13, Network, peer_user_id, nil)
		slot15 = rpc

		Network.add_co_client(slot13, Network)
	end

	slot15 = "X360"

	if SystemInfo.platform(slot13) == Idstring(SystemInfo) then
		slot15 = xuid
		local ip = managers.network.matchmake.internal_address(slot13, managers.network.matchmake)
		slot18 = "TCP_IP"
		rpc = Network.handshake(managers.network.matchmake, Network, ip, managers.network.DEFAULT_PORT)
		slot16 = rpc

		Network.add_co_client(managers.network.matchmake, Network)
	end

	slot14 = SystemInfo

	if SystemInfo.platform(slot13) == self._ids_WIN32 then
	else
		peer_user_id = false
	end

	slot15 = "WIN32"

	if SystemInfo.platform(slot13) == Idstring(SystemInfo) then
		slot15 = peer_user_id
		name = managers.network.account.username_by_id(slot13, managers.network.account)
	end

	local id, peer = self.add_peer(slot13, self, name, rpc, in_lobby, loading, synched, peer_id, character, peer_user_id, xuid)
	slot22 = id
	slot25 = peer

	cat_print(name, "multiplayer_base", "[ClientNetworkSession:peer_handshake]", name, peer_user_id, loading, synched, inspect(nil))

	slot17 = "X360"

	return 
end
function ClientNetworkSession:on_PSN_connection_established(name, ip)
	slot6 = "PS3"

	if SystemInfo.platform(slot4) ~= Idstring(SystemInfo) then
		slot6 = "PS4"

		if SystemInfo.platform(slot4) ~= Idstring(SystemInfo) then
			return 
		end
	end

	slot8 = false

	self.chk_send_connection_established(slot4, self, name, nil)

	return 
end
function ClientNetworkSession:on_peer_synched(peer_id)
	local peer = self._peers[peer_id]

	if not peer then
		slot7 = peer_id

		cat_error(slot4, "multiplayer_base", "[ClientNetworkSession:on_peer_synched] Unknown Peer:")

		return 
	end

	slot6 = false

	peer.set_loading(slot4, peer)

	slot6 = true

	peer.set_synched(slot4, peer)

	slot7 = peer_id

	self.on_peer_sync_complete(slot4, self, peer)

	return 
end
function ClientNetworkSession:ok_to_load_level(load_counter)
	slot7 = self._received_ok_to_load_level

	print(slot3, "[ClientNetworkSession:ok_to_load_level] load_counter", load_counter, "self._received_ok_to_load_level")

	if self._closing then
		return 
	end

	if self._received_ok_to_load_level then
		slot4 = "Allready recieved ok to load level, returns"

		print(slot3)

		return 
	end

	if self._load_counter == load_counter then
		slot4 = "Allready loaded, returns"

		print(slot3)

		return 
	end

	self._load_counter = load_counter
	self._received_ok_to_load_level = load_counter
	slot4 = managers.menu

	if managers.menu.active_menu(slot3) then
		slot4 = managers.menu

		managers.menu.close_menu(slot3)
	end

	slot4 = managers.system_menu

	managers.system_menu.force_close_all(slot3)

	local level_id = Global.game_settings.level_id
	local level_name = level_id and tweak_data.levels[level_id].world_name
	local mission = (Global.game_settings.mission ~= "none" and Global.game_settings.mission) or nil
	local world_setting = Global.game_settings.world_setting
	slot13 = level_id

	self.load_level(slot7, self, level_name, mission, world_setting, nil)

	return 
end
function ClientNetworkSession:ok_to_load_lobby(load_counter)
	slot7 = self._received_ok_to_load_lobby
	slot10 = self._local_peer

	print(slot3, "[ClientNetworkSession:ok_to_load_lobby] load_counter", load_counter, "self._received_ok_to_load_lobby", self._local_peer.id(slot9))

	if self._closing then
		return 
	end

	slot4 = self

	if self._local_peer_in_lobby(slot3) then
		return 
	end

	if self._received_ok_to_load_lobby then
		slot4 = "Allready recieved ok to load lobby, returns"

		print(slot3)

		return 
	end

	if self._load_counter == load_counter then
		slot4 = "Allready loaded, returns"

		print(slot3)

		return 
	end

	self._load_counter = load_counter
	slot7 = self._load_counter

	self.send_to_host(slot3, self, "set_loading_state", true)

	self._received_ok_to_load_lobby = load_counter
	slot4 = managers.menu

	if managers.menu.active_menu(slot3) then
		slot4 = managers.menu

		managers.menu.close_menu(slot3)
	end

	slot4 = managers.system_menu

	managers.system_menu.force_close_all(slot3)

	slot4 = managers.network
	slot4 = managers.network.session(slot3)

	managers.network.session(slot3).load_lobby(slot3)

	return 
end
function ClientNetworkSession:on_mutual_connection(other_peer_id)
	local other_peer = self._peers[other_peer_id]

	if not other_peer then
		return 
	end

	return 
end
function ClientNetworkSession:on_peer_requested_info(peer_id)
	local other_peer = self._peers[peer_id]

	if not other_peer then
		return 
	end

	slot6 = true

	other_peer.set_ip_verified(slot4, other_peer)

	slot6 = other_peer

	self._local_peer.sync_lobby_data(slot4, self._local_peer)

	slot6 = other_peer

	self._local_peer.sync_data(slot4, self._local_peer)

	slot7 = self._load_counter

	Application.debug(slot4, Application, "[ClientNetworkSession:on_load_complete]")

	slot9 = self._local_peer

	other_peer.send(slot4, other_peer, "set_loading_state", self._local_peer.loading(slot8))

	slot6 = "peer_exchange_info"
	slot9 = self._local_peer

	other_peer.send(slot4, other_peer, self._local_peer.id(self._load_counter or 1))

	return 
end
function ClientNetworkSession:update()
	slot3 = self

	ClientNetworkSession.super.update(slot2)

	if not self._closing then
		slot3 = TimerManager
		slot3 = TimerManager.wall(slot2)
		local wall_time = TimerManager.wall(slot2).time(slot2)

		if self._server_peer and self._host_sanity_send_t and self._host_sanity_send_t < wall_time then
			slot5 = "sanity_check_network_status"

			self._server_peer.send(slot3, self._server_peer)

			self._host_sanity_send_t = wall_time + self.HOST_SANITY_CHECK_INTERVAL
		end

		slot5 = wall_time

		self._upd_request_join_resend(slot3, self)

		slot5 = "XB1"

		if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
			slot4 = self._peers

			for peer_id, peer in pairs(slot3) do
				if peer ~= self._server_peer then
					slot9 = peer

					if not peer.rpc(slot8) then
						slot13 = peer
						slot12 = peer

						self.chk_send_connection_established(slot8, self, peer.name(slot11), peer.user_id(peer))
					end
				end
			end
		end
	end

	return 
end
function ClientNetworkSession:_soft_remove_peer(peer)
	slot5 = peer

	ClientNetworkSession.super._soft_remove_peer(slot3, self)

	slot4 = peer

	if peer.id(slot3) == 1 then
		slot4 = Network

		Network.set_disconnected(slot3)
	end

	return 
end
function ClientNetworkSession:on_peer_save_received(event, event_data)
	slot5 = managers.network

	if managers.network.stopping(slot4) then
		return 
	end

	local packet_index = event_data.index
	local total_nr_packets = event_data.total
	slot10 = total_nr_packets

	print(slot6, "[ClientNetworkSession:on_peer_save_received]", packet_index, "/")

	if packet_index == total_nr_packets then
		slot8 = true

		self._local_peer.set_synched(slot6, self._local_peer)
	end

	return 
end
function ClientNetworkSession:is_expecting_sanity_chk_reply()
	return self._host_sanity_send_t and true
end
function ClientNetworkSession:load(data)
	slot5 = data

	ClientNetworkSession.super.load(slot3, self)

	return 
end
function ClientNetworkSession:on_load_complete(simulation)
	slot6 = simulation

	Application.debug(slot3, Application, "[ClientNetworkSession:on_load_complete]")

	slot5 = simulation

	ClientNetworkSession.super.on_load_complete(slot3, self)

	if not simulation then
		slot4 = TimerManager
		slot4 = TimerManager.wall(slot3)
		self._host_sanity_send_t = TimerManager.wall(slot3).time(slot3) + self.HOST_SANITY_CHECK_INTERVAL
	end

	return 
end
function ClientNetworkSession:_get_join_attempt_identifier()
	if not self._join_attempt_identifier then
		slot4 = 65536
		self._join_attempt_identifier = math.random(slot2, 1)
	end

	return self._join_attempt_identifier
end
function ClientNetworkSession:_upd_request_join_resend(wall_time)
	if self._last_join_request_t then
		if ClientNetworkSession.JOIN_REQUEST_TIMEOUT < wall_time - self._first_join_request_t and self._server_peer and self._cb_find_game then
			self._last_join_request_t = nil
			local cb = self._cb_find_game
			self._cb_find_game = nil
			slot7 = 1

			self.remove_peer(slot4, self, self._server_peer)

			slot5 = "FAILED_CONNECT"

			cb(slot4)

			return 
		end

		if self._last_join_request_t and ClientNetworkSession.HOST_REQUEST_JOIN_INTERVAL < wall_time - self._last_join_request_t then
			slot4 = self._join_request_params.host_rpc
			slot7 = self._join_request_params.params

			self._join_request_params.host_rpc.request_join(slot3, unpack(slot6))

			self._last_join_request_t = wall_time
		end
	end

	return 
end
function ClientNetworkSession:chk_send_outfit_loading_status()
	slot6 = self._notify_host_when_outfits_loaded
	slot6 = "self:_get_peer_outfit_versions_str()"
	slot9 = self

	print(slot2, "[ClientNetworkSession:chk_send_outfit_loading_status]\n", inspect(slot5), "\n", self._get_peer_outfit_versions_str(slot8))

	if self._notify_host_when_outfits_loaded then
		slot4 = self

		if self._notify_host_when_outfits_loaded.outfit_versions_str == self._get_peer_outfit_versions_str(slot3) then
			slot3 = self

			if self.are_all_peer_assets_loaded(slot2) then
				slot3 = "answering to request"

				print(slot2)

				slot7 = self._local_peer
				slot8 = self._notify_host_when_outfits_loaded.outfit_versions_str

				self.send_to_host(slot2, self, "set_member_ready", self._local_peer.id(slot6), self._notify_host_when_outfits_loaded.request_id, 3)

				self._notify_host_when_outfits_loaded = nil

				return true
			end
		end
	end

	return 
end
function ClientNetworkSession:notify_host_when_outfits_loaded(request_id, outfit_versions_str)
	slot6 = request_id

	print(slot4, "[ClientNetworkSession:notify_host_when outfits_loaded] request_id")

	self._notify_host_when_outfits_loaded = {
		request_id = request_id,
		outfit_versions_str = outfit_versions_str
	}
	slot5 = self

	self.chk_send_outfit_loading_status(slot4)

	return 
end
function ClientNetworkSession:on_peer_outfit_loaded(peer)
	slot5 = peer

	ClientNetworkSession.super.on_peer_outfit_loaded(slot3, self)

	slot4 = self

	self._chk_send_proactive_outfit_loaded(slot3)

	return 
end
function ClientNetworkSession:_chk_send_proactive_outfit_loaded()

	-- Decompilation error in this vicinity:
	slot3 = self
	slot3 = self
	local sent = self.chk_send_outfit_loading_status(slot2)

	if not sent then
		slot4 = self

		if self.are_all_peer_assets_loaded(slot3) then
			slot4 = "[ClientNetworkSession:_chk_send_proactive_outfit_loaded] sending outfit_ready proactively"

			print(slot3)

			slot8 = self._local_peer
			slot9 = "proactive"

			self.send_to_host(slot3, self, "set_member_ready", self._local_peer.id(slot7), 0, 3)
		end
	end

	return 
end
function ClientNetworkSession:on_set_member_ready(peer_id, ready, state_changed, from_network)
	slot11 = from_network

	ClientNetworkSession.super.on_set_member_ready(slot6, self, peer_id, ready, state_changed)

	if from_network and ready then
		slot7 = self

		self.chk_send_outfit_loading_status(slot6)
	end

	return 
end
function ClientNetworkSession:remove_peer(...)
	slot3 = self

	ClientNetworkSession.super.remove_peer(slot2, ...)

	slot3 = self

	self.chk_send_outfit_loading_status(slot2)

	return 
end
function ClientNetworkSession:set_peer_loading_state(peer, state, load_counter)
	slot7 = state

	peer.set_loading(slot5, peer)

	slot9 = load_counter

	ClientNetworkSession.super.set_peer_loading_state(slot5, self, peer, state)

	return 
end

return 
