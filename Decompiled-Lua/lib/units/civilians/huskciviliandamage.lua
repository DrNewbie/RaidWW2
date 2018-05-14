if not HuskCivilianDamage then
	slot2 = HuskCopDamage
	slot0 = class(slot1)
end

HuskCivilianDamage = slot0
HuskCivilianDamage._HEALTH_INIT = CivilianDamage._HEALTH_INIT
HuskCivilianDamage.damage_bullet = CivilianDamage.damage_bullet
HuskCivilianDamage.damage_melee = CivilianDamage.damage_melee
function HuskCivilianDamage:_on_damage_received(damage_info)
	slot5 = damage_info

	CivilianDamage._on_damage_received(slot3, self)

	return 
end
function HuskCivilianDamage:_unregister_from_enemy_manager(damage_info)
	slot5 = damage_info

	CivilianDamage._unregister_from_enemy_manager(slot3, self)

	return 
end
function HuskCivilianDamage:damage_explosion(attack_data)
	if attack_data.variant == "explosion" then
		attack_data.damage = 10
	end

	slot5 = attack_data

	return CopDamage.damage_explosion(slot3, self)
end
function HuskCivilianDamage:damage_fire(attack_data)
	if attack_data.variant == "fire" then
		attack_data.damage = 10
	end

	slot5 = attack_data

	return CopDamage.damage_fire(slot3, self)
end

return 
