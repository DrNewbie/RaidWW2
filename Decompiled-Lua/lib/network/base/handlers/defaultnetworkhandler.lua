DefaultNetworkHandler = DefaultNetworkHandler or class()
DefaultNetworkHandler.init = function (self)
	return 
end
DefaultNetworkHandler.lost_peer = function (peer_ip)
	slot4 = "Lost Peer (DefaultNetworkHandler)"

	cat_print(slot2, "multiplayer_base")

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
		slot7 = 0
		local peer = managers.network.session(slot2).peer_by_ip(slot2, peer_ip.ip_at_index(slot5, peer_ip))

		if peer then
			slot4 = managers.network
			slot5 = peer
			slot8 = peer

			managers.network.session(slot3).on_peer_lost(slot3, managers.network.session(slot3), peer.id(slot7))
		end
	end

	return 
end
DefaultNetworkHandler.lost_client = function (peer_ip)
	slot5 = peer_ip

	Application.error(slot2, Application, "[DefaultNetworkHandler] Lost client")

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
		slot7 = 0
		local peer = managers.network.session(slot2).peer_by_ip(slot2, peer_ip.ip_at_index(slot5, peer_ip))

		if peer then
			slot4 = managers.network
			slot5 = peer
			slot8 = peer

			managers.network.session(slot3).on_peer_lost(slot3, managers.network.session(slot3), peer.id(slot7))
		end
	end

	return 
end
DefaultNetworkHandler.lost_server = function (peer_ip)
	slot5 = peer_ip

	Application.error(slot2, Application, "[DefaultNetworkHandler] Lost server")

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
		slot7 = 0
		local peer = managers.network.session(slot2).peer_by_ip(slot2, peer_ip.ip_at_index(slot5, peer_ip))

		if peer then
			slot4 = managers.network
			slot5 = peer
			slot8 = peer

			managers.network.session(slot3).on_peer_lost(slot3, managers.network.session(slot3), peer.id(slot7))
		end
	end

	return 
end

return 
