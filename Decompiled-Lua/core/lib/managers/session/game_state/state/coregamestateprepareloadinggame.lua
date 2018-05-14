slot3 = "CoreGameStatePrepareLoadingGame"

core.module(slot1, core)

slot3 = "CoreGameStateLoadingGame"

core.import(slot1, core)

PrepareLoadingGame = PrepareLoadingGame or class()
function PrepareLoadingGame:init()
	slot3 = self.game_state._game_requester

	self.game_state._game_requester.task_started(slot2)

	self.game_state._is_preparing_for_loading_game = true
	slot3 = self.game_state

	self.game_state._set_stable_for_loading(true)

	return 
end
function PrepareLoadingGame:destroy()
	slot3 = self.game_state._game_requester

	self.game_state._game_requester.task_completed(slot2)

	self.game_state._is_preparing_for_loading_game = false

	return 
end
function PrepareLoadingGame:transition()
	slot3 = self.game_state._session_manager

	if self.game_state._session_manager.all_systems_are_stable_for_loading(slot2) then
		return CoreGameStateLoadingGame.LoadingGame
	end

	return 
end

return 
