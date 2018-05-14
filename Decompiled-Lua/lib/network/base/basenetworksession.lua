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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
BaseNetworkSession = BaseNetworkSession or class()
BaseNetworkSession.TIMEOUT_CHK_INTERVAL = 5
slot3 = "X360"

if SystemInfo.platform(5) == Idstring(SystemInfo) then
	BaseNetworkSession.CONNECTION_TIMEOUT = 10
else
	slot3 = "PS4"

	if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
		BaseNetworkSession.CONNECTION_TIMEOUT = 10
	else
		slot3 = "XB1"

		if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
			BaseNetworkSession.CONNECTION_TIMEOUT = 10
		else
			BaseNetworkSession.CONNECTION_TIMEOUT = 10
		end
	end
end

slot4 = "WIN32"
BaseNetworkSession.LOADING_CONNECTION_TIMEOUT = (SystemInfo.platform(slot2) == Idstring(SystemInfo) and 75) or 30
BaseNetworkSession._LOAD_WAIT_TIME = 2
BaseNetworkSession._STEAM_P2P_SEND_INTERVAL = 1
function BaseNetworkSession:init()
	slot3 = "[BaseNetworkSession:init]"

	print(slot2)

	slot3 = "WIN32"
	self._ids_WIN32 = Idstring(slot2)
	self._peers = {}
	self._peers_all = {}
	self._server_peer = nil
	self._timeout_chk_t = 0
	self._kicked_list = {}
	self._connection_established_results = {}
	self._soft_remove_peers = false
	self._dropin_pause_info = {}
	self._old_players = {}
	self._spawn_point_beanbag = nil
	slot3 = Network
	slot8 = "clbk_network_send"

	Network.set_client_send_callback(slot2, callback(slot5, self, self))

	slot4 = Idstring(slot5)
	slot9 = "on_peer_save_received"
	self._dropin_complete_event_manager_id = EventManager.register_listener(slot2, EventManager, callback("net_save_received", self, self))

	return 
end
function BaseNetworkSession:create_local_peer(load_outfit)

	-- Decompilation error in this vicinity:
	local my_name = managers.network.account.username_id(slot3)
	slot6 = "STEAM"
	slot6 = self._local_peer
	slot9 = managers.skilltree

	self._local_peer.set_class(slot5, managers.skilltree.get_character_profile_class(slot8))

	return 
end
function BaseNetworkSession:has_other_peers()
	local i = 0
	slot4 = self._peers

	for _, peer in pairs(slot3) do
		i = i + 1
	end

	return 0 < i
end
function BaseNetworkSession:register_local_peer(id)
	slot5 = id

	self._local_peer.set_id(slot3, self._local_peer)

	self._peers_all[id] = self._local_peer

	return 
end
function BaseNetworkSession:load(data)
	slot4 = data.peers

	for peer_id, peer_data in pairs(slot3) do
		slot10 = NetworkPeer
		self._peers[peer_id] = NetworkPeer.new(slot9)
		self._peers_all[peer_id] = self._peers[peer_id]
		slot10 = peer_data

		self._peers[peer_id].load(self._peers[peer_id], self._peers[peer_id])
	end

	if data.server_peer then
		self._server_peer = self._peers[data.server_peer]
	end

	slot5 = data.local_peer

	self._local_peer.load(slot3, self._local_peer)

	slot5 = self._local_peer
	self._peers_all[self._local_peer.id(self._local_peer)] = self._local_peer
	self.update = self.update_skip_one
	self._kicked_list = data.kicked_list
	self._connection_established_results = data.connection_established_results

	if data.dead_con_reports then
		self._dead_con_reports = {}
		slot4 = data.dead_con_reports

		for _, report in ipairs(slot3) do
			local report = {
				process_t = report.process_t,
				reporter = self._peers[report.reporter],
				reported = self._peers[report.reported]
			}
			slot11 = report

			table.insert(report.reported, self._dead_con_reports)
		end
	end

	self._server_protocol = data.server_protocol
	self._notify_host_when_outfits_loaded = data.notify_host_when_outfits_loaded
	self._load_counter = data.load_counter
	slot4 = self

	if self.is_client(slot3) then
		slot4 = self

		if self.server_peer(slot3) then
			slot7 = self
			slot7 = self.server_peer(slot6)

			Network.set_client(slot3, self.server_peer(slot6).rpc(slot6))

			slot5 = game_state_machine
			local is_playing = BaseNetworkHandler._gamestate_filter.any_ingame_playing[game_state_machine.last_queued_state_name(Network)]

			if is_playing then
				slot6 = "[BaseNetworkSession:load] PAUSING"

				Application.debug(slot4, Application)

				slot6 = true

				Application.set_pause(slot4, Application)
			end
		end
	end

	return 
end
function BaseNetworkSession:save(data)
	if self._server_peer then
		slot4 = self._server_peer
		data.server_peer = self._server_peer.id(slot3)
	end

	local peers = {}
	data.peers = peers
	slot5 = self._peers

	for peer_id, peer in pairs(slot4) do
		local peer_data = {}
		peers[peer_id] = peer_data
		slot12 = peer_data

		peer.save(slot10, peer)
	end

	data.local_peer = {}
	slot6 = data.local_peer

	self._local_peer.save(slot4, self._local_peer)

	data.kicked_list = self._kicked_list
	data.connection_established_results = self._connection_established_results

	if self._dead_con_reports then
		data.dead_con_reports = {}
		slot5 = self._dead_con_reports

		for _, report in ipairs(slot4) do
			local save_report = {
				process_t = report.process_t
			}
			slot11 = report.reporter
			save_report.reporter = report.reporter.id(slot10)
			slot11 = report.reported
			save_report.reported = report.reported.id(slot10)
			slot12 = save_report

			table.insert(slot10, data.dead_con_reports)
		end
	end

	if self._dropin_complete_event_manager_id then
		slot6 = self._dropin_complete_event_manager_id

		EventManager.unregister_listener(slot4, EventManager)

		self._dropin_complete_event_manager_id = nil
	end

	slot5 = self

	self._flush_soft_remove_peers(slot4)

	data.server_protocol = self._server_protocol
	data.notify_host_when_outfits_loaded = self._notify_host_when_outfits_loaded
	data.load_counter = self._load_counter

	return 
end
function BaseNetworkSession:server_peer()
	return self._server_peer
end
function BaseNetworkSession:peer(peer_id)
	return self._peers_all[peer_id]
end
function BaseNetworkSession:peers()
	return self._peers
end
function BaseNetworkSession:all_peers()
	return self._peers_all
end
function BaseNetworkSession:count_all_peers()
	local ct = 0
	slot4 = self._peers_all

	for _, _ in pairs(slot3) do
		ct = ct + 1
	end

	return ct
end
function BaseNetworkSession:peer_by_ip(ip)
	slot4 = self._peers_all

	for peer_id, peer in pairs(slot3) do
		slot9 = peer

		if peer.ip(slot8) == ip then
			return peer
		end
	end

	return 
end
function BaseNetworkSession:peer_by_name(name)
	slot4 = self._peers

	for peer_id, peer in pairs(slot3) do
		slot9 = peer

		if peer.name(slot8) == name then
			return peer
		end
	end

	return 
end
function BaseNetworkSession:peer_by_user_id(user_id)
	slot4 = self._peers_all

	for peer_id, peer in pairs(slot3) do
		slot9 = peer

		if peer.user_id(slot8) == user_id then
			return peer
		end
	end

	return 
end
function BaseNetworkSession:peer_by_unit(unit)
	local wanted_key = unit.key(slot3)
	slot5 = self._peers_all

	for _, peer in pairs(unit) do
		local test_unit = peer.unit(slot9)
		slot11 = test_unit

		if alive(peer) then
			slot11 = test_unit

			if test_unit.key(slot10) == wanted_key then
				return peer
			end
		end
	end

	return 
end
function BaseNetworkSession:peer_by_unit_key(wanted_key)
	slot4 = self._peers_all

	for _, peer in pairs(slot3) do
		local test_unit = peer.unit(slot8)
		slot10 = test_unit

		if alive(peer) then
			slot10 = test_unit

			if test_unit.key(slot9) == wanted_key then
				return peer
			end
		end
	end

	return 
end
function BaseNetworkSession:amount_of_players()
	slot3 = self._peers_all

	return table.size(slot2)
end
function BaseNetworkSession:amount_of_alive_players()
	local count = 0
	slot4 = self._peers_all

	for _, peer in pairs(slot3) do
		slot11 = peer

		if alive(peer.unit(slot10)) then
			count = count + 1
		end
	end

	return count
