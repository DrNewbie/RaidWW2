BreadcrumbManager = BreadcrumbManager or class()
BreadcrumbManager.VERSION = 1
BreadcrumbManager.SLOT_CHARACTER = "character"
BreadcrumbManager.SLOT_PROFILE = "profile"
BreadcrumbManager.CATEGORY_NEW_RAID = {
	identifier = "new_raid",
	slot = BreadcrumbManager.SLOT_PROFILE
}
BreadcrumbManager.CATEGORY_CONSUMABLE_MISSION = {
	identifier = "consumable_mission",
	slot = BreadcrumbManager.SLOT_PROFILE
}
BreadcrumbManager.CATEGORY_OPERATIONS = {
	identifier = "operations",
	slot = BreadcrumbManager.SLOT_PROFILE
}
BreadcrumbManager.CATEGORY_MISSIONS = {
	subcategories = {
		BreadcrumbManager.CATEGORY_NEW_RAID,
		BreadcrumbManager.CATEGORY_CONSUMABLE_MISSION,
		BreadcrumbManager.CATEGORY_OPERATIONS
	}
}
BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION_UPPER = {
	slot = BreadcrumbManager.SLOT_PROFILE,
	identifier = CharacterCustomizationTweakData.PART_TYPE_UPPER
}
BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION_LOWER = {
	slot = BreadcrumbManager.SLOT_PROFILE,
	identifier = CharacterCustomizationTweakData.PART_TYPE_LOWER
}
BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION = {
	subcategories = {
		BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION_UPPER,
		BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION_LOWER
	}
}
BreadcrumbManager.CATEGORY_WEAPON_PRIMARY = {
	identifier = "weapon_primary",
	slot = BreadcrumbManager.SLOT_CHARACTER
}
BreadcrumbManager.CATEGORY_WEAPON_SECONDARY = {
	identifier = "weapon_secondary",
	slot = BreadcrumbManager.SLOT_CHARACTER
}
BreadcrumbManager.CATEGORY_WEAPON_MELEE = {
	identifier = "weapon_melee",
	slot = BreadcrumbManager.SLOT_CHARACTER
}
BreadcrumbManager.CATEGORY_WEAPON_UPGRADE = {
	identifier = "weapon_upgrade",
	slot = BreadcrumbManager.SLOT_PROFILE
}
BreadcrumbManager.CATEGORY_WEAPON = {
	subcategories = {
		BreadcrumbManager.CATEGORY_WEAPON_PRIMARY,
		BreadcrumbManager.CATEGORY_WEAPON_SECONDARY,
		BreadcrumbManager.CATEGORY_WEAPON_MELEE
	}
}
BreadcrumbManager.CATEGORY_CAMP_CUSTOMIZATION = {
	identifier = "camp_customization",
	slot = BreadcrumbManager.SLOT_PROFILE
}
BreadcrumbManager.CATEGORY_RANK_REWARD = {
	identifier = "rank_reward",
	slot = BreadcrumbManager.SLOT_CHARACTER
}
BreadcrumbManager.CATEGORY_CHALLENGE_CARD_RAID = {
	identifier = "challenge_card_raid",
	slot = BreadcrumbManager.SLOT_PROFILE
}
BreadcrumbManager.CATEGORY_CHALLENGE_CARD_OPERATION = {
	identifier = "challenge_card_operation",
	slot = BreadcrumbManager.SLOT_PROFILE
}
BreadcrumbManager.CATEGORY_CARD = {
	subcategories = {
		BreadcrumbManager.CATEGORY_CHALLENGE_CARD_RAID,
		BreadcrumbManager.CATEGORY_CHALLENGE_CARD_OPERATION
	}
}
BreadcrumbManager.get_instance = function ()
	if not Global.breadcrumb_manager then
		slot3 = BreadcrumbManager
		Global.breadcrumb_manager = BreadcrumbManager.new(slot2)
	end

	slot3 = BreadcrumbManager

	setmetatable(slot1, Global.breadcrumb_manager)

	return Global.breadcrumb_manager
