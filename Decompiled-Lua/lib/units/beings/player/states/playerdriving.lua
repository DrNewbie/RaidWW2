-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not PlayerDriving then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerDriving = slot0
slot3 = "steering_wheel_left"
PlayerDriving.IDS_STEER_LEFT_REDIRECT = Idstring(slot2)
slot3 = "fps/wheel_turn_left"
PlayerDriving.IDS_STEER_LEFT_STATE = Idstring(slot2)
slot3 = "steering_wheel_right"
PlayerDriving.IDS_STEER_RIGHT_REDIRECT = Idstring(slot2)
slot3 = "fps/wheel_turn_right"
PlayerDriving.IDS_STEER_RIGHT_STATE = Idstring(slot2)
slot3 = "steering_wheel_idle"
PlayerDriving.IDS_STEER_IDLE_REDIRECT = Idstring(slot2)
slot3 = "passenger_vehicle"
PlayerDriving.IDS_PASSENGER_REDIRECT = Idstring(slot2)
slot3 = "equip"
PlayerDriving.IDS_EQUIP = Idstring(slot2)
PlayerDriving.EXIT_VEHICLE_TIMER = 0.4
PlayerDriving.STANCE_NORMAL = 0
PlayerDriving.STANCE_SHOOTING = 1
function PlayerDriving:init(unit)
	slot5 = unit

	PlayerDriving.super.init(slot3, self)

	self._vehicle = nil
	self._dt = 0
	self._move_x = 0
	self._stance = PlayerDriving.STANCE_NORMAL
	self._wheel_idle = false
	self._respawn_hint_shown = false

	return 
end
function PlayerDriving:enter(state_data, enter_data)
	slot5 = "PlayerDriving:enter( enter_data )"

	print(slot4)

	slot6 = false

	managers.viewport.skip_update_env_on_first_viewport(slot4, managers.viewport)

	slot7 = enter_data

	PlayerDriving.super.enter(slot4, self, state_data)

	slot5 = self

	self._hide_hud_prompts(slot4)

	slot5 = managers.viewport

	if managers.viewport.first_active_viewport(slot4) then
		slot5 = self._vehicle_unit
		slot5 = self._vehicle_unit.camera(slot4)

		self._vehicle_unit.camera(slot4).setup(slot4)
	end

	return 
end
function PlayerDriving:_enter(enter_data)
	slot4 = self

	self._get_vehicle(slot3)

	if self._vehicle == nil then
		slot4 = "[DRIVING] No vehicle found"

		print(slot3)

		return 
	end

	slot4 = self._vehicle_ext

	if self._vehicle_ext.get_view(slot3) == nil then
		slot4 = "[DRIVING] No vehicle view point found"

		print(slot3)

		return 
	end

	slot5 = self._unit
	self._seat = self._vehicle_ext.find_seat_for_player(slot3, self._vehicle_ext)
	slot5 = self._seat

	self._position_player_on_seat(slot3, self)

	slot4 = self._unit
	slot6 = {
		"equip"
	}
	slot11 = "on_inventory_event"

	self._unit.inventory(slot3).add_listener(slot3, self._unit.inventory(slot3), "PlayerDriving", callback(slot8, self, self))

	slot4 = self._unit
	slot4 = self._unit.inventory(slot3)
	self._current_weapon = self._unit.inventory(slot3).equipped_unit(slot3)

	if self._current_weapon then
		slot4 = self._current_weapon

		if self._current_weapon.base(slot3)._setup then
			slot6 = self._current_weapon
			slot5 = self._vehicle_unit

			table.insert(slot3, self._current_weapon.base(slot5)._setup.ignore_units)
		end
	end

	slot4 = self

	self._setup(slot3)

	slot4 = self._unit
	slot7 = 0

	self._unit.camera(slot3).set_shaker_parameter(slot3, self._unit.camera(slot3), "breathing", "amplitude")

	local fov = self._seat.fov or self._vehicle_ext._tweak_data.fov

	if fov then
		slot5 = self._unit
		slot5 = self._unit.camera(slot4)._camera_unit
		slot7 = 0.33

		self._unit.camera(slot4)._camera_unit.base(slot4).animate_fov(slot4, self._unit.camera(slot4)._camera_unit.base(slot4), fov)
	end

	slot7 = fov

	Application.trace(slot4, Application, "[PlayerDriving:_enter] Setting FOV:  ")

	slot5 = self._unit
	slot5 = self._unit.base(slot4)
	self._controller = self._unit.base(slot4).controller(slot4)
	slot6 = "driving"

	managers.controller.set_ingame_mode(slot4, managers.controller)

	slot5 = self

	self._upd_attention(slot4)

	return 