end
function BaseNetworkSession:local_peer()
	return self._local_peer
end
function BaseNetworkSession:is_kicked(peer_name)
	return self._kicked_list[peer_name]
end
function BaseNetworkSession:add_peer(name, rpc, in_lobby, loading, synched, id, character, user_id, xuid, xnaddr)

	-- Decompilation error in this vicinity:
	slot23 = xnaddr

	print(slot12, "[BaseNetworkSession:add_peer]", name, rpc, in_lobby, loading, synched, id, character, user_id, xuid)

	slot21 = user_id
	local peer = NetworkPeer.new(slot12, NetworkPeer, name, rpc, id, loading, synched, in_lobby, character)
	slot15 = xuid

	peer.set_xuid(NetworkPeer, peer)

	slot15 = "X360"
	slot15 = "STEAM"

	if SystemInfo.distribution(slot13) == Idstring(SystemInfo) then
		slot14 = Steam
		slot17 = peer

		Steam.set_played_with(slot13, peer.user_id(slot16))
	end

	self._peers[id] = peer
	self._peers_all[id] = peer
	slot16 = id

	managers.network.on_peer_added(slot13, managers.network, peer)

	if synched then
		slot16 = id

		self.on_peer_sync_complete(slot13, self, peer)
	end

	if rpc then
		slot15 = rpc

		self.remove_connection_from_trash(slot13, self)

		slot15 = rpc

		self.remove_connection_from_soft_remove_peers(slot13, self)
	end

	slot16 = peer

	managers.system_event_listener.call_listeners(slot13, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_IN)

	return id, peer
end
function BaseNetworkSession:remove_peer(peer, peer_id, reason)
	slot9 = peer
	slot9 = reason

	print(slot5, "[BaseNetworkSession:remove_peer]", inspect(slot8), peer_id)

	slot6 = Application

	Application.stack_dump(slot5)

	slot6 = self._peers

	for _, p in pairs(slot5) do
		slot13 = nil

		p.set_expecting_drop_in_pause_confirmation(slot10, p, peer_id)
	end

	slot9 = false

	self.on_drop_in_pause_request_received(slot5, self, peer_id, nil)

	slot6 = peer

	peer.end_ticket_session(slot5)

	if peer_id == 1 then
		self._server_peer = nil
	end

	self._peers[peer_id] = nil
	self._peers_all[peer_id] = nil
	slot7 = peer
	slot5 = peer.name(slot6)
	self._connection_established_results[slot5] = nil
	slot9 = reason

	self._on_peer_removed(slot5, self, peer, peer_id)

	slot6 = peer

	if peer.rpc(slot5) then
		slot7 = peer

		self._soft_remove_peer(slot5, self)
	else
		slot6 = peer

		peer.destroy(slot5)
	end

	slot8 = peer

	managers.system_event_listener.call_listeners(slot5, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_OUT)

	return 
end
function BaseNetworkSession:_on_peer_removed(peer, peer_id, reason)

	-- Decompilation error in this vicinity:
	if managers.player then
		slot7 = peer

		managers.player.peer_dropped_out(slot5, managers.player)
	end

	slot7 = "lobby_menu"
	local lobby_menu = managers.menu.get_menu(slot5, managers.menu)

	if lobby_menu then
		slot7 = lobby_menu.renderer

		if lobby_menu.renderer.is_open(slot6) then
			slot9 = reason

			lobby_menu.renderer.remove_player_slot_by_peer_id(slot6, lobby_menu.renderer, peer)
		end
	end

	if managers.menu_component then
		slot9 = reason

		managers.menu_component.on_peer_removed(slot6, managers.menu_component, peer)
	end

	if reason == "kicked" then
		slot9 = {
			peer = peer
		}

		managers.system_event_listener.call_listeners(slot6, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KICKED)
	else
		slot9 = {
			peer = peer
		}

		managers.system_event_listener.call_listeners(slot6, managers.system_event_listener, CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_LEFT)
	end

	if managers.chat then
		if reason == "left" then
			slot8 = ChatManager.GAME
			slot13 = {
				name = peer.name(slot15)
			}
			slot16 = peer

			managers.chat.feed_system_message(slot6, managers.chat, managers.localization.text(slot10, managers.localization, "menu_chat_peer_left"))
		elseif reason == "kicked" then
			slot8 = ChatManager.GAME
			slot13 = {
				name = peer.name(slot15)
			}
			slot16 = peer

			managers.chat.feed_system_message(slot6, managers.chat, managers.localization.text(slot10, managers.localization, "menu_chat_peer_kicked"))
		elseif reason == "auth_fail" then
			slot8 = ChatManager.GAME
			slot13 = {
				name = peer.name(slot15)
			}
			slot16 = peer

			managers.chat.feed_system_message(slot6, managers.chat, managers.localization.text(slot10, managers.localization, "menu_chat_peer_failed"))
		else
			slot8 = ChatManager.GAME
			slot13 = {
				name = peer.name(slot15)
			}
			slot16 = peer

			managers.chat.feed_system_message(slot6, managers.chat, managers.localization.text(slot10, managers.localization, "menu_chat_peer_lost"))
		end
	end

	slot10 = peer

	print(slot6, "Someone left", peer.name(peer_id))

	local player_left = false
	local player_character = nil

	if managers.criminals then
		slot10 = peer_id
		player_character = managers.criminals.character_name_by_peer_id(slot8, managers.criminals)

		if player_character then
			player_left = true
			slot9 = "Player left"

			print(slot8)

			slot11 = peer_id

			managers.mission.call_global_event(slot8, managers.mission, "on_peer_removed")
		end
	end

	local member_unit = peer.unit(slot8)
	slot10 = member_unit

	if alive(peer) then
		slot10 = member_unit
		slot10 = member_unit.movement(slot9)
		local member_downed = member_unit.movement(slot9).downed(slot9)
	end

	local member_health = 1

	if managers.trade then
		slot13 = peer_id
		local member_dead = managers.trade.is_peer_in_custody(slot11, managers.trade)
	end

	local hostages_killed = 0
	local respawn_penalty = 0

	if member_dead and player_character and managers.trade then
		slot16 = player_character
		hostages_killed = managers.trade.hostages_killed_by_name(slot14, managers.trade)
		slot16 = player_character
		respawn_penalty = managers.trade.respawn_delay_by_name(slot14, managers.trade)
	else
		slot15 = member_unit

		if alive(slot14) then
			slot15 = managers.groupai
			slot15 = managers.groupai.state(slot14)
			slot18 = member_unit
			local criminal_record = managers.groupai.state(slot14).criminal_record(slot14, member_unit.key(slot17))

			if criminal_record then
				hostages_killed = criminal_record.hostages_killed
				respawn_penalty = criminal_record.respawn_penalty
			end
		end
	end

	if player_left then
		slot16 = peer_id
		local mugshot_id = managers.criminals.character_data_by_peer_id(slot14, managers.criminals).mugshot_id
		slot17 = mugshot_id
		local mugshot_data = managers.hud._get_mugshot_data(managers.criminals, managers.hud)
		member_health = (mugshot_data and mugshot_data.health_amount) or 1
	end

	slot15 = peer
	local member_used_deployable = peer.used_deployable(slot14) or false
	slot16 = peer
	local member_used_cable_ties = peer.used_cable_ties(slot15) or 0
	local member_used_body_bags = peer.used_body_bags(slot16)
	slot18 = peer

	peer.unit_delete(peer)

	slot19 = "WIN32"
	slot19 = Network

	if Network.is_server(slot18) then
		slot19 = self

		self.check_start_game_intro(slot18)
	end

	slot19 = Network

	if Network.multiplayer(slot18) then

		-- Decompilation error in this vicinity:
		slot20 = "X360"
		slot19 = Network

		if Network.is_client(slot18) then
			if player_left then
				slot20 = peer_id

				managers.criminals.on_peer_left(slot18, managers.criminals)

				slot20 = peer_id

				managers.criminals.remove_character_by_peer_id(slot18, managers.criminals)

				slot21 = player_character

				managers.trade.replace_player_with_ai(slot18, managers.trade, player_character)
			end
		else
			slot19 = Network

			if Network.is_server(slot18) then
				slot19 = managers.network.matchmake
				slot22 = self

				managers.network.matchmake.set_num_players(slot18, self.amount_of_players(slot21))

				slot20 = peer_id

				managers.network.matchmake.remove_player_info(slot18, managers.network.matchmake)

				slot19 = Network
				slot22 = peer

				Network.remove_client(slot18, peer.rpc(slot21))

				if player_left then
					slot21 = true

					managers.achievment.set_script_data(slot18, managers.achievment, "cant_touch_fail")

					slot20 = peer_id

					managers.criminals.on_peer_left(slot18, managers.criminals)

					slot20 = peer_id

					managers.criminals.remove_character_by_peer_id(slot18, managers.criminals)

					slot19 = managers.groupai
					local unit = managers.groupai.state(slot18).spawn_one_teamAI(slot18, managers.groupai.state(slot18), true)
					slot22 = Application
					self._old_players[peer_ident] = {
						t = Application.time(player_character),
						member_downed = member_downed,
						health = member_health,
						used_deployable = member_used_deployable,
						used_cable_ties = member_used_cable_ties,
						used_body_bags = member_used_body_bags,
						member_dead = member_dead,
						hostages_killed = hostages_killed,
						respawn_penalty = respawn_penalty
					}
					slot22 = player_character
					local trade_entry = managers.trade.replace_player_with_ai(, managers.trade, player_character)

					if unit then
						if trade_entry then
							slot21 = unit
							slot22 = false

							unit.brain(slot20).set_active(slot20, unit.brain(slot20))

							slot21 = unit
							slot23 = 0

							unit.base(slot20).set_slot(slot20, unit.base(slot20), unit)

							slot21 = unit
							slot21 = unit.base(slot20)

							unit.base(slot20).unregister(slot20)
						elseif member_downed then
							slot21 = unit
							slot21 = unit.character_damage(slot20)

							unit.character_damage(slot20).force_bleedout(slot20)
						end
					end

					slot22 = player_character

					managers.trade.remove_from_trade(slot20, managers.trade)
				end

				slot23 = 26
				local deployed_equipment = World.find_units_quick(slot18, World, "all", 14, 25)
				slot20 = deployed_equipment

				for _, equipment in ipairs(World) do
					slot25 = equipment

					if equipment.base(slot24) then
						slot25 = equipment

						if equipment.base(slot24).server_information then
							slot25 = equipment
							slot25 = equipment.base(slot24)
							local server_information = equipment.base(slot24).server_information(slot24)

							if server_information and server_information.owner_peer_id == peer_id then
								slot27 = 0

								equipment.set_slot(slot25, equipment)
							end
						end
					end
				end
			else
				slot19 = "Tried to remove client when neither server or client"

				print(slot18)

				slot19 = Application

				Application.stack_dump(slot18)
			end
		end
	end

	return 
