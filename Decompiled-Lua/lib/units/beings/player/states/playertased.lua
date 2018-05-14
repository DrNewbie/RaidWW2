-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not PlayerTased then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerTased = slot0
PlayerTased._update_movement = PlayerBleedOut._update_movement
function PlayerTased:init(unit)
	slot5 = unit

	PlayerTased.super.init(slot3, self)

	return 
end
function PlayerTased:enter(state_data, enter_data)
	PlayerTased.super.enter(slot4, self, state_data)

	slot5 = "tased_boost"
	self._ids_tased_boost = Idstring(slot4)
	slot5 = "tased"
	self._ids_tased = Idstring(slot4)
	slot5 = "tazer_counter"
	self._ids_counter_tase = Idstring(slot4)
	slot8 = managers.player
	slot8 = managers.player.player_timer(enter_data)
	slot7 = state_data.non_lethal_electrocution

	self._start_action_tased(slot4, self, managers.player.player_timer(enter_data).time(enter_data))

	if state_data.non_lethal_electrocution then
		state_data.non_lethal_electrocution = nil
		slot5 = Application
		slot10 = 1
		local recover_time = Application.time(slot4) + tweak_data.player.damage.TASED_TIME * managers.player.upgrade_value(slot6, managers.player, "player", "electrocution_resistance_multiplier")
		self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"
		slot12 = "clbk_exit_to_std"
		slot9 = recover_time

		managers.enemy.add_delayed_clbk(managers.player.upgrade_value(slot6, managers.player, "player", "electrocution_resistance_multiplier"), managers.enemy, self._recover_delayed_clbk, callback("electrocution_resistance_multiplier", self, self))
	else
		self._fatal_delayed_clbk = "PlayerTased_fatal_delayed_clbk"
		slot11 = "clbk_exit_to_fatal"
		slot10 = TimerManager
		slot10 = TimerManager.game(self)
		slot8 = TimerManager.game(self).time(self) + tweak_data.player.damage.TASED_TIME

		managers.enemy.add_delayed_clbk(slot4, managers.enemy, self._fatal_delayed_clbk, callback(slot8, self, self))
	end

	self._next_shock = 0.5
	self._taser_value = 1
	self._num_shocks = 0
	slot5 = managers.groupai
	slot7 = "electrified"

	managers.groupai.state(slot4).on_criminal_disabled(slot4, managers.groupai.state(slot4), self._unit)

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = self

		self._register_revive_SO(slot4)
	end

	slot5 = self._equipped_unit
	slot5 = self._equipped_unit.base(slot4)

	self._equipped_unit.base(slot4).on_reload(slot4)

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

	self._interupt_action_steelsight(slot5)

	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._interupt_action_melee(slot5, managers.player.player_timer(slot8).time(slot8))

	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._interupt_action_ladder(slot5, managers.player.player_timer(slot8).time(slot8))

	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._interupt_action_charging_weapon(slot5, managers.player.player_timer(slot8).time(slot8))

	slot7 = "electrified"
	self._rumble_electrified = managers.rumble.play(slot5, managers.rumble)

	return 
end
function PlayerTased:_enter(enter_data)
	slot4 = self._unit
	slot6 = 2

	self._unit.base(slot3).set_slot(slot3, self._unit.base(slot3), self._unit)

	slot4 = self._unit
	slot4 = self._unit.camera(slot3)
	slot4 = self._unit.camera(slot3).camera_unit(slot3)
	slot5 = 0

	self._unit.camera(slot3).camera_unit(slot3).base(slot3).set_target_tilt(slot3, self._unit.camera(slot3).camera_unit(slot3).base(slot3))

	slot5 = {
		"pl_friend_combatant_cbt",
		"pl_friend_non_combatant_cbt",
		"pl_foe_combatant_cbt_stand",
		"pl_foe_non_combatant_cbt_stand"
	}

	self._ext_movement.set_attention_settings(slot3, self._ext_movement)

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self._ext_movement

		if self._ext_movement.nav_tracker(slot3) then
			slot4 = managers.groupai
			slot4 = managers.groupai.state(slot3)

			managers.groupai.state(slot3).on_player_weapons_hot(slot3)
		end
	end

	return 
