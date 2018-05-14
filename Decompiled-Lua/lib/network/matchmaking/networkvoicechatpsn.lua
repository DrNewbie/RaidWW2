NetworkVoiceChatPSN = NetworkVoiceChatPSN or class()
function NetworkVoiceChatPSN:init()
	self._started = false
	self._room_id = nil
	self._team = 1
	self._restart_session = nil
	self._peers = {}
	slot3 = self

	self._load_globals(slot2)

	self._muted_players = {}

	return 
end
function NetworkVoiceChatPSN:check_status_information()
	return 
end
function NetworkVoiceChatPSN:open()
	return 
end
function NetworkVoiceChatPSN:voice_type()
	return "voice_psn"
end
function NetworkVoiceChatPSN:pause()
	return 
end
function NetworkVoiceChatPSN:resume()
	return 
end
function NetworkVoiceChatPSN:set_volume(volume)
	slot5 = volume

	PSNVoice.set_volume(slot3, PSNVoice)

	return 
end
function NetworkVoiceChatPSN:init_voice()
	if self._started == false and not self._starting then
		self._starting = true

		function slot4(...)
			slot2 = self

			self._callback(slot1, ...)

			return 
		end

		PSNVoice.assign_callback(slot2, PSNVoice)

		slot7 = 8000

		PSNVoice.init(slot2, PSNVoice, 4, 4, 50)

		slot3 = self
		slot7 = "voice_volume"

		self.set_volume(slot2, managers.user.get_setting(4, managers.user))

		self._started = true
	end

	return 
end
function NetworkVoiceChatPSN:destroy_voice(disconnected)
	if self._started == true then
		self._started = false

		if self._room_id and not disconnected then
			slot4 = self

			self.close_session(slot3)
		end

		slot4 = PSNVoice

		PSNVoice.destroy(slot3)

		self._closing = nil
		self._room_id = nil
		self._restart_session = nil
		self._team = 1
	end

	return 
end
function NetworkVoiceChatPSN:num_peers()
	slot3 = PSNVoice
	local l = PSNVoice.get_players_info(slot2)

	if l then
		local x = 0
		slot5 = l

		for k, v in pairs(slot4) do
			if v.joined == 1 then
				x = x + 1
			end
		end

		return #l <= x
	end

	return true
end
function NetworkVoiceChatPSN:open_session(roomid)
	if self._room_id and self._room_id == roomid then
		slot4 = "Voice: same_room"

		print(slot3)

		return 
	end

	if self._restart_session and self._restart_session == roomid then
		slot4 = "Voice: restart"

		print(slot3)

		return 
	end

	if self._closing or self._joining then
		slot4 = "Voice: closing|joining"

		print(slot3)

		self._restart_session = roomid

		return 
	end

	if self._started == false then
		self._restart_session = roomid
		slot4 = self

		self.init_voice(slot3)
	end

	if self._room_id then
		slot4 = "Voice: restart room"

		print(slot3)

		self._restart_session = roomid
		slot4 = self

		self.close_session(slot3)

		return 
	end

	self._room_id = roomid
	self._joining = true
	slot5 = roomid

	PSNVoice.start_session(slot3, PSNVoice)

	return 
end
function NetworkVoiceChatPSN:close_session()
	if self._joining then
		self._close = true

		return 
	end

	if self._room_id and not self._closing then
		self._closing = true
		slot3 = PSNVoice

		if not PSNVoice.stop_session(slot2) then
			self._closing = nil
			self._room_id = nil
			slot3 = TimerManager
			slot3 = TimerManager.wall(slot2)
			self._delay_frame = TimerManager.wall(slot2).time(slot2) + 1
		end
	elseif not self._closing then
		self._restart_session = nil
		self._delay_frame = nil
	end

	return 
end
function NetworkVoiceChatPSN:open_channel_to(player_info, context)
	slot5 = "NetworkVoiceChatPSN:open_channel_to"

	print(slot4)

	return 
end
function NetworkVoiceChatPSN:close_channel_to(player_info)
	slot4 = "NetworkVoiceChatPSN:close_channel_to"

	print(slot3)

	slot5 = player_info._name

	PSNVoice.stop_sending_to(slot3, PSNVoice)

	return 
end
function NetworkVoiceChatPSN:lost_peer(peer)
	return 
end
function NetworkVoiceChatPSN:close_all()
	if self._room_id then
		slot3 = self

		self.close_session(slot2)
	end

	self._room_id = nil
	self._closing = nil

	return 
end
function NetworkVoiceChatPSN:set_team(team)
	if self._room_id then
		slot8 = PSN

		PSN.change_team(slot3, PSN, self._room_id, PSN.get_local_userid(team))

		slot5 = team

		PSNVoice.set_team_target(slot3, PSNVoice)
	end

	self._team = team

	return 
end
function NetworkVoiceChatPSN:clear_team()
	if self._room_id then
		slot3 = PSN

		if PSN.get_local_userid(slot2) then
			slot7 = PSN

			PSN.change_team(slot2, PSN, self._room_id, PSN.get_local_userid(1))

			slot4 = 1

			PSNVoice.set_team_target(slot2, PSNVoice)

			self._team = 1
		end
	end

	return 
