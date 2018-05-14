-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not PlayerTurret then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerTurret = slot0
function PlayerTurret:init(unit)
	slot5 = unit

	PlayerTurret.super.init(slot3, self)

	return 
end
function PlayerTurret:enter(state_data, enter_data)
	slot7 = enter_data

	PlayerTurret.super.enter(slot4, self, state_data)

	slot5 = managers.player
	slot5 = managers.player.get_current_state(slot4)._unit
	self._weapon_index = managers.player.get_current_state(slot4)._unit.inventory(slot4)._selected_primary
	slot5 = managers.player
	slot5 = managers.player.get_current_state(slot4)._unit
	slot7 = true

	managers.player.get_current_state(slot4)._unit.inventory(slot4).equip_selection(slot4, managers.player.get_current_state(slot4)._unit.inventory(slot4), 4)

	slot5 = managers.player
	self._turret_unit = managers.player.get_turret_unit(slot4)
	slot5 = self._turret_unit
	self._turret_weapon = self._turret_unit.weapon(slot4)
	self._turret_overheated = false
	self._turret_weapon._mode = "player"
	slot5 = self._turret_weapon
	local turret_weapon_name = self._turret_weapon.get_name_id("player")
	self._state_data.in_steelsight = tweak_data.weapon[turret_weapon_name].use_dof or nil
	self._exit_turret_timer = tweak_data.weapon[turret_weapon_name].exit_turret_speed or 1
	self._camera_limit_h = tweak_data.weapon[turret_weapon_name].camera_limit_horizontal or 45
	self._camera_limit_v = tweak_data.weapon[turret_weapon_name].camera_limit_vertical or 30
	self._camera_limit_v_mid = tweak_data.weapon[turret_weapon_name].camera_limit_vertical_mid or 0
	self._camera_speed_limit = tweak_data.weapon[turret_weapon_name].camera_speed_limit

	if self._camera_limit_h == 360 then
		self._camera_limit_h = nil
	end

	self._shaker_multiplier = tweak_data.weapon[turret_weapon_name].shaker_multiplier or 0.5
	slot6 = self

	self._init_locators(slot5)

	slot6 = self._turret_unit
	slot8 = true

	self._turret_unit.interaction(slot5).set_active(slot5, self._turret_unit.interaction(slot5), false)

	slot7 = true

	self._turret_weapon.set_active(slot5, self._turret_weapon)

	slot6 = managers.network
	slot8 = self._turret_unit

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_ground_turret_activate")
	managers.hud.show_turret_hud(slot5, managers.hud, self._turret_unit)

	slot6 = managers.hud

	managers.hud.set_player_turret_overheating(slot5, self._turret_weapon.is_overheating(tweak_data.weapon[turret_weapon_name].bullet_type))

	self._turret_sync_dt = 0
	slot6 = self._turret_weapon

	self._turret_weapon.on_player_enter(slot5)

	slot7 = self._unit

	self._turret_weapon.set_weapon_user(slot5, self._turret_weapon)

	slot6 = self

	self._husk_turret_data(slot5)

	self._announce_shooting = false
	slot6 = self._unit
	slot7 = "turret_connect"
	local result = self._unit.sound_source(slot5).post_event(slot5, self._unit.sound_source(slot5))
	slot10 = "first_person_view"
	slot9 = self._unit

	self._turret_unit.link(self._unit.sound_source(slot5), self._turret_unit, Idstring(self._turret_weapon))

	slot7 = self

	self._hide_hud_prompts(self._unit.sound_source(slot5))

	return 
end
function PlayerTurret:_enter(enter_data)
	if self._unit then
		slot4 = self._unit

		if self._unit.base(slot3).is_local_player then
			slot4 = self._unit
			self._unit_deploy_position = self._unit.position(slot3)
		end
	end

	return 
end
function PlayerTurret:get_camera_speed_limit()
	return self._camera_speed_limit
