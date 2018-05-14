CharacterCustomizationManager = CharacterCustomizationManager or class()
CharacterCustomizationManager.VERSION = 16
CharacterCustomizationManager.LOCKED_NATIONALITY = "character_customization_locked_nationality"
CharacterCustomizationManager.LOCKED_NOT_OWNED = "character_customization_locked_not_owned"
CharacterCustomizationManager.LOCKED_GOLD_NOT_OWNED = "character_customization_locked_gold_not_owned"
CharacterCustomizationManager.LOCKED_DLC_SPECIFIC = "character_customization_locked_dlc_specific"
function CharacterCustomizationManager:init()
	self._tweak_data = tweak_data.character_customization.customizations

	if not Global.character_customization_manager then
		Global.character_customization_manager = {
			VERSION = CharacterCustomizationManager.VERSION
		}
		slot4 = tweak_data.character_customization
		Global.character_customization_manager.owned_customizations = tweak_data.character_customization.get_defaults(slot3)
		Global.character_customization_manager.random_customization_awards = {}
	end

	self._global = Global.character_customization_manager
	self._character_customization_version_to_attach = 1

	return 
end
function CharacterCustomizationManager:get_current_version_to_attach()
	return self._character_customization_version_to_attach
end
function CharacterCustomizationManager:reset_current_version_to_attach()
	self._character_customization_version_to_attach = 1

	return 
end
function CharacterCustomizationManager:increase_current_version_to_attach()
	self._character_customization_version_to_attach = self._character_customization_version_to_attach + 1

	return 
end
function CharacterCustomizationManager:get_all_owned_customizations()
	if self._global.owned_customizations == nil then
		slot4 = tweak_data.character_customization
		self._global.owned_customizations = tweak_data.character_customization.get_defaults(slot3)
	end

	return self._global.owned_customizations
end
function CharacterCustomizationManager:set_all_owned_customizations(customizations)
	slot5 = customizations

	self._filter_customizations(slot3, self)

	slot5 = customizations
	slot8 = tweak_data.character_customization

	self._append_customizations(slot3, self, tweak_data.character_customization.get_defaults(slot7))

	self._global.owned_customizations = customizations
	slot4 = self

	self._award_random_customizations(slot3)

	return 
end
function CharacterCustomizationManager:_filter_customizations(customizations)
	local locked_customizations = tweak_data.dlc.get_locked_customizations(slot3)
	slot5 = locked_customizations

	for name, _ in pairs(tweak_data.dlc) do
		customizations[name] = nil
	end

	return 
end
function CharacterCustomizationManager:_append_customizations(customizations, to_append)
	slot5 = to_append

	for name, data in pairs(slot4) do
		if not customizations[name] then
			customizations[name] = data
			customizations[name].key_name = name
		end
	end

	return 
end
function CharacterCustomizationManager:_award_random_customizations()
	slot4 = "[CharacterCustomizationManager][_award_random_customizations]"

	Application.debug(slot2, Application)

	slot3 = tweak_data.dlc
	local eligible_awards = tweak_data.dlc.get_eligible_random_customizations(slot2)

	if #eligible_awards == 0 then
		return 
	end

	slot4 = tweak_data.character_customization
	local droppable_customizations = tweak_data.character_customization.get_droppable_customizations(slot3)
	local awardable_customizations = {}
	slot6 = droppable_customizations

	for _, key in ipairs(slot5) do
		if not self._global.owned_customizations[key] and tweak_data.character_customization.customizations[key].part_type == CharacterCustomizationTweakData.PART_TYPE_UPPER then
			slot12 = key

			table.insert(slot10, awardable_customizations)
		end
	end

	slot7 = "[CharacterCustomizationManager][_award_random_customizations] eligible_awards: "
	slot10 = eligible_awards

	Application.debug(slot5, Application, inspect(slot9))

	slot6 = eligible_awards

	for _, award in pairs(slot5) do
		local awarded_customization = self._global.random_customization_awards[award.item]

		if not awarded_customization then
			slot13 = "[CharacterCustomizationManager][_award_random_customizations]    awarding "
			slot16 = award

			Application.debug(slot11, Application, inspect(slot15))

			if 0 < #awardable_customizations then
				slot12 = #awardable_customizations
				local random_index = math.random(slot11)
				local customization = awardable_customizations[random_index]
				slot16 = false

				self.add_character_customization_to_inventory(slot13, self, customization)

				slot16 = customization

				Application.debug(slot13, Application, "[CharacterCustomizationManager][_award_random_customizations]    giving ")

				self._global.random_customization_awards[award.item] = customization
				slot14 = managers.savefile

				managers.savefile.set_resave_required(award.item)
			end
		elseif not self._global.owned_customizations[awarded_customization] then
			slot14 = false

			self.add_character_customization_to_inventory(slot11, self, awarded_customization)
		end
	end

	return 