end
function PlayerDriving:_setup()
	self._wheel_idle = false

	if self._seat.driving then
		slot4 = "seat"

		self._set_camera_limits(slot2, self)

		slot3 = self._vehicle_unit
		slot4 = "local_driving_enter"

		if self._vehicle_unit.damage(slot2).has_sequence(slot2, self._vehicle_unit.damage(slot2)) then
			slot3 = self._vehicle_unit
			slot4 = "local_driving_enter"

			self._vehicle_unit.damage(slot2).run_sequence(slot2, self._vehicle_unit.damage(slot2))
		end

		slot3 = self._camera_unit
		slot5 = 1

		self._camera_unit.anim_state_machine(slot2).set_global(slot2, self._camera_unit.anim_state_machine(slot2), self._vehicle_ext._tweak_data.animations.vehicle_id)
	else
		slot3 = self._vehicle_unit
		slot4 = "local_driving_exit"

		if self._vehicle_unit.damage(slot2).has_sequence(slot2, self._vehicle_unit.damage(slot2)) then
			slot3 = self._vehicle_unit
			slot4 = "local_driving_exit"

			self._vehicle_unit.damage(slot2).run_sequence(slot2, self._vehicle_unit.damage(slot2))
		end

		slot4 = "seat"

		self._set_camera_limits(slot2, self)

		if not self._seat.allow_shooting then
			slot3 = self._unit
			slot4 = self.IDS_PASSENGER_REDIRECT

			self._unit.camera(slot2).play_redirect(slot2, self._unit.camera(slot2))
		end

		slot3 = self._camera_unit
		slot5 = 0

		self._camera_unit.anim_state_machine(slot2).set_global(slot2, self._camera_unit.anim_state_machine(slot2), self._vehicle_ext._tweak_data.animations.vehicle_id)
	end

	return 
end
function PlayerDriving:exit(state_data, new_state_name)
	slot5 = "[DRIVING] PlayerDriving: Exiting vehicle"

	print(slot4)

	slot5 = self._vehicle_ext

	self._vehicle_ext.stop_horn_sound(slot4)

	slot6 = false

	managers.viewport.skip_update_env_on_first_viewport(slot4, managers.viewport)

	slot7 = new_state_name

	PlayerDriving.super.exit(slot4, self, state_data)

	slot5 = self._vehicle_unit

	if self._vehicle_unit.camera(slot4) then
		slot5 = self._vehicle_unit
		slot6 = self._unit

		self._vehicle_unit.camera(slot4).deactivate(slot4, self._vehicle_unit.camera(slot4))
	end

	slot5 = self

	self._interupt_action_exit_vehicle(slot4)

	slot5 = self

	self._interupt_action_steelsight(slot4)

	slot5 = managers.blackmarket
	local projectile_entry = managers.blackmarket.equipped_projectile(slot4)

	if tweak_data.projectiles[projectile_entry].is_a_grenade then
		slot6 = self

		self._interupt_action_throw_grenade(slot5)
	else
		slot6 = self

		self._interupt_action_throw_projectile(slot5)
	end

	slot6 = self

	self._interupt_action_reload(slot5)

	slot6 = self

	self._interupt_action_charging_weapon(slot5)

	slot6 = self

	self._interupt_action_melee(slot5)

	slot7 = self._unit
	local exit = self._vehicle_ext.find_exit_position(slot5, self._vehicle_ext)

	if not exit then
		exit = {}
		slot10 = 180
		exit.position = self._unit.position(slot6) + Vector3(self._unit, 0, 0)
		slot7 = self._unit
		exit.rotation = self._unit.rotation(Vector3(self._unit, 0, 0))
	end

	slot8 = exit.rotation

	self._unit.set_rotation(slot6, self._unit)

	slot7 = self._unit
	slot8 = exit.rotation

	self._unit.camera(slot6).set_rotation(slot6, self._unit.camera(slot6))

	local pos = exit.position + Vector3(self._unit.camera(slot6), 0, 0)
	slot9 = pos

	self._unit.set_position(self._unit.camera(slot6), self._unit)

	slot8 = self._unit
	slot9 = pos

	self._unit.camera(self._unit.camera(slot6)).set_position(self._unit.camera(slot6), self._unit.camera(self._unit.camera(slot6)))

	slot8 = self._unit
	slot8 = self._unit.camera(self._unit.camera(slot6))
	slot8 = self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6))
	slot11 = exit.rotation
	slot11 = exit.rotation.y(30)
	slot9 = exit.rotation.y(30).to_polar(30).spin

	self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6)).base(self._unit.camera(slot6)).set_spin(self._unit.camera(slot6), self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6)).base(self._unit.camera(slot6)))

	slot8 = self._unit
	slot8 = self._unit.camera(self._unit.camera(slot6))
	slot8 = self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6))
	slot9 = 0

	self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6)).base(self._unit.camera(slot6)).set_pitch(self._unit.camera(slot6), self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6)).base(self._unit.camera(slot6)))

	slot8 = self._unit
	slot8 = self._unit.camera(self._unit.camera(slot6))
	slot8 = self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6))
	slot9 = 0

	self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6)).base(self._unit.camera(slot6)).set_target_tilt(self._unit.camera(slot6), self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6)).base(self._unit.camera(slot6)))

	slot8 = self._unit
	slot8 = self._unit.camera(self._unit.camera(slot6))
	slot8 = self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6))
	self._unit.camera(self._unit.camera(slot6)).camera_unit(self._unit.camera(slot6)).base(self._unit.camera(slot6)).bipod_location = nil
	slot8 = self._vehicle_unit
	slot9 = "local_driving_exit"

	if self._vehicle_unit.damage(nil).has_sequence(nil, self._vehicle_unit.damage(nil)) then
		slot8 = self._vehicle_unit
		slot9 = "local_driving_exit"

		self._vehicle_unit.damage(slot7).run_sequence(slot7, self._vehicle_unit.damage(slot7))
	end

	if not self._seat.allow_shooting then
		slot8 = self._unit
		slot8 = self._unit.inventory(slot7)

		self._unit.inventory(slot7).show_equipped_unit(slot7)
	end

	slot8 = self._unit
	slot9 = self.IDS_EQUIP

	self._unit.camera(slot7).play_redirect(slot7, self._unit.camera(slot7))
	managers.player.exit_vehicle(slot7)

	self._dye_risk = nil
	self._state_data.in_air = false
	self._stance = PlayerDriving.STANCE_NORMAL
	local exit_data = {
		skip_equip = true
	}
	slot9 = self._unit
	local velocity = self._unit.mover(managers.player).velocity(managers.player)
	slot12 = velocity

	self._activate_mover(self._unit.mover(managers.player), self, PlayerStandard.MOVER_STAND)

	slot12 = 1

	self._ext_network.send(self._unit.mover(managers.player), self._ext_network, "set_pose")

	slot10 = self._unit
	slot11 = "PlayerDriving"

	self._unit.inventory(self._unit.mover(managers.player)).remove_listener(self._unit.mover(managers.player), self._unit.inventory(self._unit.mover(managers.player)))

	if self._current_weapon then
		slot10 = self._current_weapon

		if self._current_weapon.base(slot9)._setup then
			slot12 = self._current_weapon
			slot11 = self._vehicle_unit

			table.delete(slot9, self._current_weapon.base(slot11)._setup.ignore_units)
		end
	end

	slot10 = self

	self._upd_attention(slot9)

	slot10 = self

	self._remove_camera_limits(slot9)

	slot10 = self._camera_unit
	slot12 = 0.33

	self._camera_unit.base(slot9).animate_fov(slot9, self._camera_unit.base(slot9), 75)

	slot10 = self._camera_unit
	slot12 = 0

	self._camera_unit.anim_state_machine(slot9).set_global(slot9, self._camera_unit.anim_state_machine(slot9), self._vehicle_ext._tweak_data.animations.vehicle_id)

	slot11 = "main"

	managers.controller.set_ingame_mode(slot9, managers.controller)

	slot10 = self

	self._show_hud_prompts(slot9)

	return exit_data
