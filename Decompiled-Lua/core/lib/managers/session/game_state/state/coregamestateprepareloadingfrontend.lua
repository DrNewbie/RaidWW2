slot3 = "CoreGameStatePrepareLoadingFrontEnd"

core.module(slot1, core)

slot3 = "CoreGameStateLoadingFrontEnd"

core.import(slot1, core)

PrepareLoadingFrontEnd = PrepareLoadingFrontEnd or class()
function PrepareLoadingFrontEnd:init(level_handler)
	self.game_state._is_preparing_for_loading_front_end = true
	slot4 = self.game_state._front_end_requester

	self.game_state._front_end_requester.task_started(true)

	slot4 = self.game_state

	self.game_state._set_stable_for_loading(true)

	self._level_handler = level_handler

	return 
end
function PrepareLoadingFrontEnd:destroy()
	self.game_state._front_end_requester.task_completed(slot2)

	self.game_state._is_preparing_for_loading_front_end = false
	local local_user_manager = self.game_state._session_manager._local_user_manager
	slot4 = self.game_state
	slot5 = self._level_handler

	self.game_state.player_slots(self.game_state._front_end_requester).leave_level_handler(self.game_state._front_end_requester, self.game_state.player_slots(self.game_state._front_end_requester))

	slot5 = self._level_handler

	local_user_manager.leave_level_handler(self.game_state._front_end_requester, local_user_manager)

	slot4 = self._level_handler

	self._level_handler.destroy(self.game_state._front_end_requester)

	return 
end
function PrepareLoadingFrontEnd:transition()
	slot3 = self.game_state._session_manager

	if self.game_state._session_manager.all_systems_are_stable_for_loading(slot2) then
		return CoreGameStateLoadingFrontEnd.LoadingFrontEnd
	end

	return 
end

return 
