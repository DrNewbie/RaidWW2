slot3 = "CoreGameStateInEditor"

core.module(slot1, core)

slot3 = "CoreGameStateInEditorPrepareStartSimulation"

core.import(slot1, core)

InEditor = InEditor or class()
function InEditor:init()
	self.game_state._is_in_editor = true
	slot6 = "game_state_editor"

	EventManager.trigger_event(true, EventManager, Idstring(nil))

	return 
end
function InEditor:destroy()
	self.game_state._is_in_editor = false

	return 
end
function InEditor:transition()
	slot3 = self.game_state._game_requester

	if not self.game_state._game_requester.is_requested(slot2) then
		return 
	end

	slot3 = self.game_state._session_manager

	if self.game_state._session_manager._main_systems_are_stable_for_loading(slot2) then
		return CoreGameStateInEditorPrepareStartSimulation.PrepareStartSimulation
	end

	return 
end

return 