end
function PlayerDriving:_hide_hud_prompts()
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
function PlayerDriving:_show_hud_prompts()
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
function PlayerDriving:update(t, dt)
	slot5 = self._unit
	slot5 = self._unit.base(slot4)
	self._controller = self._unit.base(slot4).controller(slot4)
	slot5 = self._vehicle_unit

	if not alive(slot4) then
		return 
	end

	if self._vehicle == nil then
		slot5 = "[DRIVING] No in a vehicle"

		print(slot4)

		return 
	else
		slot5 = self._vehicle

		if not self._vehicle.is_active(slot4) then
			slot5 = "[DRIVING] The vehicle is not active"

			print(slot4)

			return 
		end
	end

	if self._controller == nil then
		slot5 = "[DRIVING] No controller available"

		print(slot4)

		return 
	end

	slot6 = dt

	self._update_input(slot4, self)

	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot8 = dt

	self._calculate_standard_variables(self, self, t)

	slot6 = self

	self._update_ground_ray(self)

	slot6 = self

	self._update_fwd_ray(self)

	slot8 = input

	self._check_action_rear_cam(self, self, t)

	slot8 = input

	self._update_hud(self, self, t)

	slot8 = input

	self._update_action_timers(self, self, t)

	slot8 = input

	self._check_action_exit_vehicle(self, self, t)

	if self._seat.driving then
		slot9 = input

		self._update_check_actions_driver(slot5, self, t, dt)
	elseif self._seat.allow_shooting or self._stance == PlayerDriving.STANCE_SHOOTING then
		slot9 = input

		self._update_check_actions_passenger(slot5, self, t, dt)
	else
		slot9 = input

		self._update_check_actions_passenger_no_shoot(slot5, self, t, dt)
	end

	slot6 = self

	self._upd_nav_data(slot5)

	return 
end
function PlayerDriving:set_tweak_data(name)
	return 
