if not TankTurretWeapon then
	slot2 = SentryGunWeapon
	slot0 = class(slot1)
end

TankTurretWeapon = slot0
function TankTurretWeapon:init(unit)
	slot5 = unit

	TankTurretWeapon.super.init(slot3, self)

	self._laser_align_name = nil
	self._laser_align = nil
	slot4 = self._unit
	slot7 = "fire"
	self._fire_obj = self._unit.get_object(slot3, Idstring(slot6))
	self._test_delete_after = {}

	return 
end
function TankTurretWeapon:setup(setup_data, damage_multiplier)
	slot7 = damage_multiplier

	TankTurretWeapon.super.setup(slot4, self, setup_data)

	self._custom_params = {
		effect = self._tweak_data.effect.main_cannon_fire_hit,
		sound_event = self._tweak_data.sound.main_cannon_fire_hit,
		idstr_decal = self._tweak_data.effect.explosion_decal,
		idstr_effect = self._tweak_data.effect.explosion_lingering_effect
	}

	return 
end
function TankTurretWeapon:play_lock_on_sound()
	slot3 = self._unit
	local sound_source = self._unit.sound_source(slot2)
	local weapon_tweak_data = self._tweak_data

	if sound_source and weapon_tweak_data.sound.main_cannon_lock_on then
		slot6 = weapon_tweak_data.sound.main_cannon_lock_on

		sound_source.post_event(slot4, sound_source)
	end

	return 
end
function TankTurretWeapon:start_autofire()
	slot3 = "[TankTurretWeapon:start_autofire] start_autofire() not supported by the tank turret, unit: "
	slot6 = self._unit

	debug_pause(slot2, inspect(slot5))

	return 
end
function TankTurretWeapon:stop_autofire()
	slot3 = "[TankTurretWeapon:start_autofire] stop_autofire() not supported by the tank turret, unit: "
	slot6 = self._unit

	debug_pause(slot2, inspect(slot5))

	return 
end
function TankTurretWeapon:trigger_held(blanks, expend_ammo, shoot_player, target_unit)
	slot7 = "[TankTurretWeapon:start_autofire] autofire() not supported by the tank turret, unit: "
	slot10 = self._unit

	debug_pause(slot6, inspect(slot9))

	return 
end
function TankTurretWeapon:singleshot(blanks, expend_ammo, shoot_player, target_pos)
	slot7 = Network

	if not Network.is_server(slot6) then
		return 
	end

	if expend_ammo then
		if self._ammo_total <= 0 then
			return 
		end

		slot8 = -1

		self.change_ammo(slot6, self)
	end

	local weapon_tweak_data = self._tweak_data
	self._fire_locator = self._fire_locator or self._effect_align[self._interleaving_fire]
	local from_pos = self._fire_obj.position(slot7)
	local direction = target_pos - from_pos.normalized(self._fire_obj)
	slot11 = weapon_tweak_data.SPREAD * self._spread_mul

	mvector3.spread(target_pos - from_pos, direction)

	self._tank_shell = {
		vel_gravity = 0,
		position = from_pos,
		direction = direction
	}
	slot13 = "weapon"
	slot12 = true

	self._unit.set_extension_update_enabled(target_pos - from_pos, self._unit, Idstring(self._spread_mul))

	slot12 = direction

	self.play_singleshot_sound_and_effect(target_pos - from_pos, self, from_pos)

	slot10 = managers.network
	slot14 = direction

	managers.network.session(target_pos - from_pos).send_to_peers_synched(target_pos - from_pos, managers.network.session(target_pos - from_pos), "sync_ai_tank_singleshot_blank", self._unit, from_pos)

	return 
end
function TankTurretWeapon:play_singleshot_sound_and_effect(position, normal)
	local weapon_tweak_data = self._tweak_data
	local effect_range = weapon_tweak_data.sound.main_cannon_fire_tinnitus_range
	slot7 = World
	slot8 = {
		effect = Idstring(slot10),
		position = position,
		normal = normal
	}
	slot11 = weapon_tweak_data.effect.main_cannon_fire

	World.effect_manager(slot6).spawn(slot6, World.effect_manager(slot6))

	slot7 = self._unit
	local sound_source = self._unit.sound_source(slot6)

	if sound_source then
		slot9 = weapon_tweak_data.sound.main_cannon_fire

		sound_source.post_event(slot7, sound_source)
	end

	local custom_params = {
		sound_muffle_effect = true,
		camera_shake_max_mul = 4,
		feedback_range = effect_range
	}
	slot13 = custom_params

	managers.explosion.player_feedback(slot8, managers.explosion, position, normal, effect_range)

	local fire_anim_sequence = weapon_tweak_data.fire_anim_sequence

	if fire_anim_sequence then
		slot10 = self._unit

		if self._unit.damage(slot9) then
			slot10 = self._unit
			slot11 = fire_anim_sequence

			if self._unit.damage(slot9).has_sequence(slot9, self._unit.damage(slot9)) then
				slot10 = self._unit
				slot11 = fire_anim_sequence

				self._unit.damage(slot9).run_sequence_simple(slot9, self._unit.damage(slot9))
			end
		end
	end

	return 
