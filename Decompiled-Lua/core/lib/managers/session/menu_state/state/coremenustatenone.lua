slot3 = "CoreMenuStateNone"

core.module(slot1, core)

slot3 = "CoreMenuStatePreFrontEndOnce"

core.import(slot1, core)

slot3 = "CoreMenuStateInEditor"

core.import(slot1, core)

None = None or class()
function None:transition()
	local state = self.menu_state._game_state
	slot4 = state

	if not state.is_in_init(slot3) then
		slot4 = state

		if state.is_in_editor(slot3) then
			return CoreMenuStateInEditor.InEditor
		else
			return CoreMenuStatePreFrontEndOnce.PreFrontEndOnce
		end
	end

	return 
end

return 
