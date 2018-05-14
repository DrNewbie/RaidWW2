slot2 = "lib/states/GameState"

require(slot1)

if not IngameStandardState then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameStandardState = slot0
function IngameStandardState:init(game_state_machine)
	slot6 = game_state_machine

	IngameStandardState.super.init(slot3, self, "ingame_standard")

	return 
end
function IngameStandardState:at_enter()
	slot3 = managers.player
	local players = managers.player.players(slot2)

	if managers.global_state.fire_character_created_event then
		slot5 = "[IngameStandardState:enter] managers.global_state:fire_event(GlobalStateManager.EVENT_CHARACTER_CREATED)"

		Application.debug(slot3, Application)

		managers.global_state.fire_character_created_event = nil
		slot5 = GlobalStateManager.EVENT_CHARACTER_CREATED

		managers.global_state.fire_event(nil, managers.global_state)
	end

	slot4 = players

	for k, player in ipairs(slot3) do
		slot9 = player
		slot9 = player.camera(slot8)
		local vp = player.camera(slot8).viewport(slot8)

		if vp then
			slot11 = true

			vp.set_active(slot9, vp)
		else
			slot14 = k
			slot11 = "No viewport for player " .. tostring(slot13)

			Application.error(slot9, Application)
		end
	end

	slot4 = managers.player
	local player = managers.player.player_unit(slot3)

	if player then
		slot5 = player
		slot6 = true

		player.base(slot4).set_enabled(slot4, player.base(slot4))
	end

	slot6 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.show(slot4, managers.hud)

	slot6 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.show(slot4, managers.hud)

	return 
end
function IngameStandardState:at_exit()
	slot3 = managers.environment_controller

	managers.environment_controller.set_dof_distance(slot2)

	slot3 = managers.player
	local player = managers.player.player_unit(slot2)

	if player then
		slot4 = player
		slot5 = false

		player.base(slot3).set_enabled(slot3, player.base(slot3))
	end

	slot5 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.hide(slot3, managers.hud)

	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.hide(slot3, managers.hud)

	return 
end

return 