end
function PlayerTased:exit(state_data, enter_data)
	slot7 = enter_data

	PlayerTased.super.exit(slot4, self, state_data)

	if self._fatal_delayed_clbk then
		slot6 = self._fatal_delayed_clbk

		managers.enemy.remove_delayed_clbk(slot4, managers.enemy)

		self._fatal_delayed_clbk = nil
	end

	if self._recover_delayed_clbk then
		slot6 = self._recover_delayed_clbk

		managers.enemy.remove_delayed_clbk(slot4, managers.enemy)

		self._recover_delayed_clbk = nil
	end

	slot5 = Network

	if Network.is_server(slot4) and self._SO_id then
		slot5 = managers.groupai
		slot6 = self._SO_id

		managers.groupai.state(slot4).remove_special_objective(slot4, managers.groupai.state(slot4))
	end

	slot6 = 1

	managers.environment_controller.set_taser_value(slot4, managers.environment_controller)

	slot5 = self._camera_unit
	slot5 = self._camera_unit.base(slot4)

	self._camera_unit.base(slot4).break_recoil(slot4)

	slot5 = self._unit
	slot6 = "tasered_stop"

	self._unit.sound(slot4).play(slot4, self._unit.sound(slot4))

	slot6 = self._rumble_electrified

	managers.rumble.stop(slot4, managers.rumble)

	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot8 = "idle"

	self._unit.camera(slot4).play_redirect(slot4, Idstring(slot7))

	self._tase_ended = nil
	self._counter_taser_unit = nil
	self._num_shocks = nil

	return 
end
function PlayerTased:interaction_blocked()
	return true
end
function PlayerTased:update(t, dt)
	slot7 = dt

	PlayerTased.super.update(slot4, self, t)

	return 
end
function PlayerTased:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)

	if self._next_shock < t then
		self._num_shocks = self._num_shocks + 1
		slot7 = 1
		slot5 = math.rand(slot6)
		self._next_shock = t + 0.25 + slot5
		slot6 = self._unit
		slot9 = 10

		self._unit.camera(slot5).play_shaker(slot5, self._unit.camera(slot5), "player_taser_shock", 1)

		slot6 = self._unit
		slot6 = self._unit.camera(slot5)
		slot6 = self._unit.camera(slot5).camera_unit(slot5)
		slot10 = 10
		slot7 = ((math.random(1) == 1 and -1) or 1) * math.random(2)

		self._unit.camera(slot5).camera_unit(slot5).base(slot5).set_target_tilt(slot5, self._unit.camera(slot5).camera_unit(slot5).base(slot5))

		slot7 = 0
		self._taser_value = math.max(slot5, self._taser_value - 0.25)
		slot6 = self._unit
		slot7 = "tasered_shock"

		self._unit.sound(slot5).play(slot5, self._unit.sound(slot5))

		slot7 = "electric_shock"

		managers.rumble.play(slot5, managers.rumble)

		slot6 = self._counter_taser_unit

		if not alive(slot5) then
			slot6 = self._camera_unit
			slot6 = self._camera_unit.base(slot5)

			self._camera_unit.base(slot5).start_shooting(slot5)

			self._recoil_t = t + 0.5
			slot8 = "resist_firing_tased"

			if not managers.player.has_category_upgrade(slot5, managers.player, "player") then
				input.btn_primary_attack_state = true
				input.btn_primary_attack_press = true
			end

			slot6 = self._camera_unit
			slot10 = 5

			self._camera_unit.base(slot5).recoil_kick(slot5, self._camera_unit.base(slot5), -5, 5, -5)

			slot6 = self._unit
			slot7 = self._ids_tased_boost

			self._unit.camera(slot5).play_redirect(slot5, self._unit.camera(slot5))
		end
	elseif self._recoil_t then
		slot8 = "resist_firing_tased"

		if not managers.player.has_category_upgrade(slot5, managers.player, "player") then
			input.btn_primary_attack_state = true
		end

		if self._recoil_t < t then
			self._recoil_t = nil
			slot6 = self._camera_unit
			slot6 = self._camera_unit.base(slot5)

			self._camera_unit.base(slot5).stop_shooting(slot5)
		end
	end

	slot8 = dt / 4
	self._taser_value = math.step(slot5, self._taser_value, 0.8)
	slot7 = self._taser_value

	managers.environment_controller.set_taser_value(slot5, managers.environment_controller)

	slot8 = input
	self._shooting = self._check_action_primary_attack(slot5, self, t)

	if self._shooting then
		slot6 = self._camera_unit
		slot10 = 5

		self._camera_unit.base(slot5).recoil_kick(slot5, self._camera_unit.base(slot5), -5, 5, -5)
	end

	if self._unequip_weapon_expire_t and self._unequip_weapon_expire_t <= t then
		self._unequip_weapon_expire_t = nil
		slot7 = t

		self._start_action_equip_weapon(slot5, self)
	end

	if self._equip_weapon_expire_t and self._equip_weapon_expire_t <= t then
		self._equip_weapon_expire_t = nil
	end

	slot9 = input

	self._check_stats_screen(slot5, self, t, dt)

	slot8 = input

	self._update_foley(slot5, self, t)

	local new_action = nil
	slot9 = input

	self._check_action_interact(self, self, t)

	local new_action = nil

	return 
