if not NPCBowWeaponBase then
	slot2 = NewNPCRaycastWeaponBase
	slot0 = class(slot1)
end

NPCBowWeaponBase = slot0
function NPCBowWeaponBase:init(...)
	slot3 = self

	NPCBowWeaponBase.super.init(slot2, ...)

	return 
end
function NPCBowWeaponBase:fire_blank(direction, impact)
	slot5 = self

	self._sound_singleshot(slot4)

	slot5 = self

	if self.weapon_tweak_data(slot4).has_fire_animation then
		slot6 = "fire"

		self.tweak_data_anim_play(slot4, self)
	end

	return 
end

if not NPCCrossBowWeaponBase then
	slot2 = NPCBowWeaponBase
	slot0 = class(slot1)
end

NPCCrossBowWeaponBase = slot0

return 
