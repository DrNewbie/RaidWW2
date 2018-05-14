if not HuskPlayerInventory then
	slot2 = PlayerInventory
	slot0 = class(slot1)
end

HuskPlayerInventory = slot0
HuskPlayerInventory.init = function (self, unit)
	HuskPlayerInventory.super.init(slot3, self)

	slot6 = "a_weapon_right_front"
	self._align_places.right_hand = {
		on_body = true,
		obj3d_name = Idstring(unit)
	}
	slot6 = "a_weapon_left_front"
	self._align_places.left_hand = {
		on_body = true,
		obj3d_name = Idstring(unit)
	}
	self._peer_weapons = {}

	return 
end
HuskPlayerInventory._send_equipped_weapon = function (self)
	return 
end
HuskPlayerInventory.synch_equipped_weapon = function (self, send_equipped_weapon_type, equipped_weapon_category_id, equipped_weapon_identifier, blueprint_string, cosmetics_string, peer)
	local weapon_name = ""

	if send_equipped_weapon_type == PlayerInventory.SEND_WEAPON_TYPE_PLAYER_PRIMARY_SECONDARY then
		slot11 = equipped_weapon_identifier
		weapon_name = managers.weapon_factory.get_factory_id_by_weapon_id(slot9, managers.weapon_factory)
		weapon_name = weapon_name .. "_npc"
		slot19 = weapon_name
		slot15 = self.cosmetics_string_from_peer(slot16, self, peer) or cosmetics_string

		self.add_unit_by_factory_name(slot9, self, weapon_name, true, true, blueprint_string)
	elseif send_equipped_weapon_type == PlayerInventory.SEND_WEAPON_TYPE_PLAYER_MELEE_GRENADE then
		if equipped_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
			local grenade_data = tweak_data.projectiles[equipped_weapon_identifier]
			slot11 = grenade_data.unit_dummy
			weapon_name = Idstring(slot10)
			slot14 = true

			self.add_unit_by_name(slot10, self, weapon_name, true)
		elseif equipped_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
			local melee_data = tweak_data.blackmarket.melee_weapons[equipped_weapon_identifier]
			slot11 = melee_data.third_unit
			weapon_name = Idstring(slot10)
			slot14 = true

			self.add_unit_by_name(slot10, self, weapon_name, true)
		end
	elseif send_equipped_weapon_type == PlayerInventory.SEND_WEAPON_TYPE_TEAMAI_COPS then
		slot11 = equipped_weapon_identifier
		weapon_name = tweak_data.character.weap_unit_names[tonumber(slot10)]
		slot13 = true

		self.add_unit_by_name(tonumber(slot10), self, weapon_name, true)
	end

	return 
end
HuskPlayerInventory.check_peer_weapon_spawn = function (self)
	slot4 = "PS3"

	if SystemInfo.platform(slot2) ~= Idstring(SystemInfo) then
		return true
	end

	local next_in_line = self._peer_weapons[1]

	if next_in_line then
		slot4 = next_in_line

		if type(slot3) == "table" then
			slot4 = "[HuskPlayerInventory:check_peer_weapon_spawn()] Adding weapon to inventory."
			slot7 = next_in_line

			print(slot3, inspect(slot6))

			slot4 = self
			slot7 = next_in_line

			self.add_unit_by_factory_blueprint(slot3, unpack(slot6))
		else
			slot4 = "[HuskPlayerInventory:check_peer_weapon_spawn()] waiting"

			print(slot3)
		end

		slot5 = 1

		table.remove(slot3, self._peer_weapons)
	else
		return true
	end

	return 
end
HuskPlayerInventory.set_melee_weapon_by_peer = function (self, peer)
	if peer then
		slot4 = peer
		local blackmarket_outfit = peer.blackmarket_outfit(slot3)
	end

	if blackmarket_outfit then
		slot7 = true

		self.set_melee_weapon(slot4, self, blackmarket_outfit.melee_weapon)
	end

	return 
end
HuskPlayerInventory.add_unit_by_name = function (self, new_unit_name, equip, instant)
	slot9 = "unit"
	slot9 = DynamicResourceManager.DYN_RESOURCES_PACKAGE

	if not managers.dyn_resource.is_resource_ready(slot5, managers.dyn_resource, Idstring(slot8), new_unit_name) then
		slot9 = "unit"
		slot10 = false

		managers.dyn_resource.load(slot5, managers.dyn_resource, Idstring(slot8), new_unit_name, DynamicResourceManager.DYN_RESOURCES_PACKAGE)
	end

	slot8 = Vector3()
	local new_unit = World.spawn_unit(slot5, World, new_unit_name, Rotation())
	local setup_data = {
		user_unit = self._unit,
		ignore_units = {
			self._unit,
			new_unit
		},
		expend_ammo = false,
		autoaim = false,
		alert_AI = false,
		user_sound_variant = "1"
	}
	slot8 = new_unit
	slot9 = setup_data

	new_unit.base(self._unit).setup(self._unit, new_unit.base(self._unit))

	slot11 = instant

	self.add_unit(self._unit, self, new_unit, equip)

	return 
