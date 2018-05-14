-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
UpgradesManager = UpgradesManager or class()
UpgradesManager.AQUIRE_STRINGS = {
	"Default",
	"SkillTree",
	"SpecializationTree",
	"LevelTree",
	"DLC",
	"WeaponSkill",
	"MeleeWeaponDrop"
}
function UpgradesManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function UpgradesManager:_setup()
	if not Global.upgrades_manager then
		Global.upgrades_manager = {
			aquired = {},
			automanage = false,
			disabled_visual_upgrades = {},
			progress = {
				0,
				0,
				0,
				0
			}
		}
		slot4 = self
		Global.upgrades_manager.target_tree = self._autochange_tree(slot3)
	end

	self._global = Global.upgrades_manager

	return 
end
function UpgradesManager:setup_current_weapon()
	return 
end
function UpgradesManager:visual_weapon_upgrade_active(upgrade)
	return not self._global.disabled_visual_upgrades[upgrade]
end
function UpgradesManager:toggle_visual_weapon_upgrade(upgrade)
	if self._global.disabled_visual_upgrades[upgrade] then
		self._global.disabled_visual_upgrades[upgrade] = nil
	else
		self._global.disabled_visual_upgrades[upgrade] = true
	end

	return 
end
function UpgradesManager:set_target_tree(tree)
	slot4 = managers.experience
	local level = managers.experience.current_level(slot3)
	local step = self._global.progress[tree]
	local cap = tweak_data.upgrades.tree_caps[self._global.progress[tree] + 1]

	if cap and level < cap then
		return 
	end

	slot8 = tree

	self._set_target_tree(slot6, self)

	return 
end
function UpgradesManager:_set_target_tree(tree)
	local i = self._global.progress[tree] + 1
	local upgrade = tweak_data.upgrades.definitions[tweak_data.upgrades.progress[tree][i]]
	self._global.target_tree = tree

	return 
end
function UpgradesManager:current_tree_name()
	slot4 = self._global.target_tree

	return self.tree_name(slot2, self)
end
function UpgradesManager:tree_name(tree)
	slot5 = tweak_data.upgrades.trees[tree].name_id

	return managers.localization.text(slot3, managers.localization)
end
function UpgradesManager:tree_allowed(tree, level)
	if not level then
		slot5 = managers.experience
		level = managers.experience.current_level(slot4)
	end

	local cap = tweak_data.upgrades.tree_caps[self._global.progress[tree] + 1]

	return not cap or level >= cap, cap
end
function UpgradesManager:current_tree()
	return self._global.target_tree
end
function UpgradesManager:next_upgrade(tree)
	return 
end
function UpgradesManager:level_up()
	local level = managers.experience.current_level(slot2)
	slot5 = level

	print(managers.experience, "UpgradesManager:level_up()")

	slot6 = false

	self.aquire_from_level_tree(managers.experience, self, level)

	return 
end
function UpgradesManager:aquire_from_level_tree(level, loading)
	local tree_data = tweak_data.upgrades.level_tree[level]

	if not tree_data then
		return 
	end

	slot7 = level
	local identifier = UpgradesManager.AQUIRE_STRINGS[4] .. tostring(slot6)
	slot7 = tree_data.upgrades

	for _, upgrade in ipairs(slot6) do
		slot14 = identifier

		if not self.aquired(slot11, self, upgrade) then
			slot15 = identifier

			self.aquire(slot11, self, upgrade, loading)
		end
	end

	return 
end
function UpgradesManager:verify_level_tree(level, loading)
	local tree_data = tweak_data.upgrades.level_tree[level]

	if not tree_data then
		return 
	end

	local identifier = UpgradesManager.AQUIRE_STRINGS[4] .. tostring(slot6)
	local upgrade = nil
	slot8 = tree_data.upgrades

	for _, id in ipairs(level) do
		upgrade = tweak_data.upgrades.definitions[id]

		if upgrade and upgrade.dlc then
			slot14 = upgrade.dlc

			if not managers.dlc.is_dlc_unlocked(slot12, managers.dlc) then
				slot15 = identifier

				if self.aquired(slot12, self, id) then
					slot15 = identifier

					self.unaquire(slot12, self, id)
				end
			end
		end
	end

	return 
