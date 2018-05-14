if not NewNPCFlamethrowerBase then
	slot2 = NewNPCRaycastWeaponBase
	slot0 = class(slot1)
end

NewNPCFlamethrowerBase = slot0
function NewNPCFlamethrowerBase:init(...)
	slot3 = self

	NewNPCFlamethrowerBase.super.init(slot2, ...)

	slot3 = self

	self.setup_default(slot2)

	return 
end
function NewNPCFlamethrowerBase:setup_default()
	self._use_shell_ejection_effect = false
	self._use_trails = false

	return 
end
function NewNPCFlamethrowerBase:_spawn_muzzle_effect(from_pos, direction)
	return 
end
function NewNPCFlamethrowerBase:update(unit, t, dt)
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
function NewNPCFlamethrowerBase:fire_blank(direction, impact)
	if not self._check_shooting_expired then
		slot6 = "fire"

		self.play_tweak_data_sound(slot4, self)
	end

	slot6 = Application
	self._check_shooting_expired = {
		check_t = Application.time(slot5) + 0.3
	}
	slot8 = "base"

	self._unit.set_extension_update_enabled(Application.time(slot5) + 0.3, self._unit, Idstring(slot7))

	slot5 = self._unit
	slot8 = self._obj_fire
	slot7 = direction

	self._unit.flamethrower_effect_extension(Application.time(slot5) + 0.3)._spawn_muzzle_effect(Application.time(slot5) + 0.3, self._unit.flamethrower_effect_extension(Application.time(slot5) + 0.3), self._obj_fire.position(true))

	return 
end

return 
