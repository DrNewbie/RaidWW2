MountedWeapon = MountedWeapon or class()
MountedWeapon.SEQUENCE_FIRE = "fire"
function MountedWeapon:init(unit)
	self._unit = unit
	slot7 = "mounted_weapon"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(true))

	self._turret_sync_dt = 0
	slot5 = tweak_data.mounted_weapon[self.tweak_data]

	self.set_tweak_data(slot3, self)

	slot4 = self

	self.set_cannon_sound_source(slot3)

	slot7 = self._unit

	self.set_turret_target_rot(slot3, self, self._unit.rotation(self.tweak_data))

	self._turret_rot_forced = false
	self._main_cannon_cooldown = self._tweak_data.main_cannon_reload_speed
	self._main_cannon_cooldown_counter = self._main_cannon_cooldown + 1
	slot4 = self._unit
	slot9 = self._unit
	slot7 = self._unit.vehicle_driving(slot8)._tweak_data.seats.gunner.fire_point
	self._main_cannon_locator = self._unit.get_object(slot3, Idstring(0))

	return 
end
function MountedWeapon:set_cannon_sound_source()
	self._main_cannon_soundsource = nil
	local snd_main_cannon = nil
	slot4 = self._unit

	if self._unit.vehicle_driving(slot3) then
		slot4 = self._unit

		if self._unit.vehicle_driving(slot3)._tweak_data.seats.gunner then
			slot4 = self._unit
			slot9 = self._unit
			slot7 = self._unit.vehicle_driving(slot8)._tweak_data.seats.gunner.fire_point
			snd_main_cannon = self._unit.get_object(slot3, Idstring(slot6))

			if snd_main_cannon then
				slot5 = "mounted_weapon"
				self._main_cannon_soundsource = SoundDevice.create_source(slot3, SoundDevice)
				slot5 = snd_main_cannon

				self._main_cannon_soundsource.link(slot3, self._main_cannon_soundsource)
			end
		end
	end

	return 
end
function MountedWeapon:set_tweak_data(data)
	self._tweak_data = data

	if self._tweak_data.turret then
		self._turret = deep_clone(slot3)
		slot5 = self._unit
		slot8 = self._turret.locator
		self._turret.object = self._unit.get_object(self._tweak_data.turret, Idstring(slot7))
		slot5 = self._unit
		slot8 = self._turret.gun_locator
		self._turret.gun_object = self._unit.get_object(self._tweak_data.turret, Idstring(slot7))
	else
		self._turret = {}
	end

	return 
end
function MountedWeapon:update(unit, t, dt)
	slot8 = dt

	self.update_turret(slot5, self, t)

	return 
end
function MountedWeapon:main_cannon_fire()
	if self._main_cannon_cooldown < self._main_cannon_cooldown_counter then
		slot3 = self._unit
		slot8 = self._unit
		slot6 = self._unit.vehicle_driving(slot7)._tweak_data.seats.gunner.fire_point
		self._main_cannon_locator = self._unit.get_object(slot2, Idstring(slot5))
		slot3 = self._main_cannon_locator
		slot3 = self._main_cannon_locator.rotation(slot2)
		local direction = self._main_cannon_locator.rotation(slot2).y(slot2)
		slot5 = self._main_cannon_locator
		slot3 = self._main_cannon_locator.position(Idstring)
		self._tank_shell = {
			position = slot3,
			direction = direction
		}
		slot4 = World
		slot5 = {
			effect = Idstring(slot7),
			position = self._main_cannon_locator.position(slot7),
			normal = direction
		}
		slot8 = self._tweak_data.effect.main_cannon_fire
		slot8 = self._main_cannon_locator

		World.effect_manager(slot3).spawn(slot3, World.effect_manager(slot3))

		if self._main_cannon_soundsource then
			slot5 = self._tweak_data.sound.main_cannon_fire

			self._main_cannon_soundsource.post_event(slot3, self._main_cannon_soundsource)
		end

		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = MountedWeapon.SEQUENCE_FIRE

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = MountedWeapon.SEQUENCE_FIRE

				self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
			end
		end

		self._main_cannon_cooldown_counter = 0
	end

	return 
