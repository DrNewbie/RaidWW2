slot3 = "CoreMenuStatePrepareLoadingGame"

core.module(slot1, core)

slot3 = "CoreSessionResponse"

core.import(slot1, core)

slot3 = "CoreMenuStateInGame"

core.import(slot1, core)

slot3 = "CoreMenuStateLoadingGame"

core.import(slot1, core)

PrepareLoadingGame = PrepareLoadingGame or class()
function PrepareLoadingGame:init()
	self._response = CoreSessionResponse.Done.new(slot2)
	local menu_handler = self.menu_state._menu_handler
	slot5 = self._response

	menu_handler.prepare_loading_game(CoreSessionResponse.Done, menu_handler)

	return 
end
function PrepareLoadingGame:destroy()
	slot3 = self._response

	self._response.destroy(slot2)

	return 
end
function PrepareLoadingGame:transition()
	slot3 = self._response

	if self._response.is_done(slot2) then
		return CoreMenuStateLoadingGame.LoadingGame
	end

	return 
end

return 
