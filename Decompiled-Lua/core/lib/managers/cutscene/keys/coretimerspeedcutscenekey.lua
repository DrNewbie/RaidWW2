slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreTimerSpeedCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreTimerSpeedCutsceneKey = slot0
CoreTimerSpeedCutsceneKey.ELEMENT_NAME = "timer_speed"
CoreTimerSpeedCutsceneKey.NAME = "Timer Speed"
slot5 = tonumber

CoreTimerSpeedCutsceneKey.register_serialized_attribute("Timer Speed", CoreTimerSpeedCutsceneKey, "speed", 1)

slot5 = tonumber

CoreTimerSpeedCutsceneKey.register_serialized_attribute("Timer Speed", CoreTimerSpeedCutsceneKey, "duration", 0)

function CoreTimerSpeedCutsceneKey:__tostring()
	slot4 = self.speed(slot5)
	slot7 = self

	return string.format(slot2, "Change timer speed to \"%g\" over \"%g\" seconds.", self.duration(self))
end
function CoreTimerSpeedCutsceneKey:unload(player)
	slot6 = 0

	self._set_timer_speed(slot3, self, 1)

	return 
end
function CoreTimerSpeedCutsceneKey:play(player, undo, fast_forward)
	if undo then
		slot6 = self
		local preceeding_key = self.preceeding_key(slot5)

		if preceeding_key then
			slot8 = preceeding_key.speed(slot9)
			slot11 = preceeding_key

			self._set_timer_speed(slot6, self, preceeding_key.duration(preceeding_key))
		else
			slot9 = 0

			self._set_timer_speed(slot6, self, 1)
		end
	else
		slot7 = self.speed(slot8)
		slot10 = self

		self._set_timer_speed(slot5, self, self.duration(self))
	end

	return 
end
function CoreTimerSpeedCutsceneKey:_set_timer_speed(speed, duration)
	slot6 = 0
	speed = math.max(slot4, speed)
	slot6 = 0
	duration = math.max(slot4, duration)

	if 0 < speed and speed < 0.035 then
		speed = 0.035
	end

	if 0 < duration and duration < 0.035 then
		duration = 0
	end

	slot8 = TimerManager
	slot8 = duration
	slot11 = TimerManager

	TimerManager.ramp_multiplier(slot4, TimerManager, TimerManager.game(slot7), speed, TimerManager.pausable(slot10))

	slot8 = TimerManager
	slot8 = duration
	slot11 = TimerManager

	TimerManager.ramp_multiplier(slot4, TimerManager, TimerManager.game_animation(speed), speed, TimerManager.pausable(slot10))

	return 
end
function CoreTimerSpeedCutsceneKey:is_valid_speed(speed)
	return speed ~= nil and 0.035 <= speed
end
function CoreTimerSpeedCutsceneKey:is_valid_duration(duration)
	return duration ~= nil and 0 <= duration
end

return 
