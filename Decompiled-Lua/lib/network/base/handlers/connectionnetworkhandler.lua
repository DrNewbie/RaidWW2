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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = ConnectionNetworkHandler

if not slot0 then
	slot0 = class
	slot2 = BaseNetworkHandler
	slot0 = slot0(slot1)
end

ConnectionNetworkHandler = slot0
slot0 = ConnectionNetworkHandler

function slot1(self, sender)

	-- Decompilation error in this vicinity:
	slot2 = self._verify_in_session
	slot2 = slot2()
	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.session
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.on_server_up_received
	slot5 = sender

	slot2(slot3, slot4)

	return 
end

slot0.server_up = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_in_server_session
	slot2 = slot2()

	if not slot2 then
		return 
	end

	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.on_discover_host_received
	slot5 = sender

	slot2(slot3, slot4)

	return 
end

slot0.request_host_discover_reply = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)

	-- Decompilation error in this vicinity:
	slot2 = self._verify_in_server_session
	slot2 = slot2()
	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.on_discover_host_received
	slot5 = sender

	slot2(slot3, slot4)

	return 
end

slot0.discover_host = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender_name, level_id, level_name, my_ip, state, difficulty, sender)
	slot8 = self._verify_in_client_session
	slot8 = slot8()

	if not slot8 then
		return 
	end

	if level_name == "" then
		slot8 = tweak_data
		slot8 = slot8.levels
		slot10 = slot8
		slot8 = slot8.get_world_name_from_index
		slot11 = level_id
		slot8 = slot8(slot9, slot10)
		level_name = slot8

		if not level_name then
			slot8 = cat_print
			slot10 = "multiplayer_base"
			slot11 = "[ConnectionNetworkHandler:discover_host_reply] Ignoring host"
			slot12 = sender_name
			slot13 = ". I do not have this level in my revision."

			slot8(slot9, slot10, slot11, slot12)

			return 
		end
	end

	slot8 = managers
	slot8 = slot8.network
	slot10 = slot8
	slot8 = slot8.on_discover_host_reply
	slot11 = sender
	slot12 = sender_name
	slot13 = level_name
	slot14 = my_ip
	slot15 = state
	slot16 = difficulty

	slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15)

	return 
end

slot0.discover_host_reply = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_name, preferred_character, dlcs, xuid, peer_level, gameversion, join_attempt_identifier, auth_ticket, sender)
	slot10 = self._verify_in_server_session
	slot10 = slot10()

	if not slot10 then
		return 
	end

	slot10 = managers
	slot10 = slot10.network
	slot12 = slot10
	slot10 = slot10.session
	slot10 = slot10(slot11)
	slot12 = slot10
	slot10 = slot10.on_join_request_received
	slot13 = peer_name
	slot14 = preferred_character
	slot15 = dlcs
	slot16 = xuid
	slot17 = peer_level
	slot18 = gameversion
	slot19 = join_attempt_identifier
	slot20 = auth_ticket
	slot21 = sender

	slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20)

	return 
end

slot0.request_join = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, reply_id, my_peer_id, my_character, level_index, difficulty_index, state, server_character, user_id, mission, job_id_index, job_stage, alternative_job_stage, interupt_job_stage_level_index, xuid, auth_ticket, sender)
	slot17 = print
	slot19 = " 1 ConnectionNetworkHandler:join_request_reply"
	slot20 = reply_id
	slot21 = my_peer_id
	slot22 = my_character
	slot23 = level_index
	slot24 = difficulty_index
	slot25 = state
	slot26 = server_character
	slot27 = user_id
	slot28 = mission
	slot29 = job_id_index
	slot30 = job_stage
	slot31 = alternative_job_stage
	slot32 = interupt_job_stage_level_index
	slot33 = xuid
	slot34 = auth_ticket
	slot35 = sender

	slot17(slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34)

	slot17 = self._verify_in_client_session
	slot17 = slot17()

	if not slot17 then
		return 
	end

	slot17 = managers
	slot17 = slot17.network
	slot19 = slot17
	slot17 = slot17.session
	slot17 = slot17(slot18)
	slot19 = slot17
	slot17 = slot17.on_join_request_reply
	slot20 = reply_id
	slot21 = my_peer_id
	slot22 = my_character
	slot23 = level_index
	slot24 = difficulty_index
	slot25 = state
	slot26 = server_character
	slot27 = user_id
	slot28 = mission
	slot29 = job_id_index
	slot30 = job_stage
	slot31 = alternative_job_stage
	slot32 = interupt_job_stage_level_index
	slot33 = xuid
	slot34 = auth_ticket
	slot35 = sender

	slot17(slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33, slot34)

	return 
end

slot0.join_request_reply = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, name, peer_id, ip, in_lobby, loading, synched, character, slot, mask_set, xuid, xnaddr)
	slot12 = print
	slot14 = " 1 ConnectionNetworkHandler:peer_handshake"
	slot15 = name
	slot16 = peer_id
	slot17 = ip
	slot18 = in_lobby
	slot19 = loading
	slot20 = synched
	slot21 = character
	slot22 = slot
	slot23 = mask_set
	slot24 = xuid
	slot25 = xnaddr

	slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24)

	slot12 = self._verify_in_client_session
	slot12 = slot12()

	if not slot12 then
		return 
	end

	slot12 = print
	slot14 = " 2 ConnectionNetworkHandler:peer_handshake"

	slot12(slot13)

	slot12 = managers
	slot12 = slot12.network
	slot14 = slot12
	slot12 = slot12.session
	slot12 = slot12(slot13)
	slot14 = slot12
	slot12 = slot12.peer_handshake
	slot15 = name
	slot16 = peer_id
	slot17 = ip
	slot18 = in_lobby
	slot19 = loading
	slot20 = synched
	slot21 = character
	slot22 = slot
	slot23 = mask_set
	slot24 = xuid
	slot25 = xnaddr

	slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24)

	return 
end

slot0.peer_handshake = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	slot2 = slot2(slot3)

	if not slot2 then
		return 
	end

	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.session
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.local_peer
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.name
	local name = slot2(slot3)
	slot5 = sender
	slot3 = sender.request_player_name_reply
	slot6 = name

	slot3(slot4, slot5)

	return 
end

slot0.request_player_name = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, name, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot6 = sender_peer
	slot4 = sender_peer.set_name
	slot7 = name

	slot4(slot5, slot6)

	return 
end

slot0.request_player_name_reply = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = self._verify_in_client_session
	slot4 = slot4()

	if slot4 then
		slot6 = sender_peer
		slot4 = sender_peer.id
		slot4 = slot4(slot5)

		if slot4 == 1 then
			slot4 = managers
			slot4 = slot4.network
			slot6 = slot4
			slot4 = slot4.session
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.on_peer_requested_info
			slot7 = peer_id

			slot4(slot5, slot6)
		else
			slot6 = sender_peer
			slot4 = sender_peer.id
			slot4 = slot4(slot5)

			if peer_id == slot4 then
				slot4 = managers
				slot4 = slot4.network
				slot6 = slot4
				slot4 = slot4.session
				slot4 = slot4(slot5)
				slot6 = slot4
				slot4 = slot4.send_to_host
				slot7 = "peer_exchange_info"
				slot8 = peer_id

				slot4(slot5, slot6, slot7)
			end
		end
	else
		slot4 = self._verify_in_server_session
		slot4 = slot4()

		if slot4 then
			slot4 = managers
			slot4 = slot4.network
			slot6 = slot4
			slot4 = slot4.session
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.on_peer_connection_established
			slot7 = sender_peer
			slot8 = peer_id

			slot4(slot5, slot6, slot7)
		end
	end

	return 
end

slot0.peer_exchange_info = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id, sender)
	slot3 = self._verify_in_server_session
	slot3 = slot3()

	if not slot3 then
		return 
	end

	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.on_peer_connection_established
	slot7 = sender_peer
	slot8 = peer_id

	slot4(slot5, slot6, slot7)

	return 
end

slot0.connection_established = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, other_peer_id)
	slot2 = print
	slot4 = "[ConnectionNetworkHandler:mutual_connection]"
	slot5 = other_peer_id

	slot2(slot3, slot4)

	slot2 = self._verify_in_client_session
	slot2 = slot2()

	if not slot2 then
		return 
	end

	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.session
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.on_mutual_connection
	slot5 = other_peer_id

	slot2(slot3, slot4)

	return 
end

slot0.mutual_connection = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id, message_id, sender)
	slot4 = self._verify_sender
	slot6 = sender
	slot4 = slot4(slot5)

	if not slot4 then
		return 
	end

	slot6 = sender
	slot4 = sender.remove_peer_confirmation
	slot7 = peer_id

	slot4(slot5, slot6)

	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.peer
	slot7 = peer_id
	local peer = slot4(slot5, slot6)

	if not peer then
		slot5 = print
		slot7 = "[ConnectionNetworkHandler:kick_peer] unknown peer"
		slot8 = peer_id

		slot5(slot6, slot7)

		return 
	end

	slot5 = managers
	slot5 = slot5.network
	slot7 = slot5
	slot5 = slot5.session
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.on_peer_kicked
	slot8 = peer
	slot9 = peer_id
	slot10 = message_id

	slot5(slot6, slot7, slot8, slot9)

	return 
