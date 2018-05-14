if not NPCSawWeaponBase then
	slot2 = NewNPCRaycastWeaponBase
	slot0 = class(slot1)
end

NPCSawWeaponBase = slot0
function NPCSawWeaponBase:init(unit)
	slot6 = false

	NPCSawWeaponBase.super.init(slot3, self, unit)

	slot4 = "effects/vanilla/weapons/saw/sawing"
	self._active_effect_name = Idstring(slot3)
	self._active_effect_table = {
		force_synch = true,
		effect = self._active_effect_name,
		parent = self._obj_fire
	}

	return 
end
function NPCSawWeaponBase:_play_sound_sawing()
	slot4 = "Play_npc_saw_handheld_grind_generic"

	self.play_sound(slot2, self)

	return 
end
function NPCSawWeaponBase:_play_sound_idle()
	slot4 = "Play_npc_saw_handheld_loop_idle"

	self.play_sound(slot2, self)

	return 
end
function NPCSawWeaponBase:update(unit, t, dt)
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
function NPCSawWeaponBase:change_fire_object(new_obj)
	slot5 = new_obj

	NPCSawWeaponBase.super.change_fire_object(slot3, self)

	self._active_effect_table.parent = new_obj

	return 
end
local mto = Vector3()
local mfrom = Vector3()
function NPCSawWeaponBase:fire_blank(direction, impact)
	if not self._check_shooting_expired then
		slot6 = "fire"

		self.play_tweak_data_sound(slot4, self)
	end

	slot6 = Application
	self._check_shooting_expired = {
		check_t = Application.time(slot5) + 0.5
	}
	slot8 = "base"
	slot7 = true

	self._unit.set_extension_update_enabled(Application.time(slot5) + 0.5, self._unit, Idstring(slot7))

	slot6 = mfrom

	self._obj_fire.m_position(Application.time(slot5) + 0.5, self._obj_fire)

	slot5 = self._obj_fire
	slot5 = self._obj_fire.rotation(Application.time(slot5) + 0.5)
	direction = self._obj_fire.rotation(Application.time(slot5) + 0.5).y(Application.time(slot5) + 0.5)
	slot6 = direction * -30

	mvector3.add(Application.time(slot5) + 0.5, mfrom)

	slot6 = direction

	mvector3.set(Application.time(slot5) + 0.5, mto)

	slot6 = 50

	mvector3.multiply(Application.time(slot5) + 0.5, mto)

	slot6 = mfrom

	mvector3.add(Application.time(slot5) + 0.5, mto)

	slot12 = self._setup.ignore_units
	local col_ray = World.raycast(Application.time(slot5) + 0.5, World, "ray", mfrom, mto, "slot_mask", self._bullet_slotmask, "ignore_unit")

	if col_ray and col_ray.unit then
		slot6 = self

		SawWeaponBase._start_sawing_effect(slot5)
	else
		slot6 = self

		SawWeaponBase._stop_sawing_effect(slot5)
	end

	return 
end
function NPCSawWeaponBase:destroy(...)
	slot3 = self

	NPCSawWeaponBase.super.destroy(slot2, ...)

	slot3 = self

	SawWeaponBase._stop_sawing_effect(slot2)

	return 
end

return 
