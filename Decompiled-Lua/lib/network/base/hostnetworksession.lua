-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

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
slot0 = require
slot2 = "lib/network/base/session_states/HostStateBase"

slot0(slot1)

slot0 = require
slot2 = "lib/network/base/session_states/HostStateInLobby"

slot0(slot1)

slot0 = require
slot2 = "lib/network/base/session_states/HostStateInGame"

slot0(slot1)

slot0 = require
slot2 = "lib/network/base/session_states/HostStateLoading"

slot0(slot1)

slot0 = require
slot2 = "lib/network/base/session_states/HostStateGameEnd"

slot0(slot1)

slot0 = require
slot2 = "lib/network/base/session_states/HostStateClosing"

slot0(slot1)

slot0 = HostNetworkSession

if not slot0 then
	slot0 = class
	slot2 = BaseNetworkSession
	slot0 = slot0(slot1)
end

HostNetworkSession = slot0
slot0 = HostNetworkSession
slot1 = {}
slot2 = HostStateInLobby
slot1.in_lobby = slot2
slot2 = HostStateLoading
slot1.loading = slot2
slot2 = HostStateInGame
slot1.in_game = slot2
slot2 = HostStateGameEnd
slot1.game_end = slot2
slot2 = HostStateClosing
slot1.closing = slot2
slot0._STATES = slot1
slot0 = HostNetworkSession
slot1 = math
slot1 = slot1.max
slot3 = HostNetworkSession
slot3 = slot3.CONNECTION_TIMEOUT
slot4 = HostNetworkSession
slot4 = slot4.LOADING_CONNECTION_TIMEOUT
slot1 = slot1(slot2, slot3)
slot1 = slot1 + 1.5
slot0._DEAD_CONNECTION_REPORT_PROCESS_DELAY = slot1
slot0 = HostNetworkSession
slot1 = {
	1,
	1024
}
slot0._LOAD_COUNTER_LIMITS = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = HostNetworkSession
	slot1 = slot1.super
	slot1 = slot1.init
	slot3 = self

	slot1(slot2)

	slot1 = {
		session = self
	}
	slot2 = self._peers
	slot1.peers = slot2
	slot2 = self._kicked_list
	slot1.kicked_list = slot2
	self._state_data = slot1
	slot1 = math
	slot1 = slot1.random
	slot3 = 1
	slot4 = 100
	slot1 = slot1(slot2, slot3)
	self._peer_outfit_loaded_status_request_id = slot1
	slot1 = math
	slot1 = slot1.random
	slot3 = self._LOAD_COUNTER_LIMITS
	slot3 = slot3[1]
	slot4 = self._LOAD_COUNTER_LIMITS
	slot4 = slot4[2]
	slot1 = slot1(slot2, slot3)
	self._load_counter = slot1
	slot1 = print
	slot3 = "[HostNetworkSession:init] self._load_counter"
	slot4 = self._load_counter

	slot1(slot2, slot3)

	return 
end

slot0.init = slot1
slot0 = HostNetworkSession

function slot1(self, load_outfit)
	slot2 = Application
	slot4 = slot2
	slot2 = slot2.editor
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = managers
		slot2 = slot2.blackmarket
		slot4 = slot2
		slot2 = slot2.aquire_default_weapons

		slot2(slot3)

		slot2 = managers
		slot2 = slot2.blackmarket
		slot4 = slot2
		slot2 = slot2._verfify_equipped

		slot2(slot3)
	end

	slot2 = HostNetworkSession
	slot2 = slot2.super
	slot2 = slot2.create_local_peer
	slot4 = self
	slot5 = load_outfit

	slot2(slot3, slot4)

	slot2 = self._state_data
	slot3 = self._local_peer
	slot2.local_peer = slot3
	slot4 = self
	slot2 = self.register_local_peer
	slot5 = 1

	slot2(slot3, slot4)

	slot4 = self
	slot2 = self.set_state
	slot5 = "in_lobby"

	slot2(slot3, slot4)

	slot2 = Network
	slot4 = slot2
	slot2 = slot2.multiplayer
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = Network
		slot4 = slot2
		slot2 = slot2.set_server

		slot2(slot3)
	end

	return 
end

slot0.create_local_peer = slot1
slot0 = HostNetworkSession

function slot1(self, peer_name, preferred_character, dlcs, xuid, peer_level, gameversion, join_attempt_identifier, auth_ticket, sender)
	slot10 = self._state
	slot10 = slot10.on_join_request_received

	if slot10 then
		slot10 = self._state
		slot12 = slot10
		slot10 = slot10.on_join_request_received
		slot13 = self._state_data
		slot14 = peer_name
		slot15 = preferred_character
		slot16 = dlcs
		slot17 = xuid
		slot18 = peer_level
		slot19 = gameversion
		slot20 = join_attempt_identifier
		slot21 = auth_ticket
		slot22 = sender
		slot10 = slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21)
	end

	return slot10
end

slot0.on_join_request_received = slot1
slot0 = HostNetworkSession

function slot1(self, ...)
	slot1 = debug_pause
	slot3 = "[HostNetworkSession:send_to_host] This is dumb. call the function directly instead of sending it..."

	slot1(slot2)

	return 
end

slot0.send_to_host = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = true

	return slot1
end

slot0.is_host = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = false

	return slot1
end

slot0.is_client = slot1
slot0 = HostNetworkSession

function slot1(self, ...)
	slot1 = Application
	slot3 = slot1
	slot1 = slot1.debug
	slot4 = "[HostNetworkSession:load_level()]"

	slot1(slot2, slot3, ...)

	slot3 = self
	slot1 = self._inc_load_counter

	slot1(slot2)

	slot1 = self._state
	slot3 = slot1
	slot1 = slot1.on_load_level
	slot4 = self._state_data

	slot1(slot2, slot3)

	slot1 = managers
	slot1 = slot1.network
	slot1 = slot1.matchmake
	slot3 = slot1
	slot1 = slot1.set_server_state
	slot4 = "loading"

	slot1(slot2, slot3)

	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for _, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.set_synched
		slot9 = false

		slot6(slot7, slot8)

		slot8 = peer
		slot6 = peer.set_loaded
		slot9 = false

		slot6(slot7, slot8)
	end

	slot1 = self._local_peer
	slot3 = slot1
	slot1 = slot1.set_loaded
	slot4 = false

	slot1(slot2, slot3)

	slot3 = self
	slot1 = self.set_state
	slot4 = "closing"

	slot1(slot2, slot3)

	slot3 = self
	slot1 = self.send_to_peers
	slot4 = "set_loading_state"
	slot5 = true
	slot6 = self._load_counter

	slot1(slot2, slot3, slot4, slot5)

	slot3 = self
	slot1 = self._load_level

	slot1(slot2, ...)

	return 
end

slot0.load_level = slot1
slot0 = HostNetworkSession

function slot1(self, ...)
	slot3 = self
	slot1 = self._inc_load_counter

	slot1(slot2)

	slot1 = managers
	slot1 = slot1.network
	slot1 = slot1.matchmake
	slot3 = slot1
	slot1 = slot1.set_server_state
	slot4 = "loading"

	slot1(slot2, slot3)

	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for _, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.set_synched
		slot9 = false

		slot6(slot7, slot8)

		slot8 = peer
		slot6 = peer.set_loaded
		slot9 = false

		slot6(slot7, slot8)

		slot8 = peer
		slot6 = peer.set_in_lobby
		slot9 = true

		slot6(slot7, slot8)
	end

	slot1 = self._local_peer
	slot3 = slot1
	slot1 = slot1.set_loaded
	slot4 = false

	slot1(slot2, slot3)

	slot3 = self
	slot1 = self.set_state
	slot4 = "closing"

	slot1(slot2, slot3)

	slot3 = self
	slot1 = self.send_to_peers
	slot4 = "set_loading_state"
	slot5 = true
	slot6 = self._load_counter

	slot1(slot2, slot3, slot4, slot5)

	slot3 = self
	slot1 = self.send_ok_to_load_lobby

	slot1(slot2)

	slot3 = self
	slot1 = self._load_lobby

	slot1(slot2, ...)

	return 
end

slot0.load_lobby = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = print
	slot3 = "[HostNetworkSession:broadcast_server_up]"

	slot1(slot2)

	slot1 = Network
	slot3 = slot1
	slot1 = slot1.broadcast
	slot4 = NetworkManager
	slot4 = slot4.DEFAULT_PORT
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot1 = slot1.server_up

	slot1(slot2)

	return 
end

slot0.broadcast_server_up = slot1
slot0 = HostNetworkSession

function slot1(self)
	return 
end

slot0.on_server_up_received = slot1
slot0 = HostNetworkSession