end
function PlayerTurret:_init_locators()
	slot3 = managers.player
	self._turret_unit = managers.player.get_turret_unit(slot2)

	if not self._turret_unit then
		slot4 = "PlayerTurret:_init_locators(): Missing turret unit."

		Application.trace(slot2, Application)

		return 
	end

	slot3 = self._unit
	slot3 = self._unit.camera(slot2)
	slot6 = "empty"

	self._unit.camera(slot2).play_redirect(slot2, Idstring(slot5))

	slot3 = self._unit
	slot3 = self._unit.inventory(slot2)

	self._unit.inventory(slot2).hide_equipped_unit(slot2)

	slot3 = self._unit

	self._unit.kill_mover(slot2)

	slot3 = self

	self._postion_player(slot2)

	slot3 = self._unit
	slot3 = self._unit.camera(slot2)
	slot3 = self._unit.camera(slot2).camera_unit(slot2)
	slot4 = self._camera_limit_v_mid

	self._unit.camera(slot2).camera_unit(slot2).base(slot2).set_pitch(slot2, self._unit.camera(slot2).camera_unit(slot2).base(slot2))

	slot3 = self._unit
	slot3 = self._unit.camera(slot2)
	slot3 = self._unit.camera(slot2).camera_unit(slot2)
	slot7 = self._camera_limit_v_mid

	self._unit.camera(slot2).camera_unit(slot2).base(slot2).set_limits(slot2, self._unit.camera(slot2).camera_unit(slot2).base(slot2), self._camera_limit_h, self._camera_limit_v, nil)

	return 
end
function PlayerTurret:_hide_hud_prompts()
	slot3 = managers.player
	slot3 = managers.player.local_player(slot2)
	slot3 = managers.player.local_player(slot2).inventory(slot2)
	slot3 = managers.player.local_player(slot2).inventory(slot2).equipped_unit(slot2)
	local player_equipped_unit_base = managers.player.local_player(slot2).inventory(slot2).equipped_unit(slot2).base(slot2)

	if player_equipped_unit_base.out_of_ammo then
		slot4 = player_equipped_unit_base
	elseif player_equipped_unit_base.can_reload then
		slot4 = player_equipped_unit_base

		if player_equipped_unit_base.can_reload(slot3) and player_equipped_unit_base.clip_empty then
			slot4 = player_equipped_unit_base

			if player_equipped_unit_base.clip_empty(slot3) then
				self._can_reload_prompt_hidden = true
			end
		end
	end

	slot5 = "hud_reload_prompt"

	managers.hud.hide_prompt(slot3, managers.hud)

	slot5 = "hud_no_ammo_prompt"

	managers.hud.hide_prompt(slot3, managers.hud)

	return 
end
function PlayerTurret:_show_hud_prompts()
	if self._out_of_ammo_prompt_hidden then
		slot4 = "hud_no_ammo_prompt"
		slot10 = "hint_no_ammo"

		managers.hud.set_prompt(slot2, managers.hud, utf8.to_upper(managers.localization.text(slot8, managers.localization)))

		self._out_of_ammo_prompt_hidden = false
	elseif self._can_reload_prompt_hidden then
		slot4 = "hud_reload_prompt"
		slot11 = {
			BTN_RELOAD = managers.localization.btn_macro(slot13, managers.localization)
		}
		slot15 = "reload"

		managers.hud.set_prompt(slot2, managers.hud, utf8.to_upper(managers.localization.text(slot8, managers.localization, "hint_reload")))

		self._can_reload_prompt_hidden = false
	end

	return 
