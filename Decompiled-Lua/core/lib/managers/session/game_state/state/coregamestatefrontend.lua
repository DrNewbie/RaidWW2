slot3 = "CoreGameStateFrontEnd"

core.module(slot1, core)

slot3 = "CoreGameStatePrepareLoadingGame"

core.import(slot1, core)

FrontEnd = FrontEnd or class()
function FrontEnd:init()
	self.game_state._is_in_front_end = true

	return 
end
function FrontEnd:destroy()
	self.game_state._is_in_front_end = false

	return 
end
function FrontEnd:transition()
	slot3 = self.game_state._game_requester

	if not self.game_state._game_requester.is_requested(slot2) then
		return 
	end

	slot3 = self.game_state._session_manager

	if self.game_state._session_manager._main_systems_are_stable_for_loading(slot2) then
		return CoreGameStatePrepareLoadingGame.PrepareLoadingGame
	end

	return 
end

return 
