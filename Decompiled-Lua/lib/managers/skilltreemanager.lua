SkillTreeManager = SkillTreeManager or class()
SkillTreeManager.VERSION = 21
function SkillTreeManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function SkillTreeManager:_setup(reset)
	if not Global.skilltree_manager or reset then
		Global.skilltree_manager = {
			VERSION = SkillTreeManager.VERSION,
			reset_message = false
		}
		self._global = Global.skilltree_manager
	end

	self._global = Global.skilltree_manager

	return 
end
function SkillTreeManager:get_character_profile_class()
	if self._global.character_profile_subclass then
		return self._global.character_profile_subclass
	end

	return self._global.character_profile_base_class
end
function SkillTreeManager:get_character_profile_class_data()
	if self._global.character_profile_subclass then
		return tweak_data.skilltree.classes[self._global.character_profile_base_class].subclasses[self._global.character_profile_subclass]
	end

	return tweak_data.skilltree.classes[self._global.character_profile_base_class]
end
function SkillTreeManager:get_character_skilltree()
	local skill_tree = nil

	if self._global.character_profile_subclass then
		skill_tree = self._global.subclass_skill_tree
	else
		skill_tree = self._global.base_class_skill_tree
	end

	return skill_tree
end
function SkillTreeManager:get_character_automatic_unlock_progression(class)
	if not class then
		slot4 = self
		class = self.get_character_profile_class(slot3)
	end

	local automatic_unlock_progression = tweak_data.skilltree.automatic_unlock_progressions[class]

	return automatic_unlock_progression
end
function SkillTreeManager:calculate_stats(character_class, applied_skills, pending_skills)
	local applied_skills_filtered = {}

	if applied_skills then
		slot7 = applied_skills

		for index, skill in pairs(slot6) do
			local skill_tweak_data = tweak_data.skilltree.skills[skill]

			if skill_tweak_data and skill_tweak_data.upgrades and skill_tweak_data.upgrades[1] then
				slot13 = skill_tweak_data.upgrades

				for upgrade_index, upgrade in pairs(slot12) do
					local upgrade_definition = tweak_data.upgrades.definitions[upgrade]

					if upgrade_definition and (not applied_skills_filtered[upgrade_definition.upgrade.upgrade] or applied_skills_filtered[upgrade_definition.upgrade.upgrade] < upgrade_definition.upgrade.value) then
						applied_skills_filtered[upgrade_definition.upgrade.upgrade] = upgrade_definition.upgrade.value
					end
				end
			end
		end
	end

	local pending_skills_filtered = {}

	if pending_skills then
		slot8 = pending_skills

		for index, skill in pairs(slot7) do
			local skill_tweak_data = tweak_data.skilltree.skills[skill]

			if skill_tweak_data and skill_tweak_data.upgrades and skill_tweak_data.upgrades[1] then
				slot14 = skill_tweak_data.upgrades

				for upgrade_index, upgrade in pairs(slot13) do
					local upgrade_definition = tweak_data.upgrades.definitions[upgrade]

					if upgrade_definition and not pending_skills_filtered[upgrade_definition.upgrade.upgrade] then
						pending_skills_filtered[upgrade_definition.upgrade.upgrade] = 1 + (applied_skills_filtered[upgrade_definition.upgrade.upgrade] or 0)
					elseif upgrade_definition and pending_skills_filtered[upgrade_definition.upgrade.upgrade] then
						pending_skills_filtered[upgrade_definition.upgrade.upgrade] = pending_skills_filtered[upgrade_definition.upgrade.upgrade] + 1
					end
				end
			end
		end
	end

	slot11 = pending_skills_filtered
	local health_base, health_pending = self._calculate_health_stat(slot7, self, character_class, applied_skills_filtered)
	slot13 = pending_skills_filtered
	local speed_base, speed_pending = self._calculate_speed_stat(character_class, self, character_class, applied_skills_filtered)
	slot15 = pending_skills_filtered
	local stamina_base, stamina_pending = self._calculate_stamina_stat(character_class, self, character_class, applied_skills_filtered)
	local stats = {
		health = {
			base = health_base,
			pending = health_pending
		},
		speed = {
			base = speed_base,
			pending = speed_pending
		},
		stamina = {
			base = stamina_base,
			pending = stamina_pending
		}
	}

	return stats
