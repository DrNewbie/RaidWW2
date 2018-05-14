slot3 = "CoreInternalGameState"

core.import(slot1, core)

if not GameState then
	slot2 = CoreInternalGameState.GameState
	slot0 = class(slot1)
end

GameState = slot0
function GameState:freeflight_drop_player(pos, rot)
	if managers.player then
		slot7 = rot

		managers.player.warp_to(slot4, managers.player, pos)
	end

	return 
end
function GameState:set_controller_enabled(enabled)
	return 
end
function GameState:default_transition(next_state, params)
	slot7 = params

	self.at_exit(slot4, self, next_state)

	slot6 = false

	self.set_controller_enabled(slot4, self)

	slot5 = self
	slot5 = self.gsm(slot4)

	if self.gsm(slot4).is_controller_enabled(slot4) then
		slot6 = true

		next_state.set_controller_enabled(slot4, next_state)
	end

	slot7 = params

	next_state.at_enter(slot4, next_state, self)

	return 
end
function GameState:on_disconnected()
	return 
end
function GameState:on_server_left(message)
	slot4 = managers.worldcollection

	managers.worldcollection.on_server_left(slot3)

	if managers.game_play_central then
		slot4 = managers.game_play_central

		managers.game_play_central.stop_the_game(slot3)
	end

	if message then
		slot6 = MenuCallbackHandler._dialog_end_game_yes

		managers.menu.show_host_left_dialog(slot3, managers.menu, message)
	else
		slot4 = MenuCallbackHandler

		MenuCallbackHandler._dialog_end_game_yes(slot3)
	end

	return 
end
function GameState:on_kicked()
	slot3 = managers.menu

	managers.menu.show_peer_kicked_dialog(slot2)

	slot4 = "kick_player"

	managers.menu_component.post_event(slot2, managers.menu_component)

	return 
end
function GameState:is_joinable()
	return true
end
slot3 = GameState

CoreClass.override_class(function (self)
	return true
end, CoreInternalGameState.GameState)

return 
