slot3 = "CoreMenuStateInGame"

core.module(slot1, core)

slot3 = "CoreMenuStatePrepareLoadingFrontEnd"

core.import(slot1, core)

InGame = InGame or class()
function InGame:transition()
	local game_state = self.menu_state._game_state
	slot4 = game_state

	if game_state.is_preparing_for_loading_front_end(slot3) then
		return CoreMenuStatePrepareLoadingFrontEnd.PrepareLoadingFrontEnd
	end

	return 
end

return 
