FlamerTank = FlamerTank or class()
FlamerTank.DETONATE_EVENT_ID = 1
FlamerTank.EXTENSION = "base"
FlamerTank.EXPLOSION_TYPE = "flamer_death_fake"
function FlamerTank:init(unit)
	self._unit = unit

	return 
end
function FlamerTank:detonate(in_pos, range, damage, player_damage)
	slot8 = "[FlamerTank:detonate]"

	Application.trace(slot6, Application)

	slot7 = Network

	if not Network.is_server(slot6) then
		return 
	end

	if not self._already_detonated then
		local rot = self._unit.rotation(slot6)
		slot9 = rot
		local pos = self._unit.position(self._unit) + rot.y(self._unit) * -60
		slot10 = FlamerTank.EXPLOSION_TYPE
		local index = tweak_data.blackmarket.get_index_from_projectile_id(self._unit, tweak_data.blackmarket)
		slot14 = rot
		slot12 = rot.z(slot13) * 0.01

		ProjectileBase.throw_projectile(tweak_data.blackmarket, index, pos)

		local normal = math.UP
		local slot_mask = managers.slot.get_mask(index, managers.slot)
		local damage_params = {
			player_damage = 0,
			curve_pow = 3,
			no_raycast_check_characters = true,
			hit_pos = pos,
			range = range,
			collision_slotmask = slot_mask,
			damage = damage,
			ignore_unit = self._unit
		}
		slot14 = damage_params

		managers.explosion.detect_and_give_dmg("explosion_targets", managers.explosion)

		self._already_detonated = true
	end

	return 
end

return 
