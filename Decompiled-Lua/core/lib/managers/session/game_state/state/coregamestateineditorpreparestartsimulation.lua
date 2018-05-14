slot3 = "CoreGameStateInEditorPrepareStartSimulation"

core.module(slot1, core)

slot3 = "CoreGameStateInEditorSimulation"

core.import(slot1, core)

slot3 = "CoreGameStatePrepareLoadingGame"

core.import(slot1, core)

if not PrepareStartSimulation then
	slot2 = CoreGameStatePrepareLoadingGame.PrepareLoadingGame
	slot0 = class(slot1)
end

PrepareStartSimulation = slot0
function PrepareStartSimulation:init()
	PrepareStartSimulation.super.init(slot2)

	local factory = self.game_state._session_manager._factory
	slot4 = factory
	self._level_handler = factory.create_level_handler(self)
	slot4 = self.game_state
	slot5 = self._level_handler

	self.game_state.player_slots(self).enter_level_handler(self, self.game_state.player_slots(self))

	local local_user_manager = self.game_state._session_manager._local_user_manager
	slot6 = self._level_handler

	local_user_manager.enter_level_handler(self.game_state.player_slots(self), local_user_manager)

	slot5 = self._level_handler
	slot8 = self.game_state

	self._level_handler.set_player_slots(self.game_state.player_slots(self), self.game_state.player_slots(slot7))

	return 
end
function PrepareStartSimulation:transition()
	slot3 = self.game_state._session_manager

	if self.game_state._session_manager.all_systems_are_stable_for_loading(slot2) then
		return CoreGameStateInEditorSimulation.Simulation, self._level_handler
	end

	return 
end

return 