function slot1(self, data)
	slot2 = Global
	slot2 = slot2.load_start_menu_lobby

	if slot2 then
		slot4 = self
		slot2 = self.set_state
		slot5 = "in_lobby"

		slot2(slot3, slot4)
	else
		slot4 = self
		slot2 = self.set_state
		slot5 = "in_game"

		slot2(slot3, slot4)
	end

	slot2 = HostNetworkSession
	slot2 = slot2.super
	slot2 = slot2.load
	slot4 = self
	slot5 = data

	slot2(slot3, slot4)

	slot2 = {
		session = self
	}
	slot3 = self._peers
	slot2.peers = slot3
	slot3 = self._kicked_list
	slot2.kicked_list = slot3
	slot3 = self._local_peer
	slot2.local_peer = slot3
	self._state_data = slot2

	return 
end

slot0.load = slot1
slot0 = HostNetworkSession

function slot1(self, sender_peer, introduced_peer_id)
	slot3 = print
	slot5 = "[HostNetworkSession:on_peer_connection_established]"
	slot8 = sender_peer
	slot6 = sender_peer.id
	slot6 = slot6(slot7)
	slot7 = introduced_peer_id

	slot3(slot4, slot5, slot6)

	slot3 = self._peers
	slot3 = slot3[introduced_peer_id]

	if not slot3 then
		slot3 = print
		slot5 = "introduced peer does not exist. ignoring."

		slot3(slot4)

		return 
	end

	slot3 = print
	slot5 = "status:"
	slot8 = sender_peer
	slot6 = sender_peer.handshakes
	slot6 = slot6(slot7)
	slot6 = slot6[introduced_peer_id]
	slot7 = self._peers
	slot7 = slot7[introduced_peer_id]
	slot9 = slot7
	slot7 = slot7.handshakes
	slot7 = slot7(slot8)
	slot10 = sender_peer
	slot8 = sender_peer.id
	slot8 = slot8(slot9)
	slot7 = slot7[slot8]

	slot3(slot4, slot5, slot6)

	slot5 = sender_peer
	slot3 = sender_peer.handshakes
	slot3 = slot3(slot4)
	slot3 = slot3[introduced_peer_id]

	if slot3 == "asked" then
		slot5 = sender_peer
		slot3 = sender_peer.set_handshake_status
		slot6 = introduced_peer_id
		slot7 = "exchanging_info"

		slot3(slot4, slot5, slot6)

		slot3 = self._peers
		local introduced_peer = slot3[introduced_peer_id]
		slot6 = introduced_peer
		slot4 = introduced_peer.handshakes
		slot4 = slot4(slot5)
		slot7 = sender_peer
		slot5 = sender_peer.id
		slot5 = slot5(slot6)
		slot4 = slot4[slot5]

		if slot4 == "exchanging_info" then
			slot6 = sender_peer
			slot4 = sender_peer.send
			slot7 = "peer_exchange_info"
			slot8 = introduced_peer_id

			slot4(slot5, slot6, slot7)

			slot6 = introduced_peer
			slot4 = introduced_peer.send
			slot7 = "peer_exchange_info"
			slot10 = sender_peer
			slot8 = sender_peer.id

			slot4(slot5, slot6, slot8(slot9))
		end

		return 
	else
		slot5 = sender_peer
		slot3 = sender_peer.handshakes
		slot3 = slot3(slot4)
		slot3 = slot3[introduced_peer_id]

		if slot3 == "exchanging_info" then
			slot5 = sender_peer
			slot3 = sender_peer.set_handshake_status
			slot6 = introduced_peer_id
			slot7 = true

			slot3(slot4, slot5, slot6)
		else
			slot3 = print
			slot5 = "peer was not asked. ignoring."

			slot3(slot4)

			return 
		end
	end

	slot3 = self._state
	slot3 = slot3.on_handshake_confirmation

	if slot3 then
		slot3 = self._state
		slot5 = slot3
		slot3 = slot3.on_handshake_confirmation
		slot6 = self._state_data
		slot7 = sender_peer
		slot8 = introduced_peer_id

		slot3(slot4, slot5, slot6, slot7)
	end

	slot5 = sender_peer
	slot3 = sender_peer.loaded
	slot3 = slot3(slot4)

	if slot3 then
		slot10 = self._peers[introduced_peer_id]
		slot10 = ""

		sender_peer.send(slot4, sender_peer, "set_member_ready", introduced_peer_id, (self._peers[introduced_peer_id].waiting_for_player_ready(slot9) and 1) or 0, 1)
	end

	slot5 = self
	slot3 = self.chk_initiate_dropin_pause
	slot6 = sender_peer

	slot3(slot4, slot5)

	slot3 = self._peers
	slot3 = slot3[introduced_peer_id]

	if slot3 then
		slot5 = self
		slot3 = self.chk_initiate_dropin_pause
		slot6 = self._peers
		slot6 = slot6[introduced_peer_id]

		slot3(slot4, slot5)
	end

	return 
end

slot0.on_peer_connection_established = slot1
slot0 = HostNetworkSession

function slot1(self, state)
	self._game_started = state
	slot2 = self._state_data
	slot2.game_started = state

	if state then
		slot4 = self
		slot2 = self.set_state
		slot5 = "in_game"

		slot2(slot3, slot4)
	end

	return 
end

slot0.set_game_started = slot1
slot0 = HostNetworkSession

function slot1(self, rpc)
	local old_peer = nil
	slot5 = rpc
	slot3 = rpc.protocol_at_index
	slot6 = 0
	slot3 = slot3(slot4, slot5)

	if slot3 == "STEAM" then
		slot5 = self
		slot3 = self.peer_by_user_id
		slot8 = rpc
		slot6 = rpc.ip_at_index
		slot9 = 0
		slot3 = slot3(slot4, slot6(slot7, slot8))
		old_peer = slot3
	else
		slot5 = self
		slot3 = self.peer_by_ip
		slot8 = rpc
		slot6 = rpc.ip_at_index
		slot9 = 0
		slot3 = slot3(slot4, slot6(slot7, slot8))
		old_peer = slot3
	end

	return old_peer
end

slot0.chk_peer_already_in = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.send
		slot9 = "ok_to_load_level"
		slot10 = self._load_counter

		slot6(slot7, slot8, slot9)
	end

	return 
end

slot0.send_ok_to_load_level = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.send
		slot9 = "ok_to_load_lobby"
		slot10 = self._load_counter

		slot6(slot7, slot8, slot9)
	end

	return 
end

slot0.send_ok_to_load_lobby = slot1
slot0 = HostNetworkSession