end
function BaseNetworkSession:_soft_remove_peer(peer)
	self._soft_remove_peers = self._soft_remove_peers or {}
	slot5 = peer
	slot7 = TimerManager
	slot7 = TimerManager.wall(0)
	self._soft_remove_peers[peer.rpc(slot4).ip_at_index(slot4, peer.rpc(slot4))] = {
		peer = peer,
		expire_t = TimerManager.wall(0).time(0) + 1.5
	}

	return 
end
function BaseNetworkSession:on_peer_left_lobby(peer)
	slot4 = peer

	if peer.id(slot3) == 1 then
		slot4 = self

		if self.is_client(slot3) and self._cb_find_game then
			slot4 = self

			self.on_join_request_timed_out(slot3)
		end
	end

	return 
end
function BaseNetworkSession:on_peer_left(peer, peer_id)
	slot8 = peer.name(slot9)
	slot11 = peer

	Application.debug(slot4, Application, "[BaseNetworkSession:on_peer_left] Peer Left", peer_id, peer.ip(peer))

	slot5 = Application

	Application.stack_dump(slot4)

	slot8 = "left"

	self.remove_peer(slot4, self, peer, peer_id)

	if peer_id == 1 then
		slot5 = self

		if self.is_client(slot4) then
			if self._cb_find_game then
				slot5 = self

				self.on_join_request_timed_out(slot4)
			else
				slot5 = managers.system_menu

				managers.system_menu.force_close_all(slot4)

				slot5 = self

				if self._local_peer_in_lobby(slot4) then
					slot5 = managers.network.matchmake

					managers.network.matchmake.leave_game(slot4)
				else
					slot5 = managers.network.matchmake

					managers.network.matchmake.destroy_game(slot4)
				end

				slot5 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot4)

				slot5 = game_state_machine

				if game_state_machine.current_state(slot4).on_server_left then
					slot5 = game_state_machine
					slot6 = "dialog_server_left"

					game_state_machine.current_state(slot4).on_server_left(slot4, game_state_machine.current_state(slot4))
				end
			end
		end
	end

	return 
end
function BaseNetworkSession:on_peer_lost(peer, peer_id)
	slot8 = peer.name(slot9)
	slot11 = peer

	Application.debug(slot4, Application, "[BaseNetworkSession:on_peer_lost] Peer Lost", peer_id, peer.ip(peer))

	slot5 = Application

	Application.stack_dump(slot4)

	slot8 = "lost"

	self.remove_peer(slot4, self, peer, peer_id)

	if peer_id == 1 then
		slot5 = self

		if self.is_client(slot4) then
			if self._cb_find_game then
				slot5 = self

				self.on_join_request_timed_out(slot4)
			else
				slot5 = self

				if self._local_peer_in_lobby(slot4) then
					slot5 = managers.network.matchmake

					managers.network.matchmake.leave_game(slot4)
				else
					slot5 = managers.network.matchmake

					managers.network.matchmake.destroy_game(slot4)
				end

				slot5 = managers.network.voice_chat

				managers.network.voice_chat.destroy_voice(slot4)

				slot5 = managers.network

				if managers.network.stopping(slot4) or self._closing then
					return 
				end

				slot6 = "leave_lobby"

				managers.system_menu.close(slot4, managers.system_menu)

				slot5 = game_state_machine

				if game_state_machine.current_state(slot4).on_server_left then
					slot5 = game_state_machine
					slot6 = "dialog_server_left"

					game_state_machine.current_state(slot4).on_server_left(slot4, game_state_machine.current_state(slot4))
				end
			end
		end
	end

	if peer_id ~= 1 then
		slot5 = self

		if self.is_client(slot4) and self._server_peer then
			slot7 = peer_id

			self._server_peer.send(slot4, self._server_peer, "report_dead_connection")
		end
	end

	return 
end
function BaseNetworkSession:on_peer_kicked(peer, peer_id, message_id)
	if peer ~= self._local_peer then
		if message_id == 0 then

			-- Decompilation error in this vicinity:
			slot7 = SystemInfo
			self._kicked_list[ident] = true
		end

		local reason = "kicked"

		if message_id == 1 then
			reason = "removed_dead"
		elseif message_id == 2 or message_id == 3 then
			reason = "auth_fail"
		end

		slot10 = reason

		self.remove_peer(slot6, self, peer, peer_id)
	else
		if message_id == 1 then
			Global.on_remove_peer_message = "dialog_remove_dead_peer"
		elseif message_id == 2 then
			Global.on_remove_peer_message = "dialog_authentication_fail"
		elseif message_id == 3 then
			Global.on_remove_peer_message = "dialog_authentication_host_fail"
		elseif message_id == 4 then
			Global.on_remove_peer_message = "dialog_cheated_host"
		end

		slot6 = "IVE BEEN KICKED!"

		print(slot5)

		slot6 = self

		if self._local_peer_in_lobby(slot5) then
			slot6 = "KICKED FROM LOBBY"

			print(slot5)

			slot6 = managers.menu

			managers.menu.on_leave_lobby(slot5)

			slot6 = managers.menu

			managers.menu.show_peer_kicked_dialog(slot5)
		else
			slot6 = "KICKED FROM INGAME"

			print(slot5)

			slot6 = managers.network.matchmake

			managers.network.matchmake.destroy_game(slot5)

			slot6 = managers.network.voice_chat

			managers.network.voice_chat.destroy_voice(slot5)

			slot6 = game_state_machine

			if game_state_machine.current_state(slot5).on_kicked then
				slot6 = game_state_machine
				slot6 = game_state_machine.current_state(slot5)

				game_state_machine.current_state(slot5).on_kicked(slot5)
			end
		end
	end

	return 
end
function BaseNetworkSession:_local_peer_in_lobby()
	slot3 = self._local_peer

	if self._local_peer.in_lobby(slot2) then
		slot3 = game_state_machine

		return game_state_machine.current_state_name(slot2) ~= "ingame_lobby_menu"
	end
