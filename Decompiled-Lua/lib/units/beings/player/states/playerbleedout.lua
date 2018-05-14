-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not PlayerBleedOut then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerBleedOut = slot0
PlayerBleedOut.init = function (self, unit)
	slot5 = unit

	PlayerBleedOut.super.init(slot3, self)

	self._dof_post_processor = nil

	return 
end

function _get_fp_dof_effect_name(ids_dof_effect)
	slot3 = "bloom_DOF_combine"

	if ids_dof_effect == Idstring(slot2) then
		slot3 = "bloom_DOF_combine_FP"

		return Idstring(slot2)
	end

	slot3 = "DOF_FP"

	return Idstring(slot2)
end

PlayerBleedOut.enter = function (self, state_data, enter_data)
	slot7 = enter_data

	PlayerBleedOut.super.enter(slot4, self, state_data)

	slot5 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot4).vp(slot4)
	slot7 = "World"
	slot10 = "bloom_combine_post_processor"
	self._dof_post_processor = vp.get_post_processor_effect_name(managers.viewport.first_active_viewport(slot4), vp, Idstring(slot9))
	slot8 = Idstring(slot9)
	slot11 = self._dof_post_processor

	vp.set_post_processor_effect(managers.viewport.first_active_viewport(slot4), vp, "World", _get_fp_dof_effect_name("bloom_combine_post_processor"))

	slot7 = BuffEffectManager.EFFECT_PLAYER_BLEEDOUT

	if managers.buff_effect.is_effect_active(managers.viewport.first_active_viewport(slot4), managers.buff_effect) then
		slot7 = BuffEffectManager.EFFECT_PLAYER_BLEEDOUT
		slot10 = managers.network
		slot10 = managers.network.session(slot9)
		slot10 = managers.network.session(slot9).local_peer(slot9)

		managers.buff_effect.fail_effect(slot5, managers.buff_effect, managers.network.session(slot9).local_peer(slot9).id(slot9))
	end

	self._revive_SO_data = {
		unit = self._unit
	}
	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._start_action_bleedout(self._unit, managers.player.player_timer(slot8).time(slot8))

	slot6 = managers.player
	slot6 = managers.player.player_timer(self._unit)
	self._tilt_wait_t = managers.player.player_timer(self._unit).time(self._unit) + 1
	self._old_selection = nil
	slot8 = "primary_weapon_when_downed"
	local upgrade_primary_weapon_when_downed = managers.player.has_category_upgrade(self._unit, managers.player, "player")
	slot7 = self._unit
	slot7 = self._unit.inventory(managers.player)
	slot7 = self._unit.inventory(managers.player).equipped_unit(managers.player)
	slot7 = self._unit.inventory(managers.player).equipped_unit(managers.player).base(managers.player)
	local not_allowed_in_bleedout = self._unit.inventory(managers.player).equipped_unit(managers.player).base(managers.player).weapon_tweak_data(managers.player).not_allowed_in_bleedout

	if not upgrade_primary_weapon_when_downed or not_allowed_in_bleedout then
		slot9 = BuffEffectManager.EFFECT_ONLY_MELEE_AVAILABLE

		if not managers.buff_effect.is_effect_active(slot7, managers.buff_effect) then
			slot8 = managers.blackmarket
			local projectile_entry = managers.blackmarket.equipped_projectile(slot7)

			if tweak_data.projectiles[projectile_entry].is_a_grenade then
				slot9 = self
				slot12 = managers.player
				slot12 = managers.player.player_timer(slot11)

				self._interupt_action_throw_grenade(slot8, managers.player.player_timer(slot11).time(slot11))
			else
				slot9 = self
				slot12 = managers.player
				slot12 = managers.player.player_timer(slot11)

				self._interupt_action_throw_projectile(slot8, managers.player.player_timer(slot11).time(slot11))
			end

			slot9 = self._unit
			slot9 = self._unit.inventory(slot8)
			self._old_selection = self._unit.inventory(slot8).equipped_selection(slot8)
			slot12 = managers.player
			slot12 = managers.player.player_timer(slot11)
			slot11 = {
				selection_wanted = 1
			}

			self._start_action_unequip_weapon(slot8, self, managers.player.player_timer(slot11).time(slot11))

			slot9 = self._unit
			slot10 = 1
			slot9 = self._unit.inventory(slot8).unit_by_selection(slot8, self._unit.inventory(slot8))
			slot9 = self._unit.inventory(slot8).unit_by_selection(slot8, self._unit.inventory(slot8)).base(slot8)

			self._unit.inventory(slot8).unit_by_selection(slot8, self._unit.inventory(slot8)).base(slot8).on_reload(slot8)
		end
	end

	slot8 = managers.player
	local carry_data = managers.player.get_my_carry_data(slot7)

	if carry_data then
		local carry_tweak = tweak_data.carry[carry_data.carry_id]

		if carry_tweak.is_corpse then
			slot10 = managers.player

			managers.player.drop_carry(slot9)
		end
	end

	slot9 = self._unit
	slot10 = "player_bleedout_land"

	self._unit.camera(slot8).play_shaker(slot8, self._unit.camera(slot8))

	slot12 = managers.network
	slot12 = managers.network.session(slot11)
	slot12 = managers.network.session(slot11).local_peer(slot11)
	local effect_id_world = "world_downed_Peer" .. tostring(managers.network.session(slot11).local_peer(slot11).id(slot11))

	managers.time_speed.play_effect(self._unit.camera(slot8), managers.time_speed, effect_id_world)

	slot13 = managers.network
	slot13 = managers.network.session(tweak_data.timespeed.downed)
	slot13 = managers.network.session(tweak_data.timespeed.downed).local_peer(tweak_data.timespeed.downed)
	local effect_id_player = "player_downed_Peer" .. tostring(managers.network.session(tweak_data.timespeed.downed).local_peer(tweak_data.timespeed.downed).id(tweak_data.timespeed.downed))
	slot13 = tweak_data.timespeed.downed_player

	managers.time_speed.play_effect(managers.time_speed, managers.time_speed, effect_id_player)

	slot11 = managers.groupai
	slot12 = self._unit

	managers.groupai.state(managers.time_speed).on_criminal_disabled(managers.time_speed, managers.groupai.state(managers.time_speed))

	slot11 = Network

	if Network.is_server(managers.time_speed) then
		slot11 = self._ext_movement

		if self._ext_movement.nav_tracker(slot10) then
			slot12 = "revive"

			self._register_revive_SO(slot10, self._revive_SO_data)
		end
	end

	if self._state_data.in_steelsight then
		slot11 = self
		slot14 = managers.player
		slot14 = managers.player.player_timer(slot13)

		self._interupt_action_steelsight(slot10, managers.player.player_timer(slot13).time(slot13))
	end

	slot11 = self
	slot14 = managers.player
	slot14 = managers.player.player_timer(slot13)

	self._interupt_action_throw_grenade(slot10, managers.player.player_timer(slot13).time(slot13))

	slot11 = self
	slot14 = managers.player
	slot14 = managers.player.player_timer(slot13)

	self._interupt_action_melee(slot10, managers.player.player_timer(slot13).time(slot13))

	slot11 = self
	slot14 = managers.player
	slot14 = managers.player.player_timer(slot13)

	self._interupt_action_ladder(slot10, managers.player.player_timer(slot13).time(slot13))

	slot11 = managers.groupai
	slot12 = self._unit

	managers.groupai.state(slot10).report_criminal_downed(slot10, managers.groupai.state(slot10))

	slot11 = managers.network
	slot18 = "teammate_downed"
	slot18 = 1

	managers.network.session(slot10).send_to_peers_synched(slot10, managers.network.session(slot10), "sync_contour_state", self._unit, -1, table.index_of(slot16, ContourExt.indexed_types), true, 1)

	return 