end
function UpgradesManager:_next_tree()
	local tree = nil

	if self._global.automanage then
		slot4 = self
		tree = self._autochange_tree(slot3)
	end

	slot4 = managers.experience
	local level = managers.experience.current_level(slot3) + 1
	local cap = tweak_data.upgrades.tree_caps[self._global.progress[self._global.target_tree] + 1]

	if cap and level < cap then
		slot7 = self._global.target_tree
		tree = self._autochange_tree(slot5, self)
	end

	return tree or self._global.target_tree
end
function UpgradesManager:num_trees()
	slot4 = "preorder"

	return (managers.dlc.is_dlc_unlocked(slot2, managers.dlc) and 4) or 3
end
function UpgradesManager:_autochange_tree(exlude_tree)
	slot4 = Global.upgrades_manager.progress
	local progress = clone(slot3)

	if exlude_tree then
		progress[exlude_tree] = nil
	end

	slot6 = "preorder"

	if not managers.dlc.is_dlc_unlocked(slot4, managers.dlc) then
		progress[4] = nil
	end

	local n_tree = 0
	local n_v = 100
	slot7 = progress

	for tree, v in pairs(slot6) do
		if v < n_v then
			n_tree = tree
			n_v = v
		end
	end

	return n_tree
end
function UpgradesManager:aquired(id, identifier)
	if identifier then
		slot5 = identifier
		slot5 = Idstring(slot4)
		local identify_key = Idstring(slot4).key(slot4)

		return self._global.aquired[id] and not not self._global.aquired[id][identify_key]
	else
		local count = 0
		slot4 = pairs
		slot6 = self._global.aquired[id] or {}

		for key, aquired in slot4(slot5) do
			if aquired then
				count = count + 1
			end
		end

		return 0 < count
	end

	return 
end
function UpgradesManager:aquire_default(id, identifier)
	if not tweak_data.upgrades.definitions[id] then
		slot6 = "Tried to aquire an upgrade that doesn't exist: " .. (id or "nil") .. ""

		Application.error(slot4, Application)

		return 
	end

	local upgrade = tweak_data.upgrades.definitions[id]

	if upgrade.dlc then
		slot7 = upgrade.dlc

		if not managers.dlc.is_dlc_unlocked(slot5, managers.dlc) then
			slot8 = upgrade.dlc

			Application.error(slot5, Application, "Tried to aquire an upgrade locked to a dlc you do not have: " .. id .. " DLC: ")

			return 
		end
	end

	if not identifier then
		slot9 = id

		debug_pause(slot5, identifier, "[UpgradesManager:aquire_default] No identifier for upgrade aquire", "id")

		identifier = UpgradesManager.AQUIRE_STRINGS[1]
	end

	slot6 = identifier
	slot6 = Idstring(slot5)
	local identify_key = Idstring(slot5).key(slot5)

	if self._global.aquired[id] and self._global.aquired[id][identify_key] then
		slot12 = identify_key

		Application.error(slot6, Application, "Tried to aquire an upgrade that has already been aquired: " .. id, "identifier", identifier, "id_key")

		slot7 = Application

		Application.stack_dump(slot6)

		return 
	end

	self._global.aquired[id] = self._global.aquired[id] or {}
	self._global.aquired[id][identify_key] = identifier
	local upgrade = tweak_data.upgrades.definitions[id]
	slot11 = true

	self._aquire_upgrade(slot7, self, upgrade, id)

	return 
end
function UpgradesManager:enable_weapon(id, identifier)
	if not tweak_data.upgrades.definitions[id] then
		slot6 = "Tried to aquire an upgrade that doesn't exist: " .. (id or "nil") .. ""

		Application.error(slot4, Application)

		return 
	end

	local upgrade = tweak_data.upgrades.definitions[id]

	if upgrade.dlc then
		slot7 = upgrade.dlc

		if not managers.dlc.is_dlc_unlocked(slot5, managers.dlc) then
			slot8 = upgrade.dlc

			Application.error(slot5, Application, "Tried to aquire an upgrade locked to a dlc you do not have: " .. id .. " DLC: ")

			return 
		end
	end

	if not identifier then
		slot9 = id

		debug_pause(slot5, identifier, "[UpgradesManager:aquire_default] No identifier for upgrade aquire", "id")

		identifier = UpgradesManager.AQUIRE_STRINGS[1]
	end

	slot6 = identifier
	slot6 = Idstring(slot5)
	local identify_key = Idstring(slot5).key(slot5)

	if self._global.aquired[id] and self._global.aquired[id][identify_key] then
		slot12 = identify_key

		Application.error(slot6, Application, "Tried to aquire an upgrade that has already been aquired: " .. id, "identifier", identifier, "id_key")

		slot7 = Application

		Application.stack_dump(slot6)

		return 
	end

	self._global.aquired[id] = self._global.aquired[id] or {}
	self._global.aquired[id][identify_key] = identifier
	slot10 = UpgradesManager.AQUIRE_STRINGS[1]

	managers.player.aquire_weapon(self._global.aquired[id] or , managers.player, upgrade, id)

	return 
