slot3 = "CoreGameStateInEditorPrepareStopSimulation"

core.module(slot1, core)

slot3 = "CoreGameStateInEditorStopSimulation"

core.import(slot1, core)

PrepareStopSimulation = PrepareStopSimulation or class()
function PrepareStopSimulation:init(level_handler)
	self._level_handler = level_handler

	return 
end
function PrepareStopSimulation:destroy()
	local local_user_manager = self.game_state._session_manager._local_user_manager
	slot4 = self.game_state
	slot5 = self._level_handler

	self.game_state.player_slots(slot3).leave_level_handler(slot3, self.game_state.player_slots(slot3))

	slot5 = self._level_handler

	local_user_manager.leave_level_handler(slot3, local_user_manager)

	slot4 = self._level_handler

	self._level_handler.destroy(slot3)

	return 
end
function PrepareStopSimulation:transition()
	slot3 = self.game_state._session_manager

	if self.game_state._session_manager.all_systems_are_stable_for_loading(slot2) then
		return CoreGameStateInEditorStopSimulation.StopSimulation
	end

	return 
end

return 