end

slot0.kick_peer = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, removed_peer_id, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.on_remove_peer_confirmation
	slot7 = sender_peer
	slot8 = removed_peer_id

	slot4(slot5, slot6, slot7)

	return 
end

slot0.remove_peer_confirmation = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, state, load_counter, sender)
	slot4 = self._verify_sender
	slot6 = sender
	local peer = slot4(slot5)

	if not peer then
		return 
	end

	slot5 = managers
	slot5 = slot5.network
	slot7 = slot5
	slot5 = slot5.session
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.set_peer_loading_state
	slot8 = peer
	slot9 = state
	slot10 = load_counter

	slot5(slot6, slot7, slot8, slot9)

	return 
end

slot0.set_loading_state = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, id, sender)
	slot3 = self._verify_sender
	slot5 = sender
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.on_peer_synched
	slot6 = id

	slot3(slot4, slot5)

	return 
end

slot0.set_peer_synched = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = managers
	slot1 = slot1.network
	slot3 = slot1
	slot1 = slot1.session
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.local_peer
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.set_drop_in
	slot4 = true

	slot1(slot2, slot3)

	slot1 = game_state_machine
	slot3 = slot1
	slot1 = slot1.current_state
	slot1 = slot1(slot2)
	slot1 = slot1.set_dropin

	if slot1 then
		slot1 = game_state_machine
		slot3 = slot1
		slot1 = slot1.current_state
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.set_dropin
		slot4 = managers
		slot4 = slot4.network
		slot6 = slot4
		slot4 = slot4.session
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.local_peer
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.character

		slot1(slot2, slot4(slot5))
	end

	return 
end

slot0.set_dropin = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, dead, bleed_out, health, used_deployable, used_cable_ties, used_body_bags)
	slot7 = self._verify_gamestate
	slot9 = self._gamestate_filter
	slot9 = slot9.any_ingame_playing
	slot7 = slot7(slot8)

	if not slot7 then
		return 
	end

	slot7 = managers
	slot7 = slot7.player
	slot9 = slot7
	slot7 = slot7.spawn_dropin_penalty
	slot10 = dead
	slot11 = bleed_out
	slot12 = health
	slot13 = used_deployable
	slot14 = used_cable_ties
	slot15 = used_body_bags

	slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14)

	slot7 = managers
	slot7 = slot7.player
	slot9 = slot7
	slot7 = slot7.set_player_state
	slot10 = "standard"

	slot7(slot8, slot9)

	return 
end

slot0.spawn_dropin_penalty = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, load_counter, sender)
	slot3 = print
	slot5 = "[ConnectionNetworkHandler:ok_to_load_level]"
	slot6 = load_counter

	slot3(slot4, slot5)

	slot5 = self
	slot3 = self._verify_in_client_session
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.ok_to_load_level
	slot6 = load_counter

	slot3(slot4, slot5)

	return 
end

slot0.ok_to_load_level = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, load_counter, sender)
	slot3 = print
	slot5 = "[ConnectionNetworkHandler:ok_to_load_lobby]"
	slot6 = load_counter

	slot3(slot4, slot5)

	slot5 = self
	slot3 = self._verify_in_client_session
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.ok_to_load_lobby
	slot6 = load_counter

	slot3(slot4, slot5)

	return 
end

slot0.ok_to_load_lobby = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local peer = slot2(slot3)

	if not peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.on_peer_left
	slot6 = peer
	slot9 = peer
	slot7 = peer.id

	slot3(slot4, slot5, slot7(slot8))

	return 
end

slot0.set_peer_left = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, index, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local peer = slot3(slot4)

	if not peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.menu

	if slot4 then
		slot4 = managers
		slot4 = slot4.menu
		slot6 = slot4
		slot4 = slot4.set_peer_sync_state_index
		slot9 = peer
		slot7 = peer.id
		slot7 = slot7(slot8)
		slot8 = index

		slot4(slot5, slot6, slot7)
	end

	return 
end

slot0.set_menu_sync_state_index = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id)
	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.session
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.on_entered_lobby_confirmation
	slot5 = peer_id

	slot2(slot3, slot4)

	return 
end

slot0.entered_lobby_confirmation = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_in_session
	slot2 = slot2()

	if not slot2 then
		return 
	end

	slot2 = self._verify_sender
	slot4 = sender
	local peer = slot2(slot3)

	if not peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.on_peer_entered_lobby
	slot6 = peer

	slot3(slot4, slot5)

	return 
end

slot0.set_peer_entered_lobby = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, job_index, level_id_index, difficulty_index, sender)
	slot5 = self._verify_sender
	slot7 = sender
	local peer = slot5(slot6)

	if not peer then
		return 
	end

	slot6 = tweak_data
	slot6 = slot6.operations
	slot8 = slot6
	slot6 = slot6.get_raid_name_from_index
	slot9 = job_index
	local job_id = slot6(slot7, slot8)
	slot7 = tweak_data
	slot7 = slot7.levels
	slot9 = slot7
	slot7 = slot7.get_level_name_from_index
	slot10 = level_id_index
	local level_id = slot7(slot8, slot9)
	slot8 = tweak_data
	slot10 = slot8
	slot8 = slot8.index_to_difficulty
	slot11 = difficulty_index
	local difficulty = slot8(slot9, slot10)
	slot9 = Global
	slot9 = slot9.game_settings
	slot9.level_id = level_id
	slot9 = Global
	slot9 = slot9.game_settings
	slot10 = managers
	slot10 = slot10.raid_job
	slot12 = slot10
	slot10 = slot10.current_job
	slot10 = slot10(slot11)
	slot9.mission = slot10
	slot9 = Global
	slot9 = slot9.game_settings
	slot10 = nil
	slot9.world_setting = slot10
	slot9 = tweak_data
	slot11 = slot9
	slot9 = slot9.set_difficulty
	slot12 = difficulty

	slot9(slot10, slot11)

	slot11 = peer
	slot9 = peer.verify_job
	slot12 = job_id

	slot9(slot10, slot11)

	slot9 = managers
	slot9 = slot9.raid_job
	slot11 = slot9
	slot9 = slot9.on_mission_started

	slot9(slot10)

	slot9 = managers
	slot9 = slot9.menu_component

	if slot9 then
		slot9 = managers
		slot9 = slot9.menu_component
		slot11 = slot9
		slot9 = slot9.on_job_updated

		slot9(slot10)
	end

	return 
end

slot0.sync_game_settings = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, level_id_index, stage_num, alternative_stage, interupt_stage_level_id, sender)
	slot6 = print
	slot8 = "ConnectionNetworkHandler:sync_stage_settings"
	slot9 = level_id_index
	slot10 = stage_num
	slot11 = alternative_stage
	slot12 = interupt_stage_level_id

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = self._verify_sender
	slot8 = sender
	local peer = slot6(slot7)

	if not peer then
		return 
	end

	slot7 = tweak_data
	slot7 = slot7.levels
	slot9 = slot7
	slot7 = slot7.get_level_name_from_index
	slot10 = level_id_index
	local level_id = slot7(slot8, slot9)
	slot8 = Global
	slot8 = slot8.game_settings
	slot8.level_id = level_id
	slot8 = Global
	slot8 = slot8.game_settings
	slot9 = managers
	slot9 = slot9.raid_job
	slot11 = slot9
	slot9 = slot9.current_job
	slot9 = slot9(slot10)
	slot8.mission = slot9
	slot8 = Global
	slot8 = slot8.game_settings
	slot9 = nil
	slot8.world_setting = slot9

	return 
end

slot0.sync_stage_settings = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local peer = slot2(slot3)

	if not peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.raid_job
	slot5 = slot3
	slot3 = slot3.synced_on_restart_to_camp

	slot3(slot4)

	return 
end

slot0.sync_raid_job_on_restart_to_camp = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local peer = slot2(slot3)

	if not peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.challenge_cards
	slot5 = slot3
	slot3 = slot3.sync_challenge_cards_on_restart_to_camp

	slot3(slot4)

	return 
end

slot0.sync_challenge_cards_on_restart_to_camp = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local peer = slot2(slot3)

	if not peer then
		return 
	end

	return 
end

slot0.sync_on_restart_mission = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, level_id_index)
	slot2 = tweak_data
	slot2 = slot2.levels
	slot4 = slot2
	slot2 = slot2.get_level_name_from_index
	slot5 = level_id_index
	local level_id = slot2(slot3, slot4)
	slot3 = managers
	slot3 = slot3.menu
	slot5 = slot3
	slot3 = slot3.get_menu
	slot6 = "lobby_menu"
	local lobby_menu = slot3(slot4, slot5)

	if lobby_menu then
		slot4 = lobby_menu.renderer
		slot6 = slot4
		slot4 = slot4.is_open
		slot4 = slot4(slot5)

		if slot4 then
			slot4 = lobby_menu.renderer
			slot6 = slot4
			slot4 = slot4.sync_update_level_id
			slot7 = level_id

			slot4(slot5, slot6)
		end
	end

	return 
end