end
function PlayerTurret:exit(state_data, new_state_name)
	slot7 = new_state_name

	PlayerTurret.super.exit(slot4, self, state_data or self._state_data)

	if self._firing then
		slot5 = managers.network
		slot7 = self._turret_unit

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_ground_turret_stop_autofire")
	end

	slot5 = self._unit
	local player_head_rotation = self._unit.movement(slot4).m_head_rot(slot4)
	slot6 = self._turret_weapon

	self._turret_weapon.on_player_exit(self._unit.movement(slot4))

	self._state_data.in_steelsight = nil
	slot6 = self

	self._interupt_action_exit_turret(nil)

	self._firing = false
	slot6 = self._unit
	slot6 = self._unit.camera(nil)
	slot6 = self._unit.camera(nil).camera_unit(nil)
	slot6 = self._unit.camera(nil).camera_unit(nil).base(nil)

	self._unit.camera(nil).camera_unit(nil).base(nil).remove_limits(nil)

	slot6 = self._unit
	slot6 = self._unit.camera(nil)
	slot6 = self._unit.camera(nil).camera_unit(nil)
	slot7 = 0

	self._unit.camera(nil).camera_unit(nil).base(nil).set_pitch(nil, self._unit.camera(nil).camera_unit(nil).base(nil))

	slot6 = self._unit

	self._unit.unlink(nil)

	slot6 = self._unit
	slot6 = self._unit.inventory(nil)

	self._unit.inventory(nil).show_equipped_unit(nil)

	slot6 = self._unit
	slot7 = self.IDS_EQUIP

	self._unit.camera(nil).play_redirect(nil, self._unit.camera(nil))

	if self._player_original_position then
		slot9 = self._unit
		slot8 = self._player_original_position

		self._unit.warp_to(slot5, self._unit, self._unit.rotation(slot8))
	end

	slot6 = self

	self._activate_mover(slot5, Idstring(slot8))

	slot6 = managers.network
	slot10 = self._turret_unit
	slot9 = self._turret_unit

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_ground_turret_rot", self._turret_unit.weapon("stand")._player_rotation)

	slot6 = self._turret_weapon

	self._turret_weapon.deactivate(slot5)

	slot7 = nil

	self._turret_weapon.set_weapon_user(slot5, self._turret_weapon)

	slot6 = self._turret_unit
	slot8 = true

	self._turret_unit.interaction(slot5).set_active(slot5, self._turret_unit.interaction(slot5), true)

	slot7 = self._turret_unit

	managers.hud.hide_turret_hud(slot5, managers.hud)

	slot6 = managers.network
	slot7 = self._unit
	local peer_id = managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)).id(slot5)
	slot8 = {
		peer_id = peer_id
	}

	managers.player.set_turret_data_for_peer(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)), managers.player)

	slot8 = true

	self._turret_weapon.enable_automatic_SO(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)), self._turret_weapon)

	slot7 = self

	self._show_hud_prompts(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)))

	slot7 = managers.player
	slot7 = managers.player.get_current_state(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)))._unit
	slot9 = true

	managers.player.get_current_state(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)))._unit.inventory(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5))).equip_selection(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)), managers.player.get_current_state(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)))._unit.inventory(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5))), self._weapon_index)

	slot7 = self._equipped_unit
	local weap_base = self._equipped_unit.base(managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5)))

	if weap_base._name_id == "dp28" then
		slot8 = weap_base

		weap_base.set_magazine_pos_based_on_ammo(slot7)
	end

	return 
end
function PlayerTurret:_husk_turret_data()
	slot3 = managers.network
	slot4 = self._unit
	local peer_id = managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2)).id(slot2)
	local husk_pos = self._turret_weapon._locator_tpp.position(managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2)))
	local turret_rot = self._turret_weapon._locator_fire.rotation(self._turret_weapon._locator_tpp)
	slot6 = self._turret_weapon
	local turret_weapon_name = self._turret_weapon.get_name_id(self._turret_weapon._locator_fire)
	local enter_animation = tweak_data.weapon[turret_weapon_name].anim_enter
	local exit_animation = tweak_data.weapon[turret_weapon_name].anim_exit
	slot10 = {
		peer_id = peer_id,
		husk_pos = husk_pos,
		turret_rot = turret_rot,
		enter_animation = enter_animation,
		exit_animation = exit_animation,
		turret_unit = self._turret_unit
	}

	managers.player.set_turret_data_for_peer(slot8, managers.player)

	slot9 = managers.network
	slot15 = self._turret_unit

	managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "sync_ground_turret_husk", husk_pos, turret_rot, enter_animation, exit_animation)

	return 
