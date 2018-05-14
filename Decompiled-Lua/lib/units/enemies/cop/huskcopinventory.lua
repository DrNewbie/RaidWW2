if not HuskCopInventory then
	slot2 = HuskPlayerInventory
	slot0 = class(slot1)
end

HuskCopInventory = slot0
function HuskCopInventory:init(unit)
	slot5 = unit

	CopInventory.init(slot3, self)

	return 
end
function HuskCopInventory:set_visibility_state(state)
	slot5 = state

	CopInventory.set_visibility_state(slot3, self)

	return 
end
function HuskCopInventory:add_unit_by_name(new_unit_name, equip)
	slot7 = Vector3()
	local new_unit = World.spawn_unit(slot4, World, new_unit_name, Rotation())
	slot7 = new_unit

	CopInventory._chk_spawn_shield(World, self)

	local setup_data = {
		user_unit = self._unit,
		ignore_units = {
			self._unit,
			new_unit,
			self._shield_unit
		},
		expend_ammo = false
	}
	slot8 = "bullet_impact_targets_no_AI"
	setup_data.hit_slotmask = managers.slot.get_mask(self._shield_unit, managers.slot)
	setup_data.hit_player = true
	slot8 = self._unit
	setup_data.user_sound_variant = tweak_data.character[self._unit.base(managers.slot)._tweak_table].weapon_voice
	slot7 = new_unit
	slot8 = setup_data

	new_unit.base(self._unit.base(managers.slot)._tweak_table).setup(self._unit.base(managers.slot)._tweak_table, new_unit.base(self._unit.base(managers.slot)._tweak_table))

	slot9 = equip

	CopInventory.add_unit(self._unit.base(managers.slot)._tweak_table, self, new_unit)

	return 
end
function HuskCopInventory:get_weapon()
	slot3 = self

	CopInventory.get_weapon(slot2)

	return 
end
function HuskCopInventory:drop_weapon()
	slot3 = self

	CopInventory.drop_weapon(slot2)

	return 
end
function HuskCopInventory:drop_shield()
	slot3 = self

	CopInventory.drop_shield(slot2)

	return 
end
function HuskCopInventory:destroy_all_items()
	slot3 = self

	CopInventory.destroy_all_items(slot2)

	return 
end
function HuskCopInventory:add_unit(new_unit, equip)
	slot7 = equip

	CopInventory.add_unit(slot4, self, new_unit)

	return 
end
function HuskCopInventory:set_visibility_state(state)
	slot5 = state

	CopInventory.set_visibility_state(slot3, self)

	return 
end

return 
