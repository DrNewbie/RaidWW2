NetworkVoiceChatSTEAM = NetworkVoiceChatSTEAM or class()
function NetworkVoiceChatSTEAM:init()
	slot3 = Steam
	self.handler = Steam.voip_handler(slot2)
	self._enabled = false
	self._users_talking = {}

	return 
end
function NetworkVoiceChatSTEAM:set_volume(volume)
	slot5 = volume

	self.handler.set_out_volume(slot3, self.handler)

	return 
end
function NetworkVoiceChatSTEAM:open()
	slot4 = "push_to_talk"
	self._push_to_talk = managers.user.get_setting(slot2, managers.user)

	if not self._enabled then
		slot4 = "voice_chat"

		if managers.user.get_setting(slot2, managers.user) then
			slot3 = self.handler

			self.handler.open(slot2)

			self._enabled = true

			if not self._push_to_talk then
				slot3 = self.handler

				self.handler.start_recording(slot2)
			end
		end
	end

	return 
end
function NetworkVoiceChatSTEAM:destroy_voice(disconnected)
	if self._enabled then
		slot4 = self.handler

		self.handler.stop_recording(slot3)

		slot4 = self.handler

		self.handler.close(slot3)

		self._enabled = false
	end

	return 
end
function NetworkVoiceChatSTEAM:_load_globals()
	if Global.steam and Global.steam.voip then
		self.handler = Global.steam.voip.handler
		Global.steam.voip = nil
	end

	return 
end
function NetworkVoiceChatSTEAM:_save_globals()
	if not Global.steam then
		Global.steam = {}
	end

	Global.steam.voip = {
		handler = self.handler
	}

	return 
end
function NetworkVoiceChatSTEAM:enabled()
	slot4 = "voice_chat"

	return managers.user.get_setting(slot2, managers.user)
end
function NetworkVoiceChatSTEAM:update_settings()
	slot4 = "push_to_talk"
	self._push_to_talk = managers.user.get_setting(slot2, managers.user)
	slot4 = "voice_chat"
	self._enabled = managers.user.get_setting(slot2, managers.user)

	if self._enabled then
		slot3 = self.handler

		self.handler.start_recording(slot2)
	else
		slot3 = self.handler

		self.handler.stop_recording(slot2)
	end

	if self._enabled and self._push_to_talk then
		slot3 = self.handler

		self.handler.stop_recording(slot2)
	end

	return 
end
function NetworkVoiceChatSTEAM:set_recording(button_pushed_to_talk)
	slot4 = self

	self.update_settings(slot3)

	if not self._enabled then
		slot4 = self.handler

		self.handler.stop_recording(slot3)

		return 
	end

	if not self._push_to_talk then
		if self._enabled then
			slot4 = self.handler

			self.handler.start_recording(slot3)
		else
			slot4 = self.handler

			self.handler.stop_recording(slot3)
		end
	elseif button_pushed_to_talk then
		slot4 = self.handler

		self.handler.start_recording(slot3)
	else
		slot4 = self.handler

		self.handler.stop_recording(slot3)
	end

	return 
end
function NetworkVoiceChatSTEAM:update()
	slot3 = self.handler

	self.handler.update(slot2)

	local t = Application.time(slot2)
	local playing = self.handler.get_voice_receivers_playing(Application)
	slot5 = playing

	for id, pl in pairs(self.handler) do
		if not self._users_talking[id] then
			self._users_talking[id] = {
				time = 0
			}
		end

		if pl then
			self._users_talking[id].time = t
		end

		local active = t < self._users_talking[id].time + 0.15

		if active ~= self._users_talking[id].active then
			self._users_talking[id].active = active
			slot11 = managers.network

			if managers.network.session(slot10) then
				slot11 = managers.network
				slot12 = id
				local peer = managers.network.session(slot10).peer(slot10, managers.network.session(slot10))

				if peer then
					slot15 = active

					managers.menu.set_slot_voice(slot11, managers.menu, peer, id)

					if managers.hud then
						slot13 = id
						local crim_data = managers.criminals.character_data_by_peer_id(slot11, managers.criminals)

						if crim_data then
							slot11 = crim_data.mugshot_id
						end
					end
				end
			end
		end
	end

	return 
end
function NetworkVoiceChatSTEAM:on_member_added(peer, mute)
	slot5 = peer

	if peer.rpc(slot4) then
		slot9 = peer
		slot8 = mute

		self.handler.add_receiver(slot4, self.handler, peer.id(slot7), peer.rpc(peer))
	end

	return 
end
function NetworkVoiceChatSTEAM:on_member_removed(peer)
	slot4 = self.handler
	slot7 = peer

	self.handler.remove_receiver(slot3, peer.id(slot6))

	return 
end
function NetworkVoiceChatSTEAM:mute_player(peer, mute)
	slot8 = peer

	self.handler.mute_voice_receiver(slot4, self.handler, peer.id(mute))

	return 
end
function NetworkVoiceChatSTEAM:is_muted(peer)
	slot4 = self.handler
	slot7 = peer

	return self.handler.is_voice_receiver_muted(slot3, peer.id(slot6))
end

return 
