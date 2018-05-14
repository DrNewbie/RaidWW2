slot3 = "CoreMenuStatePrepareLoadingFrontEnd"

core.module(slot1, core)

slot3 = "CoreSessionResponse"

core.import(slot1, core)

slot3 = "CoreMenuStatePreFrontEnd"

core.import(slot1, core)

slot3 = "CoreMenuStateLoadingFrontEnd"

core.import(slot1, core)

PrepareLoadingFrontEnd = PrepareLoadingFrontEnd or class()
function PrepareLoadingFrontEnd:init()
	self._response = CoreSessionResponse.Done.new(slot2)
	local menu_handler = self.menu_state._menu_handler
	slot5 = self._response

	menu_handler.prepare_loading_front_end(CoreSessionResponse.Done, menu_handler)

	return 
end
function PrepareLoadingFrontEnd:destroy()
	slot3 = self._response

	self._response.destroy(slot2)

	return 
end
function PrepareLoadingFrontEnd:transition()
	slot3 = self._response

	if self._response.is_done(slot2) then
		return CoreMenuStateLoadingFrontEnd.LoadingFrontEnd
	end

	return 
end

return 
