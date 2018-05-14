WeaponInventoryManager = WeaponInventoryManager or class()
WeaponInventoryManager.VERSION_CHARACTER_SLOT = 1
WeaponInventoryManager.VERSION_ACCOUNT_WIDE = 22
WeaponInventoryManager.SAVE_TYPE_CHARACTER = "save_character"
WeaponInventoryManager.SAVE_TYPE_ACCOUNT = "save_account"
WeaponInventoryManager.DEFAULT_MELEE_WEAPON = "m3_knife"
WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID = 2
WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID = 1
WeaponInventoryManager.BM_CATEGORY_GRENADES_ID = 3
WeaponInventoryManager.BM_CATEGORY_MELEE_ID = 4
WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME = "primaries"
WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME = "secondaries"
WeaponInventoryManager.BM_CATEGORY_GRENADES_NAME = "grenades"
WeaponInventoryManager.BM_CATEGORY_MELEE_NAME = "melee_weapons"
WeaponInventoryManager.CATEGORY_NAME_PRIMARY = "primary_weapons"
WeaponInventoryManager.CATEGORY_NAME_SECONDARY = "secondary_weapons"
WeaponInventoryManager.CATEGORY_NAME_GRENADES = "grenades"
WeaponInventoryManager.CATEGORY_NAME_MELEE = "melee_weapons"
WeaponInventoryManager.get_instance = function ()
	if not Global.weapon_inventory_manager then
		slot3 = WeaponInventoryManager
		Global.weapon_inventory_manager = WeaponInventoryManager.new(Global.weapon_inventory_manager)

		Global.weapon_inventory_manager.setup(WeaponInventoryManager.new(Global.weapon_inventory_manager))
	end

	slot3 = WeaponInventoryManager

	setmetatable(slot1, Global.weapon_inventory_manager)

	return Global.weapon_inventory_manager
end
WeaponInventoryManager.init = function (self)
	self._categories = {
		[WeaponInventoryManager.CATEGORY_NAME_MELEE] = {
			save = WeaponInventoryManager.SAVE_TYPE_ACCOUNT,
			bm_name = WeaponInventoryManager.BM_CATEGORY_MELEE_NAME,
			bm_id = WeaponInventoryManager.BM_CATEGORY_MELEE_ID,
			index_table = tweak_data.weapon_inventory.weapon_melee_index
		}
	}

	return 
end
WeaponInventoryManager.setup = function (self)
	self.version_character_slot = WeaponInventoryManager.VERSION_CHARACTER_SLOT
	self.version_account_wide = WeaponInventoryManager.VERSION_ACCOUNT_WIDE
	self._weapons = {}
	slot3 = self

	self._setup_initial_weapons(slot2)

	return 
end
WeaponInventoryManager._setup_initial_weapons = function (self)
	local unlocked_melee_weapons = tweak_data.dlc.get_unlocked_melee_weapons(slot2)
	slot4 = self._categories

	for category_name, category_data in pairs(tweak_data.dlc) do
		self._weapons[category_name] = {}
		slot9 = category_data.index_table

		for _, weapon_data in pairs() do
			if category_name == WeaponInventoryManager.CATEGORY_NAME_MELEE then
				local weapon_id = weapon_data.weapon_id
				local weapon_tweaks = tweak_data.blackmarket.melee_weapons[weapon_id]

				if weapon_data.default then
					self._weapons[category_name][weapon_id] = {
						owned = true,
						unlocked = true,
						slot = weapon_data.slot,
						droppable = weapon_data.droppable,
						redeemed_xp = weapon_data.redeemed_xp,
						default = weapon_data.default
					}
				elseif weapon_tweaks.dlc and unlocked_melee_weapons[weapon_data.weapon_id] then
					self._weapons[category_name][weapon_id] = {
						owned = true,
						unlocked = true,
						slot = weapon_data.slot,
						droppable = weapon_data.droppable,
						redeemed_xp = weapon_data.redeemed_xp,
						default = weapon_data.default
					}
				else
					self._weapons[category_name][weapon_id] = {
						owned = true,
						unlocked = false,
						slot = weapon_data.slot,
						droppable = weapon_data.droppable,
						redeemed_xp = weapon_data.redeemed_xp,
						default = weapon_data.default
					}
				end
			end
		end
	end

	return 
end
WeaponInventoryManager.get_all_weapons_from_category = function (self, category_name)
	local category_data = self._categories[category_name]
	local result = {}
	slot6 = category_data.index_table

	for weapon_index, weapon_data in pairs(slot5) do
		slot12 = weapon_data

		table.insert(slot10, result)
	end

	return result
