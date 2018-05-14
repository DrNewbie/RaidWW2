-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not PlayerBipod then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerBipod = slot0
PlayerBipod.target_tilt = -5
PlayerBipod._shoulder_pos = nil
PlayerBipod._camera_pos = nil
function PlayerBipod:init(unit)
	slot5 = unit

	PlayerBipod.super.init(slot3, self)

	return 
end
function PlayerBipod:set_camera_positions(bipod_pos, camera_pos)
	slot7 = bipod_pos.z
	self._shoulder_pos = Vector3(slot4, bipod_pos.x, bipod_pos.y)
	slot7 = camera_pos.z
	self._camera_pos = Vector3(slot4, camera_pos.x, camera_pos.y)

	return 
end
function PlayerBipod:enter(state_data, enter_data)
	slot7 = enter_data

	PlayerBipod.super.enter(slot4, self, state_data)

	return 
end
function PlayerBipod:_enter(enter_data)
	slot4 = managers.player
	local player = managers.player.player_unit(slot3)

	if player then
		slot5 = self._unit

		if self._unit.base(slot4).is_local_player then
			slot5 = self._equipped_unit
			local tweak_data = self._equipped_unit.base(slot4).weapon_tweak_data(slot4)
			slot6 = self._equipped_unit
			slot6 = self._equipped_unit.base(self._equipped_unit.base(slot4))
			local speed_multiplier = self._equipped_unit.base(self._equipped_unit.base(slot4)).reload_speed_multiplier(self._equipped_unit.base(slot4))

			if not tweak_data.animations.reload_name_id then
				slot7 = self._equipped_unit
				local reload_name_id = self._equipped_unit.base(slot6).name_id
			end

			local equipped_unit_id = self._equipped_unit.base(slot7).name_id
			slot9 = player
			self._unit_deploy_position = player.position(self._equipped_unit)
			slot9 = self._unit
			slot9 = self._unit.camera(self._equipped_unit)
			slot9 = self._unit.camera(self._equipped_unit).camera_unit(self._equipped_unit)

			self._unit.camera(self._equipped_unit).camera_unit(self._equipped_unit).base(self._equipped_unit).set_limits(self._equipped_unit, self._unit.camera(self._equipped_unit).camera_unit(self._equipped_unit).base(self._equipped_unit), tweak_data.bipod_camera_spin_limit)

			slot10 = tweak_data.timers.deploy_bipod

			PlayerBipod.super.start_deploying_bipod(self._equipped_unit, PlayerBipod.super)

			slot9 = self._equipped_unit
			slot10 = "undeploy"

			self._equipped_unit.base(self._equipped_unit).tweak_data_anim_stop(self._equipped_unit, self._equipped_unit.base(self._equipped_unit))

			slot12 = tweak_data.animations.bipod_enter .. "_" .. equipped_unit_id
			slot11 = speed_multiplier
			local result = self._ext_camera.play_redirect(self._equipped_unit, self._ext_camera, Idstring(tweak_data.bipod_camera_pitch_limit))
			slot10 = self._equipped_unit
			slot12 = speed_multiplier
			local result_deploy = self._equipped_unit.base(self._ext_camera).tweak_data_anim_play(self._ext_camera, self._equipped_unit.base(self._ext_camera), "deploy")
			self._headbob = 0
			self._target_headbob = 0
			slot14 = 0

			self._ext_camera.set_shaker_parameter(self._equipped_unit.base(self._ext_camera), self._ext_camera, "headbob", "amplitude")

			slot12 = tweak_data.animations.bipod_recoil .. "_" .. equipped_unit_id
			PlayerStandard.IDS_RECOIL = Idstring(self._ext_camera)
			slot12 = tweak_data.animations.bipod_recoil_enter .. "_" .. equipped_unit_id
			PlayerStandard.IDS_RECOIL_ENTER = Idstring(self._ext_camera)
			slot12 = tweak_data.animations.bipod_recoil_loop .. "_" .. equipped_unit_id
			PlayerStandard.IDS_RECOIL_LOOP = Idstring(self._ext_camera)
			slot12 = tweak_data.animations.bipod_recoil_exit .. "_" .. equipped_unit_id
			slot10 = Idstring(self._ext_camera)
			PlayerStandard.IDS_RECOIL_EXIT = slot10
			slot11 = self._unit
			slot12 = "wp_steady_in"

			self._unit.sound_source(slot10).post_event(slot10, self._unit.sound_source(slot10))

			slot11 = self

			self._stance_entered(slot10)

			slot11 = self

			self._husk_bipod_data(slot10)
		end
	end

	return 