function slot1(self, event, event_data)
	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.stopping
	slot3 = slot3(slot4)

	if slot3 then
		return 
	end

	slot5 = self
	slot3 = self.peer_by_ip
	slot6 = event_data.ip_address
	local peer = slot3(slot4, slot5)

	if not peer then
		slot4 = Application
		slot6 = slot4
		slot4 = slot4.error
		slot7 = "[HostNetworkSession:on_peer_save_received] A nonregistered peer confirmed save packet."

		slot4(slot5, slot6)

		return 
	end

	slot4 = event_data.index

	if slot4 then
		local packet_index = event_data.index
		local total_nr_packets = event_data.total
		local progress_ratio = packet_index / total_nr_packets
		slot7 = math
		slot7 = slot7.floor
		slot9 = math
		slot9 = slot9.clamp
		slot11 = progress_ratio * 100
		slot12 = 0
		slot13 = 100
		local progress_percentage = slot7(slot9(slot10, slot11, slot12))
		slot8 = BaseNetworkHandler
		slot8 = slot8._gamestate_filter
		slot8 = slot8.any_ingame_playing
		slot9 = game_state_machine
		slot11 = slot9
		slot9 = slot9.last_queued_state_name
		slot9 = slot9(slot10)
		local is_playing = slot8[slot9]

		if is_playing then
			slot9 = managers
			slot9 = slot9.menu
			slot11 = slot9
			slot9 = slot9.update_person_joining
			slot14 = peer
			slot12 = peer.id
			slot12 = slot12(slot13)
			slot13 = progress_percentage

			slot9(slot10, slot11, slot12)
		else
			slot9 = BaseNetworkHandler
			slot9 = slot9._gamestate_filter
			slot9 = slot9.any_ingame
			slot10 = game_state_machine
			slot12 = slot10
			slot10 = slot10.last_queued_state_name
			slot10 = slot10(slot11)
			slot9 = slot9[slot10]

			if slot9 then
			end
		end

		slot11 = self
		slot9 = self.send_to_peers_synched_except
		slot14 = peer
		slot12 = peer.id
		slot12 = slot12(slot13)
		slot13 = "dropin_progress"
		slot16 = peer
		slot14 = peer.id
		slot14 = slot14(slot15)
		slot15 = progress_percentage

		slot9(slot10, slot11, slot12, slot13, slot14)
	else
		slot4 = cat_print
		slot6 = "multiplayer_base"
		slot7 = "[HostNetworkSession:on_peer_save_received]"
		slot8 = peer
		slot11 = peer
		slot9 = peer.id

		slot4(slot5, slot6, slot7, slot9(slot10))

		slot6 = peer
		slot4 = peer.set_synched
		slot7 = true

		slot4(slot5, slot6)

		slot6 = peer
		slot4 = peer.send
		slot7 = "set_peer_synched"
		slot8 = 1

		slot4(slot5, slot6, slot7)

		slot4 = pairs
		slot6 = self._peers
		slot4, slot5, slot6 = slot4(slot5)

		for old_peer_id, old_peer in slot4, slot5, slot6 do
			if old_peer ~= peer then
				slot11 = old_peer
				slot9 = old_peer.synched
				slot9 = slot9(slot10)

				if slot9 then
					slot11 = peer
					slot9 = peer.send
					slot12 = "set_peer_synched"
					slot13 = old_peer_id

					slot9(slot10, slot11, slot12)
				end
			end
		end

		slot4 = pairs
		slot6 = self._peers
		slot4, slot5, slot6 = slot4(slot5)

		for _, old_peer in slot4, slot5, slot6 do
			if old_peer ~= peer then
				slot11 = old_peer
				slot9 = old_peer.send_after_load
				slot12 = "set_peer_synched"
				slot15 = peer
				slot13 = peer.id

				slot9(slot10, slot11, slot13(slot14))
			end
		end

		slot4 = NetworkManager
		slot4 = slot4.DROPIN_ENABLED

		if slot4 then
			slot4 = pairs
			slot6 = self._peers
			slot4, slot5, slot6 = slot4(slot5)

			for other_peer_id, other_peer in slot4, slot5, slot6 do
				slot11 = peer
				slot9 = peer.id
				slot9 = slot9(slot10)

				if other_peer_id ~= slot9 then
					slot11 = other_peer
					slot9 = other_peer.expecting_dropin
					slot9 = slot9(slot10)

					if slot9 then
						slot11 = self
						slot9 = self.set_dropin_pause_request
						slot12 = peer
						slot13 = other_peer_id
						slot14 = "asked"

						slot9(slot10, slot11, slot12, slot13)
					end
				end
			end

			slot4 = pairs
			slot6 = self._peers
			slot4, slot5, slot6 = slot4(slot5)

			for old_peer_id, old_peer in slot4, slot5, slot6 do
				slot11 = peer
				slot9 = peer.id
				slot9 = slot9(slot10)

				if old_peer_id ~= slot9 then
					slot11 = old_peer
					slot9 = old_peer.is_expecting_pause_confirmation
					slot14 = peer
					slot12 = peer.id
					slot9 = slot9(slot10, slot12(slot13))

					if slot9 then
					end
				end
			end

			slot4 = self._local_peer
			slot6 = slot4
			slot4 = slot4.is_expecting_pause_confirmation
			slot9 = peer
			slot7 = peer.id
			slot4 = slot4(slot5, slot7(slot8))

			if slot4 then
			end
		end

		slot6 = self
		slot4 = self.on_peer_sync_complete
		slot7 = peer
		slot10 = peer
		slot8 = peer.id

		slot4(slot5, slot6, slot8(slot9))
	end

	return 
end

slot0.on_peer_save_received = slot1
slot0 = HostNetworkSession

function slot1(self, t, dt)
	slot3 = HostNetworkSession
	slot3 = slot3.super
	slot3 = slot3.update
	slot5 = self

	slot3(slot4)

	slot5 = self
	slot3 = self.process_dead_con_reports

	slot3(slot4)

	slot5 = self
	slot3 = self.check_dropin
	slot6 = t
	slot7 = dt

	slot3(slot4, slot5, slot6)

	return 
end

slot0.update = slot1
slot0 = HostNetworkSession

function slot1(self, t, dt)

	-- Decompilation error in this vicinity:
	slot3 = self._next_dropin_check_t

	return 
end

slot0.check_dropin = slot1
slot0 = HostNetworkSession

function slot1(self, peer, state, load_counter)
	slot4 = print
	slot6 = "[HostNetworkSession:set_peer_loading_state]"
	slot9 = peer
	slot7 = peer.id
	slot7 = slot7(slot8)
	slot8 = state
	slot9 = load_counter

	slot4(slot5, slot6, slot7, slot8)

	slot4 = self._load_counter

	if load_counter ~= slot4 then
		slot4 = Application
		slot6 = slot4
		slot4 = slot4.error
		slot7 = "wrong load counter"
		slot8 = self._load_counter

		slot4(slot5, slot6, slot7)

		if not state then
			slot4 = Global
			slot4 = slot4.load_start_menu_lobby

			if slot4 then
				slot6 = self
				slot4 = self.send_ok_to_load_lobby

				slot4(slot5)
			else
				slot6 = self
				slot4 = self.send_ok_to_load_level

				slot4(slot5)
			end
		end

		return 
	end

	slot4 = HostNetworkSession
	slot4 = slot4.super
	slot4 = slot4.set_peer_loading_state
	slot6 = self
	slot7 = peer
	slot8 = state

	slot4(slot5, slot6, slot7)

	slot6 = peer
	slot4 = peer.set_loading
	slot7 = state

	slot4(slot5, slot6)

	slot4 = Global
	slot4 = slot4.load_start_menu_lobby

	if slot4 then
		return 
	end

	if not state then
		slot4 = pairs
		slot6 = self._peers
		slot4, slot5, slot6 = slot4(slot5)

		for other_peer_id, other_peer in slot4, slot5, slot6 do
			if other_peer ~= peer then
				slot11 = peer
				slot9 = peer.handshakes
				slot9 = slot9(slot10)
				slot9 = slot9[other_peer_id]

				if slot9 == true then
					slot16 = other_peer
					slot16 = ""

					peer.send_after_load(slot10, peer, "set_member_ready", other_peer_id, (other_peer.waiting_for_player_ready(slot15) and 1) or 0, 1)
				end
			end
		end

		slot11 = self._local_peer
		slot11 = ""

		peer.send_after_load(slot5, peer, "set_member_ready", self._local_peer.id(slot9), (self._local_peer.waiting_for_player_ready(self._local_peer) and 1) or 0, 1)

		slot6 = self._local_peer
		slot4 = self._local_peer.is_outfit_loaded(slot5)

		if slot4 then
			slot6 = peer
			slot4 = peer.send_after_load
			slot7 = "set_member_ready"
			slot8 = self._local_peer
			slot10 = slot8
			slot8 = slot8.id
			slot8 = slot8(slot9)
			slot9 = 100
			slot10 = 2
			slot11 = ""

			slot4(slot5, slot6, slot7, slot8, slot9, slot10)
		end

		slot6 = self
		slot4 = self.chk_request_peer_outfit_load_status

		slot4(slot5)

		slot4 = self._local_peer
		slot6 = slot4
		slot4 = slot4.loaded
		slot4 = slot4(slot5)

		if slot4 then
			slot4 = NetworkManager
			slot4 = slot4.DROPIN_ENABLED

			if slot4 then
				slot4 = self._state
				slot4 = slot4.on_peer_finished_loading

				if slot4 then
					slot4 = self._state
					slot6 = slot4
					slot4 = slot4.on_peer_finished_loading
					slot7 = self._state_data
					slot8 = peer

					slot4(slot5, slot6, slot7)
				end

				slot6 = peer
				slot4 = peer.set_expecting_pause_sequence
				slot7 = true

				slot4(slot5, slot6)

				slot6 = self
				slot4 = self.chk_initiate_dropin_pause
				slot7 = peer
				local dropin_pause_ok = slot4(slot5, slot6)

				if dropin_pause_ok then
					slot7 = self
					slot5 = self.chk_drop_in_peer
					slot8 = peer

					slot5(slot6, slot7)
				else
					slot5 = print
					slot7 = " setting set_expecting_pause_sequence"
					slot10 = peer
					slot8 = peer.id

					slot5(slot6, slot8(slot9))
				end
			end
		end
	end

	return 
end

slot0.set_peer_loading_state = slot1
slot0 = HostNetworkSession

