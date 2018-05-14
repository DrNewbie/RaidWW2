if not PlayerFreefall then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerFreefall = slot0
function PlayerFreefall:init(unit)
	slot5 = unit

	PlayerFreefall.super.init(slot3, self)

	self._tweak_data = tweak_data.player.freefall
	self._dt = 0

	return 
end
function PlayerFreefall:enter(state_data, enter_data)
	slot6 = "Enter freefall state"

	print(slot4, "[PlayerFreefall:enter]")

	slot7 = enter_data

	PlayerFreefall.super.enter(slot4, self, state_data)

	if self._state_data.ducking then
		slot5 = self

		self._end_action_ducking(slot4)
	end

	slot5 = self

	self._interupt_action_steelsight(slot4)

	slot5 = self
	slot8 = managers.player
	slot8 = managers.player.player_timer(slot7)

	self._interupt_action_melee(slot4, managers.player.player_timer(slot7).time(slot7))

	slot5 = self
	slot8 = managers.player
	slot8 = managers.player.player_timer(slot7)

	self._interupt_action_ladder(slot4, managers.player.player_timer(slot7).time(slot7))

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

	slot6 = self._unit
	slot6 = self._unit.mover(slot5)
	self._original_damping = self._unit.mover(slot5).damping(slot5)
	slot6 = self._unit
	slot7 = self._tweak_data.gravity / self._tweak_data.terminal_velocity

	self._unit.mover(slot5).set_damping(slot5, self._unit.mover(slot5))

	slot6 = self._unit
	slot9 = false

	self._unit.sound(slot5).play(slot5, self._unit.sound(slot5), "free_falling", nil)

	return 
end
function PlayerFreefall:_enter(enter_data)
	slot4 = self._ext_camera

	if self._ext_camera.anim_data(slot3).equipped then
		slot5 = self.IDS_UNEQUIP

		self._ext_camera.play_redirect(slot3, self._ext_camera)
	end

	slot2 = self._unit.movement(slot3)
	slot5 = self._unit

	if not self._unit.movement(self._unit).fall_rotation then
		slot7 = 0
		slot3 = Rotation(slot4, 0, 0)
	end

	slot2.fall_rotation = slot3
	slot4 = self

	self._pitch_down(slot3)

	slot4 = self

	self._set_camera_limits(slot3)

	slot4 = self._ext_camera
	slot6 = 0
	self._shaker_id = self._ext_camera.shaker(slot3).play(slot3, self._ext_camera.shaker(slot3), "player_freefall")

	return 
end
function PlayerFreefall:exit(state_data, new_state_name)
	slot6 = "Exiting freefall state"

	print(slot4, "[PlayerFreefall:exit]")

	slot6 = state_data

	PlayerFreefall.super.exit(slot4, self)

	slot5 = self._unit
	slot6 = self._original_damping or 1

	self._unit.mover(slot4).set_damping(slot4, self._unit.mover(slot4))

	slot5 = self

	self._remove_camera_limits(slot4)

	slot5 = self._ext_camera
	slot6 = self._shaker_id

	self._ext_camera.shaker(slot4).stop(slot4, self._ext_camera.shaker(slot4))

	return 
end
function PlayerFreefall:interaction_blocked()
	return true
end
function PlayerFreefall:bleed_out_blocked()
	return true
end
function PlayerFreefall:_chk_play_falling_anim()
	if not self._played_unequip_animation then
		slot3 = self._ext_camera

		if not self._ext_camera.anim_data(slot2).unequipping then
			slot4 = self.IDS_FALLING

			self._ext_camera.play_redirect(slot2, self._ext_camera)

			slot3 = self._unit
			slot3 = self._unit.inventory(slot2)

			self._unit.inventory(slot2).hide_equipped_unit(slot2)

			self._played_unequip_animation = true
		end
	end

	return 
end
function PlayerFreefall:update(t, dt)
	slot7 = dt

	PlayerFreefall.super.update(slot4, self, t)

	self._last_shake_update = (self._last_shake_update or 0) + dt

	if 0.2 < self._last_shake_update then
		slot11 = self._unit
		slot11 = self._unit.mover(slot10)
		slot9 = self._unit.mover(slot10).velocity(slot10).z
		slot7 = math.abs(slot8) / self._tweak_data.terminal_velocity
		local shake_amplitude = math.lerp(slot4, self._tweak_data.camera.shake.min, self._tweak_data.camera.shake.max)
		slot6 = self._ext_camera
		slot9 = shake_amplitude

		self._ext_camera.shaker(self._tweak_data.camera.shake.min).set_parameter(self._tweak_data.camera.shake.min, self._ext_camera.shaker(self._tweak_data.camera.shake.min), self._shaker_id, "amplitude")

		self._last_shake_update = 0
	end

	slot5 = self

	self._chk_play_falling_anim(slot4)

	return 
end
function PlayerFreefall:_update_movement(t, dt)
	slot6 = "move"
	local direction = self._controller.get_input_axis(slot4, self._controller)

	if not self._gnd_ray and self._tweak_data.camera then
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
function PlayerFreefall:_update_check_actions(t, dt)
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

	slot9 = input

	self._check_stats_screen(slot5, self, t, dt)

	slot8 = input

	self._update_foley(slot5, self, t)

	local new_action = nil

	if not new_action then
	end

	if not new_action and self._state_data.ducking then
		slot8 = t

		self._end_action_ducking(slot6, self)
	end

	return 
end
function PlayerFreefall:_get_walk_headbob()
	return 0
end
function PlayerFreefall:_set_camera_limits()
	slot3 = self._camera_unit
	slot4 = self._tweak_data.camera.target_pitch

	self._camera_unit.base(slot2).set_pitch(slot2, self._camera_unit.base(slot2))

	slot3 = self._camera_unit
	slot5 = self._tweak_data.camera.limits.pitch

	self._camera_unit.base(slot2).set_limits(slot2, self._camera_unit.base(slot2), self._tweak_data.camera.limits.spin)

	return 
end
function PlayerFreefall:_remove_camera_limits()
	slot3 = self._camera_unit
	slot3 = self._camera_unit.base(slot2)

	self._camera_unit.base(slot2).remove_limits(slot2)

	slot3 = self._camera_unit
	slot4 = 0

	self._camera_unit.base(slot2).set_target_tilt(slot2, self._camera_unit.base(slot2))

	return 
end
function PlayerFreefall:_check_action_interact(t, input)
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
function PlayerFreefall:_pitch_down()
	local t = Application.time(slot2)
	slot4 = self._camera_unit
	slot8 = 1.7

	self._camera_unit.base(Application).animate_pitch(Application, self._camera_unit.base(Application), t, nil, self._tweak_data.camera.target_pitch)

	return 
end

return 
