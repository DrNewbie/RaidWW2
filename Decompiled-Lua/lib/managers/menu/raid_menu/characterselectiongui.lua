if not CharacterSelectionGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

CharacterSelectionGui = slot0
function CharacterSelectionGui:init(ws, fullscreen_ws, node, component_name)
	self._loading_units = {}
	slot11 = component_name

	CharacterSelectionGui.super.init(slot6, self, ws, fullscreen_ws, node)

	self._character_spawn_location = nil
	slot7 = managers.raid_menu

	managers.raid_menu.save_sync_player_data(slot6)

	slot8 = "character_selection_title"

	self._node.components.raid_menu_header.set_screen_name(slot6, self._node.components.raid_menu_header)

	self._pre_close_screen_loading_done_callback = callback(slot6, self, self)
	slot7 = managers.raid_menu
	slot12 = "on_escape"

	managers.raid_menu.register_on_escape_callback(slot6, callback("_pre_close_screen_loading_done", self, self))

	slot7 = managers.savefile
	self._initial_character_slot = managers.savefile.get_save_progress_slot(slot6)
	slot7 = managers.savefile
	self._slot_to_select = managers.savefile.get_save_progress_slot(slot6)
	slot7 = managers.raid_menu

	managers.raid_menu.hide_background(slot6)

	return 
end
function CharacterSelectionGui:_setup_properties()
	slot3 = self

	CharacterSelectionGui.super._setup_properties(slot2)

	self._background = nil
	self._background_rect = nil

	return 
end
function CharacterSelectionGui:_set_initial_data()
	slot3 = managers.character_customization

	managers.character_customization.reset_current_version_to_attach(slot2)

	self._slots_loaded = {}
	slot3 = self

	self._load_all_slots(slot2)

	return 