end
function PlayerDriving:_update_hud(t, dt)
	if self._vehicle_ext.respawn_available then
		if not self._respawn_hint_shown and self._seat.driving then
			local string_macros = {}
			slot7 = string_macros

			BaseInteractionExt._add_string_macros(slot5, BaseInteractionExt)

			slot8 = string_macros
			local text = managers.localization.text(slot5, managers.localization, "hud_int_press_respawn")
			self._respawn_hint_shown = true
			slot8 = {
				text = text
			}

			managers.hud.show_interact(managers.localization, managers.hud)
		end
	elseif self._respawn_hint_shown then
		slot5 = managers.hud

		managers.hud.remove_interact(slot4)

		self._respawn_hint_shown = false
	end

	return 
end
function PlayerDriving:_update_check_actions_driver(t, dt, input)
	slot6 = managers.menu

	if managers.menu.is_pc_controller(slot5) then
		if input.btn_primary_attack_press then
			slot6 = self._vehicle_ext

			self._vehicle_ext.play_horn_sound(slot5)
		elseif input.btn_primary_attack_release then
			slot6 = self._vehicle_ext

			self._vehicle_ext.stop_horn_sound(slot5)
		end
	end

	slot9 = input

	self._check_stats_screen(slot5, self, t, dt)

	return 
end
function PlayerDriving:_update_check_actions_passenger(t, dt, input)
	slot8 = dt

	self._update_check_actions(slot5, self, t)

	slot8 = input

	self._check_action_shooting_stance(slot5, self, t)

	return 
end
function PlayerDriving:_update_check_actions_passenger_no_shoot(t, dt, input)
	slot9 = input

	self._check_stats_screen(slot5, self, t, dt)

	slot8 = input

	self._check_action_shooting_stance(slot5, self, t)

	return 
end
function PlayerDriving:_check_warcry(t, input)
	return 
end
function PlayerDriving:on_action_reload_success()
	self._can_reload_prompt_hidden = false

	return 
end
function PlayerDriving:_check_action_jump(t, input)
	return false
end
function PlayerDriving:_check_action_interact(t, input)
	return false
end
function PlayerDriving:_check_action_duck()
	return false
end
function PlayerDriving:interaction_blocked()
	return true
end
function PlayerDriving:_check_action_shooting_stance(t, input)
	slot5 = self._vehicle_ext

	if self._vehicle_ext.shooting_stance_allowed(slot4) then
		slot5 = self._vehicle_ext

		if not self._vehicle_ext.shooting_stance_mandatory(slot4) and input.btn_vehicle_shooting_stance_press then
			slot5 = self

			self._check_stop_shooting(slot4)

			if self._seat.shooting_pos and self._seat.has_shooting_mode then
				slot5 = self._unit
				slot5 = self._unit.base(slot4)

				if not self._unit.base(slot4).stats_screen_visible(slot4) then
					slot5 = self

					self._interupt_action_reload(slot4)

					if self._stance == PlayerDriving.STANCE_NORMAL then
						slot5 = self

						self.enter_shooting_stance(slot4)
					else
						slot5 = self

						self.exit_shooting_stance(slot4)
					end
				end
			end
		end
	else
		slot5 = self._vehicle_ext

		if self._vehicle_ext.shooting_stance_mandatory(slot4) then
		elseif self._stance == PlayerDriving.STANCE_SHOOTING then
			slot5 = self

			self.exit_shooting_stance(slot4)
		end
	end

	return 
end
function PlayerDriving:enter_shooting_stance()
	self._stance = PlayerDriving.STANCE_SHOOTING
	slot3 = self

	self._position_player_on_seat(slot2)

	slot4 = "shooting"

	self._set_camera_limits(slot2, self)

	slot3 = self._unit
	slot3 = self._unit.inventory(slot2)

	self._unit.inventory(slot2).show_equipped_unit(slot2)

	slot3 = self._unit
	slot4 = self.IDS_EQUIP

	self._unit.camera(slot2).play_redirect(slot2, self._unit.camera(slot2))

	slot5 = self._stance

	self._ext_network.send(slot2, self._ext_network, "sync_vehicle_change_stance")

	return 
end
function PlayerDriving:exit_shooting_stance()
	self._stance = PlayerDriving.STANCE_NORMAL
	slot4 = self._seat

	self._position_player_on_seat(slot2, self)

	slot4 = "seat"

	self._set_camera_limits(slot2, self)

	slot3 = self

	self._apply_allowed_shooting(slot2)

	slot5 = self._stance

	self._ext_network.send(slot2, self._ext_network, "sync_vehicle_change_stance")

	return 
