-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuStateIntroScreens"

core.module(slot1, core)

slot3 = "CoreSessionResponse"

core.import(slot1, core)

IntroScreens = IntroScreens or class()
function IntroScreens:init()
	slot3 = CoreSessionResponse.DoneOrFinished
	self._response = CoreSessionResponse.DoneOrFinished.new(slot2)
	slot4 = self._response

	self.pre_front_end_once.menu_state._menu_handler.show_next_intro_screen(slot2, self.pre_front_end_once.menu_state._menu_handler)

	return 
end
function IntroScreens:destroy()
	slot3 = self._response

	self._response.destroy(slot2)

	return 
end
function IntroScreens:transition()
	slot3 = self._response

	if self._response.is_finished(slot2) then
		self.pre_front_end_once.intro_screens_done = true
	else
		slot3 = self._response
	end

	return 
end

return 
