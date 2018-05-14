slot2 = "lib/states/GameState"

require(slot1)

if not IngameParachuting then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameParachuting = slot0
function IngameParachuting:init(game_state_machine)
	slot6 = game_state_machine

	IngameParachuting.super.init(slot3, self, "ingame_parachuting")

	return 
end
function IngameParachuting:at_enter()
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

		slot5 = player
		slot6 = true

		player.character_damage(slot4).set_invulnerable(slot4, player.character_damage(slot4))
	end

	slot6 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.show(slot4, managers.hud)

	slot6 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.show(slot4, managers.hud)

	return 
end
function IngameParachuting:at_exit()
	slot3 = managers.player
	local player = managers.player.player_unit(slot2)

	if player then
		slot4 = player

		player.base(slot3).set_enabled(slot3, player.base(slot3))

		slot4 = Idstring(false)
		slot5 = player.position("units/vanilla/props/props_parachute/props_parachute")
		slot8 = player
		local unit = safe_spawn_unit(slot3, slot4, player.rotation(player))
		slot5 = unit
		slot6 = "make_dynamic"

		unit.damage(slot4).run_sequence_simple(slot4, unit.damage(slot4))

		slot5 = player
		slot6 = false

		player.character_damage(slot4).set_invulnerable(slot4, player.character_damage(slot4))

		slot6 = unit

		managers.worldcollection.register_spawned_unit_on_last_world(slot4, managers.worldcollection)
	end

	slot5 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.hide(slot3, managers.hud)

	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.hide(slot3, managers.hud)

	return 
end
function IngameParachuting:is_joinable()
	return false
end

return 