end
WeaponInventoryManager.get_melee_weapon_loot_drop_candidates = function (self)
	local all_melee_weapons = self.get_all_weapons_from_category(slot2, self)
	local result = {}
	slot5 = all_melee_weapons

	for weapon_index, weapon_data in pairs(WeaponInventoryManager.CATEGORY_NAME_MELEE) do
		if weapon_data.droppable then
			slot10 = result
			slot13 = weapon_data

			table.insert(slot9, clone(slot12))
		end
	end

	return result
end
WeaponInventoryManager.add_melee_weapon_as_drop = function (self, drop)
	slot5 = "[WeaponInventoryManager:add_melee_weapon_as_drop] drop "
	slot8 = drop

	Application.trace(slot3, Application, inspect(slot7))

	self._weapons[WeaponInventoryManager.CATEGORY_NAME_MELEE][drop.weapon_id].unlocked = true
	slot6 = {
		drop.weapon_id
	}

	managers.breadcrumb.add_breadcrumb(true, managers.breadcrumb, BreadcrumbManager.CATEGORY_WEAPON_MELEE)

	return 
end
WeaponInventoryManager.remove_melee_weapon_as_drop = function (self, drop)
	slot5 = "[WeaponInventoryManager:remove_melee_weapon_as_drop] drop "
	slot8 = drop

	Application.trace(slot3, Application, inspect(slot7))

	self._weapons[WeaponInventoryManager.CATEGORY_NAME_MELEE][drop.weapon_id].unlocked = false

	return 
end
WeaponInventoryManager.get_weapon_data = function (self, weapon_category_name, weapon_id)
	local result = nil
	local weapon_category_data = self._categories[weapon_category_name]
	slot7 = weapon_category_data.index_table

	for _, weapon_data in pairs(slot6) do
		if weapon_data.weapon_id == weapon_id then
			result = weapon_data
		end
	end

	return result
end
WeaponInventoryManager.get_weapon_blueprint = function (self, bm_weapon_category_id, weapon_id)
	slot7 = bm_weapon_category_id
	local weapon_slot = self.get_weapon_slot_by_weapon_id(slot4, self, weapon_id)
	slot7 = bm_weapon_category_id
	local bm_weapon_category_name = self.get_bm_weapon_category_name_by_bm_category_id(self, self)
	slot9 = weapon_slot
	local weapon_blueprint = managers.blackmarket.get_weapon_blueprint(self, managers.blackmarket, bm_weapon_category_name)

	return weapon_blueprint
end
WeaponInventoryManager.get_weapon_default_blueprint = function (self, bm_weapon_category_id, weapon_id)
	slot7 = bm_weapon_category_id
	local weapon_slot = self.get_weapon_slot_by_weapon_id(slot4, self, weapon_id)
	slot7 = bm_weapon_category_id
	local bm_weapon_category_name = self.get_bm_weapon_category_name_by_bm_category_id(self, self)
	slot8 = weapon_id
	local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(self, managers.weapon_factory)
	local weapon_blueprint = tweak_data.weapon.factory[weapon_factory_id].default_blueprint

	return weapon_blueprint
end
WeaponInventoryManager.get_weapon_category_name_by_bm_category_name = function (self, bm_weapon_category_name)
	if bm_weapon_category_name == WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME then
		return WeaponInventoryManager.CATEGORY_NAME_PRIMARY
	elseif bm_weapon_category_name == WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME then
		return WeaponInventoryManager.CATEGORY_NAME_SECONDARY
	elseif bm_weapon_category_name == WeaponInventoryManager.BM_CATEGORY_GRENADES_NAME then
		return WeaponInventoryManager.CATEGORY_NAME_GRENADES
	elseif bm_weapon_category_name == WeaponInventoryManager.BM_CATEGORY_MELEE_NAME then
		return WeaponInventoryManager.CATEGORY_NAME_MELEE
	end

	return 
end
WeaponInventoryManager.get_weapon_category_name_by_bm_category_id = function (self, bm_weapon_category_id)
	if bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		return WeaponInventoryManager.CATEGORY_NAME_PRIMARY
	elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		return WeaponInventoryManager.CATEGORY_NAME_SECONDARY
	elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
		return WeaponInventoryManager.CATEGORY_NAME_GRENADES
	elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		return WeaponInventoryManager.CATEGORY_NAME_MELEE
	end

	return 
end
WeaponInventoryManager.get_bm_weapon_category_name_by_bm_category_id = function (self, bm_weapon_category_id)
	if bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		return WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME
	elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		return WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME
	elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
		return WeaponInventoryManager.BM_CATEGORY_GRENADES_NAME
	elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		return WeaponInventoryManager.BM_CATEGORY_MELEE_NAME
	end

	return 