end
function BaseNetworkSession:update_skip_one()
	self.update = nil
	slot3 = TimerManager
	slot3 = TimerManager.wall(slot2)
	local wall_time = TimerManager.wall(slot2).time(slot2)
	self._timeout_chk_t = wall_time + self.TIMEOUT_CHK_INTERVAL

	return 
end
function BaseNetworkSession:update()
	slot3 = TimerManager
	slot3 = TimerManager.wall(slot2)
	local wall_time = TimerManager.wall(slot2).time(slot2)

	if self._timeout_chk_t < wall_time then
		slot4 = self._peers

		for peer_id, peer in pairs(slot3) do
			if not managers.worldcollection.level_transition_in_progress and not self._local_peer.loading_worlds then
				slot9 = peer

				if not peer.loading(slot8) then
					slot10 = peer
					local loading = not self.chk_peer_worlds_loaded(slot8, self)
				end
			end

			slot11 = (loading and self.LOADING_CONNECTION_TIMEOUT) or self.CONNECTION_TIMEOUT

			peer.chk_timeout(slot9, peer)
		end

		self._timeout_chk_t = wall_time + self.TIMEOUT_CHK_INTERVAL
	end

	if self._closing then
		slot4 = self

		if self.is_ready_to_close(slot3) then
			self._closing = false
			slot4 = managers.network

			managers.network.queue_stop_network(slot3)
		end
	end

	slot5 = wall_time

	self.upd_trash_connections(slot3, self)

	slot5 = wall_time

	self.send_steam_p2p_msgs(slot3, self)

	return 
end
function BaseNetworkSession:end_update()
	return 
end
function BaseNetworkSession:send_to_peers(...)
	slot3 = self._peers

	for peer_id, peer in pairs(slot2) do
		slot8 = peer

		peer.send(slot7, ...)
	end

	return 
end
function BaseNetworkSession:send_to_peers_ip_verified(...)
	slot3 = self._peers

	for peer_id, peer in pairs(slot2) do
		slot8 = peer

		if peer.ip_verified(slot7) then
			slot8 = peer

			peer.send(slot7, ...)
		end
	end

	return 
end
function BaseNetworkSession:send_to_peers_except(id, ...)
	slot4 = self._peers

	for peer_id, peer in pairs(slot3) do
		if peer_id ~= id then
			slot9 = peer

			peer.send(slot8, ...)
		end
	end

	return 
end
function BaseNetworkSession:send_to_peers_synched(...)
	slot3 = self._peers

	for peer_id, peer in pairs(slot2) do
		slot8 = peer

		peer.send_queued_sync(slot7, ...)
	end

	return 
end
function BaseNetworkSession:send_to_peers_synched_except(id, ...)
	slot4 = self._peers

	for peer_id, peer in pairs(slot3) do
		if peer_id ~= id then
			slot9 = peer

			peer.send_queued_sync(slot8, ...)
		end
	end

	return 
end
function BaseNetworkSession:send_to_peers_loaded(...)
	slot3 = self._peers

	for peer_id, peer in pairs(slot2) do
		slot8 = peer

		peer.send_after_load(slot7, ...)
	end

	return 
end
function BaseNetworkSession:send_to_peers_loaded_except(id, ...)
	slot4 = self._peers

	for peer_id, peer in pairs(slot3) do
		if peer_id ~= id then
			slot9 = peer

			peer.send_after_load(slot8, ...)
		end
	end

	return 
end
function BaseNetworkSession:send_to_peer(peer, ...)
	slot4 = peer

	peer.send(slot3, ...)

	return 
end
function BaseNetworkSession:send_to_peer_synched(peer, ...)
	slot4 = peer

	peer.send_queued_sync(slot3, ...)

	return 
end
function BaseNetworkSession:has_recieved_ok_to_load_level()
	return self._recieved_ok_to_load_level
end
function BaseNetworkSession:_load_level(...)
	slot4 = "[BaseNetworkSession:_load_level]"

	Application.debug(slot2, Application)

	slot4 = true

	self._local_peer.set_loading(slot2, self._local_peer)

	slot4 = true

	Network.set_multiplayer(slot2, Network)

	slot3 = setup

	setup.load_level(slot2, ...)

	slot3 = TimerManager
	slot3 = TimerManager.wall(slot2)
	self._load_wait_timeout_t = TimerManager.wall(slot2).time(slot2) + self._LOAD_WAIT_TIME

	return 
end
function BaseNetworkSession:_load_lobby(...)
	slot3 = managers.menu

	managers.menu.on_leave_active_job(slot2)

	slot4 = true

	self._local_peer.set_loading(slot2, self._local_peer)

	slot4 = true

	Network.set_multiplayer(slot2, Network)

	slot3 = setup

	setup.load_start_menu_lobby(slot2, ...)

	slot3 = TimerManager
	slot3 = TimerManager.wall(slot2)
	self._load_wait_timeout_t = TimerManager.wall(slot2).time(slot2) + self._LOAD_WAIT_TIME

	return 
end
function BaseNetworkSession:debug_list_peers()
	slot3 = self._peers

	for i, peer in pairs(slot2) do
		slot10 = i
		slot13 = peer

		cat_print(slot7, "multiplayer_base", "Peer", peer.connection_info(slot12))
	end

	return 
end
function BaseNetworkSession:clbk_network_send(target_rpc, post_send)
	slot6 = 0
	local target_ip = target_rpc.ip_at_index(slot4, target_rpc)

	if post_send then
		if self._soft_remove_peers and self._soft_remove_peers[target_ip] then

			-- Decompilation error in this vicinity:
			local ok_to_delete = true
			local peer_remove_info = self._soft_remove_peers[target_ip]

			if ok_to_delete then
				slot11 = peer_remove_info.peer

				print(slot7, "[BaseNetworkSession:clbk_network_send] soft-removed peer", peer_remove_info.peer.id(target_ip))

				slot8 = peer_remove_info.peer

				peer_remove_info.peer.destroy(slot7)

				self._soft_remove_peers[target_ip] = nil
				slot8 = self._soft_remove_peers

				if not next(nil) then
					self._soft_remove_peers = false
				end
			end
		else
			local peer = nil
			slot8 = 0

			if target_rpc.protocol_at_index(slot6, target_rpc) == "TCP_IP" then
				slot8 = target_ip
				peer = self.peer_by_ip(slot6, self)
			else
				slot8 = target_ip
				peer = self.peer_by_user_id(slot6, self)
			end

			if not peer then
				slot8 = target_rpc

				self.add_connection_to_trash(slot6, self)
			end
		end
	else
		slot7 = target_ip
		local peer = self.peer_by_ip(slot5, self)

		if peer then
			slot7 = peer

			peer.on_send(slot6)
		end
	end

	return 
end
function BaseNetworkSession:is_ready_to_close()
	slot3 = self._peers

	for peer_id, peer in pairs(slot2) do
		slot8 = peer

		if peer.has_queued_rpcs(slot7) then
			slot9 = peer_id

			print(slot7, "[BaseNetworkSession:is_ready_to_close] waiting queued rpcs")
		end

		slot8 = peer

		if peer.is_loading_outfit_assets(slot7) then
			return false
		end

		slot8 = peer

		if not peer.rpc(slot7) then
			slot9 = peer_id

			print(slot7, "[BaseNetworkSession:is_ready_to_close] waiting rpc")

			return false
		end
	end

	return true
end
function BaseNetworkSession:closing()
	return self._closing
end
function BaseNetworkSession:prepare_to_close(skip_destroy_matchmaking)
	slot4 = "[BaseNetworkSession:prepare_to_close]"

	print(slot3)

	self._closing = true

	if not skip_destroy_matchmaking then
		slot4 = managers.network.matchmake

		managers.network.matchmake.destroy_game(slot3)
	end

	slot4 = Network

	Network.set_disconnected(slot3)

	return 
end
function BaseNetworkSession:set_peer_loading_state(peer, state, load_counter)
	slot9 = peer

	print(slot5, "[BaseNetworkSession:set_peer_loading_state]", peer.id(state))

	if Global.load_start_menu_lobby then
		return 
	end

	if not state then
		slot6 = self._local_peer

		if self._local_peer.loaded(slot5) then
			slot6 = peer

			if peer.ip_verified(slot5) then
				slot7 = peer

				self._local_peer.sync_lobby_data(slot5, self._local_peer)

				slot7 = peer

				self._local_peer.sync_data(slot5, self._local_peer)
			end

			slot6 = peer

			peer.flush_overwriteable_msgs(slot5)
		end
	end

	return 
