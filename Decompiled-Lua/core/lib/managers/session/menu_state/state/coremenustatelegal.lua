slot3 = "CoreMenuStateLegal"

core.module(slot1, core)

slot3 = "CoreMenuStateIntroScreens"

core.import(slot1, core)

Legal = Legal or class()
function Legal:init()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	self._start_time = TimerManager.game(slot2).time(slot2)

	return 
end
function Legal:transition()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local current_time = TimerManager.game(slot2).time(slot2)
	local time_until_intro_screens = 1

	if self._start_time + time_until_intro_screens <= current_time then
		return CoreMenuStateIntroScreens.IntroScreens
	end

	return 
end

return 
