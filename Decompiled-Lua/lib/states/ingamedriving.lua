slot2 = "lib/states/GameState"

require(slot1)

if not IngameDriving then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameDriving = slot0
function IngameDriving:init(game_state_machine)
	slot6 = game_state_machine

	IngameDriving.super.init(slot3, self, "ingame_driving")

	return 
end
function IngameDriving:_update_driving_hud()
	slot3 = managers.player
	local vehicle = managers.player.get_vehicle(slot2).vehicle_unit.vehicle(slot2)
	local vehicle_state = vehicle.get_state(managers.player.get_vehicle(slot2).vehicle_unit)
	local speed = vehicle_state.get_speed(vehicle) * 3.6
	local rpm = vehicle_state.get_rpm(vehicle_state)
	slot7 = vehicle_state
	local gear = vehicle_state.get_gear(vehicle_state) - 1

	if gear == 0 then
		gear = "N"
	elseif gear < 0 then
		gear = "R"
	end

	slot11 = gear

	managers.hud.set_driving_vehicle_state(slot7, managers.hud, speed, rpm)

	return 
end
function IngameDriving:at_enter(old_state, ...)
	slot4 = "IngameDriving:at_enter()"

	print(slot3)

	local players = managers.player.players(slot3)
	slot5 = players

	for k, player in ipairs(managers.player) do
		slot10 = player
		slot10 = player.camera(slot9)
		local vp = player.camera(slot9).viewport(slot9)

		if vp then
			slot12 = true

			vp.set_active(slot10, vp)
		else
			slot15 = k
			slot12 = "No viewport for player " .. tostring(slot14)

			Application.error(slot10, Application)
		end
	end

	slot5 = managers.player
	local player = managers.player.player_unit(slot4)

	if player then
		slot6 = player
		slot7 = true

		player.base(slot5).set_enabled(slot5, player.base(slot5))
	end

	slot8 = 100

	SoundDevice.set_rtpc(slot5, SoundDevice, "stamina")

	slot6 = old_state
	self._old_state = old_state.name(slot5)
	slot7 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.show(slot5, managers.hud)

	slot7 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.show(slot5, managers.hud)

	return 
end
function IngameDriving:at_exit()
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
