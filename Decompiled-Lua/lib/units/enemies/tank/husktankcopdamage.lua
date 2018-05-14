if not HuskTankCopDamage then
	slot2 = HuskCopDamage
	slot0 = class(slot1)
end

HuskTankCopDamage = slot0
function HuskTankCopDamage:init(...)
	slot3 = self

	HuskTankCopDamage.super.init(slot2, ...)

	return 
end
function HuskTankCopDamage:damage_bullet(attack_data, ...)
	slot5 = attack_data

	return HuskTankCopDamage.super.damage_bullet(slot3, self, ...)
end
function HuskTankCopDamage:damage_melee(attack_data)
	local tweak_data = tweak_data.blackmarket.melee_weapons[attack_data.name_id]

	if tweak_data and (tweak_data.type == "knife" or tweak_data.type == "sword" or attack_data.name_id == "boxing_gloves") then
		slot6 = attack_data

		return HuskTankCopDamage.super.damage_melee(slot4, self)
	else
		return 
	end

	return 
end
function HuskTankCopDamage:seq_clbk_vizor_shatter()
	slot3 = self

	TankCopDamage.seq_clbk_vizor_shatter(slot2)

	return 
end

return 
