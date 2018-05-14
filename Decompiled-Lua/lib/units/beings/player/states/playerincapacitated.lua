if not PlayerIncapacitated then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerIncapacitated = slot0
PlayerIncapacitated._update_movement = PlayerBleedOut._update_movement
function PlayerIncapacitated:init(unit)
	slot5 = unit

	PlayerIncapacitated.super.init(slot3, self)

	slot4 = "tased_exit"
	self._ids_tased_exit = Idstring(slot3)

	return 
end
function PlayerIncapacitated:enter(state_data, enter_data)
	PlayerIncapacitated.super.enter(slot4, self, state_data)

	slot5 = self

	self._interupt_action_steelsight(slot4)

	slot5 = self
	slot8 = managers.player
	slot8 = managers.player.player_timer(enter_data)

	self._interupt_action_melee(slot4, managers.player.player_timer(enter_data).time(enter_data))

	slot5 = self
	slot8 = managers.player
	slot8 = managers.player.player_timer(enter_data)

	self._interupt_action_ladder(slot4, managers.player.player_timer(enter_data).time(enter_data))

	slot5 = managers.blackmarket
	local projectile_entry = managers.blackmarket.equipped_projectile(slot4)

	if tweak_data.projectiles[projectile_entry].is_a_grenade then
		slot6 = self
		slot9 = managers.player
		slot9 = managers.player.player_timer(slot8)

		self._interupt_action_throw_grenade(slot5, managers.player.player_timer(slot8).time(slot8))
	else
		slot6 = self
		slot9 = managers.player
		slot9 = managers.player.player_timer(slot8)

		self._interupt_action_throw_projectile(slot5, managers.player.player_timer(slot8).time(slot8))
	end

	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._interupt_action_charging_weapon(slot5, managers.player.player_timer(slot8).time(slot8))

	self._revive_SO_data = {
		unit = self._unit
	}
	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._start_action_incapacitated(self._unit, managers.player.player_timer(slot8).time(slot8))

	slot6 = self._unit
	slot8 = 4

	self._unit.base(self._unit).set_slot(self._unit, self._unit.base(self._unit), self._unit)

	slot6 = self._unit
	slot6 = self._unit.camera(self._unit)
	slot6 = self._unit.camera(self._unit).camera_unit(self._unit)
	slot7 = 80

	self._unit.camera(self._unit).camera_unit(self._unit).base(self._unit).set_target_tilt(self._unit, self._unit.camera(self._unit).camera_unit(self._unit).base(self._unit))

	slot6 = self._unit
	slot6 = self._unit.character_damage(self._unit)

	self._unit.character_damage(self._unit).on_incapacitated(self._unit)

	slot6 = self._unit
	slot6 = self._unit.character_damage(self._unit)

	self._unit.character_damage(self._unit).on_incapacitated_state_enter(self._unit)

	self._reequip_weapon = enter_data and enter_data.equip_weapon
	self._next_shock = 0.5
	self._taser_value = 0.5
	slot6 = managers.groupai
	slot7 = self._unit

	managers.groupai.state(slot5).on_criminal_neutralized(slot5, managers.groupai.state(slot5))

	slot6 = Network

	if Network.is_server(slot5) then
		slot7 = "revive"

		PlayerBleedOut._register_revive_SO(slot5, self._revive_SO_data)
	end

	slot6 = managers.groupai
	slot7 = self._unit

	managers.groupai.state(slot5).report_criminal_downed(slot5, managers.groupai.state(slot5))

	slot6 = managers.network
	slot13 = "teammate_downed"
	slot13 = 1

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_contour_state", self._unit, -1, table.index_of(slot11, ContourExt.indexed_types), true, 1)

	return 
end
function PlayerIncapacitated:_enter(enter_data)
	local preset = nil
	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)

	if managers.groupai.state(slot4).whisper_mode(slot4) then
		preset = {
			"pl_mask_on_friend_combatant_whisper_mode",
			"pl_mask_on_friend_non_combatant_whisper_mode",
			"pl_mask_on_foe_combatant_whisper_mode_crouch",
			"pl_mask_on_foe_non_combatant_whisper_mode_crouch"
		}
	else
		preset = {
			"pl_friend_combatant_cbt",
			"pl_friend_non_combatant_cbt"
		}
	end

	slot6 = preset

	self._ext_movement.set_attention_settings(slot4, self._ext_movement)

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = self._ext_movement

		if self._ext_movement.nav_tracker(slot4) then
			slot5 = managers.groupai
			slot5 = managers.groupai.state(slot4)

			managers.groupai.state(slot4).on_player_weapons_hot(slot4)
		end
	end

	return 