end
function UpgradesManager:aquire(id, loading, identifier)
	if not tweak_data.upgrades.definitions[id] then
		slot7 = "Tried to aquire an upgrade that doesn't exist: " .. (id or "nil") .. ""

		Application.error(slot5, Application)

		return 
	end

	local upgrade = tweak_data.upgrades.definitions[id]

	if upgrade.dlc then
		slot8 = upgrade.dlc

		if not managers.dlc.is_dlc_unlocked(slot6, managers.dlc) then
			slot9 = upgrade.dlc

			Application.error(slot6, Application, "Tried to aquire an upgrade locked to a dlc you do not have: " .. id .. " DLC: ")

			return 
		end
	end

	if not identifier then
		slot12 = loading

		debug_pause(slot6, identifier, "[UpgradesManager:aquire] No identifier for upgrade aquire", "id", id, "loading")

		identifier = UpgradesManager.AQUIRE_STRINGS[1]
	end

	slot7 = identifier
	slot7 = Idstring(slot6)
	local identify_key = Idstring(slot6).key(slot6)

	if self._global.aquired[id] and self._global.aquired[id][identify_key] then
		slot13 = identify_key

		Application.error(slot7, Application, "Tried to aquire an upgrade that has already been aquired: " .. id, "identifier", identifier, "id_key")

		slot8 = Application

		Application.stack_dump(slot7)

		return 
	end

	self._global.aquired[id] = self._global.aquired[id] or {}
	self._global.aquired[id][identify_key] = identifier
	slot11 = loading

	self._aquire_upgrade(self._global.aquired[id] or , self, upgrade, id)

	slot8 = self

	self.setup_current_weapon(self._global.aquired[id] or )

	return 
end
function UpgradesManager:unaquire(id, identifier)
	if not tweak_data.upgrades.definitions[id] then
		slot6 = "Tried to unaquire an upgrade that doesn't exist: " .. (id or "nil") .. ""

		Application.error(slot4, Application)

		return 
	end

	if not identifier then
		slot8 = id

		debug_pause(slot4, identifier, "[UpgradesManager:unaquire] No identifier for upgrade aquire", "id")

		identifier = UpgradesManager.AQUIRE_STRINGS[1]
	end

	slot5 = identifier
	slot5 = Idstring(slot4)
	local identify_key = Idstring(slot4).key(slot4)

	if not self._global.aquired[id] or not self._global.aquired[id][identify_key] then
		slot9 = identifier

		Application.error(slot5, Application, "Tried to unaquire an upgrade that hasn't been aquired: " .. id, "identifier")

		return 
	end

	self._global.aquired[id][identify_key] = nil
	local count = 0
	slot7 = self._global.aquired[id]

	for key, aquired in pairs(slot6) do
		count = count + 1
	end

	if count == 0 then
		self._global.aquired[id] = nil
		local upgrade = tweak_data.upgrades.definitions[id]
		slot10 = id

		self._unaquire_upgrade(slot7, self, upgrade)
	end

	return 
end
function UpgradesManager:_aquire_upgrade(upgrade, id, loading)
	if upgrade.category == "weapon" then
		slot9 = loading

		self._aquire_weapon(slot5, self, upgrade, id)
	elseif upgrade.category == "feature" then
		slot9 = loading

		self._aquire_feature(slot5, self, upgrade, id)
	elseif upgrade.category == "equipment" then
		slot9 = loading

		self._aquire_equipment(slot5, self, upgrade, id)
	elseif upgrade.category == "equipment_upgrade" then
		slot9 = loading

		self._aquire_equipment_upgrade(slot5, self, upgrade, id)
	elseif upgrade.category == "temporary" then
		slot9 = loading

		self._aquire_temporary(slot5, self, upgrade, id)
	elseif upgrade.category == "cooldown" then
		slot9 = loading

		self._aquire_cooldown(slot5, self, upgrade, id)
	elseif upgrade.category == "team" then
		slot9 = loading

		self._aquire_team(slot5, self, upgrade, id)
	elseif upgrade.category == "armor" then
		slot9 = loading

		self._aquire_armor(slot5, self, upgrade, id)
	elseif upgrade.category == "rep_upgrade" then
		slot9 = loading

		self._aquire_rep_upgrade(slot5, self, upgrade, id)
	elseif upgrade.category == "melee_weapon" then
		slot9 = loading

		self._aquire_melee_weapon(slot5, self, upgrade, id)
	elseif upgrade.category == "grenade" then
		slot9 = loading

		self._aquire_grenade(slot5, self, upgrade, id)
	end

	return 