function slot1(self, dropin_peer_id, sender_peer)
	slot3 = print
	slot5 = "[HostNetworkSession:on_drop_in_pause_confirmation_received]"
	slot8 = sender_peer
	slot6 = sender_peer.id
	slot6 = slot6(slot7)
	slot7 = " paused for "
	slot8 = dropin_peer_id

	slot3(slot4, slot5, slot6, slot7)

	slot5 = sender_peer
	slot3 = sender_peer.is_expecting_pause_confirmation
	slot6 = dropin_peer_id
	local is_expecting = slot3(slot4, slot5)
	slot4 = self._peers
	local dropin_peer = slot4[dropin_peer_id]

	if dropin_peer then
		slot7 = dropin_peer
		slot5 = dropin_peer.expecting_dropin
		slot5 = slot5(slot6)
	else
		slot7 = self
		slot5 = self.set_dropin_pause_request
		slot8 = sender_peer
		slot9 = dropin_peer_id
		slot10 = false

		slot5(slot6, slot7, slot8, slot9)

		if dropin_peer then
			slot7 = self
			slot5 = self.chk_initiate_dropin_pause
			slot8 = dropin_peer

			slot5(slot6, slot7)
		end
	end

	return 
end

slot0.on_drop_in_pause_confirmation_received = slot1
slot0 = HostNetworkSession

function slot1(self, dropin_peer)
	slot2 = print
	slot4 = "[HostNetworkSession:chk_initiate_dropin_pause]"
	slot7 = dropin_peer
	slot5 = dropin_peer.id

	slot2(slot3, slot5(slot6))

	slot4 = dropin_peer
	slot2 = dropin_peer.expecting_pause_sequence
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = print
		slot4 = "not expecting"

		slot2(slot3)

		return 
	end

	slot4 = self
	slot2 = self.chk_peer_handshakes_complete
	slot5 = dropin_peer
	slot2 = slot2(slot3, slot4)

	if not slot2 then
		slot2 = print
		slot4 = "misses handshakes"

		slot2(slot3)

		return 
	end

	slot2 = pairs
	slot4 = self._peers
	slot2, slot3, slot4 = slot2(slot3)

	for peer_id, peer in slot2, slot3, slot4 do
		slot9 = peer
		slot7 = peer.is_expecting_pause_confirmation
		slot12 = dropin_peer
		slot10 = dropin_peer.id
		local is_expecting = slot7(slot8, slot10(slot11))

		if is_expecting then
			slot8 = print
			slot10 = " peer"
			slot11 = peer_id
			slot12 = "is still to confirm"
			slot13 = is_expecting

			slot8(slot9, slot10, slot11, slot12)

			return 
		end
	end

	slot2 = pairs
	slot4 = self._peers
	slot2, slot3, slot4 = slot2(slot3)

	for other_peer_id, other_peer in slot2, slot3, slot4 do
		slot9 = dropin_peer
		slot7 = dropin_peer.id
		slot7 = slot7(slot8)

		if other_peer_id ~= slot7 then
			slot9 = other_peer
			slot7 = other_peer.is_expecting_pause_confirmation
			slot12 = dropin_peer
			slot10 = dropin_peer.id
			slot7 = slot7(slot8, slot10(slot11))

			if not slot7 then
				slot9 = self
				slot7 = self.set_dropin_pause_request
				slot10 = other_peer
				slot13 = dropin_peer
				slot11 = dropin_peer.id
				slot11 = slot11(slot12)
				slot12 = "asked"

				slot7(slot8, slot9, slot10, slot11)
			end
		end
	end

	slot2 = self._local_peer
	slot4 = slot2
	slot2 = slot2.is_expecting_pause_confirmation
	slot7 = dropin_peer
	slot5 = dropin_peer.id
	slot2 = slot2(slot3, slot5(slot6))

	if not slot2 then
		slot2 = self._local_peer
		slot4 = slot2
		slot2 = slot2.set_expecting_drop_in_pause_confirmation
		slot7 = dropin_peer
		slot5 = dropin_peer.id
		slot5 = slot5(slot6)
		slot6 = "paused"

		slot2(slot3, slot4, slot5)

		slot4 = self
		slot2 = self.on_drop_in_pause_request_received
		slot7 = dropin_peer
		slot5 = dropin_peer.id
		slot5 = slot5(slot6)
		slot8 = dropin_peer
		slot6 = dropin_peer.name
		slot6 = slot6(slot7)
		slot7 = true

		slot2(slot3, slot4, slot5, slot6)
	end

	slot4 = dropin_peer
	slot2 = dropin_peer.set_expecting_pause_sequence
	slot5 = nil

	slot2(slot3, slot4)

	slot4 = dropin_peer
	slot2 = dropin_peer.set_expecting_dropin
	slot5 = true

	slot2(slot3, slot4)

	slot2 = true

	return slot2
end

slot0.chk_initiate_dropin_pause = slot1
slot0 = HostNetworkSession

function slot1(self, dropin_peer)
	slot4 = dropin_peer
	slot2 = dropin_peer.id
	local dropin_peer_id = slot2(slot3)
	slot5 = dropin_peer
	slot3 = dropin_peer.expecting_dropin
	slot3 = slot3(slot4)

	if not slot3 then
		slot3 = print
		slot5 = "[HostNetworkSession:chk_drop_in_peer] not expecting drop-in"
		slot6 = dropin_peer_id

		slot3(slot4, slot5)

		return 
	end

	slot3 = print
	slot5 = "[HostNetworkSession:chk_drop_in_peer]"
	slot6 = dropin_peer_id
	slot7 = debug
	slot7 = slot7.traceback

	slot3(slot4, slot5, slot7())

	slot3 = pairs
	slot5 = self._peers
	slot3, slot4, slot5 = slot3(slot4)

	for peer_id, peer in slot3, slot4, slot5 do
		if dropin_peer_id ~= peer_id then
			slot10 = peer
			slot8 = peer.synched
			slot8 = slot8(slot9)

			if slot8 then
				slot10 = peer
				slot8 = peer.is_expecting_pause_confirmation
				slot11 = dropin_peer_id
				local is_expecting = slot8(slot9, slot10)

				if is_expecting ~= "paused" then
					slot9 = print
					slot11 = "peer"
					slot12 = peer_id
					slot13 = "is expected to confirm"
					slot14 = is_expecting

					slot9(slot10, slot11, slot12, slot13)

					if not is_expecting then
						slot9 = debug_pause
						slot11 = "was not asked!"

						slot9(slot10)
					end

					return 
				end
			end
		end
	end

	slot3 = print
	slot5 = "[HostNetworkSession:chk_drop_in_peer] doing drop-in!"

	slot3(slot4)

	slot5 = dropin_peer
	slot3 = dropin_peer.set_expecting_dropin
	slot6 = nil

	slot3(slot4, slot5)

	slot5 = dropin_peer
	slot3 = dropin_peer.on_sync_start

	slot3(slot4)

	slot5 = dropin_peer
	slot3 = dropin_peer.chk_enable_queue

	slot3(slot4)

	self._dropin_peer = dropin_peer
	slot3 = Network
	slot5 = slot3
	slot3 = slot3.drop_in
	slot8 = dropin_peer
	slot6 = dropin_peer.rpc

	slot3(slot4, slot6(slot7))

	slot3 = nil
	self._dropin_peer = slot3
	slot3 = true

	return slot3
end

slot0.chk_drop_in_peer = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = self._dropin_peer

	return slot1
end

slot0.dropin_peer = slot1
slot0 = HostNetworkSession

function slot1(self, name, rpc, in_lobby, loading, synched, id, character, user_id, xuid, xnaddr)
	if not id then
		slot13 = self
		slot11 = self._get_free_client_id
		slot11 = slot11(slot12)
		id = slot11
	end

	if not id then
		return 
	end

	if not name then
		slot11 = "Player "
		slot12 = tostring
		slot14 = id
		slot12 = slot12(slot13)
		name = slot11 .. slot12
	end

	local peer = nil
	slot12 = HostNetworkSession
	slot12 = slot12.super
	slot12 = slot12.add_peer
	slot14 = self
	slot15 = name
	slot16 = rpc
	slot17 = in_lobby
	slot18 = loading
	slot19 = synched
	slot20 = id
	slot21 = character
	slot22 = user_id
	slot23 = xuid
	slot24 = xnaddr
	slot12, slot13 = slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23)
	peer = slot13
	id = slot12
	slot14 = self
	slot12 = self.chk_server_joinable_state

	slot12(slot13)

	slot12 = id
	slot13 = peer

	return slot12, slot13
end

slot0.add_peer = slot1
slot0 = HostNetworkSession

function slot1(self)
	local i = 2

	repeat
		slot2 = self._peers
		slot2 = slot2[i]

		if not slot2 then
			local is_dirty = false
			slot3 = pairs
			slot5 = self._peers
			slot3, slot4, slot5 = slot3(slot4)

			for peer_id, peer in slot3, slot4, slot5 do
				slot10 = peer
				slot8 = peer.handshakes
				slot8 = slot8(slot9)
				slot8 = slot8[i]

				if slot8 then
					is_dirty = true
				end
			end

			if not is_dirty then
				return i
			end
		end

		i = i + 1
	until i == 5

	return 