end
function PlayerTurret:update(t, dt)
	slot7 = dt

	PlayerTurret.super.update(slot4, self, t)

	slot5 = self._turret_weapon

	if not self._turret_weapon.active(slot4) then
		return 
	end

	slot5 = self

	self._reposition_player(slot4)

	slot7 = dt

	self._update_action_timers(slot4, self, t)

	slot6 = dt

	self._turret_weapon.set_turret_rot(slot4, self._turret_weapon)

	slot7 = self._m_pos.z
	local body_pos = Vector3(slot4, self._m_pos.x, self._m_pos.y)
	slot6 = self._unit
	slot6 = self._unit.movement(self._m_pos.x)
	local player_head_rotation = self._unit.movement(self._m_pos.x).m_head_rot(self._m_pos.x)

	if 1 < self._turret_sync_dt then
		slot7 = managers.network
		slot10 = self._turret_unit

		managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_ground_turret_rot", player_head_rotation)

		self._turret_sync_dt = 0
	else
		self._turret_sync_dt = self._turret_sync_dt + dt
	end

	if self._turret_weapon._overheated ~= self._turret_overheated then
		self._turret_overheated = self._turret_weapon._overheated

		if self._turret_overheated == true then
			slot8 = self._turret_unit

			managers.hud.player_turret_overheat(slot6, managers.hud)
		else
			slot7 = managers.hud

			managers.hud.player_turret_cooldown(slot6)
		end
	end

	slot7 = managers.hud
	slot10 = self._turret_weapon

	managers.hud.update_heat_indicator(slot6, self._turret_weapon.get_current_heat(slot9))

	return 
end
function PlayerTurret:set_tweak_data(name)
	return 
end
function PlayerTurret:_update_check_actions(t, dt)
	local input = self._get_input(slot4)
	slot9 = input

	self._check_stats_screen(self, self, t, dt)

	slot8 = input

	self._check_action_primary_attack(self, self, t)

	slot8 = input

	self._check_action_exit_turret(self, self, t)

	slot8 = input

	self._update_foley(self, self, t)

	slot8 = input

	self._check_warcry(self, self, t)

	return 
end
function PlayerTurret:_check_action_exit_turret(t, input)
	if input.btn_interact_press then
		slot6 = t

		self._start_action_exit_turret(slot4, self)
	end

	if input.btn_interact_release then
		slot5 = self

		self._interupt_action_exit_turret(slot4)
	end

	return 
end
function PlayerTurret:_start_action_exit_turret(t)
	slot4 = self

	self._end_action_exit_turret(slot3)

	return 
end
function PlayerTurret:_interupt_action_exit_turret()
	if self._exit_turret_expire_t then
		self._exit_turret_expire_t = nil
		slot3 = managers.hud

		managers.hud.hide_progress_timer_bar(slot2)

		slot3 = managers.hud

		managers.hud.remove_progress_timer(slot2)
	end

	return 
end
function PlayerTurret:_update_action_timers(t, dt)
	if self._exit_turret_expire_t then
		slot7 = self._exit_turret_timer

		managers.hud.set_progress_timer_bar_width(slot4, managers.hud, self._exit_turret_timer - self._exit_turret_expire_t - t)

		if self._exit_turret_expire_t <= t then
			slot5 = self

			self._end_action_exit_turret(slot4)

			self._exit_turret_expire_t = nil
		end
	end

	return 
end
function PlayerTurret:_end_action_exit_turret()
	if self._turret_weapon._moving then
		slot3 = self._turret_weapon

		self._turret_weapon.stop_moving_sound(slot2)
	end

	slot3 = self._unit
	slot4 = self.IDS_IDLE

	self._unit.camera(slot2).play_redirect(slot2, self._unit.camera(slot2))

	slot3 = managers.player

	managers.player.leave_turret(slot2)

	slot4 = "standard"

	managers.player.set_player_state(slot2, managers.player)

	return 
end
function PlayerTurret:interaction_blocked()
	return true
end
function PlayerTurret:_announce_cooldown()
	slot6 = managers.network
	slot6 = managers.network.session(slot5)
	slot4 = managers.network.session(slot5).local_peer(slot5)._id
	self._announce_shooting_clbk_id = "announce_shooting_" .. tostring(self._turret_weapon)
	local weapon_name = self._turret_weapon.get_name_id(tostring(self._turret_weapon))
	local cooldown_duration = tweak_data.weapon[weapon_name].announce_shooting_cooldown or {
		10,
		15
	}
	local cooldown_spread = cooldown_duration[2] - cooldown_duration[1]
	slot8 = cooldown_spread
	local final_cooldown = cooldown_duration[1] + math.random(slot6, 0)
	slot9 = self

	managers.queued_tasks.unqueue_all(slot6, managers.queued_tasks, self._announce_shooting_clbk_id)

	slot12 = final_cooldown

	managers.queued_tasks.queue(slot6, managers.queued_tasks, self._announce_shooting_clbk_id, self._enable_announcing, self, nil)

	return 
end
function PlayerTurret:_enable_announcing()
	self._announce_shooting = false

	return 
