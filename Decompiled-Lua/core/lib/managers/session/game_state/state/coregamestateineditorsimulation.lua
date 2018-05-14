slot3 = "CoreGameStateInEditorSimulation"

core.module(slot1, core)

slot3 = "CoreGameStatePrepareLoadingFrontEnd"

core.import(slot1, core)

slot3 = "CoreGameStateInGame"

core.import(slot1, core)

slot3 = "CoreGameStateInEditorPrepareStopSimulation"

core.import(slot1, core)

if not Simulation then
	slot2 = CoreGameStateInGame.InGame
	slot0 = class(slot1)
end

Simulation = slot0
function Simulation:transition()
	slot3 = self.game_state._front_end_requester

	if not self.game_state._front_end_requester.is_requested(slot2) then
		return 
	end

	slot3 = self.game_state._session_manager

	if self.game_state._session_manager._main_systems_are_stable_for_loading(slot2) then
		return CoreGameStateInEditorPrepareStopSimulation.PrepareStopSimulation, self._level_handler
	end

	return 
end

return 