end
function PlayerDriving:_apply_allowed_shooting()
	if not self._seat.allow_shooting then
		slot3 = managers.player
		local t = managers.player.player_timer(slot2).time(slot2)
		slot4 = self

		self._interupt_action_steelsight(managers.player.player_timer(slot2))

		slot4 = managers.blackmarket
		local projectile_entry = managers.blackmarket.equipped_projectile(managers.player.player_timer(slot2))

		if tweak_data.projectiles[projectile_entry].is_a_grenade then
			slot6 = t

			self._interupt_action_throw_grenade(slot4, self)
		else
			slot6 = t

			self._interupt_action_throw_projectile(slot4, self)
		end

		slot6 = t

		self._interupt_action_reload(slot4, self)

		slot6 = t

		self._interupt_action_charging_weapon(slot4, self)

		slot6 = t

		self._interupt_action_melee(slot4, self)

		slot6 = t

		self._interupt_action_use_item(slot4, self)

		slot5 = self._unit
		slot6 = self.IDS_PASSENGER_REDIRECT

		self._unit.camera(slot4).play_redirect(slot4, self._unit.camera(slot4))

		slot5 = self._unit
		slot8 = 0

		self._unit.camera(slot4).set_shaker_parameter(slot4, self._unit.camera(slot4), "breathing", "amplitude")
	else
		slot3 = self._unit
		slot3 = self._unit.inventory(slot2)

		self._unit.inventory(slot2).show_equipped_unit(slot2)

		slot3 = self._unit
		slot4 = self.IDS_EQUIP

		self._unit.camera(slot2).play_redirect(slot2, self._unit.camera(slot2))
	end

	slot4 = "driving"

	managers.controller.set_ingame_mode(slot2, managers.controller)

	return 
end
function PlayerDriving:_check_action_exit_vehicle(t, input)
	if input.btn_vehicle_exit_press then
		if self._vehicle_ext.respawn_available then
			if self._seat.driving then
				slot5 = self._vehicle_ext

				self._vehicle_ext.respawn_vehicle(slot4)
			else
				slot6 = t

				self._start_action_exit_vehicle(slot4, self)
			end
		else
			slot6 = t

			self._start_action_exit_vehicle(slot4, self)
		end
	end

	if input.btn_vehicle_exit_release then
		slot5 = self

		self._interupt_action_exit_vehicle(slot4)
	end

	return 
end
function PlayerDriving:_start_action_exit_vehicle(t)
	slot4 = self._vehicle_ext

	if not self._vehicle_ext.allow_exit(slot3) then
		return 
	end

	slot4 = self

	if self.is_deploying(slot3) then
		return 
	end

	local deploy_timer = PlayerDriving.EXIT_VEHICLE_TIMER
	self._exit_vehicle_expire_t = t + deploy_timer
	slot8 = "hud_action_exit_vehicle"
	local text = utf8.to_upper(managers.localization.text(slot6, managers.localization))
	slot9 = text

	managers.hud.show_progress_timer_bar(managers.localization.text, managers.hud, 0, deploy_timer)

	return 
end
function PlayerDriving:_interacting()
	slot3 = self

	return PlayerDriving.super._interacting(slot2) or self._exit_vehicle_expire_t
end
function PlayerDriving:_interupt_action_exit_vehicle(t, input, complete)
	if self._exit_vehicle_expire_t then
		self._exit_vehicle_expire_t = nil
		slot7 = complete

		managers.hud.hide_progress_timer_bar(slot5, managers.hud)
	end

	return 
end
function PlayerDriving:_update_action_timers(t, input)
	if self._exit_vehicle_expire_t then
		local deploy_timer = PlayerDriving.EXIT_VEHICLE_TIMER
		slot8 = deploy_timer

		managers.hud.set_progress_timer_bar_width(slot5, managers.hud, deploy_timer - self._exit_vehicle_expire_t - t)

		if self._exit_vehicle_expire_t <= t then
			slot6 = self

			self._end_action_exit_vehicle(slot5)

			self._exit_vehicle_expire_t = nil
		end
	end

	return 
end
function PlayerDriving:_end_action_exit_vehicle()
	slot4 = true

	managers.hud.hide_progress_timer_bar(slot2, managers.hud)

	slot3 = self

	self.cb_leave(slot2)

	return 
end
function PlayerDriving:_check_action_change_camera(t, input)
	return 
end
function PlayerDriving:_check_action_rear_cam(t, input)
	if not self._seat.driving then
		return 
	end

	slot5 = self._vehicle_unit

	if not self._vehicle_unit.camera(slot4) then
		return 
	end

	if input.btn_vehicle_rear_view_press then
		slot5 = self._vehicle_unit
		slot7 = self._unit

		self._vehicle_unit.camera(slot4).set_rear_cam_active(slot4, self._vehicle_unit.camera(slot4), true)
	elseif input.btn_vehicle_rear_view_release then
		slot5 = self._vehicle_unit
		slot7 = self._unit

		self._vehicle_unit.camera(slot4).set_rear_cam_active(slot4, self._vehicle_unit.camera(slot4), false)
	end

	return 
end
function PlayerDriving:_check_action_run(...)
	return 
end
function PlayerDriving:pre_destroy(unit)
	return 
end
function PlayerDriving:stance()
	return self._stance