end
function PlayerTurret:_check_action_primary_attack(t, input)
	if not self._turret_weapon then
		return 
	end

	if self._turret_weapon._overheated then
		return 
	end

	local action_wanted = input.btn_primary_attack_state or input.btn_primary_attack_release

	if action_wanted then
		if input.btn_primary_attack_press then
			slot6 = self._turret_weapon

			self._turret_weapon.start_autofire(slot5)

			self._firing = true

			if not self._announce_shooting then
				slot6 = self._unit
				slot7 = "player_shooting_turret"
				local result = self._unit.sound_source(slot5).post_event(slot5, self._unit.sound_source(slot5))
				self._announce_shooting = true
				slot7 = self

				self._announce_cooldown(self._unit.sound_source(slot5))
			end

			slot6 = managers.network
			slot8 = self._turret_unit

			managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_ground_turret_start_autofire")
		end

		if input.btn_primary_attack_release then
			slot6 = self._turret_weapon

			self._turret_weapon.stop_autofire(slot5)

			self._firing = false
			slot6 = managers.network
			slot8 = self._turret_unit

			managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_ground_turret_stop_autofire")
		end

		if self._firing then
			slot11 = 1
			local fired = self._turret_weapon.trigger_held(slot5, self._turret_weapon, false, false, false, nil)

			if fired then
				slot7 = self._unit
				slot9 = 1 * self._shaker_multiplier

				self._unit.camera(slot6).play_shaker(slot6, self._unit.camera(slot6), "fire_weapon_rot")

				slot7 = self._unit
				slot11 = 0.15

				self._unit.camera(slot6).play_shaker(slot6, self._unit.camera(slot6), "fire_weapon_kick", 1 * self._shaker_multiplier, 1)
			end

			slot7 = managers.network
			slot14 = 0

			managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_ground_turret_trigger_held", self._turret_unit, false, false, false, nil)
		end
	end

	return 
end
function PlayerTurret:_check_stop_shooting()
	if self._shooting then
		slot3 = self._equipped_unit
		slot3 = self._equipped_unit.base(slot2)

		self._equipped_unit.base(slot2).stop_shooting(slot2)

		slot3 = self._camera_unit
		slot3 = self._camera_unit.base(slot2)
		slot6 = self._equipped_unit
		slot6 = self._equipped_unit.base(slot5)

		self._camera_unit.base(slot2).stop_shooting(slot2, self._equipped_unit.base(slot5).recoil_wait(slot5))

		local weap_base = self._equipped_unit.base(slot2)
		slot4 = weap_base
		local fire_mode = weap_base.fire_mode(self._equipped_unit)

		if fire_mode == "auto" then
			slot5 = self

			if not self._is_reloading(slot4) then
				slot5 = self

				if not self._is_meleeing(slot4) then
					slot5 = self._unit
					slot6 = self.IDS_RECOIL_EXIT

					self._unit.camera(slot4).play_redirect(slot4, self._unit.camera(slot4))
				end
			end
		end

		self._shooting = false
	end

	return 
end
function PlayerTurret:_check_step(t)
	return 
end
function PlayerTurret:_check_action_reload(t, input)
	return 
end
function PlayerTurret:_check_action_run(...)
	return 
end
function PlayerTurret:_check_use_item(t, input)
	return 
end
function PlayerTurret:_check_change_weapon(t, input)
	local new_action = nil
	local action_wanted = input.btn_switch_weapon_press

	if action_wanted then
		slot7 = self
		local action_forbidden = self._changing_weapon(slot6)
		action_forbidden = action_forbidden or self._use_item_expire_t or self._change_item_expire_t

		if not action_forbidden then
			slot8 = self._unit
			slot8 = self._unit.inventory(slot7)
			action_forbidden = self._unit.inventory(slot7).num_selections(slot7) == 1
		end

		if not action_forbidden then
			slot10 = "standard"

			self.exit(slot7, self, nil)

			slot9 = "standard"

			managers.player.set_player_state(slot7, managers.player)

			new_action = true
		end
	end

	return new_action