slot0.lobby_sync_update_level_id = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, difficulty)
	slot2 = managers
	slot2 = slot2.menu
	slot4 = slot2
	slot2 = slot2.get_menu
	slot5 = "lobby_menu"
	local lobby_menu = slot2(slot3, slot4)

	if lobby_menu then
		slot3 = lobby_menu.renderer
		slot5 = slot3
		slot3 = slot3.is_open
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = lobby_menu.renderer
			slot5 = slot3
			slot3 = slot3.sync_update_difficulty
			slot6 = difficulty

			slot3(slot4, slot5)
		end
	end

	return 
end

slot0.lobby_sync_update_difficulty = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, level, character, mask_set, sender)
	slot5 = self._verify_sender
	slot7 = sender
	local peer = slot5(slot6)
	slot6 = print
	slot8 = "ConnectionNetworkHandler:lobby_info"

	if peer then
		slot11 = peer
		slot9 = peer.id
		slot9 = slot9(slot10)
	end

	slot10 = level

	slot6(slot7, slot8, slot9)

	slot6 = print
	slot8 = "  IS THIS AN OK PEER?"

	if peer then
		slot11 = peer
		slot9 = peer.id
		slot9 = slot9(slot10)
	end

	slot6(slot7, slot8)

	if peer then
		slot8 = peer
		slot6 = peer.set_level
		slot9 = level

		slot6(slot7, slot8)

		slot6 = managers
		slot6 = slot6.menu
		slot8 = slot6
		slot6 = slot6.get_menu
		slot9 = "lobby_menu"
		local lobby_menu = slot6(slot7, slot8)

		if lobby_menu then
			slot7 = lobby_menu.renderer
			slot9 = slot7
			slot7 = slot7.is_open
			slot7 = slot7(slot8)

			if slot7 then
				slot7 = lobby_menu.renderer
				slot9 = slot7
				slot7 = slot7._set_player_slot
				slot12 = peer
				slot10 = peer.id
				slot10 = slot10(slot11)
				slot11 = {}
				slot14 = peer
				slot12 = peer.name
				slot12 = slot12(slot13)
				slot11.name = slot12
				slot14 = peer
				slot12 = peer.id
				slot12 = slot12(slot13)
				slot11.peer_id = slot12
				slot11.level = level
				slot11.character = character

				slot7(slot8, slot9, slot10)
			end
		end
	end

	return 
end

slot0.lobby_info = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = self._verify_gamestate
	slot3 = self._gamestate_filter
	slot3 = slot3.waiting_for_respawn
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = game_state_machine
	slot3 = slot1
	slot1 = slot1.current_state
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.begin_trade

	slot1(slot2)

	return 
end

slot0.begin_trade = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = self._verify_gamestate
	slot3 = self._gamestate_filter
	slot3 = slot3.waiting_for_respawn
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = game_state_machine
	slot3 = slot1
	slot1 = slot1.current_state
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.cancel_trade

	slot1(slot2)

	return 
end

slot0.cancel_trade = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = self._verify_gamestate
	slot3 = self._gamestate_filter
	slot3 = slot3.waiting_for_respawn
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = game_state_machine
	slot3 = slot1
	slot1 = slot1.current_state
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.finish_trade

	slot1(slot2)

	return 
end

slot0.finish_trade = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_gamestate
	slot4 = self._gamestate_filter
	slot4 = slot4.any_ingame
	slot2 = slot2(slot3)

	if not slot2 then
		return 
	end

	slot2 = self._verify_sender
	slot4 = sender
	local peer = slot2(slot3)

	if not peer then
		return 
	end

	slot3 = IngameWaitingForRespawnState
	slot3 = slot3.request_player_spawn
	slot7 = peer
	slot5 = peer.id

	slot3(slot5(slot6))

	return 
end

slot0.request_spawn_member = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, i)
	slot2 = self._verify_gamestate
	slot4 = self._gamestate_filter
	slot4 = slot4.any_ingame
	slot2 = slot2(slot3)

	if not slot2 then
		return 
	end

	slot2 = managers
	slot2 = slot2.trade
	slot4 = slot2
	slot2 = slot2.sync_hostage_trade_dialog
	slot5 = i

	slot2(slot3, slot4)

	return 
end

slot0.hostage_trade_dialog = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, i)
	slot2 = self._verify_gamestate
	slot4 = self._gamestate_filter
	slot4 = slot4.any_ingame
	slot2 = slot2(slot3)

	if not slot2 then
		return 
	end

	slot2 = managers
	slot2 = slot2.groupai
	slot4 = slot2
	slot2 = slot2.state
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.sync_warn_about_civilian_free
	slot5 = i

	slot2(slot3, slot4)

	return 
end

slot0.warn_about_civilian_free = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id, nickname, state, sender)
	slot5 = managers
	slot5 = slot5.network
	slot7 = slot5
	slot5 = slot5.session
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.on_drop_in_pause_request_received
	slot8 = peer_id
	slot9 = nickname
	slot10 = state

	slot5(slot6, slot7, slot8, slot9)

	return 
end

slot0.request_drop_in_pause = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, dropin_peer_id, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.on_drop_in_pause_confirmation_received
	slot7 = dropin_peer_id
	slot8 = sender_peer

	slot4(slot5, slot6, slot7)

	return 
end

slot0.drop_in_pause_confirmation = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, other_peer_id, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.on_dead_connection_reported
	slot9 = sender_peer
	slot7 = sender_peer.id
	slot7 = slot7(slot8)
	slot8 = other_peer_id

	slot4(slot5, slot6, slot7)

	return 
end

slot0.report_dead_connection = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_in_server_session
	slot2 = slot2()

	if not slot2 then
		slot4 = sender
		slot2 = sender.sanity_check_network_status_reply

		slot2(slot3)

		return 
	end

	slot2 = self._verify_sender
	slot4 = sender
	local sender_peer = slot2(slot3)

	if not sender_peer then
		slot5 = sender
		slot3 = sender.sanity_check_network_status_reply

		slot3(slot4)

		return 
	end

	return 
end

slot0.sanity_check_network_status = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_in_client_session
	slot2 = slot2()

	if not slot2 then
		return 
	end

	slot2 = self._verify_sender
	slot4 = sender
	local sender_peer = slot2(slot3)

	if not sender_peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	local session = slot3(slot4)
	slot6 = session
	slot4 = session.server_peer
	slot4 = slot4(slot5)

	if sender_peer ~= slot4 then
		return 
	end

	slot6 = session
	slot4 = session.is_expecting_sanity_chk_reply
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = print
		slot6 = "[ConnectionNetworkHandler:sanity_check_network_status_reply]"

		slot4(slot5)

		slot4 = managers
		slot4 = slot4.network
		slot6 = slot4
		slot4 = slot4.session
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.on_peer_lost
		slot7 = sender_peer
		slot10 = sender_peer
		slot8 = sender_peer.id

		slot4(slot5, slot6, slot8(slot9))
	end

	return 
end

slot0.sanity_check_network_status_reply = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, dropin_peer_id, progress_percentage, sender)

	-- Decompilation error in this vicinity:
	slot4 = self._verify_in_client_session
	slot4 = slot4()
	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	local session = slot4(slot5)
	slot7 = session
	slot5 = session.peer
	slot8 = dropin_peer_id
	local dropin_peer = slot5(slot6, slot7)
	slot8 = session
	slot6 = session.on_dropin_progress_received
	slot9 = dropin_peer_id
	slot10 = progress_percentage

	slot6(slot7, slot8, slot9)

	return 
end

slot0.dropin_progress = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id, ready, mode, outfit_versions_str, sender)

	-- Decompilation error in this vicinity:
	slot6 = self._verify_gamestate
	slot8 = self._gamestate_filter
	slot8 = slot8.any_ingame
	slot6 = slot6(slot7)
	slot6 = managers
	slot6 = slot6.network
	slot8 = slot6
	slot6 = slot6.session
	slot6 = slot6(slot7)
	slot8 = slot6
	slot6 = slot6.peer
	slot9 = peer_id
	local peer = slot6(slot7, slot8)

	if not peer then
		return 
	end

	if mode == 1 then
		if ready ~= 0 then
			ready = true
		else
			ready = false
		end

		local ready_state = peer.waiting_for_player_ready(slot8)
		slot11 = ready

		peer.set_waiting_for_player_ready(peer, peer)

		slot10 = managers.network
		slot14 = true

		managers.network.session(peer).on_set_member_ready(peer, managers.network.session(peer), peer_id, ready, ready_state ~= ready)

		slot10 = Network
		slot8 = Network.is_server(peer)

		if slot8 then
			slot10 = managers.network
			slot16 = ""

			managers.network.session(slot9).send_to_peers_loaded_except(slot9, managers.network.session(slot9), peer_id, "set_member_ready", peer_id, (ready and 1) or 0, 1)

			slot10 = game_state_machine
			slot8 = game_state_machine.current_state(slot9).start_game_intro

			if slot8 then
			elseif ready then
			end
		end
	elseif mode == 2 then
		slot9 = peer
		slot7 = peer.set_streaming_status
		slot10 = ready

		slot7(slot8, slot9)

		slot7 = managers
		slot7 = slot7.network
		slot9 = slot7
		slot7 = slot7.session
		slot7 = slot7(slot8)
		slot9 = slot7
		slot7 = slot7.on_streaming_progress_received
		slot10 = peer
		slot11 = ready

		slot7(slot8, slot9, slot10)
	elseif mode == 3 then
		slot7 = Network
		slot9 = slot7
		slot7 = slot7.is_server
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = managers
			slot7 = slot7.network
			slot9 = slot7
			slot7 = slot7.session
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.on_peer_finished_loading_outfit
			slot10 = peer
			slot11 = ready
			slot12 = outfit_versions_str

			slot7(slot8, slot9, slot10, slot11)
		end
	elseif mode == 4 then
		slot7 = Network
		slot9 = slot7
		slot7 = slot7.is_client
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = managers
			slot7 = slot7.network
			slot9 = slot7
			slot7 = slot7.session
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.server_peer
			slot7 = slot7(slot8)

			if peer == slot7 then
				slot7 = managers
				slot7 = slot7.network
				slot9 = slot7
				slot7 = slot7.session
				slot7 = slot7(slot8)
				slot9 = slot7
				slot7 = slot7.notify_host_when_outfits_loaded
				slot10 = ready
				slot11 = outfit_versions_str

				slot7(slot8, slot9, slot10)
			end
		end
	elseif mode == 5 then
		slot7 = true
		peer.ready_for_dropin_spawn = slot7
	end

	return 
