slot3 = "CoreGameStateInEditorStopSimulation"

core.module(slot1, core)

slot3 = "CoreGameStateInEditor"

core.import(slot1, core)

StopSimulation = StopSimulation or class()
function StopSimulation:init()
	slot3 = self.game_state._front_end_requester

	self.game_state._front_end_requester.task_started(slot2)

	return 
end
function StopSimulation:destroy()
	slot3 = self.game_state._front_end_requester

	self.game_state._front_end_requester.task_completed(slot2)

	return 
end
function StopSimulation:transition()
	return CoreGameStateInEditor.InEditor
end

return 