end
function PlayerTurret:_check_action_equip(t, input)
	local new_action = nil
	local selection_wanted = input.btn_primary_choice

	if selection_wanted then
		slot8 = "equip"
		local action_forbidden = self.chk_action_forbidden(slot6, self)

		if not action_forbidden then
			slot9 = selection_wanted

			if self._ext_inventory.is_selection_available(slot7, self._ext_inventory) then
				if not self._use_item_expire_t then
					slot8 = self
					action_forbidden = self._changing_weapon(slot7)

					if self._changing_weapon(slot7) then
						action_forbidden = false
					end
				end
			else
				action_forbidden = true
			end
		end

		if not action_forbidden then
			slot9 = selection_wanted
			local new_action = not self._ext_inventory.is_equipped(slot7, self._ext_inventory)

			if new_action then
				slot11 = "standard"

				self.exit(slot8, self, nil)

				slot10 = "standard"

				managers.player.set_player_state(slot8, managers.player)
			end
		end
	end

	return new_action
end
function PlayerTurret:_check_action_jump(t, input)
	local new_action = nil
	local action_wanted = input.btn_jump_press

	if action_wanted then
		local action_forbidden = self._jump_t and t < self._jump_t + 0.55

		if not action_forbidden then
			slot8 = self._unit
			slot8 = self._unit.base(slot7)
			action_forbidden = self._unit.base(slot7).stats_screen_visible(slot7) or self._state_data.in_air
		end

		if not action_forbidden then
			local action_start_data = {}
			local jump_vel_z = self._tweak_data.movement.jump_velocity.z
			action_start_data.jump_vel_z = jump_vel_z
			slot12 = "standard"

			self.exit(slot9, self, nil)

			slot11 = "standard"

			managers.player.set_player_state(slot9, managers.player)

			slot12 = action_start_data
			new_action = self._start_action_jump(slot9, self, t)
		end
	end

	return new_action
end
function PlayerTurret:_check_action_steelsight(t, input)
	return 
end
function PlayerTurret:_update_movement(t, dt)
	return 
end
function PlayerTurret:_get_max_walk_speed(...)
	return 0
end
function PlayerTurret:_get_walk_headbob(...)
	return 0
end
function PlayerTurret:_postion_player()
	slot3 = self._unit
	self._player_original_position = self._unit.position(slot2)
	local rot = self._turret_unit.rotation(slot2)
	slot5 = rot

	self._unit.set_rotation(self._turret_unit, self._unit)

	slot4 = self._turret_unit
	local pos = self._turret_unit.get_object(self._turret_unit, Idstring(slot6)).position(self._turret_unit)
	slot6 = pos

	self._unit.set_position(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)), self._unit)

	slot5 = self._unit
	slot6 = rot

	self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).set_rotation(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)), self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))))

	slot5 = self._unit
	slot6 = pos

	self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).set_position(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)), self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))))

	slot5 = self._unit
	slot5 = self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)))
	slot5 = self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).camera_unit(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)))
	slot8 = rot
	slot8 = rot.y("first_person_view")
	slot6 = rot.y("first_person_view").to_polar("first_person_view").spin

	self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).camera_unit(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).base(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).set_spin(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)), self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).camera_unit(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).base(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))))

	slot5 = self._unit
	slot5 = self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)))
	slot5 = self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).camera_unit(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)))
	slot6 = 0

	self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).camera_unit(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).base(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).set_pitch(self._turret_unit.get_object(self._turret_unit, Idstring(slot6)), self._unit.camera(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).camera_unit(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))).base(self._turret_unit.get_object(self._turret_unit, Idstring(slot6))))

	return 
end
function PlayerTurret:_reposition_player()
	slot3 = managers.raid_job

	if not managers.raid_job.current_level_id(slot2) then
		return 
	end

	slot3 = self._turret_unit
	slot6 = "first_person_view"
	local pos = self._turret_unit.get_object(slot2, Idstring(slot5)).position(slot2)
	slot4 = self._unit

	if self._unit.position(self._turret_unit.get_object(slot2, Idstring(slot5))) ~= pos then
		slot5 = pos

		self._unit.set_position(slot3, self._unit)

		slot4 = self._unit
		slot5 = pos

		self._unit.camera(slot3).set_position(slot3, self._unit.camera(slot3))
	end

	return 
end
function PlayerTurret:pre_destroy(unit)
	return 
end
function PlayerTurret:destroy()
	return 
