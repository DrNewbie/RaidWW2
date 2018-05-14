if not CharacterCreationGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

CharacterCreationGui = slot0
CharacterCreationGui.STEP_TWO_INDICATOR_DEFAULT_X = 224
function CharacterCreationGui:init(ws, fullscreen_ws, node, component_name)
	self._loading_units = {}
	slot11 = component_name

	CharacterCreationGui.super.init(slot6, self, ws, fullscreen_ws, node)

	self._character_spawn_location = nil
	self._hardcore = false
	slot8 = "character_creation_title"

	self._node.components.raid_menu_header.set_screen_name(slot6, self._node.components.raid_menu_header)

	slot7 = self

	self._bind_controller_inputs(slot6)

	slot7 = managers.raid_menu

	managers.raid_menu.hide_background(slot6)

	return 
end
function CharacterCreationGui:_setup_properties()
	slot3 = self

	CharacterCreationGui.super._setup_properties(slot2)

	self._background = nil
	self._background_rect = nil

	return 
end
function CharacterCreationGui:_set_initial_data()
	slot3 = managers.character_customization

	managers.character_customization.reset_current_version_to_attach(slot2)

	slot5 = "_character_save_done_callback"
	self._character_save_done_callback_ref = callback(slot2, self, self)
	slot4 = self._character_save_done_callback_ref

	managers.savefile.add_save_done_callback(slot2, managers.savefile)

	return 
end
function CharacterCreationGui:_update_control_visibility()
	local show_class_controls = self._current_screen == "class"
	local show_nationality_screen = not show_class_controls
	slot5 = self._nationality_screen_controls

	for _, control in ipairs(slot4) do
		slot11 = show_nationality_screen

		control.set_visible(slot9, control)
	end

	slot5 = self._class_screen_controls

	for _, control in ipairs(slot4) do
		slot11 = show_class_controls

		control.set_visible(slot9, control)
	end

	local icon_data1, icon_data2 = nil

	if self._current_screen == "class" then
		icon_data1 = tweak_data.gui.icons.character_creation_1_large
		icon_data2 = tweak_data.gui.icons.character_creation_2_small
		slot8 = tweak_data.gui.colors.raid_dirty_white

		self._class_label.set_color(slot6, self._class_label)

		slot8 = tweak_data.gui.colors.raid_grey

		self._nationality_label.set_color(slot6, self._nationality_label)
	elseif self._current_screen == "nationality" then
		icon_data1 = tweak_data.gui.icons.character_creation_checked
		icon_data2 = tweak_data.gui.icons.character_creation_2_large
		slot8 = tweak_data.gui.colors.raid_red

		self._class_label.set_color(slot6, self._class_label)

		slot8 = tweak_data.gui.colors.raid_dirty_white

		self._nationality_label.set_color(slot6, self._nationality_label)
	else
		icon_data1 = tweak_data.gui.icons.character_creation_checked
		icon_data2 = tweak_data.gui.icons.character_creation_checked
		slot8 = tweak_data.gui.colors.raid_red

		self._class_label.set_color(slot6, self._class_label)

		slot8 = tweak_data.gui.colors.raid_red

		self._nationality_label.set_color(slot6, self._nationality_label)
	end

	slot8 = icon_data1.texture

	self._number_1.set_image(slot6, self._number_1)

	slot8 = icon_data1.texture_rect

	self._number_1.set_texture_rect(slot6, self._number_1)

	slot8 = icon_data2.texture

	self._number_2.set_image(slot6, self._number_2)

	slot8 = icon_data2.texture_rect

	self._number_2.set_texture_rect(slot6, self._number_2)

	return 