end
function SkillTreeManager:_calculate_health_stat(character_class, applied_skills, pending_skills)
	local class_tweak_data = tweak_data.player.get_tweak_data_for_class(slot5, tweak_data.player)
	local health_stat_base_rating = class_tweak_data.damage.BASE_HEALTH
	slot8 = managers.player
	local max_health_multiplier = managers.player.health_skill_multiplier(character_class) - 1
	local health_base_rating_multiplier = 1 + max_health_multiplier
	local max_health_pending_multiplier = 0

	if pending_skills.max_health_multiplier then
		max_health_pending_multiplier = tweak_data.upgrades.values.player.max_health_multiplier[pending_skills.max_health_multiplier] - 1 - max_health_multiplier
	end

	local health_pending_multiplier = max_health_pending_multiplier

	return health_stat_base_rating * health_base_rating_multiplier, health_stat_base_rating * health_pending_multiplier
end
function SkillTreeManager:_calculate_speed_stat(character_class, applied_skills, pending_skills)
	slot7 = character_class
	local class_tweak_data = tweak_data.player.get_tweak_data_for_class(slot5, tweak_data.player)
	local base_speed_total = 0
	local number_of_speed_values = 0
	slot9 = class_tweak_data.movement.speed

	for index, value in pairs(slot8) do
		base_speed_total = base_speed_total + value
		number_of_speed_values = number_of_speed_values + 1
	end

	local base_speed_average = 0

	if 0 < number_of_speed_values then
		base_speed_average = base_speed_total / number_of_speed_values
	end

	local speed_stat_base_rating = base_speed_average / 5
	local general_movement_speed_increase_multiplier = 0

	if applied_skills.all_movement_speed_increase then
		general_movement_speed_increase_multiplier = tweak_data.upgrades.values.player.all_movement_speed_increase[applied_skills.all_movement_speed_increase] - 1
	end

	local speed_base_rating_multiplier = 1 + general_movement_speed_increase_multiplier
	local general_movement_speed_pending_multiplier = 0

	if pending_skills.all_movement_speed_increase then
		general_movement_speed_pending_multiplier = tweak_data.upgrades.values.player.all_movement_speed_increase[pending_skills.all_movement_speed_increase] - 1 - general_movement_speed_increase_multiplier
	end

	local speed_pending_multiplier = general_movement_speed_pending_multiplier

	return speed_stat_base_rating * speed_base_rating_multiplier, speed_stat_base_rating * speed_pending_multiplier
end
function SkillTreeManager:_calculate_stamina_stat(character_class, applied_skills, pending_skills)
	local class_tweak_data = tweak_data.player.get_tweak_data_for_class(slot5, tweak_data.player)
	local base_stamina_rating = 0
	slot8 = class_tweak_data.movement.stamina

	for index, value in pairs(character_class) do
		base_stamina_rating = base_stamina_rating + value
	end

	base_stamina_rating = base_stamina_rating * 2
	local stamina_reserve_multiplier = 0

	if applied_skills.stamina_multiplier then
		stamina_reserve_multiplier = tweak_data.upgrades.values.player.stamina_multiplier[applied_skills.stamina_multiplier] - 1
	end

	local stamina_base_rating_multiplier = 1 + stamina_reserve_multiplier
	local stamina_reserve_pending_multiplier = 0

	if pending_skills.stamina_multiplier then
		stamina_reserve_pending_multiplier = tweak_data.upgrades.values.player.stamina_multiplier[pending_skills.stamina_multiplier] - 1 - stamina_reserve_multiplier
	end

	local stamina_pending_multiplier = stamina_reserve_pending_multiplier

	return base_stamina_rating * stamina_base_rating_multiplier, base_stamina_rating * stamina_pending_multiplier
end
function SkillTreeManager:respec()
	slot3 = managers.skilltree
	local skill_tree = managers.skilltree.get_character_skilltree(slot2)
	local temp = {}
	slot5 = skill_tree

	for record_key, skill_tree_record in ipairs(slot4) do
		slot10 = skill_tree_record

		for skill_key, skill in pairs(slot9) do
			slot15 = skill

			if type(slot14) == "table" and skill.active then
				local skill_data = tweak_data.skilltree.skills[skill.skill_name]
				slot17 = {
					record_key = record_key,
					skill_key = skill_key
				}

				table.insert(slot15, temp)

				if skill_data.acquires[1] and skill_data.acquires[1].warcry_level then
					slot18 = -skill_data.acquires[1].warcry_level

					managers.warcry.increase_warcry_level(slot15, managers.warcry, nil)
				end

				slot16 = skill_data.upgrades

				for _, upgrade in ipairs(slot15) do
					slot23 = UpgradesManager.AQUIRE_STRINGS[2]

					managers.upgrades.unaquire(slot20, managers.upgrades, upgrade)
				end
			end
		end
	end

	slot7 = true

	self.set_character_profile_base_class(slot4, self, managers.skilltree._global.character_profile_base_class)

	slot5 = self

	self.on_respec_tree(slot4)

	return 
