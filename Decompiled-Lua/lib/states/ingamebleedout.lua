slot2 = "lib/states/GameState"

require(slot1)

if not IngameBleedOutState then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameBleedOutState = slot0
function IngameBleedOutState:init(game_state_machine)
	slot6 = game_state_machine

	IngameBleedOutState.super.init(slot3, self, "ingame_bleed_out")

	return 
end
function IngameBleedOutState:update(t, dt)
	local player = managers.player.player_unit(slot4)
	slot6 = player

	if not alive(managers.player) then
		return 
	end

	slot6 = player
	slot6 = player.movement(slot5)

	if player.movement(slot5).nav_tracker(slot5) then
		slot6 = player
		slot8 = dt

		if player.character_damage(slot5).update_downed(slot5, player.character_damage(slot5), t) then
			slot6 = managers.player

			managers.player.force_drop_carry(slot5)

			slot7 = {
				death = true
			}

			managers.statistics.downed(slot5, managers.statistics)
			IngameFatalState.on_local_player_dead()

			slot6 = player
			slot7 = false

			player.base(slot5).set_enabled(slot5, player.base(slot5))

			slot7 = "ingame_waiting_for_respawn"

			game_state_machine.change_state_by_name(slot5, game_state_machine)

			slot6 = player
			slot7 = true

			player.character_damage(slot5).set_invulnerable(slot5, player.character_damage(slot5))

			slot6 = player
			slot7 = 0

			player.character_damage(slot5).set_health(slot5, player.character_damage(slot5))

			slot6 = player
			slot6 = player.base(slot5)

			player.base(slot5)._unregister(slot5)

			slot7 = player

			World.delete_unit(slot5, World)
		end
	end

	return 
end
function IngameBleedOutState:at_enter()
	slot4 = BuffEffectManager.EFFECT_NO_BLEEDOUT_PUMPIKIN_REVIVE

	if managers.buff_effect.is_effect_active(slot2, managers.buff_effect) then
		slot3 = managers.player

		managers.player.kill(slot2)

		return 
	end

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

	slot5 = {
		bleed_out = true
	}

	managers.statistics.downed(slot3, managers.statistics)

	slot4 = managers.player
	local player = managers.player.player_unit(slot3)

	if player then
		slot5 = player
		slot6 = true

		player.base(slot4).set_enabled(slot4, player.base(slot4))
	end

	slot5 = managers.warcry

	managers.warcry.deactivate_warcry(slot4)

	slot7 = {
		skip_idle_check = true,
		instigator = managers.player.local_player(slot9)
	}
	slot10 = managers.player

	managers.dialog.queue_dialog(slot4, managers.dialog, "player_gen_downed")

	slot6 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.show(slot4, managers.hud)

	slot6 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.show(slot4, managers.hud)

	return 
end
function IngameBleedOutState:at_exit()
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