end
function PlayerTased:_check_action_primary_attack(t, input)
	local new_action = nil
	slot7 = "primary_attack"
	local action_forbidden = self.chk_action_forbidden(slot5, self)

	if not action_forbidden then
		slot7 = self

		if not self._is_reloading(slot6) then
			slot7 = self

			if not self._changing_weapon(slot6) and not self._melee_expire_t and not self._use_item_expire_t then
				slot7 = self

				if not self._interacting(slot6) then
					slot7 = self._counter_taser_unit
					action_forbidden = alive(slot6)
				end
			end
		end
	end

	local action_wanted = input.btn_primary_attack_state

	if action_wanted then
		if not action_forbidden then
			self._queue_reload_interupt = nil
			slot9 = false

			self._ext_inventory.equip_selected_primary(slot7, self._ext_inventory)

			if self._equipped_unit then
				local weap_base = self._equipped_unit.base(slot7)
				local fire_mode = weap_base.fire_mode(self._equipped_unit)
				slot10 = weap_base

				if weap_base.out_of_ammo(weap_base) then
					if input.btn_primary_attack_press then
						slot10 = weap_base

						weap_base.dryfire(slot9)
					end
				elseif weap_base.clip_empty then
					slot10 = weap_base

					if weap_base.clip_empty(slot9) and fire_mode == "single" and input.btn_primary_attack_press then
						slot10 = weap_base

						weap_base.dryfire(slot9)
					end
				elseif 1 < self._num_shocks and weap_base.can_refire_while_tased then
					slot10 = weap_base
				elseif self._running then
					slot11 = t

					self._interupt_action_running(slot9, self)
				else
					if not self._shooting then
						slot10 = weap_base

						if weap_base.start_shooting_allowed(slot9) then
							local start = fire_mode == "single" and input.btn_primary_attack_press
							start = start or (fire_mode ~= "single" and input.btn_primary_attack_state)

							if start then
								slot11 = weap_base

								weap_base.start_shooting(slot10)

								slot11 = self._camera_unit
								slot11 = self._camera_unit.base(slot10)

								self._camera_unit.base(slot10).start_shooting(slot10)
							end
						end
					end

					slot10 = self._unit
					local suppression_ratio = self._unit.character_damage(slot9).effective_suppression_ratio(slot9)
					slot13 = suppression_ratio
					local spread_mul = math.lerp(self._unit.character_damage(slot9), 1, tweak_data.player.suppression.spread_mul)
					slot14 = suppression_ratio
					local autohit_mul = math.lerp(1, 1, tweak_data.player.suppression.autohit_chance_mul)
					local suppression_mul = managers.blackmarket.threat_multiplier(1)
					slot17 = 1
					local dmg_mul = managers.player.temporary_upgrade_value(managers.blackmarket, managers.player, "temporary", "dmg_multiplier_outnumbered")
					local weapon_category = weap_base.weapon_tweak_data(managers.player).category
					slot18 = "overkill_all_weapons"

					if managers.player.has_category_upgrade(weap_base, managers.player, "player") or weapon_category == "shotgun" or weapon_category == "saw" then
						slot19 = 1
						dmg_mul = dmg_mul * managers.player.temporary_upgrade_value(slot15, managers.player, "temporary", "overkill_damage_multiplier")
					end

					local health_ratio = self._ext_damage.health_ratio(slot15)
					slot19 = weapon_category
					local damage_health_ratio = managers.player.get_damage_health_ratio(self._ext_damage, managers.player, health_ratio)

					if 0 < damage_health_ratio then
						local upgrade_name = (weapon_category == "saw" and "melee_damage_health_ratio_multiplier") or "damage_health_ratio_multiplier"
						local damage_ratio = damage_health_ratio
						slot23 = 0
						dmg_mul = dmg_mul * (1 + managers.player.upgrade_value(slot19, managers.player, "player", upgrade_name) * damage_ratio)
					end

					slot21 = 1
					dmg_mul = dmg_mul * managers.player.temporary_upgrade_value(slot17, managers.player, "temporary", "berserker_damage_multiplier")
					slot20 = 1
					dmg_mul = dmg_mul * managers.player.get_property(slot17, managers.player, "trigger_happy")
					local fired = nil

					if fire_mode == "single" then
						if input.btn_primary_attack_press then
							slot23 = self._ext_camera
							slot26 = suppression_mul
							fired = weap_base.trigger_pressed(slot18, weap_base, self._ext_camera.position(slot21), self._ext_camera.forward(self._ext_camera), dmg_mul, nil, spread_mul, autohit_mul)
							slot19 = weap_base

							if weap_base.fire_on_release(slot18) then
								if weap_base.set_tased_shot then
									slot20 = true

									weap_base.set_tased_shot(slot18, weap_base)
								end

								slot23 = self._ext_camera
								slot26 = suppression_mul
								fired = weap_base.trigger_released(slot18, weap_base, self._ext_camera.position(slot21), self._ext_camera.forward(self._ext_camera), dmg_mul, nil, spread_mul, autohit_mul)

								if weap_base.set_tased_shot then
									slot20 = false

									weap_base.set_tased_shot(slot18, weap_base)
								end
							end
						end
					elseif input.btn_primary_attack_state then
						slot23 = self._ext_camera
						slot26 = suppression_mul
						fired = weap_base.trigger_held(slot18, weap_base, self._ext_camera.position(slot21), self._ext_camera.forward(self._ext_camera), dmg_mul, nil, spread_mul, autohit_mul)
					end

					new_action = true

					if fired then
						local weap_tweak_data = tweak_data.weapon[weap_base.get_name_id(slot19)]
						slot21 = weap_base
						slot21 = weap_base
						local recoil_multiplier = weap_base.recoil(slot19) * weap_base.recoil_multiplier(weap_base) + weap_base.recoil_addend(weap_base)
						slot21 = weap_tweak_data.kick[(self._state_data.in_steelsight and "steelsight") or (self._state_data.ducking and "crouching") or "standing"]
						local up, down, left, right = unpack(weap_base)
						slot25 = self._camera_unit
						slot29 = right * recoil_multiplier

						self._camera_unit.base(slot24).recoil_kick(slot24, self._camera_unit.base(slot24), up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier)

						local spread_multiplier = weap_base.spread_multiplier(slot24)
						slot26 = self._equipped_unit
						slot27 = "unequip"

						self._equipped_unit.base(weap_base).tweak_data_anim_stop(weap_base, self._equipped_unit.base(weap_base))

						slot26 = self._equipped_unit
						slot27 = "equip"

						self._equipped_unit.base(weap_base).tweak_data_anim_stop(weap_base, self._equipped_unit.base(weap_base))

						slot28 = "stacking_hit_damage_multiplier"

						if managers.player.has_category_upgrade(weap_base, managers.player, weapon_category) then
							self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
							self._state_data.stacking_dmg_mul[weapon_category] = self._state_data.stacking_dmg_mul[weapon_category] or {
								nil,
								0
							}
							local stack = self._state_data.stacking_dmg_mul[weapon_category]

							if fired.hit_enemy then
								slot30 = 1
								stack[1] = t + managers.player.upgrade_value(slot26, managers.player, weapon_category, "stacking_hit_expire_t")
								slot28 = tweak_data.upgrades.max_weapon_dmg_mul_stacks or 5
								stack[2] = math.min(slot26, stack[2] + 1)
							else
								stack[1] = nil
								stack[2] = 0
							end
						end

						slot27 = weap_base.selection_index(slot28)
						slot30 = weap_base

						managers.hud.set_ammo_amount(slot25, managers.hud, weap_base.ammo_info(weap_base))

						if self._ext_network then
							local impact = not fired.hit_enemy
							slot29 = impact

							self._ext_network.send(slot26, self._ext_network, "shot_blank")
						end
					elseif fire_mode == "single" then
						new_action = false
					end
				end
			end
		else
			slot8 = self

			if self._is_reloading(slot7) then
				slot8 = self._equipped_unit
				slot8 = self._equipped_unit.base(slot7)

				if self._equipped_unit.base(slot7).reload_interuptable(slot7) and input.btn_primary_attack_press then
					self._queue_reload_interupt = true
				end
			end
		end
	end

	if not new_action and self._shooting then
		slot8 = self._equipped_unit
		slot8 = self._equipped_unit.base(slot7)

		self._equipped_unit.base(slot7).stop_shooting(slot7)

		slot8 = self._camera_unit
		slot8 = self._camera_unit.base(slot7)

		self._camera_unit.base(slot7).stop_shooting(slot7)
	end

	return new_action