end
PlayerBleedOut._enter = function (self, enter_data)
	slot4 = self._unit
	slot6 = 2

	self._unit.base(slot3).set_slot(slot3, self._unit.base(slot3), self._unit)

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self._ext_movement

		if self._ext_movement.nav_tracker(slot3) then
			slot4 = managers.groupai
			slot4 = managers.groupai.state(slot3)

			managers.groupai.state(slot3).on_player_weapons_hot(slot3)
		end
	end

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
			"pl_friend_non_combatant_cbt",
			"pl_foe_combatant_cbt_crouch",
			"pl_foe_non_combatant_cbt_crouch"
		}
	end

	slot6 = preset

	self._ext_movement.set_attention_settings(slot4, self._ext_movement)

	return 
end
PlayerBleedOut.exit = function (self, state_data, new_state_name)
	slot7 = new_state_name

	PlayerBleedOut.super.exit(slot4, self, state_data)

	slot5 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot4).vp(slot4)
	slot10 = "bloom_combine_post_processor"
	slot8 = Idstring(slot9)
	slot9 = self._dof_post_processor

	vp.set_post_processor_effect(managers.viewport.first_active_viewport(slot4), vp, "World", slot8)

	self._dof_post_processor = nil
	slot6 = self
	slot9 = managers.player
	slot9 = managers.player.player_timer(slot8)

	self._end_action_bleedout(managers.viewport.first_active_viewport(slot4), managers.player.player_timer(slot8).time(slot8))

	slot6 = self._unit
	slot6 = self._unit.camera(managers.viewport.first_active_viewport(slot4))
	slot6 = self._unit.camera(managers.viewport.first_active_viewport(slot4)).camera_unit(managers.viewport.first_active_viewport(slot4))
	slot7 = 0

	self._unit.camera(managers.viewport.first_active_viewport(slot4)).camera_unit(managers.viewport.first_active_viewport(slot4)).base(managers.viewport.first_active_viewport(slot4)).set_target_tilt(managers.viewport.first_active_viewport(slot4), self._unit.camera(managers.viewport.first_active_viewport(slot4)).camera_unit(managers.viewport.first_active_viewport(slot4)).base(managers.viewport.first_active_viewport(slot4)))

	self._tilt_wait_t = nil
	local exit_data = {
		equip_weapon = self._old_selection
	}
	slot7 = Network

	if Network.is_server(self._unit.camera(managers.viewport.first_active_viewport(slot4)).camera_unit(managers.viewport.first_active_viewport(slot4)).base(managers.viewport.first_active_viewport(slot4))) then
		if new_state_name == "fatal" then
			exit_data.revive_SO_data = self._revive_SO_data
			self._revive_SO_data = nil
		else
			slot7 = self

			self._unregister_revive_SO(slot6)
		end
	end

	exit_data.skip_equip = true

	if new_state_name == "standard" then
		exit_data.wants_crouch = true
	end

	slot7 = managers.network
	slot14 = "teammate_downed"
	slot14 = 1

	managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_contour_state", self._unit, -1, table.index_of(slot12, ContourExt.indexed_types), false, 1)

	return exit_data
