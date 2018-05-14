slot3 = "CoreMenuStateLoadingGame"

core.module(slot1, core)

slot3 = "CoreMenuStateInGame"

core.import(slot1, core)

slot3 = "CoreMenuStateStopLoadingGame"

core.import(slot1, core)

LoadingGame = LoadingGame or class()
function LoadingGame:init()
	self.menu_state._set_stable_for_loading(slot2)

	local menu_handler = self.menu_state._menu_handler
	slot4 = menu_handler

	menu_handler.start_loading_game_environment(self.menu_state)

	return 
end
function LoadingGame:destroy()
	slot3 = self.menu_state

	self.menu_state._not_stable_for_loading(slot2)

	return 
end
function LoadingGame:transition()
	local game_state = self.menu_state._game_state
	slot4 = game_state

	if game_state.is_in_game(slot3) then
		return CoreMenuStateStopLoadingGame.StopLoadingGame
	end

	return 
end

return 
