if not TeamAIInventory then
	slot2 = CopInventory
	slot0 = class(slot1)
end

TeamAIInventory = slot0
function TeamAIInventory:add_unit_by_name(new_unit_name, equip)
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
	slot8 = "bullet_impact_targets"
	setup_data.hit_slotmask = managers.slot.get_mask(self._unit, managers.slot)
	slot8 = self._unit
	setup_data.user_sound_variant = tweak_data.character[self._unit.base(managers.slot)._tweak_table].weapon_voice
	setup_data.alert_AI = true
	slot7 = self._unit
	slot7 = self._unit.brain(self._unit.base(managers.slot)._tweak_table)
	setup_data.alert_filter = self._unit.brain(self._unit.base(managers.slot)._tweak_table).SO_access(self._unit.base(managers.slot)._tweak_table)
	slot7 = new_unit
	slot8 = setup_data

	new_unit.base(self._unit.base(managers.slot)._tweak_table).setup(self._unit.base(managers.slot)._tweak_table, new_unit.base(self._unit.base(managers.slot)._tweak_table))

	slot9 = equip

	self.add_unit(self._unit.base(managers.slot)._tweak_table, self, new_unit)

	return 
end
function TeamAIInventory:pre_destroy(unit)
	slot5 = unit

	TeamAIInventory.super.pre_destroy(slot3, self)

	return 
end

return 