end
function PlayerDriving:_set_camera_limits(mode)
	if mode == "seat" then
		if self._seat.camera_limits then
			slot4 = self._camera_unit
			slot6 = self._seat.camera_limits[2]

			self._camera_unit.base(slot3).set_limits(slot3, self._camera_unit.base(slot3), self._seat.camera_limits[1])
		else
			slot4 = self._camera_unit
			slot6 = 20

			self._camera_unit.base(slot3).set_limits(slot3, self._camera_unit.base(slot3), 60)
		end
	elseif mode == "shooting" then
		slot4 = self._camera_unit
		slot6 = 40

		self._camera_unit.base(slot3).set_limits(slot3, self._camera_unit.base(slot3), nil)
	end

	return 
end
function PlayerDriving:_remove_camera_limits()
	slot3 = self._unit
	slot3 = self._unit.camera(slot2)
	slot3 = self._unit.camera(slot2).camera_unit(slot2)
	slot3 = self._unit.camera(slot2).camera_unit(slot2).base(slot2)

	self._unit.camera(slot2).camera_unit(slot2).base(slot2).remove_limits(slot2)

	return 
end
function PlayerDriving:_position_player_on_seat(seat)
	local rot = self._seat.object.rotation(slot3)
	slot6 = rot

	self._unit.set_rotation(self._seat.object, self._unit)

	local pos = self._seat.object.position(self._seat.object) + VehicleDrivingExt.PLAYER_CAPSULE_OFFSET
	slot7 = pos

	self._unit.set_position(self._seat.object, self._unit)

	slot6 = self._unit
	slot7 = rot

	self._unit.camera(self._seat.object).set_rotation(self._seat.object, self._unit.camera(self._seat.object))

	slot6 = self._unit
	slot7 = pos

	self._unit.camera(self._seat.object).set_position(self._seat.object, self._unit.camera(self._seat.object))

	slot6 = self._unit
	slot6 = self._unit.camera(self._seat.object)
	slot6 = self._unit.camera(self._seat.object).camera_unit(self._seat.object)
	slot7 = 90

	self._unit.camera(self._seat.object).camera_unit(self._seat.object).base(self._seat.object).set_spin(self._seat.object, self._unit.camera(self._seat.object).camera_unit(self._seat.object).base(self._seat.object))

	slot6 = self._unit
	slot6 = self._unit.camera(self._seat.object)
	slot6 = self._unit.camera(self._seat.object).camera_unit(self._seat.object)
	slot7 = 0

	self._unit.camera(self._seat.object).camera_unit(self._seat.object).base(self._seat.object).set_pitch(self._seat.object, self._unit.camera(self._seat.object).camera_unit(self._seat.object).base(self._seat.object))

	return 
end
function PlayerDriving:_move_to_next_seat()
	slot4 = self._vehicle_unit

	managers.player.move_to_next_seat(slot2, managers.player)

	slot3 = self._vehicle_ext

	self._vehicle_ext.stop_horn_sound(slot2)

	if self._equipped_unit and self._equipped_unit.base then
		slot3 = self._equipped_unit

		if self._equipped_unit.base(slot2) then
			slot3 = self._equipped_unit

			if self._equipped_unit.base(slot2).shooting then
				slot3 = self._equipped_unit
				slot3 = self._equipped_unit.base(slot2)

				if self._equipped_unit.base(slot2).shooting(slot2) then
					slot3 = self

					self._check_stop_shooting(slot2)
				end
			end
		end
	end

	return 
end
function PlayerDriving:sync_move_to_next_seat()
	slot4 = self._unit
	self._seat = self._vehicle_ext.find_seat_for_player(slot2, self._vehicle_ext)
	slot3 = self

	self.exit_shooting_stance(slot2)

	slot3 = self._vehicle_unit
	slot5 = self._unit

	self._vehicle_unit.camera(slot2).set_rear_cam_active(slot2, self._vehicle_unit.camera(slot2), false)

	slot3 = self

	self._setup(slot2)

	slot3 = self

	self._apply_allowed_shooting(slot2)

	return 
end
function PlayerDriving:destroy()
	return 
end
function PlayerDriving:_get_vehicle()
	slot3 = managers.player
	self._vehicle_unit = managers.player.get_vehicle(slot2).vehicle_unit

	if self._vehicle_unit == nil then
		slot3 = "[DRIVING] no vehicles found in the scene"

		print(slot2)

		return 
	end

	slot3 = self._vehicle_unit
	self._vehicle_ext = self._vehicle_unit.vehicle_driving(slot2)
	slot3 = self._vehicle_unit
	self._vehicle = self._vehicle_unit.vehicle(slot2)

	return 