end
function CharacterCustomizationManager:get_owned_customizations_indexed(part_type, nationality)
	local result = {}
	slot6 = self
	local owned_customizations = self.get_all_owned_customizations(slot5)
	local counter = 1
	slot9 = part_type
	local indexed_parts = tweak_data.character_customization.get_index_table(slot7, tweak_data.character_customization)
	slot9 = indexed_parts

	for index, part_key_name in pairs(tweak_data.character_customization) do
		if owned_customizations[part_key_name] then
			slot16 = nationality

			if self._can_nationality_use_customization(slot13, self, owned_customizations[part_key_name]) then
				result[counter] = {}
				slot14 = owned_customizations[part_key_name]
				local customization_data = clone(slot13)
				customization_data.key_name = part_key_name
				customization_data.part_index = counter
				result[counter] = customization_data
				counter = counter + 1
			end
		end
	end

	return result
end
function CharacterCustomizationManager:_can_nationality_use_customization(customization_data, nationality)
	local result = false

	if customization_data and customization_data.nationalities then
		slot6 = customization_data.nationalities

		for _, customization_nationality in ipairs(slot5) do
			if nationality == customization_nationality then
				result = true

				break
			end
		end
	end

	return result
end
function CharacterCustomizationManager:equipable_nationalities_to_string(part_key_name)
	local result = ""
	local item_data = tweak_data.character_customization.customizations[part_key_name]

	if item_data and item_data.nationalities then
		slot6 = item_data.nationalities

		for _, nationality in pairs(slot5) do
			if nationality == CharacterCustomizationTweakData.NATIONALITY_AMERICAN then
				slot14 = "character_profile_creation_american"
				result = result .. " " .. managers.localization.text(slot12, managers.localization)
			elseif nationality == CharacterCustomizationTweakData.NATIONALITY_GERMAN then
				slot14 = "character_profile_creation_german"
				result = result .. " " .. managers.localization.text(slot12, managers.localization)
			elseif nationality == CharacterCustomizationTweakData.NATIONALITY_BRITISH then
				slot14 = "character_profile_creation_british"
				result = result .. " " .. managers.localization.text(slot12, managers.localization)
			elseif nationality == CharacterCustomizationTweakData.NATIONALITY_RUSSIAN then
				slot14 = "character_profile_creation_russian"
				result = result .. " " .. managers.localization.text(slot12, managers.localization)
			end
		end
	end

	return result
end
function CharacterCustomizationManager:get_equiped_part_from_character_save_slot(slot_index, part_type)
	local result = nil
	local slot_cache_data = Global.savefile_manager.meta_data_list[slot_index].cache
	local player_manager_data = slot_cache_data.PlayerManager
	local character_nationality_name = player_manager_data.character_profile_nation
	local equiped_head_name = player_manager_data.customization_equiped_head_name
	local equiped_upper_name = player_manager_data.customization_equiped_upper_name
	local equiped_lower_name = player_manager_data.customization_equiped_lower_name

	if part_type == CharacterCustomizationTweakData.PART_TYPE_HEAD then
		slot12 = self

		if not self.get_all_owned_customizations(slot11)[equiped_head_name] then
			slot14 = part_type
			result = self.get_default_part_key_name(slot11, self, character_nationality_name)
		else
			result = equiped_head_name
		end
	elseif part_type == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		slot12 = self

		if not self.get_all_owned_customizations(slot11)[equiped_upper_name] then
			slot14 = part_type
			result = self.get_default_part_key_name(slot11, self, character_nationality_name)
		else
			result = equiped_upper_name
		end
	elseif part_type == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		slot12 = self

		if not self.get_all_owned_customizations(slot11)[equiped_lower_name] then
			slot14 = part_type
			result = self.get_default_part_key_name(slot11, self, character_nationality_name)
		else
			result = equiped_lower_name
		end
	end

	return result