end
function PlayerTased:_check_action_interact(t, input)
	if input.btn_interact_press and (not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t) then
		slot5 = self._counter_taser_unit

		if not alive(slot4) then
			self._intimidate_t = t
			slot9 = true

			self.call_teammate(slot4, self, nil, t, true)
		end
	end

	return 
end
function PlayerTased:call_teammate(line, t, no_gesture, skip_alert)
	slot12 = false
	local voice_type, plural, prime_target = self._get_unit_intimidation_action(slot6, self, true, false, false, true)
	local interact_type, queue_name = nil

	if voice_type == "stop_cop" or voice_type == "mark_cop" then
		local prime_target_tweak = tweak_data.character[prime_target.unit.base(slot12)._tweak_table]
		local shout_sound = prime_target_tweak.priority_shout
		slot14 = managers.groupai
		slot14 = managers.groupai.state(prime_target.unit)

		if managers.groupai.state(prime_target.unit).whisper_mode(prime_target.unit) and not prime_target_tweak.silent_priority_shout then
		end

		if shout_sound then
			interact_type = "cmd_point"
			queue_name = "s07x_sin"
			slot16 = "special_enemy_highlight"

			if managers.player.has_category_upgrade(slot13, managers.player, "player") then
				slot14 = prime_target.unit
				slot19 = "marked_enemy_extra_damage"
				slot16 = true
				slot22 = 1

				prime_target.unit.contour(slot13).add(slot13, prime_target.unit.contour(slot13), (managers.player.has_category_upgrade(slot16, managers.player, "player") and "mark_enemy_damage_bonus") or "mark_enemy", managers.player.upgrade_value(slot18, managers.player, "player", "mark_enemy_time_multiplier"))
			end
		end
	end

	if interact_type then
		slot17 = skip_alert

		self._do_action_intimidate(slot11, self, t, (not no_gesture and interact_type) or nil, queue_name, nil)
	end

	return 
