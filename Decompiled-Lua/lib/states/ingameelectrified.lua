slot2 = "lib/states/GameState"

require(slot1)

if not IngameElectrifiedState then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameElectrifiedState = slot0
function IngameElectrifiedState:init(game_state_machine)
	slot6 = game_state_machine

	IngamePlayerBaseState.super.init(slot3, self, "ingame_electrified")

	return 
end
function IngameElectrifiedState:update(t, dt)
	return 
end
function IngameElectrifiedState:at_enter()
	local players = managers.player.players(slot2)
	slot4 = players

	for k, player in ipairs(managers.player) do
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
function IngameElectrifiedState:at_exit()
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