end
HuskPlayerInventory.add_unit_by_factory_name = function (self, factory_name, equip, instant, blueprint_string, cosmetics_string)
	slot10 = blueprint_string
	local blueprint = managers.weapon_factory.unpack_blueprint_from_string(slot7, managers.weapon_factory, factory_name)
	slot13 = blueprint

	self.add_unit_by_factory_blueprint(managers.weapon_factory, self, factory_name, equip, instant)

	return 
end
HuskPlayerInventory.add_unit_by_factory_blueprint = function (self, factory_name, equip, instant, blueprint, cosmetics)
	local factory_weapon = tweak_data.weapon.factory[factory_name]
	slot13 = factory_weapon.unit
	slot12 = DynamicResourceManager.DYN_RESOURCES_PACKAGE

	if not managers.dyn_resource.is_resource_ready(slot8, managers.dyn_resource, Idstring(slot11), Idstring("unit")) then
		print(slot8, "[HuskPlayerInventory:add_unit_by_factory_blueprint]", "Weapon unit is not loaded, force loading it.")

		slot13 = factory_weapon.unit
		slot13 = false

		managers.dyn_resource.load(slot8, managers.dyn_resource, Idstring(factory_weapon.unit), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)
	end

	slot12 = factory_weapon.unit
	slot11 = Vector3()
	local new_unit = World.spawn_unit(slot8, World, Idstring(slot11), Rotation())
	slot10 = new_unit
	slot11 = factory_name

	new_unit.base(World).set_factory_data(World, new_unit.base(World))

	slot10 = new_unit
	slot11 = cosmetics

	new_unit.base(World).set_cosmetics_data(World, new_unit.base(World))

	slot10 = new_unit
	slot12 = blueprint

	new_unit.base(World).assemble_from_blueprint(World, new_unit.base(World), factory_name)

	slot10 = new_unit
	slot10 = new_unit.base(World)

	new_unit.base(World).check_npc(World)

	local setup_data = {
		user_unit = self._unit,
		ignore_units = {
			self._unit,
			new_unit
		},
		expend_ammo = false,
		autoaim = false,
		alert_AI = false,
		user_sound_variant = "1"
	}
	slot11 = new_unit
	slot12 = setup_data

	new_unit.base(self._unit).setup(self._unit, new_unit.base(self._unit))

	slot14 = instant

	self.add_unit(self._unit, self, new_unit, equip)

	slot11 = new_unit

	if new_unit.base(self._unit).AKIMBO then
		slot11 = new_unit
		slot11 = new_unit.base(slot10)

		new_unit.base(slot10).create_second_gun(slot10)
	end

	return 
end
HuskPlayerInventory.synch_weapon_gadget_state = function (self, state)
	slot4 = self
	slot4 = self.equipped_unit(slot3)

	if self.equipped_unit(slot3).base(slot3).set_gadget_on then
		slot4 = self
		slot4 = self.equipped_unit(slot3)
		slot6 = true

		self.equipped_unit(slot3).base(slot3).set_gadget_on(slot3, self.equipped_unit(slot3).base(slot3), state)

		if state and 0 < state then
			slot4 = self._unit
			slot5 = true

			self._unit.movement(slot3).set_cbt_permanent(slot3, self._unit.movement(slot3))
		else
			slot4 = self._unit
			slot5 = false

			self._unit.movement(slot3).set_cbt_permanent(slot3, self._unit.movement(slot3))
		end
	end

	return 
end
HuskPlayerInventory.on_melee_item_shown = function (self)
	local selection = self._available_selections[self._equipped_selection]

	if not selection then
		return 
	end

	if selection.use_data.equip.align_place == "left_hand" then
		slot4 = selection.unit

		if alive(slot3) then
			slot6 = self._align_places.right_hand

			self._link_weapon(slot3, self, selection.unit)
		end
	end

	return 
end
HuskPlayerInventory.on_melee_item_hidden = function (self)
	local selection = self._available_selections[self._equipped_selection]

	if not selection then
		return 
	end

	if selection.use_data.equip.align_place == "left_hand" then
		slot4 = selection.unit

		if alive(slot3) then
			slot6 = self._align_places.left_hand

			self._link_weapon(slot3, self, selection.unit)
		end
	end

	return 
end
HuskPlayerInventory._get_weapon_name_from_sync_index = function (w_index)
	if w_index <= #tweak_data.character.weap_unit_names then
		return tweak_data.character.weap_unit_names[w_index]
	end

	w_index = w_index - #tweak_data.character.weap_unit_names

	HuskPlayerInventory._chk_create_w_factory_indexes()

	local fps_id = PlayerInventory._weapon_factory_indexed[w_index]

	if tweak_data.weapon.factory[fps_id .. "_npc"] then
		return fps_id .. "_npc"
	else
		return fps_id
	end

	return 
end

return 