end
function NetworkVoiceChatPSN:set_drop_in(data)
	self._drop_in = data

	return 
end
function NetworkVoiceChatPSN:_load_globals()
	if Global.psn and Global.psn.voice then
		self._started = Global.psn.voice.started
	end

	slot3 = PSN

	if PSN.is_online(slot2) and Global.psn and Global.psn.voice then
		function slot4(...)
			return 
		end

		PSNVoice.assign_callback(slot2, PSNVoice)

		self._room_id = Global.psn.voice.room
		self._team = Global.psn.voice.team

		if Global.psn.voice.drop_in then
			slot4 = Global.psn.voice.drop_in.room_id

			self.open_session(slot2, self)
		end

		if Global.psn.voice.restart then
			self._restart_session = restart
			slot3 = TimerManager
			slot3 = TimerManager.wall(slot2)
			self._delay_frame = TimerManager.wall(slot2).time(slot2) + 2
		else
			function slot4(...)
				slot2 = self

				self._callback(slot1, ...)

				return 
			end

			PSNVoice.assign_callback(slot2, PSNVoice)

			if self._room_id then
				slot4 = self._team

				self.set_team(slot2, self)
			end
		end

		Global.psn.voice = nil
	end

	return 
end
function NetworkVoiceChatPSN:_save_globals(disable_voice)
	if disable_voice == nil then
		return 
	end

	if not Global.psn then
		Global.psn = {}
	end

	local function f(...)
		return 
	end

	slot6 = f

	PSNVoice.assign_callback(slot4, PSNVoice)

	Global.psn.voice = {
		started = self._started,
		drop_in = self._drop_in
	}
	slot5 = disable_voice

	if type(self._drop_in) == "boolean" then
		if disable_voice == true then
			Global.psn.voice.room = self._room_id
			Global.psn.voice.team = self._team
		else
			Global.psn.voice.team = 1
		end
	else
		slot5 = self

		self.close_all(slot4)

		Global.psn.voice.restart = disable_voice
		Global.psn.voice.team = 1
	end

	return 
end
function NetworkVoiceChatPSN:_callback(info)
	if info then
		slot4 = PSN

		if PSN.get_local_userid(slot3) then
			if info.load_succeeded ~= nil then
				self._starting = nil

				if info.load_succeeded then
					self._started = true
					slot4 = TimerManager
					slot4 = TimerManager.wall(slot3)
					self._delay_frame = TimerManager.wall(slot3).time(slot3) + 1
				end

				return 
			end

			if info.join_succeeded ~= nil then
				self._joining = nil

				if info.join_succeeded == false then
					self._room_id = nil
				else
					slot5 = self._team

					self.set_team(slot3, self)
				end

				if self._restart_session then
					slot4 = TimerManager
					slot4 = TimerManager.wall(slot3)
					self._delay_frame = TimerManager.wall(slot3).time(slot3) + 1
				end

				if self._close then
					self._close = nil
					slot4 = self

					self.close_session(slot3)
				end
			end

			if info.leave_succeeded ~= nil then
				self._closing = nil
				self._room_id = nil

				if self._restart_session then
					slot4 = TimerManager
					slot4 = TimerManager.wall(slot3)
					self._delay_frame = TimerManager.wall(slot3).time(slot3) + 1
				end
			end

			if info.unload_succeeded ~= nil then
				local function f(...)
					return 
				end

				slot6 = f

				PSNVoice.assign_callback(slot4, PSNVoice)
			end
		end
	end

	return 
end
function NetworkVoiceChatPSN:update()
	if self._delay_frame then
		slot3 = TimerManager
		slot3 = TimerManager.wall(slot2)

		if self._delay_frame < TimerManager.wall(slot2).time(slot2) then
			self._delay_frame = nil

			if self._restart_session then
				function slot4(...)
					slot2 = self

					self._callback(slot1, ...)

					return 
				end

				PSNVoice.assign_callback(slot2, PSNVoice)

				local r = self._restart_session
				self._restart_session = nil
				slot5 = r

				self.open_session(PSNVoice, self)
			end
		end
	end

	return 
end
function NetworkVoiceChatPSN:psn_session_destroyed(roomid)
	if self._room_id and self._room_id == roomid then
		self._room_id = nil
		self._closing = nil
	end

	return 
end
function NetworkVoiceChatPSN:_get_peer_user_id(peer)
	if not self._room_id then
		return 
	end

	slot5 = self._room_id
	local members = PSN.get_info_session(slot3, PSN).memberlist
	local name = peer.name(PSN)
	slot6 = members

	for i, member in ipairs(peer) do
		slot11 = member.user_id

		if tostring(slot10) == name then
			return member.user_id
		end
	end

	return 
end
function NetworkVoiceChatPSN:mute_player(mute, peer)
	slot6 = peer
	self._muted_players[peer.name(slot5)] = mute
	slot6 = mute
	slot9 = peer

	PSNVoice.mute_player(peer.name(slot5), PSNVoice, peer.name(slot8))

	return 
end
function NetworkVoiceChatPSN:is_muted(peer)
	slot5 = peer

	return self._muted_players[peer.name(slot4)] or false
end

return 
