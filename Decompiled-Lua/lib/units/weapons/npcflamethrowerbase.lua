if not NPCFlamethrowerBase then
	slot2 = NPCRaycastWeaponBase
	slot0 = class(slot1)
end

NPCFlamethrowerBase = slot0
NPCFlamethrowerBase.EXPLOSION_TYPE = "flamer_death_fake"
function NPCFlamethrowerBase:init(...)
	slot3 = self

	NPCFlamethrowerBase.super.init(slot2, ...)

	self._bullet_class = FlameBulletBase
	self._use_shell_ejection_effect = false
	self._use_trails = false
	self._already_detonated = false

	return 
end
function NPCFlamethrowerBase:ejects_shells()
	return false
end
function NPCFlamethrowerBase:_spawn_muzzle_effect(from_pos, direction)
	slot5 = self._unit
	slot7 = direction

	self._unit.flamethrower_effect_extension(slot4)._spawn_muzzle_effect(slot4, self._unit.flamethrower_effect_extension(slot4), from_pos)

	return 
end
function NPCFlamethrowerBase:_spawn_trail_effect(direction, col_ray)
	return 
end
function NPCFlamethrowerBase:fire_blank(direction, impact)
	if not self._check_shooting_expired then
		slot6 = "fire"

		self.play_tweak_data_sound(slot4, self)
	end

	slot6 = Application
	self._check_shooting_expired = {
		check_t = Application.time(slot5) + 0.3
	}
	slot8 = "base"
	slot7 = true

	self._unit.set_extension_update_enabled(Application.time(slot5) + 0.3, self._unit, Idstring(slot7))

	return 
end
function NPCFlamethrowerBase:update(unit, t, dt)
	if self._check_shooting_expired and self._check_shooting_expired.check_t < t then
		self._check_shooting_expired = nil
		slot9 = "base"
		slot8 = false

		self._unit.set_extension_update_enabled(slot5, self._unit, Idstring(slot8))

		slot6 = self

		SawWeaponBase._stop_sawing_effect(slot5)

		slot7 = "stop_fire"

		self.play_tweak_data_sound(slot5, self)
	end

	return 
end
function NPCFlamethrowerBase:start_autofire(nr_shots)
	slot5 = self._obj_fire.position(slot6)
	slot8 = self._obj_fire
	slot8 = self._obj_fire.rotation(self._obj_fire)

	self._spawn_muzzle_effect(slot3, self, self._obj_fire.rotation(self._obj_fire).y(self._obj_fire))

	slot5 = nr_shots

	NPCFlamethrowerBase.super.start_autofire(slot3, self)

	return 
end
function NPCFlamethrowerBase:trigger_held(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	slot14 = self._obj_fire
	slot13 = direction

	self._spawn_muzzle_effect(slot10, self, self._obj_fire.position(slot13))

	slot19 = target_unit

	NPCFlamethrowerBase.super.trigger_held(slot10, self, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)

	return 
end

return 
