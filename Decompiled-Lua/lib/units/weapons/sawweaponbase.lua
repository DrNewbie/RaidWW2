local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_sub = mvector3.subtract
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_len = mvector3.length
local math_clamp = math.clamp
local math_lerp = math.lerp
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

if not SawWeaponBase then
	slot15 = NewRaycastWeaponBase
	slot13 = class(slot14)
end

SawWeaponBase = slot13
function SawWeaponBase:init(unit)
	slot5 = unit

	SawWeaponBase.super.init(slot3, self)

	slot4 = "effects/vanilla/weapons/saw/sawing"
	self._active_effect_name = Idstring(slot3)
	self._active_effect_table = {
		force_synch = true,
		effect = self._active_effect_name,
		parent = self._obj_fire
	}

	return 
end
function SawWeaponBase:change_fire_object(new_obj)
	slot5 = new_obj

	SawWeaponBase.super.change_fire_object(slot3, self)

	self._active_effect_table.parent = new_obj

	return 
end
function SawWeaponBase:start_shooting(...)
	slot3 = self

	SawWeaponBase.super.start_shooting(slot2, ...)

	return 
end
function SawWeaponBase:stop_shooting(...)
	slot3 = self

	self._stop_sawing_effect(slot2)

	slot3 = self

	SawWeaponBase.super.stop_shooting(slot2, ...)

	return 
end
function SawWeaponBase:_play_sound_sawing()
	slot4 = "Play_saw_handheld_grind_generic"

	self.play_sound(slot2, self)

	return 
end
function SawWeaponBase:_play_sound_idle()
	slot4 = "Play_saw_handheld_loop_idle"

	self.play_sound(slot2, self)

	return 
end
function SawWeaponBase:_start_sawing_effect()
	if not self._active_effect then
		slot3 = self

		self._play_sound_sawing(slot2)

		slot3 = World
		slot4 = self._active_effect_table
		self._active_effect = World.effect_manager(slot2).spawn(slot2, World.effect_manager(slot2))
	end

	return 
end
function SawWeaponBase:_stop_sawing_effect()
	if self._active_effect then
		slot3 = self

		self._play_sound_idle(slot2)

		slot3 = World
		slot4 = self._active_effect

		World.effect_manager(slot2).fade_kill(slot2, World.effect_manager(slot2))

		self._active_effect = nil
	end

	return 
end
function SawWeaponBase:setup(setup_data)
	slot5 = setup_data

	SawWeaponBase.super.setup(slot3, self)

	self._no_hit_alert_size = self._alert_size
	slot8 = self
	slot7 = #tweak_data.weapon.stats.alert_size
	self._hit_alert_size = tweak_data.weapon.stats.alert_size[math.clamp(slot4, self.check_stats(slot6).alert_size - (self.weapon_tweak_data(self).hit_alert_size_increase or 0), 1)]

	return 
end
function SawWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	slot11 = self

	if self.get_ammo_remaining_in_clip(slot10) == 0 then
		return 
	end

	local user_unit = self._setup.user_unit
	slot21 = target_unit
	local ray_res, hit_something = self._fire_raycast(slot11, self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)

	if hit_something then
		slot14 = self

		self._start_sawing_effect(slot13)

		local ammo_usage = 5

		if ray_res.hit_enemy then
			slot17 = "enemy_slicer"

			if managers.player.has_category_upgrade(slot14, managers.player, "saw") then
				ammo_usage = 10
			else
				ammo_usage = 15
			end
		end

		slot15 = math.random() * 10
		ammo_usage = ammo_usage + math.ceil(slot14)
		slot17 = "consume_no_ammo_chance"

		if managers.player.has_category_upgrade(slot14, managers.player, "saw") then
			local roll = math.rand(slot14)
			slot19 = 0
			local chance = managers.player.upgrade_value(1, managers.player, "saw", "consume_no_ammo_chance")

			if roll < chance then
				ammo_usage = 0
			end
		end

		slot15 = ammo_usage
		slot18 = self
		ammo_usage = math.min(slot14, self.get_ammo_remaining_in_clip(slot17))
		slot15 = self
		slot20 = self

		self.set_ammo_remaining_in_clip(slot14, math.max(slot17, self.get_ammo_remaining_in_clip(slot19) - ammo_usage))

		slot15 = self
		slot20 = self
		slot19 = 0

		self.set_ammo_total(slot14, math.max(slot17, self.get_ammo_total(0) - ammo_usage))

		slot16 = user_unit

		self._check_ammo_total(slot14, self)
	else
		slot14 = self

		self._stop_sawing_effect(slot13)
	end

	if self._alert_events and ray_res.rays then
		if hit_something then
			self._alert_size = self._hit_alert_size
		else
			self._alert_size = self._no_hit_alert_size
		end

		self._current_stats.alert_size = self._alert_size
		slot18 = user_unit

		self._check_alert(self._alert_size, self, ray_res.rays, from_pos, direction)
	end

	return ray_res