end
BreadcrumbManager.init = function (self)
	slot3 = self

	self.reset(slot2)

	return 
end
BreadcrumbManager.reset = function (self)
	self._breadcrumbs = {
		[BreadcrumbManager.SLOT_CHARACTER] = {},
		[BreadcrumbManager.SLOT_PROFILE] = {}
	}
	self._unique_breadcrumb_ids = {}

	return 
end
BreadcrumbManager.add_breadcrumb = function (self, category, identifiers)
	if not category or not identifiers then
		return 
	end

	slot7 = identifiers

	if self.category_has_breadcrumbs(slot4, self, category) then
		return 
	end

	if not self._breadcrumbs[category.slot][category.identifier] then
		self._breadcrumbs[category.slot][category.identifier] = {}
	end

	local current_tree_level = self._breadcrumbs[category.slot][category.identifier]

	for i = 1, #identifiers, 1 do
		if i < #identifiers then
			if not current_tree_level[identifiers[i]] then
				current_tree_level[identifiers[i]] = {}
			end

			current_tree_level = current_tree_level[identifiers[i]]
		else
			current_tree_level[identifiers[i]] = identifiers[i]
		end
	end

	return 
end
BreadcrumbManager.remove_breadcrumb = function (self, category, identifiers)
	if not category or not identifiers then
		return 
	end

	if not self._breadcrumbs[category.slot][category.identifier] then
		return 
	end

	local current_tree_level = self._breadcrumbs[category.slot][category.identifier]
	local depth_to_remove = nil

	for i = 1, #identifiers, 1 do
		slot12 = current_tree_level
		local elements_in_current_level = self._count_tree_level_elements(slot10, self)

		if elements_in_current_level < 2 and not depth_to_remove then
			depth_to_remove = i
		elseif 2 <= elements_in_current_level then
			depth_to_remove = nil
		end

		if i < #identifiers then
			if not current_tree_level[identifiers[i]] then
				return 
			end

			current_tree_level = current_tree_level[identifiers[i]]
		else
			current_tree_level[identifiers[i]] = nil
			slot13 = current_tree_level

			if 0 < self._count_tree_level_elements(nil, self) then
				depth_to_remove = nil
			end
		end
	end

	if depth_to_remove then
		current_tree_level = self._breadcrumbs[category.slot]
		local index_to_remove = category.identifier

		for i = 1, depth_to_remove - 1, 1 do
			if i == 1 then
				current_tree_level = current_tree_level[category.identifier]
			else
				current_tree_level = current_tree_level[identifiers[i - 1]]
			end

			index_to_remove = identifiers[i]
		end

		current_tree_level[index_to_remove] = nil
	end

	depth_to_remove = nil
	slot9 = identifiers

	self._notify_breadcrumb_change_listeners(slot6, self, category)

	return 
end
BreadcrumbManager._count_tree_level_elements = function (self, tree_level)
	local count = 0
	slot5 = tree_level

	for i, element in pairs(slot4) do
		count = count + 1
	end

	return count
end
BreadcrumbManager.category_has_breadcrumbs = function (self, category, identifiers)
	if not category then
		return 
	end

	local category_has_breadcrumbs = false

	if category.subcategories then
		slot6 = category.subcategories

		for index, subcategory in pairs(slot5) do
			if not category_has_breadcrumbs then
				slot13 = identifiers
				category_has_breadcrumbs = self.category_has_breadcrumbs(slot10, self, subcategory)
			end
		end
	else
		if self._breadcrumbs[category.slot][category.identifier] then
			slot6 = self._breadcrumbs[category.slot][category.identifier]

			for index, breadcrumb in pairs(slot5) do
				category_has_breadcrumbs = true

				break
			end
		end

		if category_has_breadcrumbs and identifiers then
			local current_tree_level = self._breadcrumbs[category.slot][category.identifier]

			for i = 1, #identifiers, 1 do
				if not current_tree_level[identifiers[i]] then
					category_has_breadcrumbs = false

					break
				end

				current_tree_level = current_tree_level[identifiers[i]]
			end
		end
	end

	return category_has_breadcrumbs or false