end
function CharacterCustomizationManager:get_equiped_part_index(character_nationality_name, part_type, equiped_name)
	local parts_table = {}
	slot9 = character_nationality_name
	parts_table = self.get_owned_customizations_indexed(slot6, self, part_type)

	if parts_table then
		slot7 = parts_table

		for index, value in pairs(slot6) do
			if value.key_name == equiped_name then
				return index
			end
		end
	end

	slot9 = part_type
	local default_name = self.get_default_part_key_name(slot6, self, character_nationality_name)

	if parts_table then
		slot8 = parts_table

		for index, value in pairs(slot7) do
			if value.key_name == default_name then
				return index
			end
		end
	end

	slot11 = equiped_name

	debug_pause(slot7, "[CharacterCustomizationManager][get_equiped_part_index] No customization part found, both equipped and default failed: ", character_nationality_name, part_type)

	return 1
end
function CharacterCustomizationManager:verify_customization_ownership(character_nationality_name, part_type, equiped_name)
	slot6 = self
	local owned_customizations = self.get_all_owned_customizations(slot5)

	if owned_customizations[equiped_name] then
		return equiped_name
	end

	slot9 = part_type

	return self.get_default_part_key_name(slot6, self, character_nationality_name)
end
function CharacterCustomizationManager:get_all_parts_indexed(part_type)
	slot5 = part_type

	return tweak_data.character_customization.get_all_parts_indexed(slot3, tweak_data.character_customization)
end
function CharacterCustomizationManager:get_all_parts(part_type)
	slot5 = part_type

	return tweak_data.character_customization.get_all_parts(slot3, tweak_data.character_customization)
end
function CharacterCustomizationManager:get_all_parts_indexed_filtered(part_type, nationality, owned_only)
	local data = tweak_data.character_customization.get_all_parts_indexed(slot5, tweak_data.character_customization)
	local result = {}
	local owned_customizations = self.get_all_owned_customizations(part_type)
	slot9 = tweak_data.dlc
	local unlocked_customizations = tweak_data.dlc.get_unlocked_customizations(self)
	local counter = 1
	slot11 = data

	for index, part_data in pairs(slot10) do
		local new_data = clone(slot15)
		slot18 = "[CharacterCustomizationManager:get_all_parts_indexed_filtered] new_data "
		slot21 = new_data

		Application.trace(part_data, Application, inspect(slot20))

		if (not owned_only or owned_customizations[new_data.key_name]) and nationality then
			slot19 = nationality

			if self._can_nationality_use_customization(slot16, self, new_data) then
				local should_show = true

				if not owned_customizations[new_data.key_name] then
					if new_data.dlc and not unlocked_customizations[new_data.key_name] then
						if not new_data.dlc_show_if_locked then
							should_show = false
						end

						new_data.locked = CharacterCustomizationManager.LOCKED_DLC_SPECIFIC
						new_data.status = RaidGUIControlGridItem.STATUS_LOCKED_DLC
					elseif new_data.gold_price then
						new_data.locked = CharacterCustomizationManager.LOCKED_GOLD_NOT_OWNED
						new_data.status = RaidGUIControlGridItem.STATUS_PURCHASABLE
					else
						new_data.locked = CharacterCustomizationManager.LOCKED_NOT_OWNED
						new_data.status = RaidGUIControlGridItem.STATUS_LOCKED
					end
				else
					new_data.status = RaidGUIControlGridItem.STATUS_OWNED_OR_PURCHASED
				end

				if should_show then
					new_data.breadcrumb = {}
					local breadcrumb_category = nil
					slot19 = BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION.subcategories

					for i, category in pairs(slot18) do
						if category.identifier == new_data.part_type then
							breadcrumb_category = category

							break
						end
					end

					new_data.breadcrumb.category = breadcrumb_category
					new_data.breadcrumb.identifiers = {}
					slot20 = new_data.nationalities[1]

					table.insert(, new_data.breadcrumb.identifiers)

					slot20 = new_data.key_name

					table.insert(, new_data.breadcrumb.identifiers)

					slot20 = new_data

					table.insert(, result)
				end
			end
		end
	end

	slot12 = result
	result = self._sort_by_unlocked(slot10, self)

	return result
end
function CharacterCustomizationManager:_sort_by_unlocked(data)
	local result = {}

	if data then
		slot5 = data

		for index, part_data in pairs(slot4) do
			if not part_data.locked then
				slot11 = part_data

				table.insert(slot9, result)
			end
		end

		slot5 = data

		for index, part_data in pairs(slot4) do
			if part_data.locked == CharacterCustomizationManager.LOCKED_GOLD_NOT_OWNED then
				slot11 = part_data

				table.insert(slot9, result)
			end
		end

		slot5 = data

		for index, part_data in pairs(slot4) do
			if part_data.locked == CharacterCustomizationManager.LOCKED_NOT_OWNED and not part_data.dlc then
				slot11 = part_data

				table.insert(slot9, result)
			end
		end

		slot5 = data

		for index, part_data in pairs(slot4) do
			if part_data.locked == CharacterCustomizationManager.LOCKED_NOT_OWNED and part_data.dlc then
				slot11 = part_data

				table.insert(slot9, result)
			end
		end

		slot5 = data

		for index, part_data in pairs(slot4) do
			if part_data.locked == CharacterCustomizationManager.LOCKED_DLC_SPECIFIC then
				slot11 = part_data

				table.insert(slot9, result)
			end
		end
	end

	data = nil

	return result