end
function TankTurretWeapon:update(unit, t, dt)
	if self._test_delete_after then
		slot6 = self._test_delete_after

		for _, object in ipairs(slot5) do
			if object.time + 7 < t then
				slot12 = object.id

				DebugDraw.destroy_primitive(slot10, DebugDraw)

				slot12 = _

				table.remove(slot10, self._test_delete_after)
			end
		end
	end

	if not self._tank_shell then
		return 
	end

	local new_position = self._tank_shell.position + self._tank_shell.direction * self._tweak_data.main_cannon_shell_speed * dt
	slot8 = new_position - self._tank_shell.position
	self._tank_shell.direction = new_position - self._tank_shell.position.normalized(slot7)
	slot10 = new_position
	local raycast = World.raycast(new_position - self._tank_shell.position.normalized(slot7), World, "ray", self._tank_shell.position)

	if raycast then
		slot8 = World
		slot9 = {
			effect = Idstring(slot11),
			position = raycast.hit_position,
			normal = raycast.normal
		}

		World.effect_manager(slot7).spawn(slot7, World.effect_manager(slot7))

		self._tank_shell = nil
		VehicleDrivingExt.cumulative_dt = 0
		VehicleDrivingExt.cumulative_gravity = 0
		slot15 = 2
		slot10 = raycast.hit_position + Vector3(self._tweak_data.effect.main_cannon_fire_hit, 0, 0)

		self._hit_explosion(0, self, raycast)

		if TankTurretWeapon.show_trajectory then
			slot15 = 2
			slot12 = 2
			local sphere_id = DebugDraw.sphere(slot7, DebugDraw, Color.green, raycast.hit_position + Vector3(slot12, 0, 0), 30)
			slot10 = {
				time = t,
				id = sphere_id
			}

			table.insert(DebugDraw, self._test_delete_after)
		end

		slot11 = "weapon"
		slot10 = false

		self._unit.set_extension_update_enabled(slot7, self._unit, Idstring(slot10))
	else
		self._tank_shell.position = new_position

		if TankTurretWeapon.show_trajectory then
			slot12 = 2
			local sphere_id = DebugDraw.sphere(slot7, DebugDraw, Color.red, new_position, 10)
			slot10 = {
				time = t,
				id = sphere_id
			}

			table.insert(DebugDraw, self._test_delete_after)
		end
	end

	return 
end
function TankTurretWeapon:_hit_explosion(raycast, hit_position)
	slot5 = Network

	if not Network.is_server(slot4) then
		return 
	end

	local pos = hit_position
	local normal = raycast.normal
	local damage_radius = self._tweak_data.turret.damage_radius or 1000
	slot9 = "explosion_targets"
	local slot_mask = managers.slot.get_mask(slot7, managers.slot)
	local damage = self._tweak_data.turret.damage or 1000
	local player_damage = self._tweak_data.turret.player_damage or 10
	local armor_piercing = self._tweak_data.turret.armor_piercing
	local curve_pow = 3
	local alert_radius = self._tweak_data.alert_size
	slot17 = player_damage

	managers.explosion.give_local_player_dmg(slot13, managers.explosion, pos, damage_radius)

	slot18 = self._custom_params

	managers.explosion.play_sound_and_effects(slot13, managers.explosion, pos, normal, damage_radius)

	slot18 = managers.player
	local hit_units, splinters = managers.explosion.detect_and_give_dmg(slot13, managers.explosion)
	slot16 = managers.network
	slot23 = curve_pow

	managers.network.session({
		hit_pos = pos,
		range = damage_radius,
		collision_slotmask = slot_mask,
		curve_pow = curve_pow,
		damage = damage,
		player_damage = player_damage,
		ignore_unit = self._unit,
		alert_radius = alert_radius,
		user = managers.player.local_player(damage_radius),
		armor_piercing = armor_piercing
	}).send_to_peers_synched(, managers.network.session(), "sync_ai_tank_grenade_explosion", self._unit, pos, damage_radius, damage, player_damage)

	return 
end
function TankTurretWeapon:_hit_explosion_on_client(position, radius, damage, player_damage, curve_pow)
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
function TankTurretWeapon:adjust_target_pos(target_pos)
	slot6 = 150

	return target_pos - Vector3(slot3, 0, 0)
end

return 