end

slot0.set_member_ready = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, channel_id, message, sender)
	slot4 = self._verify_sender
	slot6 = sender
	local peer = slot4(slot5)

	if not peer then
		return 
	end

	slot5 = print
	slot7 = "send_chat_message peer"
	slot8 = peer
	slot11 = peer
	slot9 = peer.id

	slot5(slot6, slot7, slot9(slot10))

	slot5 = managers
	slot5 = slot5.chat
	slot7 = slot5
	slot5 = slot5.receive_message_by_peer
	slot8 = channel_id
	slot9 = peer
	slot10 = message

	slot5(slot6, slot7, slot8, slot9)

	return 
end

slot0.send_chat_message = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, outfit_string, outfit_version, outfit_signature, sender)
	slot5 = self._verify_sender
	slot7 = sender
	local peer = slot5(slot6)

	if not peer then
		return 
	end

	slot6 = print
	slot8 = "[ConnectionNetworkHandler:sync_outfit]"
	slot9 = "peer_id"
	slot12 = peer
	slot10 = peer.id
	slot10 = slot10(slot11)
	slot11 = "outfit_string"
	slot12 = outfit_string
	slot13 = "outfit_version"
	slot14 = outfit_version

	slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13)

	slot8 = peer
	slot6 = peer.set_outfit_string
	slot9 = outfit_string
	slot10 = outfit_version
	slot11 = outfit_signature
	slot6, slot7, slot8 = slot6(slot7, slot8, slot9, slot10)
	outfit_signature = slot8
	outfit_version = slot7
	outfit_string = slot6
	slot6 = managers
	slot6 = slot6.network
	slot8 = slot6
	slot6 = slot6.session
	slot6 = slot6(slot7)
	slot8 = slot6
	slot6 = slot6.is_host
	slot6 = slot6(slot7)

	if slot6 then
		slot6 = managers
		slot6 = slot6.network
		slot8 = slot6
		slot6 = slot6.session
		slot6 = slot6(slot7)
		slot8 = slot6
		slot6 = slot6.chk_request_peer_outfit_load_status

		slot6(slot7)
	end

	slot6 = managers
	slot6 = slot6.network
	slot8 = slot6
	slot6 = slot6.session
	slot6 = slot6(slot7)

	if slot6 then
		slot6 = managers
		slot6 = slot6.network
		slot8 = slot6
		slot6 = slot6.session
		slot6 = slot6(slot7)
		slot8 = slot6
		slot6 = slot6.local_peer
		local local_peer = slot6(slot7)
	end

	if local_peer then
		slot9 = local_peer
		slot7 = local_peer.in_lobby
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = game_state_machine
			slot9 = slot7
			slot7 = slot7.current_state_name
			slot7 = slot7(slot8)

			if slot7 ~= "ingame_lobby_menu" then
				slot7 = setup
				slot9 = slot7
				slot7 = slot7.is_unloading
				slot7 = slot7(slot8)
				slot7 = not slot7
			else
				slot7 = false

				if false then
					local in_lobby = true
				end
			end
		end
	end

	slot8 = managers
	slot8 = slot8.menu_component

	if slot8 then
		slot8 = managers
		slot8 = slot8.menu_component
		slot10 = slot8
		slot8 = slot8.peer_outfit_updated
		slot13 = peer
		slot11 = peer.id

		slot8(slot9, slot11(slot12))
	end

	return 
end

slot0.sync_outfit = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, level, class, sender)
	slot4 = self._verify_sender
	slot6 = sender
	local peer = slot4(slot5)

	if not peer then
		return 
	end

	slot7 = peer
	slot5 = peer.set_profile
	slot8 = level

	slot5(slot6, slot7)

	slot7 = peer
	slot5 = peer.set_class
	slot8 = class

	slot5(slot6, slot7)

	return 
end

slot0.sync_profile = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)

	-- Decompilation error in this vicinity:
	slot2 = print
	slot4 = "[ConnectionNetworkHandler:steam_p2p_ping] from"
	slot7 = sender
	slot5 = sender.ip_at_index
	slot8 = 0
	slot5 = slot5(slot6, slot7)
	slot8 = sender
	slot6 = sender.protocol_at_index
	slot9 = 0

	slot2(slot3, slot4, slot6(slot7, slot8))

	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.session
	local session = slot2(slot3)
	slot5 = session
	slot3 = session.on_steam_p2p_ping
	slot6 = sender

	slot3(slot4, slot5)

	return 
end

slot0.steam_p2p_ping = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, state, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local peer = slot3(slot4)

	if not peer then
		slot6 = sender
		slot4 = sender.re_open_lobby_reply
		slot7 = false

		slot4(slot5, slot6)

		return 
	end

	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	local session = slot4(slot5)
	slot7 = session
	slot5 = session.closing
	slot5 = slot5(slot6)

	if slot5 then
		slot7 = sender
		slot5 = sender.re_open_lobby_reply
		slot8 = false

		slot5(slot6, slot7)

		return 
	end

	slot7 = session
	slot5 = session.on_re_open_lobby_request
	slot8 = peer
	slot9 = state

	slot5(slot6, slot7, slot8)

	return 
end

slot0.re_open_lobby_request = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, status, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local peer = slot3(slot4)

	if not peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	local session = slot4(slot5)
	slot7 = session
	slot5 = session.closing
	slot5 = slot5(slot6)

	if slot5 then
		return 
	end

	slot5 = managers
	slot5 = slot5.network
	slot5 = slot5.matchmake
	slot7 = slot5
	slot5 = slot5.from_host_lobby_re_opened
	slot8 = status

	slot5(slot6, slot7)

	return 
end

slot0.re_open_lobby_reply = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, position, normal, damage, peer_id_or_selection_index, sender)
	slot6 = self._verify_sender
	slot8 = sender
	local peer = slot6(slot7)
	slot7 = self._verify_gamestate
	slot9 = self._gamestate_filter
	slot9 = slot9.any_ingame
	slot7 = slot7(slot8)

	if not slot7 or not peer then
		return 
	end

	slot7 = InstantExplosiveBulletBase

	if slot7 then
		if false then
			slot7 = managers
			slot7 = slot7.criminals

			if slot7 then
				slot7 = managers
				slot7 = slot7.criminals
				slot9 = slot7
				slot7 = slot7.character_unit_by_peer_id
				slot12 = peer
				slot10 = peer.id
				local user_unit = slot7(slot8, slot10(slot11))
			end

			slot8 = alive
			slot10 = user_unit
			slot8 = slot8(slot9)

			if slot8 then
				slot10 = user_unit
				slot8 = user_unit.inventory
				slot8 = slot8(slot9)
				slot10 = slot8
				slot8 = slot8.unit_by_selection
				slot11 = peer_id_or_selection_index
				local weapon_unit = slot8(slot9, slot10)
				slot9 = alive
				slot11 = weapon_unit
				slot9 = slot9(slot10)

				if slot9 then
					slot9 = InstantExplosiveBulletBase
					slot11 = slot9
					slot9 = slot9.on_collision_server
					slot12 = position
					slot13 = normal
					slot14 = damage / 163.84
					slot15 = user_unit
					slot16 = weapon_unit
					slot19 = peer
					slot17 = peer.id
					slot17 = slot17(slot18)
					slot18 = peer_id_or_selection_index

					slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
				end
			end
		else
			slot7 = InstantExplosiveBulletBase
			slot9 = slot7
			slot7 = slot7.on_collision_client
			slot10 = position
			slot11 = normal
			slot12 = damage / 163.84
			slot13 = managers
			slot13 = slot13.criminals

			if slot13 then
				slot13 = managers
				slot13 = slot13.criminals
				slot15 = slot13
				slot13 = slot13.character_unit_by_peer_id
				slot16 = peer_id_or_selection_index
				slot13 = slot13(slot14, slot15)
			end

			slot7(slot8, slot9, slot10, slot11, slot12)
		end
	end

	return 
