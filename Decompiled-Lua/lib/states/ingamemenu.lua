slot2 = "lib/states/GameState"

require(slot1)

if not IngameMenu then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameMenu = slot0
function IngameMenu:init(game_state_machine)
	slot6 = game_state_machine

	IngameMenu.super.init(slot3, self, "ingame_menu")

	return 
end
function IngameMenu:_setup_controller()
	slot7 = managers.controller
	slot6 = false
	self._controller = managers.controller.create_controller(slot2, managers.controller, "ingame_menu", managers.controller.get_default_wrapper_index(slot6))
	slot4 = true

	self._controller.set_enabled(slot2, self._controller)

	return 
end
function IngameMenu:_clear_controller()
	if self._controller then
		slot4 = false

		self._controller.set_enabled(slot2, self._controller)

		slot3 = self._controller

		self._controller.destroy(slot2)

		self._controller = nil
	end

	return 
end
function IngameMenu:set_controller_enabled(enabled)
	if self._controller then
		slot5 = enabled

		self._controller.set_enabled(slot3, self._controller)
	end

	return 
end
function IngameMenu:exit()
	return 
end
function IngameMenu:on_destroyed()
	return 
end
function IngameMenu:update(t, dt)
	return 
end
function IngameMenu:at_enter(old_state, params)
	slot5 = self

	self._setup_controller(slot4)

	return 
end
function IngameMenu:at_exit()
	slot3 = self

	self._clear_controller(slot2)

	return 
end
function IngameMenu:game_ended()
	return true
end

return 
