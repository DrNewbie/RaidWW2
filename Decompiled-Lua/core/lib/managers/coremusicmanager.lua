CoreMusicManager = CoreMusicManager or class()
function CoreMusicManager:init()
	if not Global.music_manager then
		Global.music_manager = {}
		slot5 = "music"
		Global.music_manager.source = SoundDevice.create_source(slot3, SoundDevice)
		Global.music_manager.volume = 0
		slot3 = self

		self.init_globals(0)
	end

	self._path_list = {}
	self._event_list = {}
	self._path_map = {}
	self._event_map = {}
	local temp_list = {}
	slot4 = Application

	if Application.editor(slot3) then
		local music_tracks = self.music_tracks(slot3)
		slot5 = music_tracks

		for _, track in pairs(self) do
			slot11 = Idstring(slot12)
			slot14 = track

			if PackageManager.has(slot9, PackageManager, Idstring("bnk")) then
				slot11 = track
				local events = SoundDevice.events(slot9, SoundDevice)
			end

			if events then
				slot11 = events

				for k, v in pairs(slot10) do
					if not temp_list[v.path] then
						temp_list[v.path] = 1
						slot17 = v.path

						table.insert(1, self._path_list)
					end

					self._path_map[k] = v.path

					if not self._event_map[v.path] then
						self._event_map[v.path] = {}
					end

					slot17 = k

					table.insert(slot15, self._event_map[v.path])

					slot17 = k

					table.insert(slot15, self._event_list)
				end
			end
		end

		slot5 = self._path_list

		table.sort(slot4)

		slot5 = self._event_list

		table.sort(slot4)

		slot5 = self._event_map

		for k, v in pairs(slot4) do
			slot10 = v

			table.sort(slot9)
		end
	end

	self._has_music_control = true
	self._external_media_playing = false

	return 
end
function CoreMusicManager:init_finalize()
	slot4 = "X360"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = XboxLive
		self._has_music_control = XboxLive.app_has_playback_control(slot2)
		slot4 = self._has_music_control

		print(slot2, "[CoreMusicManager:init_finalize]")

		slot4 = "media_player_control"
		slot9 = "clbk_game_has_music_control"

		managers.platform.add_event_callback(slot2, managers.platform, callback(slot6, self, self))

		slot4 = Global.music_manager.volume

		self.set_volume(slot2, self)
	end

	return 
end
function CoreMusicManager:init_globals()
	return 
end
function CoreMusicManager:music_tracks()
	return {}
end
function CoreMusicManager:post_event(name)
	if not name then
		return 
	end

	if Global.music_manager.current_event ~= name then
		if not self._skip_play then
			slot6 = name

			Application.debug(slot3, Application, "[CoreMusicManager:post_event]")
			self.stop(slot3)

			slot6 = name
			Global.music_manager.current_wwise_event = Global.music_manager.source.post_event(self, Global.music_manager.source)
		end

		Global.music_manager.current_event = name
	end

	return 
end
function CoreMusicManager:stop()
	slot3 = Global.music_manager.source

	Global.music_manager.source.stop(slot2)

	Global.music_manager.current_event = nil

	return 
end
function CoreMusicManager:music_paths()
	return self._path_list
end
function CoreMusicManager:music_events(path)
	return self._event_map[path]
end
function CoreMusicManager:music_events_list()
	return self._event_list
end
function CoreMusicManager:music_path(event)
	return self._path_map[event]
end
function CoreMusicManager:set_volume(volume)
	Global.music_manager.volume = volume

	if self._has_music_control then
		slot6 = volume * 100

		SoundDevice.set_rtpc(slot3, SoundDevice, "option_music_volume")
	else
		slot6 = 0

		SoundDevice.set_rtpc(slot3, SoundDevice, "option_music_volume")
	end

	return 
end
function CoreMusicManager:clbk_game_has_music_control(status)
	slot5 = status

	print(slot3, "[CoreMusicManager:clbk_game_has_music_control]")

	if status then
		slot6 = Global.music_manager.volume * 100

		SoundDevice.set_rtpc(slot3, SoundDevice, "option_music_volume")
	else
		slot6 = 0

		SoundDevice.set_rtpc(slot3, SoundDevice, "option_music_volume")
	end

	self._has_music_control = status

	return 
end
function CoreMusicManager:has_music_control()
	return self._has_music_control
end
function CoreMusicManager:save(data)
	local state = {}
	slot5 = game_state_machine

	if game_state_machine.current_state_name(slot4) ~= "ingame_waiting_for_players" then
		state.event = Global.music_manager.current_event
	end

	state.track = Global.music_manager.current_track
	data.CoreMusicManager = state

	return 
end
function CoreMusicManager:load(data)
	local state = data.CoreMusicManager

	if state.event then
		slot6 = state.event

		self.post_event(slot4, self)
	end

	Global.music_manager.synced_track = state.track

	return 
end

return 