end
PlayerBleedOut.interaction_blocked = function (self)
	return true
end
PlayerBleedOut.update = function (self, t, dt)
	slot7 = dt

	PlayerBleedOut.super.update(slot4, self, t)

	if self._tilt_wait_t then
		slot7 = self._tilt_wait_t - t
		local tilt = math.lerp(slot4, 35, 0)
		slot6 = self._unit
		slot6 = self._unit.camera(35)
		slot6 = self._unit.camera(35).camera_unit(35)
		slot7 = tilt

		self._unit.camera(35).camera_unit(35).base(35).set_target_tilt(35, self._unit.camera(35).camera_unit(35).base(35))

		if self._tilt_wait_t < t then
			self._tilt_wait_t = nil
			slot6 = self._unit
			slot6 = self._unit.camera(slot5)
			slot6 = self._unit.camera(slot5).camera_unit(slot5)
			slot7 = 35

			self._unit.camera(slot5).camera_unit(slot5).base(slot5).set_target_tilt(slot5, self._unit.camera(slot5).camera_unit(slot5).base(slot5))
		end
	end

	return 
end
PlayerBleedOut._update_check_actions = function (self, t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot6 = self._unit
	slot9 = 0

	self._unit.camera(self).set_shaker_parameter(self, self._unit.camera(self), "headbob", "amplitude")

	slot6 = managers.blackmarket
	local projectile_entry = managers.blackmarket.equipped_projectile(self)

	if tweak_data.projectiles[projectile_entry].is_a_grenade then
		slot9 = input

		self._update_throw_grenade_timers(slot6, self, t)
	else
		slot9 = input

		self._update_throw_projectile_timers(slot6, self, t)
	end

	slot10 = input

	self._update_reload_timers(slot6, self, t, dt)

	slot9 = input

	self._update_equip_weapon_timers(slot6, self, t)

	slot9 = input

	self._update_foley(slot6, self, t)

	local new_action = nil

	if not new_action then
		slot10 = input
		new_action = self._check_action_weapon_gadget(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_weapon_firemode(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_reload(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_change_weapon(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_primary_attack(slot7, self, t)
		self._shooting = new_action
	end

	if not new_action then
		slot8 = managers.blackmarket
		local projectile_entry = managers.blackmarket.equipped_projectile(slot7)

		if tweak_data.projectiles[projectile_entry].is_a_grenade then
			slot11 = input
			new_action = self._check_action_throw_grenade(slot8, self, t)
		else
			slot11 = input
			new_action = self._check_action_throw_projectile(slot8, self, t)
		end
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_equip(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_interact(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_steelsight(slot7, self, t)
	end

	slot10 = input

	PlayerCarry._check_use_item(slot7, self, t)

	slot11 = input

	self._check_stats_screen(slot7, self, t, dt)

	slot10 = input

	self._check_comm_wheel(slot7, self, t)

	return 
end
PlayerBleedOut._check_action_interact = function (self, t, input)
	if input.btn_interact_press and (not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t) then
		self._intimidate_t = t
		slot9 = true

		if not self.call_teammate(slot4, self, "f11", t, false) then
			slot10 = self._revive_SO_data

			self.call_civilian(slot4, self, "f11", t, false, true)
		end
	end

	return 
end
PlayerBleedOut._check_change_weapon = function (self, ...)
	slot3 = self._unit
	slot4 = 2
	local primary = self._unit.inventory(slot2).unit_by_selection(slot2, self._unit.inventory(slot2))
	slot4 = primary

	if alive(self._unit.inventory(slot2)) then
		slot4 = primary
		slot4 = primary.base(slot3)

		if primary.base(slot3).weapon_tweak_data(slot3).not_allowed_in_bleedout then
			return false
		end
	end

	slot6 = "primary_weapon_when_downed"

	if managers.player.has_category_upgrade(slot3, managers.player, "player") then
		slot4 = self

		return PlayerBleedOut.super._check_change_weapon(slot3, ...)
	end

	return false
end
PlayerBleedOut._check_action_equip = function (self, ...)
	slot3 = self._unit
	slot4 = 2
	local primary = self._unit.inventory(slot2).unit_by_selection(slot2, self._unit.inventory(slot2))
	slot4 = primary

	if alive(self._unit.inventory(slot2)) then
		slot4 = primary
		slot4 = primary.base(slot3)

		if primary.base(slot3).weapon_tweak_data(slot3).not_allowed_in_bleedout then
			return false
		end
	end

	slot6 = "primary_weapon_when_downed"

	if managers.player.has_category_upgrade(slot3, managers.player, "player") then
		slot4 = self

		return PlayerBleedOut.super._check_action_equip(slot3, ...)
	end

	return false
end
PlayerBleedOut._check_action_steelsight = function (self, ...)
	slot5 = "steelsight_when_downed"

	if managers.player.has_category_upgrade(slot2, managers.player, "player") then
		slot3 = self

		return PlayerBleedOut.super._check_action_steelsight(slot2, ...)
	end

	return false
end
PlayerBleedOut._start_action_state_standard = function (self, t)
	slot5 = "standard"

	managers.player.set_player_state(slot3, managers.player)

	return 
end
PlayerBleedOut._register_revive_SO = function (revive_SO_data, variant)

	-- Decompilation error in this vicinity:
	local followup_objective = {
		scan = true,
		type = "act",
		action = {
			variant = "crouch",
			body_part = 1,
			type = "act",
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				aim = -1,
				walk = -1
			}
		}
	}
	local objective = {
		type = "revive",
		called = true,
		scan = true,
		destroy_clbk_key = false,
		follow_unit = revive_SO_data.unit
	}
	slot6 = revive_SO_data.unit
	slot6 = revive_SO_data.unit.movement(slot5)
	slot6 = revive_SO_data.unit.movement(slot5).nav_tracker(slot5)
	objective.nav_seg = revive_SO_data.unit.movement(slot5).nav_tracker(slot5).nav_segment(slot5)
	slot9 = revive_SO_data
	objective.fail_clbk = callback(slot5, PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_failed")
	slot9 = revive_SO_data
	objective.complete_clbk = callback(slot5, PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_completed")
	slot9 = revive_SO_data
	objective.action_start_clbk = callback(slot5, PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_started")
	objective.action = {
		align_sync = true,
		type = "act",
		body_part = 1,
		variant = variant,
		blocks = {
			light_hurt = -1,
			hurt = -1,
			action = -1,
			heavy_hurt = -1,
			aim = -1,
			walk = -1
		}
	}
	objective.action_duration = tweak_data.interaction[(variant == "untie" and "free") or variant].timer
	objective.followup_objective = followup_objective
	local so_descriptor = {
		interval = 0,
		AI_group = "friendlies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective
	}
	slot7 = revive_SO_data.unit
	so_descriptor.search_pos = revive_SO_data.unit.position(slot6)
	slot10 = revive_SO_data
	so_descriptor.admin_clbk = callback(slot6, PlayerBleedOut, PlayerBleedOut, "on_rescue_SO_administered")
	slot10 = revive_SO_data.unit
	so_descriptor.verification_clbk = callback(slot6, PlayerBleedOut, PlayerBleedOut, "rescue_SO_verification")
	revive_SO_data.variant = variant
	local so_id = "Playerrevive"
	revive_SO_data.SO_id = so_id
	slot8 = managers.groupai
	slot10 = so_descriptor

	managers.groupai.state(PlayerBleedOut).add_special_objective(PlayerBleedOut, managers.groupai.state(PlayerBleedOut), so_id)

	if not revive_SO_data.deathguard_SO_id then
		slot8 = revive_SO_data.unit
		revive_SO_data.deathguard_SO_id = PlayerBleedOut._register_deathguard_SO(slot7)
	end

	return 
end
PlayerBleedOut.call_civilian = function (self, line, t, no_gesture, skip_alert, revive_SO_data)
	slot10 = "civilian_reviver"

	if not managers.player.has_category_upgrade(slot7, managers.player, "player") or (revive_SO_data and revive_SO_data.sympathy_civ) then
		return 
	end

	local detect_only = false
	slot17 = detect_only
	local voice_type, plural, prime_target = self._get_unit_intimidation_action(slot8, self, false, true, false, false, false, 0, true)

	if prime_target then
		if detect_only then
			slot12 = prime_target.unit
			slot13 = t

			if not prime_target.unit.sound(slot11).speaking(slot11, prime_target.unit.sound(slot11)) then
				slot12 = prime_target.unit
				slot14 = true

				prime_target.unit.sound(slot11).say(slot11, prime_target.unit.sound(slot11), "_a01x_any")
			end
		else
			slot12 = prime_target.unit
			slot13 = t

			if not prime_target.unit.sound(slot11).speaking(slot11, prime_target.unit.sound(slot11)) then
				slot12 = prime_target.unit
				slot14 = true

				prime_target.unit.sound(slot11).say(slot11, prime_target.unit.sound(slot11), "stockholm_syndrome")
			end

			local queue_name = line .. "e_plu"
			slot18 = skip_alert

			self._do_action_intimidate(slot12, self, t, (not no_gesture and "cmd_come") or nil, queue_name, nil)

			slot13 = Network

			if Network.is_server(slot12) then
				slot13 = prime_target.unit
				slot14 = {
					type = "revive"
				}

				if prime_target.unit.brain(slot12).is_available_for_assignment(slot12, prime_target.unit.brain(slot12)) then
					local followup_objective = {
						interrupt_health = 1,
						interrupt_dis = -1,
						type = "free",
						action = {
							sync = true,
							body_part = 1,
							type = "idle"
						}
					}
					local objective = {
						type = "act",
						haste = "run",
						destroy_clbk_key = false
					}
					slot15 = self._unit
					slot15 = self._unit.movement(slot14)
					slot15 = self._unit.movement(slot14).nav_tracker(slot14)
					objective.nav_seg = self._unit.movement(slot14).nav_tracker(slot14).nav_segment(slot14)
					slot15 = self._unit
					slot15 = self._unit.movement(slot14)
					slot15 = self._unit.movement(slot14).nav_tracker(slot14)
					objective.pos = self._unit.movement(slot14).nav_tracker(slot14).field_position(slot14)
					slot18 = revive_SO_data
					objective.fail_clbk = callback(slot14, PlayerBleedOut, PlayerBleedOut, "on_civ_revive_failed")
					slot18 = revive_SO_data
					objective.complete_clbk = callback(slot14, PlayerBleedOut, PlayerBleedOut, "on_civ_revive_completed")
					slot18 = revive_SO_data
					objective.action_start_clbk = callback(slot14, PlayerBleedOut, PlayerBleedOut, "on_civ_revive_started")
					objective.action = {
						align_sync = true,
						type = "act",
						body_part = 1,
						variant = "revive",
						blocks = {
							light_hurt = -1,
							hurt = -1,
							action = -1,
							heavy_hurt = -1,
							aim = -1,
							walk = -1
						}
					}
					objective.action_duration = tweak_data.interaction.revive.timer
					objective.followup_objective = followup_objective
					revive_SO_data.sympathy_civ = prime_target.unit
					slot15 = prime_target.unit
					slot16 = objective

					prime_target.unit.brain().set_objective(, prime_target.unit.brain())
				end
			end
		end
	end

	return 
end
PlayerBleedOut._unregister_revive_SO = function (self)
	if not self._revive_SO_data then
		return 
	end

	if self._revive_SO_data.deathguard_SO_id then
		slot3 = self._revive_SO_data.deathguard_SO_id

		PlayerBleedOut._unregister_deathguard_SO(slot2)

		self._revive_SO_data.deathguard_SO_id = nil
	end

	if self._revive_SO_data.SO_id then
		slot3 = managers.groupai
		slot4 = self._revive_SO_data.SO_id

		managers.groupai.state(slot2).remove_special_objective(slot2, managers.groupai.state(slot2))

		self._revive_SO_data.SO_id = nil
	elseif self._revive_SO_data.rescuer then
		local rescuer = self._revive_SO_data.rescuer
		self._revive_SO_data.rescuer = nil
		slot4 = rescuer

		if alive(nil) then
			slot4 = rescuer
			slot5 = nil

			rescuer.brain(slot3).set_objective(slot3, rescuer.brain(slot3))
		end
	end

	if self._revive_SO_data.sympathy_civ then
		local sympathy_civ = self._revive_SO_data.sympathy_civ
		self._revive_SO_data.sympathy_civ = nil
		slot4 = sympathy_civ
		slot5 = nil

		sympathy_civ.brain(nil).set_objective(nil, sympathy_civ.brain(nil))
	end

	return 
end
PlayerBleedOut._register_deathguard_SO = function (my_unit)
	return 
end
PlayerBleedOut._unregister_deathguard_SO = function (so_id)
	slot3 = managers.groupai
	slot4 = so_id

	managers.groupai.state(slot2).remove_special_objective(slot2, managers.groupai.state(slot2))

	return 
end
PlayerBleedOut._start_action_bleedout = function (self, t)
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
PlayerBleedOut._end_action_bleedout = function (self, t)
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
PlayerBleedOut._update_movement = function (self, t, dt)
	if self._ext_network then
		local cur_pos = self._pos
		slot7 = self._last_sent_pos
		local move_dis = mvector3.distance_sq(slot5, cur_pos)

		if 22500 < move_dis or (400 < move_dis and 1.5 < t - self._last_sent_pos_t) then
			slot9 = cur_pos

			self._ext_network.send(slot6, self._ext_network, "action_walk_nav_point")

			slot8 = cur_pos

			mvector3.set(slot6, self._last_sent_pos)

			self._last_sent_pos_t = t
		end
	end

	return 
end
PlayerBleedOut.on_rescue_SO_administered = function (self, revive_SO_data, receiver_unit)
	if revive_SO_data.rescuer then
		slot7 = revive_SO_data.rescuer

		debug_pause(slot4, "[PlayerBleedOut:on_rescue_SO_administered] Already had a rescuer!!!!", receiver_unit)
	end

	revive_SO_data.rescuer = receiver_unit
	revive_SO_data.SO_id = nil

	return 
end
PlayerBleedOut.on_rescue_SO_failed = function (self, revive_SO_data, rescuer)
	if revive_SO_data.rescuer then
		revive_SO_data.rescuer = nil
		slot6 = revive_SO_data.variant

		PlayerBleedOut._register_revive_SO(slot4, revive_SO_data)
	end

	return 
end
PlayerBleedOut.on_rescue_SO_completed = function (self, revive_SO_data, rescuer)
	if revive_SO_data.sympathy_civ then
		local objective = {
			interrupt_health = 1,
			interrupt_dis = -1,
			type = "free",
			action = {
				sync = true,
				body_part = 1,
				type = "idle"
			}
		}
		slot6 = revive_SO_data.sympathy_civ
		slot7 = objective

		revive_SO_data.sympathy_civ.brain(slot5).set_objective(slot5, revive_SO_data.sympathy_civ.brain(slot5))
	end

	revive_SO_data.rescuer = nil

	return 
end
PlayerBleedOut.on_rescue_SO_started = function (self, revive_SO_data, rescuer)
	slot7 = managers.groupai
	slot7 = managers.groupai.state(slot6)

	for c_key, criminal in pairs(managers.groupai.state(slot6).all_AI_criminals(slot6)) do
		slot10 = rescuer

		if c_key ~= rescuer.key(slot9) then
			slot10 = criminal.unit
			slot10 = criminal.unit.brain(slot9)
			local obj = criminal.unit.brain(slot9).objective(slot9)

			if obj and obj.type == "revive" then
				slot12 = revive_SO_data.unit

				if obj.follow_unit.key(slot10) == revive_SO_data.unit.key(obj.follow_unit) then
					slot11 = criminal.unit
					slot12 = nil

					criminal.unit.brain(slot10).set_objective(slot10, criminal.unit.brain(slot10))
				end
			end
		end
	end

	return 
end
PlayerBleedOut.rescue_SO_verification = function (ignore_this, my_unit, unit)
	slot5 = unit
	slot5 = unit.movement(slot4)

	if not unit.movement(slot4).cool(slot4) then
		slot5 = my_unit
		slot6 = unit
		slot6 = unit.movement(my_unit.movement(slot4))
		slot3 = not my_unit.movement(slot4).team(slot4).foes[unit.movement(my_unit.movement(slot4)).team(my_unit.movement(slot4)).id]
	else
		slot3 = false

		if false then
			slot3 = true
		end
	end

	return slot3
end
PlayerBleedOut.on_civ_revive_completed = function (self, revive_SO_data, sympathy_civ)
	if sympathy_civ ~= revive_SO_data.sympathy_civ then
		slot7 = sympathy_civ

		debug_pause_unit(slot4, sympathy_civ, "[PlayerBleedOut:on_civ_revive_completed] idiot thinks he is reviving")

		return 
	end

	revive_SO_data.sympathy_civ = nil
	slot5 = revive_SO_data.unit
	slot6 = sympathy_civ

	revive_SO_data.unit.character_damage(slot4).revive(slot4, revive_SO_data.unit.character_damage(slot4))

	slot7 = "civilian_gives_ammo"

	if managers.player.has_category_upgrade(slot4, managers.player, "player") then
		slot6 = {
			name = "ammo",
			position = sympathy_civ.position(slot8),
			rotation = Rotation()
		}
		slot9 = sympathy_civ

		managers.game_play_central.spawn_pickup(slot4, managers.game_play_central)
	end

	return 
end
PlayerBleedOut.on_civ_revive_started = function (self, revive_SO_data, sympathy_civ)
	if sympathy_civ ~= revive_SO_data.sympathy_civ then
		slot7 = sympathy_civ

		debug_pause_unit(slot4, sympathy_civ, "[PlayerBleedOut:on_civ_revive_started] idiot thinks he is reviving")

		return 
	end

	slot5 = revive_SO_data.unit
	slot5 = revive_SO_data.unit.character_damage(slot4)

	revive_SO_data.unit.character_damage(slot4).pause_downed_timer(slot4)

	if revive_SO_data.SO_id then
		slot5 = managers.groupai
		slot6 = revive_SO_data.SO_id

		managers.groupai.state(slot4).remove_special_objective(slot4, managers.groupai.state(slot4))

		revive_SO_data.SO_id = nil
	elseif revive_SO_data.rescuer then
		local rescuer = revive_SO_data.rescuer
		revive_SO_data.rescuer = nil
		slot6 = rescuer

		if alive(slot5) then
			slot6 = rescuer
			slot7 = nil

			rescuer.brain(slot5).set_objective(slot5, rescuer.brain(slot5))
		end
	end

	return 
end
PlayerBleedOut.on_civ_revive_failed = function (self, revive_SO_data, sympathy_civ)
	if revive_SO_data.sympathy_civ then
		if sympathy_civ ~= revive_SO_data.sympathy_civ then
			slot7 = sympathy_civ

			debug_pause_unit(slot4, sympathy_civ, "[PlayerBleedOut:on_civ_revive_failed] idiot thinks he is reviving")

			return 
		end

		slot5 = revive_SO_data.unit
		slot5 = revive_SO_data.unit.character_damage(slot4)

		revive_SO_data.unit.character_damage(slot4).unpause_downed_timer(slot4)

		revive_SO_data.sympathy_civ = nil
	end

	return 
end
PlayerBleedOut.verif_clbk_is_unit_deathguard = function (self, enemy_unit)
	slot5 = enemy_unit
	local char_tweak = tweak_data.character[enemy_unit.base(slot4)._tweak_table]

	return char_tweak.deathguard
end
PlayerBleedOut.clbk_deathguard_administered = function (self, unit)
	slot4 = unit
	slot5 = false

	unit.movement(slot3).set_cool(slot3, unit.movement(slot3))

	return 
end
PlayerBleedOut.pre_destroy = function (self, unit)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self

		self._unregister_revive_SO(slot3)
	end

	return 
end
PlayerBleedOut.destroy = function (self)
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self

		self._unregister_revive_SO(slot2)
	end

	if self._dof_post_processor then
		slot3 = managers.viewport
		local vp = managers.viewport.first_active_viewport(slot2).vp(slot2)
		slot8 = "bloom_combine_post_processor"
		slot7 = self._dof_post_processor

		vp.set_post_processor_effect(managers.viewport.first_active_viewport(slot2), vp, "World", Idstring(slot7))
	end

	return 
end

return 