end
function PlayerTased:_start_action_tased(t, non_lethal)
	slot6 = t

	self._interupt_action_running(slot4, self)

	slot5 = self

	self._stance_entered(slot4)

	slot5 = self

	self._update_crosshair_offset(slot4)

	slot5 = self._unit
	slot6 = self._ids_tased

	self._unit.camera(slot4).play_redirect(slot4, self._unit.camera(slot4))

	slot5 = self._unit
	slot6 = "tasered_loop"

	self._unit.sound(slot4).play(slot4, self._unit.sound(slot4))

	return 
end
function PlayerTased:_start_action_counter_tase(t, prime_target)
	self._counter_taser_unit = prime_target.unit
	slot5 = self._unit
	slot6 = self._ids_counter_tase

	self._unit.camera(slot4).play_redirect(slot4, self._unit.camera(slot4))

	return 
end
function PlayerTased:_register_revive_SO()
	local objective = {
		scan = true,
		destroy_clbk_key = false,
		type = "follow",
		called = true,
		follow_unit = self._unit
	}
	slot4 = self._unit
	slot4 = self._unit.movement(slot3)
	objective.nav_seg = self._unit.movement(slot3).nav_tracker(slot3).nav_segment(slot3)
	local so_descriptor = {
		interval = 6,
		chance_inc = 0,
		search_dis_sq = 25000000,
		base_chance = 1,
		usage_amount = 1,
		AI_group = "friendlies",
		objective = objective,
		search_pos = self._unit.position(self._unit.movement(slot3).nav_tracker(slot3))
	}
	local so_id = "PlayerTased_assistance"
	self._SO_id = so_id
	slot6 = managers.groupai
	slot8 = so_descriptor

	managers.groupai.state(self._unit).add_special_objective(self._unit, managers.groupai.state(self._unit), so_id)

	return 
