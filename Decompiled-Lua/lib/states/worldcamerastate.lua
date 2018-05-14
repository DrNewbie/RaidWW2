slot2 = "lib/states/GameState"

require(slot1)

if not WorldCameraState then
	slot2 = GameState
	slot0 = class(slot1)
end

WorldCameraState = slot0
function WorldCameraState:init(game_state_machine)
	slot6 = game_state_machine

	GameState.init(slot3, self, "world_camera")

	return 
end
function WorldCameraState:at_enter()
	return 
end
function WorldCameraState:at_exit()
	return 
end

return 
