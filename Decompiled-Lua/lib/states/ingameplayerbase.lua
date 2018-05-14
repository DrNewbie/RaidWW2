slot2 = "lib/states/GameState"

require(slot1)

if not IngamePlayerBaseState then
	slot2 = GameState
	slot0 = class(slot1)
end

IngamePlayerBaseState = slot0
function IngamePlayerBaseState:init(...)
	slot3 = self

	GameState.init(slot2, ...)

	return 
end
function IngamePlayerBaseState:set_controller_enabled(enabled)
	local players = managers.player.players(slot3)
	slot5 = players

	for _, player in ipairs(managers.player) do
		slot10 = player
		slot10 = player.base(slot9)
		local controller = player.base(slot9).controller(slot9)

		if controller then
			slot12 = enabled

			controller.set_enabled(slot10, controller)
		end

		if enabled then
			slot12 = "duck"

			controller.clear_input_pressed_state(slot10, controller)

			slot12 = "jump"

			controller.clear_input_pressed_state(slot10, controller)

			slot12 = "stats_screen"

			if controller.get_input_bool(slot10, controller) then
			end
		end
	end

	return 
end

return 
