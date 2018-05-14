if not MeleeWeaponBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

MeleeWeaponBase = slot0
MeleeWeaponBase.EVENT_IDS = {
	detonate = 1
}
local mvec1 = Vector3()
local mvec2 = Vector3()
function MeleeWeaponBase:setup(unit, t, dt)
	return 
end
function MeleeWeaponBase:update(unit, t, dt)
	slot9 = dt

	MeleeWeaponBase.super.update(slot5, self, unit, t)

	return 
end
function MeleeWeaponBase:get_name_id()
	return self.name_id
end
function MeleeWeaponBase:is_melee_weapon()
	return true
end
function MeleeWeaponBase:get_use_data(character_setup)
	local use_data = {
		equip = {
			align_place = "right_hand"
		}
	}
	slot5 = self
	use_data.selection_index = self.selection_index(slot4)
	use_data.unequip = {
		align_place = "back"
	}

	return use_data
end
function MeleeWeaponBase:tweak_data_anim_play(anim, ...)
	slot4 = self
	local animations = self.weapon_tweak_data(slot3).animations

	if animations and animations[anim] then
		slot6 = animations[anim]

		self.anim_play(slot4, self, ...)

		return true
	end

	return false
end
function MeleeWeaponBase:anim_play(anim, speed_multiplier)
	if anim then
		slot5 = self._unit
		slot8 = anim
		local length = self._unit.anim_length(slot4, Idstring(slot7))
		speed_multiplier = speed_multiplier or 1
		slot6 = self._unit
		slot9 = anim

		self._unit.anim_stop(slot5, Idstring(slot8))

		slot9 = anim
		slot9 = speed_multiplier

		self._unit.anim_play_to(slot5, self._unit, Idstring(slot8), length)
	end

	return 
end
function MeleeWeaponBase:tweak_data_anim_stop(anim, ...)
	slot4 = self
	local animations = self.weapon_tweak_data(slot3).animations

	if animations and animations[anim] then
		slot8 = self
		slot6 = self.weapon_tweak_data(slot7).animations[anim]

		self.anim_stop(slot4, self, ...)

		return true
	end

	return false
end
function MeleeWeaponBase:anim_stop(anim)
	slot4 = self._unit
	slot7 = anim

	self._unit.anim_stop(slot3, Idstring(slot6))

	return 
end
function MeleeWeaponBase:ammo_info()
	return 
end
function MeleeWeaponBase:add_ammo(ratio, add_amount_override, add_amount_multiplier)
	return false, 0
end
function MeleeWeaponBase:add_ammo_from_bag(available)
	return 0
end
function MeleeWeaponBase:on_equip()
	return 
end
function MeleeWeaponBase:on_unequip()
	return 
end
function MeleeWeaponBase:on_enabled()
	self._enabled = true

	return 
end
function MeleeWeaponBase:on_disabled()
	self._enabled = false

	return 
end
function MeleeWeaponBase:enabled()
	return self._enabled
end
function MeleeWeaponBase:get_stance_id()
	slot3 = self

	return self.weapon_tweak_data(slot2).stance
end
function MeleeWeaponBase:transition_duration()
	slot3 = self

	return self.weapon_tweak_data(slot2).transition_duration
end
function MeleeWeaponBase:enter_steelsight_speed_multiplier()
	return 1
end
function MeleeWeaponBase:exit_run_speed_multiplier()
	slot3 = self

	return self.weapon_tweak_data(slot2).exit_run_speed_multiplier
end
function MeleeWeaponBase:weapon_tweak_data()
	return tweak_data.blackmarket.melee_weapons[self.name_id]
end
function MeleeWeaponBase:weapon_hold()
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_hold
end
function MeleeWeaponBase:selection_index()
	return PlayerInventory.SLOT_4
end
function MeleeWeaponBase:has_range_distance_scope()
	return false
end
function MeleeWeaponBase:movement_penalty()
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_movement_penalty or 1
end
function MeleeWeaponBase:set_visibility_state(state)
	slot5 = state

	self._unit.set_visible(slot3, self._unit)

	return 
end
function MeleeWeaponBase:start_shooting_allowed()
	return true
end
function MeleeWeaponBase:save(data)
	return 
end
function MeleeWeaponBase:load(data)
	return 
end
function MeleeWeaponBase:uses_ammo()
	return false
end
function MeleeWeaponBase:replenish()
	return 
end
function MeleeWeaponBase:get_aim_assist()
	return 
end

return 