end
WeaponInventoryManager.save_account_wide_info = function (self, data)
	local state = {
		version_account_wide = self.version_account_wide,
		melee_weapons = self._weapons[WeaponInventoryManager.CATEGORY_NAME_MELEE]
	}
	data.WeaponInventoryManager = state

	return 
end
WeaponInventoryManager.load_account_wide_info = function (self, data, version_account_wide)
	slot6 = true

	self.setup(slot4, self)

	local state = data.WeaponInventoryManager

	if not state then
		return 
	end

	self._weapons[WeaponInventoryManager.CATEGORY_NAME_MELEE] = state.melee_weapons
	slot6 = tweak_data.weapon_inventory.weapon_melee_index

	for index, melee_weapon_data in ipairs(WeaponInventoryManager.CATEGORY_NAME_MELEE) do
		local weapon_id = melee_weapon_data.weapon_id

		if not self._weapons.melee_weapons[weapon_id] then
			self._weapons.melee_weapons[weapon_id] = {
				owned = true,
				unlocked = false,
				slot = melee_weapon_data.slot,
				droppable = melee_weapon_data.droppable,
				redeemed_xp = melee_weapon_data.redeemed_xp,
				default = melee_weapon_data.default
			}
			slot12 = managers.savefile

			managers.savefile.set_resave_required()
		end
	end

	local unlocked_melee_weapons = tweak_data.dlc.get_unlocked_melee_weapons(slot5)
	local locked_melee_weapons = tweak_data.dlc.get_locked_melee_weapons(tweak_data.dlc)
	slot8 = self._weapons.melee_weapons

	for weapon_id, melee_weapon in pairs(tweak_data.dlc) do
		local weapon_tweaks = tweak_data.blackmarket.melee_weapons[weapon_id]

		if weapon_tweaks.dlc then
			if unlocked_melee_weapons[weapon_id] then
				melee_weapon.unlocked = true
				melee_weapon.owned = true
			elseif locked_melee_weapons[weapon_id] then
				melee_weapon.unlocked = false
				melee_weapon.owned = false
			end
		end
	end

	return 
end
WeaponInventoryManager.get_weapon_category_by_weapon_category_id = function (self, weapon_category_id)
	if weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		return WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		return WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
		return WeaponInventoryManager.BM_CATEGORY_GRENADES_NAME
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		return WeaponInventoryManager.BM_CATEGORY_MELEE_NAME
	end

	return 
end
WeaponInventoryManager.add_all_weapons_to_player_inventory = function (self)
	slot3 = tweak_data.weapon_inventory.weapon_primaries_index

	for index, weapon_data in pairs(slot2) do
		slot12 = true

		managers.blackmarket.on_buy_weapon_platform(slot7, managers.blackmarket, WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME, weapon_data.weapon_id, weapon_data.slot)
	end

	slot3 = tweak_data.weapon_inventory.weapon_secondaries_index

	for index, weapon_data in pairs(slot2) do
		slot12 = true

		managers.blackmarket.on_buy_weapon_platform(slot7, managers.blackmarket, WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME, weapon_data.weapon_id, weapon_data.slot)
	end

	return 
end
WeaponInventoryManager.get_weapon_slot_by_weapon_id = function (self, weapon_id, bm_weapon_category_id)
	local weapon_source = {}

	if bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		weapon_source = tweak_data.weapon_inventory.weapon_primaries_index
	elseif bm_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		weapon_source = tweak_data.weapon_inventory.weapon_secondaries_index
	end

	if weapon_source then
		slot6 = weapon_source

		for index, weapon_data in pairs(slot5) do
			if weapon_data.weapon_id == weapon_id then
				return weapon_data.slot
			end
		end
	end

	return 0
end
WeaponInventoryManager.get_owned_weapons = function (self, weapon_category_id)
	local result = {}
	local data_source = {}

	if weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		data_source = tweak_data.weapon_inventory.weapon_primaries_index
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		data_source = tweak_data.weapon_inventory.weapon_secondaries_index
	end

	local unlocked_weapons = tweak_data.dlc.get_unlocked_weapons(slot5)
	slot7 = data_source

	for index, weapon_data in pairs(tweak_data.dlc) do
		local weapon_tweaks = tweak_data.weapon[weapon_data.weapon_id]

		if not weapon_tweaks.dlc or unlocked_weapons[weapon_data.weapon_id] then
			slot14 = weapon_data.weapon_id
			weapon_data.unlocked = managers.upgrades.aquired(slot12, managers.upgrades)

			if weapon_tweaks and weapon_tweaks.use_data and weapon_tweaks.use_data.selection_index and weapon_tweaks.use_data.selection_index == weapon_category_id then
				slot14 = weapon_data

				table.insert(slot12, result)
			end
		end
	end

	return result
