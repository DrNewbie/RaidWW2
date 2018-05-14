if not HuskCivilianEscortDamage then
	slot2 = HuskCivilianDamage
	slot0 = class(slot1)
end

HuskCivilianEscortDamage = slot0
HuskCivilianEscortDamage.damage_bullet = CivilianEscortDamage.damage_bullet
HuskCivilianEscortDamage.damage_explosion = CivilianEscortDamage.damage_explosion
HuskCivilianEscortDamage.damage_fire = CivilianEscortDamage.damage_fire
HuskCivilianEscortDamage.damage_melee = CivilianEscortDamage.damage_melee
HuskCivilianEscortDamage.damage_tase = CivilianEscortDamage.damage_tase
HuskCivilianEscortDamage._escort_damage = CivilianEscortDamage._escort_damage
HuskCivilianEscortDamage._on_damage_received = CivilianDamage._on_damage_received
HuskCivilianEscortDamage.grace_period = CivilianEscortDamage.grace_period
function HuskCivilianEscortDamage:init(...)
	slot3 = self

	HuskCivilianEscortDamage.super.init(slot2, ...)

	self._last_damage_taken = 0
	self._last_damage_t = 0

	return 
end
function HuskCivilianEscortDamage:_apply_damage_to_health(damage)
	slot5 = damage

	HuskCivilianEscortDamage.super._apply_damage_to_health(slot3, self)

	slot4 = self._unit

	if self._unit.escort(slot3) then
		slot4 = self._unit
		slot4 = self._unit.escort(slot3)

		self._unit.escort(slot3).update_health_bar(slot3)
	end

	return 
end
function HuskCivilianEscortDamage:die()
	slot3 = self

	HuskCivilianEscortDamage.super.die(slot2)

	slot3 = self._unit

	if self._unit.escort(slot2) then
		slot3 = self._unit
		slot3 = self._unit.escort(slot2)

		self._unit.escort(slot2).remove_waypoint(slot2)

		slot3 = self._unit
		slot3 = self._unit.escort(slot2)

		self._unit.escort(slot2).remove_health_bar(slot2)
	end

	return 
end

return 