end

slot0.sync_explode_bullet = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, position, normal, damage, peer_id_or_selection_index, sender)
	slot6 = self._verify_sender
	slot8 = sender
	local peer = slot6(slot7)
	slot7 = self._verify_gamestate
	slot9 = self._gamestate_filter
	slot9 = slot9.any_ingame
	slot7 = slot7(slot8)

	if not slot7 or not peer then
		return 
	end

	slot7 = FlameBulletBase

	if slot7 then
		slot7 = Network
		slot9 = slot7
		slot7 = slot7.is_server
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = managers
			slot7 = slot7.criminals

			if slot7 then
				slot7 = managers
				slot7 = slot7.criminals
				slot9 = slot7
				slot7 = slot7.character_unit_by_peer_id
				slot12 = peer
				slot10 = peer.id
				local user_unit = slot7(slot8, slot10(slot11))
			end

			slot8 = alive
			slot10 = user_unit
			slot8 = slot8(slot9)

			if slot8 then
				slot10 = user_unit
				slot8 = user_unit.inventory
				slot8 = slot8(slot9)
				slot10 = slot8
				slot8 = slot8.unit_by_selection
				slot11 = peer_id_or_selection_index
				local weapon_unit = slot8(slot9, slot10)
				slot9 = alive
				slot11 = weapon_unit
				slot9 = slot9(slot10)

				if slot9 then
					slot9 = FlameBulletBase
					slot11 = slot9
					slot9 = slot9.on_collision_server
					slot12 = position
					slot13 = normal
					slot14 = damage / 163.84
					slot15 = user_unit
					slot16 = weapon_unit
					slot19 = peer
					slot17 = peer.id
					slot17 = slot17(slot18)
					slot18 = peer_id_or_selection_index

					slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
				end
			end
		else
			slot7 = FlameBulletBase
			slot9 = slot7
			slot7 = slot7.on_collision_client
			slot10 = position
			slot11 = normal
			slot12 = damage / 163.84
			slot13 = managers
			slot13 = slot13.criminals

			if slot13 then
				slot13 = managers
				slot13 = slot13.criminals
				slot15 = slot13
				slot13 = slot13.character_unit_by_peer_id
				slot16 = peer_id_or_selection_index
				slot13 = slot13(slot14, slot15)
			end

			slot7(slot8, slot9, slot10, slot11, slot12)
		end
	end

	return 
end

slot0.sync_flame_bullet = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, count_cops, count_gangsters, count_civilians, count_cop_kills, count_gangster_kills, count_civilian_kills, selection_index, sender)
	slot9 = self._verify_sender
	slot11 = sender
	local peer = slot9(slot10)

	if not peer then
		return 
	end

	slot10 = managers
	slot10 = slot10.player
	slot12 = slot10
	slot10 = slot10.local_player
	local player = slot10(slot11)
	slot11 = alive
	slot13 = player
	slot11 = slot11(slot12)

	if slot11 then
		slot13 = player
		slot11 = player.inventory
		slot11 = slot11(slot12)
		slot13 = slot11
		slot11 = slot11.unit_by_selection
		slot14 = selection_index
		local weapon_unit = slot11(slot12, slot13)
	end

	slot12 = alive
	slot14 = weapon_unit
	slot12 = slot12(slot13)

	if slot12 then
		local enemies_hit = (count_gangsters or 0) + (count_cops or 0)
		local enemies_killed = (count_gangster_kills or 0) + (count_cop_kills or 0)
		slot14 = managers
		slot14 = slot14.statistics
		slot16 = slot14
		slot14 = slot14.shot_fired
		slot17 = {
			hit = false,
			weapon_unit = weapon_unit
		}

		slot14(slot15, slot16)

		slot14 = 0

		if slot14 < enemies_hit then
			slot14 = managers
			slot14 = slot14.statistics
			slot16 = slot14
			slot14 = slot14.shot_fired
			slot17 = {
				skip_bullet_count = true,
				hit = true,
				weapon_unit = weapon_unit
			}

			slot14(slot15, slot16)
		end
	end

	return 
end

slot0.sync_explosion_results = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, count_cops, count_gangsters, count_civilians, count_cop_kills, count_gangster_kills, count_civilian_kills, selection_index, sender)
	slot9 = self._verify_sender
	slot11 = sender
	local peer = slot9(slot10)

	if not peer then
		return 
	end

	slot10 = managers
	slot10 = slot10.player
	slot12 = slot10
	slot10 = slot10.local_player
	local player = slot10(slot11)
	slot11 = alive
	slot13 = player
	slot11 = slot11(slot12)

	if slot11 then
		slot13 = player
		slot11 = player.inventory
		slot11 = slot11(slot12)
		slot13 = slot11
		slot11 = slot11.unit_by_selection
		slot14 = selection_index
		local weapon_unit = slot11(slot12, slot13)
	end

	slot12 = alive
	slot14 = weapon_unit
	slot12 = slot12(slot13)

	if slot12 then
		local enemies_hit = (count_gangsters or 0) + (count_cops or 0)
		local enemies_killed = (count_gangster_kills or 0) + (count_cop_kills or 0)
		slot14 = managers
		slot14 = slot14.statistics
		slot16 = slot14
		slot14 = slot14.shot_fired
		slot17 = {
			hit = false,
			weapon_unit = weapon_unit
		}

		slot14(slot15, slot16)

		slot14 = 0

		if slot14 < enemies_hit then
			slot14 = managers
			slot14 = slot14.statistics
			slot16 = slot14
			slot14 = slot14.shot_fired
			slot17 = {
				skip_bullet_count = true,
				hit = true,
				weapon_unit = weapon_unit
			}

			slot14(slot15, slot16)
		end

		slot14, slot15, slot16, slot17 = nil
	end

	return 
end

slot0.sync_fire_results = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, type, value, result, sender)
	slot5 = self._verify_sender
	slot7 = sender
	local peer = slot5(slot6)

	if not peer then
		return 
	end

	slot6 = managers
	slot6 = slot6.vote
	slot8 = slot6
	slot6 = slot6.network_package
	slot9 = type
	slot10 = value
	slot11 = result
	slot14 = peer
	slot12 = peer.id

	slot6(slot7, slot8, slot9, slot10, slot12(slot13))

	return 
end

slot0.voting_data = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, achievement_id, sender)
	slot3 = self._verify_sender
	slot5 = sender
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = print
	slot5 = "ConnectionNetworkHandler:sync_award_achievement():"
	slot6 = achievement_id

	slot3(slot4, slot5)

	slot3 = managers
	slot3 = slot3.achievment
	slot5 = slot3
	slot3 = slot3.award
	slot6 = achievement_id

	slot3(slot4, slot5)

	return 
end

slot0.sync_award_achievement = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, type, position, range, filter, aggressor, head_position, sender)
	slot8 = self._verify_sender
	slot10 = sender
	local peer = slot8(slot9)
	slot9 = self._verify_gamestate
	slot11 = self._gamestate_filter
	slot11 = slot11.any_ingame
	slot9 = slot9(slot10)

	if not slot9 or not peer then
		return 
	end

	slot9 = managers
	slot9 = slot9.groupai
	slot11 = slot9
	slot9 = slot9.state
	slot9 = slot9(slot10)
	slot11 = slot9
	slot9 = slot9.propagate_alert
	slot12 = {
		type,
		position,
		range,
		filter,
		aggressor,
		head_position
	}

	slot9(slot10, slot11)

	return 
end

slot0.propagate_alert = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, character_name, time)
	slot3 = self._verify_gamestate
	slot5 = self._gamestate_filter
	slot5 = slot5.any_ingame
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = managers
	slot3 = slot3.trade
	slot5 = slot3
	slot3 = slot3.sync_set_auto_assault_ai_trade
	slot6 = character_name
	slot7 = time

	slot3(slot4, slot5, slot6)

	return 
end

slot0.set_auto_assault_ai_trade = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, world_id, peer, stage, sender)
	slot5 = self._verify_sender
	slot7 = sender
	slot5 = slot5(slot6)

	if not slot5 then
		return 
	end

	slot5 = managers
	slot5 = slot5.worldcollection
	slot7 = slot5
	slot5 = slot5.sync_world_prepared
	slot8 = world_id
	slot9 = peer
	slot10 = stage

	slot5(slot6, slot7, slot8, slot9)

	return 
end

slot0.sync_prepare_world = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, package, count, sender)
	slot4 = self._verify_in_client_session
	slot4 = slot4()

	if not slot4 then
		slot4 = Application
		slot6 = slot4
		slot4 = slot4.error
		slot7 = "[ConnectionNetworkHandler:send_loaded_packages] Not session, recieving failed!"

		slot4(slot5, slot6)

		return 
	end

	Global.game_settings.packages_packed = Global.game_settings.packages_packed or {}
	slot7 = {
		package = package,
		count = count
	}

	table.insert(Global.game_settings.packages_packed or , Global.game_settings.packages_packed)

	return 
end

