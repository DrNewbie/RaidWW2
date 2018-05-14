slot3 = "CoreMenuStateStart"

core.module(slot1, core)

slot3 = "CoreMenuStateAttract"

core.import(slot1, core)

Start = Start or class()
function Start:init()
	slot3 = TimerManager
	self._start_time = TimerManager.game(slot2).time(slot2)
	local player_slots = self.pre_front_end.menu_state._player_slots
	slot4 = player_slots
	self._primary_slot = player_slots.primary_slot(TimerManager.game(slot2))

	self._primary_slot.request_local_user_binding(TimerManager.game(slot2))

	local menu_handler = self.pre_front_end.menu_state._menu_handler
	slot5 = menu_handler

	menu_handler.start(self._primary_slot)

	return 
end
function Start:destroy()
	slot3 = self._primary_slot

	self._primary_slot.stop_local_user_binding(slot2)

	return 
end
function Start:transition()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local current_time = TimerManager.game(slot2).time(slot2)
	local time_until_attract = 15

	if self._start_time + time_until_attract <= current_time then
		return CoreMenuStateAttract.Attract
	end

	return 
end

return 
