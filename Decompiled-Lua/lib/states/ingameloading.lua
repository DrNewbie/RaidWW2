slot2 = "lib/states/GameState"

require(slot1)

if not IngameLoading then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameLoading = slot0
function IngameLoading:init(game_state_machine)
	slot6 = game_state_machine

	IngameLoading.super.init(slot3, self, "ingame_loading")

	return 
end
function IngameLoading:_setup_controller()
	slot7 = managers.controller
	slot6 = false
	self._controller = managers.controller.create_controller(slot2, managers.controller, "ingame_loading", managers.controller.get_default_wrapper_index(slot6))
	slot5 = "continue"
	self._continue_cb = callback(slot2, self, self)
	slot4 = true

	self._controller.set_enabled(slot2, self._controller)

	return 
end
function IngameLoading:_clear_controller()
	if self._controller then
		slot4 = false

		self._controller.set_enabled(slot2, self._controller)

		slot3 = self._controller

		self._controller.destroy(slot2)

		self._controller = nil
	end

	return 
end
function IngameLoading:set_controller_enabled(enabled)
	if self._controller then
		slot5 = enabled

		self._controller.set_enabled(slot3, self._controller)
	end

	return 
end
function IngameLoading:continue()
	slot4 = self._old_state

	game_state_machine.change_state_by_name(slot2, game_state_machine)

	return 
end
function IngameLoading:on_destroyed()
	return 
end
function IngameLoading:update(t, dt)
	return 
end
function IngameLoading:at_enter(old_state, params)
	slot5 = old_state
	self._old_state = old_state.name(slot4)
	self._old_state = "ingame_standard"
	slot5 = managers.player
	local player = managers.player.player_unit(slot4)

	if player then
		slot6 = player
		slot7 = false

		player.base(slot5).set_enabled(slot5, player.base(slot5))

		slot6 = player
		slot6 = player.movement(slot5)
		slot6 = player.movement(slot5).current_state(slot5)

		player.movement(slot5).current_state(slot5).interupt_all_actions(slot5)
	end

	slot7 = true

	managers.hud.hide_comm_wheel(slot5, managers.hud)

	managers.worldcollection.team_ai_transition = true
	slot6 = managers.groupai
	slot6 = managers.groupai.state(true)

	managers.groupai.state(true).on_criminal_team_AI_enabled_state_changed(true)

	slot7 = true

	managers.raid_menu.on_escape(true, managers.raid_menu)

	slot6 = self

	self._setup_controller(true)

	return 
end
function IngameLoading:at_exit()
	managers.worldcollection.team_ai_transition = false
	slot3 = managers.groupai
	slot4 = true

	managers.groupai.state(false).on_criminal_team_AI_enabled_state_changed(false, managers.groupai.state(false))

	slot3 = managers.player

	if managers.player.local_player(false) then
		slot3 = managers.player
		slot3 = managers.player.local_player(slot2)
		slot3 = managers.player.local_player(slot2).movement(slot2)
		managers.player.local_player(slot2).movement(slot2).current_state(slot2)._state_data.in_air = false
	end

	slot3 = self

	self._clear_controller(slot2)

	return 
end
function IngameLoading:game_ended()
	return true
end
function IngameLoading:is_joinable()
	return false
end

return 
