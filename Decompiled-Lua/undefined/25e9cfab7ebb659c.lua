if not LeeEnfieldRaycastWeaponBase then
	slot2 = HybridReloadRaycastWeaponBase
	slot0 = class(slot1)
end

LeeEnfieldRaycastWeaponBase = slot0
function LeeEnfieldRaycastWeaponBase:use_shotgun_reload()
	slot4 = "lee_enfield"

	if managers.weapon_skills.get_weapon_skills(slot2, managers.weapon_skills)[2][3][1].active then
		return false
	end

	slot3 = self

	return LeeEnfieldRaycastWeaponBase.super.use_shotgun_reload(slot2)
end

return 
