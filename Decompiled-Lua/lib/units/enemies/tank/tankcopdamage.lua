if not TankCopDamage then
	slot2 = CopDamage
	slot0 = class(slot1)
end

TankCopDamage = slot0
function TankCopDamage:init(...)
	slot3 = self

	TankCopDamage.super.init(slot2, ...)

	return 
end
function TankCopDamage:damage_bullet(attack_data, ...)
	slot5 = attack_data

	return TankCopDamage.super.damage_bullet(slot3, self, ...)
end
function TankCopDamage:damage_melee(attack_data)
	local tweak_data = tweak_data.blackmarket.melee_weapons[attack_data.name_id]

	if tweak_data and (tweak_data.type == "knife" or tweak_data.type == "sword" or attack_data.name_id == "boxing_gloves") then
		slot6 = attack_data

		return TankCopDamage.super.damage_melee(slot4, self)
	else
		return 
	end

	return 
end
function TankCopDamage:seq_clbk_vizor_shatter()
	slot3 = self._unit
	slot3 = self._unit.character_damage(slot2)

	if not self._unit.character_damage(slot2).dead(slot2) then
		slot3 = self._unit
		slot4 = "visor_lost"

		self._unit.sound(slot2).say(slot2, self._unit.sound(slot2))
	end

	return 
end

return 
