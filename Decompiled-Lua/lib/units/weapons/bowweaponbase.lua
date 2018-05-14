-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not BowWeaponBase then
	slot2 = ProjectileWeaponBase
	slot0 = class(slot1)
end

BowWeaponBase = slot0
function BowWeaponBase:init(unit)
	slot5 = unit

	BowWeaponBase.super.init(slot3, self)

	self._client_authoritative = true
	self._no_reload = false
	self._steelsight_speed = 0.5

	return 
end
function BowWeaponBase:trigger_pressed(...)
	slot3 = self

	self._start_charging(slot2)

	return 
end
function BowWeaponBase:trigger_held(...)
	if not self._charging and not self._cancelled then
		slot3 = self

		self._start_charging(slot2)
	end

	return 
end
function BowWeaponBase:_start_charging()
	self._cancelled = nil
	self._charging = true
	slot3 = managers.player
	slot3 = managers.player.player_timer(slot2)
	self._charge_start_t = managers.player.player_timer(slot2).time(slot2)
	slot4 = "charge"

	self.play_tweak_data_sound(slot2, self)

	return 
end
function BowWeaponBase:set_tased_shot(bool)
	self._is_tased_shot = bool

	return 
end
function BowWeaponBase:trigger_released(...)
	local fired = nil

	if self._charging and not self._cancelled then
		slot4 = self

		if self.start_shooting_allowed(slot3) then
			slot4 = self
			fired = self.fire(slot3, ...)

			if fired then
				slot7 = self
				slot5 = (self.charge_fail(slot6) and "charge_release_fail") or "charge_release"

				self.play_tweak_data_sound(slot3, self)

				slot5 = self
				local next_fire = ((tweak_data.weapon[self._name_id].fire_mode_data and tweak_data.weapon[self._name_id].fire_mode_data.fire_rate) or 0) / self.fire_rate_multiplier(self)
				self._next_fire_allowed = self._next_fire_allowed + next_fire
			end
		end
	end

	self._charging = nil
	self._cancelled = nil

	return fired
end
function BowWeaponBase:add_damage_result(unit, attacker, is_dead, damage_percent)

	-- Decompilation error in this vicinity:
	slot7 = attacker
	slot8 = {
		skip_bullet_count = true,
		hit = true,
		weapon_unit = self._unit
	}

	managers.statistics.shot_fired(slot6, managers.statistics)

	return 
end
function BowWeaponBase:_spawn_muzzle_effect()
	return 
end
function BowWeaponBase:charge_fail()
	slot3 = self

	return self.charge_multiplier(slot2) < 0.2
end
function BowWeaponBase:charge_multiplier()
	if self._is_tased_shot then
		return 1
	end

	local charge_multiplier = 1

	if self._charge_start_t then
		slot4 = managers.player
		local delta_t = managers.player.player_timer(slot3).time(slot3) - self._charge_start_t
		slot7 = self
		slot6 = 1
		charge_multiplier = math.min(managers.player.player_timer(slot3), delta_t / self.charge_max_t(slot6))
	end

	return charge_multiplier
end
function BowWeaponBase:projectile_speed_multiplier()
	slot4 = 1
	slot7 = self

	return math.lerp(slot2, 0.05, self.charge_multiplier(slot6))
end
function BowWeaponBase:projectile_damage_multiplier()
	slot4 = 1
	slot7 = self

	return math.lerp(slot2, 0.1, self.charge_multiplier(slot6))
end
function BowWeaponBase:projectile_charge_value()
	slot3 = self

	return self.charge_multiplier(slot2)
end
function BowWeaponBase:_adjust_throw_z(m_vec)
	slot10 = m_vec
	slot6 = 1 - math.abs(mvector3.z(slot9))
	local adjust_z = math.lerp(slot3, 0, 0.05)
	slot8 = m_vec
	slot6 = mvector3.z(slot7) + adjust_z

	mvector3.set_z(0, m_vec)

	return 
end
function BowWeaponBase:fire_on_release()
	return true
end
function BowWeaponBase:can_refire_while_tased()
	return false
end
function BowWeaponBase:charging()
	return self._charging and not self._cancelled
end
function BowWeaponBase:interupt_charging()
	self._charging = nil
	self._cancelled = nil
	slot4 = "charge_cancel"

	self.play_tweak_data_sound(slot2, self)

	return 
end
function BowWeaponBase:manages_steelsight()
	return true
end
function BowWeaponBase:steelsight_pressed()
	if self._cancelled then
		return 
	end

	if self._charging then
		self._cancelled = true
		slot4 = "charge_cancel"

		self.play_tweak_data_sound(slot2, self)
	end

	return {
		exit_steelsight = true
	}
end
function BowWeaponBase:wants_steelsight()
	return self._charging and not self._cancelled
end
function BowWeaponBase:enter_steelsight_speed_multiplier()
	slot4 = self

	return self._steelsight_speed * BowWeaponBase.super.enter_steelsight_speed_multiplier(slot3)
end
function BowWeaponBase:reload_speed_multiplier()
	slot3 = self
	local code_miss_multiplier = self.weapon_tweak_data(slot2).bow_reload_speed_multiplier or 1
	slot4 = self

	return code_miss_multiplier * BowWeaponBase.super.reload_speed_multiplier(slot3)
end
function BowWeaponBase:set_ammo_max(ammo_max)
	slot5 = ammo_max

	BowWeaponBase.super.set_ammo_max(slot3, self)

	if self._no_reload then
		slot5 = ammo_max

		self.set_ammo_max_per_clip(slot3, self)
	end

	return 
end
function BowWeaponBase:set_ammo_total(ammo_total)
	slot5 = ammo_total

	BowWeaponBase.super.set_ammo_total(slot3, self)

	if self._no_reload then
		slot5 = ammo_total

		self.set_ammo_remaining_in_clip(slot3, self)
	end

	return 
end
function BowWeaponBase:replenish()
	slot3 = self

	BowWeaponBase.super.replenish(slot2)

	if self._no_reload then
		slot3 = self
		slot6 = self

		self.set_ammo_remaining_in_clip(slot2, self.get_ammo_total(slot5))
	end

	return 
end
function BowWeaponBase:charge_max_t()
	slot3 = self

	return self.weapon_tweak_data(slot2).charge_data.max_t
end

if not CrossbowWeaponBase then
	slot2 = ProjectileWeaponBase
	slot0 = class(slot1)
end

CrossbowWeaponBase = slot0
function CrossbowWeaponBase:init(unit)
	slot5 = unit

	CrossbowWeaponBase.super.init(slot3, self)

	self._client_authoritative = true

	return 
end
function CrossbowWeaponBase:charge_fail()
	return false
end

return 