end

slot0._get_free_client_id = slot1
slot0 = HostNetworkSession

function slot1(self, peer, peer_id, reason)
	slot4 = print
	slot6 = "[HostNetworkSession:remove_peer]"
	slot7 = inspect
	slot9 = peer
	slot7 = slot7(slot8)
	slot8 = peer_id
	slot9 = reason

	slot4(slot5, slot6, slot7, slot8)

	slot4 = HostNetworkSession
	slot4 = slot4.super
	slot4 = slot4.remove_peer
	slot6 = self
	slot7 = peer
	slot8 = peer_id
	slot9 = reason

	slot4(slot5, slot6, slot7, slot8)

	slot4 = managers
	slot4 = slot4.vote
	slot6 = slot4
	slot4 = slot4.abort_vote
	slot7 = peer_id

	slot4(slot5, slot6)

	slot4 = self._dead_con_reports

	if slot4 then
		slot4 = self._dead_con_reports
		local i = #slot4
		slot5 = 0

		while slot5 < i do

			-- Decompilation error in this vicinity:
			slot5 = self._dead_con_reports
			local dead_con_report = slot5[i]
			slot6 = dead_con_report.reporter
			i = i - 1
		end

		slot5 = next
		slot7 = self._dead_con_reports
		slot5 = slot5(slot6)

		if not slot5 then
			slot5 = nil
			self._dead_con_reports = slot5
		end
	end

	slot4 = NetworkManager
	slot4 = slot4.DROPIN_ENABLED

	if slot4 then
		slot4 = pairs
		slot6 = self._peers
		slot4, slot5, slot6 = slot4(slot5)

		for other_peer_id, other_peer in slot4, slot5, slot6 do
			slot11 = other_peer
			slot9 = other_peer.is_expecting_pause_confirmation
			slot12 = peer_id
			slot9 = slot9(slot10, slot11)

			if slot9 then
				slot11 = self
				slot9 = self.set_dropin_pause_request
				slot12 = other_peer
				slot13 = peer_id
				slot14 = false

				slot9(slot10, slot11, slot12, slot13)
			end
		end

		slot4 = self._local_peer
		slot6 = slot4
		slot4 = slot4.is_expecting_pause_confirmation
		slot7 = peer_id
		slot4 = slot4(slot5, slot6)

		if slot4 then
			slot4 = self._local_peer
			slot6 = slot4
			slot4 = slot4.set_expecting_drop_in_pause_confirmation
			slot7 = peer_id
			slot8 = nil

			slot4(slot5, slot6, slot7)

			slot6 = self
			slot4 = self.on_drop_in_pause_request_received
			slot7 = peer_id
			slot8 = ""
			slot9 = false

			slot4(slot5, slot6, slot7, slot8)
		end
	end

	local info_msg_type = "kick_peer"
	local info_msg_id = nil

	if reason == "kicked" then
		info_msg_id = 0
	elseif reason == "auth_fail" then
		info_msg_id = 2
	else
		info_msg_id = 1
	end

	slot6 = pairs
	slot8 = self._peers
	slot6, slot7, slot8 = slot6(slot7)

	for other_peer_id, other_peer in slot6, slot7, slot8 do

		-- Decompilation error in this vicinity:
		slot13 = other_peer
		slot11 = other_peer.handshakes
		slot11 = slot11(slot12)
		slot11 = slot11[peer_id]
	end

	if reason ~= "left" and reason ~= "kicked" and reason ~= "auth_fail" then
		slot8 = peer
		slot6 = peer.send
		slot9 = info_msg_type
		slot10 = peer_id
		slot11 = info_msg_id

		slot6(slot7, slot8, slot9, slot10)
	end

	slot8 = self
	slot6 = self.chk_server_joinable_state

	slot6(slot7)

	return 
end

slot0.remove_peer = slot1
slot0 = HostNetworkSession

function slot1(self, sender_peer, removed_peer_id)
	slot3 = print
	slot5 = "[HostNetworkSession:on_remove_peer_confirmation]"
	slot8 = sender_peer
	slot6 = sender_peer.id
	slot6 = slot6(slot7)
	slot7 = removed_peer_id

	slot3(slot4, slot5, slot6)

	slot5 = sender_peer
	slot3 = sender_peer.handshakes
	slot3 = slot3(slot4)
	slot3 = slot3[removed_peer_id]

	if slot3 ~= "removing" then
		slot3 = print
		slot5 = "peer should not remove. ignoring."

		slot3(slot4)

		return 
	end

	slot5 = sender_peer
	slot3 = sender_peer.set_handshake_status
	slot6 = removed_peer_id
	slot7 = nil

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self.chk_server_joinable_state

	slot3(slot4)

	slot5 = self
	slot3 = self.check_start_game_intro

	slot3(slot4)

	return 
end

slot0.on_remove_peer_confirmation = slot1
slot0 = HostNetworkSession

function slot1(self, reporter_peer_id, other_peer_id)

	-- Decompilation error in this vicinity:
	slot3 = print
	slot5 = "[HostNetworkSession:on_dead_connection_reported]"
	slot6 = reporter_peer_id
	slot7 = other_peer_id

	slot3(slot4, slot5, slot6)

	slot3 = self._peers
	slot3 = slot3[reporter_peer_id]
	self._dead_con_reports = self._dead_con_reports or {}
	local entry = {}
	slot6 = TimerManager
	slot6 = TimerManager.wall(slot5)
	entry.process_t = TimerManager.wall(slot5).time(slot5) + self._DEAD_CONNECTION_REPORT_PROCESS_DELAY
	entry.reporter = self._peers[reporter_peer_id]
	entry.reported = self._peers[other_peer_id]
	slot7 = entry

	table.insert(self._DEAD_CONNECTION_REPORT_PROCESS_DELAY, self._dead_con_reports)

	return 
end

slot0.on_dead_connection_reported = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = self._dead_con_reports

	if slot1 then
		slot1 = TimerManager
		slot3 = slot1
		slot1 = slot1.wall
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.time
		local t = slot1(slot2)
		slot2 = self._dead_con_reports
		local first_dead_con_report = slot2[1]
		slot3 = first_dead_con_report.process_t

		if slot3 < t then
			slot3 = self._dead_con_reports
			slot3 = #slot3

			if slot3 == 1 then
				slot3 = nil
				self._dead_con_reports = slot3
			else
				slot3 = table
				slot3 = slot3.remove
				slot5 = self._dead_con_reports
				slot6 = 1

				slot3(slot4, slot5)
			end

			local kick_peer = nil
			local reporter_peer = first_dead_con_report.reporter
			local reported_peer = first_dead_con_report.reported
			slot8 = reporter_peer
			slot6 = reporter_peer.creation_t
			slot6 = slot6(slot7)
			slot9 = reported_peer
			slot7 = reported_peer.creation_t
			slot7 = slot7(slot8)

			if slot7 < slot6 then
				slot6 = print
				slot8 = "[HostNetworkSession:process_dead_con_reports] kicking reporter "
				slot11 = reporter_peer
				slot9 = reporter_peer.id
				slot9 = slot9(slot10)
				slot12 = reported_peer
				slot10 = reported_peer.id
				slot10 = slot10(slot11)
				slot13 = reporter_peer
				slot11 = reporter_peer.creation_t
				slot11 = slot11(slot12)
				slot14 = reported_peer
				slot12 = reported_peer.creation_t

				slot6(slot7, slot8, slot9, slot10, slot12(slot13))

				kick_peer = reporter_peer
			else
				slot6 = print
				slot8 = "[HostNetworkSession:process_dead_con_reports] kicking reported "
				slot11 = reporter_peer
				slot9 = reporter_peer.id
				slot9 = slot9(slot10)
				slot12 = reported_peer
				slot10 = reported_peer.id
				slot10 = slot10(slot11)
				slot13 = reporter_peer
				slot11 = reporter_peer.creation_t
				slot11 = slot11(slot12)
				slot14 = reported_peer
				slot12 = reported_peer.creation_t

				slot6(slot7, slot8, slot9, slot10, slot12(slot13))

				kick_peer = reported_peer
			end

			slot8 = self
			slot6 = self.on_peer_kicked
			slot9 = kick_peer
			slot12 = kick_peer
			slot10 = kick_peer.id
			slot10 = slot10(slot11)
			slot11 = 1

			slot6(slot7, slot8, slot9, slot10)
		end
	end

	return 
end

slot0.process_dead_con_reports = slot1
slot0 = HostNetworkSession