end
function MountedWeapon:set_turret_target_rot(rot, dt)
	slot6 = rot
	self._turret.target_rot_yaw = rot.yaw(slot5)
	slot6 = rot
	self._turret.target_rot_pitch = rot.pitch(slot5)
	self._turret.target_rot = rot
	self._turret_rot_forced = true

	if dt then
		if 1 < self._turret_sync_dt then
			slot5 = managers.network
			slot8 = rot

			managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_vehicle_turret_rot", self._unit)

			self._turret_sync_dt = 0
		else
			self._turret_sync_dt = self._turret_sync_dt + dt
		end
	end

	return 
end
function MountedWeapon:update_turret(t, dt)
	if not self._turret or not self._turret.object then
		return 
	end

	if not self._turret_rot_forced then
		slot5 = self._unit
		local rot = self._unit.rotation(slot4)
		slot7 = rot
		self._turret.target_rot_yaw = rot.yaw(slot6)
		slot7 = rot
		self._turret.target_rot_pitch = rot.pitch(slot6)
	end

	slot5 = self._turret.object
	local turret_rot = self._turret.object.rotation(slot4)
	slot7 = turret_rot
	local diff_yaw = self._turret.target_rot_yaw - turret_rot.yaw(slot6)

	if 180 < diff_yaw then
		diff_yaw = diff_yaw - 360
	elseif diff_yaw < -180 then
		diff_yaw = diff_yaw + 360
	end

	local delta_yaw = 10 * dt
	local turret_local_rot = self._turret.object.local_rotation(slot7)
	slot9 = turret_local_rot
	local yaw = turret_local_rot.yaw(self._turret.object)

	if 3 < diff_yaw then
		slot10 = turret_local_rot
		yaw = turret_local_rot.yaw(slot9) + delta_yaw
	elseif diff_yaw < -3 then
		slot10 = turret_local_rot
		yaw = turret_local_rot.yaw(slot9) - delta_yaw
	end

	local gun_rot = self._turret.gun_object.rotation(slot9)
	slot11 = self._turret.gun_object
	local gun_local_rot = self._turret.gun_object.local_rotation(self._turret.gun_object)
	local diff_pitch = self._turret.target_rot_pitch - gun_rot.pitch(slot12)
	local delta_pitch = 10 * dt
	slot14 = gun_local_rot
	local pitch = gun_local_rot.pitch(gun_rot)

	if 3 < diff_pitch then
		slot15 = gun_local_rot
		pitch = gun_local_rot.pitch(slot14) + delta_pitch
	elseif diff_pitch < -3 then
		slot15 = gun_local_rot
		pitch = gun_local_rot.pitch(slot14) - delta_pitch
	end

	slot15 = self._turret.object
	slot22 = turret_local_rot

	self._turret.object.set_local_rotation(slot14, Rotation(slot17, yaw, turret_local_rot.roll(turret_local_rot)))

	slot15 = self._turret.gun_object
	slot19 = pitch
	slot22 = gun_local_rot

	self._turret.gun_object.set_local_rotation(slot14, Rotation(slot17, gun_local_rot.yaw(turret_local_rot.pitch(gun_local_rot)), gun_local_rot.roll(turret_local_rot)))

	if self._tank_shell then
		slot15 = self._tank_shell.position
		slot18 = self._main_cannon_locator

		if self._turret.range < mvector3.distance(slot14, self._main_cannon_locator.position(slot17)) then
			self._tank_shell = nil
		end
	end

	if self._tank_shell then
		VehicleDrivingExt.cumulative_dt = VehicleDrivingExt.cumulative_dt + dt
		VehicleDrivingExt.cumulative_gravity = VehicleDrivingExt.cumulative_gravity + 9.81 * dt
		slot18 = -VehicleDrivingExt.cumulative_gravity
		local new_position = self._tank_shell.position + self._tank_shell.direction * self._tweak_data.main_cannon_shell_speed * dt + Vector3(self._tweak_data.main_cannon_shell_speed, 0, 0)
		slot19 = new_position
		local raycast = World.raycast(self._tweak_data.main_cannon_shell_speed, World, "ray", self._tank_shell.position)
		slot20 = new_position
		slot23 = raycast

		Application.trace(World, Application, "raycast: ", self._tank_shell.position, inspect(slot22))

		if raycast then
			slot17 = World
			slot18 = {
				effect = Idstring(slot20),
				position = raycast.hit_position,
				normal = raycast.normal
			}

			World.effect_manager(slot16).spawn(slot16, World.effect_manager(slot16))

			self._tank_shell = nil
			VehicleDrivingExt.cumulative_dt = 0
			VehicleDrivingExt.cumulative_gravity = 0
			slot24 = 2
			slot19 = raycast.hit_position + Vector3(self._tweak_data.effect.main_cannon_fire_hit, 0, 0)

			self._tank_main_cannon_hit_explosion(0, self, raycast)
		else
			self._tank_shell.position = new_position
		end
	end

	self._main_cannon_cooldown_counter = self._main_cannon_cooldown_counter + dt

	return 