end
function UpgradesManager:_unaquire_upgrade(upgrade, id)
	if upgrade.category == "weapon" then
		slot7 = id

		self._unaquire_weapon(slot4, self, upgrade)
	elseif upgrade.category == "feature" then
		slot7 = id

		self._unaquire_feature(slot4, self, upgrade)
	elseif upgrade.category == "equipment" then
		slot7 = id

		self._unaquire_equipment(slot4, self, upgrade)
	elseif upgrade.category == "equipment_upgrade" then
		slot7 = id

		self._unaquire_equipment_upgrade(slot4, self, upgrade)
	elseif upgrade.category == "temporary" then
		slot7 = id

		self._unaquire_temporary(slot4, self, upgrade)
	elseif upgrade.category == "cooldown" then
		slot7 = id

		self._unaquire_cooldown(slot4, self, upgrade)
	elseif upgrade.category == "team" then
		slot7 = id

		self._unaquire_team(slot4, self, upgrade)
	elseif upgrade.category == "armor" then
		slot7 = id

		self._unaquire_armor(slot4, self, upgrade)
	elseif upgrade.category == "melee_weapon" then
		slot7 = id

		self._unaquire_melee_weapon(slot4, self, upgrade)
	elseif upgrade.category == "grenade" then
		slot7 = id

		self._unaquire_grenade(slot4, self, upgrade)
	end

	return 
end
function UpgradesManager:_aquire_weapon(upgrade, id, loading)
	slot8 = id

	managers.player.aquire_weapon(slot5, managers.player, upgrade)

	slot9 = loading

	managers.blackmarket.on_aquired_weapon_platform(slot5, managers.blackmarket, upgrade, id)

	return 
end
function UpgradesManager:_unaquire_weapon(upgrade, id)
	slot7 = id

	managers.player.unaquire_weapon(slot4, managers.player, upgrade)

	slot7 = id

	managers.blackmarket.on_unaquired_weapon_platform(slot4, managers.blackmarket, upgrade)

	return 
end
function UpgradesManager:_aquire_melee_weapon(upgrade, id, loading)
	slot8 = id

	managers.player.aquire_melee_weapon(slot5, managers.player, upgrade)

	slot9 = loading

	managers.blackmarket.on_aquired_melee_weapon(slot5, managers.blackmarket, upgrade, id)

	return 
end
function UpgradesManager:_unaquire_melee_weapon(upgrade, id)
	slot7 = id

	managers.player.unaquire_melee_weapon(slot4, managers.player, upgrade)

	slot7 = id

	managers.blackmarket.on_unaquired_melee_weapon(slot4, managers.blackmarket, upgrade)

	return 
end
function UpgradesManager:_aquire_grenade(upgrade, id, loading)
	slot8 = id

	managers.player.aquire_grenade(slot5, managers.player, upgrade)

	slot9 = loading

	managers.blackmarket.on_aquired_grenade(slot5, managers.blackmarket, upgrade, id)

	return 
end
function UpgradesManager:_unaquire_grenade(upgrade, id)
	slot7 = id

	managers.player.unaquire_grenade(slot4, managers.player, upgrade)

	slot7 = id

	managers.blackmarket.on_unaquired_grenade(slot4, managers.blackmarket, upgrade)

	return 
end
function UpgradesManager:_aquire_feature(feature)
	if feature.incremental then
		slot5 = feature.upgrade

		managers.player.aquire_incremental_upgrade(slot3, managers.player)
	else
		slot5 = feature.upgrade

		managers.player.aquire_upgrade(slot3, managers.player)
	end

	return 
end
function UpgradesManager:_unaquire_feature(feature)
	if feature.incremental then
		slot5 = feature.upgrade

		managers.player.unaquire_incremental_upgrade(slot3, managers.player)
	else
		slot5 = feature.upgrade

		managers.player.unaquire_upgrade(slot3, managers.player)
	end

	return 
