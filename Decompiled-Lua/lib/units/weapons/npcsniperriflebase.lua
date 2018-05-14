-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not NPCSniperRifleBase then
	slot2 = NPCRaycastWeaponBase
	slot0 = class(slot1)
end

NPCSniperRifleBase = slot0
slot3 = "effects/vanilla/weapons/wpn_sniper_trail_001"
NPCSniperRifleBase.TRAIL_EFFECT = Idstring(slot2)
NPCSniperRifleBase.GLOW_EFFECTT = "enable_sniper_effect"
local idstr_trail = Idstring("enable_sniper_effect")
local idstr_simulator_length = Idstring("trail")
slot4 = "size"
local idstr_size = Idstring("simulator_length")
function NPCSniperRifleBase:init(unit)
	slot5 = unit

	NPCSniperRifleBase.super.init(slot3, self)

	slot4 = World
	slot8 = idstr_size
	self._trail_length = World.effect_manager(slot3).get_initial_simulator_var_vector2(slot3, World.effect_manager(slot3), self.TRAIL_EFFECT, idstr_trail, idstr_simulator_length)

	return 
end
function NPCSniperRifleBase:set_laser_enabled(enabled)
	slot6 = self._unit
	slot9 = self._unit

	Application.trace(slot3, Application, "[NPCSniperRifleBase:show_sniper_flare] **************************", self._unit.damage(slot8))

	slot4 = self._unit

	if not self._unit.damage(slot3) then
		return 
	end

	if enabled then
		slot4 = self._unit
		slot5 = "enable_sniper_effect"
	elseif not enabled then
		slot4 = self._unit
		slot5 = "disable_sniper_effect"

		if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
			slot4 = self._unit
			slot5 = "disable_sniper_effect"

			self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))

			slot5 = "[NPCSniperRifleBase:show_sniper_flare]  unit:damage():run_sequence_simple( disable_sniper_effect )"

			Application.trace(slot3, Application)
		end
	end

	NPCSniperRifleBase.unit = self._unit

	return 
end
function NPCSniperRifleBase:_spawn_trail_effect(direction, col_ray)
	slot6 = self._trail_effect_table.position

	self._obj_fire.m_position(slot4, self._obj_fire)

	slot6 = direction

	mvector3.set(slot4, self._trail_effect_table.normal)

	slot5 = World
	slot6 = self._trail_effect_table
	local trail = World.effect_manager(slot4).spawn(slot4, World.effect_manager(slot4))

	if col_ray then
		slot7 = col_ray.distance

		mvector3.set_y(slot5, self._trail_length)

		slot6 = World
		slot11 = self._trail_length

		World.effect_manager(slot5).set_simulator_var_vector2(slot5, World.effect_manager(slot5), trail, idstr_trail, idstr_simulator_length, idstr_size)
	end

	return 
end

return 