end
function MountedWeapon:_update_tank_input(dt)
	local move_d = self._controller.get_input_axis(slot3, self._controller)
	local forced_gear = -1
	local vehicle_state = self._vehicle.get_state("drive")
	slot7 = vehicle_state

	if vehicle_state.get_speed(self._vehicle) < 0.5 and move_d.y < 0 then
		slot7 = vehicle_state

		if vehicle_state.get_gear(slot6) ~= 0 then
			forced_gear = 0
		end
	end

	slot7 = vehicle_state

	if vehicle_state.get_speed(slot6) < 0.5 and 0 < move_d.y then
		slot7 = vehicle_state

		if vehicle_state.get_gear(slot6) ~= 2 then
			forced_gear = 2
		end
	end

	local direction = 1
	slot8 = vehicle_state

	if vehicle_state.get_gear(slot7) == 0 and move_d.y ~= 0 then
		direction = -1
	end

	if self._seat.driving then
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

		local steer = move_d.x
		local handbrake = 0
		slot21 = move_d.y

		self._vehicle_ext.set_input(slot11, self._vehicle_ext, accelerate, steer, brake, handbrake, false, false, forced_gear, dt)
	end

	slot8 = self._controller
	local pressed = self._controller.get_any_input(slot7)

	if pressed then
		slot10 = "weapon_gadget"
		local btn_weapon_gadget_press = self._controller.get_input_pressed(slot8, self._controller)
	end

	if btn_weapon_gadget_press then
		slot11 = "[PlayerDriving:_update_tank_input] current seat: "
		slot14 = self._seat.name

		Application.trace(slot9, Application, inspect(slot13))

		slot10 = self

		self._move_to_next_seat(slot9)
	end

	return 
end
function MountedWeapon:_tank_main_cannon_hit_explosion(raycast, hit_position)
	local pos = hit_position
	local normal = raycast.normal
	local damage_radius = self._tweak_data.turret.damage_radius or 1000
	slot9 = "explosion_targets"
	local slot_mask = managers.slot.get_mask(slot7, managers.slot)
	local damage = self._tweak_data.turret.damage or 1000
	local player_damage = self._tweak_data.turret.player_damage or 10
	local armor_piercing = self._tweak_data.turret.armor_piercing
	local curve_pow = 3

	managers.explosion.give_local_player_dmg(slot12, managers.explosion, pos, damage_radius)

	slot17 = managers.player
	slot17 = managers.player
	local hit_units, splinters = managers.explosion.detect_and_give_dmg(slot12, managers.explosion)
	slot15 = managers.network
	slot22 = curve_pow

	managers.network.session({
		alert_radius = 10000,
		hit_pos = pos,
		range = damage_radius,
		collision_slotmask = slot_mask,
		curve_pow = curve_pow,
		damage = damage,
		player_damage = player_damage,
		ignore_unit = managers.player.local_player(player_damage),
		user = managers.player.local_player(player_damage),
		armor_piercing = armor_piercing
	}).send_to_peers_synched(, managers.network.session(), "sync_tank_cannon_explosion", self._unit, pos, damage_radius, damage, player_damage)

	return 
end
function MountedWeapon:_tank_main_cannon_hit_explosion_on_client(position, radius, damage, player_damage, curve_pow)
	local sound_event = "grenade_explode"
	local damage_radius = radius or self._tweak_data.turret.damage_radius or 1000
	local custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		sound_event = sound_event,
		feedback_range = damage_radius * 2
	}
	slot14 = player_damage

	managers.explosion.give_local_player_dmg(slot10, managers.explosion, position, damage_radius)

	slot18 = custom_params

	managers.explosion.explode_on_client(slot10, managers.explosion, position, math.UP, nil, damage, damage_radius, curve_pow)

	return 
end

return 
