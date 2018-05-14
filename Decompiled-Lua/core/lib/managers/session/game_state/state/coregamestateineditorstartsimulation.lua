slot3 = "CoreGameStateInEditorStartSimulation"

core.module(slot1, core)

slot3 = "CoreGameStateInGame"

core.import(slot1, core)

slot3 = "CoreGameStateLoadingGame"

core.import(slot1, core)

if not StartSimulation then
	slot2 = CoreGameStateLoadingGame.LoadingGame
	slot0 = class(slot1)
end

StartSimulation = slot0
function StartSimulation:transition()
	return CoregameStateInEditorSimulation.Simulation
end

return 
