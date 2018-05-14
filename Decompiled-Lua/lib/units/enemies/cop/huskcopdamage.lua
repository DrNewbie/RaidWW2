-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not HuskCopDamage then
	slot2 = CopDamage
	slot0 = class(slot1)
end

HuskCopDamage = slot0
function HuskCopDamage:die(variant)
	slot4 = self._unit
	slot6 = 17

	self._unit.base(slot3).set_slot(slot3, self._unit.base(slot3), self._unit)

	slot4 = self._unit

	if self._unit.inventory(slot3) then
		slot4 = self._unit
		slot4 = self._unit.inventory(slot3)

		self._unit.inventory(slot3).drop_shield(slot3)
	end

	variant = variant or "bullet"
	self._health = 0
	self._health_ratio = 0
	self._dead = true
	slot5 = false

	self.set_mover_collision_state(slot3, self)

	slot4 = self._unit

	if self._unit.interaction(slot3) then
		slot4 = self._unit

		if self._unit.interaction(slot3).tweak_data == "hostage_convert" then
			slot4 = self._unit
			slot5 = false

			self._unit.interaction(slot3).set_active(slot3, self._unit.interaction(slot3))
		end
	end

	if self._death_sequence then
		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = self._death_sequence
		else
			slot7 = self._unit

			debug_pause_unit(slot3, self._unit, "[HuskCopDamage:die] does not have death sequence", self._death_sequence)
		end
	end

	slot4 = self._unit
	slot4 = self._unit.base(slot3)

	if self._unit.base(slot3).char_tweak(slot3).die_sound_event then
		slot4 = self._unit
		slot7 = self._unit
		slot7 = self._unit.base(slot6)

		self._unit.sound(slot3).play(slot3, self._unit.sound(slot3), self._unit.base(slot6).char_tweak(slot6).die_sound_event, nil)
	end

	return 
end

return 