slot0.send_loaded_packages = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, tweak_table, position, yaw, pitch, roll, sender)
	slot7 = self._verify_sender
	slot9 = sender
	slot7 = slot7(slot8)

	if not slot7 then
		return 
	end

	slot7 = managers
	slot7 = slot7.drop_loot
	slot9 = slot7
	slot7 = slot7.drop_item
	slot10 = tweak_table
	slot11 = position
	slot12 = Rotation
	slot14 = yaw
	slot15 = pitch
	slot16 = roll

	slot7(slot8, slot9, slot10, slot12(slot13, slot14, slot15))

	return 
end

slot0.spawn_loot = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	return 
end

slot0.connection_keep_alive = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id, new_character_name, peer_unit)
	slot4 = managers
	slot4 = slot4.character_customization
	slot6 = slot4
	slot4 = slot4.request_change_criminal_character
	slot7 = peer_id
	slot8 = new_character_name
	slot9 = peer_unit

	slot4(slot5, slot6, slot7, slot8)

	return 
end

slot0.request_change_criminal_character = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id, new_character_name, peer_unit)
	slot4 = managers
	slot4 = slot4.character_customization
	slot6 = slot4
	slot4 = slot4.change_criminal_character
	slot7 = peer_id
	slot8 = new_character_name
	slot9 = peer_unit

	slot4(slot5, slot6, slot7, slot8)

	return 
end

slot0.change_criminal_character = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, card_key_name, peer_id, steam_instance_id)
	slot4 = managers
	slot4 = slot4.menu_component
	slot4 = slot4._raid_challenge_cards_gui

	if slot4 then
		slot4 = managers
		slot4 = slot4.menu_component
		slot4 = slot4._raid_challenge_cards_gui
		slot6 = slot4
		slot4 = slot4.sync_host_selects_suggested_card
		slot7 = card_key_name
		slot8 = peer_id
		slot9 = steam_instance_id

		slot4(slot5, slot6, slot7, slot8)
	end

	return 
end

slot0.sync_host_selects_suggested_card = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, action, peer_id)
	slot3 = managers
	slot3 = slot3.menu_component
	slot3 = slot3._raid_challenge_cards_gui

	if slot3 then
		slot3 = managers
		slot3 = slot3.menu_component
		slot3 = slot3._raid_challenge_cards_gui
		slot5 = slot3
		slot3 = slot3.sync_phase_two_execute_action
		slot6 = action
		slot7 = peer_id

		slot3(slot4, slot5, slot6)
	end

	return 
end

slot0.sync_phase_two_execute_action = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id)
	slot2 = managers
	slot2 = slot2.challenge_cards
	slot4 = slot2
	slot2 = slot2.select_challenge_card
	slot5 = peer_id

	slot2(slot3, slot4)

	return 
end

slot0.select_challenge_card = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, challenge_card_key, peer_id)
	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.local_peer
	local local_peer = slot3(slot4)
	slot4 = local_peer._id

	if slot4 == peer_id then
		slot4 = managers
		slot4 = slot4.challenge_cards
		slot6 = slot4
		slot4 = slot4.remove_challenge_card_from_inventory
		slot7 = challenge_card_key

		slot4(slot5, slot6)
	end

	return 
end

slot0.remove_challenge_card_from_inventory = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1._activate_challenge_card

	slot1(slot2)

	return 
end

slot0.sync_activate_challenge_card = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.mark_active_card_as_spent

	slot1(slot2)

	return 
end

slot0.mark_active_card_as_spent = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.set_successfull_raid_end

	slot1(slot2)

	return 
end

slot0.set_successfull_raid_end = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.deactivate_active_challenge_card

	slot1(slot2)

	return 
end

slot0.deactivate_active_challenge_card = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.remove_active_challenge_card

	slot1(slot2)

	return 
end

slot0.remove_active_challenge_card = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, challenge_card_key, peer_id, steam_instance_id)
	slot4 = managers
	slot4 = slot4.challenge_cards
	slot6 = slot4
	slot4 = slot4.sync_suggested_card_from_peer
	slot7 = challenge_card_key
	slot8 = peer_id
	slot9 = steam_instance_id

	slot4(slot5, slot6, slot7, slot8)

	return 
end

slot0.send_suggested_card_to_peers = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id)
	slot2 = managers
	slot2 = slot2.challenge_cards
	slot4 = slot2
	slot2 = slot2.sync_remove_suggested_card_from_peer
	slot5 = peer_id

	slot2(slot3, slot4)

	return 
end

slot0.send_remove_suggested_card_to_peers = slot1
slot0 = ConnectionNetworkHandler

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.clear_suggested_cards

	slot1(slot2)

	return 
end

slot0.clear_suggested_cards = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, peer_id)
	slot2 = managers
	slot2 = slot2.challenge_cards
	slot4 = slot2
	slot2 = slot2.sync_toggle_lock_suggested_challenge_card
	slot5 = peer_id

	slot2(slot3, slot4)

	return 
end

slot0.send_toggle_lock_suggested_card_to_peers = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, challenge_card_key, effect_id, peer_id)
	slot4 = managers
	slot4 = slot4.challenge_cards
	slot6 = slot4
	slot4 = slot4.card_failed_warning
	slot7 = challenge_card_key
	slot8 = effect_id
	slot9 = peer_id

	slot4(slot5, slot6, slot7, slot8)

	return 
end

slot0.card_failed_warning = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, failed_effect_name, peer_id)
	slot3 = managers
	slot3 = slot3.buff_effect
	slot5 = slot3
	slot3 = slot3.fail_effect
	slot6 = failed_effect_name
	slot7 = peer_id

	slot3(slot4, slot5, slot6)

	return 
end

slot0.fail_effect = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, loot_type, name, xp, peer_id)
	slot5 = managers
	slot5 = slot5.lootdrop
	slot7 = slot5
	slot5 = slot5.on_loot_dropped_for_peer
	slot8 = loot_type
	slot9 = name
	slot10 = xp
	slot11 = peer_id

	slot5(slot6, slot7, slot8, slot9, slot10)

	return 
end

slot0.sync_loot_to_peers = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, job_id, difficulty)
	slot3 = tweak_data
	slot5 = slot3
	slot3 = slot3.set_difficulty
	slot6 = difficulty

	slot3(slot4, slot5)

	slot3 = managers
	slot3 = slot3.raid_job
	slot5 = slot3
	slot3 = slot3._set_selected_job
	slot6 = job_id

	slot3(slot4, slot5)

	return 
end

slot0.sync_set_selected_job = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, job_id, sender)
	slot3 = self._verify_sender
	slot5 = sender
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = managers
	slot3 = slot3.raid_job
	slot5 = slot3
	slot3 = slot3.sync_current_job
	slot6 = job_id

	slot3(slot4, slot5)

	return 
end

slot0.sync_current_job = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, picked_up_current_leg, picked_up_total, sender)
	slot4 = self._verify_sender
	slot6 = sender
	slot4 = slot4(slot5)

	if not slot4 then
		return 
	end

	slot4 = managers
	slot4 = slot4.lootdrop
	slot6 = slot4
	slot4 = slot4.set_picked_up_current_leg
	slot7 = picked_up_current_leg

	slot4(slot5, slot6)

	slot4 = managers
	slot4 = slot4.lootdrop
	slot6 = slot4
	slot4 = slot4.set_picked_up_total
	slot7 = picked_up_total

	slot4(slot5, slot6)

	slot4 = managers
	slot4 = slot4.notification
	slot6 = slot4
	slot4 = slot4.add_notification
	slot7 = {
		id = "hud_hint_grabbed_nazi_gold",
		duration = 2,
		shelf_life = 5
	}
	slot8 = HUDNotification
	slot8 = slot8.DOG_TAG
	slot7.notification_type = slot8
	slot7.acquired = picked_up_current_leg
	slot7.total = picked_up_total

	slot4(slot5, slot6)

	return 
end

slot0.sync_picked_up_loot_values = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, spawned_current_leg, spawned_total, sender)
	slot4 = self._verify_sender
	slot6 = sender
	slot4 = slot4(slot5)

	if not slot4 then
		return 
	end

	slot4 = managers
	slot4 = slot4.lootdrop
	slot6 = slot4
	slot4 = slot4.set_loot_spawned_total
	slot7 = spawned_total

	slot4(slot5, slot6)

	slot4 = managers
	slot4 = slot4.lootdrop
	slot6 = slot4
	slot4 = slot4.set_loot_spawned_current_leg
	slot7 = spawned_current_leg

	slot4(slot5, slot6)

	return 
end

slot0.sync_spawned_loot_values = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, from_beginning, drop_in, sender)
	slot4 = self._verify_sender
	slot6 = sender
	slot4 = slot4(slot5)

	if not slot4 then
		return 
	end

	slot4 = managers
	slot4 = slot4.statistics
	slot6 = slot4
	slot4 = slot4.start_session
	slot7 = {
		from_beginning = from_beginning,
		drop_in = drop_in
	}

	slot4(slot5, slot6)

	return 
end

slot0.start_statistics_session = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, success, quit, end_type, sender)
	slot5 = self._verify_sender
	slot7 = sender
	slot5 = slot5(slot6)

	if not slot5 then
		return 
	end

	slot5 = managers
	slot5 = slot5.statistics
	slot7 = slot5
	slot5 = slot5.stop_session
	slot8 = {
		success = success,
		quit = quit,
		type = end_type
	}

	slot5(slot6, slot7)

	return 