end
function CharacterCreationGui:_layout()
	self._loaded_weapons = {}
	slot3 = self

	self._disable_dof(slot2)

	self._selected_class = tweak_data.skilltree.base_classes[1]
	self._selected_nation = tweak_data.skilltree.classes[self._selected_class].default_natioanlity
	self._class_screen_controls = {}
	self._nationality_screen_controls = {}
	slot4 = {
		w = 416,
		name = "subtitle_profiles",
		h = 38,
		y = 96,
		x = 0,
		text = self.translate(slot6, self, "character_creation_subtitle"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot9 = true

	self._root_panel.label(self._selected_class, self._root_panel)

	slot4 = {
		w = 416,
		name = "subtitle_small_profile_class",
		h = 24,
		y = 144,
		x = 0,
		text = self.translate(slot6, self, "character_creation_subtitle_class"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	slot9 = true
	local subtitle_class = self._root_panel.label(self._selected_class, self._root_panel)
	slot5 = subtitle_class

	table.insert(self._root_panel, self._class_screen_controls)

	slot5 = {
		w = 416,
		name = "subtitle_small_profile_nationality",
		h = 24,
		y = 144,
		x = 0,
		text = self.translate(self, self, "character_creation_subtitle_nationality"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	slot10 = true
	local subtitle_nationality = self._root_panel.label(self._root_panel, self._root_panel)
	slot6 = subtitle_nationality

	table.insert(self._root_panel, self._nationality_screen_controls)

	slot6 = {
		selection_enabled = true,
		name = "class_list",
		h = 384,
		w = 416,
		vertical_spacing = 2,
		y = 224,
		item_h = 96,
		x = 0,
		item_class = RaidGUIControlListItemCharacterCreateClass,
		on_item_clicked_callback = callback(self, self, self),
		on_item_double_clicked_callback = callback(self, self, self),
		on_item_selected_callback = callback(self, self, self),
		data_source_callback = callback(self, self, self)
	}
	slot11 = "_on_class_click_callback"
	slot11 = "_on_click_button_next"
	slot11 = "_on_class_select_callback"
	slot11 = "_data_source_class_list"
	self._class_list = self._root_panel.list_active(self._root_panel, self._root_panel)
	slot6 = self._class_list

	table.insert(self._root_panel, self._class_screen_controls)

	slot6 = {
		selection_enabled = true,
		name = "nation_list",
		h = 384,
		w = 416,
		vertical_spacing = 2,
		y = 224,
		item_h = 96,
		x = 0,
		item_class = RaidGUIControlListItemCharacterCreateNation,
		on_item_clicked_callback = callback(self, self, self),
		on_item_double_clicked_callback = callback(self, self, self),
		on_item_selected_callback = callback(self, self, self),
		data_source_callback = callback(self, self, self)
	}
	slot11 = "_on_nation_click_callback"
	slot11 = "_on_click_button_next"
	slot11 = "_on_nation_select_callback"
	slot11 = "_data_source_nation_list"
	self._nation_list = self._root_panel.list_active(self._root_panel, self._root_panel)
	slot6 = self._nation_list

	table.insert(self._root_panel, self._nationality_screen_controls)

	local list_bottom = self._class_list.bottom(self._root_panel)
	slot7 = {
		w = 256,
		name = "label_your_selection",
		h = 24,
		x = 0,
		y = list_bottom + 64,
		text = self.translate(self, self, "character_creation_your_selection"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	local your_selection = self._root_panel.label(self._class_list, self._root_panel)
	local icon_data = tweak_data.gui.icons.character_creation_1_large
	local tex_rect = icon_data.texture_rect
	slot10 = {
		x = 0,
		y = your_selection.bottom(true) + 32,
		w = tex_rect[3],
		h = tex_rect[4],
		texture = icon_data.texture,
		texture_rect = tex_rect
	}
	slot13 = your_selection
	self._number_1 = self._root_panel.image(tweak_data.gui.colors.raid_grey, self._root_panel)
	slot10 = {
		w = 160,
		name = "class_label",
		h = 42,
		x = self._number_1.right(true) + 10,
		y = your_selection.bottom(true) + 40,
		text = self.translate(true, self, tweak_data.skilltree.classes[self._selected_class].name_id),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot13 = self._number_1
	slot13 = your_selection
	slot15 = true
	self._class_label = self._root_panel.label(tweak_data.gui.colors.raid_grey, self._root_panel)
	icon_data = tweak_data.gui.icons.character_creation_2_small
	tex_rect = icon_data.texture_rect
	slot10 = {
		x = CharacterCreationGui.STEP_TWO_INDICATOR_DEFAULT_X,
		y = your_selection.bottom(true) + 35,
		w = tex_rect[3],
		h = tex_rect[4],
		texture = icon_data.texture,
		texture_rect = tex_rect
	}
	slot13 = your_selection
	self._number_2 = self._root_panel.image(tweak_data.gui.colors.raid_grey, self._root_panel)
	slot10 = {
		w = 256,
		name = "nationality_label",
		h = 42,
		x = self._number_2.right(true) + 10,
		y = your_selection.bottom(true) + 40,
		text = self.translate(true, self, "character_profile_creation_" .. self._selected_nation),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot13 = self._number_2
	slot13 = your_selection
	self._nationality_label = self._root_panel.label(tweak_data.gui.colors.raid_grey, self._root_panel)
	slot9 = self._class_label
	local _, _, w, _ = self._class_label.text_rect(tweak_data.gui.colors.raid_grey)
	slot14 = w

	self._class_label.set_w(true, self._class_label)

	slot13 = self._number_2
	slot19 = self._class_label
	slot17 = self._class_label.right(slot18) + 20

	self._number_2.set_x(true, math.max(true, CharacterCreationGui.STEP_TWO_INDICATOR_DEFAULT_X))

	slot14 = self._number_2.right(true) + 10

	self._nationality_label.set_x(true, self._nationality_label)

	slot14 = {
		name = "next_button",
		w = 192,
		x = 0,
		y = list_bottom + 224,
		text = self.translate(self._number_2, self, "character_profile_next_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		on_click_callback = callback(self._number_2, self, self)
	}
	slot19 = true
	slot19 = "_on_click_button_next"
	self._next_button = self._root_panel.short_primary_button(true, self._root_panel)
	slot16 = {}
	self._right_side_info_class = self._root_panel.create_custom_control(true, self._root_panel, RaidGUIControlClassDescription, {
		visible = false,
		name = "right_side_info_panel",
		h = 830,
		y = 96,
		w = 416,
		x = 1408
	})
	slot13 = self._right_side_info_class
	slot16 = self._root_panel

	self._right_side_info_class.set_right(true, self._root_panel.right())

	slot14 = self._right_side_info_class

	table.insert(true, self._class_screen_controls)

	slot16 = {}
	self._right_side_info_nationality = self._root_panel.create_custom_control(true, self._root_panel, RaidGUIControlNationalityDescription, {
		visible = false,
		name = "right_side_info_panel",
		h = 800,
		y = 96,
		w = 416,
		x = 1408
	})
	slot13 = self._right_side_info_nationality
	slot16 = self._root_panel

	self._right_side_info_nationality.set_right(true, self._root_panel.right())

	slot14 = self._right_side_info_nationality

	table.insert(true, self._nationality_screen_controls)

	self._current_screen = "class"
	slot13 = self

	self._update_control_visibility(true)

	slot14 = true

	self._class_list.set_selected(true, self._class_list)

	slot14 = 1

	self._class_list.select_item_by_index(true, self._class_list)

	slot14 = self._selected_class

	self._class_list.activate_item_by_value(true, self._class_list)

	slot13 = self

	self._set_class_default_nationality(true)

	slot13 = self

	self._spawn_empty_character_skeleton(true)

	return 
end
function CharacterCreationGui:set_character_select_allowed(value)
	self._character_select_allowed = value
	slot5 = not value

	self._class_list.set_abort_selection(slot3, self._class_list)

	return 
end
function CharacterCreationGui:_set_class_default_nationality()
	self._selected_nation = tweak_data.skilltree.classes[self._selected_class].default_natioanlity
	slot3 = self._nationality_label
	slot8 = true

	self._nationality_label.set_text(self._selected_class, self.translate(slot5, self, "character_profile_creation_" .. self._selected_nation))

	slot4 = self._selected_nation

	self._nation_list.select_item_by_value(self._selected_class, self._nation_list)

	slot4 = self._selected_nation

	self._nation_list.activate_item_by_value(self._selected_class, self._nation_list)

	return 
end
function CharacterCreationGui:_on_nation_click_callback(data)
	if self._selected_nation == data.value then
		return 
	end

	self._selected_nation = data.value
	slot4 = self._nationality_label
	slot9 = true

	self._nationality_label.set_text(slot3, self.translate(slot6, self, "character_profile_creation_" .. self._selected_nation))

	slot4 = self

	self.show_selected_character_description(slot3)

	slot4 = self

	self.show_selected_character(slot3)

	if self._selected_nation == "american" then
		slot5 = "char_creation_rivet_intro"

		managers.menu_component.post_event(slot3, managers.menu_component)
	elseif self._selected_nation == "british" then
		slot5 = "char_creation_sterling_intro"

		managers.menu_component.post_event(slot3, managers.menu_component)
	elseif self._selected_nation == "russian" then
		slot5 = "char_creation_kurgan_intro"

		managers.menu_component.post_event(slot3, managers.menu_component)
	elseif self._selected_nation == "german" then
		slot5 = "char_creation_wolfgang_intro"

		managers.menu_component.post_event(slot3, managers.menu_component)
	end

	return 
end
function CharacterCreationGui:_on_nation_select_callback(data)
	if self._current_screen ~= "nationality" then
		return 
	end

	slot5 = data

	self._on_nation_click_callback(slot3, self)

	slot5 = data.value

	self._nation_list.activate_item_by_value(slot3, self._nation_list)

	return 
end
function CharacterCreationGui:_on_class_click_callback(data)
	if self._selected_class == data.value then
		return 
	end

	self._selected_class = data.value
	slot4 = self._class_label
	slot9 = true

	self._class_label.set_text(slot3, self.translate(slot6, self, tweak_data.skilltree.classes[self._selected_class].name_id))

	slot4 = self._class_label
	local _, _, w, _ = self._class_label.text_rect(slot3)
	slot9 = w

	self._class_label.set_w(self, self._class_label)

	slot8 = self._number_2
	slot14 = self._class_label
	slot12 = self._class_label.right(slot13) + 20

	self._number_2.set_x(self, math.max(slot10, CharacterCreationGui.STEP_TWO_INDICATOR_DEFAULT_X))

	slot11 = self._number_2
	slot9 = self._number_2.right(slot10) + 10

	self._nationality_label.set_x(self, self._nationality_label)

	slot8 = self

	self._set_class_default_nationality(self)

	slot8 = self

	self.show_selected_character_description(self)

	slot8 = self

	self.show_selected_character(self)

	if self._selected_class == "assault" then
		slot9 = "char_creation_assault_intro"

		managers.menu_component.post_event(slot7, managers.menu_component)
	elseif self._selected_class == "infiltrator" then
		slot9 = "char_creation_insurgent_intro"

		managers.menu_component.post_event(slot7, managers.menu_component)
	elseif self._selected_class == "recon" then
		slot9 = "char_creation_recon_intro"

		managers.menu_component.post_event(slot7, managers.menu_component)
	elseif self._selected_class == "demolitions" then
		slot9 = "char_creation_demolitions_intro"

		managers.menu_component.post_event(slot7, managers.menu_component)
	end

	return 
end
function CharacterCreationGui:_on_class_select_callback(data)
	if self._current_screen ~= "class" then
		return 
	end

	slot5 = data

	self._on_class_click_callback(slot3, self)

	slot5 = data.value

	self._class_list.activate_item_by_value(slot3, self._class_list)

	return 
end
function CharacterCreationGui:_data_source_nation_list()
	local nationalities = {}
	slot4 = tweak_data.skilltree.base_classes

	for _, class_name in pairs(slot3) do
		local nation_name = tweak_data.skilltree.classes[class_name].default_natioanlity
		slot11 = {
			text = utf8.to_upper(managers.localization.text(slot15, managers.localization)),
			value = nation_name,
			info = nation_name
		}
		slot17 = "menu_" .. nation_name

		table.insert(slot9, nationalities)
	end

	return nationalities
end
function CharacterCreationGui:_data_source_class_list()
	local classes = {}
	slot4 = tweak_data.skilltree.base_classes

	for _, class_name in pairs(slot3) do
		local char_class = tweak_data.skilltree.classes[class_name]
		slot11 = {
			text = utf8.to_upper(managers.localization.text(slot15, managers.localization)),
			value = char_class.name
		}
		slot17 = char_class.name_id

		table.insert(slot9, classes)
	end

	return classes
end
function CharacterCreationGui:_on_click_button_next()
	if self._current_screen == "class" then
		self._current_screen = "nationality"
		slot4 = true

		self._nation_list.set_selected(slot2, self._nation_list)

		slot4 = false

		self._class_list.set_selected(slot2, self._class_list)

		slot3 = self

		self._update_control_visibility(slot2)

		slot4 = tweak_data.skilltree.classes[self._selected_class].default_natioanlity

		self._nation_list.select_item_by_value(slot2, self._nation_list)

		slot3 = self

		self.show_selected_character_description(slot2)

		slot3 = managers.raid_menu
		slot8 = "back_pressed"

		managers.raid_menu.register_on_escape_callback(slot2, callback(self._selected_class, self, self))

		return true, nil
	elseif self._current_screen == "nationality" then
		self._current_screen = "name_entry"
		slot3 = self

		self._update_control_visibility(slot2)

		slot8 = "_callback_yes_function"
		slot4 = callback(slot5, self, self)
		slot9 = "_callback_no_function"

		self.show_character_create_input_textbox(slot2, self, callback(self, self, self))

		return true, nil
	end

	return 
end
function CharacterCreationGui:back_pressed()
	if self._current_screen == "nationality" then
		self._current_screen = "class"
		slot4 = false

		self._nation_list.set_selected(slot2, self._nation_list)

		slot4 = true

		self._class_list.set_selected(slot2, self._class_list)

		slot3 = self

		self._set_class_default_nationality(slot2)

		slot3 = self

		self._update_control_visibility(slot2)

		slot4 = self._selected_class

		self._class_list.select_item_by_value(slot2, self._class_list)

		slot3 = self

		self.show_selected_character_description(slot2)

		slot3 = self

		self.show_selected_character(slot2)

		slot4 = nil

		managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

		return true, nil
	else
		slot3 = managers.controller

		if managers.controller.is_xbox_controller_present(slot2) then
			slot4 = nil

			managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

			slot3 = managers.raid_menu

			managers.raid_menu.on_escape(slot2)
		end
	end

	return 
end
function CharacterCreationGui:on_click_character_name()
	slot3 = self

	self.input_focus(slot2)

	slot3 = self

	self._on_focus(slot2)

	return 
end
function CharacterCreationGui:show_selected_character_description()
	local right_side_info = (self._current_screen == "class" and self._right_side_info_class) or self._right_side_info_nationality
	slot5 = {
		level = 0,
		class_name = self._selected_class,
		nationality = self._selected_nation,
		class_stats = managers.skilltree.calculate_stats(slot7, managers.skilltree)
	}
	slot9 = self._selected_class

	right_side_info.set_data(slot3, right_side_info)

	return 
end
function CharacterCreationGui:show_selected_character()
	if self._spawned_character_unit then
		local anim_state_name = "character_creation_" .. tweak_data.skilltree.default_weapons[self._selected_class].primary
		slot7 = anim_state_name
		local state = self._spawned_character_unit.play_redirect(self._selected_class, Idstring(slot6))
		slot5 = self._spawned_character_unit
		slot6 = state

		self._spawned_character_unit.anim_state_machine(self._spawned_character_unit).set_parameter(self._spawned_character_unit, self._spawned_character_unit.anim_state_machine(self._spawned_character_unit))

		slot5 = self._spawned_character_unit
		slot5 = self._spawned_character_unit.customization(self._spawned_character_unit)

		self._spawned_character_unit.customization(self._spawned_character_unit).destroy_all_parts_on_character(self._spawned_character_unit)
	end

	slot4 = self._selected_nation

	self.show_selected_character_default_customization(slot2, self)

	return 
end
function CharacterCreationGui:_spawn_empty_character_skeleton()
	slot4 = false

	self.set_character_select_allowed(slot2, self)

	self._loading_units[CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT] = true
	slot7 = CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT
	slot6 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
	slot11 = "_spawn_empty_character_skeleton_loaded"

	managers.dyn_resource.load(CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT, managers.dyn_resource, Idstring(slot5), Idstring("unit"), callback(slot8, self, self))

	return 
end
function CharacterCreationGui:_spawn_empty_character_skeleton_loaded()
	self._loading_units[CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT] = nil
	slot3 = self

	self.get_character_spawn_location(CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT)

	if not self._spawned_character_unit then
		self._destroy_character_unit(slot2)

		local unit_name = CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT
		slot4 = self._character_spawn_location

		if not self._character_spawn_location.position(self) then
			slot6 = 0
			local position = Vector3(slot3, 0, 0)
		end

		slot7 = 0
		local rotation = Rotation(slot4, 45, 0)
		slot9 = unit_name
		slot9 = rotation
		self._spawned_character_unit = World.spawn_unit(45, World, Idstring(slot8), position)
	end

	slot3 = self

	self.show_selected_character_description(slot2)

	slot3 = self

	self.show_selected_character(slot2)

	slot3 = self

	self._load_class_default_weapons(slot2)

	slot4 = true

	self.set_character_select_allowed(slot2, self)

	return 
end
function CharacterCreationGui:get_character_spawn_location()
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

				break
			end
		end
	end

	return 
end
function CharacterCreationGui:close()
	if self._parts_being_loaded then
		slot3 = self._parts_being_loaded

		for _, parts in pairs(slot2) do
			slot9 = "[CharacterCreationGui][close] disassembling weapon parts "
			slot12 = parts

			Application.trace(slot7, Application, inspect(slot11))

			slot9 = parts

			managers.weapon_factory.disassemble(slot7, managers.weapon_factory)
		end
	end

	if self._loading_units then
		slot3 = self._loading_units

		for unit_name, _ in pairs(slot2) do
			Application.trace(slot7, Application, "[CharacterCreationGui][close] Unloading unit ")

			slot12 = unit_name
			slot12 = false

			managers.dyn_resource.unload(slot7, managers.dyn_resource, Idstring(unit_name), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)
		end
	end

	slot3 = self

	self._enable_dof(slot2)

	slot3 = self

	self._destroy_weapon_parts_and_weapon_units(slot2)

	slot3 = self

	self._destroy_character_unit(slot2)

	self._selected_character = nil
	self._selected_class = nil
	slot3 = managers.player

	if managers.player.local_player(slot2) then
		slot3 = managers.player

		managers.player._internal_load(slot2)

		slot3 = managers.player
		slot3 = managers.player.local_player(slot2)
		slot5 = false

		managers.player.local_player(slot2).inventory(slot2).equip_selection(slot2, managers.player.local_player(slot2).inventory(slot2), WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID)

		slot3 = managers.player
		slot3 = managers.player.local_player(slot2)
		slot4 = PlayerStandard.IDS_EQUIP

		managers.player.local_player(slot2).camera(slot2).play_redirect(slot2, managers.player.local_player(slot2).camera(slot2))
	end

	slot4 = self._character_save_done_callback_ref

	managers.savefile.remove_save_done_callback(slot2, managers.savefile)

	slot3 = managers.hud

	managers.hud.refresh_player_panel(slot2)

	slot3 = managers.network
	slot4 = "sync_character_level"
	slot7 = managers.experience

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), managers.experience.current_level(slot6))

	slot3 = managers.network
	slot5 = managers.skilltree.get_character_profile_class(slot6)
	slot8 = managers.player

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_character_class_nationality", managers.player.get_character_profile_nation(managers.skilltree))

	slot3 = self

	CharacterCreationGui.super.close(slot2)

	slot3 = managers.network

	managers.network.start_matchmake_attributes_update(slot2)

	slot3 = managers.weapon_skills

	managers.weapon_skills.update_weapon_part_animation_weights(slot2)

	return 
end
function CharacterCreationGui:show_selected_character_default_customization(nationality)
	slot4 = self._spawned_character_unit
	slot4 = self._spawned_character_unit.customization(slot3)

	self._spawned_character_unit.customization(slot3).destroy_all_parts_on_character(slot3)

	slot6 = CharacterCustomizationTweakData.PART_TYPE_HEAD
	local default_head = managers.character_customization.get_default_part_key_name(slot3, managers.character_customization, nationality)
	slot7 = CharacterCustomizationTweakData.PART_TYPE_UPPER
	local default_upper = managers.character_customization.get_default_part_key_name(managers.character_customization, managers.character_customization, nationality)
	slot8 = CharacterCustomizationTweakData.PART_TYPE_LOWER
	local default_lower = managers.character_customization.get_default_part_key_name(managers.character_customization, managers.character_customization, nationality)
	slot7 = managers.character_customization

	managers.character_customization.increase_current_version_to_attach(managers.character_customization)

	slot7 = self._spawned_character_unit
	slot11 = default_lower

	self._spawned_character_unit.customization(managers.character_customization).attach_all_parts_to_character_by_parts(managers.character_customization, self._spawned_character_unit.customization(managers.character_customization), nationality, default_head, default_upper)

	return 
end
function CharacterCreationGui:_destroy_character_unit()
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
function CharacterCreationGui:show_character_create_input_textbox(callback_yes_function, callback_no_function)
	slot5 = managers.savefile
	local slot_index = managers.savefile.get_create_character_slot(slot4)
	local params = {
		callback_yes = callback_yes_function,
		callback_no = callback_no_function
	}
	slot9 = true
	params.textbox_value = self.translate(slot6, self, "menu_" .. self._selected_nation) .. "_" .. slot_index - 10
	slot8 = params

	managers.menu.show_character_create_dialog("_", managers.menu)

	return 
end

function trim(s)
	slot5 = "%1"

	return s.gsub(slot2, s, "^%s*(.-)%s*$")
end

function character_name_exists(name)
	for slot_index = SavefileManager.CHARACTER_PROFILE_STARTING_SLOT, (SavefileManager.CHARACTER_PROFILE_STARTING_SLOT + SavefileManager.CHARACTER_PROFILE_SLOTS_COUNT) - 1, 1 do
		local slot_data = Global.savefile_manager.meta_data_list[slot_index]

		if slot_data and slot_data.cache then
			local character_name = slot_data.cache.PlayerManager.character_profile_name

			if character_name == name then
				return true
			end
		end
	end

	return false
end

function CharacterCreationGui:_callback_error_ok_function()
	self._should_show_character_create_input_textbox = true

	return 
end
function CharacterCreationGui:_callback_yes_function(button, button_data, data)
	slot6 = data.input_field_text
	local new_profile_name = trim(slot5)

	if new_profile_name == "" then
		local params = {
			textbox_id = "dialog_err_empty_character_name"
		}
		slot10 = "_callback_error_ok_function"
		params.callback_func = callback(slot7, self, self)
		slot9 = params

		managers.menu.show_err_character_name_dialog(slot7, managers.menu)

		return 
	else
		slot7 = new_profile_name

		if character_name_exists(slot6) then
			local params = {
				textbox_id = "dialog_err_duplicate_character_name"
			}
			slot10 = "_callback_error_ok_function"
			params.callback_func = callback(slot7, self, self)
			slot9 = params

			managers.menu.show_err_character_name_dialog(slot7, managers.menu)

			return 
		end
	end

	slot8 = new_profile_name

	self.create_new_character(slot6, self)

	return 
end
function CharacterCreationGui:_callback_no_function()
	self._current_screen = "nationality"
	slot3 = self

	self._update_control_visibility(slot2)

	slot3 = self._next_button

	self._next_button.enable(slot2)

	return 
end
function CharacterCreationGui:create_new_character(character_profile_name)
	local character_profile_nation = self._selected_nation
	local character_profile_base_class = self._selected_class
	local slot_index = managers.savefile.get_create_character_slot(slot5)
	slot8 = slot_index

	managers.savefile.set_save_progress_slot(managers.savefile, managers.savefile)

	slot7 = managers.savefile

	managers.savefile.reset_progress_managers(managers.savefile)

	slot8 = character_profile_name

	managers.player.set_character_profile_name(managers.savefile, managers.player)

	slot8 = false

	managers.player.set_is_character_profile_hardcore(managers.savefile, managers.player)

	slot8 = self._selected_nation

	managers.player.set_character_profile_nation(managers.savefile, managers.player)

	slot7 = managers.weapon_inventory

	managers.weapon_inventory.add_all_weapons_to_player_inventory(managers.savefile)

	slot8 = self._selected_class

	managers.skilltree.set_character_profile_base_class(managers.savefile, managers.skilltree)

	slot8 = self._selected_class

	managers.player.set_character_class(managers.savefile, managers.player)

	slot7 = managers.weapon_skills

	managers.weapon_skills.set_character_default_weapon_skills(managers.savefile)

	slot7 = managers.breadcrumb

	managers.breadcrumb.reset(managers.savefile)

	slot9 = 1

	managers.blackmarket.set_preferred_character(managers.savefile, managers.blackmarket, self._selected_nation)

	slot8 = self._selected_nation

	managers.character_customization.reaply_character_criminal(managers.savefile, managers.character_customization)

	slot7 = managers.network
	local local_peer = managers.network.session(managers.savefile).local_peer(managers.savefile)
	slot8 = managers.network
	slot14 = local_peer
	slot13 = local_peer._id

	managers.network.session(managers.network.session(managers.savefile)).send_to_peers_synched(managers.network.session(managers.savefile), managers.network.session(managers.network.session(managers.savefile)), "set_character_customization", local_peer._unit, managers.blackmarket.outfit_string(slot12), local_peer.outfit_version(managers.blackmarket))

	slot8 = managers.player
	slot8 = managers.player.local_player(managers.network.session(managers.savefile))
	slot8 = managers.player.local_player(managers.network.session(managers.savefile)).camera(managers.network.session(managers.savefile))
	slot8 = managers.player.local_player(managers.network.session(managers.savefile)).camera(managers.network.session(managers.savefile)).camera_unit(managers.network.session(managers.savefile))
	slot9 = character_profile_nation
	slot12 = managers.player

	managers.player.local_player(managers.network.session(managers.savefile)).camera(managers.network.session(managers.savefile)).camera_unit(managers.network.session(managers.savefile)).customizationfps(managers.network.session(managers.savefile)).attach_fps_hands(managers.network.session(managers.savefile), managers.player.local_player(managers.network.session(managers.savefile)).camera(managers.network.session(managers.savefile)).camera_unit(managers.network.session(managers.savefile)).customizationfps(managers.network.session(managers.savefile)), managers.player.get_customization_equiped_upper_name(managers.blackmarket.outfit_string(slot12)))

	if managers.raid_job._tutorial_spawned then
		slot8 = managers.player

		managers.player.tutorial_clear_all_ammo(slot7)
	end

	slot8 = managers.savefile
	slot11 = managers.savefile

	managers.savefile.save_game(slot7, managers.savefile.get_save_progress_slot(slot10))

	slot9 = "[CharacterCreationGui:create_new_character] managers.global_state.fire_character_created_event = true"

	Application.debug(slot7, Application)

	managers.global_state.fire_character_created_event = true

	return 
end
function CharacterCreationGui:_character_save_done_callback(slot, success, is_setting_slot, cache_only, aborted)
	slot8 = managers.savefile
	local saving_character_slot = managers.savefile.get_save_progress_slot(slot7)

	if saving_character_slot ~= slot then
		return 
	end

	slot9 = managers.savefile

	managers.savefile.save_last_selected_character_profile_slot(slot8)

	slot10 = true

	managers.raid_menu.set_close_menu_allowed(slot8, managers.raid_menu)

	slot9 = managers.statistics

	managers.statistics.create_character(slot8)

	slot9 = managers.statistics

	managers.statistics.publish_camp_stats_to_steam(slot8)

	slot9 = managers.player

	managers.player.sync_upgrades(slot8)

	slot9 = managers.raid_menu

	managers.raid_menu.on_escape(slot8)

	return 
end
function CharacterCreationGui:update(t, dt)
	if self._should_show_character_create_input_textbox then
		self._should_show_character_create_input_textbox = nil
		slot10 = "_callback_yes_function"
		slot6 = callback(slot7, self, self)
		slot11 = "_callback_no_function"

		self.show_character_create_input_textbox(slot4, self, callback(self, self, self))
	end

	local weapon_id = tweak_data.skilltree.default_weapons[self._selected_class].primary
	slot7 = weapon_id

	self._show_weapon(slot5, self)

	slot6 = managers.savefile

	if 0 < managers.savefile.get_active_characters_count(slot5) then
		slot7 = true

		managers.raid_menu.set_close_menu_allowed(slot5, managers.raid_menu)
	else
		slot7 = false

		managers.raid_menu.set_close_menu_allowed(slot5, managers.raid_menu)
	end

	return 
end
function CharacterCreationGui:_load_class_default_weapons()
	self._parts_being_loaded = {}
	slot3 = tweak_data.skilltree.default_weapons

	for _, data in pairs(slot2) do
		local weapon_id = data.primary
		slot10 = weapon_id
		local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(slot8, managers.weapon_factory)
		local unit_path = tweak_data.weapon.factory[weapon_factory_id].unit
		self._loading_units[unit_path] = true
		slot15 = unit_path
		slot14 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
		slot20 = {
			weapon_factory_id = weapon_factory_id,
			unit_path = unit_path,
			weapon_id = weapon_id
		}

		managers.dyn_resource.load(true, managers.dyn_resource, Idstring(slot13), Idstring("unit"), callback(slot16, self, self, "_weapon_unit_load_complete_callback"))
	end

	return 
end
function CharacterCreationGui:_weapon_unit_load_complete_callback(params)
	self._loading_units[params.unit_path] = nil
	slot7 = "a_weapon_right_front"
	local right_hand_locator = self._spawned_character_unit.get_object(params.unit_path, Idstring(slot6))
	slot5 = Idstring(slot6)
	slot6 = right_hand_locator.position(params.unit_path)
	slot11 = 0
	local weapon_unit = safe_spawn_unit(self._spawned_character_unit, slot5, Rotation(right_hand_locator, 0, 0))
	slot9 = "a_weapon_right_front"
	slot8 = weapon_unit
	slot11 = weapon_unit
	slot11 = weapon_unit.orientation_object(0)

	self._spawned_character_unit.link(slot5, self._spawned_character_unit, Idstring(right_hand_locator), weapon_unit.orientation_object(0).name(0))

	slot8 = params.weapon_id
	local weapon_blueprint = managers.weapon_inventory.get_weapon_default_blueprint(slot5, managers.weapon_inventory, WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID)
	self._loaded_weapons[params.weapon_id] = {}
	slot17 = {
		weapon_id = params.weapon_id
	}
	slot13 = true
	local parts, blueprint = managers.weapon_factory.assemble_from_blueprint(params.weapon_id, managers.weapon_factory, params.weapon_factory_id, weapon_unit, weapon_blueprint, true, callback(slot13, self, self, "_assemble_completed"))
	self._parts_being_loaded[params.weapon_id] = parts
	slot10 = weapon_unit

	table.insert(params.weapon_id, self._loaded_weapons[params.weapon_id])

	slot10 = false

	weapon_unit.set_visible(params.weapon_id, weapon_unit)

	return 
end
function CharacterCreationGui:_assemble_completed(params, parts, blueprint)
	self._parts_being_loaded[params.weapon_id] = nil

	if self._loaded_weapons then
		slot6 = parts

		for _, part in pairs(slot5) do
			slot12 = part.unit

			table.insert(slot10, self._loaded_weapons[params.weapon_id])

			slot12 = false

			part.unit.set_visible(slot10, part.unit)
		end
	end

	return 
end
function CharacterCreationGui:_show_weapon(weapon_id)
	if not self._loaded_weapons then
		return 
	end

	slot4 = self._loaded_weapons

	for wpn_id, wpn_units in pairs(slot3) do
		local visible = wpn_id == weapon_id
		slot10 = wpn_units

		for _, unit in ipairs(slot9) do
			slot16 = visible

			unit.set_visible(slot14, unit)
		end
	end

	return 
end
function CharacterCreationGui:_destroy_weapon_parts_and_weapon_units()
	slot3 = self._loaded_weapons

	for wpn_id, wpn_units in pairs(slot2) do
		slot8 = wpn_units

		for _, unit in ipairs(slot7) do
			slot13 = unit

			if alive(slot12) then
				slot14 = 0

				unit.set_slot(slot12, unit)

				unit = nil
			end
		end
	end

	self._loaded_weapons = nil

	return 
end
function CharacterCreationGui:_bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_bottom"
	slot7 = "_on_click_button_next"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_right"
	slot7 = "back_pressed"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
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

return 