end
function PlayerBipod:exit(state_data, new_state_name)
	slot7 = new_state_name

	PlayerBipod.super.exit(slot4, self, state_data or self._state_data)

	slot5 = self._equipped_unit
	local tweak_data = self._equipped_unit.base(slot4).weapon_tweak_data(slot4)
	slot6 = self._equipped_unit
	local speed_multiplier = self._equipped_unit.base(self._equipped_unit.base(slot4)).reload_speed_multiplier(self._equipped_unit.base(slot4))
	local equipped_unit_id = self._equipped_unit.base(self._equipped_unit.base(self._equipped_unit.base(slot4))).name_id
	slot8 = self._equipped_unit
	slot9 = "deploy"

	self._equipped_unit.base(self._equipped_unit).tweak_data_anim_stop(self._equipped_unit, self._equipped_unit.base(self._equipped_unit))

	slot11 = tweak_data.animations.bipod_exit .. "_" .. equipped_unit_id
	local result = self._ext_camera.play_redirect(self._equipped_unit, self._ext_camera, Idstring(speed_multiplier))
	slot9 = self._equipped_unit
	slot11 = speed_multiplier
	local result_deploy = self._equipped_unit.base(self._ext_camera).tweak_data_anim_play(self._ext_camera, self._equipped_unit.base(self._ext_camera), "undeploy")
	slot10 = self._unit
	slot10 = self._unit.camera(self._equipped_unit.base(self._ext_camera))
	slot10 = self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera))

	self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera)).base(self._equipped_unit.base(self._ext_camera)).set_target_tilt(self._equipped_unit.base(self._ext_camera), self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera)).base(self._equipped_unit.base(self._ext_camera)))

	slot10 = self._unit
	slot10 = self._unit.camera(self._equipped_unit.base(self._ext_camera))
	slot10 = self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera))
	slot10 = self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera)).base(self._equipped_unit.base(self._ext_camera))

	self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera)).base(self._equipped_unit.base(self._ext_camera)).remove_limits(self._equipped_unit.base(self._ext_camera))

	slot10 = self._unit
	slot10 = self._unit.camera(self._equipped_unit.base(self._ext_camera))
	slot10 = self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera))
	self._unit.camera(self._equipped_unit.base(self._ext_camera)).camera_unit(self._equipped_unit.base(self._ext_camera)).base(self._equipped_unit.base(self._ext_camera)).bipod_location = nil
	local exit_data = {
		skip_equip = true
	}
	self._dye_risk = nil
	slot12 = "recoil"
	PlayerStandard.IDS_RECOIL = Idstring(0)
	slot12 = "recoil_enter"
	PlayerStandard.IDS_RECOIL_ENTER = Idstring(0)
	slot12 = "recoil_loop"
	PlayerStandard.IDS_RECOIL_LOOP = Idstring(0)
	slot12 = "recoil_exit"
	slot10 = Idstring(0)
	PlayerStandard.IDS_RECOIL_EXIT = slot10
	slot11 = self._unit
	slot12 = "wp_steady_out"

	self._unit.sound_source(slot10).post_event(slot10, self._unit.sound_source(slot10))

	slot11 = managers.network
	slot12 = self._unit
	local peer_id = managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10)).id(slot10)
	slot13 = {
		peer_id = peer_id
	}

	managers.player.set_bipod_data_for_peer(managers.network.session(slot10).peer_by_unit(slot10, managers.network.session(slot10)), managers.player)

	return exit_data
end
function PlayerBipod:_husk_bipod_data()
	slot3 = managers.network
	slot4 = self._unit
	local peer_id = managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2)).id(slot2)
	slot4 = self._unit
	local weapon = self._unit.inventory(managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2))).equipped_unit(managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2)))
	slot5 = weapon
	slot8 = "a_bp"
	local bipod_obj = weapon.get_object(self._unit.inventory(managers.network.session(slot2).peer_by_unit(slot2, managers.network.session(slot2))), Idstring(slot7))
	local bipod_pos = nil

	if bipod_obj then
		slot7 = bipod_obj
		bipod_pos = bipod_obj.position(slot6)
		slot9 = bipod_pos

		Application.trace(slot6, Application, "Getting bipod obj: ")
	else
		slot9 = bipod_pos

		Application.trace(slot6, Application, "Missing bipod obj: ")
	end

	slot9 = self._m_pos.z
	local body_pos = Vector3(slot6, self._m_pos.x, self._m_pos.y)
	slot9 = {
		peer_id = peer_id,
		bipod_pos = bipod_pos,
		body_pos = body_pos
	}

	managers.player.set_bipod_data_for_peer(self._m_pos.x, managers.player)

	slot8 = managers.network
	slot11 = body_pos

	managers.network.session(self._m_pos.x).send_to_peers_synched(self._m_pos.x, managers.network.session(self._m_pos.x), "sync_bipod", bipod_pos)

	return 