end
function CharacterSelectionGui:_layout()
	slot3 = self

	self._disable_dof(slot2)

	slot4 = {
		w = 416,
		name = "subtitle_profiles",
		h = 32,
		y = 96,
		x = 0,
		text = self.translate(slot6, self, "character_selection_subtitle"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.large,
		color = tweak_data.gui.colors.raid_white
	}
	slot9 = true

	self._root_panel.label(slot2, self._root_panel)

	slot4 = {
		w = 416,
		name = "subtitle_small_profiles",
		h = 32,
		y = 128,
		x = 0,
		text = self.translate(slot6, self, "character_selection_subtitle_small"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_grey
	}
	slot9 = true

	self._root_panel.label(slot2, self._root_panel)

	slot4 = {
		selection_enabled = true,
		name = "characters_list",
		h = 480,
		w = 650,
		y = 224,
		vertical_spacing = 2,
		item_h = 94,
		x = 0,
		item_class = RaidGUIControlListItemCharacterSelect,
		on_item_clicked_callback = callback(slot6, self, self),
		on_item_selected_callback = callback(slot6, self, self),
		on_item_double_clicked_callback = callback(slot6, self, self),
		data_source_callback = callback(slot6, self, self),
		special_action_callback = callback(slot6, self, self)
	}
	slot9 = "_on_item_click"
	slot9 = "_on_item_selected"
	slot9 = "_on_item_double_click"
	slot9 = "_data_source_characters_list"
	slot9 = "_character_action_callback"
	self._characters_list = self._root_panel.list_active(slot2, self._root_panel)
	slot4 = {
		name = "select_character_button",
		visible = false,
		y = 736,
		x = 0,
		text = self.translate(slot6, self, "character_selection_select_character_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		on_click_callback = callback(slot6, self, self)
	}
	slot9 = true
	slot9 = "on_select_character_button"
	self._select_character_button = self._root_panel.long_primary_button(slot2, self._root_panel)
	slot4 = {
		name = "select_character_button_disabled",
		visible = true,
		y = 736,
		x = 0,
		text = self.translate(slot6, self, "character_selection_selected_character_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER
	}
	slot9 = true
	self._select_character_button_disabled = self._root_panel.long_primary_button_disabled(slot2, self._root_panel)
	slot6 = self._select_character_button
	slot4 = (416 - self._select_character_button.w(RaidGuiBase.FOREGROUND_LAYER)) / 2

	self._select_character_button.set_x(slot2, self._select_character_button)

	slot6 = self._select_character_button_disabled
	slot4 = (416 - self._select_character_button_disabled.w(RaidGuiBase.FOREGROUND_LAYER)) / 2

	self._select_character_button_disabled.set_x(slot2, self._select_character_button_disabled)

	slot4 = {
		name = "profile_name_label",
		h = 41,
		w = 356,
		align = "right",
		text = "PROFILE NAME 01",
		y = 96,
		x = 1376,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38,
		color = tweak_data.gui.colors.raid_white
	}
	self._profile_name_label = self._root_panel.label(slot2, self._root_panel)
	slot3 = self._profile_name_label
	slot6 = self._root_panel

	self._profile_name_label.set_right(slot2, self._root_panel.right(tweak_data.gui.colors.raid_white))

	slot4 = {
		name = "character_name_label",
		h = 32,
		w = 356,
		align = "right",
		text = "KURGAN",
		y = 136,
		x = 1376,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._character_name_label = self._root_panel.label(slot2, self._root_panel)
	slot3 = self._character_name_label
	slot6 = self._root_panel

	self._character_name_label.set_right(slot2, self._root_panel.right(tweak_data.gui.colors.raid_grey))

	slot6 = {}
	self._right_side_info = self._root_panel.create_custom_control(slot2, self._root_panel, RaidGUIControlCharacterDescription, {
		name = "right_side_info_panel",
		h = 680,
		y = 192,
		w = 356,
		x = 1376
	})
	slot3 = self._right_side_info
	slot6 = self._root_panel

	self._right_side_info.set_right(slot2, self._root_panel.right())

	return 
end
function CharacterSelectionGui:_data_source_characters_list()
	local characters = {}

	for slot_index = SavefileManager.CHARACTER_PROFILE_STARTING_SLOT, (SavefileManager.CHARACTER_PROFILE_STARTING_SLOT + SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT) - 1, 1 do
		local slot_data = Global.savefile_manager.meta_data_list[slot_index]

		if slot_data.cache then
			local character_name = slot_data.cache.PlayerManager.character_profile_name
			slot11 = {
				text = character_name,
				value = slot_index,
				info = "Character " .. character_name
			}

			table.insert(slot9, characters)
		else
			slot10 = {
				info = "",
				text = "",
				value = slot_index
			}

			table.insert(slot8, characters)
		end
	end

	return characters
end
function CharacterSelectionGui:on_select_character_button()
	slot3 = self

	self.activate_selected_character(slot2)

	slot3 = self._characters_list
	slot3 = self._characters_list.selected_item(slot2)

	self._characters_list.selected_item(slot2).select(slot2)

	return 
end
function CharacterSelectionGui:_character_action_callback(slot_index, action)
	slot8 = action

	Application.trace(slot4, Application, "[CharacterSelectionGui:_character_action_callback] slot_index, action ", slot_index)

	if action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CUSTOMIZE then
		slot5 = managers.savefile

		if managers.savefile.get_active_characters_count(slot4) <= 0 then
			slot5 = managers.menu

			managers.menu.show_no_active_characters(slot4)

			return 
		end

		slot5 = self

		self._customize_character(slot4)
	elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_DELETE then
		if slot_index then
			slot6 = slot_index

			self._delete_character(slot4, self)
		end
	elseif action == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CREATE then
		slot5 = self

		self._create_character(slot4)
	end

	return 
end
function CharacterSelectionGui:_customize_character()
	self._open_customization_screen_flag = true
	self._open_creation_screen_flag = false
	slot3 = self

	self._pre_close_screen(slot2)

	return 
end
function CharacterSelectionGui:_delete_character(slot_index)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)

	if managers.network.session(slot3).has_other_peers(slot3) then
		slot4 = managers.savefile

		if managers.savefile.get_active_characters_count(slot3) <= 1 then
			local params = {}
			slot6 = "character_profile_last_character_delete_forbiden_in_multiplayer"
			params.text = managers.localization.text(slot4, managers.localization)
			slot6 = params

			managers.menu.show_last_character_delete_forbiden_in_multiplayer(slot4, managers.menu)

			return 
		end
	end

	self._open_customization_screen_flag = false
	self._open_creation_screen_flag = false
	self._character_slot_to_delete = slot_index
	slot4 = self
	slot9 = "on_item_yes_delete_characters_list"

	self.show_character_delete_confirmation(slot3, callback(slot6, self, self))

	return 
end
function CharacterSelectionGui:_create_character()
	slot4 = self._selected_character_slot

	managers.savefile.set_create_character_slot(slot2, managers.savefile)

	self._open_customization_screen_flag = false
	self._open_creation_screen_flag = true
	slot3 = self

	self._pre_close_screen(slot2)

	return 
end
function CharacterSelectionGui:_on_item_click(slot_index)
	slot5 = "[CharacterSelectionGui:_on_item_click]"

	Application.trace(slot3, Application)

	slot5 = slot_index

	self._select_character_slot(slot3, self)

	return 
end
function CharacterSelectionGui:_on_item_selected(slot_index)
	slot6 = slot_index

	Application.trace(slot3, Application, "[CharacterSelectionGui:_on_item_selected] slot_index ")

	slot5 = slot_index

	self._select_character_slot(slot3, self)

	return 
end
function CharacterSelectionGui:_on_item_double_click(slot_index)
	slot5 = slot_index

	self._select_character_slot(slot3, self)

	slot4 = self

	self.activate_selected_character(slot3)

	slot4 = self._characters_list
	slot4 = self._characters_list.selected_item(slot3)

	self._characters_list.selected_item(slot3).select(slot3)

	return 
end
function CharacterSelectionGui:_rebind_controller_buttons(slot_index)
	local cache = Global.savefile_manager.meta_data_list[slot_index].cache

	if not cache then
		slot5 = self

		self._bind_empty_slot_controller_inputs(slot4)
	elseif slot_index == self._active_character_slot then
		slot5 = self

		self._bind_active_slot_controller_inputs(slot4)
	else
		slot5 = self

		self._bind_inactive_slot_controller_inputs(slot4)
	end

	return 
end
function CharacterSelectionGui:_load_all_slots()
	for slot_index = SavefileManager.CHARACTER_PROFILE_STARTING_SLOT, (SavefileManager.CHARACTER_PROFILE_STARTING_SLOT + SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT) - 1, 1 do
		if Global.savefile_manager.meta_data_list and Global.savefile_manager.meta_data_list[slot_index] then
			Global.savefile_manager.meta_data_list[slot_index].is_load_done = false
			Global.savefile_manager.meta_data_list[slot_index].is_cached_slot = false
		end

		slot9 = false

		self._load_slot_data(slot6, self, slot_index)
	end

	slot3 = managers.savefile
	local last_selected_slot = managers.savefile.get_save_progress_slot(slot2)

	if last_selected_slot ~= -1 then
		slot6 = false

		self._load_slot_data(slot3, self, last_selected_slot)
	end

	self._active_character_slot = last_selected_slot

	return 
end
function CharacterSelectionGui:_load_slot_data(slot_index, save_as_last_selected_slot)
	slot5 = managers.warcry

	managers.warcry.reset(slot4)

	self._slots_loaded[slot_index] = false
	self._is_load_done = false
	self._is_render_done = false
	slot7 = nil

	managers.savefile._set_cache(false, managers.savefile, slot_index)

	slot8 = nil

	managers.savefile._load(false, managers.savefile, slot_index, false)

	return 
end
function CharacterSelectionGui:_select_character_slot(slot_index)
	slot8 = self._active_character_slot

	Application.trace(slot3, Application, "[CharacterSelectionGui:_select_character_slot] slot_index, self._selected_character_slot, self._active_character_slot ", slot_index, self._selected_character_slot)

	slot5 = slot_index

	self._rebind_controller_buttons(slot3, self)

	if self._selected_character_slot ~= slot_index then
		self._selected_character_slot = slot_index
		slot5 = self._selected_character_slot

		self.show_selected_character_details(slot3, self)

		slot5 = self._selected_character_slot

		self.show_selected_character(slot3, self)
	end

	local slot_empty = not Global.savefile_manager.meta_data_list[slot_index].cache
	slot5 = managers.controller

	if managers.controller.is_xbox_controller_present(slot4) then
		slot5 = self._select_character_button

		self._select_character_button.hide(slot4)

		slot5 = self._select_character_button_disabled

		self._select_character_button_disabled.hide(slot4)
	elseif slot_empty then
		slot5 = self._select_character_button

		self._select_character_button.hide(slot4)

		slot5 = self._select_character_button_disabled

		self._select_character_button_disabled.hide(slot4)
	elseif slot_index == self._active_character_slot or slot_empty then
		slot5 = self._select_character_button

		self._select_character_button.hide(slot4)

		slot5 = self._select_character_button_disabled

		self._select_character_button_disabled.show(slot4)
	else
		slot5 = self._select_character_button

		self._select_character_button.show(slot4)

		slot5 = self._select_character_button_disabled

		self._select_character_button_disabled.hide(slot4)
	end

	return 
end
function CharacterSelectionGui:activate_selected_character()
	slot6 = self._active_character_slot

	Application.trace(slot2, Application, "[CharacterSelectionGui:activate_selected_character] selected_slot, active_slot ", self._selected_character_slot)

	slot4 = "character_selection_doubleclick"

	managers.menu_component.post_event(slot2, managers.menu_component)

	local old_progress_slot_index = self._active_character_slot
	local new_progress_slot_index = self._selected_character_slot

	if old_progress_slot_index == new_progress_slot_index then
		return 
	end

	if self._active_character_slot == self._selected_character_slot then
		return 
	end

	local cache = Global.savefile_manager.meta_data_list[self._selected_character_slot].cache

	if not cache then
		return 
	end

	slot7 = self._selected_character_slot

	self._activate_character_profile(slot5, self)

	return 
end
function CharacterSelectionGui:_activate_character_profile(slot_index)
	slot6 = slot_index

	Application.trace(slot3, Application, "[CharacterSelectionGui:_activate_character_profile] slot_index ")

	if not Global.savefile_manager.meta_data_list[slot_index] or not Global.savefile_manager.meta_data_list[slot_index].cache then
		slot4 = self

		self.destroy_character_unit(slot3)

		slot5 = false

		self._right_side_info.set_visible(slot3, self._right_side_info)

		return 
	end

	self._active_character_slot = slot_index
	slot5 = self._active_character_slot

	self._characters_list.activate_item_by_value(slot3, self._characters_list)

	return 
end
function CharacterSelectionGui:show_selected_character_details(slot_index)
	local cache = nil
	local profile_name = ""
	local nationality = ""
	local class_name = ""
	local level = ""
	local class_stats = nil

	if Global.savefile_manager.meta_data_list[slot_index] and Global.savefile_manager.meta_data_list[slot_index].cache then
		cache = Global.savefile_manager.meta_data_list[slot_index].cache
		profile_name = cache.PlayerManager.character_profile_name
		nationality = cache.PlayerManager.character_profile_nation
		class_name = cache.SkillTreeManager.character_profile_base_class
		slot12 = false
		level = Application.digest_value(slot9, Application, cache.RaidExperienceManager.level)
		class_stats = tweak_data.skilltree.classes[class_name].stats
	end

	if not cache then
		slot11 = false

		self._right_side_info.set_visible(slot9, self._right_side_info)

		slot11 = false

		self._profile_name_label.set_visible(slot9, self._profile_name_label)

		slot11 = false

		self._character_name_label.set_visible(slot9, self._character_name_label)
	else
		local skills_applied = {}

		if cache.SkillTreeManager and cache.SkillTreeManager.base_class_skill_tree then
			slot11 = cache.SkillTreeManager.base_class_skill_tree

			for level_index, level in pairs(slot10) do
				slot16 = level

				for skill_index, skill in ipairs(slot15) do
					if skill.active then
						slot22 = skill.skill_name

						table.insert(slot20, skills_applied)
					end
				end
			end
		end

		slot13 = skills_applied
		local character_stats = managers.skilltree.calculate_stats(slot10, managers.skilltree, class_name)
		slot13 = true

		self._right_side_info.set_visible(managers.skilltree, self._right_side_info)

		slot13 = {
			class_name = class_name,
			nationality = nationality,
			level = level,
			class_stats = class_stats,
			character_stats = character_stats
		}

		self._right_side_info.set_data(managers.skilltree, self._right_side_info)

		slot13 = true

		self._profile_name_label.set_visible(managers.skilltree, self._profile_name_label)

		slot13 = profile_name

		self._profile_name_label.set_text(managers.skilltree, self._profile_name_label)

		slot13 = true

		self._character_name_label.set_visible(managers.skilltree, self._character_name_label)

		slot12 = self._character_name_label
		slot17 = true

		self._character_name_label.set_text(managers.skilltree, self.translate(slot14, self, "menu_" .. nationality))
	end

	return 
end
function CharacterSelectionGui:show_selected_character(slot_index)
	self._loading_units[CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT] = true
	slot8 = CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT
	slot7 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
	slot13 = slot_index

	managers.dyn_resource.load(CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT, managers.dyn_resource, Idstring(slot6), Idstring("unit"), callback(slot9, self, self, "_show_selected_character_loaded"))

	return 
end
function CharacterSelectionGui:_show_selected_character_loaded(slot_index)
	if self._closing_screen then
		if self._spawned_character_unit then
			slot4 = self._spawned_character_unit
			slot4 = self._spawned_character_unit.customization(slot3)

			self._spawned_character_unit.customization(slot3).destroy_all_parts_on_character(slot3)
		end

		slot4 = self

		self.destroy_character_unit(slot3)

		return 
	end

	self._loading_units[CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT] = nil
	slot4 = managers.character_customization

	managers.character_customization.increase_current_version_to_attach(CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT)

	slot4 = self

	self.get_character_spawn_location(CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT)

	if not self._spawned_character_unit then
		self.destroy_character_unit(slot3)

		local unit_name = CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT
		slot5 = self._character_spawn_location

		if not self._character_spawn_location.position(self) then
			slot7 = 0
			local position = Vector3(slot4, 0, 0)
		end

		slot8 = 0
		local rotation = Rotation(slot5, 0, 0)
		slot10 = unit_name
		slot10 = rotation
		self._spawned_character_unit = World.spawn_unit(0, World, Idstring(slot9), position)
	end

	local random_animation_index = math.random(slot3, 1)
	local anim_state_name = tweak_data.character_customization.customization_animations[random_animation_index]
	slot9 = anim_state_name
	local state = self._spawned_character_unit.play_redirect(#tweak_data.character_customization.customization_animations, Idstring(slot8))
	slot7 = self._spawned_character_unit
	slot8 = state

	self._spawned_character_unit.anim_state_machine(self._spawned_character_unit).set_parameter(self._spawned_character_unit, self._spawned_character_unit.anim_state_machine(self._spawned_character_unit))

	slot7 = self._spawned_character_unit
	slot7 = self._spawned_character_unit.customization(self._spawned_character_unit)

	self._spawned_character_unit.customization(self._spawned_character_unit).destroy_all_parts_on_character(self._spawned_character_unit)

	slot7 = self._spawned_character_unit
	slot8 = slot_index
	slot11 = managers.character_customization

	self._spawned_character_unit.customization(self._spawned_character_unit).attach_all_parts_to_character(self._spawned_character_unit, self._spawned_character_unit.customization(self._spawned_character_unit), managers.character_customization.get_current_version_to_attach(slot10))

	return 
end
function CharacterSelectionGui:destroy_character_unit()
	if self._spawned_character_unit then
		slot3 = self._spawned_character_unit
		slot3 = self._spawned_character_unit.customization(slot2)

		self._spawned_character_unit.customization(slot2).destroy_all_parts_on_character(slot2)

		slot4 = 0

		self._spawned_character_unit.set_slot(slot2, self._spawned_character_unit)

		self._spawned_character_unit = nil
	end

	return 
end
function CharacterSelectionGui:get_character_spawn_location()
	slot4 = "all"
	slot8 = "env_effect"
	local units = World.find_units_quick(slot2, World, managers.slot.get_mask(slot6, managers.slot))

	if units then
		slot4 = units

		for _, unit in pairs(slot3) do
			slot10 = "units/vanilla/arhitecture/ber_a/ber_a_caracter_menu/caracter_menu_floor/caracter_menu_floor"

			if unit.name(slot8) == Idstring(unit) then
				slot9 = unit
				slot12 = "rp_caracter_menu_floor"
				self._character_spawn_location = unit.get_object(slot8, Idstring(slot11))
			end
		end
	end

	return 
end
function CharacterSelectionGui:back_pressed()
	slot4 = "[CharacterSelectionGui:back_pressed] "

	Application.trace(slot2, Application)

	if not Global.savefile_manager.meta_data_list[self._active_character_slot].cache then
		return false
	end

	slot3 = self

	CharacterSelectionGui.super.back_pressed(slot2)

	return 
end
function CharacterSelectionGui:_pre_close_screen()
	slot4 = "[CharacterSelectionGui][_pre_close_screen]"

	Application.trace(slot2, Application)

	slot3 = self

	self.destroy_character_unit(slot2)

	slot4 = self._active_character_slot

	managers.savefile.set_save_progress_slot(slot2, managers.savefile)

	slot5 = true

	managers.savefile._set_current_game_cache_slot(slot2, managers.savefile, self._active_character_slot)

	slot3 = managers.savefile

	if managers.savefile.get_save_progress_slot(slot2) ~= self._initial_character_slot then
		local nation = "american"

		if Global.savefile_manager.meta_data_list[Global.savefile_manager.current_game_cache_slot].cache then
			nation = Global.savefile_manager.meta_data_list[Global.savefile_manager.current_game_cache_slot].cache.PlayerManager.character_profile_nation
		end

		slot5 = nation

		managers.character_customization.reaply_character_criminal(slot3, managers.character_customization)

		slot5 = self._pre_close_screen_loading_done_callback

		managers.savefile.add_load_done_callback(slot3, managers.savefile)

		local last_selected_slot = managers.savefile.get_save_progress_slot(slot3)
		slot5 = managers.savefile

		managers.savefile.save_last_selected_character_profile_slot(managers.savefile)

		slot7 = true

		self._load_slot_data(managers.savefile, self, last_selected_slot)
	else
		slot3 = self

		self._extra_character_setup(slot2)
	end

	slot3 = self

	self.reset_weapon_challenges(slot2)

	return 
end
function CharacterSelectionGui:_extra_character_setup()
	slot4 = "[CharacterSelectionGui:_extra_character_setup]"

	Application.trace(slot2, Application)

	slot3 = managers.hud

	managers.hud.refresh_player_panel(slot2)

	slot3 = managers.player
	slot3 = managers.player.local_player(slot2)
	local selection_category_index = managers.player.local_player(slot2).inventory(slot2).equipped_selection(slot2)
	slot4 = managers.player

	managers.player._internal_load(managers.player.local_player(slot2).inventory(slot2))

	slot4 = managers.player
	slot4 = managers.player.local_player(managers.player.local_player(slot2).inventory(slot2))
	slot6 = false

	managers.player.local_player(managers.player.local_player(slot2).inventory(slot2)).inventory(managers.player.local_player(slot2).inventory(slot2)).equip_selection(managers.player.local_player(slot2).inventory(slot2), managers.player.local_player(managers.player.local_player(slot2).inventory(slot2)).inventory(managers.player.local_player(slot2).inventory(slot2)), selection_category_index)

	slot4 = managers.player
	slot4 = managers.player.local_player(managers.player.local_player(slot2).inventory(slot2))
	slot5 = PlayerStandard.IDS_EQUIP

	managers.player.local_player(managers.player.local_player(slot2).inventory(slot2)).camera(managers.player.local_player(slot2).inventory(slot2)).play_redirect(managers.player.local_player(slot2).inventory(slot2), managers.player.local_player(managers.player.local_player(slot2).inventory(slot2)).camera(managers.player.local_player(slot2).inventory(slot2)))

	slot5 = 1
	slot8 = managers.player
	slot8 = managers.player.local_player(slot7)
	slot8 = managers.player.local_player(slot7).inventory(slot7)
	slot8 = managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[1].unit
	slot8 = managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[1].unit.base(slot7)

	managers.hud.set_ammo_amount(managers.player.local_player(slot2).inventory(slot2), managers.hud, managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[1].unit.base(slot7).ammo_info(slot7))

	slot5 = 2
	slot8 = managers.player
	slot8 = managers.player.local_player(slot7)
	slot8 = managers.player.local_player(slot7).inventory(slot7)
	slot8 = managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit

	managers.hud.set_ammo_amount(managers.player.local_player(slot2).inventory(slot2), managers.hud, managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit.base(slot7).ammo_info(slot7))

	slot5 = managers.player
	slot5 = managers.player.local_player(managers.hud)
	slot5 = managers.player.local_player(managers.hud).inventory(managers.hud)
	slot5 = managers.player.local_player(managers.hud).inventory(managers.hud).available_selections(managers.hud)[3].unit
	local grenade_icon = tweak_data.projectiles[managers.player.local_player(managers.hud).inventory(managers.hud).available_selections(managers.hud)[3].unit.base(managers.hud).name_id].icon
	slot9 = managers.network
	slot9 = managers.network.session(managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit.base(slot7))
	slot9 = managers.network.session(managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit.base(slot7)).local_peer(managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit.base(slot7))
	slot7 = false
	local grenade_amount = Application.digest_value(managers.hud, Application, Global.player_manager.synced_grenades[managers.network.session(managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit.base(slot7)).local_peer(managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit.base(slot7)).id(managers.player.local_player(slot7).inventory(slot7).available_selections(slot7)[2].unit.base(slot7))].amount)
	slot8 = {
		icon = grenade_icon,
		amount = grenade_amount
	}

	managers.hud.set_teammate_grenades_amount(Application, managers.hud, HUDManager.PLAYER_PANEL)

	if self._open_customization_screen_flag then
		slot7 = "character_customization_menu"

		managers.raid_menu.open_menu(slot5, managers.raid_menu)
	elseif self._open_creation_screen_flag then
		slot7 = "profile_creation_menu"

		managers.raid_menu.open_menu(slot5, managers.raid_menu)
	end

	slot6 = managers.weapon_skills

	managers.weapon_skills.update_weapon_part_animation_weights(slot5)

	return 
end
function CharacterSelectionGui:_pre_close_screen_loading_done()
	slot4 = "[CharacterSelectionGui:_pre_close_screen_loading_done]"

	Application.trace(slot2, Application)

	slot4 = self._pre_close_screen_loading_done_callback

	managers.savefile.remove_load_done_callback(slot2, managers.savefile)

	slot3 = managers.raid_menu

	managers.raid_menu.load_sync_player_data(slot2)

	if Global.savefile_manager.meta_data_list[Global.savefile_manager.current_game_cache_slot] and Global.savefile_manager.meta_data_list[Global.savefile_manager.current_game_cache_slot].cache then
		local character_nationality = Global.savefile_manager.meta_data_list[Global.savefile_manager.current_game_cache_slot].cache.PlayerManager.character_profile_nation
		slot4 = managers.network
		local local_peer = managers.network.session(slot3).local_peer(slot3)
		slot6 = "player"
		local team_id = tweak_data.levels.get_default_team_ID(managers.network.session(slot3), tweak_data.levels)
		slot6 = managers.network
		slot9 = managers.blackmarket.outfit_string(slot10)
		slot12 = local_peer
		slot11 = local_peer._id

		managers.network.session(tweak_data.levels).send_to_peers_synched(tweak_data.levels, managers.network.session(tweak_data.levels), "set_character_customization", local_peer._unit, slot9, local_peer.outfit_version(managers.blackmarket))

		slot6 = managers.network
		slot7 = "sync_character_level"
		slot10 = managers.experience

		managers.network.session(tweak_data.levels).send_to_peers_synched(tweak_data.levels, managers.network.session(tweak_data.levels), managers.experience.current_level(slot9))

		slot6 = managers.network
		slot8 = managers.skilltree.get_character_profile_class(slot9)
		slot11 = managers.player

		managers.network.session(tweak_data.levels).send_to_peers_synched(tweak_data.levels, managers.network.session(tweak_data.levels), "sync_character_class_nationality", managers.player.get_character_profile_nation(managers.skilltree))

		slot6 = managers.player
		slot6 = managers.player.local_player(tweak_data.levels)
		slot6 = managers.player.local_player(tweak_data.levels).camera(tweak_data.levels)
		slot6 = managers.player.local_player(tweak_data.levels).camera(tweak_data.levels).camera_unit(tweak_data.levels)
		slot8 = managers.player.get_customization_equiped_upper_name(managers.player.get_character_profile_nation)
		slot11 = managers.character_customization

		managers.player.local_player(tweak_data.levels).camera(tweak_data.levels).camera_unit(tweak_data.levels).customizationfps(tweak_data.levels).attach_fps_hands(tweak_data.levels, managers.player.local_player(tweak_data.levels).camera(tweak_data.levels).camera_unit(tweak_data.levels).customizationfps(tweak_data.levels), character_nationality, managers.character_customization.get_current_version_to_attach(managers.player))
	end

	slot3 = managers.network
	local local_peer = managers.network.session(slot2).local_peer(slot2)
	slot4 = local_peer
	slot7 = managers.blackmarket

	local_peer.set_outfit_string(managers.network.session(slot2), managers.blackmarket.outfit_string(slot6))

	slot4 = managers.network
	slot4 = managers.network.session(managers.network.session(slot2))

	managers.network.session(managers.network.session(slot2)).check_send_outfit(managers.network.session(slot2))

	slot4 = managers.player

	managers.player.sync_upgrades(managers.network.session(slot2))

	slot4 = managers.player
	slot7 = managers.skilltree

	managers.player.set_character_class(managers.network.session(slot2), managers.skilltree.get_character_profile_class(slot6))

	slot4 = self

	self._extra_character_setup(managers.network.session(slot2))

	slot4 = managers.network

	managers.network.start_matchmake_attributes_update(managers.network.session(slot2))

	slot4 = self

	self.reset_weapon_challenges(managers.network.session(slot2))

	return 
end
function CharacterSelectionGui:reset_weapon_challenges()
	slot3 = managers.challenge

	managers.challenge.deactivate_all_challenges(slot2)

	slot6 = managers.player
	slot6 = managers.player.get_current_state(slot5)._equipped_unit
	slot4 = managers.player.get_current_state(slot5)._equipped_unit.base(slot5)._name_id

	managers.weapon_skills.activate_current_challenges_for_weapon(slot2, managers.weapon_skills)

	return 
end
function CharacterSelectionGui:close()
	slot4 = "[CharacterSelectionGui][close] "

	Application.trace(slot2, Application)

	if self._loading_units then
		slot3 = self._loading_units

		for unit_name, _ in pairs(slot2) do
			Application.trace(slot7, Application, "[CharacterSelectionGui][close] Unloading unit ")

			slot12 = unit_name
			slot12 = false

			managers.dyn_resource.unload(slot7, managers.dyn_resource, Idstring(unit_name), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)
		end
	end

	slot3 = self

	self._enable_dof(slot2)

	slot3 = self

	CharacterSelectionGui.super.close(slot2)

	self._closing_screen = true

	return 
end
function CharacterSelectionGui:on_escape()
	slot4 = "[CharacterSelectionGui:on_escape]"

	Application.trace(slot2, Application)

	slot3 = self

	self._pre_close_screen(slot2)

	return 
end
function CharacterSelectionGui:show_character_delete_confirmation(callback_yes_function)
	local params = {}
	slot6 = "dialog_character_delete_message"
	params.text = managers.localization.text(slot4, managers.localization)
	params.callback = callback_yes_function
	slot6 = params

	managers.menu.show_character_delete_dialog(slot4, managers.menu)

	slot6 = "delete_character_prompt"

	managers.menu_component.post_event(slot4, managers.menu_component)

	return 
end
function CharacterSelectionGui:on_item_yes_delete_characters_list()
	slot5 = self._character_slot_to_delete

	Application.trace(slot2, Application, "[CharacterSelectionGui:on_item_yes_delete_characters_list] self._character_slot_to_delete ")

	local slot_to_delete = self._character_slot_to_delete
	slot5 = "delete_character"

	managers.menu_component.post_event(Application, managers.menu_component)

	Global.savefile_manager.meta_data_list[slot_to_delete].is_deleting = true
	slot5 = slot_to_delete

	managers.savefile._remove(true, managers.savefile)

	slot6 = false

	managers.savefile._set_synched_cache(true, managers.savefile, slot_to_delete)

	self._is_load_done = false
	self._is_render_done = false
	self._slots_loaded[slot_to_delete] = false
	local new_slot = -1

	if slot_to_delete == self._active_character_slot then
		for slot_counter = SavefileManager.CHARACTER_PROFILE_STARTING_SLOT, (SavefileManager.CHARACTER_PROFILE_STARTING_SLOT + SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT) - 1, 1 do
			if Global.savefile_manager.meta_data_list[slot_counter] and Global.savefile_manager.meta_data_list[slot_counter].cache and slot_counter ~= slot_to_delete then
				self._selected_character_slot = -1
				self._active_character_slot = -1
				self._slot_to_select = slot_counter
				new_slot = slot_counter

				break
			end
		end
	else
		self._selected_character_slot = -1
		self._slot_to_select = self._active_character_slot
		new_slot = self._active_character_slot
	end

	if new_slot == -1 then
		self._is_load_done = false
		self._is_render_done = false
		self._slots_loaded[11] = false
		self._slots_loaded[12] = false
		self._slots_loaded[13] = false
		self._slots_loaded[14] = false
		self._slots_loaded[15] = false
	end

	self._character_slot_to_delete = nil

	return 
end
function CharacterSelectionGui:update(t, dt)
	if not self._is_load_done and not self._is_render_done then
		self._is_load_done = true

		for slot_index = SavefileManager.CHARACTER_PROFILE_STARTING_SLOT, (SavefileManager.CHARACTER_PROFILE_STARTING_SLOT + SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT) - 1, 1 do
			if self._slots_loaded[slot_index] == false then
				if Global.savefile_manager.meta_data_list[slot_index].is_deleting and Global.savefile_manager.meta_data_list[slot_index].cache then
					self._is_load_done = false
					slot12 = nil

					managers.savefile._load(slot8, managers.savefile, slot_index, false)
				elseif Global.savefile_manager.meta_data_list[slot_index].is_deleting and not Global.savefile_manager.meta_data_list[slot_index].cache then
					Global.savefile_manager.meta_data_list[slot_index].is_deleting = nil
					self._is_load_done = true
					slot10 = slot_index

					self.destroy_character_unit(nil, self)

					slot10 = slot_index

					self.show_selected_character_details(nil, self)
				elseif Global.savefile_manager.meta_data_list and Global.savefile_manager.meta_data_list[slot_index] and Global.savefile_manager.meta_data_list[slot_index].is_cached_slot and Global.savefile_manager.meta_data_list[slot_index].cache then
					self._slots_loaded[slot_index] = true
				elseif Global.savefile_manager.meta_data_list and Global.savefile_manager.meta_data_list[slot_index] and not Global.savefile_manager.meta_data_list[slot_index].is_cached_slot and Global.savefile_manager.meta_data_list[slot_index].is_load_done then
					self._slots_loaded[slot_index] = true
				else
					self._is_load_done = false
				end
			end
		end
	end

	if not self._initialisation_done then
		self._initialisation_done = true
		self._is_load_done = false
		self._is_render_done = false
	end

	if self._is_load_done and not self._is_render_done then
		slot5 = self._characters_list

		self._characters_list.refresh_data(slot4)

		self._is_render_done = true
		slot7 = false

		self._characters_list.set_selected(slot4, self._characters_list, true)

		local last_selected_slot = self._slot_to_select

		if last_selected_slot ~= nil and last_selected_slot ~= -1 then
			slot7 = last_selected_slot

			self._activate_character_profile(slot5, self)
		end

		slot6 = self._characters_list

		if self._characters_list.selected_item(slot5) then
			slot8 = true

			self._characters_list.select_item_by_value(slot5, self._characters_list, last_selected_slot)
		end

		slot6 = managers.savefile

		if 0 < managers.savefile.get_active_characters_count(slot5) then
			slot7 = true

			managers.raid_menu.set_close_menu_allowed(slot5, managers.raid_menu)

			slot7 = last_selected_slot

			self._characters_list.activate_item_by_value(slot5, self._characters_list)
		else
			slot7 = false

			managers.raid_menu.set_close_menu_allowed(slot5, managers.raid_menu)
		end
	end

	return 
end
function CharacterSelectionGui:_bind_active_slot_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_top"
	slot7 = "_on_character_customize"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_left"
	slot7 = "_on_character_delete"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_delete",
			"menu_legend_character_customize"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end
function CharacterSelectionGui:_bind_inactive_slot_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_left"
	slot7 = "_on_character_delete"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_bottom"
	slot7 = "_on_character_select"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_delete",
			"menu_legend_character_select"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end
function CharacterSelectionGui:_bind_empty_slot_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_bottom"
	slot7 = "_on_character_create"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_character_create"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end
function CharacterSelectionGui:_on_character_customize()
	slot4 = "[CharacterSelectionGui:_on_character_customize]"

	Application.trace(slot2, Application)

	slot3 = self

	self._customize_character(slot2)

	return 
end
function CharacterSelectionGui:_on_character_delete()
	slot4 = "[CharacterSelectionGui:_on_character_delete]"

	Application.trace(slot2, Application)

	slot4 = self._selected_character_slot

	self._delete_character(slot2, self)

	return 
end
function CharacterSelectionGui:_on_character_select()
	slot4 = "[CharacterSelectionGui:_on_character_select]"

	Application.trace(slot2, Application)

	slot3 = self

	self.activate_selected_character(slot2)

	return 
end
function CharacterSelectionGui:_on_character_create()
	slot4 = "[CharacterSelectionGui:_on_character_create]"

	Application.trace(slot2, Application)

	slot3 = self

	self._create_character(slot2)

	return 
end

return 