end
local mvec_to = Vector3()
local mvec_spread_direction = Vector3()
function SawWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	local result = {}
	local hit_unit = nil
	slot14 = user_unit
	local spread = self._get_spread(slot12, self)
	slot14 = self._obj_fire
	from_pos = self._obj_fire.position(self)
	slot14 = self._obj_fire
	slot14 = self._obj_fire.rotation(self)
	direction = self._obj_fire.rotation(self).y(self)
	slot15 = direction * -30

	mvec3_add(self, from_pos)

	slot15 = direction

	mvector3.set(self, mvec_spread_direction)

	slot15 = mvec_spread_direction

	mvector3.set(self, mvec_to)

	slot15 = 100

	mvector3.multiply(self, mvec_to)

	slot15 = from_pos

	mvector3.add(self, mvec_to)

	slot15 = dmg_mul
	local damage = self._get_current_damage(self, self)
	slot24 = "body bullet lock"
	local col_ray = World.raycast(self, World, "ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "ray_type")

	if col_ray then
		slot20 = damage
		hit_unit = SawHit.on_collision(slot15, SawHit, col_ray, self._unit, user_unit)
	end

	result.hit_enemy = hit_unit

	if self._alert_events then
		result.rays = {
			col_ray
		}
	end

	if col_ray then
		slot17 = {
			hit = true,
			weapon_unit = self._unit
		}

		managers.statistics.shot_fired(slot15, managers.statistics)
	end

	return result, col_ray and col_ray.unit
end
function SawWeaponBase:ammo_info()
	slot6 = self

	return self.get_ammo_max_per_clip(slot2), self.get_ammo_remaining_in_clip(self), self.remaining_full_clips(self), self.get_ammo_max(self)
end
function SawWeaponBase:can_reload()
	slot3 = self

	if self.clip_empty(slot2) then
		slot3 = self
		slot1 = SawWeaponBase.super.can_reload(slot2)
	end

	return slot1
end

if not SawHit then
	slot17 = InstantBulletBase
	slot15 = class(slot16)
end

SawHit = slot15
function SawHit:on_collision(col_ray, weapon_unit, user_unit, damage)
	local hit_unit = col_ray.unit

	if hit_unit then
		if false then
			damage = 50
		end
	end

	slot12 = damage
	local result = InstantBulletBase.on_collision(slot7, self, col_ray, weapon_unit, user_unit)
	slot9 = hit_unit

	if hit_unit.damage(self) then
		slot9 = col_ray.body

		if col_ray.body.extension(slot8) then
			slot9 = col_ray.body

			if col_ray.body.extension(slot8).damage then
				slot14 = 1
				slot11 = 200
				damage = math.clamp(slot8, damage * managers.player.upgrade_value(slot10, managers.player, "saw", "lock_damage_multiplier") * 4, 0)
				slot9 = col_ray.body
				slot14 = damage

				col_ray.body.extension(slot8).damage.damage_lock(slot8, col_ray.body.extension(slot8).damage, user_unit, col_ray.normal, col_ray.position, col_ray.direction)

				slot9 = hit_unit

				if hit_unit.id(slot8) ~= -1 then
					slot9 = managers.network
					slot12 = damage

					managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "sync_body_damage_lock", col_ray.body)
				end
			end
		end
	end

	return result
end
function SawHit:play_impact_sound_and_effects(col_ray)
	slot5 = {
		decal = "saw",
		no_sound = true,
		col_ray = col_ray
	}

	managers.game_play_central.play_impact_sound_and_effects(slot3, managers.game_play_central)

	return 
end

return 
