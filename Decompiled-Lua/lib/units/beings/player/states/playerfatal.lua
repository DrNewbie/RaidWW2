if not PlayerFatal then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerFatal = slot0
PlayerFatal._update_movement = PlayerBleedOut._update_movement
function PlayerFatal:init(unit)
	slot5 = unit

	PlayerFatal.super.init(slot3, self)

	return 
end
function PlayerFatal:enter(state_data, enter_data)
	PlayerFatal.super.enter(slot4, self, state_data)

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

	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._start_action_dead(slot5, managers.player.player_timer(slot8).time(slot8))

	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)
	slot8 = {
		selection_wanted = 1
	}

	self._start_action_unequip_weapon(slot5, self, managers.player.player_timer(slot8).time(slot8))

	slot6 = self._unit
	slot8 = 4

	self._unit.base(slot5).set_slot(slot5, self._unit.base(slot5), self._unit)

	slot6 = self._unit
	slot6 = self._unit.camera(slot5)
	slot6 = self._unit.camera(slot5).camera_unit(slot5)
	slot7 = 80

	self._unit.camera(slot5).camera_unit(slot5).base(slot5).set_target_tilt(slot5, self._unit.camera(slot5).camera_unit(slot5).base(slot5))

	slot6 = self._ext_movement

	if self._ext_movement.nav_tracker(slot5) then
		slot6 = managers.groupai
		slot7 = self._unit

		managers.groupai.state(slot5).on_criminal_neutralized(slot5, managers.groupai.state(slot5))
	end

	slot6 = self._unit
	slot6 = self._unit.character_damage(slot5)

	self._unit.character_damage(slot5).on_fatal_state_enter(slot5)

	slot6 = Network

	if Network.is_server(slot5) and enter_data then
		if enter_data.revive_SO_data then
			self._revive_SO_data = enter_data.revive_SO_data
		end

		self._deathguard_SO_id = enter_data.deathguard_SO_id
	end

	self._reequip_weapon = enter_data and enter_data.equip_weapon
	slot7 = true

	managers.hud.hide_comm_wheel(slot5, managers.hud)

	slot6 = managers.network
	slot13 = "teammate_downed"
	slot13 = 1

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_contour_state", self._unit, -1, table.index_of(slot11, ContourExt.indexed_types), true, 1)

	return 
end
function PlayerFatal:_enter(enter_data)
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
function PlayerFatal:exit(state_data, new_state_name)
	PlayerFatal.super.exit(slot4, self, state_data)

	slot5 = self
	slot8 = managers.player
	slot8 = managers.player.player_timer(new_state_name)

	self._end_action_dead(slot4, managers.player.player_timer(new_state_name).time(new_state_name))

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = self

		PlayerBleedOut._unregister_revive_SO(slot4)
	end

	self._revive_SO_data = nil

	if self._stats_screen then
		self._stats_screen = false
		slot5 = managers.hud

		managers.hud.hide_stats_screen(slot4)
	end

	local exit_data = {
		equip_weapon = self._reequip_weapon
	}

	if new_state_name == "standard" then
		exit_data.wants_crouch = true
	end

	slot6 = managers.network
	slot13 = "teammate_downed"
	slot13 = 1

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_contour_state", self._unit, -1, table.index_of(slot11, ContourExt.indexed_types), false, 1)

	return exit_data
end
function PlayerFatal:interaction_blocked()
	return true
end
function PlayerFatal:update(t, dt)
	slot7 = dt

	PlayerFatal.super.update(slot4, self, t)

	return 
end
function PlayerFatal:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot8 = input

	self._update_foley(self, self, t)

	local new_action = nil
	slot10 = input

	self._check_stats_screen(self, self, t, dt)

	slot9 = input

	self._check_action_interact(self, self, t)

	return 
end
function PlayerFatal:_check_action_interact(t, input)
	if input.btn_interact_press and (not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t) then
		self._intimidate_t = t
		slot11 = true

		if not self.call_teammate(slot4, self, self, "f11", t, true, true) then
			slot10 = self._revive_SO_data

			PlayerBleedOut.call_civilian(slot4, self, "f11", t, false, true)
		end
	end

	return 
end
function PlayerFatal:_start_action_dead(t)
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

	return 
end
function PlayerFatal:_end_action_dead(t)
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
function PlayerFatal:pre_destroy(unit)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self

		PlayerBleedOut._unregister_revive_SO(slot3)
	end

	return 
end
function PlayerFatal:destroy()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self

		PlayerBleedOut._unregister_revive_SO(slot2)
	end

	return 
end

return 
