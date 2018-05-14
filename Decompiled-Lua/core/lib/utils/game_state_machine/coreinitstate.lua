slot3 = "CoreInitState"

core.module(slot1, core)

slot3 = "CoreInternalGameState"

core.import(slot1, core)

if not _InitState then
	slot2 = CoreInternalGameState.GameState
	slot0 = class(slot1)
end

_InitState = slot0
function _InitState:init(game_state_machine)
	slot6 = game_state_machine

	CoreInternalGameState.GameState.init(slot3, self, "init")

	return 
end
function _InitState:at_enter()
	slot3 = "[GameStateMachine] ERROR, you are not allowed to enter the init state"

	error(slot2)

	return 
end

return 
