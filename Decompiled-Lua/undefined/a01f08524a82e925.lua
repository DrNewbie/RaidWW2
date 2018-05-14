-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_sub = mvector3.subtract
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_len = mvector3.length
local mvec3_cross = mvector3.cross
local math_clamp = math.clamp
local math_lerp = math.lerp
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()

if not DP28RaycastWeaponBase then
	slot17 = NewRaycastWeaponBase
	slot15 = class(slot16)
end

DP28RaycastWeaponBase = slot15
function DP28RaycastWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	local start_ammo = self.get_ammo_remaining_in_clip(slot10)
	slot12 = self
	local weapon_tweak = self.weapon_tweak_data(self)
	local apply_gun_kick = weapon_tweak and weapon_tweak.gun_kick
	local mvec_direction = tmp_vec1
	local mvec_right = tmp_vec2
	local mvec_up = tmp_vec3

	if apply_gun_kick then
		slot17 = self
	else
		slot18 = direction

		mvec3_set(slot16, mvec_direction)
	end

	slot25 = target_unit
	local ray_res = DP28RaycastWeaponBase.super.super.fire(slot16, self, from_pos, mvec_direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	slot20 = shoot_player
	self._spread_firing = (self._spread_firing or 0) + self._get_fire_spread_add(slot18, self)
	slot19 = self
	self._spread_last_shot_t = ((weapon_tweak.fire_mode_data and weapon_tweak.fire_mode_data.fire_rate) or 0) / self.fire_rate_multiplier(slot18) * (weapon_tweak.spread.recovery_wait_multiplier or 1)
	self._recoil_firing = self._get_fire_recoil(weapon_tweak.spread.recovery_wait_multiplier or 1)
	slot19 = self
	self._recoil_last_shot_t = ((weapon_tweak.fire_mode_data and weapon_tweak.fire_mode_data.fire_rate) or 0) / self.fire_rate_multiplier(self) * (weapon_tweak.kick.recovery_wait_multiplier or 1)

	if apply_gun_kick then
		slot18 = self
		local gun_kick_values = (self.in_steelsight(slot17) and weapon_tweak.gun_kick.steelsight) or weapon_tweak.gun_kick.hip_fire

		if gun_kick_values then
			local recoil_multiplier = self.recoil_multiplier(slot18)
			slot21 = gun_kick_values[4]
			local kick_x = math.lerp(self, gun_kick_values[3], math.random()) * recoil_multiplier
			slot22 = gun_kick_values[2]
			local kick_y = math.lerp(gun_kick_values[3], gun_kick_values[1], math.random()) * recoil_multiplier
			self._gun_kick.x.velocity = self._gun_kick.x.velocity + kick_x
			self._gun_kick.y.velocity = self._gun_kick.y.velocity + kick_y * -1
		end
	end

	if not self._playing then
		slot19 = "fire"

		self.tweak_data_anim_play(slot17, self)

		self._playing = true
	end

	slot18 = self

	if 1 <= start_ammo - self.get_ammo_remaining_in_clip(slot17) then
		slot18 = self

		self.play_magazine_anim(slot17)
	end

	return ray_res
end
function DP28RaycastWeaponBase:update(unit, t, dt)
	slot6 = self._unit
	slot9 = "reload"

	if not self._unit.anim_is_playing(slot5, Idstring(slot8)) then
		slot6 = self._unit
		slot9 = "reload_not_empty"
		local is_reloading = self._unit.anim_is_playing(slot5, Idstring(slot8))
	end

	slot7 = self

	if (self.fire_mode(slot6) == "single" or (managers.warcry._active_warcry_name == "berserk" and managers.warcry._active)) and not is_reloading then
		slot8 = false

		self.set_magazine_pos_based_on_ammo(slot6, self)
	end

	slot10 = dt

	DP28RaycastWeaponBase.super.update(slot6, self, unit, t)

	return 
end
function DP28RaycastWeaponBase:set_magazine_pos_based_on_ammo(count_max)
	local percent_of_anim = 0

	if self.length then
		if not count_max then
			slot5 = self
			percent_of_anim = self.get_magazine_true_pos(slot4)
		else
			slot6 = self

			if self.get_ammo_max_per_clip(self) < self.get_ammo_total(slot4) then
				percent_of_anim = 0
			else
				slot6 = self
				percent_of_anim = 1 - (0 + self.get_ammo_total(slot4)) / (0 + self.get_ammo_max_per_clip(self))
			end
		end

		self._magazine_time_stamp = percent_of_anim * self.length
		slot6 = self._magazine_time_stamp

		self.set_magazine_time_stamp(slot4, self)
	end

	return 
end
function DP28RaycastWeaponBase:get_magazine_true_pos()
	slot4 = self
	local pos = (0 + self.get_ammo_remaining_in_clip(slot2)) / (0 + self.get_ammo_max_per_clip(self))

	return 1 - pos
end
function DP28RaycastWeaponBase:get_magazine_object()
	return self._parts.wpn_fps_lmg_dp28_m_standard or self._parts.wpn_fps_lmg_dp28_m_extended
end
function DP28RaycastWeaponBase:tweak_data_anim_play(anim, speed_multiplier)
	local data = tweak_data.weapon.factory[self._factory_id]

	if data.animations and data.animations[anim] then
		local anim_name = data.animations[anim]
		slot7 = self._unit
		slot10 = anim_name
		local length = self._unit.anim_length(slot6, Idstring(slot9))
		speed_multiplier = speed_multiplier or 1
		slot8 = self._unit
		slot11 = anim_name

		self._unit.anim_stop(slot7, Idstring(slot10))

		slot11 = anim_name
		slot11 = speed_multiplier

		self._unit.anim_play_to(slot7, self._unit, Idstring(slot10), length)
	end

	if anim == "equip" then
		slot7 = self._magazine_time_stamp or 0

		self.set_magazine_time_stamp(slot5, self)
	end

	local strap_data = self._parts.wpn_fps_lmg_dp28_m_strap

	if strap_data then
		local anim_name = strap_data.animations[anim]

		if anim_name then
			slot8 = strap_data.unit
			slot11 = anim_name
			local length = strap_data.unit.anim_length(slot7, Idstring(slot10))
			speed_multiplier = speed_multiplier or 1
			slot9 = strap_data.unit
			slot12 = anim_name

			strap_data.unit.anim_stop(slot8, Idstring(slot11))

			slot12 = anim_name
			slot12 = speed_multiplier

			strap_data.unit.anim_play_to(slot8, strap_data.unit, Idstring(slot11), length)
		end
	end

	slot9 = speed_multiplier

	DP28RaycastWeaponBase.super.super.tweak_data_anim_play(slot6, self, anim)

	return true
end
function DP28RaycastWeaponBase:play_magazine_anim(speed_multiplier)
	slot4 = self
	local data = self.get_magazine_object(slot3)
	local anim_name = data.animations.fire
	slot9 = anim_name
	self.length = data.unit.anim_length(slot5, Idstring(slot8))
	slot7 = self
	speed_multiplier = self.length / (self.get_ammo_max_per_clip(data.unit) * tweak_data.weapon[self._name_id].auto.fire_rate)
	slot9 = anim_name
	slot9 = speed_multiplier

	data.unit.anim_play_to(self.get_ammo_max_per_clip(data.unit) * tweak_data.weapon[self._name_id].auto.fire_rate, data.unit, Idstring(slot8), self.length)

	return 
end
function DP28RaycastWeaponBase:weapon_parts_anim_pause()
	slot3 = self
	local data = self.get_magazine_object(slot2)
	local anim_name = data.animations.fire
	slot5 = data.unit
	slot8 = anim_name

	data.unit.anim_pause(slot4, Idstring(slot7))

	slot10 = self

	data.unit.anim_play_to(slot4, data.unit, Idstring(slot7))

	slot5 = data.unit
	slot8 = anim_name
	self._magazine_time_stamp = data.unit.anim_time(slot4, Idstring(self.get_anim_length(anim_name) * self.get_magazine_true_pos(self)))

	if 3.2 < self._magazine_time_stamp then
		slot5 = data.unit
		slot8 = anim_name

		data.unit.anim_pause(slot4, Idstring(slot7))

		slot5 = self
		slot8 = self

		self.set_magazine_time_stamp(slot4, self.get_anim_length(slot7))
	end

	self._playing = false

	return 
end
function DP28RaycastWeaponBase:get_anim_length()
	if self.length then
		return self.length
	else
		slot3 = self
		local data = self.get_magazine_object(slot2)
		local anim_name = data.animations.fire
		slot5 = data.unit
		slot8 = anim_name
		self.length = data.unit.anim_length(slot4, Idstring(slot7))

		return self.length
	end

	return 
end
function DP28RaycastWeaponBase:start_reload(...)
	slot3 = self

	DP28RaycastWeaponBase.super.start_reload(slot2, ...)

	return 
end
function DP28RaycastWeaponBase:set_magazine_time_stamp(time)
	local data = self.get_magazine_object(slot3)
	slot8 = data.animations.fire
	slot7 = time

	data.unit.anim_set_time(self, data.unit, Idstring(slot7))

	return 
end
function DP28RaycastWeaponBase:tweak_data_anim_stop(anim, force_fire)
	if anim == "fire" and not force_fire then
		return 
	end

	slot6 = anim

	DP28RaycastWeaponBase.super.tweak_data_anim_stop(slot4, self)

	return 
end
function DP28RaycastWeaponBase:reset_magazine_anim_pos()
	slot4 = true

	self.set_magazine_pos_based_on_ammo(slot2, self)

	slot3 = "--Realoaded dp28"

	print(slot2)

	return 
end

return 
