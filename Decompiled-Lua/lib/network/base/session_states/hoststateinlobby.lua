if not HostStateInLobby then
	slot2 = HostStateBase
	slot0 = class(slot1)
end

HostStateInLobby = slot0
function HostStateInLobby:on_join_request_received(data, peer_name, client_preferred_character, dlcs, xuid, peer_level, gameversion, join_attempt_identifier, auth_ticket, sender)
	slot13 = data.local_peer
	local my_user_id = data.local_peer.user_id(slot12) or ""
	slot16 = peer_name

	Application.debug(slot13, Application, "[HostStateInLobby][on_join_request_received peer_level] denying request for peer ")

	slot17 = my_user_id

	self._send_request_denied(slot13, self, sender, 3)

	return 
end
function HostStateInLobby:is_joinable(data)
	return false
end

return 
