slot3 = "CoreMenuStateStopLoadingGame"

core.module(slot1, core)

slot3 = "CoreSessionResponse"

core.import(slot1, core)

slot3 = "CoreMenuStatePreFrontEnd"

core.import(slot1, core)

slot3 = "CoreMenuStateInGame"

core.import(slot1, core)

StopLoadingGame = StopLoadingGame or class()
function StopLoadingGame:init()
	local menu_handler = self.menu_state._menu_handler
	slot4 = CoreSessionResponse.Done
	self._response = CoreSessionResponse.Done.new(slot3)
	slot5 = self._response

	menu_handler.stop_loading_game_environment(slot3, menu_handler)

	return 
end
function StopLoadingGame:destroy()
	slot3 = self._response

	self._response.destroy(slot2)

	return 
end
function StopLoadingGame:transition()
	slot3 = self._response

	if not self._response.is_done(slot2) then
		return 
	end

	return CoreMenuStateInGame.InGame
end

return 