end
function BaseNetworkSession:upd_trash_connections(wall_t)
	if self._trash_connections then
		slot4 = self._trash_connections

		for ip, info in pairs(slot3) do
			if info.expire_t < wall_t then
				local reset = true
				slot10 = self._peers

				for peer_id, peer in pairs(slot9) do

					-- Decompilation error in this vicinity:
					slot15 = peer
				end

				if reset then
					slot10 = "[BaseNetworkSession:upd_trash_connections] resetting connection:"
					slot14 = 0

					print(slot9, info.rpc.ip_at_index(slot12, info.rpc))

					slot11 = info.rpc

					Network.reset_connection(slot9, Network)
				end

				self._trash_connections[ip] = nil
			end
		end

		slot4 = self._trash_connections

		if not next(slot3) then
			self._trash_connections = nil
		end
	end

	if self._soft_remove_peers then
		slot4 = self._soft_remove_peers

		for peer_ip, info in pairs(slot3) do
			if info.expire_t < wall_t then
				slot9 = info.peer

				info.peer.destroy(slot8)

				self._soft_remove_peers[peer_ip] = nil

				break
			end
		end

		slot4 = self._soft_remove_peers

		if not next(slot3) then
			self._soft_remove_peers = nil
		end
	end

	return 
end
function BaseNetworkSession:add_connection_to_trash(rpc)
	slot5 = 0
	local wanted_ip = rpc.ip_at_index(slot3, rpc)
	self._trash_connections = self._trash_connections or {}

	if not self._trash_connections[wanted_ip] then
		print(slot4, "[BaseNetworkSession:add_connection_to_trash]")

		slot7 = TimerManager
		slot7 = TimerManager.wall(wanted_ip)
		self._trash_connections[wanted_ip] = {
			rpc = rpc,
			expire_t = TimerManager.wall(wanted_ip).time(wanted_ip) + self.CONNECTION_TIMEOUT
		}
	end

	return 
end
function BaseNetworkSession:remove_connection_from_trash(rpc)
	slot5 = 0
	local wanted_ip = rpc.ip_at_index(slot3, rpc)

	if self._trash_connections then
		if self._trash_connections[wanted_ip] then
			slot6 = wanted_ip

			print(slot4, "[BaseNetworkSession:remove_connection_from_trash]")
		end

		self._trash_connections[wanted_ip] = nil
		slot5 = self._trash_connections

		if not next(nil) then
			self._trash_connections = nil
		end
	end

	return 
end
function BaseNetworkSession:remove_connection_from_soft_remove_peers(rpc)
	if self._soft_remove_peers then
		slot6 = 0

		if self._soft_remove_peers[rpc.ip_at_index(slot4, rpc)] then
			slot6 = 0
			self._soft_remove_peers[rpc.ip_at_index(self._soft_remove_peers, rpc)] = nil

			if not next(rpc.ip_at_index(self._soft_remove_peers, rpc)) then
				self._soft_remove_peers = nil
			end
		end
	end

	return 
end
function BaseNetworkSession:chk_send_local_player_ready(streaming_worlds_finished)
	if streaming_worlds_finished then
		slot8 = self._local_peer
		slot9 = ""

		self.send_to_peers(slot3, self, "set_member_ready", self._local_peer.id(slot7), 1, 5)

		managers.player._need_to_send_player_status = true
	else
		local state = self._local_peer.waiting_for_player_ready(slot3)
		slot5 = self

		if self.is_host(self._local_peer) then
			slot9 = self._local_peer
			slot10 = ""

			self.send_to_peers_loaded(slot4, self, "set_member_ready", self._local_peer.id(slot8), (state and 1) or 0, 1)
		else
			slot9 = self._local_peer
			slot10 = ""

			self.send_to_host(slot4, self, "set_member_ready", self._local_peer.id(slot8), (state and 1) or 0, 1)
		end
	end

	return 
end
function BaseNetworkSession:destroy()
	slot3 = self._peers

	for _, peer in pairs(slot2) do
		slot8 = peer

		peer.end_ticket_session(slot7)

		slot8 = peer

		peer.destroy(slot7)
	end

	slot3 = self._local_peer

	self._local_peer.destroy(slot2)

	if self._dropin_complete_event_manager_id then
		slot4 = self._dropin_complete_event_manager_id

		EventManager.unregister_listener(slot2, EventManager)

		self._dropin_complete_event_manager_id = nil
	end

	return 
end
function BaseNetworkSession:_flush_soft_remove_peers()
	if self._soft_remove_peers then
		slot3 = self._soft_remove_peers

		for ip, peer_remove_info in pairs(slot2) do
			slot12 = peer_remove_info.peer

			cat_print(slot7, "multiplayer_base", "[BaseNetworkSession:destroy] soft-removed peer", peer_remove_info.peer.id(ip))

			slot8 = peer_remove_info.peer

			peer_remove_info.peer.destroy(slot7)
		end
	end

	self._soft_remove_peers = nil

	return 
end
function BaseNetworkSession:on_load_complete(simulation)
	slot4 = "[BaseNetworkSession:on_load_complete]"

	print(slot3, debug.traceback())

	if not simulation then
		slot5 = false

		self._local_peer.set_loading(slot3, self._local_peer)
	end

	if not setup.IS_START_MENU then
		slot5 = "PS3"

		if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
			slot4 = PSN
			slot9 = "ps3_disconnect"

			PSN.set_online_callback(slot3, callback(slot6, self, self))
		else
			slot5 = "PS4"

			if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
				slot4 = PSN
				slot9 = "ps4_disconnect"

				PSN.set_online_callback(slot3, callback(slot6, self, self))
			end
		end
	end

	return 
end
function BaseNetworkSession:send_loading_finished_to_peers()
	slot5 = self

	for peer_id, peer in pairs(self.peers(slot4)) do
		slot8 = peer

		if peer.ip_verified(slot7) then
			slot10 = peer_id

			Application.debug(slot7, Application, "[CoreWorldCollection:sync_loaded_packages] send level loaded to peer")

			slot11 = self._load_counter

			peer.send(slot7, peer, "set_loading_state", false)
		end
	end

	return 
end
function BaseNetworkSession:psn_disconnected()
	if Global.game_settings.single_player then
		return 
	end

	slot3 = game_state_machine

	if game_state_machine.current_state(slot2).on_disconnected then
		slot3 = game_state_machine
		slot3 = game_state_machine.current_state(slot2)

		game_state_machine.current_state(slot2).on_disconnected(slot2)
	end

	slot4 = true

	managers.network.voice_chat.destroy_voice(slot2, managers.network.voice_chat)

	return 
end
function BaseNetworkSession:steam_disconnected()
	if Global.game_settings.single_player then
		return 
	end

	slot3 = game_state_machine

	if game_state_machine.current_state(slot2).on_disconnected then
		slot3 = game_state_machine
		slot3 = game_state_machine.current_state(slot2)

		game_state_machine.current_state(slot2).on_disconnected(slot2)
	end

	slot4 = true

	managers.network.voice_chat.destroy_voice(slot2, managers.network.voice_chat)

	return 
end
function BaseNetworkSession:xbox_disconnected()
	if Global.game_settings.single_player then
		return 
	end

	slot3 = game_state_machine

	if game_state_machine.current_state(slot2).on_disconnected then
		slot3 = game_state_machine
		slot3 = game_state_machine.current_state(slot2)

		game_state_machine.current_state(slot2).on_disconnected(slot2)
	end

	slot4 = true

	managers.network.voice_chat.destroy_voice(slot2, managers.network.voice_chat)

	return 
end
function BaseNetworkSession:ps4_disconnect(connected)
	slot4 = managers.network.matchmake

	managers.network.matchmake.psn_disconnected(slot3)

	if not connected then
		slot5 = "disconnect"

		managers.platform.event(slot3, managers.platform)
	end

	return 
end
function BaseNetworkSession:ps3_disconnect(connected)
	slot5 = connected

	print(slot3, "BaseNetworkSession ps3_disconnect")

	if Global.game_settings.single_player then
		return 
	end

	if not connected then
		slot4 = PSN

		if not PSN.is_online(slot3) then
			slot4 = game_state_machine

			if game_state_machine.current_state(slot3).on_disconnected then
				slot4 = game_state_machine
				slot4 = game_state_machine.current_state(slot3)

				game_state_machine.current_state(slot3).on_disconnected(slot3)
			end

			slot5 = true

			managers.network.voice_chat.destroy_voice(slot3, managers.network.voice_chat)
		end
	end

	return 