end
function PlayerIncapacitated:exit(state_data, new_state_name)
	PlayerIncapacitated.super.exit(slot4, self, state_data)

	slot5 = self
	slot8 = managers.player
	slot8 = managers.player.player_timer(new_state_name)

	self._end_action_incapacitated(slot4, managers.player.player_timer(new_state_name).time(new_state_name))

	slot6 = 1

	managers.environment_controller.set_taser_value(slot4, managers.environment_controller)

	slot5 = self

	PlayerBleedOut._unregister_revive_SO(slot4)

	slot5 = managers.network
	slot12 = "teammate_downed"
	slot12 = 1

	managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_contour_state", self._unit, -1, table.index_of(slot10, ContourExt.indexed_types), false, 1)

	return {
		equip_weapon = self._reequip_weapon
	}
end
function PlayerIncapacitated:interaction_blocked()
	return true
end
function PlayerIncapacitated:update(t, dt)
	slot7 = dt

	PlayerIncapacitated.super.update(slot4, self, t)

	return 
end
function PlayerIncapacitated:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)

	if self._next_shock < t then
		slot6 = self._unit
		slot9 = 10

		self._unit.camera(slot5).play_shaker(slot5, self._unit.camera(slot5), "player_taser_shock", 0.5)

		slot7 = 2.5
		slot5 = math.rand(self._unit.camera(slot5))
		self._next_shock = t + 0.5 + slot5
		slot6 = self._camera_unit
		slot6 = self._camera_unit.base(slot5)

		self._camera_unit.base(slot5).start_shooting(slot5)

		self._recoil_t = t + 0.5
		slot6 = self._camera_unit
		slot10 = 2

		self._camera_unit.base(slot5).recoil_kick(slot5, self._camera_unit.base(slot5), -2, 2, -2)

		self._taser_value = 0.25
		slot7 = "incapacitated_shock"

		managers.rumble.play(slot5, managers.rumble)

		slot6 = self._unit
		slot6 = self._unit.camera(slot5)._camera_unit
		slot10 = 75
		slot8 = 0.33

		self._unit.camera(slot5)._camera_unit.base(slot5).animate_fov(slot5, self._unit.camera(slot5)._camera_unit.base(slot5), math.lerp(2, 65, math.random()))
	elseif self._recoil_t and self._recoil_t < t then
		self._recoil_t = nil
		slot6 = self._camera_unit
		slot6 = self._camera_unit.base(slot5)

		self._camera_unit.base(slot5).stop_shooting(slot5)
	end

	slot8 = dt / 2
	self._taser_value = math.step(slot5, self._taser_value, 0.75)
	slot7 = self._taser_value

	managers.environment_controller.set_taser_value(slot5, managers.environment_controller)

	slot9 = input

	self._check_stats_screen(slot5, self, t, dt)

	slot8 = input

	self._update_foley(slot5, self, t)

	local new_action = nil
	slot9 = input

	self._check_action_interact(self, self, t)

	return 
end
function PlayerIncapacitated:_check_action_interact(t, input)
	if input.btn_interact_press and (not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t) then
		self._intimidate_t = t
		slot11 = true

		self.call_teammate(slot4, self, self, "f11", t, true, true)
	end

	return 
end
function PlayerIncapacitated:_start_action_incapacitated(t)
	slot5 = t

	self._interupt_action_running(slot3, self)

	self._state_data.ducking = true
	slot4 = self

	self._stance_entered(true)

	slot4 = self

	self._update_crosshair_offset(true)

	slot4 = self._unit

	self._unit.kill_mover(true)

	slot4 = self
	slot7 = "duck"

	self._activate_mover(true, Idstring(slot6))

	slot4 = self._unit
	slot5 = self._ids_tased_exit

	self._unit.camera(true).play_redirect(true, self._unit.camera(true))

	slot4 = self._unit
	slot4 = self._unit.camera(true)._camera_unit
	slot5 = 75

	self._unit.camera(true)._camera_unit.base(true).animate_fov(true, self._unit.camera(true)._camera_unit.base(true))

	return 
end
function PlayerIncapacitated:_end_action_incapacitated(t)
	slot4 = self

	if not self._can_stand(slot3) then
		return 
	end

	self._state_data.ducking = false
	slot4 = self

	self._stance_entered(false)

	slot4 = self

	self._update_crosshair_offset(false)

	slot4 = self._unit

	self._unit.kill_mover(false)

	slot4 = self
	slot7 = "stand"

	self._activate_mover(false, Idstring(slot6))

	return 
end
function PlayerIncapacitated:pre_destroy(unit)
	slot4 = self

	PlayerBleedOut._unregister_revive_SO(slot3)

	return 
end
function PlayerIncapacitated:destroy(unit)
	slot4 = self

	PlayerBleedOut._unregister_revive_SO(slot3)

	slot5 = 1

	managers.environment_controller.set_taser_value(slot3, managers.environment_controller)

	return 
end

return 