end
function UpgradesManager:_aquire_equipment(equipment, id, loading)
	slot9 = loading

	managers.player.aquire_equipment(slot5, managers.player, equipment, id)

	return 
end
function UpgradesManager:_unaquire_equipment(equipment, id)
	slot7 = id

	managers.player.unaquire_equipment(slot4, managers.player, equipment)

	return 
end
function UpgradesManager:_aquire_equipment_upgrade(equipment_upgrade)
	if equipment_upgrade.incremental then
		slot5 = equipment_upgrade.upgrade

		managers.player.aquire_incremental_upgrade(slot3, managers.player)
	else
		slot5 = equipment_upgrade.upgrade

		managers.player.aquire_upgrade(slot3, managers.player)
	end

	return 
end
function UpgradesManager:_unaquire_equipment_upgrade(equipment_upgrade)
	if equipment_upgrade.incremental then
		slot5 = equipment_upgrade.upgrade

		managers.player.unaquire_incremental_upgrade(slot3, managers.player)
	else
		slot5 = equipment_upgrade.upgrade

		managers.player.unaquire_upgrade(slot3, managers.player)
	end

	return 
end
function UpgradesManager:_aquire_temporary(temporary, id)
	if temporary.incremental then
		slot6 = temporary.upgrade

		managers.player.aquire_incremental_upgrade(slot4, managers.player)
	else
		slot7 = id

		managers.player.aquire_upgrade(slot4, managers.player, temporary.upgrade)
	end

	return 
end
function UpgradesManager:_unaquire_temporary(temporary, id)
	if temporary.incremental then
		slot6 = temporary.upgrade

		managers.player.unaquire_incremental_upgrade(slot4, managers.player)
	else
		slot6 = temporary.upgrade

		managers.player.unaquire_upgrade(slot4, managers.player)
	end

	return 
end
function UpgradesManager:_aquire_cooldown(cooldown, id)
	slot7 = id

	managers.player.aquire_cooldown_upgrade(slot4, managers.player, cooldown.upgrade)

	return 
end
function UpgradesManager:_unaquire_cooldown(cooldown, id)
	slot6 = cooldown.upgrade

	managers.player.unaquire_cooldown_upgrade(slot4, managers.player)

	return 
end
function UpgradesManager:_aquire_team(team, id)
	slot7 = id

	managers.player.aquire_team_upgrade(slot4, managers.player, team.upgrade)

	return 
end
function UpgradesManager:_unaquire_team(upgrade, id)
	slot7 = id

	managers.player.unaquire_team_upgrade(slot4, managers.player, upgrade)

	return 
end
function UpgradesManager:_aquire_armor(upgrade, id, loading)
	slot9 = loading

	managers.blackmarket.on_aquired_armor(slot5, managers.blackmarket, upgrade, id)

	return 
end
function UpgradesManager:_unaquire_armor(upgrade, id)
	slot7 = id

	managers.blackmarket.on_unaquired_armor(slot4, managers.blackmarket, upgrade)

	return 
end
function UpgradesManager:_aquire_rep_upgrade(upgrade, id)
	slot7 = id

	managers.skilltree.rep_upgrade(slot4, managers.skilltree, upgrade)

	return 
