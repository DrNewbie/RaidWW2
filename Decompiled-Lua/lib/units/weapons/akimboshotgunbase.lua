if not AkimboShotgunBase then
	slot2 = AkimboWeaponBase
	slot0 = class(slot1)
end

AkimboShotgunBase = slot0
function AkimboShotgunBase:init(...)
	slot3 = self

	AkimboShotgunBase.super.init(slot2, ...)

	slot3 = self

	self.setup_default(slot2)

	return 
end
function AkimboShotgunBase:setup_default()
	slot3 = self

	NewShotgunBase.setup_default(slot2)

	return 
end
function AkimboShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	slot21 = shoot_through_data

	return NewShotgunBase._fire_raycast(slot11, self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
end
function AkimboShotgunBase:get_damage_falloff(damage, col_ray, user_unit)
	slot9 = user_unit

	return NewShotgunBase.get_damage_falloff(slot5, self, damage, col_ray)
end
function AkimboShotgunBase:_update_stats_values()
	slot3 = self

	NewShotgunBase._update_stats_values(slot2)

	return 
end

if not NPCAkimboShotgunBase then
	slot2 = NPCAkimboWeaponBase
	slot0 = class(slot1)
end

NPCAkimboShotgunBase = slot0

return 
