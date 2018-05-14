slot3 = "CoreMenuStateFrontEnd"

core.module(slot1, core)

slot3 = "CoreMenuStatePrepareLoadingGame"

core.import(slot1, core)

slot3 = "CoreMenuStatePreFrontEnd"

core.import(slot1, core)

FrontEnd = FrontEnd or class()
function FrontEnd:init()
	local menu_handler = self.menu_state._menu_handler
	slot4 = menu_handler

	menu_handler.front_end(slot3)

	return 
end
function FrontEnd:transition()
	local game_state = self.menu_state._game_state
	slot4 = game_state

	if game_state.is_preparing_for_loading_game(slot3) then
		return CoreMenuStatePrepareLoadingGame.PrepareLoadingGame
	else
		slot4 = game_state

		if game_state.is_in_pre_front_end(slot3) then
			return CoreMenuStatePreFrontEnd.PreFrontEnd
		end
	end

	return 
end

return 