end

slot0.stop_statistics_session = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, current_event_index, sender)
	slot3 = self._verify_sender
	slot5 = sender
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = managers
	slot3 = slot3.raid_job
	slot5 = slot3
	slot3 = slot3.sync_current_event_index
	slot6 = current_event_index

	slot3(slot4, slot5)

	return 
end

slot0.sync_current_event_index = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	slot2 = slot2(slot3)

	if not slot2 then
		return 
	end

	slot2 = managers
	slot2 = slot2.raid_job
	slot4 = slot2
	slot2 = slot2.complete_job

	slot2(slot3)

	return 
end

slot0.sync_complete_job = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, loot_acquired, loot_spawned, sender)
	slot4 = self._verify_sender
	slot6 = sender
	slot4 = slot4(slot5)

	if not slot4 then
		return 
	end

	slot4 = managers
	slot4 = slot4.raid_job
	slot6 = slot4
	slot4 = slot4.sync_event_loot_data
	slot7 = loot_acquired
	slot8 = loot_spawned

	slot4(slot5, slot6, slot7)

	return 
end

slot0.sync_event_loot_data = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, airplane_unit, sequence_name, sender)
	slot4 = self._verify_sender
	slot6 = sender
	slot4 = slot4(slot5)

	if not slot4 then
		return 
	end

	slot4 = managers
	slot4 = slot4.barrage
	slot6 = slot4
	slot4 = slot4.sync_airplane_barrage
	slot7 = airplane_unit
	slot8 = sequence_name

	slot4(slot5, slot6, slot7)

	return 
end

slot0.sync_airplane_barrage = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, event_name, sender)
	slot3 = self._verify_sender
	slot5 = sender
	slot3 = slot3(slot4)

	if not slot3 then
		return 
	end

	slot3 = managers
	slot3 = slot3.barrage
	slot5 = slot3
	slot3 = slot3.play_barrage_launch_sound
	slot6 = event_name

	slot3(slot4, slot5)

	return 
end

slot0.sync_barrage_launch_sound = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, mission_id, event_id, reload_mission_flag, sender)
	slot5 = self._verify_sender
	slot7 = sender
	slot5 = slot5(slot6)

	if not slot5 then
		return 
	end

	slot5 = tweak_data
	slot5 = slot5.operations
	slot7 = slot5
	slot5 = slot5.mission_data
	slot8 = mission_id
	local mission = slot5(slot6, slot7)
	slot6 = mission.job_type
	slot7 = OperationsTweakData
	slot7 = slot7.JOB_TYPE_OPERATION

	if slot6 == slot7 then
		slot6 = managers
		slot6 = slot6.raid_job
		slot8 = slot6
		slot6 = slot6.set_current_event
		slot9 = mission
		slot10 = event_id

		slot6(slot7, slot8, slot9)
	end

	if reload_mission_flag then
		slot6 = managers
		slot6 = slot6.raid_job
		slot6.reload_mission_flag = reload_mission_flag
		slot6 = managers
		slot6 = slot6.worldcollection
		slot8 = slot6
		slot6 = slot6.add_one_package_ref_to_all

		slot6(slot7)

		slot6 = managers
		slot6 = slot6.raid_job
		slot7 = managers
		slot7 = slot7.raid_job
		slot7 = slot7._current_job
		slot6._selected_job = slot7
		slot6 = managers
		slot6 = slot6.raid_job
		slot8 = slot6
		slot6 = slot6.on_mission_restart

		slot6(slot7)

		slot6 = managers
		slot6 = slot6.raid_job
		slot8 = slot6
		slot6 = slot6.stop_sounds

		slot6(slot7)
	end

	slot6 = managers
	slot6 = slot6.raid_job
	slot8 = slot6
	slot6 = slot6.do_external_start_mission
	slot9 = mission
	slot10 = event_id

	slot6(slot7, slot8, slot9)

	return 
end

slot0.sync_external_start_mission = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, restart_camp, failed, sender)
	slot4 = self._verify_sender
	slot6 = sender
	slot4 = slot4(slot5)

	if not slot4 then
		return 
	end

	slot4 = managers
	slot4 = slot4.raid_job
	slot6 = slot4
	slot4 = slot4.set_stage_success
	slot7 = not failed

	slot4(slot5, slot6)

	slot4 = managers
	slot4 = slot4.raid_job
	slot6 = slot4
	slot4 = slot4.do_external_end_mission
	slot7 = restart_camp

	slot4(slot5, slot6)

	return 
end

slot0.sync_external_end_mission = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	slot2 = slot2(slot3)

	if not slot2 then
		return 
	end

	slot2 = managers
	slot2 = slot2.raid_job
	slot4 = slot2
	slot2 = slot2.do_external_end_mission

	slot2(slot3)

	return 
end

slot0.restart = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, fill_percentage, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.criminals
	slot6 = slot4
	slot4 = slot4.character_data_by_peer_id
	slot9 = sender_peer
	slot7 = sender_peer.id
	local character_data = slot4(slot5, slot7(slot8))
	slot5 = managers
	slot5 = slot5.hud
	slot7 = slot5
	slot5 = slot5.set_teammate_warcry_meter_fill
	slot8 = character_data.panel_id
	slot9 = {
		total = 100,
		current = fill_percentage
	}

	slot5(slot6, slot7, slot8)

	return 
end

slot0.sync_warcry_meter_fill_percentage = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, value, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.criminals
	slot6 = slot4
	slot4 = slot4.character_data_by_peer_id
	slot9 = sender_peer
	slot7 = sender_peer.id
	local character_data = slot4(slot5, slot7(slot8))
	slot5 = managers
	slot5 = slot5.hud
	slot7 = slot5
	slot5 = slot5.set_warcry_meter_glow
	slot8 = character_data.panel_id
	slot9 = value

	slot5(slot6, slot7, slot8)

	return 
end

slot0.sync_warcry_meter_glow = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, warcry_type, warcry_level, duration, sender)
	slot5 = self._verify_sender
	slot7 = sender
	local sender_peer = slot5(slot6)

	if not sender_peer then
		return 
	end

	slot6 = managers
	slot6 = slot6.criminals
	slot8 = slot6
	slot6 = slot6.character_data_by_peer_id
	slot11 = sender_peer
	slot9 = sender_peer.id
	local character_data = slot6(slot7, slot9(slot10))
	slot9 = sender_peer
	slot7 = sender_peer.unit
	slot7 = slot7(slot8)

	if slot7 then
		slot9 = sender_peer
		slot7 = sender_peer.unit
		slot7 = slot7(slot8)
		slot9 = slot7
		slot7 = slot7.unit_data
		slot7 = slot7(slot8)

		if slot7 then
			slot9 = sender_peer
			slot7 = sender_peer.unit
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.unit_data
			slot7 = slot7(slot8)
			local name_label_id = slot7.name_label_id
		end
	end

	slot8 = managers
	slot8 = slot8.hud
	slot10 = slot8
	slot8 = slot8.activate_teammate_warcry
	slot11 = character_data.panel_id
	slot12 = name_label_id
	slot13 = duration

	slot8(slot9, slot10, slot11, slot12)

	slot8 = managers
	slot8 = slot8.warcry
	slot10 = slot8
	slot8 = slot8.activate_peer_warcry
	slot13 = sender_peer
	slot11 = sender_peer.id
	slot11 = slot11(slot12)
	slot12 = warcry_type
	slot13 = warcry_level

	slot8(slot9, slot10, slot11, slot12)

	return 
end

slot0.sync_activate_warcry = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local sender_peer = slot2(slot3)

	if not sender_peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.criminals
	slot5 = slot3
	slot3 = slot3.character_data_by_peer_id
	slot8 = sender_peer
	slot6 = sender_peer.id
	local character_data = slot3(slot4, slot6(slot7))
	slot6 = sender_peer
	slot4 = sender_peer.unit
	slot4 = slot4(slot5)

	if slot4 then
		slot6 = sender_peer
		slot4 = sender_peer.unit
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.unit_data
		slot4 = slot4(slot5)

		if slot4 then
			slot6 = sender_peer
			slot4 = sender_peer.unit
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.unit_data
			slot4 = slot4(slot5)
			local name_label_id = slot4.name_label_id
		end
	end

	slot5 = managers
	slot5 = slot5.hud
	slot7 = slot5
	slot5 = slot5.deactivate_teammate_warcry
	slot8 = character_data.panel_id
	slot9 = name_label_id

	slot5(slot6, slot7, slot8)

	slot5 = managers
	slot5 = slot5.warcry
	slot7 = slot5
	slot5 = slot5.deactivate_peer_warcry
	slot10 = sender_peer
	slot8 = sender_peer.id

	slot5(slot6, slot8(slot9))

	return 
end

slot0.sync_deactivate_warcry = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, amount, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.player
	slot6 = slot4
	slot4 = slot4.refill_grenades
	slot7 = amount

	slot4(slot5, slot6)

	return 
end