end
function SkillTreeManager:set_character_profile_base_class(character_profile_base_class, skip_aquire)
	local skill_tree = tweak_data.skilltree.skill_trees[character_profile_base_class]

	self.reset_skills(slot5)

	self._global.character_profile_base_class = character_profile_base_class
	slot7 = tweak_data.skilltree.skill_trees[character_profile_base_class]
	self._global.base_class_skill_tree = deep_clone(self)
	slot7 = tweak_data.skilltree.automatic_unlock_progressions[character_profile_base_class]
	self._global.base_class_automatic_unlock_progression = deep_clone(self)
	slot6 = self._global.base_class_skill_tree

	for level, skills in ipairs(deep_clone(self)) do
		skills.level_required = level
	end

	slot9 = not skip_aquire

	self.activate_skill_by_index(slot5, self, 1, 1)

	slot6 = self

	self._equip_class_default_weapons(slot5)

	if not skip_aquire then
		slot7 = 1

		self.apply_automatic_unlocks_for_level(slot5, self)
	end

	return 
end
function SkillTreeManager:_equip_class_default_weapons()
	slot3 = managers.blackmarket

	managers.blackmarket.equip_class_default_primary(slot2)

	slot3 = managers.blackmarket

	managers.blackmarket.equip_class_default_secondary(slot2)

	return 
end
function SkillTreeManager:set_character_profile_subclass(character_profile_subclass)
	local base_class = tweak_data.skilltree.classes[self._global.character_profile_base_class]
	local subclass = base_class.subclasses[character_profile_subclass]
	local skill_tree = tweak_data.skilltree.skill_trees[character_profile_subclass]
	self._global.character_profile_subclass = character_profile_subclass
	slot8 = tweak_data.skilltree.skill_trees[character_profile_subclass]
	self._global.subclass_skill_tree = deep_clone(slot7)
	slot8 = tweak_data.skilltree.automatic_unlock_progressions[character_profile_subclass]
	self._global.subclass_automatic_unlock_progression = deep_clone(slot7)
	slot7 = self._global.subclass_skill_tree

	for level, skills in ipairs(deep_clone(slot7)) do
		skills.level_required = level + SkillTreeTweakData.STARTING_SUBCLASS_LEVEL
	end

	slot10 = true

	self.activate_skill_by_index(slot6, self, 1, 1)

	return 
end
function SkillTreeManager:reset_skills()
	Global.skilltree_manager = {
		VERSION = SkillTreeManager.VERSION,
		reset_message = false
	}
	self._global = Global.skilltree_manager

	return 
end
function SkillTreeManager:activate_skill_by_index(level, skill_index, apply_acquires)
	slot6 = self
	local skill_tree = self.get_character_skilltree(slot5)
	local level_skills = skill_tree[level]
	local skill_entry = level_skills[skill_index]
	local skill = tweak_data.skilltree.skills[skill_entry.skill_name]
	slot13 = apply_acquires

	self._activate_skill(slot9, self, skill_entry, skill)

	return 
end
function SkillTreeManager:unlock_weapons_for_level(level)
	slot4 = self
	local weapon_progression = self.get_character_automatic_unlock_progression(slot3)

	if weapon_progression and weapon_progression[level] then
		slot5 = weapon_progression[level].weapons

		for index, weapon in ipairs(slot4) do
			local weapon_unlock_skill = tweak_data.skilltree.skills[weapon]
			slot13 = UpgradesManager.AQUIRE_STRINGS[2]

			if not managers.upgrades.aquired(slot10, managers.upgrades, weapon_unlock_skill) then
				slot14 = true

				self._activate_skill(slot10, self, weapon_progression[level], weapon_unlock_skill)
			end
		end
	end

	return 
end
function SkillTreeManager:create_breadcrumbs_for_level(level)
	slot4 = self
	local character_skilltree = self.get_character_skilltree(slot3)

	if not character_skilltree[level] then
		slot5 = "[SkillTreeManager:create_breadcrumbs_for_level] Trying to create breadcrumbs for non-existent character level!"

		debug_pause(slot4)
	end

	slot5 = character_skilltree[level]

	for index, skill in pairs(slot4) do
		slot10 = skill

		if type(slot9) == "table" and skill.skill_name then
			slot12 = {
				skill.skill_name
			}

			managers.breadcrumb.add_breadcrumb(slot9, managers.breadcrumb, BreadcrumbManager.CATEGORY_RANK_REWARD)
		end
	end

	return 
