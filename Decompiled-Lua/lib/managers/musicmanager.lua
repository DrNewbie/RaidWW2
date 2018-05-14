if not MusicManager then
	slot2 = CoreMusicManager
	slot0 = class(slot1)
end

MusicManager = slot0
MusicManager.MENU_MUSIC = "raid_music_menu_test"
MusicManager.CREDITS_MUSIC = "music_credits"
MusicManager.STOP_ALL_MUSIC = "stop_all_music"
function MusicManager:init()
	slot3 = self

	MusicManager.super.init(slot2)

	self._current_level_music = nil

	return 
end
function MusicManager:init_globals(...)
	slot3 = self

	MusicManager.super.init_globals(slot2, ...)

	return 
end
function MusicManager:raid_music_state_change(state_flag)
	slot6 = state_flag

	Application.debug(slot3, Application, "[MusicManager:raid_music_state_change()]")

	slot5 = "raid_states"
	slot9 = state_flag

	SoundDevice.set_state(slot3, SoundDevice, self.convert_music_state(slot7, self))

	return 
end
function MusicManager:convert_music_state(state_flag)
	local res = state_flag

	if state_flag == "start" then
		res = "stealth"
	end

	return res
end
function MusicManager:save_settings(data)
	local state = {}
	data.MusicManager = state

	return 
end
function MusicManager:load_settings(data)
	local state = data.MusicManager

	if state then
	end

	return 
end
function MusicManager:save_profile(data)
	local state = {}
	data.MusicManager = state

	return 
end
function MusicManager:load_profile(data)
	local state = data.MusicManager

	if state then
	end

	return 
end
function MusicManager:music_tracks()
	return tweak_data.music.soundbank_list
end
function MusicManager:get_random_event()
	local event_names = {}
	slot4 = tweak_data.music

	for name, data in pairs(slot3) do
		if name ~= "default" and data.include_in_shuffle then
			slot10 = name

			table.insert(slot8, event_names)
		end
	end

	slot6 = #event_names
	local tweak_id = event_names[math.floor(math.rand(slot5)) + 1]
	local event_name = tweak_data.music[tweak_id] and tweak_data.music[tweak_id].start
	slot8 = event_name

	Application.debug(slot5, Application, "[MusicManager:get_random_event()]")

	return event_name
end
function MusicManager:get_default_event()
	local tweak_id = Global.level_data and Global.level_data.level_id
	slot4 = managers.raid_job
	local job = managers.raid_job.current_job(slot3)

	if job then
		if job.job_type == OperationsTweakData.JOB_TYPE_RAID then
			tweak_id = job.music_id
		else
			slot5 = managers.raid_job
			tweak_id = managers.raid_job.current_operation_event(slot4).music_id
		end
	end

	local event_name = nil

	if tweak_id == "random" then
		slot6 = self
		event_name = self.get_random_event(slot5)
	else
		event_name = tweak_data.music[tweak_id] and tweak_data.music[tweak_id].start
	end

	slot8 = event_name

	Application.debug(slot5, Application, "[MusicManager:get_default_event()]")

	return event_name
end

return 