slot0.refill_grenades = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, id, instigator, sender)
	slot4 = self._verify_sender
	slot6 = sender
	local sender_peer = slot4(slot5)

	if not sender_peer then
		return 
	end

	slot5 = Network
	slot7 = slot5
	slot5 = slot5.is_server
	slot5 = slot5(slot6)

	if slot5 then
		slot5 = managers
		slot5 = slot5.dialog
		slot7 = slot5
		slot5 = slot5.queue_dialog
		slot8 = id
		slot9 = {
			skip_idle_check = true,
			instigator = instigator
		}

		slot5(slot6, slot7, slot8)
	else
		slot5 = managers
		slot5 = slot5.dialog
		slot7 = slot5
		slot5 = slot5.sync_queue_dialog
		slot8 = id
		slot9 = instigator

		slot5(slot6, slot7, slot8)
	end

	return 
end

slot0.sync_queue_dialog = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, value, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.player
	slot6 = slot4
	slot4 = slot4.set_local_player_in_camp
	slot7 = value

	slot4(slot5, slot6)

	return 
end

slot0.sync_camp_presence = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local sender_peer = slot2(slot3)

	if not sender_peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.objectives
	slot5 = slot3
	slot3 = slot3.on_mission_start_callback

	slot3(slot4)

	return 
end

slot0.sync_objectives_manager_mission_start = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, card_key, locked, status, sender)
	slot5 = self._verify_sender
	slot7 = sender
	local sender_peer = slot5(slot6)

	if not sender_peer then
		return 
	end

	slot6 = managers
	slot6 = slot6.challenge_cards
	slot8 = slot6
	slot6 = slot6.sync_active_challenge_card
	slot9 = card_key
	slot10 = locked
	slot11 = status

	slot6(slot7, slot8, slot9, slot10)

	return 
end

slot0.sync_active_challenge_card = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, card_key, locked, status, sender)
	slot5 = self._verify_sender
	slot7 = sender
	local sender_peer = slot5(slot6)

	if not sender_peer then
		return 
	end

	slot6 = managers
	slot6 = slot6.challenge_cards
	slot8 = slot6
	slot6 = slot6.sync_active_challenge_card
	slot9 = card_key
	slot10 = locked
	slot11 = status

	slot6(slot7, slot8, slot9, slot10)

	return 
end

slot0.sync_active_challenge_card = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, flare, pos, rot, forward, v, sender)
	slot7 = self._verify_sender
	slot9 = sender
	local sender_peer = slot7(slot8)

	if not sender_peer then
		return 
	end

	slot8 = managers
	slot8 = slot8.barrage
	slot10 = slot8
	slot8 = slot8.sync_spotter_spawn_flare
	slot11 = flare
	slot12 = pos
	slot13 = rot
	slot14 = forward
	slot15 = v

	slot8(slot9, slot10, slot11, slot12, slot13, slot14)

	return 
end

slot0.sync_spotter_spawn_flare = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, unit, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot6 = unit
	slot4 = unit.damage
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.run_sequence_simple
	slot7 = "state_interaction_disabled"

	slot4(slot5, slot6)

	return 
end

slot0.sync_spotter_flare_disabled = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, operation_id, string_delimited, sender)
	slot4 = self._verify_sender
	slot6 = sender
	local sender_peer = slot4(slot5)

	if not sender_peer then
		return 
	end

	slot5 = tweak_data
	slot5 = slot5.operations
	slot7 = slot5
	slot5 = slot5.set_operation_indexes_delimited
	slot8 = operation_id
	slot9 = string_delimited

	slot5(slot6, slot7, slot8)

	return 
end

slot0.sync_randomize_operation = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, indicator_id, state, sender)
	slot4 = self._verify_sender
	slot6 = sender
	local sender_peer = slot4(slot5)

	if not sender_peer then
		return 
	end

	slot5 = managers
	slot5 = slot5.hud
	slot7 = slot5
	slot5 = slot5.set_suspicion_indicator_state
	slot8 = indicator_id
	slot9 = state

	slot5(slot6, slot7, slot8)

	return 
end

slot0.set_hud_suspicion_state = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, health_percentage, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.player
	slot6 = slot4
	slot4 = slot4.player_unit
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = managers
		slot4 = slot4.player
		slot6 = slot4
		slot4 = slot4.player_unit
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.character_damage
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.bleed_out
		slot4 = slot4(slot5)

		if not slot4 then
			slot4 = managers
			slot4 = slot4.player
			slot6 = slot4
			slot4 = slot4.player_unit
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.character_damage
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.restore_health
			slot7 = health_percentage / 100

			slot4(slot5, slot6)
		end
	end

	return 
end

slot0.restore_health_by_percentage = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local sender_peer = slot2(slot3)

	if not sender_peer then
		return 
	end

	slot5 = sender_peer
	slot3 = sender_peer.unit
	slot3 = slot3(slot4)

	if slot3 then
		slot5 = sender_peer
		slot3 = sender_peer.unit
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.unit_data
		slot3 = slot3(slot4)

		if slot3 then
			slot5 = sender_peer
			slot3 = sender_peer.unit
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.unit_data
			slot3 = slot3(slot4)
			local teammate_panel_id = slot3.teammate_panel_id
		end
	end

	slot6 = sender_peer
	slot4 = sender_peer.unit
	slot4 = slot4(slot5)

	if slot4 then
		slot6 = sender_peer
		slot4 = sender_peer.unit
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.unit_data
		slot4 = slot4(slot5)

		if slot4 then
			slot6 = sender_peer
			slot4 = sender_peer.unit
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.unit_data
			slot4 = slot4(slot5)
			local name_label_id = slot4.name_label_id
		end
	end

	slot5 = managers
	slot5 = slot5.hud
	slot7 = slot5
	slot5 = slot5.on_teammate_start_lockpicking
	slot8 = teammate_panel_id
	slot9 = name_label_id

	slot5(slot6, slot7, slot8)

	return 
end

slot0.enter_lockpicking_state = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local sender_peer = slot2(slot3)

	if not sender_peer then
		return 
	end

	slot5 = sender_peer
	slot3 = sender_peer.unit
	slot3 = slot3(slot4)

	if slot3 then
		slot5 = sender_peer
		slot3 = sender_peer.unit
		slot3 = slot3(slot4)
		slot5 = slot3
		slot3 = slot3.unit_data
		slot3 = slot3(slot4)

		if slot3 then
			slot5 = sender_peer
			slot3 = sender_peer.unit
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.unit_data
			slot3 = slot3(slot4)
			local teammate_panel_id = slot3.teammate_panel_id
		end
	end

	slot6 = sender_peer
	slot4 = sender_peer.unit
	slot4 = slot4(slot5)

	if slot4 then
		slot6 = sender_peer
		slot4 = sender_peer.unit
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.unit_data
		slot4 = slot4(slot5)

		if slot4 then
			slot6 = sender_peer
			slot4 = sender_peer.unit
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.unit_data
			slot4 = slot4(slot5)
			local name_label_id = slot4.name_label_id
		end
	end

	slot5 = managers
	slot5 = slot5.hud
	slot7 = slot5
	slot5 = slot5.on_teammate_stop_lockpicking
	slot8 = teammate_panel_id
	slot9 = name_label_id

	slot5(slot6, slot7, slot8)

	return 
end

slot0.exit_lockpicking_state = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, document_spawn_chance, sender)
	slot3 = self._verify_sender
	slot5 = sender
	local sender_peer = slot3(slot4)

	if not sender_peer then
		return 
	end

	slot4 = managers
	slot4 = slot4.consumable_missions
	slot6 = slot4
	slot4 = slot4.on_document_spawn_chance_received
	slot7 = document_spawn_chance
	slot10 = sender_peer
	slot8 = sender_peer.id

	slot4(slot5, slot6, slot8(slot9))

	return 
end

slot0.sync_document_spawn_chance = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, sender)
	slot2 = self._verify_sender
	slot4 = sender
	local sender_peer = slot2(slot3)

	if not sender_peer then
		return 
	end

	slot3 = managers
	slot3 = slot3.consumable_missions
	slot5 = slot3
	slot3 = slot3.reset_document_spawn_modifier

	slot3(slot4)

	return 
end

slot0.reset_document_spawn_chance_modifier = slot1
slot0 = ConnectionNetworkHandler

function slot1(self, upgrade_id, identifier, acquired, sender)

	-- Decompilation error in this vicinity:
	slot5 = self._verify_sender
	slot7 = sender
	slot5 = slot5(slot6)

	if not identifier then
		slot5 = "buff_"
		slot6 = tostring
		slot8 = upgrade_id
		slot6 = slot6(slot7)
		identifier = slot5 .. slot6
	end

	if acquired then
		slot5 = managers
		slot5 = slot5.upgrades
		slot7 = slot5
		slot5 = slot5.aquire
		slot8 = upgrade_id
		slot9 = nil
		slot10 = identifier

		slot5(slot6, slot7, slot8, slot9)
	else
		slot5 = managers
		slot5 = slot5.upgrades
		slot7 = slot5
		slot5 = slot5.unaquire
		slot8 = upgrade_id
		slot9 = identifier

		slot5(slot6, slot7, slot8)
	end

	return 
end

slot0.sync_warcry_team_buff = slot1

return 
