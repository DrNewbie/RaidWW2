-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HostStateBase = HostStateBase or class()
function HostStateBase:enter(data, enter_params)
	return 
end
function HostStateBase:exit(data, name, enter_params)
	return 
end
function HostStateBase:on_join_request_received(data, peer_name, client_preferred_character, dlcs, xuid, peer_level, gameversion, join_attempt_identifier, auth_ticket, sender)
	slot22 = join_attempt_identifier
	slot26 = 0

	Application.trace(slot12, Application, "[HostStateBase:on_join_request_received]", data, peer_name, client_preferred_character, dlcs, xuid, peer_level, gameversion, sender.ip_at_index(slot24, sender))

	slot13 = data.local_peer
	local my_user_id = data.local_peer.user_id(slot12) or ""
	slot14 = managers.network.matchmake

	if not managers.network.matchmake.is_server_joinable(slot13) then
		slot17 = my_user_id

		self._send_request_denied(slot13, self, sender, 3)

		return 
	end

	slot17 = my_user_id

	self._send_request_denied(slot13, self, sender, 3)

	return 
end
function HostStateBase:_send_request_denied(sender, reason, my_user_id)

	-- Decompilation error in this vicinity:
	slot8 = reason

	Application.trace(slot5, Application, "[HostStateBase:_send_request_denied]", debug.traceback())

	slot7 = "X360"
	slot22 = 0

	sender.join_request_reply(slot6, sender, reason, 0, "", 1, 1, 0, "", my_user_id, "", 0, 0, 0, 0, xuid)

	return 
end
function HostStateBase:_has_peer_left_PSN(peer_name)
	slot5 = "PS3"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		slot5 = peer_name

		if managers.network.matchmake.check_peer_join_request_remove(slot3, managers.network.matchmake) then
			slot5 = peer_name

			print(slot3, "this CLIENT has left us from PSN, ignore his request")

			return 
		end
	end

	return 
end
function HostStateBase:_is_in_server_state()
	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = Network
		slot1 = Network.is_server(slot2)
	end

	return slot1
end
function HostStateBase:_introduce_new_peer_to_old_peers(data, new_peer, loading, peer_name, character, mask_set, xuid, xnaddr)

	-- Decompilation error in this vicinity:
	slot12 = "WIN32"

	return 
end
function HostStateBase:_introduce_old_peers_to_new_peer(data, new_peer)
	local new_peer_id = new_peer.id(slot4)
	slot6 = data.peers

	for old_pid, old_peer in pairs(new_peer) do
		if old_pid ~= new_peer_id then
			slot11 = new_peer

			if new_peer.handshakes(slot10)[old_pid] == nil then
				print(slot10, "[HostStateBase:_introduce_old_peers_to_new_peer] introducing", old_pid, "to")

				slot12 = "peer_handshake"
				slot15 = old_peer

				new_peer.send(slot10, new_peer, old_peer.connection_info(new_peer_id))

				slot13 = "asked"

				new_peer.set_handshake_status(slot10, new_peer, old_pid)
			else
				slot14 = new_peer_id

				print(slot10, "[HostStateBase:_introduce_new_peer_to_old_peers] peer already had handshake", old_pid, "to")
			end
		end
	end

	return 
end
function HostStateBase:_chk_mutual_connection_established(data, peer, introduced_peer_id)
	local introduced_peer = data.peers[introduced_peer_id]
	slot8 = peer

	if introduced_peer.handshakes(slot6)[peer.id(introduced_peer)] == true then
		slot11 = peer

		cat_print(slot6, "multiplayer_base", "[HostStateBase:_chk_mutual_connection_established] mutual connection", peer.id(slot10))

		slot8 = "mutual_connection"
		slot11 = peer

		introduced_peer.send(slot6, introduced_peer, peer.id(introduced_peer_id))

		slot9 = introduced_peer_id

		peer.send(slot6, peer, "mutual_connection")

		return true
	end

	return false
end
function HostStateBase:on_handshake_confirmation(data, peer, introduced_peer_id)
	slot11 = peer
	slot10 = introduced_peer_id

	cat_print(slot5, "multiplayer_base", "[HostStateBase:on_handshake_confirmation]", inspect(slot9), peer.id(peer))

	local has_mutual_connection = nil

	if introduced_peer_id ~= 1 then
		slot10 = introduced_peer_id
		has_mutual_connection = self._chk_mutual_connection_established(slot6, self, data, peer)
	end

	if has_mutual_connection then
		slot8 = peer

		data.session.chk_initiate_dropin_pause(slot6, data.session)

		slot8 = data.peers[introduced_peer_id]

		data.session.chk_initiate_dropin_pause(slot6, data.session)

		if data.game_started then
			slot7 = data.peers

			for other_peer_id, other_peer in pairs(slot6) do
				slot14 = other_peer_id

				data.session.chk_spawn_member_unit(slot11, data.session, other_peer)
			end
		end
	end

	slot7 = data.session

	data.session.check_start_game_intro(slot6)

	return 
end
function HostStateBase:_is_kicked(data, peer_name, peer_rpc)

	-- Decompilation error in this vicinity:
	slot7 = "WIN32"

	return 
end
function HostStateBase:_chk_peer_owns_current_dlc(data, peer_dlcs)
	local requires_dlc = tweak_data.levels[Global.game_settings.level_id].dlc

	if requires_dlc then
		slot7 = " "
		local i_dlcs = string.split(slot5, peer_dlcs)
		slot7 = i_dlcs

		for _, dlc in ipairs(peer_dlcs) do
			if requires_dlc == dlc then
				return true
			end
		end
	end

	return false
end
function HostStateBase:on_peer_finished_loading(data, peer)
	slot5 = "[HostStateBase:on_peer_finished_loading]"
	slot8 = peer

	print(slot4, inspect(slot7))

	slot7 = peer

	if not next(peer.handshakes(inspect)) then
		slot12 = peer
		slot12 = peer.xuid(slot13)
		slot15 = peer

		self._introduce_new_peer_to_old_peers(slot4, self, data, peer, false, peer.name(slot10), peer.character(peer), "remove", peer.xnaddr(peer))

		slot7 = peer

		self._introduce_old_peers_to_new_peer(slot4, self, data)
	end

	return 
end
function HostStateBase:on_load_level(data)
	data.wants_to_load_level = true

	return 
end
function HostStateBase:is_joinable(data)
	return false
end

return 