end
function SkillTreeManager:apply_automatic_unlocks_for_levels_up_to(level, category_to_apply)
	for i = 1, level, 1 do
		slot11 = category_to_apply

		self.apply_automatic_unlocks_for_level(slot8, self, i)
	end

	return 
end
function SkillTreeManager:apply_automatic_unlocks_for_all_levels(category_to_apply)
	slot4 = managers.experience
	local level_cap = managers.experience.level_cap(slot3)

	for i = 1, level_cap, 1 do
		slot11 = category_to_apply

		self.apply_automatic_unlocks_for_level(slot8, self, i)
	end

	return 
end
function SkillTreeManager:apply_automatic_unlocks_for_level(level, category_to_apply)
	local character_unlock_progression = self.get_character_automatic_unlock_progression(slot4)
	slot6 = self
	local character_skilltree = self.get_character_skilltree(self)

	if character_unlock_progression and character_unlock_progression[level] then
		slot7 = character_unlock_progression[level]

		for category_index, category in pairs(slot6) do
			if category_index ~= "active" and ((category_to_apply and category_index == category_to_apply) or not category_to_apply) then
				slot12 = character_unlock_progression[level][category_index]

				for index, unlock in ipairs(slot11) do
					local unlock_skill = tweak_data.skilltree.skills[unlock]
					slot20 = UpgradesManager.AQUIRE_STRINGS[2]

					if not managers.upgrades.aquired(slot17, managers.upgrades, unlock_skill) then
						slot21 = true

						self._activate_skill(slot17, self, nil, unlock_skill)
					end
				end
			end

			if category_index == "weapons" then
				slot12 = character_unlock_progression[level][category_index]

				for index, unlock in ipairs(slot11) do
					local unlock_weapon = tweak_data.skilltree.skills[unlock].upgrades[1]
					local breadcrumb_category = (tweak_data.weapon[unlock_weapon].use_data.selection_index == 2 and BreadcrumbManager.CATEGORY_WEAPON_PRIMARY) or BreadcrumbManager.CATEGORY_WEAPON_SECONDARY
					slot21 = {
						unlock_weapon
					}

					managers.breadcrumb.add_breadcrumb(slot18, managers.breadcrumb, breadcrumb_category)
				end
			end
		end
	end

	return 
end
function SkillTreeManager:_activate_skill(skill_entry, skill, apply_acquires)
	if skill_entry then
		skill_entry.active = true
	end

	slot8 = apply_acquires

	self._apply_skill(slot5, self, skill)

	return 
end
function SkillTreeManager:_apply_skill(skill, apply_acquires)
	slot5 = skill.upgrades

	for _, upgrade in ipairs(slot4) do
		slot13 = UpgradesManager.AQUIRE_STRINGS[2]

		managers.upgrades.aquire(slot9, managers.upgrades, upgrade, nil)
	end

	if apply_acquires then
		slot5 = skill.acquires

		for _, acquire in ipairs(slot4) do
			slot11 = acquire

			self._acquire(slot9, self)
		end
	end

	return 
end
function SkillTreeManager:_acquire(acquire)
	if acquire.subclass then
		slot5 = acquire.subclass

		self.set_character_profile_subclass(slot3, self)
	elseif acquire.warcry then
		slot5 = acquire.warcry

		managers.warcry.acquire_warcry(slot3, managers.warcry)
	elseif acquire.warcry_level then
		slot6 = acquire.warcry_level

		managers.warcry.increase_warcry_level(slot3, managers.warcry, nil)
	end

	return 
end
function SkillTreeManager:on_respec_tree()
	slot3 = MenuCallbackHandler

	MenuCallbackHandler._update_outfit_information(slot2)

	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = managers.statistics

		managers.statistics.publish_skills_to_steam(slot2)
	end

	return 
end
function SkillTreeManager:check_reset_message()
	local show_reset_message = (self._global.reset_message and true) or false

	if show_reset_message then
		slot4 = managers.menu

		managers.menu.show_skilltree_reseted(slot3)

		self._global.reset_message = false
		slot4 = MenuCallbackHandler

		MenuCallbackHandler.save_progress(false)
	end

	return 
end
function SkillTreeManager:pack_to_string()
	slot3 = managers.skilltree
	local packed_string = managers.skilltree.get_character_profile_class(slot2)

	return packed_string
end
function SkillTreeManager:pack_to_string_from_list(list)
	slot4 = managers.skilltree
	local packed_string = managers.skilltree.get_character_profile_class(slot3)

	return packed_string
