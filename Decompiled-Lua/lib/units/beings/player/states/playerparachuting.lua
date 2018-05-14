if not PlayerParachuting then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerParachuting = slot0
function PlayerParachuting:init(unit)
	slot5 = unit

	PlayerParachuting.super.init(slot3, self)

	self._tweak_data = tweak_data.player.parachute

	return 
end
function PlayerParachuting:enter(state_data, enter_data)
	slot6 = "Enter parachuting state"

	print(slot4, "[PlayerParachuting:enter]")

	slot7 = enter_data

	PlayerParachuting.super.enter(slot4, self, state_data)

	if self._state_data.ducking then
		slot5 = self

		self._end_action_ducking(slot4)
	end

	slot5 = self._unit
	slot5 = self._unit.mover(slot4)
	self._original_damping = self._unit.mover(slot4).damping(slot4)
	slot5 = self._unit
	slot6 = self._tweak_data.gravity / self._tweak_data.terminal_velocity

	self._unit.mover(slot4).set_damping(slot4, self._unit.mover(slot4))

	slot5 = self._unit
	slot8 = false

	self._unit.sound(slot4).play(slot4, self._unit.sound(slot4), "parachute_open", nil)

	return 
end
function PlayerParachuting:_enter(enter_data)
	slot4 = self._unit
	slot4 = self._unit.camera(slot3)

	if not self._unit.camera(slot3).anim_data(slot3).equipped then
		slot4 = self._unit
		slot5 = self.IDS_EQUIP

		self._unit.camera(slot3).play_redirect(slot3, self._unit.camera(slot3))

		slot4 = self._unit
		slot4 = self._unit.inventory(slot3)

		self._unit.inventory(slot3).show_equipped_unit(slot3)
	end

	slot2 = self._unit.movement(slot3)
	slot5 = self._unit

	if not self._unit.movement(self._unit).fall_rotation then
		slot7 = 0
		slot3 = Rotation(slot4, 0, 0)
	end

	slot2.fall_rotation = slot3
	slot4 = self

	self._pitch_up(slot3)

	slot4 = self

	self._set_camera_limits(slot3)

	return 
end
function PlayerParachuting:exit(state_data, new_state_name)
	slot6 = "Exiting parachuting state"

	print(slot4, "[PlayerParachuting:exit]")

	slot6 = state_data

	PlayerParachuting.super.exit(slot4, self)

	slot5 = self._unit
	slot6 = self._original_damping or 1

	self._unit.mover(slot4).set_damping(slot4, self._unit.mover(slot4))

	slot5 = self

	self._remove_camera_limits(slot4)

	self._state_data.in_air = false
	slot5 = self._unit
	slot8 = false

	self._unit.sound(false).play(false, self._unit.sound(false), "parachute_landing", nil)

	return 
end
function PlayerParachuting:interaction_blocked()
	return true
end
function PlayerParachuting:bleed_out_blocked()
	return true
end
function PlayerParachuting:update(t, dt)
	slot7 = dt

	PlayerParachuting.super.update(slot4, self, t)

	return 
end
function PlayerParachuting:_update_movement(t, dt)
	slot6 = "move"
	local direction = self._controller.get_input_axis(slot4, self._controller)

	if not self._gnd_ray then
		slot6 = self._camera_unit
		slot10 = dt

		self._camera_unit.base(slot5).update_tilt_smooth(slot5, self._camera_unit.base(slot5), direction.x, self._tweak_data.camera.tilt.max, self._tweak_data.camera.tilt.speed)
	end

	slot6 = self._unit
	local current_rot = self._unit.movement(slot5).fall_rotation
	local new_rot = nil
	local delta = self._tweak_data.movement.rotation_speed * dt

	if 0 < direction.x then
		local yaw = current_rot.yaw(slot8) - delta
		slot11 = current_rot.pitch(slot12)
		slot14 = current_rot
		new_rot = Rotation(current_rot, yaw, current_rot.roll(current_rot))
		slot10 = self._unit
		self._unit.movement(current_rot).fall_rotation = new_rot
	elseif direction.x < 0 then
		local yaw = current_rot.yaw(slot8) + delta
		slot11 = current_rot.pitch(slot12)
		slot14 = current_rot
		new_rot = Rotation(current_rot, yaw, current_rot.roll(current_rot))
		slot10 = self._unit
		self._unit.movement(current_rot).fall_rotation = new_rot
	end

	if 0 < direction.y and self._move_dir then
		local old_pos = self._unit.position(slot8)
		slot13 = self._move_dir
		slot11 = old_pos + self._move_dir.normalized(slot12) * self._tweak_data.movement.forward_speed * dt

		self._unit.set_position(self._unit, self._unit)

		slot10 = self._ext_movement
		slot13 = self._unit

		self._ext_movement.set_m_pos(self._unit, self._unit.position(self._tweak_data.movement.forward_speed))
	end

	slot9 = self._unit
	local pos = self._unit.position(slot8)

	if 0.2 < t - self._last_sent_pos_t then
		slot12 = pos
		slot15 = self._camera_unit

		self._ext_network.send(slot9, self._ext_network, "sync_fall_position", self._camera_unit.rotation(slot14))

		self._last_sent_pos_t = t
	end

	return 