function slot1(self, peer, peer_id)

	-- Decompilation error in this vicinity:
	slot3 = print
	slot5 = "[HostNetworkSession:chk_spawn_member_unit]"
	slot8 = peer
	slot6 = peer.name
	slot6 = slot6(slot7)
	slot7 = peer_id

	slot3(slot4, slot5, slot6)

	slot3 = self._game_started

	if not slot3 then
		slot3 = print
		slot5 = "Game not started yet"

		slot3(slot4)

		return 
	end

	slot5 = peer
	slot3 = peer.spawn_unit_called
	slot3 = slot3(slot4)
	slot3 = pairs
	slot5 = self._peers
	slot3, slot4, slot5 = slot3(slot4)

	for other_peer_id, other_peer in slot3, slot4, slot5 do
		slot10 = other_peer
		slot8 = other_peer.synched
		slot8 = slot8(slot9)

		if not slot8 then
			slot8 = print
			slot10 = "peer"
			slot11 = other_peer_id
			slot12 = "is not synched"

			slot8(slot9, slot10, slot11)

			return 
		end
	end

	slot5 = self
	slot3 = self.chk_all_handshakes_complete
	slot3 = slot3(slot4)

	if not slot3 then
		slot3 = Application
		slot5 = slot3
		slot3 = slot3.debug
		slot6 = "[HostNetworkSession:chk_spawn_member_unit] not self:chk_all_handshakes_complete()"

		slot3(slot4, slot5)

		return 
	end

	slot5 = self
	slot3 = self._spawn_dropin_player
	slot6 = peer

	slot3(slot4, slot5)

	slot3 = true

	return slot3
end

slot0.chk_spawn_member_unit = slot1
slot0 = HostNetworkSession

function slot1(self, peer)
	slot2 = managers
	slot2 = slot2.achievment
	slot4 = slot2
	slot2 = slot2.set_script_data
	slot5 = "cant_touch_fail"
	slot6 = true

	slot2(slot3, slot4, slot5)

	slot4 = peer
	slot2 = peer.spawn_unit
	slot5 = 0
	slot6 = true

	slot2(slot3, slot4, slot5)

	slot2 = managers
	slot2 = slot2.groupai
	slot4 = slot2
	slot2 = slot2.state
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.fill_criminal_team_with_AI
	slot5 = true

	slot2(slot3, slot4)

	return 
end

slot0._spawn_dropin_player = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.force_open_lobby_state
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = print
			slot8 = "force-opening lobby for peer"
			slot9 = peer_id

			slot6(slot7, slot8)

			slot6 = managers
			slot6 = slot6.network
			slot6 = slot6.matchmake
			slot8 = slot6
			slot6 = slot6.set_server_joinable
			slot9 = true

			slot6(slot7, slot8)

			return 
		end
	end

	slot1 = table
	slot1 = slot1.size
	slot3 = self._peers
	slot1 = slot1(slot2)
	slot2 = 3

	if slot2 <= slot1 then
		slot1 = managers
		slot1 = slot1.network
		slot1 = slot1.matchmake
		slot3 = slot1
		slot1 = slot1.set_server_joinable
		slot4 = false

		slot1(slot2, slot3)

		return 
	end

	slot1 = game_state_machine
	slot3 = slot1
	slot1 = slot1.last_queued_state_name
	local game_state_name = slot1(slot2)
	slot2 = BaseNetworkHandler
	slot2 = slot2._gamestate_filter
	slot2 = slot2.any_end_game
	slot2 = slot2[game_state_name]

	if slot2 then
		slot2 = managers
		slot2 = slot2.network
		slot2 = slot2.matchmake
		slot4 = slot2
		slot2 = slot2.set_server_joinable
		slot5 = false

		slot2(slot3, slot4)

		return 
	end

	slot2 = game_state_machine
	slot4 = slot2
	slot2 = slot2.current_state
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.is_joinable
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = managers
		slot2 = slot2.network
		slot2 = slot2.matchmake
		slot4 = slot2
		slot2 = slot2.set_server_joinable
		slot5 = false

		slot2(slot3, slot4)

		return 
	end

	slot4 = self
	slot2 = self._get_free_client_id
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = managers
		slot2 = slot2.network
		slot2 = slot2.matchmake
		slot4 = slot2
		slot2 = slot2.set_server_joinable
		slot5 = false

		slot2(slot3, slot4)

		return 
	end

	slot2 = self._state
	slot4 = slot2
	slot2 = slot2.is_joinable
	slot5 = self._state_data
	slot2 = slot2(slot3, slot4)

	if not slot2 then
		slot2 = managers
		slot2 = slot2.network
		slot2 = slot2.matchmake
		slot4 = slot2
		slot2 = slot2.set_server_joinable
		slot5 = false

		slot2(slot3, slot4)

		return 
	end

	slot2 = Global
	slot2 = slot2.game_settings
	slot2 = slot2.drop_in_allowed

	if not slot2 then
		slot2 = managers
		slot2 = slot2.player
		slot4 = slot2
		slot2 = slot2.local_player_in_camp
		slot2 = slot2(slot3)

		if not slot2 then
			slot2 = managers
			slot2 = slot2.network
			slot2 = slot2.matchmake
			slot4 = slot2
			slot2 = slot2.set_server_joinable
			slot5 = false

			slot2(slot3, slot4)

			return 
		end
	end

	slot2 = NetworkManager
	slot2 = slot2.DROPIN_ENABLED

	if slot2 then
		slot2 = BaseNetworkHandler
		slot2 = slot2._gamestate_filter
		slot2 = slot2.lobby
		slot2 = slot2[game_state_name]

		if slot2 then
			slot2 = managers
			slot2 = slot2.network
			slot2 = slot2.matchmake
			slot4 = slot2
			slot2 = slot2.set_server_joinable
			slot5 = true

			slot2(slot3, slot4)

			return 
		else
			slot2 = managers
			slot2 = slot2.groupai

			if slot2 then
				slot2 = managers
				slot2 = slot2.groupai
				slot4 = slot2
				slot2 = slot2.state
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.chk_allow_drop_in
				slot2 = slot2(slot3)

				if not slot2 then
					slot2 = managers
					slot2 = slot2.network
					slot2 = slot2.matchmake
					slot4 = slot2
					slot2 = slot2.set_server_joinable
					slot5 = false

					slot2(slot3, slot4)

					return 
				end
			end
		end
	else
		slot2 = BaseNetworkHandler
		slot2 = slot2._gamestate_filter
		slot2 = slot2.lobby
		slot2 = slot2[game_state_name]

		if not slot2 then
			slot2 = managers
			slot2 = slot2.network
			slot2 = slot2.matchmake
			slot4 = slot2
			slot2 = slot2.set_server_joinable
			slot5 = false

			slot2(slot3, slot4)

			return 
		end
	end

	slot2 = managers
	slot2 = slot2.network
	slot2 = slot2.matchmake
	slot4 = slot2
	slot2 = slot2.set_server_joinable
	slot5 = true

	slot2(slot3, slot4)

	return 
end

slot0.chk_server_joinable_state = slot1
slot0 = HostNetworkSession

function slot1(self, simulation)
	slot2 = print
	slot4 = "[HostNetworkSession:on_load_complete]"

	slot2(slot3)

	slot2 = HostNetworkSession
	slot2 = slot2.super
	slot2 = slot2.on_load_complete
	slot4 = self
	slot5 = simulation

	slot2(slot3, slot4)

	if not simulation then
		slot2 = Global
		slot2 = slot2.load_start_menu_lobby

		if slot2 then
			slot2 = managers
			slot2 = slot2.network
			slot2 = slot2.matchmake
			slot4 = slot2
			slot2 = slot2.set_server_state
			slot5 = "in_lobby"

			slot2(slot3, slot4)

			return 
		else
			slot2 = managers
			slot2 = slot2.network
			slot2 = slot2.matchmake
			slot4 = slot2
			slot2 = slot2.set_server_state
			slot5 = "in_game"

			slot2(slot3, slot4)
		end

		slot4 = self
		slot2 = self.chk_server_joinable_state

		slot2(slot3)

		slot2 = NetworkManager
		slot2 = slot2.DROPIN_ENABLED

		if slot2 then
			slot2 = pairs
			slot4 = self._peers
			slot2, slot3, slot4 = slot2(slot3)

			for peer_id, peer in slot2, slot3, slot4 do
				slot9 = peer
				slot7 = peer.loaded
				slot7 = slot7(slot8)

				if slot7 then
					slot9 = self
					slot7 = self._has_client
					slot10 = peer
					slot7 = slot7(slot8, slot9)

					if not slot7 then
						slot7 = Network
						slot9 = slot7
						slot7 = slot7.add_client
						slot12 = peer
						slot10 = peer.rpc

						slot7(slot8, slot10(slot11))
					end

					slot9 = peer
					slot7 = peer.synched
					slot7 = slot7(slot8)

					if not slot7 then
						slot9 = peer
						slot7 = peer.set_expecting_pause_sequence
						slot10 = true

						slot7(slot8, slot9)

						slot9 = self
						slot7 = self.chk_initiate_dropin_pause
						slot10 = peer
						local dropin_pause_ok = slot7(slot8, slot9)

						if dropin_pause_ok then
							slot10 = self
							slot8 = self.chk_drop_in_peer
							slot11 = peer

							slot8(slot9, slot10)
						end
					end
				end
			end
		end

		slot4 = self
		slot2 = self._reset_outfit_loading_status_request

		slot2(slot3)
	end

	slot2 = self._local_peer
	slot4 = slot2
	slot2 = slot2.set_synched
	slot5 = true

	slot2(slot3, slot4)

	return 