end
function PlayerDriving:cb_leave()
	slot4 = self._unit
	local exit_position = self._vehicle_ext.find_exit_position(slot2, self._vehicle_ext)

	if exit_position == nil then
		slot4 = "[DRIVING] PlayerDriving: Could not found valid exit position, aborting exit."

		print(slot3)

		slot5 = {
			duration = 3,
			shelf_life = 5,
			id = "hint_cant_exit_vehicle",
			text = managers.localization.text(slot7, managers.localization)
		}
		slot9 = "hint_cant_exit_vehicle"

		managers.notification.add_notification(slot3, managers.notification)

		return 
	end

	local vehicle_state = self._vehicle.get_state(slot3)
	local speed = vehicle_state.get_speed(self._vehicle) * 3.6
	local player = managers.player.player_unit(vehicle_state)
	slot7 = self._unit
	slot8 = self.IDS_IDLE

	self._unit.camera(managers.player).play_redirect(managers.player, self._unit.camera(managers.player))

	slot8 = "standard"

	managers.player.set_player_state(managers.player, managers.player)

	return 
end
function PlayerDriving:_update_input(dt)
	slot4 = self._controller
	local pressed = self._controller.get_any_input(slot3)

	if pressed then
		slot6 = "vehicle_change_seat"
		local btn_vehicle_change_seat = self._controller.get_input_pressed(slot4, self._controller)
	end

	if btn_vehicle_change_seat then
		slot6 = self

		self._interupt_action_reload(slot5)

		slot6 = self

		self._move_to_next_seat(slot5)
	end

	if not self._seat.driving then
		return 
	end

	slot7 = "drive"
	local move_d = self._controller.get_input_axis(slot5, self._controller)
	local vehicle_state = self._vehicle.get_state(self._controller)
	slot8 = self._vehicle
	local steer = self._vehicle.get_steer(self._vehicle)

	if steer == 0 and not self._wheel_idle then
		slot9 = self._unit
		slot10 = self.IDS_STEER_IDLE_REDIRECT

		self._unit.camera(slot8).play_redirect(slot8, self._unit.camera(slot8))

		slot9 = self._vehicle_unit
		slot12 = "anim_steering_wheel_left"

		self._vehicle_unit.anim_stop(slot8, Idstring(slot11))

		slot9 = self._vehicle_unit
		slot12 = "anim_steering_wheel_right"

		self._vehicle_unit.anim_stop(slot8, Idstring(slot11))

		self._wheel_idle = true
	end

	if 0 < steer then
		slot9 = self._vehicle_unit
		slot12 = "anim_steering_wheel_right"

		self._vehicle_unit.anim_stop(slot8, Idstring(slot11))

		local anim_length = self._vehicle_unit.anim_length(slot8, Idstring(slot11))
		slot14 = steer

		self._vehicle_unit.anim_set_time(self._vehicle_unit, self._vehicle_unit, Idstring("anim_steering_wheel_left"))

		slot10 = self._vehicle_unit
		slot13 = "anim_steering_wheel_left"

		self._vehicle_unit.anim_play(self._vehicle_unit, Idstring(math.abs("anim_steering_wheel_left") * anim_length))

		slot10 = self._unit
		slot13 = 0
		slot16 = steer

		self._unit.camera(self._vehicle_unit).play_redirect_timeblend(self._vehicle_unit, self._unit.camera(self._vehicle_unit), self.IDS_STEER_LEFT_STATE, self.IDS_STEER_LEFT_REDIRECT, math.abs(slot15))

		self._wheel_idle = false
	end

	if steer < 0 then
		slot9 = self._vehicle_unit
		slot12 = "anim_steering_wheel_left"

		self._vehicle_unit.anim_stop(slot8, Idstring(slot11))

		local anim_length = self._vehicle_unit.anim_length(slot8, Idstring(slot11))
		slot14 = steer

		self._vehicle_unit.anim_set_time(self._vehicle_unit, self._vehicle_unit, Idstring("anim_steering_wheel_right"))

		slot10 = self._vehicle_unit
		slot13 = "anim_steering_wheel_right"

		self._vehicle_unit.anim_play(self._vehicle_unit, Idstring(math.abs("anim_steering_wheel_right") * anim_length))

		slot10 = self._unit
		slot13 = 0
		slot16 = steer

		self._unit.camera(self._vehicle_unit).play_redirect_timeblend(self._vehicle_unit, self._unit.camera(self._vehicle_unit), self.IDS_STEER_RIGHT_STATE, self.IDS_STEER_RIGHT_REDIRECT, math.abs(slot15))

		self._wheel_idle = false
	end

	slot9 = self._vehicle_unit
	slot12 = "ag_speedometer"
	local speed_anim_length = self._vehicle_unit.anim_length(slot8, Idstring(slot11))

	if speed_anim_length then
		local rpm_anim_length = self._vehicle_unit.anim_length(slot9, Idstring(slot12))
		local speed = vehicle_state.get_speed(self._vehicle_unit) * 3.6
		speed = speed * 1.25
		slot12 = vehicle_state
		local rpm = vehicle_state.get_rpm(vehicle_state)
		local max_speed = self._vehicle_ext._tweak_data.max_speed
		slot14 = self._vehicle
		local max_rpm = self._vehicle.get_max_rpm("ag_rpm_meter")
		local relative_speed = speed / max_speed

		if 1 < relative_speed then
			relative_speed = 1
		end

		relative_speed = relative_speed * speed_anim_length
		local relative_rpm = rpm / max_rpm

		if 1 < relative_rpm then
			relative_rpm = 1
		end

		relative_rpm = relative_rpm * rpm_anim_length
		slot20 = "ag_speedometer"

		self._vehicle_unit.anim_set_time(slot16, self._vehicle_unit, Idstring(slot19))

		slot17 = self._vehicle_unit
		slot20 = "ag_speedometer"

		self._vehicle_unit.anim_play(slot16, Idstring(relative_speed))

		slot20 = "ag_rpm_meter"

		self._vehicle_unit.anim_set_time(slot16, self._vehicle_unit, Idstring(relative_speed))

		slot17 = self._vehicle_unit
		slot20 = "ag_rpm_meter"

		self._vehicle_unit.anim_play(slot16, Idstring(relative_rpm))
	end

	local forced_gear = -1
	slot11 = vehicle_state

	if vehicle_state.get_speed(slot10) < 0.5 and move_d.y < 0 then
		slot11 = vehicle_state

		if vehicle_state.get_gear(slot10) ~= 0 then
			forced_gear = 0
		end
	end

	slot11 = vehicle_state

	if vehicle_state.get_speed(slot10) < 0.5 and 0 < move_d.y then
		slot11 = vehicle_state

		if vehicle_state.get_gear(slot10) ~= 2 then
			forced_gear = 2
		end
	end

	local direction = 1
	slot12 = vehicle_state

	if vehicle_state.get_gear(slot11) == 0 and move_d.y ~= 0 then
		direction = -1
	end

	local accelerate = 0
	local brake = 0

	if 0 < direction then
		if 0 < move_d.y then
			accelerate = move_d.y
		else
			brake = -move_d.y
		end
	elseif 0 < move_d.y then
		brake = move_d.y
	else
		accelerate = -move_d.y
	end

	slot14 = self._controller
	local input_held = self._controller.get_any_input(slot13)

	if input_held then
		slot16 = "jump"
		local btn_handbrake_held = self._controller.get_input_bool(slot14, self._controller)
	end

	local handbrake = 0

	if btn_handbrake_held then
		handbrake = 1
	end

	if move_d.x == 0 then
		slot17 = self._move_x
	else
		self._max_steer = 0
	end

	slot18 = self._move_x

	if math.abs(move_d.x) < math.abs(slot16) then
	end

	local steer = -self._move_x

	if 0 < self._dt and self._dt < self._max_steer then
		slot22 = self._max_steer
		slot19 = self._move_x
		self._move_x = self.smoothstep(slot17, self, 0, self._max_steer, self._dt) * math.sign(self)
		self._dt = self._dt + dt
	else
		slot18 = move_d.x

		if math.abs(slot17) == 1 then
			slot18 = self._move_x
		else
			self._move_x = move_d.x
			self._dt = 0
		end
	end

	local back_light = self._vehicle_unit.get_object(slot17, Idstring(slot20))
	slot19 = self._vehicle_unit
	slot22 = "g_lights_rear_effect"
	local back_light_effect = self._vehicle_unit.get_object(self._vehicle_unit, Idstring("light_back"))

	if back_light and 0 < brake then
		slot21 = true

		back_light.set_enable(slot19, back_light)
	elseif back_light then
		slot21 = false

		back_light.set_enable(slot19, back_light)
	end

	if back_light_effect and 0 < brake then
		slot21 = true

		back_light_effect.set_visibility(slot19, back_light_effect)
	elseif back_light_effect then
		slot21 = false

		back_light_effect.set_visibility(slot19, back_light_effect)
	end

	slot29 = move_d.y

	self._vehicle_ext.set_input(slot19, self._vehicle_ext, accelerate, steer, brake, handbrake, false, false, forced_gear, dt)

	return 
end
function PlayerDriving:on_inventory_event(unit, event)
	slot5 = self._unit
	local weapon = self._unit.inventory(slot4).equipped_unit(slot4)
	slot6 = weapon

	if weapon.base(self._unit.inventory(slot4))._setup then
		slot8 = weapon
		slot7 = self._vehicle_unit

		table.insert(slot5, weapon.base(slot7)._setup.ignore_units)
	end

	if self._current_weapon then
		slot6 = self._current_weapon

		if self._current_weapon.base(slot5)._setup then
			slot8 = self._current_weapon
			slot7 = self._vehicle_unit

			table.delete(slot5, self._current_weapon.base(slot7)._setup.ignore_units)
		end
	end

	self._current_weapon = weapon

	return 
end
function PlayerDriving:smoothstep(a, b, step, n)
	local v = step / n
	v = 1 - (1 - v) * (1 - v)
	local x = a * v + b * (1 - v)

	return x
end

return 
