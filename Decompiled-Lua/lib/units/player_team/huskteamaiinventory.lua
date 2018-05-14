if not HuskTeamAIInventory then
	slot2 = HuskCopInventory
	slot0 = class(slot1)
end

HuskTeamAIInventory = slot0
function HuskTeamAIInventory:add_unit_by_name(new_unit_name, equip)
	slot7 = Vector3()
	local new_unit = World.spawn_unit(slot4, World, new_unit_name, Rotation())
	local setup_data = {
		user_unit = self._unit,
		ignore_units = {
			self._unit,
			new_unit
		},
		expend_ammo = false
	}
	slot8 = "bullet_impact_targets_no_AI"
	setup_data.hit_slotmask = managers.slot.get_mask(self._unit, managers.slot)
	setup_data.hit_player = false
	slot8 = self._unit
	setup_data.user_sound_variant = tweak_data.character[self._unit.base(managers.slot)._tweak_table].weapon_voice
	slot7 = new_unit
	slot8 = setup_data

	new_unit.base(self._unit.base(managers.slot)._tweak_table).setup(self._unit.base(managers.slot)._tweak_table, new_unit.base(self._unit.base(managers.slot)._tweak_table))

	slot9 = equip

	CopInventory.add_unit(self._unit.base(managers.slot)._tweak_table, self, new_unit)

	return 
end
function HuskTeamAIInventory:pre_destroy()
	slot3 = self

	HuskTeamAIInventory.super.pre_destroy(slot2)

	return 
end

return 
