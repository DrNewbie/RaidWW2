NetworkBaseExtension = NetworkBaseExtension or class()
function NetworkBaseExtension:init(unit)
	self._unit = unit

	return 
end
function NetworkBaseExtension:send(func, ...)
	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		local peer = managers.network.session(slot3).local_peer(slot3)
		slot5 = peer

		if not peer.loading(managers.network.session(slot3)) then
			slot5 = managers.network
			slot7 = self._unit

			managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), func, ...)
		else
			slot7 = self._unit

			Application.debug(slot4, Application, "[NetworkBaseExtension:send_to_unit] SKIPPED!")
		end
	end

	return 
end
function NetworkBaseExtension:send_to_host(func, ...)
	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		local peer = managers.network.session(slot3).local_peer(slot3)
		slot5 = peer

		if not peer.loading(managers.network.session(slot3)) then
			slot5 = managers.network
			slot7 = self._unit

			managers.network.session(slot4).send_to_host(slot4, managers.network.session(slot4), func, ...)
		else
			slot7 = self._unit

			Application.debug(slot4, Application, "[NetworkBaseExtension:send_to_unit] SKIPPED!")
		end
	end

	return 
end
function NetworkBaseExtension:send_to_unit(params)
	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		local peer = managers.network.session(slot3).local_peer(slot3)
		slot5 = peer

		if not peer.loading(managers.network.session(slot3)) then
			slot5 = managers.network
			slot6 = self._unit
			local peer = managers.network.session(slot4).peer_by_unit(slot4, managers.network.session(slot4))

			if peer then
				slot6 = managers.network
				slot7 = peer
				slot10 = params

				managers.network.session(slot5).send_to_peer(slot5, managers.network.session(slot5), unpack(slot9))
			end
		else
			slot7 = self._unit

			Application.debug(slot4, Application, "[NetworkBaseExtension:send_to_unit] SKIPPED!")
		end
	end

	return 
end
function NetworkBaseExtension:peer()
	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot4 = self._unit

		return managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2))
	end

	return 
end

return 
