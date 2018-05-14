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
if not HostStateInGame then
	slot2 = HostStateBase
	slot0 = class(slot1)
end

HostStateInGame = slot0
function HostStateInGame:enter(data, enter_params)
	slot6 = data
	slot9 = enter_params

	print(slot4, "[HostStateInGame:enter]", inspect(slot8))

	return 
end
function HostStateInGame:on_join_request_received(data, peer_name, client_preferred_character, dlcs, xuid, peer_level, gameversion, join_attempt_identifier, auth_ticket, sender)

	-- Decompilation error in this vicinity:
	slot21 = join_attempt_identifier
	slot25 = 0

	print(slot12, "[HostStateInGame:on_join_request_received]", data, peer_name, client_preferred_character, dlcs, xuid, peer_level, gameversion, sender.ip_at_index(slot23, sender))

	slot13 = data.local_peer
	local my_user_id = data.local_peer.user_id(slot12) or ""
	slot15 = "WIN32"

	if SystemInfo.platform(slot13) == Idstring(SystemInfo) then
		slot14 = managers.network.account
		slot18 = 0
		peer_name = managers.network.account.username_by_id(slot13, sender.ip_at_index(slot16, sender))
	end

	slot15 = peer_name

	if self._has_peer_left_PSN(slot13, self) then
		slot15 = peer_name

		print(slot13, "this CLIENT has left us from PSN, ignore his request")

		return 
	else
		slot14 = self

		if not self._is_in_server_state(slot13) then
			slot15 = "[HostStateInGame:on_join_request_received] denied, reason: not self:_is_in_server_state()"

			Application.debug(slot13, Application)

			slot17 = my_user_id

			self._send_request_denied(slot13, self, sender, 3)

			return 
		elseif NetworkManager.DROPIN_ENABLED and not Global.game_settings.drop_in_allowed then
			slot14 = managers.player
		elseif managers.groupai then
			slot14 = managers.groupai
			slot14 = managers.groupai.state(slot13)
		else
			slot17 = sender

			if self._is_kicked(slot13, self, data, peer_name) then
				slot16 = peer_name

				Application.debug(slot13, Application, "[HostStateInGame:on_join_request_received] denied, reason: YOU ARE IN MY KICKED LIST")

				slot17 = my_user_id

				self._send_request_denied(slot13, self, sender, 2)

				return 
			elseif peer_level < Global.game_settings.reputation_permission then
				slot16 = peer_level

				Application.debug(slot13, Application, "[HostStateInGame:on_join_request_received] denied, reason: peer_level < Global.game_settings.reputation_permission")

				slot17 = my_user_id

				self._send_request_denied(slot13, self, sender, 6)

				return 
			elseif gameversion ~= -1 and gameversion ~= managers.network.matchmake.GAMEVERSION then
				slot15 = "[HostStateInGame:on_join_request_received] denied, reason: gameversion ~= -1 and gameversion ~= managers.network.matchmake.GAMEVERSION"

				Application.debug(slot13, Application)

				slot17 = my_user_id

				self._send_request_denied(slot13, self, sender, 7)

				return 
			elseif data.wants_to_load_level then
				slot15 = "[HostStateInGame:on_join_request_received] denied, reason: data.wants_to_load_level"
				slot18 = data

				Application.debug(slot13, Application, inspect(slot17))

				slot17 = my_user_id

				self._send_request_denied(slot13, self, sender, 0)

				return 
			else
				slot14 = managers.network
				slot14 = managers.network.session(slot13)

				if not managers.network.session(slot13).are_peers_done_streaming(slot13) or managers.worldcollection.level_transition_in_progress then
					slot15 = "[HostStateInGame:on_join_request_received] all peers still not done streaming"

					Application.debug(slot13, Application)

					slot17 = my_user_id

					self._send_request_denied(slot13, self, sender, 0)

					return 
				else
					slot14 = managers.vote
				end
			end
		end
	end

	slot15 = sender
	local old_peer = data.session.chk_peer_already_in(slot13, data.session)

	if old_peer then
		slot16 = "[HostStateInGame:on_join_request_received] denied, reason: join_attempt_identifier ~= old_peer:join_attempt_identifier()"

		Application.trace(slot14, Application)

		slot19 = old_peer
		slot18 = "lost"

		data.session.remove_peer(slot14, data.session, old_peer, old_peer.id(slot18))

		slot18 = my_user_id

		self._send_request_denied(slot14, self, sender, 3)

		return 
	end

	slot15 = data.peers

	if 3 <= table.size(slot14) then
		slot16 = "[HostStateInGame:on_join_request_received] table.size( data.peers )"

		Application.trace(slot14, Application)

		slot18 = my_user_id

		self._send_request_denied(slot14, self, sender, 5)

		return 
	end

	slot15 = managers.network
	local character = managers.network.session(slot14).check_peer_preferred_character(slot14, managers.network.session(slot14))
	local xnaddr = ""
	slot18 = "X360"
	local new_peer_id, new_peer = nil
	slot30 = 0
	slot29 = xnaddr
	new_peer_id, new_peer = data.session.add_peer(slot18, data.session, peer_name, nil, false, false, false, nil, character, sender.ip_at_index(slot28, sender), xuid)

	if not new_peer_id then
		slot20 = "[HostStateInGame:on_join_request_received] there was no clean peer_id"

		Application.trace(slot18, Application)

		slot22 = my_user_id

		self._send_request_denied(slot18, self, sender, 3)

		return 
	end

	slot20 = dlcs

	new_peer.set_dlcs(slot18, new_peer)

	slot20 = xuid

	new_peer.set_xuid(slot18, new_peer)

	slot20 = join_attempt_identifier

	new_peer.set_join_attempt_identifier(slot18, new_peer)

	local new_peer_rpc = nil
	slot20 = managers.network

	if managers.network.protocol_type(new_peer) == "TCP_IP" then
		slot20 = managers.network
		slot22 = sender
		new_peer_rpc = managers.network.session(slot19).resolve_new_peer_rpc(slot19, managers.network.session(slot19), new_peer)
	else
		new_peer_rpc = sender
	end

	slot21 = new_peer_rpc

	new_peer.set_rpc(slot19, new_peer)

	slot21 = true

	new_peer.set_ip_verified(slot19, new_peer)

	slot21 = new_peer_rpc

	Network.add_co_client(slot19, Network)

	slot21 = auth_ticket

	if not new_peer.begin_ticket_session(slot19, new_peer) then
		slot21 = "[HostStateInGame:on_join_request_received] auth_fail"

		Application.trace(slot19, Application)

		slot24 = new_peer
		slot23 = "auth_fail"

		data.session.remove_peer(slot19, data.session, new_peer, new_peer.id(slot23))

		slot23 = my_user_id

		self._send_request_denied(slot19, self, sender, 8)

		return 
	end

	local ticket = new_peer.create_ticket(slot19)
	slot22 = Global.game_settings.level_id
	local level_index = tweak_data.levels.get_index_from_level_id(new_peer, tweak_data.levels)
	slot23 = Global.game_settings.difficulty
	local difficulty_index = tweak_data.difficulty_to_index(tweak_data.levels, tweak_data)
	local job_id_index = 0
	local job_stage = 0
	local alternative_job_stage = 0
	local interupt_job_stage_level_index = 0
	slot27 = managers.raid_job

	if managers.raid_job.has_active_job(slot26) then
		slot27 = managers.raid_job

		if managers.raid_job.current_job(slot26).job_type == OperationsTweakData.JOB_TYPE_RAID then
			slot27 = tweak_data.operations
			slot30 = managers.raid_job
			job_id_index = tweak_data.operations.get_index_from_raid_id(slot26, managers.raid_job.current_job_id(slot29))
		else
			slot27 = tweak_data.operations
			slot30 = managers.raid_job
			job_id_index = tweak_data.operations.get_index_from_operation_id(slot26, managers.raid_job.current_job_id(slot29))
			slot27 = managers.raid_job
			job_stage = managers.raid_job.current_job(slot26).current_event
		end
	end

	slot28 = "X360"
	slot29 = new_peer

	managers.vote.sync_server_kick_option(slot27, managers.vote)

	slot28 = data.session

	data.session.send_ok_to_load_level(slot27)

	slot31 = 1

	self.on_handshake_confirmation(slot27, self, data, new_peer)

	return 
end
function HostStateInGame:on_peer_finished_loading(data, peer)
	slot12 = peer
	slot12 = peer.xuid(slot13)
	slot15 = peer

	self._introduce_new_peer_to_old_peers(slot4, self, data, peer, false, peer.name(slot10), peer.character(peer), "remove", peer.xnaddr(peer))

	slot7 = peer

	self._introduce_old_peers_to_new_peer(slot4, self, data)

	if data.game_started then
		slot6 = "set_dropin"

		peer.send(slot4, peer)
	end

	return 
end
function HostStateInGame:is_joinable(data)
	return not data.wants_to_load_level
end

return 