end
function BaseNetworkSession:on_steam_p2p_ping(sender_rpc)
	slot5 = 0
	local user_id = sender_rpc.ip_at_index(slot3, sender_rpc)
	slot6 = user_id
	local peer = self.peer_by_user_id(sender_rpc, self)

	if not peer then
		slot7 = user_id

		print(slot5, "[BaseNetworkSession:on_steam_p2p_ping] unknown peer")

		return 
	end

	if self._server_protocol ~= "TCP_IP" then
		slot7 = self._server_protocol

		print(slot5, "[BaseNetworkSession:on_steam_p2p_ping] wrong server protocol")

		return 
	end

	slot7 = peer
	local final_rpc = self.resolve_new_peer_rpc(slot5, self)

	if not final_rpc then
		return 
	end

	slot7 = peer

	if peer.rpc(slot6) then
		slot8 = 0
		slot8 = peer
		slot9 = 0

		if final_rpc.ip_at_index(slot6, final_rpc) == peer.rpc(final_rpc).ip_at_index(final_rpc, peer.rpc(final_rpc)) then
			slot8 = 0
			slot8 = peer
			slot9 = 0

			if final_rpc.protocol_at_index(slot6, final_rpc) == peer.rpc(final_rpc).protocol_at_index(final_rpc, peer.rpc(final_rpc)) then
				slot8 = user_id
				local sender_ip = Network.get_ip_address_from_user_id(slot6, Network)
				slot11 = peer
				slot12 = 0
				slot9 = peer.rpc(slot10).ip_at_index(slot10, peer.rpc(slot10))
				slot12 = peer
				slot13 = 0

				print(Network, "[BaseNetworkSession:on_steam_p2p_ping] already had IP", peer.rpc(peer.rpc(slot10)).protocol_at_index(peer.rpc(slot10), peer.rpc(peer.rpc(slot10))))

				return 
			end
		end
	end

	slot8 = final_rpc

	peer.set_rpc(slot6, peer)

	slot8 = final_rpc

	Network.add_co_client(slot6, Network)

	slot8 = final_rpc

	self.remove_connection_from_trash(slot6, self)

	slot8 = final_rpc

	self.remove_connection_from_soft_remove_peers(slot6, self)

	slot9 = user_id

	self.chk_send_connection_established(slot6, self, nil)

	return 
end
function BaseNetworkSession:chk_send_connection_established(name, user_id, peer)

	-- Decompilation error in this vicinity:
	slot7 = "PS3"
	slot8 = user_id or ""
	slot11 = peer

	print(slot5, "[BaseNetworkSession:chk_send_connection_established] success", name or "", peer.id(slot10))

	if self._server_peer then
		slot7 = "connection_established"
		slot10 = peer

		self._server_peer.send(slot5, self._server_peer, peer.id(slot9))
	end

	return 
end
function BaseNetworkSession:send_steam_p2p_msgs(wall_t)
	if self._server_protocol ~= "TCP_IP" then
		return 
	end

	slot4 = SystemInfo

	if SystemInfo.platform(slot3) ~= self._ids_WIN32 then
		return 
	end

	slot4 = self._peers

	for peer_id, peer in pairs(slot3) do
		if peer ~= self._server_peer then
			slot9 = peer

			if not peer.ip_verified(slot8) then
				slot9 = peer
			end
		end
	end

	return 
end
function BaseNetworkSession:resolve_new_peer_rpc(new_peer, incomming_rpc)
	slot5 = SystemInfo

	if SystemInfo.platform(slot4) ~= self._ids_WIN32 then
		return incomming_rpc
	end

	slot8 = new_peer
	local new_peer_ip_address = Network.get_ip_address_from_user_id(slot4, new_peer.user_id(slot7))
	slot7 = new_peer_ip_address

	print(Network, "new_peer_ip_address")

	if new_peer_ip_address then
		slot7 = ":"
		local new_peer_ip_address_split = string.split(slot5, new_peer_ip_address)
		local new_peer_ip = new_peer_ip_address_split[1]
		local new_peer_port = new_peer_ip_address_split[2]
		local connect_port = new_peer_port
		slot13 = new_peer_port

		print(slot9, "new_peer_ip", new_peer_ip, "new_peer_port")

		slot11 = "192.168."

		if string.begins(slot9, new_peer_ip) then
			slot11 = NetworkManager.DEFAULT_PORT

			print(slot9, "using internal port")

			connect_port = NetworkManager.DEFAULT_PORT
		end

		slot13 = "TCP_IP"

		return Network.handshake(slot9, Network, new_peer_ip, connect_port)
	else
		slot7 = "[BaseNetworkSession:resolve_new_peer_rpc] could not resolve IP address!!!"

		Application.error(slot5, Application)

		return incomming_rpc
	end

	return 
end
function BaseNetworkSession:are_peers_done_streaming()
	slot3 = self._peers

	for peer_id, peer in pairs(slot2) do

		-- Decompilation error in this vicinity:
		slot8 = peer
	end

	return true
end
function BaseNetworkSession:peer_streaming_status()
	local status = 100
	local peer_name = nil
	slot5 = self._peers

	for peer_id, peer in pairs(slot4) do
		slot10 = peer
		local peer_status = peer.streaming_status(slot9)

		if peer_status <= status then
			slot11 = peer
			peer_name = peer.name(slot10)
			status = peer_status
		end
	end

	return peer_name, status
end
function BaseNetworkSession:are_all_peer_assets_loaded()

	-- Decompilation error in this vicinity:
	slot3 = self._local_peer
	slot3 = self._peers

	for peer_id, peer in pairs(slot2) do
		slot8 = peer

		if peer.waiting_for_player_ready(slot7) then
			slot8 = peer

			if not peer.is_outfit_loaded(slot7) then
				slot9 = peer_id

				print(slot7, "[BaseNetworkSession:are_all_peer_assets_loaded] still loading outfit")

				return false
			end
		end
	end

	return true
end
function BaseNetworkSession:_get_peer_outfit_versions_str()
	local outfit_versions_str = ""

	for peer_id = 1, 4, 1 do
		local peer = nil
		slot9 = self._local_peer

		if peer_id == self._local_peer.id(slot8) then
			peer = self._local_peer
		else
			peer = self._peers[peer_id]
		end

		if peer then
			slot9 = peer

			if peer.waiting_for_player_ready(slot8) then
				slot10 = peer_id
				slot12 = peer
				outfit_versions_str = outfit_versions_str .. tostring(slot9) .. "-" .. peer.outfit_version(slot11) .. "."
			end
		end
	end

	return outfit_versions_str
end
function BaseNetworkSession:on_peer_outfit_loaded(peer)
	slot4 = "[BaseNetworkSession:on_peer_outfit_loaded]"
	slot7 = peer

	print(slot3, inspect(slot6))

	return 
end
function BaseNetworkSession:set_packet_throttling_enabled(state)
	slot4 = self._peers

	for peer_id, peer in pairs(slot3) do
		slot10 = state

		peer.set_throttling_enabled(slot8, peer)
	end

	return 
end
function BaseNetworkSession:load_counter()
	return self._load_counter
end
function BaseNetworkSession:check_send_outfit(peer)
	slot4 = managers.blackmarket

	if managers.blackmarket.signature(slot3) then
		if peer then
			slot9 = self
			slot10 = managers.blackmarket

			peer.send_queued_sync(slot3, peer, "sync_outfit", managers.blackmarket.outfit_string(self.local_peer(managers.blackmarket).outfit_version(managers.blackmarket)), managers.blackmarket.signature(self.local_peer(managers.blackmarket)))
		else
			slot9 = self
			slot10 = managers.blackmarket

			self.send_to_peers_loaded(slot3, self, "sync_outfit", managers.blackmarket.outfit_string(self.local_peer(managers.blackmarket).outfit_version(managers.blackmarket)), managers.blackmarket.signature(self.local_peer(managers.blackmarket)))
		end
	end

	return 
end
function BaseNetworkSession:on_network_stopped()
	for k = 1, 4, 1 do
		slot10 = false

		self.on_drop_in_pause_request_received(slot6, self, k, nil)

		slot8 = k
		local peer = self.peer(slot6, self)

		if peer then
			slot8 = peer

			peer.unit_delete(slot7)
		end
	end

	if self._local_peer then
		slot6 = self._local_peer
		slot6 = false

		self.on_drop_in_pause_request_received(slot2, self, self._local_peer.id(slot5), nil)
	end

	return 
