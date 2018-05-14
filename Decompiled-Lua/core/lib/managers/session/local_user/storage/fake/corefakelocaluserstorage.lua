slot3 = "CoreFakeLocalUserStorage"

core.module(slot1, core)

slot3 = "CoreLocalUserStorage"

core.import(slot1, core)

if not Storage then
	slot2 = CoreLocalUserStorage.Storage
	slot0 = class(slot1)
end

Storage = slot0
function Storage:save()
	return 
end
function Storage:_start_load_task()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	self._load_started_time = TimerManager.game(slot2).time(slot2)

	return 
end
function Storage:_load_status()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local current_time = TimerManager.game(slot2).time(slot2)

	if self._load_started_time + 0.8 < current_time then
		slot4 = self

		self._create_profile_data(slot3)

		return SaveData.OK
	end

	return 
end
function Storage:_close_load_task()
	self._load_started_time = nil

	return 
end

return 
