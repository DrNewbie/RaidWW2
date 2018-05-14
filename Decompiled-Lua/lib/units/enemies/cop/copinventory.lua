if not CopInventory then
	slot2 = PlayerInventory
	slot0 = class(slot1)
end

CopInventory = slot0
function CopInventory:init(unit)
	CopInventory.super.init(slot3, self)

	self._unit = unit
	self._available_selections = {}
	self._equipped_selection = nil
	self._latest_addition = nil
	self._selected_primary = nil
	self._use_data_alias = "npc"
	self._align_places = {}
	slot6 = "a_weapon_right_front"
	self._align_places.right_hand = {
		on_body = true,
		obj3d_name = Idstring(unit)
	}
	self._align_places.back = {
		on_body = true,
		obj3d_name = Idstring(unit)
	}
	slot7 = unit
	self._listener_id = "CopInventory" .. tostring(unit.key("Hips"))

	return 
end
function CopInventory:_send_equipped_weapon()
	slot4 = PlayerInventory.SEND_WEAPON_TYPE_TEAMAI_COPS

	CopInventory.super._send_equipped_weapon(slot2, self)

	return 
end
function CopInventory:add_unit_by_name(new_unit_name, equip)
	slot7 = Vector3()
	local new_unit = World.spawn_unit(slot4, World, new_unit_name, Rotation())
	slot7 = new_unit

	self._chk_spawn_shield(World, self)

	local setup_data = {
		user_unit = self._unit,
		ignore_units = {
			self._unit,
			new_unit,
			self._shield_unit
		},
		expend_ammo = false
	}
	slot8 = "bullet_impact_targets"
	setup_data.hit_slotmask = managers.slot.get_mask(self._shield_unit, managers.slot)
	setup_data.hit_player = true
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
function CopInventory:_chk_spawn_shield(weapon_unit)
	if self._shield_unit_name then
		slot4 = self._shield_unit

		if not alive(slot3) then
			local align_name = Idstring(slot3)
			slot6 = align_name
			local align_obj = self._unit.get_object("a_weapon_left_front", self._unit)
			slot8 = align_obj.position(self._shield_unit_name)
			slot11 = align_obj
			self._shield_unit = World.spawn_unit(self._unit, World, Idstring(slot8), align_obj.rotation(align_obj))
			slot8 = self._shield_unit
			slot11 = self._shield_unit
			slot11 = self._shield_unit.orientation_object(align_obj)

			self._unit.link(self._unit, self._unit, align_name, self._shield_unit.orientation_object(align_obj).name(align_obj))

			slot7 = false

			self._shield_unit.set_enabled(self._unit, self._shield_unit)
		end
	end

	return 
end
function CopInventory:add_unit(new_unit, equip)
	slot7 = equip

	CopInventory.super.add_unit(slot4, self, new_unit)

	return 
end
function CopInventory:get_sync_data(sync_data)
	slot5 = sync_data

	MPPlayerInventory.get_sync_data(slot3, self)

	return 
end
function CopInventory:get_weapon()
	local selection = self._available_selections[self._equipped_selection]
	local unit = selection and selection.unit

	return unit
end
function CopInventory:drop_weapon()
	local selection = self._available_selections[self._equipped_selection]
	local unit = selection and selection.unit

	if unit then
		slot5 = unit

		if unit.damage(slot4) then
			slot5 = unit

			unit.unlink(slot4)

			slot5 = unit
			slot6 = "enable_body"

			unit.damage(slot4).run_sequence_simple(slot4, unit.damage(slot4))

			slot6 = "unequip"

			self._call_listeners(slot4, self)

			slot6 = unit

			managers.game_play_central.weapon_dropped(slot4, managers.game_play_central)
		end
	end

	return 
end
function CopInventory:drop_shield()
	slot3 = self._shield_unit

	if alive(slot2) then
		slot3 = self._shield_unit

		self._shield_unit.unlink(slot2)

		slot3 = self._shield_unit

		if self._shield_unit.damage(slot2) then
			slot3 = self._shield_unit
			slot4 = "enable_body"

			self._shield_unit.damage(slot2).run_sequence_simple(slot2, self._shield_unit.damage(slot2))
		end
	end

	return 
end
function CopInventory:anim_clbk_weapon_attached(unit, state)
	slot6 = state

	print(slot4, "[CopInventory:anim_clbk_weapon_attached]")

	if location == true then
		slot5 = "linking"

		print(slot4)

		local weap_unit = self._equipped_selection.unit
		local weap_align_data = selection.use_data.equip
		local align_place = self._align_places[weap_align_data.align_place]
		local parent_unit = self._unit
		slot11 = weap_unit
		slot14 = weap_unit
		slot14 = weap_unit.orientation_object(slot13)
		slot7 = parent_unit.link(slot8, parent_unit, align_place.obj3d_name, weap_unit.orientation_object(slot13).name(slot13))
	else
		slot5 = "unlinking"

		print(slot4)

		slot5 = self._equipped_selection.unit

		self._equipped_selection.unit.unlink(slot4)
	end

	return 
end
function CopInventory:destroy_all_items()
	slot3 = self

	CopInventory.super.destroy_all_items(slot2)

	slot3 = self._shield_unit

	if alive(slot2) then
		slot4 = 0

		self._shield_unit.set_slot(slot2, self._shield_unit)

		self._shield_unit = nil
	end

	return 
end
function CopInventory:anim_clbk_equip_enter(unit)
	slot4 = self

	self.show_equipped_unit(slot3)

	return 
end

return 
