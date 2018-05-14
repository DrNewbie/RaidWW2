slot3 = "CoreGameStateLoadingFrontEnd"

core.module(slot1, core)

slot3 = "CoreGameStatePreFrontEnd"

core.import(slot1, core)

LoadingFrontEnd = LoadingFrontEnd or class()
function LoadingFrontEnd:init()
	slot3 = self.game_state._session_manager
	self._debug_time = self.game_state._session_manager._debug_time(slot2)
	slot6 = "all"

	for _, unit in ipairs(World.find_units_quick(slot4, World)) do
		slot9 = 0

		unit.set_slot(slot7, unit)
	end

	return 
end
function LoadingFrontEnd:destroy()
	return 
end
function LoadingFrontEnd:transition()
	slot3 = self.game_state._session_manager
	local current_time = self.game_state._session_manager._debug_time(slot2)

	if self._debug_time + 2 < current_time then
		return CoreGameStatePreFrontEnd.PreFrontEnd
	end

	return 
end

return 