end

slot0.on_load_complete = slot1
slot0 = HostNetworkSession

function slot1(self, ...)
	slot1 = HostNetworkSession
	slot1 = slot1.super
	slot1 = slot1.prepare_to_close
	slot3 = self

	slot1(slot2, ...)

	slot3 = self
	slot1 = self.set_state
	slot4 = "closing"

	slot1(slot2, slot3)

	return 
end

slot0.prepare_to_close = slot1
slot0 = HostNetworkSession

function slot1(self, peer)
	slot4 = peer
	slot2 = peer.id
	local peer_id = slot2(slot3)
	slot5 = peer
	slot3 = peer.handshakes
	local peer_handshakes = slot3(slot4)
	slot4 = pairs
	slot6 = self._peers
	slot4, slot5, slot6 = slot4(slot5)

	for other_peer_id, other_peer in slot4, slot5, slot6 do
		if other_peer_id ~= peer_id then
			slot11 = other_peer
			slot9 = other_peer.loaded
			slot9 = slot9(slot10)

			if slot9 then
				slot9 = peer_handshakes[other_peer_id]

				if slot9 ~= true then
					slot9 = print
					slot11 = "[HostNetworkSession:chk_peer_handshakes_complete]"
					slot12 = peer_id
					slot13 = "is missing handshake for"
					slot14 = other_peer_id

					slot9(slot10, slot11, slot12, slot13)

					slot9 = false

					return slot9
				end

				slot11 = other_peer
				slot9 = other_peer.handshakes
				slot9 = slot9(slot10)
				slot9 = slot9[peer_id]

				if slot9 ~= true then
					slot9 = print
					slot11 = "[HostNetworkSession:chk_peer_handshakes_complete]"
					slot12 = peer_id
					slot13 = "is not known by"
					slot14 = other_peer_id

					slot9(slot10, slot11, slot12, slot13)

					slot9 = false

					return slot9
				end
			end
		end
	end

	slot4 = true

	return slot4
end

slot0.chk_peer_handshakes_complete = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.handshakes
		local peer_handshakes = slot6(slot7)
		slot7 = pairs
		slot9 = self._peers
		slot7, slot8, slot9 = slot7(slot8)

		for other_peer_id, other_peer in slot7, slot8, slot9 do
			if other_peer_id ~= peer_id then
				slot12 = peer_handshakes[other_peer_id]

				if slot12 ~= true then
					slot12 = print
					slot14 = "[HostNetworkSession:chk_all_handshakes_complete]"
					slot15 = peer_id
					slot16 = "is missing handshake for"
					slot17 = other_peer_id

					slot12(slot13, slot14, slot15, slot16)

					slot12 = false

					return slot12
				end
			end
		end
	end

	slot1 = true

	return slot1
end

slot0.chk_all_handshakes_complete = slot1
slot0 = HostNetworkSession

function slot1(self, peer, dropin_peer_id, state)
	if state == "asked" then
		local dropin_peer = self._peers[dropin_peer_id]
		slot9 = state

		peer.set_expecting_drop_in_pause_confirmation(slot6, peer, dropin_peer_id)

		slot12 = dropin_peer
		slot11 = true

		peer.send_after_load(slot6, peer, "request_drop_in_pause", dropin_peer_id, dropin_peer.name(slot11) or "unknown_peer")
	elseif state == "paused" then
		slot6 = peer
		slot4 = peer.set_expecting_drop_in_pause_confirmation
		slot7 = dropin_peer_id
		slot8 = state

		slot4(slot5, slot6, slot7)
	elseif not state then
	else
		slot4 = debug_pause
		slot6 = "[HostNetworkSession:set_dropin_pause_request] unknown state"
		slot7 = state

		slot4(slot5, slot6)
	end

	return 
end

slot0.set_dropin_pause_request = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.loaded
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = peer
			slot6 = peer.synched
			slot6 = slot6(slot7)

			if not slot6 then
				return 
			end
		end
	end

	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = self
		slot6 = self.set_dropin_pause_request
		slot9 = peer
		slot10 = peer_id
		slot11 = false

		slot6(slot7, slot8, slot9, slot10)
	end

	slot1 = self._local_peer
	slot3 = slot1
	slot1 = slot1.is_expecting_pause_confirmation
	slot4 = self._local_peer
	slot6 = slot4
	slot4 = slot4.id
	slot1 = slot1(slot2, slot4(slot5))

	if slot1 then
		slot1 = self._local_peer
		slot3 = slot1
		slot1 = slot1.set_expecting_drop_in_pause_confirmation
		slot4 = self._local_peer
		slot6 = slot4
		slot4 = slot4.id
		slot4 = slot4(slot5)
		slot5 = nil

		slot1(slot2, slot3, slot4)

		slot3 = self
		slot1 = self.on_drop_in_pause_request_received
		slot4 = self._local_peer
		slot6 = slot4
		slot4 = slot4.id
		slot4 = slot4(slot5)
		slot5 = ""
		slot6 = false

		slot1(slot2, slot3, slot4, slot5)
	end

	slot1 = true

	return slot1
end

slot0.chk_send_ready_to_unpause = slot1
slot0 = HostNetworkSession

function slot1(self, name, enter_params)
	slot3 = self._STATES
	local state = slot3[name]
	local state_data = self._state_data
	slot5 = self._state

	if slot5 then
		slot5 = self._state
		slot7 = slot5
		slot5 = slot5.exit
		slot8 = state_data
		slot9 = name
		slot10 = enter_params

		slot5(slot6, slot7, slot8, slot9)
	end

	state_data.name = name
	state_data.state = state
	self._state = state
	self._state_name = name
	slot7 = state
	slot5 = state.enter
	slot8 = state_data
	slot9 = enter_params

	slot5(slot6, slot7, slot8)

	return 
end

slot0.set_state = slot1
slot0 = HostNetworkSession

function slot1(self, peer, state)
	if state then
		slot5 = peer
		slot3 = peer.send
		slot6 = "re_open_lobby_reply"
		slot7 = true

		slot3(slot4, slot5, slot6)
	end

	slot5 = peer
	slot3 = peer.set_force_open_lobby_state
	slot6 = state

	slot3(slot4, slot5)

	slot5 = self
	slot3 = self.chk_server_joinable_state

	slot3(slot4)

	return 
end

slot0.on_re_open_lobby_request = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot3 = self
	slot1 = self.are_all_peer_assets_loaded
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = false

		return slot1
	end

	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.waiting_for_player_ready
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = peer
			slot6 = peer.other_peer_outfit_loaded_status
			slot6 = slot6(slot7)

			if not slot6 then
				slot6 = print
				slot8 = "[HostNetworkSession:all_peers_done_loading_outfits] waiting for"
				slot9 = peer_id
				slot10 = "to load outfits."

				slot6(slot7, slot8, slot9)

				slot6 = false

				return slot6
			end
		end
	end

	slot1 = true

	return slot1
end

slot0.all_peers_done_loading_outfits = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = print
	slot3 = "[HostNetworkSession:chk_request_peer_outfit_load_status]"

	slot1(slot2)

	slot1 = Application
	slot3 = slot1
	slot1 = slot1.stack_dump

	slot1(slot2)

	slot3 = self
	slot1 = self._get_peer_outfit_versions_str
	local outfit_versions_str = slot1(slot2)
	slot4 = self
	slot2 = self._increment_outfit_loading_status_request_id
	local req_id = slot2(slot3)
	slot3 = pairs
	slot5 = self._peers
	slot3, slot4, slot5 = slot3(slot4)

	for peer_id, peer in slot3, slot4, slot5 do
		slot10 = peer
		slot8 = peer.loaded
		slot8 = slot8(slot9)

		if slot8 then
			slot10 = peer
			slot8 = peer.set_other_peer_outfit_loaded_status
			slot11 = false

			slot8(slot9, slot10)

			slot8 = print
			slot10 = "[HostNetworkSession:request_peer_outfit_load_status] peer_id"
			slot11 = peer_id
			slot12 = "req_id"
			slot13 = req_id

			slot8(slot9, slot10, slot11, slot12)

			slot10 = peer
			slot8 = peer.send
			slot11 = "set_member_ready"
			slot12 = self._local_peer
			slot14 = slot12
			slot12 = slot12.id
			slot12 = slot12(slot13)
			slot13 = req_id
			slot14 = 4
			slot15 = outfit_versions_str

			slot8(slot9, slot10, slot11, slot12, slot13, slot14)
		end
	end

	return 