end
function PlayerTased:clbk_exit_to_fatal()
	self._fatal_delayed_clbk = nil
	slot4 = "incapacitated"

	managers.player.set_player_state(slot2, managers.player)

	return 
end
function PlayerTased:clbk_exit_to_std()

	-- Decompilation error in this vicinity:
	self._recover_delayed_clbk = nil
	slot4 = "PlayerTased:clbk_exit_to_std(), game_state_machine:last_queued_state_name()"
	slot7 = game_state_machine

	Application.debug(slot2, Application, game_state_machine.last_queued_state_name(slot6))

	slot3 = game_state_machine

	if game_state_machine.last_queued_state_name(slot2) == "ingame_electrified" then
		slot3 = managers.network

		if managers.network.session(slot2) then
			slot4 = "standard"

			managers.player.set_player_state(slot2, managers.player)
		end
	end

	return 
end
function PlayerTased:on_tase_ended()
	self._tase_ended = true

	if self._fatal_delayed_clbk then
		slot4 = self._fatal_delayed_clbk

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._fatal_delayed_clbk = nil
	end

	if not self._recover_delayed_clbk then
		slot3 = game_state_machine

		if game_state_machine.last_queued_state_name(slot2) == "ingame_electrified" then
			slot3 = managers.network

			if managers.network.session(slot2) then
				self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"
				slot9 = "clbk_exit_to_std"
				slot8 = TimerManager
				slot8 = TimerManager.game(self)
				slot6 = TimerManager.game(self).time(self) + tweak_data.player.damage.TASED_RECOVER_TIME

				managers.enemy.add_delayed_clbk(slot2, managers.enemy, self._recover_delayed_clbk, callback(slot6, self, self))
			end
		end
	end

	self._taser_unit = nil

	return 
end
function PlayerTased:_on_tased_event(taser_unit, tased_unit)
	if self._unit == tased_unit then
		self._taser_unit = taser_unit
	end

	return 