end
function PlayerTurret:_debug_draw_positions()
	slot7 = self._turret_unit
	slot9 = self._turret_unit
	slot9 = self._turret_unit.rotation(slot8)
	slot11 = self._turret_unit
	slot11 = self._turret_unit.rotation(slot10)
	slot13 = self._turret_unit
	slot13 = self._turret_unit.rotation(slot12)
	slot13 = self._turret_unit.rotation(slot12).y(slot12)
	slot15 = self._unit
	slot15 = self._unit.movement(slot14)
	slot17 = self._unit
	slot17 = self._unit.movement(slot16)
	slot17 = self._unit.movement(slot16).m_head_rot(slot16)
	slot19 = self._unit
	slot19 = self._unit.movement(slot18)
	slot19 = self._unit.movement(slot18).m_head_rot(slot18)
	slot21 = self._unit
	slot21 = self._unit.movement(slot20)
	slot21 = self._unit.movement(slot20).m_head_rot(slot20)
	slot21 = self._unit.movement(slot20).m_head_rot(slot20).y(slot20)
	slot23 = self._joint_heading
	slot25 = self._joint_heading
	slot25 = self._joint_heading.rotation(slot24)
	slot27 = self._joint_heading
	slot27 = self._joint_heading.rotation(slot26)
	slot29 = self._joint_heading
	slot29 = self._joint_heading.rotation(slot28)
	slot29 = self._joint_heading.rotation(slot28).y(slot28)
	slot31 = self._joint_heading
	slot33 = self._joint_heading
	slot33 = self._joint_heading.local_rotation(slot32)
	slot35 = self._joint_heading
	slot35 = self._joint_heading.local_rotation(slot34)
	slot37 = self._joint_heading
	slot37 = self._joint_heading.local_rotation(slot36)
	slot37 = self._joint_heading.local_rotation(slot36).y(slot36)
	slot39 = self._joint_pitch
	slot41 = self._joint_pitch
	slot41 = self._joint_pitch.local_rotation(slot40)
	slot43 = self._joint_pitch
	slot43 = self._joint_pitch.local_rotation(slot42)
	slot45 = self._joint_pitch
	slot45 = self._joint_pitch.local_rotation(slot44)
	slot45 = self._joint_pitch.local_rotation(slot44).y(slot44)
	slot43 = self._joint_pitch.local_rotation(slot44).y(slot44).to_polar(slot44).spin

	Application.trace(slot2, Application, [[

-----
PlayerTurret:_postion_player 
 turret rot ]], self._turret_unit.rotation(slot6), "\n turret yaw: ", self._turret_unit.rotation(slot8).yaw(slot8), "\n turret y: ", self._turret_unit.rotation(slot10).y(slot10), "\n turret spin: ", self._turret_unit.rotation(slot12).y(slot12).to_polar(slot12).spin, "\n\n player rot: ", self._unit.movement(slot14).m_head_rot(slot14), "\n player yaw: ", self._unit.movement(slot16).m_head_rot(slot16).yaw(slot16), "\n player y: ", self._unit.movement(slot18).m_head_rot(slot18).y(slot18), "\n player spin: ", self._unit.movement(slot20).m_head_rot(slot20).y(slot20).to_polar(slot20).spin, "\n\n joint heading rot: ", self._joint_heading.rotation(slot22), "\n joint heading yaw: ", self._joint_heading.rotation(slot24).yaw(slot24), "\n joint heading y: ", self._joint_heading.rotation(slot26).y(slot26), "\n joint heading spin: ", self._joint_heading.rotation(slot28).y(slot28).to_polar(slot28).spin, "\n\n joint local heading rot: ", self._joint_heading.local_rotation(slot30), "\n joint local heading yaw: ", self._joint_heading.local_rotation(slot32).yaw(slot32), "\n joint local heading y: ", self._joint_heading.local_rotation(slot34).y(slot34), "\n joint local heading spin: ", self._joint_heading.local_rotation(slot36).y(slot36).to_polar(slot36).spin, "\n\n joint local pitch rot: ", self._joint_pitch.local_rotation(slot38), "\n joint local pitch yaw: ", self._joint_pitch.local_rotation(slot40).yaw(slot40), "\n joint local pitch y: ", self._joint_pitch.local_rotation(slot42).y(slot42), "\n joint local pitch spin: ")

	return 
end

return 