end
function UpgradesManager:get_value(upgrade_id, ...)
	local upgrade = tweak_data.upgrades.definitions[upgrade_id]

	if not upgrade then
		slot7 = upgrade_id

		Application.error(slot4, Application, "[UpgradesManager:get_value] Missing Upgrade ID: ")
	end

	local u = upgrade.upgrade

	if upgrade.category == "feature" then
		return tweak_data.upgrades.values[u.category][u.upgrade][u.value]
	elseif upgrade.category == "equipment" then
		return upgrade.equipment_id
	elseif upgrade.category == "equipment_upgrade" then
		return tweak_data.upgrades.values[u.category][u.upgrade][u.value]
	elseif upgrade.category == "temporary" then
		local temporary = tweak_data.upgrades.values[u.category][u.upgrade][u.value]
		slot8 = temporary[1]

		return "Value: " .. tostring(slot7) .. " Time: " .. temporary[2]
	elseif upgrade.category == "cooldown" then
		local cooldown = tweak_data.upgrades.values[u.category][u.upgrade][u.value]
		slot8 = cooldown[1]

		return "Value: " .. tostring(slot7) .. " Time: " .. cooldown[2]
	elseif upgrade.category == "team" then
		local value = tweak_data.upgrades.values.team[u.category][u.upgrade][u.value]

		return value
	elseif upgrade.category == "weapon" then
		local default_weapons = {
			BlackMarketManager.DEFAULT_SECONDARY_WEAPON_ID,
			BlackMarketManager.DEFAULT_PRIMARY_WEAPON_ID
		}
		local weapon_id = upgrade.weapon_id
		slot9 = weapon_id
		local is_default_weapon = (table.contains(slot7, default_weapons) and true) or false
		local weapon_level = 0
		local new_weapon_id = (tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].parent_weapon_id) or weapon_id
		slot11 = tweak_data.upgrades.level_tree

		for level, data in pairs(slot10) do
			local upgrades = data.upgrades

			if upgrades then
				slot18 = new_weapon_id

				if table.contains(slot16, upgrades) then
					weapon_level = level

					break
				end
			end
		end

		return is_default_weapon, weapon_level, weapon_id ~= new_weapon_id
	else

		-- Decompilation error in this vicinity:
		local params = {
			...
		}
		slot8 = "melee_weapon"
		local default_id = managers.blackmarket.get_category_default(slot6, managers.blackmarket) or "weapon"
		local melee_weapon_id = upgrade_id
		local is_default_weapon = melee_weapon_id == default_id
		local melee_weapon_level = 0
		slot11 = tweak_data.upgrades.level_tree

		for level, data in pairs(slot10) do
			local upgrades = data.upgrades

			if upgrades then
				slot18 = melee_weapon_id

				if table.contains(slot16, upgrades) then
					melee_weapon_level = level

					break
				end
			end
		end

		return is_default_weapon, melee_weapon_level

		local params = {
			...
		}
		slot8 = "grenade"
		local default_id = managers.blackmarket.get_category_default(slot6, managers.blackmarket) or "weapon"
		local grenade_id = upgrade_id
		local is_default_weapon = grenade_id == default_id
		local grenade_level = 0
		slot11 = tweak_data.upgrades.level_tree

		for level, data in pairs(slot10) do
			local upgrades = data.upgrades

			if upgrades then
				slot18 = grenade_id

				if table.contains(slot16, upgrades) then
					grenade_level = level

					break
				end
			end
		end

		return is_default_weapon, grenade_level
	end

	slot8 = upgrade.category

	print(slot5, "no value for", upgrade_id)

	return 
end
function UpgradesManager:get_category(upgrade_id)
	local upgrade = tweak_data.upgrades.definitions[upgrade_id]

	return upgrade.category
end
function UpgradesManager:get_upgrade_upgrade(upgrade_id)
	local upgrade = tweak_data.upgrades.definitions[upgrade_id]

	return upgrade.upgrade
end
function UpgradesManager:get_upgrade_locks(upgrade_id)
	local upgrade = tweak_data.upgrades.definitions[upgrade_id]

	return {
		dlc = upgrade.dlc
	}
end
function UpgradesManager:is_upgrade_locked(upgrade_id)
	slot5 = upgrade_id
	local locks = self.get_upgrade_locks(slot3, self)
	slot5 = locks

	for category, id in pairs(self) do
		if category == "dlc" then
			slot11 = id

			if not managers.dlc.is_dlc_unlocked(slot9, managers.dlc) then
				return true
			end
		end
	end

	return false
end
function UpgradesManager:is_locked(step)
	local level = managers.experience.current_level(slot3)
	slot5 = tweak_data.upgrades.itree_caps

	for i, d in ipairs(managers.experience) do
		if level < d.level then
			return d.step <= step
		end
	end

	return false
end
function UpgradesManager:get_level_from_step(step)
	slot4 = tweak_data.upgrades.itree_caps

	for i, d in ipairs(slot3) do
		if step == d.step then
			return d.level
		end
	end

	return 0
end
function UpgradesManager:progress()
	slot4 = "preorder"

	if managers.dlc.is_dlc_unlocked(slot2, managers.dlc) then
		return {
			self._global.progress[1],
			self._global.progress[2],
			self._global.progress[3],
			self._global.progress[4]
		}
	end

	return {
		self._global.progress[1],
		self._global.progress[2],
		self._global.progress[3]
	}
end
function UpgradesManager:progress_by_tree(tree)
	return self._global.progress[tree]
end
function UpgradesManager:name(id)
	if not tweak_data.upgrades.definitions[id] then
		slot5 = "Tried to get name from an upgrade that doesn't exist: " .. id .. ""

		Application.error(slot3, Application)

		return 
	end

	local upgrade = tweak_data.upgrades.definitions[id]
	slot6 = upgrade.name_id

	return managers.localization.text(slot4, managers.localization)