end
BreadcrumbManager.get_unique_breadcrumb_id = function (self)
	slot4 = 99999
	local id = math.random(slot2, 1)

	while self._unique_breadcrumb_ids[id] do
		slot5 = 99999
		id = math.random(slot3, 1)
	end

	self._unique_breadcrumb_ids[id] = id

	return id
end
BreadcrumbManager.clear_unique_breadcrumb_id = function (self, id)
	self._unique_breadcrumb_ids[id] = nil

	return 
end
BreadcrumbManager.register_breadcrumb_change_listener = function (self, key, category, identifiers, callback)
	slot9 = identifiers
	local event_id = self._get_event_listener_id(slot6, self, category)
	slot11 = callback

	managers.system_event_listener.add_listener(self, managers.system_event_listener, key, {
		event_id
	})

	return 
end
BreadcrumbManager.unregister_breadcrumb_change_listener = function (self, key)
	slot5 = key

	managers.system_event_listener.remove_listener(slot3, managers.system_event_listener)

	return 
end
BreadcrumbManager._notify_breadcrumb_change_listeners = function (self, category, identifiers)
	slot6 = category
	local event_id = self._get_event_listener_id(slot4, self)
	slot7 = event_id

	managers.system_event_listener.call_listeners(self, managers.system_event_listener)

	for i = 1, #identifiers, 1 do
		local identifier_list = {}

		for j = 1, i, 1 do
			slot16 = identifiers[j]

			table.insert(slot14, identifier_list)
		end

		slot13 = identifier_list
		event_id = self._get_event_listener_id(slot10, self, category)
		slot12 = event_id

		managers.system_event_listener.call_listeners(slot10, managers.system_event_listener)
	end

	return 
end
BreadcrumbManager._get_event_listener_id = function (self, category, identifiers)
	local listener_id = "breadcrumb_"
	slot7 = category.identifier
	listener_id = listener_id .. tostring(slot6)

	if identifiers then
		slot6 = identifiers

		for _, identifier in pairs(slot5) do
			listener_id = listener_id .. "_" .. identifier
		end
	end

	return listener_id
end
BreadcrumbManager.save_character_slot = function (self, data)
	local state = {
		version = self.version,
		slot_breadcrumbs = self._breadcrumbs[BreadcrumbManager.SLOT_CHARACTER]
	}
	data.BreadcrumbManager = state

	return 
end
BreadcrumbManager.load_character_slot = function (self, data, version)
	local state = data.BreadcrumbManager

	if not state then
		return 
	end

	if not state.version or (state.version and state.version ~= BreadcrumbManager.VERSION) then
		self.version = BreadcrumbManager.VERSION
		slot6 = self

		self.reset(slot5)

		slot6 = managers.savefile

		managers.savefile.set_resave_required(slot5)
	else
		self.version = state.version or 1
		self._breadcrumbs[BreadcrumbManager.SLOT_CHARACTER] = state.slot_breadcrumbs or {}
	end

	return 
end
BreadcrumbManager.save_profile_slot = function (self, data)
	local state = {
		version = self.version,
		profile_breadcrumbs = self._breadcrumbs[BreadcrumbManager.SLOT_PROFILE]
	}
	data.BreadcrumbManager = state

	return 
end
BreadcrumbManager.load_profile_slot = function (self, data, version)
	local state = data.BreadcrumbManager

	if not state then
		return 
	end

	if not state.version or (state.version and state.version ~= BreadcrumbManager.VERSION) then
		self.version = BreadcrumbManager.VERSION
		slot6 = self

		self.reset(slot5)

		slot6 = managers.savefile

		managers.savefile.set_resave_required(slot5)
	else
		self.version = state.version or 1
		self._breadcrumbs[BreadcrumbManager.SLOT_PROFILE] = state.profile_breadcrumbs or {}
	end

	return 
end

return 