end
function CharacterCustomizationManager:check_part_key_name(part_type, part_key_name, nationality)
	local result = part_key_name
	slot8 = part_type
	local all_parts = self.get_all_parts(slot6, self)

	if not all_parts[part_key_name] then
		slot10 = part_type
		result = self.get_default_part_key_name(slot7, self, nationality)
	end

	return result
end
function CharacterCustomizationManager:get_default_part_key_name(nationality, part_type)
	local result = ""

	if part_type == CharacterCustomizationTweakData.PART_TYPE_HEAD then
		result = nationality .. "_default_head"
	elseif part_type == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		result = nationality .. "_default_upper"
	elseif part_type == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		result = nationality .. "_default_lower"
	end

	return result
end
function CharacterCustomizationManager:reset()
	slot3 = self
	slot6 = tweak_data.character_customization

	self.set_all_owned_customizations(slot2, tweak_data.character_customization.get_defaults(slot5))

	return 
end
function CharacterCustomizationManager:save(data)
	local state = {}
	slot5 = self
	state.owned_customizations = self.get_all_owned_customizations(slot4)
	state.random_customization_awards = self._global.random_customization_awards

	if self._global.VERSION then
		state.VERSION = self._global.VERSION
	end

	data.CharacterCustomizationManager = state

	return 
end
function CharacterCustomizationManager:load(data)
	local state = data.CharacterCustomizationManager

	if state then
		self._global.random_customization_awards = state.random_customization_awards or {}

		if state.VERSION and state.VERSION == CharacterCustomizationManager.VERSION then
			slot6 = state.owned_customizations

			self.set_all_owned_customizations(slot4, self)
		else
			slot6 = state.owned_customizations

			self.reset_customizations_on_load(slot4, self)

			slot5 = managers.savefile

			managers.savefile.set_resave_required(slot4)
		end
	end

	return 
end
function CharacterCustomizationManager:reset_customizations_on_load(previously_owned)
	local currently_owned = {}
	slot5 = previously_owned

	for customization_name, customization_data in pairs(slot4) do
		if tweak_data.character_customization.customizations[customization_name] then
			currently_owned[customization_name] = tweak_data.character_customization.customizations[customization_name]
		end
	end

	slot6 = currently_owned

	self.set_all_owned_customizations(slot4, self)

	return 
end
function CharacterCustomizationManager:is_character_customization_owned(part_key)
	return self._global.owned_customizations[part_key] ~= nil
end
function CharacterCustomizationManager:add_character_customization_to_inventory(part_key, bought)
	self._global.owned_customizations[part_key] = tweak_data.character_customization.customizations[part_key]
	local breadcrumb_category = nil
	slot6 = BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION.subcategories

	for index, category in pairs(slot5) do
		if category.identifier == tweak_data.character_customization.customizations[part_key].part_type then
			breadcrumb_category = category

			break
		end
	end

	slot6 = tweak_data.character_customization.customizations[part_key].nationalities

	for index, nationality in pairs(slot5) do
		local need_breadcrumb = false

		for slot_index = SavefileManager.CHARACTER_PROFILE_STARTING_SLOT, (SavefileManager.CHARACTER_PROFILE_STARTING_SLOT + SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT) - 1, 1 do
			local slot_data = Global.savefile_manager.meta_data_list[slot_index]

			if slot_data and slot_data.cache and nationality == slot_data.cache.PlayerManager.character_profile_nation then
				need_breadcrumb = true

				break
			end
		end

		if need_breadcrumb and not bought then
			slot14 = {
				nationality,
				part_key
			}

			managers.breadcrumb.add_breadcrumb(slot11, managers.breadcrumb, breadcrumb_category)
		end
	end

	return 
end
function CharacterCustomizationManager:remove_character_customization_from_inventory(part_key)
	self._global.owned_customizations[part_key] = nil

	return 
