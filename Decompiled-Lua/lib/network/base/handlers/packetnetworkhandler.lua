if not PacketNetworkHandler then
	slot2 = BaseNetworkHandler
	slot0 = class(slot1)
end

PacketNetworkHandler = slot0
function PacketNetworkHandler:_set_shared_data(packet_id, target_peer, sender_peer, cb_id, arb_cb_id)
	self._shared_data.packet_id = packet_id
	self._shared_data.target_peer = target_peer
	self._shared_data.sender_peer = sender_peer
	self._shared_data.cb_id = cb_id
	self._shared_data.arb_cb_id = arb_cb_id

	return 
end
function PacketNetworkHandler:forward_message_req_ack(packet_id, target_peer, sender_peer, cb_id)
	slot12 = nil

	self._set_shared_data(slot6, self, packet_id, target_peer, sender_peer, cb_id)

	return 
end
function PacketNetworkHandler:message_req_ack(packet_id, sender_peer, cb_id)
	slot11 = nil

	self._set_shared_data(slot5, self, packet_id, nil, sender_peer, cb_id)

	return 
end
function PacketNetworkHandler:forward_message_arb_req_ack(packet_id, target_peer, sender_peer, cb_id, arb_cb_id)
	slot13 = arb_cb_id

	self._set_shared_data(slot7, self, packet_id, target_peer, sender_peer, cb_id)

	return 
end
function PacketNetworkHandler:message_arb_req_ack(packet_id, sender_peer, cb_id, arb_cb_id)
	slot12 = arb_cb_id

	self._set_shared_data(slot6, self, packet_id, nil, sender_peer, cb_id)

	return 
end
function PacketNetworkHandler:message_arbitrate_answer(cb_id, answer, sender)
	slot8 = answer

	self._do_cb(slot5, self, cb_id)

	return 
end
function PacketNetworkHandler:message_ack(target_peer, cb_id, sender)
	slot7 = cb_id

	self._do_cb(slot5, self)

	return 
end

return 
