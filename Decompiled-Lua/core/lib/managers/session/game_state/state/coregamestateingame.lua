slot3 = "CoreGameStateInGame"

core.module(slot1, core)

slot3 = "CoreGameStatePrepareLoadingFrontEnd"

core.import(slot1, core)

InGame = InGame or class()
function InGame:init(level_handler)
	self._level_handler = level_handler
	self.game_state._is_in_game = true
	slot7 = "game_state_ingame"

	EventManager.trigger_event(true, EventManager, Idstring(nil))

	return 
end
function InGame:destroy()
	self.game_state._is_in_game = nil

	return 
end
function InGame:transition()
	slot3 = self.game_state._front_end_requester

	if not self.game_state._front_end_requester.is_requested(slot2) then
		return 
	end

	slot3 = self.game_state._session_manager

	if self.game_state._session_manager._main_systems_are_stable_for_loading(slot2) then
		return CoreGameStatePrepareLoadingFrontEnd.PrepareLoadingFrontEnd, self._level_handler
	end

	return 
end
function InGame:end_update(t, dt)
	slot7 = dt

	self._level_handler.end_update(slot4, self._level_handler, t)

	return 
end

return 
