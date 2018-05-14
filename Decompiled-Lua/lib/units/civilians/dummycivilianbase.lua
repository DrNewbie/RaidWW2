DummyCivilianBase = DummyCivilianBase or class()
function DummyCivilianBase:init(unit)
	self._unit = unit
	slot5 = "animation"

	unit.set_driving(slot3, unit)

	slot8 = 500000

	unit.set_animation_lod(slot3, unit, 1, 500000, 500)

	return 
end
function DummyCivilianBase:play_state(state_name, at_time)
	slot8 = state_name
	local result = self._unit.play_state(slot4, self._unit, Idstring(at_time))
	slot6 = ""

	return result ~= Idstring(self._unit) and result
end
function DummyCivilianBase:anim_clbk_spear_spawn(unit)
	slot4 = self

	self._spawn_spear(slot3)

	return 
end
function DummyCivilianBase:anim_clbk_spear_unspawn(unit)
	slot4 = self

	self._unspawn_spear(slot3)

	return 
end
function DummyCivilianBase:_spawn_spear()
	slot3 = self._spear

	if not alive(slot2) then
		slot6 = "units/test/beast/weapon/native_spear"
		self._spear = World.spawn_unit(slot2, World, Idstring(slot5), Rotation())
		slot6 = "a_weapon_right_front"
		slot5 = self._spear
		slot8 = self._spear
		slot8 = self._spear.orientation_object(slot7)

		self._unit.link(slot2, self._unit, Idstring(Vector3()), self._spear.orientation_object(slot7).name(slot7))
	end

	return 
end
function DummyCivilianBase:_unspawn_spear()
	slot3 = self._spear

	if alive(slot2) then
		slot4 = 0

		self._spear.set_slot(slot2, self._spear)

		self._spear = nil
	end

	return 
end
function DummyCivilianBase:destroy(unit)
	slot4 = self

	self._unspawn_spear(slot3)

	return 
end

return 