end
function UpgradesManager:title(id)

	-- Decompilation error in this vicinity:
	if not tweak_data.upgrades.definitions[id] then
		slot5 = "Tried to get title from an upgrade that doesn't exist: " .. id .. ""

		Application.error(slot3, Application)

		return 
	end

	local upgrade = tweak_data.upgrades.definitions[id]
end
function UpgradesManager:subtitle(id)

	-- Decompilation error in this vicinity:
	if not tweak_data.upgrades.definitions[id] then
		slot5 = "Tried to get subtitle from an upgrade that doesn't exist: " .. id .. ""

		Application.error(slot3, Application)

		return 
	end

	local upgrade = tweak_data.upgrades.definitions[id]
end
function UpgradesManager:complete_title(id, type)
	slot6 = id
	local title = self.title(slot4, self)

	if not title then
		return nil
	end

	slot7 = id
	local subtitle = self.subtitle(slot5, self)

	if not subtitle then
		return title
	end

	if type then
		if type == "single" then
			return title .. " " .. subtitle
		else
			return title .. type .. subtitle
		end
	end

	return title .. "\n" .. subtitle
end
function UpgradesManager:description(id)
	if not tweak_data.upgrades.definitions[id] then
		slot5 = "Tried to get description from an upgrade that doesn't exist: " .. id .. ""

		Application.error(slot3, Application)

		return 
	end

	local upgrade = tweak_data.upgrades.definitions[id]

	return (upgrade.subtitle_id and slot3(slot4, slot5)) or nil
end
function UpgradesManager:image(id)
	local image = tweak_data.upgrades.definitions[id].image

	if not image then
		return nil, nil
	end

	slot6 = image

	return tweak_data.hud_icons.get_icon_data(slot4, tweak_data.hud_icons)
end
function UpgradesManager:image_slice(id)
	local image_slice = tweak_data.upgrades.definitions[id].image_slice

	if not image_slice then
		return nil, nil
	end

	slot6 = image_slice

	return tweak_data.hud_icons.get_icon_data(slot4, tweak_data.hud_icons)
end
function UpgradesManager:icon(id)
	if not tweak_data.upgrades.definitions[id] then
		slot5 = "Tried to aquire an upgrade that doesn't exist: " .. id .. ""

		Application.error(slot3, Application)

		return 
	end

	return tweak_data.upgrades.definitions[id].icon
end
function UpgradesManager:aquired_by_category(category)
	local t = {}
	slot5 = self._global.aquired

	for name, _ in pairs(slot4) do
		if tweak_data.upgrades.definitions[name].category == category then
			slot11 = name

			if self.aquired(slot9, self) then
				slot11 = name

				table.insert(slot9, t)
			end
		end
	end

	return t
end
function UpgradesManager:aquired_features()
	slot4 = "feature"

	return self.aquired_by_category(slot2, self)
end
function UpgradesManager:aquired_weapons()
	slot4 = "weapon"

	return self.aquired_by_category(slot2, self)
end
function UpgradesManager:list_level_rewards(dlcs)
	local t = {}
	local tree_data = tweak_data.upgrades.level_tree
	local def = nil
	slot7 = tree_data

	for level, data in pairs(slot6) do
		if data.upgrades then
			slot12 = data.upgrades

			for _, upgrade in ipairs(slot11) do
				def = tweak_data.upgrades.definitions[upgrade]

				if def and (not dlcs or def.dlc) then
				end
			end
		end
	end

	return t
end
function UpgradesManager:all_weapon_upgrades()
	slot3 = tweak_data.upgrades.definitions

	for id, data in pairs(slot2) do
		if data.category == "weapon" then
			slot8 = id

			print(slot7)
		end
	end

	return 
end
function UpgradesManager:weapon_upgrade_by_weapon_id(weapon_id)
	slot4 = tweak_data.upgrades.definitions

	for id, data in pairs(slot3) do
		if data.category == "weapon" and data.weapon_id == weapon_id then
			return data
		end
	end

	return 
end
function UpgradesManager:weapon_upgrade_by_factory_id(factory_id)
	slot4 = tweak_data.upgrades.definitions

	for id, data in pairs(slot3) do
		if data.category == "weapon" and data.factory_id == factory_id then
			return data
		end
	end

	return 