end

slot0.chk_request_peer_outfit_load_status = slot1
slot0 = HostNetworkSession

function slot1(self, peer, request_id, outfit_versions_str_in)
	slot4 = print
	slot6 = "[HostNetworkSession:on_peer_finished_loading_outfit] peer:id()"
	slot9 = peer
	slot7 = peer.id
	slot7 = slot7(slot8)
	slot8 = "request_id"
	slot9 = request_id
	slot10 = "self._peer_outfit_loaded_status_request_id"
	slot11 = self._peer_outfit_loaded_status_request_id
	slot12 = "outfit_versions_str_in"
	slot13 = outfit_versions_str_in
	slot14 = "self:_get_peer_outfit_versions_str()"
	slot17 = self
	slot15 = self._get_peer_outfit_versions_str

	slot4(slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot15(slot16))

	if outfit_versions_str_in == "proactive" then
		slot4 = managers
		slot4 = slot4.network
		slot6 = slot4
		slot4 = slot4.session
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.chk_request_peer_outfit_load_status

		slot4(slot5)
	else
		slot4 = self._peer_outfit_loaded_status_request_id

		if request_id ~= slot4 then
			return 
		end

		slot6 = self
		slot4 = self._get_peer_outfit_versions_str
		slot4 = slot4(slot5)

		if outfit_versions_str_in ~= slot4 then
			return 
		end

		slot6 = peer
		slot4 = peer.set_other_peer_outfit_loaded_status
		slot7 = true

		slot4(slot5, slot6)
	end

	return 
end

slot0.on_peer_finished_loading_outfit = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = self
		slot6 = self.chk_peer_worlds_loaded
		slot9 = peer
		slot6 = slot6(slot7, slot8)

		if slot6 then
			slot8 = peer
			slot6 = peer.spawn_unit_called
			slot6 = slot6(slot7)

			if not slot6 then
				slot6 = Application
				slot8 = slot6
				slot6 = slot6.debug
				slot9 = "[HostNetworkSession:do_dropin()] Trying dropin for"
				slot10 = peer_id

				slot6(slot7, slot8, slot9)

				slot8 = self
				slot6 = self.chk_initiate_dropin_pause
				slot9 = peer

				slot6(slot7, slot8)

				slot8 = self
				slot6 = self.chk_drop_in_peer
				slot9 = peer

				slot6(slot7, slot8)
			end
		end
	end

	return 
end

slot0.do_dropin = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = managers
	slot1 = slot1.player
	slot3 = slot1
	slot1 = slot1.current_state
	local current_state = slot1(slot2)

	if current_state == "freefall" or current_state == "parachuting" then
		return 
	end

	slot2 = pairs
	slot4 = self._peers
	slot2, slot3, slot4 = slot2(slot3)

	for peer_id, peer in slot2, slot3, slot4 do
		slot7 = peer.ready_for_dropin_spawn

		if slot7 then
			slot9 = peer
			slot7 = peer.spawn_unit_called
			slot7 = slot7(slot8)

			if not slot7 then
				slot7 = managers
				slot7 = slot7.worldcollection
				slot9 = slot7
				slot7 = slot7.check_all_peers_synced_last_world
				slot10 = CoreWorldCollection
				slot10 = slot10.STAGE_LOAD_FINISHED
				slot7 = slot7(slot8, slot9)

				if not slot7 then
					slot7 = Application
					slot9 = slot7
					slot7 = slot7.debug
					slot10 = "[HostNetworkSession:do_dropin_spawn()] Waiting for all peers to load words before dropin."

					slot7(slot8, slot9)

					return 
				end

				slot7 = Application
				slot9 = slot7
				slot7 = slot7.debug
				slot10 = "[HostNetworkSession:do_dropin_spawn()] Trying spawn for"
				slot11 = peer_id

				slot7(slot8, slot9, slot10)

				slot9 = self
				slot7 = self.chk_spawn_member_unit
				slot10 = peer
				slot13 = peer
				slot11 = peer.id
				local spawned = slot7(slot8, slot9, slot11(slot12))

				if spawned then
					slot8 = managers
					slot8 = slot8.player
					slot10 = slot8
					slot8 = slot8.update_carry_to_peer
					slot11 = peer

					slot8(slot9, slot10)

					slot8 = pairs
					slot10 = self._peers
					slot8, slot9, slot10 = slot8(slot9)

					for other_peer_id, other_peer in slot8, slot9, slot10 do
						if other_peer_id ~= peer_id then
							slot15 = other_peer
							slot13 = other_peer.set_expecting_drop_in_pause_confirmation
							slot16 = peer_id
							slot17 = nil

							slot13(slot14, slot15, slot16)

							slot15 = other_peer
							slot13 = other_peer.send_after_load
							slot16 = "request_drop_in_pause"
							slot17 = peer_id
							slot18 = ""
							slot19 = false

							slot13(slot14, slot15, slot16, slot17, slot18)
						end
					end

					slot8 = self._local_peer
					slot10 = slot8
					slot8 = slot8.is_expecting_pause_confirmation
					slot13 = peer
					slot11 = peer.id
					slot8 = slot8(slot9, slot11(slot12))

					if slot8 then
						slot8 = self._local_peer
						slot10 = slot8
						slot8 = slot8.set_expecting_drop_in_pause_confirmation
						slot13 = peer
						slot11 = peer.id
						slot11 = slot11(slot12)
						slot12 = nil

						slot8(slot9, slot10, slot11)

						slot10 = self
						slot8 = self.on_drop_in_pause_request_received
						slot13 = peer
						slot11 = peer.id
						slot11 = slot11(slot12)
						slot14 = peer
						slot12 = peer.name
						slot12 = slot12(slot13)
						slot13 = false

						slot8(slot9, slot10, slot11, slot12)
					end
				end
			end
		end
	end

	return 
end

slot0.do_dropin_spawn = slot1
slot0 = HostNetworkSession

function slot1(self, peer_id, ready, state_changed, from_network)
	slot5 = HostNetworkSession
	slot5 = slot5.super
	slot5 = slot5.on_set_member_ready
	slot7 = self
	slot8 = peer_id
	slot9 = ready
	slot10 = state_changed
	slot11 = from_network

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = self
	slot5 = self.check_start_game_intro

	slot5(slot6)

	if from_network then
		slot7 = self
		slot5 = self.chk_request_peer_outfit_load_status

		slot5(slot6)
	end

	return 
end

slot0.on_set_member_ready = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = self._peer_outfit_loaded_status_request_id

	if slot1 == 100 then
		slot1 = 0
		self._peer_outfit_loaded_status_request_id = slot1
	else
		slot1 = self._peer_outfit_loaded_status_request_id
		slot1 = slot1 + 1
		self._peer_outfit_loaded_status_request_id = slot1
	end

	slot1 = self._peer_outfit_loaded_status_request_id

	return slot1
end

slot0._increment_outfit_loading_status_request_id = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot3 = self
	slot1 = self._increment_outfit_loading_status_request_id

	slot1(slot2)

	slot1 = pairs
	slot3 = self._peers
	slot1, slot2, slot3 = slot1(slot2)

	for peer_id, peer in slot1, slot2, slot3 do
		slot8 = peer
		slot6 = peer.set_other_peer_outfit_loaded_status
		slot9 = false

		slot6(slot7, slot8)
	end

	return 
end

slot0._reset_outfit_loading_status_request = slot1
slot0 = HostNetworkSession

function slot1(self, peer)
	slot2 = print
	slot4 = "[HostNetworkSession:on_peer_outfit_loaded]"
	slot7 = peer
	slot5 = peer.id

	slot2(slot3, slot5(slot6))

	return 
end

slot0.on_peer_outfit_loaded = slot1
slot0 = HostNetworkSession

function slot1(self)
	slot1 = self._load_counter
	slot2 = self._LOAD_COUNTER_LIMITS
	slot2 = slot2[2]

	if slot1 == slot2 then
		slot1 = self._LOAD_COUNTER_LIMITS
		slot1 = slot1[1]
		self._load_counter = slot1
	else
		slot1 = self._load_counter
		slot1 = slot1 + 1
		self._load_counter = slot1
	end

	return 
end

slot0._inc_load_counter = slot1

return 