end
function PlayerTased:give_shock_to_taser()
	slot3 = self._counter_taser_unit

	if not alive(slot2) then
		return 
	end

	return 

	slot4 = self._counter_taser_unit

	self._give_shock_to_taser(slot2, self)

	return 
end
function PlayerTased:_give_shock_to_taser(taser_unit)
	return 

	local action_data = {
		variant = "counter_tased"
	}
	slot5 = taser_unit
	action_data.damage = taser_unit.character_damage(slot4)._HEALTH_INIT * (tweak_data.upgrades.counter_taser_damage or 0.2)
	slot5 = taser_unit
	action_data.damage_effect = taser_unit.character_damage(tweak_data.upgrades.counter_taser_damage or 0.2)._HEALTH_INIT * 2
	action_data.attacker_unit = self._unit
	action_data.attack_dir = -taser_unit.movement(tweak_data.upgrades.counter_taser_damage or 0.2)._action_common_data.fwd
	slot8 = taser_unit
	slot8 = taser_unit.movement("body")
	slot4 = taser_unit.body(taser_unit, taser_unit)
	action_data.col_ray = {
		position = mvector3.copy(taser_unit.movement("body").m_head_pos("body")),
		body = slot4
	}
	slot5 = taser_unit
	slot6 = action_data

	taser_unit.character_damage(slot4).damage_melee(slot4, taser_unit.character_damage(slot4))

	return 
end
function PlayerTased:give_shock_to_taser_no_damage()
	slot3 = self._taser_unit

	if not alive(slot2) then
		return 
	end

	local action_data = {
		damage = 0,
		variant = "counter_tased"
	}
	slot4 = self._taser_unit
	action_data.damage_effect = self._taser_unit.character_damage(slot3)._HEALTH_INIT * 2
	action_data.attacker_unit = self._unit
	action_data.attack_dir = -self._taser_unit.movement(slot3)._action_common_data.fwd
	slot7 = self._taser_unit
	slot7 = self._taser_unit.movement(slot6)
	slot6 = "body"
	slot3 = self._taser_unit.body(self._taser_unit, self._taser_unit)
	action_data.col_ray = {
		position = mvector3.copy(self._taser_unit.movement(slot6).m_head_pos(slot6)),
		body = slot3
	}
	slot4 = self._taser_unit
	slot5 = action_data

	self._taser_unit.character_damage(slot3).damage_melee(slot3, self._taser_unit.character_damage(slot3))

	slot4 = self._unit
	slot5 = "tase_counter_attack"

	self._unit.sound(slot3).play(slot3, self._unit.sound(slot3))

	return 
end
function PlayerTased:_on_malfunction_to_taser_event()
	slot3 = self._taser_unit

	if not alive(slot2) then
		return 
	end

	slot3 = World
	slot4 = {
		effect = Idstring(slot6),
		position = self._taser_unit.movement(slot6).m_head_pos(slot6),
		normal = math.UP
	}
	slot7 = "effects/vanilla/character/taser_stop"
	slot7 = self._taser_unit
	slot7 = self._taser_unit.movement(slot6)

	World.effect_manager(slot2).spawn(slot2, World.effect_manager(slot2))

	local action_data = {
		damage = 0,
		variant = "melee"
	}
	slot4 = self._taser_unit
	action_data.damage_effect = self._taser_unit.character_damage(World.effect_manager(slot2))._HEALTH_INIT * 10
	action_data.attacker_unit = self._unit
	action_data.attack_dir = -self._taser_unit.movement(World.effect_manager(slot2))._action_common_data.fwd
	slot7 = self._taser_unit
	slot7 = self._taser_unit.movement(slot6)
	slot6 = "body"
	slot3 = self._taser_unit.body(self._taser_unit, self._taser_unit)
	action_data.col_ray = {
		position = mvector3.copy(self._taser_unit.movement(slot6).m_head_pos(slot6)),
		body = slot3
	}
	slot4 = self._taser_unit
	slot5 = action_data

	self._taser_unit.character_damage(slot3).damage_melee(slot3, self._taser_unit.character_damage(slot3))

	return 
end

return 