end
function PlayerBipod:update(t, dt)
	slot7 = dt

	PlayerBipod.super.update(slot4, self, t)

	slot5 = self._equipped_unit
	slot5 = self._equipped_unit.base(slot4)
	local deploy_valid = self._equipped_unit.base(slot4).is_bipod_usable(slot4)
	slot7 = managers.player
	slot7 = managers.player.player_unit(t)
	local movement_distance = self._unit_deploy_position - managers.player.player_unit(t).position(t).length(managers.player.player_unit(t).position(t))
	slot7 = managers.player
	slot7 = managers.player.player_unit(self._unit_deploy_position - managers.player.player_unit(t).position(t))
	slot7 = managers.player.player_unit(self._unit_deploy_position - managers.player.player_unit(t).position(t)).mover(self._unit_deploy_position - managers.player.player_unit(t).position(t))

	if not managers.player.player_unit(self._unit_deploy_position - managers.player.player_unit(t).position(t)).mover(self._unit_deploy_position - managers.player.player_unit(t).position(t)).standing(self._unit_deploy_position - managers.player.player_unit(t).position(t)) or 10 < movement_distance or not deploy_valid then
		slot9 = "standard"

		self.exit(slot6, self, nil)

		slot8 = "standard"

		managers.player.set_player_state(slot6, managers.player)
	end

	return 
end
function PlayerBipod:set_tweak_data(name)
	return 
