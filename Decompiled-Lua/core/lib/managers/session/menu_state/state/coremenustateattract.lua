-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuStateAttract"

core.module(slot1, core)

slot3 = "CoreMenuStateStart"

core.import(slot1, core)

slot3 = "CoreSessionResponse"

core.import(slot1, core)

Attract = Attract or class()
function Attract:init()
	local menu_handler = self.pre_front_end.menu_state._menu_handler
	slot4 = CoreSessionResponse.Done
	self._response = CoreSessionResponse.Done.new(slot3)
	slot5 = self._response

	menu_handler.attract(slot3, menu_handler)

	return 
end
function Attract:destroy()
	slot3 = self._response

	self._response.destroy(slot2)

	return 
end
function Attract:transition()

	-- Decompilation error in this vicinity:
	slot3 = self._response

	return 
end

return 
