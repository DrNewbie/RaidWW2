_G.NGBTOwO = _G.NGBTOwO or {}

if HostNetworkSession then
	Hooks:PostHook(HostNetworkSession, 'on_peer_entered_lobby', 'F_'..Idstring('NGBTOwO:HostNetworkSessionOnPeerEnteredLobby'):key(), function(self, peer)
		local peer_id = peer:id()
		DelayedCalls:Add('DelayedModNGBTOwOX_' .. tostring(peer_id), 1, function()
			NGBTOwO:Check(peer_id)
		end)
	end)
	Hooks:PostHook(HostNetworkSession, 'on_peer_sync_complete', 'F_'..Idstring('NGBTOwO:HostNetworkSessionOnPeerSyncComplete'):key(), function(self, peer, peer_id)
		DelayedCalls:Add('DelayedModNGBTOwOY_' .. tostring(peer_id), 1, function()
			NGBTOwO:Check(peer_id)
		end)
	end)
end

if ClientNetworkSession then
	Hooks:PostHook(ClientNetworkSession, 'on_entered_lobby', 'F_'..Idstring('NGBTOwO:ClientNetworkSessionOnEnteredLobby'):key(), function(self)
		NGBTOwO:Check_All()
	end)
	Hooks:PostHook(ClientNetworkSession, 'on_load_complete', 'F_'..Idstring('NGBTOwO:ClientNetworkSessionOnLoadComplete'):key(), function(self, simulation)
		NGBTOwO:Check_All()
	end)
end