end
function UpgradesManager:print_aquired_tree()
	local tree = {}
	slot4 = self._global.aquired

	for name, data in pairs(slot3) do
		tree[data.level] = {
			name = name
		}
	end

	slot4 = tree

	for i, data in pairs(slot3) do
		slot12 = data.name

		print(self.name(slot10, self))
	end

	return 
end
function UpgradesManager:analyze()
	local not_placed = {}
	local placed = {}
	local features = {}
	local amount = 0
	slot7 = tweak_data.upgrades.levels

	for lvl, upgrades in pairs(slot6) do
		slot12 = "Upgrades at level " .. lvl .. ":"

		print(slot11)

		slot12 = upgrades

		for _, upgrade in ipairs(slot11) do
			slot17 = "\t" .. upgrade

			print(slot16)
		end
	end

	slot7 = tweak_data.upgrades.definitions

	for name, data in pairs(slot6) do
		amount = amount + 1
		slot12 = tweak_data.upgrades.levels

		for lvl, upgrades in pairs(slot11) do
			slot17 = upgrades

			for _, upgrade in ipairs(slot16) do
				if upgrade == name then
					if placed[name] then
						slot22 = "ERROR: Upgrade " .. name .. " is already placed in level " .. placed[name] .. "!"

						print(slot21)
					else
						placed[name] = lvl
					end

					if data.category == "feature" then
						features[data.upgrade.category] = features[data.upgrade.category] or {}
						slot23 = {
							level = lvl,
							name = name
						}

						table.insert(features[data.upgrade.category] or , features[data.upgrade.category])
					end
				end
			end
		end

		if not placed[name] then
			not_placed[name] = true
		end
	end

	slot7 = placed

	for name, lvl in pairs(slot6) do
		slot12 = "Upgrade " .. name .. " is placed in level\t\t " .. lvl .. "."

		print(slot11)
	end

	slot7 = not_placed

	for name, _ in pairs(slot6) do
		slot12 = "Upgrade " .. name .. " is not placed any level!"

		print(slot11)
	end

	slot7 = ""

	print(slot6)

	slot7 = features

	for category, upgrades in pairs(slot6) do
		slot12 = "Upgrades for category " .. category .. " is recieved at:"

		print(slot11)

		slot12 = upgrades

		for _, upgrade in ipairs(slot11) do
			slot17 = "  Level: " .. upgrade.level .. ", " .. upgrade.name .. ""

			print(slot16)
		end
	end

	slot7 = "\nTotal upgrades " .. amount .. "."

	print(slot6)

	return 
end
function UpgradesManager:tree_stats()
	local t = {
		{
			a = 0,
			u = {}
		},
		{
			a = 0,
			u = {}
		},
		{
			a = 0,
			u = {}
		}
	}
	slot4 = tweak_data.upgrades.definitions

	for name, d in pairs() do
		if d.tree then
			t[d.tree].a = t[d.tree].a + 1
			slot10 = name

			table.insert(t[d.tree].a + 1, t[d.tree].u)
		end
	end

	slot4 = t

	for i, d in ipairs(slot3) do
		slot11 = d.u

		print(inspect(slot10))

		slot9 = d.a

		print(slot8)
	end

	return 
end
function UpgradesManager:save(data)
	local state = {
		automanage = self._global.automanage,
		progress = self._global.progress,
		target_tree = self._global.target_tree,
		disabled_visual_upgrades = self._global.disabled_visual_upgrades
	}

	if self._global.incompatible_data_loaded and self._global.incompatible_data_loaded.progress then
		slot5 = self._global.progress
		state.progress = clone(slot4)
		slot5 = self._global.incompatible_data_loaded.progress

		for i, k in pairs(slot4) do
			slot12 = k

			print(slot9, "saving incompatible data", i)

			slot12 = k
			state.progress[i] = math.max("saving incompatible data", state.progress[i])
		end
	end

	data.UpgradesManager = state

	return 
end
function UpgradesManager:load(data)
	slot4 = self

	self.reset(slot3)

	local state = data.UpgradesManager
	self._global.automanage = state.automanage
	self._global.progress = state.progress
	self._global.target_tree = state.target_tree
	self._global.disabled_visual_upgrades = state.disabled_visual_upgrades
	slot5 = self

	self._verify_loaded_data(state.disabled_visual_upgrades)

	return 
end
function UpgradesManager:_verify_loaded_data()
	return 
end
function UpgradesManager:reset()
	Global.upgrades_manager = nil
	slot3 = self

	self._setup(nil)

	return 
end

return 