end
function PlayerBipod:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot6 = self

	self._determine_move_direction(self)

	slot7 = t

	self._update_interaction_timers(self, self)

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

	self._update_melee_timers(slot6, self, t)

	slot9 = input

	self._update_equip_weapon_timers(slot6, self, t)

	slot8 = t

	self._update_running_timers(slot6, self)

	slot9 = dt

	self._update_zipline_timers(slot6, self, t)

	slot10 = input

	self._check_stats_screen(slot6, self, t, dt)

	slot9 = input

	self._update_foley(slot6, self, t)

	local new_action = false
	slot10 = input
	new_action = self._check_action_reload(self, self, t)

	if not new_action then
		slot10 = input
		new_action = self._check_action_primary_attack(slot7, self, t)
		self._shooting = new_action
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_jump(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_run(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_change_weapon(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_unmount_bipod(slot7, self, t)
	end

	if not new_action then
		slot8 = managers.blackmarket
		local projectile_entry = managers.blackmarket.equipped_projectile(slot7)

		if tweak_data.projectiles[projectile_entry].is_a_grenade then
			slot11 = input

			self._check_action_throw_grenade(slot8, self, t)
		else
			slot11 = input

			self._check_action_throw_projectile(slot8, self, t)
		end
	end

	slot10 = input

	self._check_action_steelsight(slot7, self, t)

	slot10 = input

	self._check_use_item(slot7, self, t)

	return 
end
function PlayerBipod:interaction_blocked()
	return true
end
function PlayerBipod:_check_step(t)
	return 
end
function PlayerBipod:_check_action_reload(t, input)
	local new_action = nil
	local action_wanted = input.btn_reload_press

	if action_wanted and self._equipped_unit then
		slot7 = self._equipped_unit
		slot7 = self._equipped_unit.base(slot6)

		if not self._equipped_unit.base(slot6).clip_full(slot6) then
			slot9 = "standard"

			self.exit(slot6, self, nil)

			slot8 = "standard"

			managers.player.set_player_state(slot6, managers.player)

			slot8 = t

			self._start_action_reload_enter(slot6, self)

			new_action = true
		end
	end

	return new_action
end
function PlayerBipod:_check_action_unmount_bipod(t, input)
	if not input.btn_deploy_bipod then
		return false
	end

	slot5 = self

	self._unmount_bipod(slot4)

	return true
end
function PlayerBipod:_unmount_bipod()
	local weapon = self._equipped_unit.base(slot2)
	slot6 = weapon._parts
	local bipod_part = managers.weapon_factory.get_parts_from_weapon_by_perk(self._equipped_unit, managers.weapon_factory, "bipod")

	if bipod_part and bipod_part[1] then
		local bipod_unit = bipod_part[1].unit.base(slot4)
		slot6 = bipod_unit

		bipod_unit._unmount(bipod_part[1].unit)

		slot8 = "standard"

		self.exit(bipod_part[1].unit, self, nil)

		slot7 = "standard"

		managers.player.set_player_state(bipod_part[1].unit, managers.player)
	end

	return 
end
function PlayerBipod:_check_action_jump(t, input)
	if input.btn_jump_press then
		slot5 = self

		self._unmount_bipod(slot4)

		slot5 = managers.player
		local current_state = managers.player.get_current_state(slot4)

		if current_state then
			slot8 = input

			current_state._check_action_jump(slot5, current_state, t)
		end

		return true
	end

	return false
end
function PlayerBipod:_check_action_run(t, input)
	slot6 = "move"
	local move = self._controller.get_input_axis(slot4, self._controller)

	if input.btn_run_state and 0.1 < move.y then
		slot6 = self

		self._unmount_bipod(slot5)

		slot6 = managers.player
		local current_state = managers.player.get_current_state(slot5)

		if current_state then
			slot8 = t

			current_state._start_action_running(slot6, current_state)
		end

		return true
	end

	return false
end
function PlayerBipod:_check_change_weapon(t, input)
	if input.btn_switch_weapon_press or input.btn_primary_choice == 1 then
		slot5 = self

		self._unmount_bipod(slot4)

		slot5 = managers.player
		local current_state = managers.player.get_current_state(slot4)

		if current_state then
			slot8 = input

			current_state._check_change_weapon(slot5, current_state, t)

			slot8 = input

			current_state._check_action_equip(slot5, current_state, t)
		end

		return true
	end

	return false
end
function PlayerBipod:_check_use_item(t, input)
	if input.btn_use_item_press then
		slot5 = self

		self._unmount_bipod(slot4)

		slot5 = managers.player
		local current_state = managers.player.get_current_state(slot4)

		if current_state then
			slot8 = input

			current_state._check_use_item(slot5, current_state, t)
		end

		return true
	end

	return false
end
function PlayerBipod:_check_action_throw_grenade(t, input)
	if PlayerBase.USE_GRENADES then
		slot5 = self._unit
		slot5 = self._unit.base(slot4)
		slot3 = self._unit.base(slot4).stats_screen_visible(slot4)

		if self._unit.base(slot4).stats_screen_visible(slot4) then
			slot3 = false
		end
	else
		local action_forbidden = true
	end

	if input.btn_throw_grenade_press then
		slot6 = managers.player

		if managers.player.can_throw_grenade(slot5) and not action_forbidden then
			slot6 = self

			self._unmount_bipod(slot5)

			slot6 = managers.player
			local current_state = managers.player.get_current_state(slot5)

			if current_state then
				slot9 = input

				current_state._start_action_throw_grenade(slot6, current_state, t)
			end

			return true
		end
	end

	return false
end
function PlayerBipod:_check_action_throw_projectile(t, input)
	if PlayerBase.USE_GRENADES then
		slot5 = managers.player
	else
		local action_forbidden = true
	end

	if input.btn_projectile_press and not action_forbidden then
		slot6 = self

		self._unmount_bipod(slot5)

		slot6 = managers.player
		local current_state = managers.player.get_current_state(slot5)

		if current_state then
			slot9 = input

			current_state._start_action_throw_projectile(slot6, current_state, t)
		end

		return true
	end

	return false
end
function PlayerBipod:_check_action_equip(t, input)
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
				slot9 = self

				self._unmount_bipod(slot8)
			end
		end
	end

	return new_action
end
function PlayerBipod:_check_action_steelsight(t, input)
	return 
end
function PlayerBipod:_update_movement(t, dt)
	return 
end
function PlayerBipod:_start_action_jump(...)
	return 
end
function PlayerBipod:_perform_jump(jump_vec)
	return 
end
function PlayerBipod:_get_max_walk_speed(...)
	return 
end
function PlayerBipod:_get_walk_headbob(...)
	return 0
end
function PlayerBipod:pre_destroy(unit)
	return 
end
function PlayerBipod:destroy()
	return 
end

return 