end
function SkillTreeManager:unpack_from_string(packed_string)
	return packed_string
end
function SkillTreeManager:save(data)
	local state = {
		version = SkillTreeManager.VERSION,
		character_profile_base_class = self._global.character_profile_base_class,
		base_class_skill_tree = self._global.base_class_skill_tree,
		base_class_automatic_unlock_progression = self._global.base_class_automatic_unlock_progression,
		character_profile_subclass = self._global.character_profile_subclass,
		subclass_skill_tree = self._global.subclass_skill_tree,
		subclass_automatic_unlock_progression = self._global.subclass_automatic_unlock_progression
	}
	data.SkillTreeManager = state

	return 
end
function SkillTreeManager:load(data, version)
	slot5 = self

	self.reset_skills(slot4)

	local state = data.SkillTreeManager

	if not state then
		return 
	end

	if state.version and state.version < SkillTreeManager.VERSION then
		slot11 = ". Resetting the skill tree."

		Application.trace(slot5, Application, "[SkillTreeManager:load] Saved skilltree version: ", state.version, ", current version: ", SkillTreeManager.VERSION)

		slot7 = state.character_profile_base_class or SkillTreeTweakData.CLASS_RECON

		self.set_character_profile_base_class(slot5, self)

		slot6 = self
		slot9 = managers.experience

		self.apply_automatic_unlocks_for_levels_up_to(slot5, managers.experience.current_level(slot8))

		slot6 = managers.savefile

		managers.savefile.set_resave_required(slot5)

		return 
	end

	self._global.character_profile_base_class = state.character_profile_base_class or SkillTreeTweakData.CLASS_RECON
	slot4 = self._global

	if not state.base_class_skill_tree then
		slot7 = tweak_data.skilltree.skill_trees[self._global.character_profile_base_class]
		slot5 = deep_clone(slot6)
	end

	slot4.base_class_skill_tree = slot5
	slot4 = self._global

	if not state.base_class_automatic_unlock_progression then
		slot7 = tweak_data.skilltree.automatic_unlock_progressions[self._global.character_profile_base_class]
		slot5 = deep_clone(slot6)
	end

	slot4.base_class_automatic_unlock_progression = slot5
	self._global.character_profile_subclass = state.character_profile_subclass
	self._global.subclass_skill_tree = state.subclass_skill_tree
	self._global.subclass_automatic_unlock_progression = state.subclass_automatic_unlock_progression

	if state.base_class_skill_tree then
		slot7 = state.base_class_skill_tree

		self._activate_skill_tree(slot5, self)
	end

	if state.subclass_skill_tree then
		slot7 = state.subclass_skill_tree

		self._activate_skill_tree(slot5, self)
	end

	slot6 = self
	slot9 = managers.experience

	self.apply_automatic_unlocks_for_levels_up_to(slot5, managers.experience.current_level(slot8))

	slot7 = WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME

	managers.blackmarket._verfify_equipped_category(slot5, managers.blackmarket)

	slot7 = WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME

	managers.blackmarket._verfify_equipped_category(slot5, managers.blackmarket)

	return 
end
function SkillTreeManager:_activate_skill_tree(skill_tree)
	slot4 = skill_tree

	for level, skills in ipairs(slot3) do
		slot9 = skills

		for index, skill_entry in ipairs(slot8) do
			if skill_entry.active then
				local skill = tweak_data.skilltree.skills[skill_entry.skill_name]
				slot18 = false

				self._activate_skill(slot14, self, skill_entry, skill)
			end
		end
	end

	return 
end
function SkillTreeManager:_verify_loaded_data(points_aquired_during_load)
	return 
end
function SkillTreeManager:digest_value(value, digest, default)
	slot6 = value

	if type(slot5) == "boolean" then
		return default or 0
	end

	if digest then
		slot6 = value

		if type(slot5) == "string" then
			return value
		else
			slot8 = true

			return Application.digest_value(slot5, Application, value)
		end
	else
		slot6 = value

		if type(slot5) == "number" then
			return value
		else
			slot8 = false

			return Application.digest_value(slot5, Application, value)
		end
	end

	slot8 = digest

	return Application.digest_value(slot5, Application, value)
end
function SkillTreeManager:debug()
	return 
end
function SkillTreeManager:reset()
	Global.skilltree_manager = nil
	slot3 = self

	self._setup(nil)

	slot4 = "WIN32"

	if SystemInfo.platform(nil) == Idstring(SystemInfo) then
		slot3 = managers.statistics

		managers.statistics.publish_skills_to_steam(slot2)
	end

	return 
end

return 
