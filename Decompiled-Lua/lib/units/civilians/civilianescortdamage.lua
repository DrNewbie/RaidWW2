-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CivilianEscortDamage then
	slot2 = CivilianDamage
	slot0 = class(slot1)
end

CivilianEscortDamage = slot0
CivilianEscortDamage.grace_period = 0.5
function CivilianEscortDamage:init(...)
	slot3 = self

	CivilianEscortDamage.super.init(slot2, ...)

	self._last_damage_taken = 0
	self._last_damage_t = 0

	return 
end
function CivilianEscortDamage:_escort_damage(attack_data)
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local t = TimerManager.game(slot3).time(slot3)

	if t - self.grace_period < self._last_damage_t and attack_data.damage <= self._last_damage_taken then
		return "no_damage"
	end

	slot5 = self._unit

	if self._unit.escort(slot4) then
		slot5 = self._unit
		slot5 = self._unit.escort(slot4)
	end

	self._last_damage_t = t
	self._last_damage_taken = attack_data.damage

	return 
end
function CivilianEscortDamage:_apply_damage_to_health(damage)
	slot5 = damage

	CivilianEscortDamage.super._apply_damage_to_health(slot3, self)

	slot4 = self._unit

	if self._unit.escort(slot3) then
		slot4 = self._unit
		slot4 = self._unit.escort(slot3)

		self._unit.escort(slot3).update_health_bar(slot3)
	end

	return 
end
function CivilianEscortDamage:die()
	slot3 = self

	CivilianEscortDamage.super.die(slot2)

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
function CivilianEscortDamage:damage_bullet(attack_data)
	slot5 = attack_data

	if not self._escort_damage(slot3, self) then
		slot5 = attack_data
		slot2 = CopDamage.damage_bullet(slot3, self)
	end

	return slot2
end
function CivilianEscortDamage:damage_explosion(attack_data)
	slot5 = attack_data

	if not self._escort_damage(slot3, self) then
		slot5 = attack_data
		slot2 = CopDamage.damage_explosion(slot3, self)
	end

	return slot2
end
function CivilianEscortDamage:damage_fire(attack_data)
	slot5 = attack_data

	if not self._escort_damage(slot3, self) then
		slot5 = attack_data
		slot2 = CopDamage.damage_fire(slot3, self)
	end

	return slot2
end
function CivilianEscortDamage:damage_melee(attack_data)
	slot5 = attack_data

	if not self._escort_damage(slot3, self) then
		slot5 = attack_data
		slot2 = CopDamage.damage_melee(slot3, self)
	end

	return slot2
end
function CivilianEscortDamage:damage_tase(attack_data)
	slot5 = attack_data

	if not self._escort_damage(slot3, self) then
		slot5 = attack_data
		slot2 = CopDamage.damage_tase(slot3, self)
	end

	return slot2
end

return 