end
function BaseNetworkSession:on_peer_entered_lobby(peer)
	slot5 = true

	peer.set_in_lobby(slot3, peer)

	slot4 = peer

	if peer.ip_verified(slot3) then
		slot5 = peer

		self._local_peer.sync_lobby_data(slot3, self._local_peer)
	end

	return 
end
function BaseNetworkSession:on_entered_lobby()
	local id = self._local_peer.id(slot2)
	slot5 = true

	self._local_peer.set_in_lobby(self._local_peer, self._local_peer)

	if id ~= 1 then
		slot4 = self
		slot8 = 1

		self.on_peer_entered_lobby(slot3, self.peer(slot6, self))
	end

	slot5 = "set_peer_entered_lobby"

	self.send_to_peers_loaded(slot3, self)

	slot7 = id

	cat_print(slot3, "multiplayer_base", "BaseNetworkSession:on_entered_lobby", self._local_peer)

	return 
end
function BaseNetworkSession:check_peer_preferred_character(preferred_character)
	local free_characters = clone(CriminalsManager.character_names())
	slot5 = self._peers_all

	for _, peer in pairs(CriminalsManager.character_names) do
		local character = peer.character(slot9)
		slot12 = character

		table.delete(peer, free_characters)
	end

	slot6 = " "
	local preferreds = string.split(slot4, preferred_character)
	slot6 = preferreds

	for _, preferred in ipairs(preferred_character) do
		slot12 = preferred

		if table.contains(slot10, free_characters) then
			return preferred
		end
	end

	slot6 = #free_characters
	local character = free_characters[math.random(slot5)]

	return character
end
function BaseNetworkSession:_has_client(peer)
	slot5 = Network
	slot5 = Network.clients(slot4)

	for i = 0, Network.clients(slot4).num_peers(slot4) - 1, 1 do
		slot8 = Network
		slot9 = i
		slot9 = peer

		if Network.clients(slot7).ip_at_index(slot7, Network.clients(slot7)) == peer.ip(Network.clients(slot7)) then
			return true
		end
	end

	return false
end
function BaseNetworkSession:on_peer_loading(peer, state)
	slot9 = peer

	cat_print(slot4, "multiplayer_base", "[BaseNetworkSession:on_peer_loading]", inspect(state))

	slot5 = Network

	if Network.is_server(slot4) and not state then
		slot6 = peer

		if not self._has_client(slot4, self) then
			slot5 = Network
			slot8 = peer

			Network.remove_co_client(slot4, peer.rpc(slot7))

			slot5 = Network
			slot8 = peer

			Network.add_client(slot4, peer.rpc(slot7))
		end

		if not NetworkManager.DROPIN_ENABLED then
			slot5 = peer

			peer.on_sync_start(slot4)

			slot5 = peer

			peer.chk_enable_queue(slot4)

			slot5 = Network
			slot8 = peer

			Network.drop_in(slot4, peer.rpc(slot7))
		end
	end

	if state and peer == self._server_peer then
		slot7 = peer
		slot10 = peer

		cat_print(slot4, "multiplayer_base", "  SERVER STARTED LOADING", peer.id(slot9))

		slot5 = self._local_peer

		if self._local_peer.in_lobby(slot4) then
			slot6 = "lobby_menu"
			local lobby_menu = managers.menu.get_menu(slot4, managers.menu)

			if lobby_menu then
				slot6 = lobby_menu.renderer

				if lobby_menu.renderer.is_open(slot5) then
					slot7 = "loading"

					lobby_menu.renderer.set_server_state(slot5, lobby_menu.renderer)
				end
			end
		end
	end

	return 
end
function BaseNetworkSession:spawn_member_by_id(peer_id, spawn_point_id, is_drop_in, state_transition)
	slot8 = peer_id
	local peer = self.peer(slot6, self)

	if peer then
		slot11 = state_transition

		peer.spawn_unit(slot7, peer, spawn_point_id, is_drop_in)
	end

	return 
end
function BaseNetworkSession:spawn_players(is_drop_in)
	slot4 = managers.network

	if not managers.network.has_spawn_points(slot3) then
		return 
	end

	if not self._spawn_point_beanbag then
		slot4 = self

		self._create_spawn_point_beanbag(slot3)
	end

	slot4 = Network

	if Network.is_server(slot3) then
		if not self._local_peer then
			return 
		end

		local id = self._get_next_spawn_point_id(slot3)
		slot5 = self._peers

		for _, peer in pairs(self) do
			slot10 = peer
			local character = peer.character(slot9)

			if character ~= "random" then
				slot14 = self
				slot14 = character

				peer.spawn_unit(slot10, peer, self._get_next_spawn_point_id(slot13), is_drop_in)
			end
		end

		local local_character = self._local_peer.character(slot4)
		slot9 = local_character ~= "random" and local_character

		self._local_peer.spawn_unit(self._local_peer, self._local_peer, id, false)

		slot6 = self._peers

		for _, peer in pairs(slot5) do
			slot11 = peer
			local character = peer.character(slot10)

			if character == "random" then
				slot15 = self

				peer.spawn_unit(slot11, peer, self._get_next_spawn_point_id(is_drop_in))
			end
		end

		slot7 = true

		self.set_game_started(slot5, self)
	end

	slot4 = managers.groupai
	slot5 = is_drop_in

	managers.groupai.state(slot3).fill_criminal_team_with_AI(slot3, managers.groupai.state(slot3))

	return 
end
function BaseNetworkSession:_get_next_spawn_point_id()
	local id = self._spawn_point_beanbag[self._next_i_spawn_point]

	if self._next_i_spawn_point == #self._spawn_point_beanbag then
		self._next_i_spawn_point = 1
	else
		self._next_i_spawn_point = self._next_i_spawn_point + 1
	end

	return id