end
function CharacterCustomizationManager:reaply_character_criminal(preferred_character_name)
	slot4 = Network

	if Network.is_server(slot3) then
		slot7 = managers.network
		slot7 = managers.network.session(preferred_character_name)
		slot7 = managers.network.session(preferred_character_name).local_peer(preferred_character_name)
		slot9 = managers.player

		self.request_change_criminal_character(slot3, self, managers.network.session(preferred_character_name).local_peer(preferred_character_name).id(preferred_character_name), managers.player.local_player(slot8))
	else
		slot4 = managers.network
		slot8 = managers.network
		slot8 = managers.network.session(preferred_character_name)
		slot8 = managers.network.session(preferred_character_name).local_peer(preferred_character_name)
		slot10 = managers.player

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "request_change_criminal_character", managers.network.session(preferred_character_name).local_peer(preferred_character_name).id(preferred_character_name), managers.player.local_player(slot9))
	end

	return 
end
function CharacterCustomizationManager:request_change_criminal_character(peer_id, preferred_character_name, peer_unit)
	slot6 = Network

	if not Network.is_server(slot5) then
		return 
	end

	local remove_unit_in_source_slot = true
	slot7 = managers.network
	slot8 = preferred_character_name
	local new_character_name = managers.network.session(slot6).check_peer_preferred_character(slot6, managers.network.session(slot6))

	if not new_character_name then
		remove_unit_in_source_slot = false
		slot9 = peer_id
		new_character_name = managers.criminals.character_name_by_peer_id(slot7, managers.criminals)
	end

	slot9 = peer_id
	local existing_character_name = managers.criminals.character_name_by_peer_id(slot7, managers.criminals)

	if existing_character_name == preferred_character_name then
		new_character_name = preferred_character_name
		remove_unit_in_source_slot = false
	end

	slot9 = managers.network
	slot13 = peer_unit

	managers.network.session(slot8).send_to_peers(slot8, managers.network.session(slot8), "change_criminal_character", peer_id, new_character_name)

	slot13 = remove_unit_in_source_slot

	self.change_criminal_character(slot8, self, peer_id, new_character_name, peer_unit)

	return 
end
function CharacterCustomizationManager:change_criminal_character(peer_id, new_character_name, peer_unit, remove_unit_in_source_slot)
	slot8 = new_character_name
	local unit_to_remove = managers.criminals.character_unit_by_name(slot6, managers.criminals)
	slot11 = peer_unit
	slot9 = peer_unit.unit_data(slot10).name_label_id

	managers.hud._remove_name_label(managers.criminals, managers.hud)

	if unit_to_remove and remove_unit_in_source_slot then
		slot9 = 0

		unit_to_remove.set_slot(slot7, unit_to_remove)
	end

	slot9 = peer_id

	managers.criminals.remove_character_by_peer_id(slot7, managers.criminals)

	slot12 = false

	managers.criminals.add_character(slot7, managers.criminals, new_character_name, peer_unit, peer_id)

	slot8 = managers.network
	slot9 = peer_id
	slot9 = new_character_name

	managers.network.session(slot7).peer(slot7, managers.network.session(slot7)).set_character(slot7, managers.network.session(slot7).peer(slot7, managers.network.session(slot7)))

	slot9 = new_character_name
	local head_data = self.get_default_head_data(slot7, self)
	slot9 = peer_unit

	if peer_unit.customization(self) then
		slot9 = self

		self.increase_current_version_to_attach(slot8)

		slot9 = peer_unit
		slot10 = head_data.path

		peer_unit.customization(slot8).attach_head_for_husk(slot8, peer_unit.customization(slot8))
	end

	if Global.game_settings.team_ai then
		slot9 = Network

		if Network.is_server(slot8) then
			slot9 = managers.groupai
			slot10 = nil

			managers.groupai.state(slot8).fill_criminal_team_with_AI(slot8, managers.groupai.state(slot8))
		end
	end

	return 
end
function CharacterCustomizationManager:get_default_head_data(nationality)
	local result = {}

	if nationality == CharacterCustomizationTweakData.NATIONALITY_AMERICAN then
		result = tweak_data.character_customization.customizations.american_default_head
	elseif nationality == CharacterCustomizationTweakData.NATIONALITY_BRITISH then
		result = tweak_data.character_customization.customizations.british_default_head
	elseif nationality == CharacterCustomizationTweakData.NATIONALITY_GERMAN then
		result = tweak_data.character_customization.customizations.german_default_head
	elseif nationality == CharacterCustomizationTweakData.NATIONALITY_RUSSIAN then
		result = tweak_data.character_customization.customizations.russian_default_head
	end

	return result
end

return 