end
WeaponInventoryManager.get_owned_melee_weapons = function (self)
	local result = {}
	slot4 = tweak_data.dlc
	local unlocked_weapons = tweak_data.dlc.get_unlocked_melee_weapons(slot3)

	if self._weapons.melee_weapons then
		slot5 = self._weapons.melee_weapons

		for weapon_id, weapon_data in pairs(slot4) do
			local weapon_tweaks = tweak_data.blackmarket.melee_weapons[weapon_id]

			if not weapon_tweaks.dlc or unlocked_weapons[weapon_id] then
				local unlocked = weapon_data.unlocked or unlocked_weapons[weapon_id]
				slot13 = {
					weapon_id = weapon_id,
					owned = weapon_data.owned,
					unlocked = unlocked,
					slot = weapon_data.slot,
					droppable = weapon_data.droppable,
					redeemed_xp = weapon_data.redeemed_xp,
					default = weapon_data.default
				}

				table.insert(slot11, result)
			end
		end
	end

	return result
end
WeaponInventoryManager.is_melee_weapon_owned = function (self, weapon_id)
	local melee_weapon_data = managers.weapon_inventory._weapons.melee_weapons[weapon_id]

	return (melee_weapon_data and melee_weapon_data.unlocked) or false
end
WeaponInventoryManager.get_owned_grenades = function (self)
	local result = {}

	if tweak_data.weapon_inventory.weapon_grenades_index then
		slot4 = tweak_data.weapon_inventory.weapon_grenades_index

		for index, weapon_data in pairs(slot3) do
			local weapon_stats = tweak_data.projectiles[weapon_data.weapon_id]

			if not weapon_data.default then
				slot11 = weapon_data.weapon_id
				slot8 = managers.upgrades.aquired(slot9, managers.upgrades)
			end

			weapon_data.unlocked = slot8

			if weapon_stats then
				slot11 = weapon_data

				table.insert(slot9, result)
			end
		end
	end

	return result
end
WeaponInventoryManager.get_equipped_primary_weapon = function (self)
	slot4 = WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME

	return managers.blackmarket.equipped_item(slot2, managers.blackmarket)
end
WeaponInventoryManager.get_equipped_secondary_weapon = function (self)
	slot4 = WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME

	return managers.blackmarket.equipped_item(slot2, managers.blackmarket)
end
WeaponInventoryManager.get_equipped_primary_weapon_id = function (self)
	slot3 = self

	return self.get_equipped_primary_weapon(slot2).weapon_id
end
WeaponInventoryManager.get_equipped_secondary_weapon_id = function (self)
	slot3 = self

	return self.get_equipped_secondary_weapon(slot2).weapon_id
end
WeaponInventoryManager.get_equipped_melee_weapon_id = function (self)
	slot3 = managers.blackmarket

	return managers.blackmarket.equipped_melee_weapon(slot2)
end
WeaponInventoryManager.get_equipped_grenade_id = function (self)
	slot3 = managers.blackmarket

	return managers.blackmarket.equipped_projectile(slot2)
end
WeaponInventoryManager.equip_weapon = function (self, weapon_category_id, item_data)
	if weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		slot7 = item_data.slot

		managers.blackmarket.equip_weapon(slot4, managers.blackmarket, WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME)
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		slot7 = item_data.slot

		managers.blackmarket.equip_weapon(slot4, managers.blackmarket, WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME)
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		slot6 = item_data.weapon_id

		managers.blackmarket.equip_melee_weapon(slot4, managers.blackmarket)
	elseif weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
		slot6 = item_data.weapon_id

		managers.blackmarket.equip_grenade(slot4, managers.blackmarket)
	end

	return 
end
WeaponInventoryManager.get_weapon_stats = function (self, weapon_id, weapon_category, slot, blueprint)
	slot11 = blueprint

	return managers.blackmarket._get_stats(slot6, managers.blackmarket, weapon_id, weapon_category, slot)
end
WeaponInventoryManager.get_melee_weapon_stats = function (self, weapon_id)
	slot5 = weapon_id

	return managers.blackmarket._get_melee_weapon_stats(slot3, managers.blackmarket)
end
WeaponInventoryManager.debug_get_all_melee_weapons = function (self)
	if managers.weapon_inventory._weapons.melee_weapons then
		slot3 = managers.weapon_inventory._weapons.melee_weapons

		for _, melee_weapon_data in pairs(slot2) do
			melee_weapon_data.unlocked = true
		end

		slot4 = true

		managers.savefile.save_setting(slot2, managers.savefile)
	end

	return 
end

return 