end
function BaseNetworkSession:_create_spawn_point_beanbag()
	local spawn_points = managers.network._spawn_points
	local spawn_point_ids = {}
	self._spawn_point_beanbag = {}
	slot5 = spawn_points

	for sp_id, sp_data in pairs(slot4) do
		slot11 = sp_id

		table.insert(slot9, spawn_point_ids)
	end

	while 0 < #spawn_point_ids do
		slot5 = #spawn_point_ids
		local i_id = math.random(slot4)
		local random_id = spawn_point_ids[i_id]
		slot8 = random_id

		table.insert(slot6, self._spawn_point_beanbag)

		spawn_point_ids[i_id] = spawn_point_ids[#spawn_point_ids]
		slot7 = spawn_point_ids

		table.remove(slot6)
	end

	self._next_i_spawn_point = 1

	return 
end
function BaseNetworkSession:get_next_spawn_point()
	local id = self._get_next_spawn_point_id(slot2)
	slot5 = id

	return managers.network.spawn_point(self, managers.network)
end
function BaseNetworkSession:on_peer_sync_complete(peer, peer_id)
	if not self._local_peer then
		return 
	end

	slot5 = peer

	if not peer.ip_verified(slot4) then
		return 
	end

	slot5 = peer

	if peer.ip_verified(slot4) then
		slot6 = peer

		self._local_peer.sync_lobby_data(slot4, self._local_peer)

		slot6 = peer

		self._local_peer.sync_data(slot4, self._local_peer)
	end

	slot6 = peer

	self._update_peer_ready_gui(slot4, self)

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = self

		self.check_start_game_intro(slot4)

		slot6 = peer_id

		managers.network.matchmake.add_player_info(slot4, managers.network.matchmake)
	end

	return 
end
function BaseNetworkSession:on_streaming_progress_received(peer, progress)
	slot5 = peer

	if not peer.synched(slot4) then
		return 
	end

	if progress == 100 then
		slot6 = peer

		self._update_peer_ready_gui(slot4, self)
	end

	return 
end
function BaseNetworkSession:on_dropin_progress_received(dropin_peer_id, progress_percentage)
	slot6 = dropin_peer_id
	local peer = self.peer(slot4, self)
	slot6 = peer

	if peer.synched(self) then
		return 
	end

	slot6 = peer
	local old_drop_in_prog = peer.drop_in_progress(slot5)

	if not old_drop_in_prog or old_drop_in_prog < progress_percentage then
		slot8 = progress_percentage

		peer.set_drop_in_progress(slot6, peer)

		slot7 = game_state_machine

		if game_state_machine.last_queued_state_name(slot6) == "ingame_waiting_for_players" then
		else
			slot9 = progress_percentage

			managers.menu.update_person_joining(slot6, managers.menu, dropin_peer_id)
		end
	end

	return 
end
function BaseNetworkSession:on_set_member_ready(peer_id, ready, state_changed, from_network)
	slot11 = state_changed

	Application.debug(slot6, Application, "[BaseNetworkSession:on_set_member_ready]", peer_id, ready)

	slot8 = peer_id
	local peer = self.peer(slot6, self)
	peer._is_ready = ready

	return 
end
function BaseNetworkSession:check_start_game_intro(skip_streamer_check)
	slot4 = self

	if not self.chk_all_handshakes_complete(slot3) then
		return 
	end

	slot4 = self._peers_all

	for _, peer in pairs(slot3) do
		slot9 = peer

		if not peer.waiting_for_player_ready(slot8) then
			slot12 = peer

			print(slot8, "[BaseNetworkSession:check_start_game_intro]", peer.id("not ready"))

			return 
		end

		slot9 = peer

		if not peer.synched(slot8) then
			slot12 = peer

			print(slot8, "[BaseNetworkSession:check_start_game_intro]", peer.id("not synched"))

			return 
		end
	end

	slot4 = self

	if not self.chk_send_ready_to_unpause(slot3) then
		return 
	end

	slot4 = game_state_machine

	if game_state_machine.current_state(slot3).start_game_intro then
		slot4 = game_state_machine
		slot4 = game_state_machine.current_state(slot3)

		game_state_machine.current_state(slot3).start_game_intro(slot3)
	end

	return 
end
function BaseNetworkSession:_update_peer_ready_gui(peer)

	-- Decompilation error in this vicinity:
	slot4 = peer

	return 
end
function BaseNetworkSession:on_drop_in_pause_request_received(peer_id, nickname, state)
	slot9 = state

	print(slot5, "[BaseNetworkSession:on_drop_in_pause_request_received]", peer_id, nickname)

	local status_changed = false
	slot8 = game_state_machine
	local is_playing = BaseNetworkHandler._gamestate_filter.any_ingame_playing[game_state_machine.last_queued_state_name(peer_id)]

	if state then
		slot8 = self

		if not self.closing(slot7) then
			status_changed = true
			self._dropin_pause_info[peer_id] = nickname

			if is_playing then
				slot10 = nickname

				managers.menu.show_person_joining(slot7, managers.menu, peer_id)
			end
		end
	elseif self._dropin_pause_info[peer_id] then
		status_changed = true
		slot8 = self._local_peer

		if peer_id == self._local_peer.id(slot7) then
			self._dropin_pause_info[peer_id] = nil
			slot9 = peer_id

			managers.menu.close_person_joining(nil, managers.menu)
		else
			self._dropin_pause_info[peer_id] = nil
			slot9 = peer_id

			managers.menu.close_person_joining(nil, managers.menu)
		end
	end

	if status_changed then
		if state then
			slot8 = self

			if not self.closing(slot7) then
				slot8 = self._dropin_pause_info

				if table.size(slot7) == 1 then
					slot8 = "DROP-IN PAUSE"

					print(slot7)

					slot9 = true

					Application.set_pause(slot7, Application)

					slot10 = 0

					SoundDevice.set_rtpc(slot7, SoundDevice, "ingame_sound")
				end

				slot8 = Network

				if Network.is_client(slot7) then
					slot10 = peer_id

					self.send_to_host(slot7, self, "drop_in_pause_confirmation")
				end
			end
		else
			slot8 = self._dropin_pause_info

			if not next(slot7) then
				slot8 = "DROP-IN UNPAUSE"

				print(slot7)

				slot9 = false

				Application.set_pause(slot7, Application)

				slot10 = 1

				SoundDevice.set_rtpc(slot7, SoundDevice, "ingame_sound")
			else
				slot8 = "MAINTAINING DROP-IN UNPAUSE. # dropping peers:"
				slot11 = self._dropin_pause_info

				print(slot7, table.size(slot10))
			end
		end
	end

	return 
end
function BaseNetworkSession:chk_peer_worlds_loaded(peer)
	local local_peer = self._local_peer
	local found = true
	slot6 = local_peer._synced_worlds

	for world_id, data in pairs(slot5) do
		if data[CoreWorldCollection.STAGE_LOAD] and peer._synced_worlds and peer._synced_worlds[world_id] and peer._synced_worlds[world_id][CoreWorldCollection.STAGE_PREPARE] and not peer._synced_worlds[world_id][CoreWorldCollection.STAGE_LOAD] then
			found = false
		end
	end

	return found
end
function BaseNetworkSession:chk_all_peers_spawned(skip_local_peer)
	local result = true
	local peers = nil

	if skip_local_peer then
		peers = self._peers
	else
		peers = self._peers_all
	end

	slot6 = peers

	for peer_id, peer in pairs(slot5) do
		slot11 = peer

		if not peer.spawn_unit_called(slot10) then
			result = false
		end
	end

	return result
end
function BaseNetworkSession:on_statistics_recieved(peer_id, peer_kills, peer_specials_kills, peer_head_shots, accuracy, downs, revives)
	slot11 = peer_id
	local peer = self.peer(slot9, self)
	slot16 = downs

	peer.set_statistics(self, peer, peer_kills, peer_specials_kills, peer_head_shots, accuracy)

	slot11 = self._peers_all

	for _, peer in pairs(self) do
		slot16 = peer

		if peer.has_statistics(slot15) then
		else
			slot16 = peer

			if peer.waiting_for_player_ready(slot15) then
				slot16 = peer

				if not peer.has_statistics(slot15) then
					return 
				end
			end
		end
	end

	local total_kills = 0
	local total_specials_kills = 0
	local total_head_shots = 0
	local best_killer = {
		score = 0
	}
	local best_special_killer = {
		score = 0
	}
	local best_accuracy = {
		score = 0
	}
	local group_accuracy = 0
	local group_downs = 0
	local most_downs = {
		score = 0
	}
	slot20 = self._peers_all

	for _, peer in pairs(slot19) do
		slot25 = peer

		if peer.has_statistics(slot24) then
			slot25 = peer
			local stats = peer.statistics(slot24)
			total_kills = total_kills + stats.total_kills
			total_specials_kills = total_specials_kills + stats.total_specials_kills
			total_head_shots = total_head_shots + stats.total_head_shots
			group_accuracy = group_accuracy + stats.accuracy
			group_downs = group_downs + stats.downs

			if best_killer.score < stats.total_kills or not best_killer.peer_id then
				best_killer.score = stats.total_kills
				slot26 = peer
				best_killer.peer_id = peer.id(slot25)
			end

			if best_special_killer.score < stats.total_specials_kills or not best_special_killer.peer_id then
				best_special_killer.score = stats.total_specials_kills
				slot26 = peer
				best_special_killer.peer_id = peer.id(slot25)
			end

			if best_accuracy.score < stats.accuracy or not best_accuracy.peer_id then
				best_accuracy.score = stats.accuracy
				slot26 = peer
				best_accuracy.peer_id = peer.id(slot25)
			end

			if most_downs.score < stats.downs or not most_downs.peer_id then
				most_downs.score = stats.downs
				slot26 = peer
				most_downs.peer_id = peer.id(slot25)
			end
		end
	end

	slot22 = self._peers_all
	slot20 = group_accuracy / table.size(slot21)
	group_accuracy = math.floor(slot19)
	slot26 = total_head_shots

	print(slot19, "result is", "total_kills", total_kills, "total_specials_kills", total_specials_kills, "total_head_shots")

	slot22 = best_killer

	print(inspect("total_kills"))

	slot22 = best_special_killer

	print(inspect("total_kills"))

	slot22 = best_accuracy.peer_id

	print(inspect("total_kills"))

	slot20 = game_state_machine

	if game_state_machine.current_state(slot19).on_statistics_result then
		slot20 = game_state_machine
		slot33 = group_downs

		game_state_machine.current_state(slot19).on_statistics_result(slot19, game_state_machine.current_state(slot19), best_killer.peer_id, best_killer.score, best_special_killer.peer_id, best_special_killer.score, best_accuracy.peer_id, best_accuracy.score, most_downs.peer_id, most_downs.score, total_kills, total_specials_kills, total_head_shots, group_accuracy)
	end

	slot34 = group_downs

	self.send_to_peers(slot19, self, "sync_statistics_result", best_killer.peer_id, best_killer.score, best_special_killer.peer_id, best_special_killer.score, best_accuracy.peer_id, best_accuracy.score, most_downs.peer_id, most_downs.score, total_kills, total_specials_kills, total_head_shots, group_accuracy)

	return 
end

return 