end
function PlayerParachuting:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot7 = "move"
	self._stick_move = self._controller.get_input_axis(self, self._controller)
	slot6 = self._stick_move

	if mvector3.length(self) < 0.1 then
		self._move_dir = nil
	else
		slot6 = self._stick_move
		self._move_dir = mvector3.copy(slot5)
		slot7 = math.UP
		local cam_flat_rot = Rotation(slot5, self._cam_fwd_flat)
		slot8 = cam_flat_rot

		mvector3.rotate_with(self._cam_fwd_flat, self._move_dir)
	end

	slot6 = managers.blackmarket
	local projectile_entry = managers.blackmarket.equipped_projectile(slot5)

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

	self._update_charging_weapon_timers(slot6, self, t)

	slot9 = input

	self._update_equip_weapon_timers(slot6, self, t)

	if self._change_item_expire_t and self._change_item_expire_t <= t then
		self._change_item_expire_t = nil
	end

	if self._change_weapon_pressed_expire_t and self._change_weapon_pressed_expire_t <= t then
		self._change_weapon_pressed_expire_t = nil
	end

	slot9 = dt

	self._update_steelsight_timers(slot6, self, t)

	slot10 = input

	self._check_stats_screen(slot6, self, t, dt)

	slot9 = input

	self._update_foley(slot6, self, t)

	local new_action = nil
	local anim_data = self._ext_anim

	if not new_action then
		slot11 = input
		new_action = self._check_action_weapon_gadget(slot8, self, t)
	end

	if not new_action then
		slot11 = input
		new_action = self._check_action_weapon_firemode(slot8, self, t)
	end

	if not new_action then
	end

	if not new_action then
		slot11 = input
		new_action = self._check_action_reload(slot8, self, t)
	end

	if not new_action then
		slot11 = input
		new_action = self._check_change_weapon(slot8, self, t)
	end

	if not new_action then
		slot11 = input
		new_action = self._check_action_primary_attack(slot8, self, t)
	end

	if not new_action then
		slot11 = input
		new_action = self._check_action_equip(slot8, self, t)
	end

	if not new_action then
		slot9 = managers.blackmarket
		local projectile_entry = managers.blackmarket.equipped_projectile(slot8)

		if tweak_data.projectiles[projectile_entry].is_a_grenade then
			slot12 = input
			new_action = self._check_action_throw_grenade(slot9, self, t)
		else
			slot12 = input
			new_action = self._check_action_throw_projectile(slot9, self, t)
		end
	end

	slot11 = input

	self._check_action_steelsight(slot8, self, t)

	return 
end
function PlayerParachuting:_get_walk_headbob()
	return 0
end
function PlayerParachuting:_set_camera_limits()
	slot3 = self._camera_unit
	slot4 = self._tweak_data.camera.target_pitch

	self._camera_unit.base(slot2).set_pitch(slot2, self._camera_unit.base(slot2))

	slot3 = self._camera_unit
	slot5 = self._tweak_data.camera.limits.pitch

	self._camera_unit.base(slot2).set_limits(slot2, self._camera_unit.base(slot2), self._tweak_data.camera.limits.spin)

	return 
end
function PlayerParachuting:_remove_camera_limits()
	slot3 = self._camera_unit
	self._camera_unit.base(slot2)._p_exit = true
	slot3 = self._camera_unit
	slot3 = self._camera_unit.base(true)

	self._camera_unit.base(true).remove_limits(true)

	slot3 = self._camera_unit
	slot4 = 0

	self._camera_unit.base(true).set_target_tilt(true, self._camera_unit.base(true))

	return 
end
function PlayerParachuting:_check_action_interact(t, input)
	local new_action = nil
	local interaction_wanted = input.btn_interact_press

	if interaction_wanted then
		slot8 = "interact"
		local action_forbidden = self.chk_action_forbidden(slot6, self)

		if not action_forbidden then
			slot9 = t

			self._start_action_state_standard(slot7, self)
		end
	end

	return new_action
end
function PlayerParachuting:_update_foley(t, input)
	if self._gnd_ray then
		slot5 = self._camera_unit
		slot6 = 0

		self._camera_unit.base(slot4).set_target_tilt(slot4, self._camera_unit.base(slot4))

		slot7 = 1.5

		self._ext_camera.play_shaker(slot4, self._ext_camera, "player_land")

		slot6 = "hard_land"

		managers.rumble.play(slot4, managers.rumble)

		slot6 = "standard"

		managers.player.set_player_state(slot4, managers.player)
	end

	return 
end
function PlayerParachuting:_pitch_up()
	local t = Application.time(slot2)
	slot4 = self._camera_unit
	slot8 = 1.7

	self._camera_unit.base(Application).animate_pitch(Application, self._camera_unit.base(Application), t, nil, self._tweak_data.camera.target_pitch)

	return 
end

return 
