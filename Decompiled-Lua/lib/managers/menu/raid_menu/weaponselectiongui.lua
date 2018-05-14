-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not WeaponSelectionGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

WeaponSelectionGui = slot0
WeaponSelectionGui.CATEGORY_TABS_PADDING = 30
WeaponSelectionGui.CATEGORY_TABS_Y = 18
WeaponSelectionGui.SCREEN_STATE_WEAPON_LIST = "weapon_list"
WeaponSelectionGui.SCREEN_STATE_UPGRADE = "upgrade"
WeaponSelectionGui.WEAPON_EQUIP_SOUND = "weapon_upgrade_apply"
WeaponSelectionGui.WEAPON_ERROR_EQUIP_SOUND = "generic_fail_sound"
WeaponSelectionGui.TOGGLE_SWITCH_BINDING = {
	{
		"menu_enable_disable_scope",
		"BTN_X",
		"menu_controller_face_left"
	}
}
WeaponSelectionGui.TOGGLE_COSMETICS_BINDING = {
	{
		"menu_enable_disable_weapon_cosmetics",
		"BTN_DPAD_RIGHT",
		"menu_controller_dpad_right"
	}
}

local function f2s(value)
	slot3 = value * 10
	local value = math.floor(slot2) / 10

	if (value * 10) % 10 ~= 0 then
		slot4 = "%.0f"
		slot7 = value

		return string.format(slot3, tostring(slot6))
	else
		slot4 = value

		return tostring(slot3)
	end

	return 
end

function WeaponSelectionGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	WeaponSelectionGui.super.init(slot6, self, ws, fullscreen_ws, node)

	self._preloaded_weapon_part_names = {}
	slot8 = WeaponSelectionGui.SCREEN_STATE_WEAPON_LIST

	self._set_screen_state(slot6, self)

	slot7 = managers.raid_menu

	managers.raid_menu.hide_background(slot6)

	slot7 = managers.weapon_inventory
	self._cached_owned_melee_weapons = managers.weapon_inventory.get_owned_melee_weapons(slot6)

	return 
end
function WeaponSelectionGui:_setup_properties()
	slot3 = self

	WeaponSelectionGui.super._setup_properties(slot2)

	self._background = nil
	self._background_rect = nil

	return 
end
function WeaponSelectionGui:_set_initial_data()
	slot4 = "menu_header_weapons_screen_name"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)

	self._loading_units = {}
	self._loading_parts_units = {}

	return 
end
function WeaponSelectionGui:_set_screen_state(state)
	self._screen_state = state
	slot4 = managers.raid_menu
	slot9 = "back_pressed"

	managers.raid_menu.register_on_escape_callback(slot3, callback(slot6, self, self))

	return 
end
function WeaponSelectionGui:update(t, dt)
	return 
end
function WeaponSelectionGui:close()
	if self._parts_being_loaded then
		slot4 = self._parts_being_loaded

		managers.weapon_factory.disassemble(slot2, managers.weapon_factory)
	end

	if self._loading_units then
		slot3 = self._loading_units

		for unit_name, unit_loading_flag in pairs(slot2) do
			slot12 = unit_name
			slot12 = false

			managers.dyn_resource.unload(slot7, managers.dyn_resource, Idstring(slot10), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)
		end
	end

	slot4 = WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID

	managers.weapon_skills.deactivate_all_upgrades_for_bm_weapon_category_id(slot2, managers.weapon_skills)

	slot4 = WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID

	managers.weapon_skills.deactivate_all_upgrades_for_bm_weapon_category_id(slot2, managers.weapon_skills)

	local equipped_primary_weapon_id = managers.weapon_inventory.get_equipped_primary_weapon_id(slot2)
	local equipped_secondary_weapon_id = managers.weapon_inventory.get_equipped_secondary_weapon_id(managers.weapon_inventory)
	slot8 = WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE

	managers.weapon_skills.update_weapon_skills(managers.weapon_inventory, managers.weapon_skills, WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID, equipped_primary_weapon_id)

	slot8 = WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE

	managers.weapon_skills.update_weapon_skills(managers.weapon_inventory, managers.weapon_skills, WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID, equipped_secondary_weapon_id)

	slot5 = managers.player

	managers.player._internal_load(managers.weapon_inventory)

	slot5 = managers.challenge

	managers.challenge.deactivate_all_challenges(managers.weapon_inventory)

	slot8 = managers.blackmarket
	slot6 = managers.blackmarket.equipped_primary(equipped_secondary_weapon_id).weapon_id

	managers.weapon_skills.activate_current_challenges_for_weapon(managers.weapon_inventory, managers.weapon_skills)

	slot5 = managers.player
	slot5 = managers.player.local_player(managers.weapon_inventory)
	slot6 = PlayerStandard.IDS_EQUIP

	managers.player.local_player(managers.weapon_inventory).camera(managers.weapon_inventory).play_redirect(managers.weapon_inventory, managers.player.local_player(managers.weapon_inventory).camera(managers.weapon_inventory))

	slot5 = managers.weapon_skills

	managers.weapon_skills.update_weapon_part_animation_weights(managers.weapon_inventory)

	slot6 = nil

	self._rotate_weapon.set_unit(managers.weapon_inventory, self._rotate_weapon)

	slot5 = self

	self._enable_dof(managers.weapon_inventory)

	slot5 = self

	WeaponSelectionGui.super.close(managers.weapon_inventory)

	slot5 = self

	self.destroy_weapon_parts(managers.weapon_inventory)

	slot5 = self

	self.destroy_weapon(managers.weapon_inventory)

	slot6 = "mission_selection_gui"

	managers.hud.remove_updator(managers.weapon_inventory, managers.hud)

	slot6 = Global.savefile_manager.save_progress_slot

	managers.savefile.save_game(managers.weapon_inventory, managers.savefile)

	return 
end
function WeaponSelectionGui:_layout()
	slot3 = self

	WeaponSelectionGui.super._layout(slot2)

	slot3 = self

	self._disable_dof(slot2)

	slot3 = self

	self._layout_use_weapon_parts_as_cosmetics(slot2)

	slot3 = self

	self._layout_left_side_panels(slot2)

	slot3 = self

	self._layout_category_tabs(slot2)

	slot3 = self

	self._layout_lists(slot2)

	slot3 = self

	self._layout_weapon_stats(slot2)

	slot3 = self

	self._layout_equip_button(slot2)

	slot3 = self

	self._layout_skill_panel(slot2)

	slot3 = self

	self._layout_rotate_unit(slot2)

	slot3 = self

	self._layout_scope_switch(slot2)

	slot3 = self

	self._layout_available_points(slot2)

	slot3 = self

	self._layout_upgrade_button(slot2)

	slot3 = self

	self._layout_weapon_name(slot2)

	slot3 = self

	self.bind_controller_inputs_choose_weapon(slot2)

	slot4 = true

	self.set_weapon_select_allowed(slot2, self)

	slot5 = true

	self._weapon_list.set_selected(slot2, self._weapon_list, true)

	slot4 = WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID

	self.on_weapon_category_selected(slot2, self)

	return 
end
function WeaponSelectionGui:set_weapon_select_allowed(value)
	self._weapon_select_allowed = value
	slot5 = not value

	self._list_tabs.set_abort_selection(slot3, self._list_tabs)

	slot5 = not value

	self._weapon_list.set_abort_selection(slot3, self._weapon_list)

	return 
end
function WeaponSelectionGui:_layout_use_weapon_parts_as_cosmetics()
	local weapon_parts_toggle_params = {
		name = "toggle_weapon_parts",
		h = 66,
		w = 200,
		align = "right",
		text_align = "right",
		y = 120,
		x = 1200,
		layer = 1
	}
	slot6 = true
	weapon_parts_toggle_params.description = self.translate(slot3, self, "menu_enable_disable_weapon_cosmetics")
	slot6 = "on_toggle_weapon_parts_click"
	weapon_parts_toggle_params.on_click_callback = callback(slot3, self, self)
	slot5 = weapon_parts_toggle_params
	self._weapon_parts_toggle = self._root_panel.switch_button(slot3, self._root_panel)

	return 
end
function WeaponSelectionGui:_layout_left_side_panels()
	slot4 = {
		name = "weapon_selection_panel",
		h = 924,
		y = 96,
		w = 728,
		x = 0,
		layer = 1
	}
	self._weapon_selection_panel = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		visible = false,
		name = "weapon_skills_panel",
		h = 924,
		y = 96,
		w = 480,
		x = 0,
		layer = 1
	}
	self._weapon_skills_panel = self._root_panel.panel(slot2, self._root_panel)

	return 
end
function WeaponSelectionGui:_layout_category_tabs()
	local category_tabs_params = {
		tab_align = "center",
		name = "category_tabs",
		initial_tab_idx = 1,
		tab_height = 64,
		y = 0,
		x = 0
	}
	slot6 = "on_weapon_category_selected"
	category_tabs_params.on_click_callback = callback(slot3, self, self)
	category_tabs_params.parent_control_ref = self
	slot8 = true
	slot10 = {
		weapon_category = WeaponInventoryManager.CATEGORY_NAME_PRIMARY
	}
	slot8 = true
	slot10 = {
		weapon_category = WeaponInventoryManager.CATEGORY_NAME_SECONDARY
	}
	slot8 = true
	slot8 = true
	category_tabs_params.tabs_params = {
		{
			name = "tab_primary",
			text = self.translate(self, self, "menu_weapons_tab_category_primary"),
			breadcrumb = {
				check_callback = callback(self, managers.weapon_skills, managers.weapon_skills, "has_new_weapon_upgrades"),
				category = BreadcrumbManager.CATEGORY_WEAPON_PRIMARY
			},
			callback_param = WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID
		},
		{
			name = "tab_secondary",
			text = self.translate(BreadcrumbManager.CATEGORY_WEAPON_PRIMARY, self, "menu_weapons_tab_category_secondary"),
			breadcrumb = {
				check_callback = callback(self, managers.weapon_skills, managers.weapon_skills, "has_new_weapon_upgrades"),
				category = BreadcrumbManager.CATEGORY_WEAPON_SECONDARY
			},
			callback_param = WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID
		},
		{
			name = "tab_grenades",
			text = self.translate(BreadcrumbManager.CATEGORY_WEAPON_SECONDARY, self, "menu_weapons_tab_category_grenades"),
			callback_param = WeaponInventoryManager.BM_CATEGORY_GRENADES_ID
		},
		{
			name = "tab_melee",
			text = self.translate(BreadcrumbManager.CATEGORY_WEAPON_SECONDARY, self, "menu_weapons_tab_category_melee"),
			breadcrumb = {
				category = BreadcrumbManager.CATEGORY_WEAPON_MELEE
			},
			callback_param = WeaponInventoryManager.BM_CATEGORY_MELEE_ID
		}
	}
	slot5 = category_tabs_params
	self._list_tabs = self._weapon_selection_panel.tabs(, self._weapon_selection_panel)
	self._selected_weapon_category_id = WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID
	slot5 = {
		name = "equippable_filters_tabs",
		tab_width = 140,
		initial_tab_idx = 1,
		tab_align = "center",
		tab_height = 64,
		y = 54,
		x = 0,
		icon = tweak_data.gui.icons.ico_filter,
		item_class = RaidGUIControlTabFilter,
		on_click_callback = callback("menu_weapons_tab_category_melee", self, self),
		tabs_params = {
			{
				name = "tab_all",
				callback_param = "all",
				text = self.translate(self, self, "menu_filter_all")
			},
			{
				name = "tab_equippable",
				callback_param = "equippable",
				text = self.translate(self, self, "menu_weapons_filter_equippable")
			}
		}
	}
	slot10 = "on_click_filter_equippable"
	slot12 = true
	slot12 = true
	self._equippable_filters_tabs = self._weapon_selection_panel.tabs(, self._weapon_selection_panel)
	self._selected_filter = "all"

	return 
end
function WeaponSelectionGui:_layout_lists()
	local weapon_list_scrollable_area_params = {
		name = "weapon_list_scrollable_area",
		h = 456,
		y = 128,
		w = 448,
		x = 0,
		scroll_step = 19
	}
	slot5 = weapon_list_scrollable_area_params
	self._weapon_list_scrollable_area = self._weapon_selection_panel.scrollable_area(slot3, self._weapon_selection_panel)
	local weapon_list_params = {
		selection_enabled = true,
		name = "weapon_list",
		w = 448,
		on_mouse_over_sound_event = "highlight",
		on_mouse_click_sound_event = "weapon_click",
		y = 0,
		item_h = 62,
		x = 0,
		use_unlocked = false
	}
	slot7 = "on_item_clicked_weapon_list"
	weapon_list_params.on_item_clicked_callback = callback(self._weapon_selection_panel, self, self)
	slot7 = "on_item_selected_weapon_list"
	weapon_list_params.on_item_selected_callback = callback(self._weapon_selection_panel, self, self)
	slot7 = "on_item_double_click"
	weapon_list_params.on_item_double_clicked_callback = callback(self._weapon_selection_panel, self, self)
	slot7 = "data_source_weapon_list"
	weapon_list_params.data_source_callback = callback(self._weapon_selection_panel, self, self)
	weapon_list_params.item_class = RaidGUIControlListItemWeapons
	weapon_list_params.scrollable_area_ref = self._weapon_list_scrollable_area
	slot5 = self._weapon_list_scrollable_area
	slot6 = weapon_list_params
	self._weapon_list = self._weapon_list_scrollable_area.get_panel(self._weapon_selection_panel).list_active(self._weapon_selection_panel, self._weapon_list_scrollable_area.get_panel(self._weapon_selection_panel))

	return 
end
function WeaponSelectionGui:_layout_weapon_stats()
	local weapon_stats_params = {
		selection_enabled = false,
		name = "weapon_stats",
		tab_width = 160,
		y = 771,
		tab_height = 60,
		x = 550,
		label_class = RaidGUIControlLabelNamedValueWithDelta
	}
	slot6 = weapon_stats_params
	self._weapon_stats = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlWeaponStats)
	local melee_weapon_stats_params = {
		selection_enabled = false,
		name = "melee_weapon_stats",
		tab_width = 200,
		y = 771,
		tab_height = 60,
		x = 550,
		label_class = RaidGUIControlLabelNamedValue
	}
	slot7 = melee_weapon_stats_params
	self._melee_weapon_stats = self._root_panel.create_custom_control(self._root_panel, self._root_panel, RaidGUIControlMeleeWeaponStats)
	local grenade_weapon_stats_params = {
		selection_enabled = false,
		name = "grenade_weapon_stats",
		tab_width = 180,
		y = 771,
		tab_height = 60,
		x = 550,
		label_class = RaidGUIControlLabelNamedValue
	}
	slot8 = grenade_weapon_stats_params
	self._grenade_weapon_stats = self._root_panel.create_custom_control(self._root_panel, self._root_panel, RaidGUIControlGrenadeWeaponStats)

	return 
end
function WeaponSelectionGui:_layout_equip_button()
	local equip_button_params = {
		name = "equip_button",
		visible = false,
		y = 710,
		x = 0,
		layer = 1
	}
	slot6 = true
	equip_button_params.text = self.translate(slot3, self, "menu_weapons_equip")
	slot6 = "on_equip_button_click"
	equip_button_params.on_click_callback = callback(slot3, self, self)
	equip_button_params.on_click_sound = WeaponSelectionGui.WEAPON_EQUIP_SOUND
	slot5 = equip_button_params
	self._equip_button = self._weapon_selection_panel.short_primary_button(slot3, self._weapon_selection_panel)
	local equip_disabled_button_params = {
		name = "equip_disabled_button",
		visible = true,
		y = 710,
		x = 0,
		layer = 1
	}
	slot7 = true
	equip_disabled_button_params.text = self.translate(self._weapon_selection_panel, self, "menu_weapons_equipped")
	slot6 = equip_disabled_button_params
	self._equip_disabled_button = self._weapon_selection_panel.short_primary_button_disabled(self._weapon_selection_panel, self._weapon_selection_panel)
	local cant_equip_explanation_label_params = {
		y = 722,
		name = "cant_equip_explenation_label",
		h = 60,
		wrap = true,
		w = 520,
		align = "left",
		word_wrap = true,
		text = "",
		visible = false,
		x = 0,
		layer = 1,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_red
	}
	slot7 = cant_equip_explanation_label_params
	self._cant_equip_explanation_label = self._weapon_selection_panel.label(self._weapon_selection_panel, self._weapon_selection_panel)

	return 
end
function WeaponSelectionGui:_layout_skill_panel()
	local weapon_skills_params = {
		name = "weapon_skills",
		h = 440,
		y = 11,
		w = 448,
		x = 0,
		layer = 1
	}
	slot6 = "_on_mouse_enter_weapon_skill_button"
	weapon_skills_params.on_mouse_enter_callback = callback(slot3, self, self)
	slot6 = "_on_mouse_exit_weapon_skill_button"
	weapon_skills_params.on_mouse_exit_callback = callback(slot3, self, self)
	slot6 = "_on_selected_weapon_skill_callback"
	weapon_skills_params.on_selected_weapon_skill_callback = callback(slot3, self, self)
	slot6 = "_on_unselected_weapon_skill_callback"
	weapon_skills_params.on_unselected_weapon_skill_callback = callback(slot3, self, self)
	slot6 = "_on_click_weapon_skill_callback"
	weapon_skills_params.on_click_weapon_skill_callback = callback(slot3, self, self)
	slot6 = weapon_skills_params
	self._weapon_skills = self._weapon_skills_panel.create_custom_control(slot3, self._weapon_skills_panel, RaidGUIControlWeaponSkills)
	local skill_desc_params = {
		name = "skill_desc",
		h = 244,
		y = 447,
		x = 0,
		layer = 1
	}
	slot5 = self._weapon_skills_panel
	skill_desc_params.w = self._weapon_skills_panel.w(self._weapon_skills_panel)
	slot7 = skill_desc_params
	self._skill_desc = self._weapon_skills_panel.create_custom_control(self._weapon_skills_panel, self._weapon_skills_panel, RaidGUIControlWeaponSkillDesc)
	local apply_button_params = {
		name = "apply_button",
		y = 710,
		x = 0,
		layer = 1
	}
	slot8 = true
	apply_button_params.text = self.translate(self._weapon_skills_panel, self, "menu_weapons_apply")
	slot8 = "on_apply_button_click"
	apply_button_params.on_click_callback = callback(self._weapon_skills_panel, self, self)
	apply_button_params.on_click_sound = WeaponSelectionGui.WEAPON_EQUIP_SOUND
	slot7 = apply_button_params
	self._apply_button = self._weapon_skills_panel.short_primary_button(self._weapon_skills_panel, self._weapon_skills_panel)

	self._apply_button.disable(self._weapon_skills_panel)

	local available_points_skills_params = {
		w = 190,
		name = "available_points_skills",
		h = 64,
		value_align = "left",
		align = "left",
		visible = false,
		value_padding = 3,
		y = 590,
		x = 0,
		layer = 1
	}
	slot9 = true
	available_points_skills_params.text = self.translate(self._apply_button, self, "menu_available_points")
	slot8 = managers.weapon_skills
	available_points_skills_params.value = "" .. managers.weapon_skills.get_available_weapon_skill_points(self)
	available_points_skills_params.value_color = tweak_data.gui.colors.raid_red
	available_points_skills_params.value_font_size = tweak_data.gui.font_sizes.size_32
	available_points_skills_params.font_size = tweak_data.gui.font_sizes.medium
	slot8 = available_points_skills_params
	self._available_points_skills_label = self._weapon_skills_panel.label_named_value(managers.weapon_skills.get_available_weapon_skill_points(self), self._weapon_skills_panel)
	local upgrade_cost_params = {
		w = 190,
		name = "upgrade_cost",
		h = 64,
		value_align = "left",
		value = "00",
		align = "left",
		visible = false,
		value_padding = 3,
		y = 590,
		x = 200,
		layer = 1
	}
	slot10 = true
	upgrade_cost_params.text = self.translate(self._weapon_skills_panel, self, "menu_upgrade_cost")
	upgrade_cost_params.value_color = tweak_data.gui.colors.raid_red
	upgrade_cost_params.value_font_size = tweak_data.gui.font_sizes.size_32
	upgrade_cost_params.font_size = tweak_data.gui.font_sizes.medium
	slot9 = upgrade_cost_params
	self._upgrade_cost_label = self._weapon_skills_panel.label_named_value(self._weapon_skills_panel, self._weapon_skills_panel)

	return 
end
function WeaponSelectionGui:_layout_rotate_unit()
	local params_rotate_weapon = {
		x = 470,
		name = "rotate_weapon",
		h = 570,
		mouse_release_sound = "weapon_turn_stoped",
		w = 1220,
		mouse_over_sound = "weapon_mouse_over",
		sound_click_every_n_degrees = 10,
		y = 90,
		rotation_click_sound = "weapon_turn",
		mouse_click_sound = "weapon_click"
	}
	slot5 = params_rotate_weapon
	self._rotate_weapon = self._root_panel.rotate_unit(slot3, self._root_panel)

	return 
end
function WeaponSelectionGui:_layout_scope_switch()
	local scope_switch_params = {
		name = "scope_switch",
		h = 66,
		w = 192,
		align = "right",
		text_align = "right",
		y = 120,
		x = 1536,
		layer = 1
	}
	slot6 = true
	scope_switch_params.description = self.translate(slot3, self, "menu_enable_disable_scope")
	slot6 = "on_enable_scope_click"
	scope_switch_params.on_click_callback = callback(slot3, self, self)
	slot5 = scope_switch_params
	self._scope_switch = self._root_panel.switch_button(slot3, self._root_panel)

	return 
end
function WeaponSelectionGui:toggle_scope_switch()
	slot3 = self._scope_switch

	self._scope_switch.confirm_pressed(slot2)

	return 
end
function WeaponSelectionGui:toggle_weapon_parts()
	slot3 = self._weapon_parts_toggle

	self._weapon_parts_toggle.confirm_pressed(slot2)

	return 
end
function WeaponSelectionGui:_layout_available_points()
	local available_points_params = {
		w = 192,
		name = "available_points_label",
		h = 90,
		value_padding = 10,
		y = 672,
		x = 1536,
		layer = 1
	}
	slot6 = true
	available_points_params.text = self.translate(slot3, self, "menu_available_points")
	slot5 = managers.weapon_skills
	slot3 = managers.weapon_skills.get_available_weapon_skill_points(self)
	available_points_params.value = "" .. slot3
	available_points_params.value_color = tweak_data.gui.colors.raid_red
	slot5 = available_points_params
	self._available_points_label = self._root_panel.label_named_value(slot3, self._root_panel)
	slot4 = self._available_points_label

	self._available_points_label.hide(slot3)

	return 
end
function WeaponSelectionGui:_layout_upgrade_button()
	local upgrade_button_params = {
		name = "upgrade_button",
		y = 806,
		x = 1536,
		layer = 1
	}
	slot6 = true
	upgrade_button_params.text = self.translate(slot3, self, "menu_weapons_upgrade")
	slot6 = "on_upgrade_button_click"
	upgrade_button_params.on_click_callback = callback(slot3, self, self)
	slot5 = upgrade_button_params
	self._upgrade_button = self._root_panel.short_secondary_button(slot3, self._root_panel)
	slot4 = self._upgrade_button

	self._upgrade_button.hide(slot3)

	return 
end
function WeaponSelectionGui:_show_weapon_list_panel()
	slot3 = self._weapon_selection_panel

	self._weapon_selection_panel.show(slot2)

	slot3 = self._weapon_skills_panel

	self._weapon_skills_panel.hide(slot2)

	slot3 = self._upgrade_button

	self._upgrade_button.show(slot2)

	slot4 = WeaponSelectionGui.SCREEN_STATE_WEAPON_LIST

	self._set_screen_state(slot2, self)

	if self._preloaded_weapon_part_names and 1 < #self._preloaded_weapon_part_names then
		slot4 = self._selected_weapon_id
		local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(slot2, managers.weapon_factory)
		local weapon_part_names = tweak_data.weapon.factory[weapon_factory_id].uses_parts
		local weapon_part_unit_path = ""
		slot6 = weapon_part_names

		for _, weapon_part_name in ipairs(slot5) do
			if self._preloaded_weapon_part_names[weapon_part_name] then
				weapon_part_unit_path = tweak_data.weapon.factory.parts[weapon_part_name].unit
				slot15 = weapon_part_unit_path
				slot15 = false

				managers.dyn_resource.unload(slot10, managers.dyn_resource, Idstring(slot13), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)
			end
		end
	end

	slot3 = self

	self.bind_controller_inputs_choose_weapon(slot2)

	return 
end
function WeaponSelectionGui:_layout_weapon_name()
	local weapon_name_params = {
		name = "weapon_name",
		vertical = "bottom",
		h = 64,
		align = "right",
		text = "THOMPSON",
		y = 0,
		x = 1500
	}
	slot4 = self._root_panel
	weapon_name_params.w = self._root_panel.w(slot3) / 2
	weapon_name_params.color = tweak_data.gui.colors.raid_dirty_white
	weapon_name_params.font_size = tweak_data.gui.font_sizes.menu_list
	slot5 = weapon_name_params
	self._weapon_name_label = self._root_panel.label(slot3, self._root_panel)
	slot4 = self._weapon_name_label
	slot7 = self._root_panel

	self._weapon_name_label.set_right(slot3, self._root_panel.right(slot6))

	slot5 = 58

	self._weapon_name_label.set_bottom(slot3, self._weapon_name_label)

	return 
end
function WeaponSelectionGui:_update_scope_switch()
	slot5 = "can_use_scope"

	if managers.player.upgrade_value(slot2, managers.player, "player") == true then
		slot4 = self._selected_weapon_id
	else
		slot3 = self._scope_switch

		self._scope_switch.hide(slot2)
	end

	return 
end
function WeaponSelectionGui:on_toggle_weapon_parts_click()
	slot4 = "[WeaponSelectionGui:on_toggle_weapon_parts_click] "
	slot7 = self._weapon_parts_toggle

	Application.trace(slot2, Application, self._weapon_parts_toggle.get_value(slot6))

	slot3 = self._weapon_parts_toggle
	local is_toggle_button_active = self._weapon_parts_toggle.get_value(slot2)

	if self._selected_weapon_id then
		slot6 = is_toggle_button_active

		managers.weapon_skills.set_cosmetics_flag_for_weapon_id(slot3, managers.weapon_skills, self._selected_weapon_id)

		slot4 = self

		self._recreate_and_show_weapon_parts(slot3)
	end

	return 
end
function WeaponSelectionGui:on_weapon_category_selected(selected_category)
	if selected_category == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID or selected_category == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		slot4 = self._upgrade_button

		self._upgrade_button.show(slot3)
	else
		slot4 = self._upgrade_button

		self._upgrade_button.hide(slot3)

		slot4 = self._available_points_label

		self._available_points_label.hide(slot3)
	end

	slot4 = self

	self.destroy_weapon_parts(slot3)

	slot4 = self

	self.destroy_weapon(slot3)

	self._spawned_unit = nil
	self._selected_weapon_category_id = selected_category
	slot4 = self._weapon_list

	self._weapon_list.refresh_data(slot3)

	local weapon_id = self._get_weapon_id_from_selected_category(slot3)
	slot7 = true

	self._select_weapon(self, self, weapon_id)

	slot5 = self._weapon_list_scrollable_area

	self._weapon_list_scrollable_area.setup_scroll_area(self)

	slot5 = self

	self._upgrade_status(self)

	slot5 = self

	self._equip_weapon(self)

	return 
end
function WeaponSelectionGui:_get_weapon_id_from_selected_category()
	slot3 = self._weapon_list
	local data = self._weapon_list.get_data(slot2)
	local result = nil

	if data then
		slot5 = data

		for _, weapon_data in pairs(slot4) do
			if weapon_data.selected then
				result = weapon_data.value.weapon_id

				break
			end
		end
	end

	return result
end
function WeaponSelectionGui:on_click_filter_equippable(selected_filter)
	self._selected_filter = selected_filter
	slot4 = self._equip_button

	self._equip_button.hide(slot3)

	slot4 = self._equip_disabled_button

	self._equip_disabled_button.hide(slot3)

	slot4 = self._cant_equip_explanation_label

	self._cant_equip_explanation_label.hide(slot3)

	slot4 = self

	self._reselect_weapons_in_list(slot3)

	slot4 = self._weapon_list_scrollable_area

	self._weapon_list_scrollable_area.setup_scroll_area(slot3)

	return 
end
function WeaponSelectionGui:on_item_clicked_weapon_list(weapon_data)
	if not self._weapon_select_allowed then
		return 
	end

	slot6 = false

	self._select_weapon(slot3, self, weapon_data.value.weapon_id)

	return 
end
function WeaponSelectionGui:on_item_selected_weapon_list(weapon_data)
	if not self._weapon_select_allowed then
		return 
	end

	slot6 = false

	self._select_weapon(slot3, self, weapon_data.value.weapon_id)

	return 
end
function WeaponSelectionGui:on_item_double_click()
	slot3 = self

	self.on_equip_button_click(slot2)

	return 
end
function WeaponSelectionGui:data_source_weapon_list()
	local result = {}
	local temp_result = {}

	if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
		slot6 = WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID
		temp_result = managers.weapon_inventory.get_owned_weapons(slot4, managers.weapon_inventory)
	elseif self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		slot6 = WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID
		temp_result = managers.weapon_inventory.get_owned_weapons(slot4, managers.weapon_inventory)
	elseif self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		if not self._cached_owned_melee_weapons then
			slot5 = managers.weapon_inventory
			temp_result = managers.weapon_inventory.get_owned_melee_weapons(slot4)
		end
	elseif self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
		slot5 = managers.weapon_inventory
		temp_result = managers.weapon_inventory.get_owned_grenades(slot4)
	end

	local equipped_weapon_id = nil

	if temp_result then
		slot6 = temp_result

		for _, weapon_data in pairs(slot5) do
			if self._selected_filter == "all" or (self._selected_filter == "equippable" and weapon_data.unlocked) then
				if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID or self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
					local breadcrumb_category = nil

					if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID then
						breadcrumb_category = BreadcrumbManager.CATEGORY_WEAPON_PRIMARY
						slot12 = managers.weapon_inventory
						equipped_weapon_id = managers.weapon_inventory.get_equipped_primary_weapon_id(slot11)
					else
						breadcrumb_category = BreadcrumbManager.CATEGORY_WEAPON_SECONDARY
						slot12 = managers.weapon_inventory
						equipped_weapon_id = managers.weapon_inventory.get_equipped_secondary_weapon_id(slot11)
					end

					slot13 = self._selected_weapon_category_id
					local weapon_category = managers.weapon_inventory.get_weapon_category_name_by_bm_category_id(slot11, managers.weapon_inventory)
					local breadcrumb = nil

					if weapon_data.unlocked then
						slot18 = {
							weapon_category = weapon_category,
							weapon_id = weapon_data.weapon_id
						}
						breadcrumb = {
							check_callback = callback(slot14, managers.weapon_skills, managers.weapon_skills, "has_new_weapon_upgrades"),
							category = breadcrumb_category,
							identifiers = {
								weapon_data.weapon_id
							}
						}
					end

					if self._selected_weapon_id == weapon_data.weapon_id or equipped_weapon_id == weapon_data.weapon_id then
						slot15 = {
							selected = true,
							text = self.translate(slot17, self, tweak_data.weapon[weapon_data.weapon_id].name_id),
							value = weapon_data,
							breadcrumb = breadcrumb
						}
						slot20 = false

						table.insert(slot13, result)
					else
						slot15 = {
							text = self.translate(slot17, self, tweak_data.weapon[weapon_data.weapon_id].name_id),
							value = weapon_data,
							breadcrumb = breadcrumb
						}
						slot20 = false

						table.insert(slot13, result)
					end
				elseif self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
					slot11 = managers.weapon_inventory
					equipped_weapon_id = managers.weapon_inventory.get_equipped_melee_weapon_id(slot10)
					local breadcrumb = {
						category = BreadcrumbManager.CATEGORY_WEAPON_MELEE,
						identifiers = {
							weapon_data.weapon_id
						}
					}

					if self._selected_weapon_id == weapon_data.weapon_id or equipped_weapon_id == weapon_data.weapon_id then
						slot13 = {
							selected = true,
							text = self.translate(slot15, self, tweak_data.blackmarket.melee_weapons[weapon_data.weapon_id].name_id),
							value = weapon_data,
							breadcrumb = breadcrumb
						}
						slot18 = false

						table.insert(slot11, result)
					else
						slot13 = {
							text = self.translate(slot15, self, tweak_data.blackmarket.melee_weapons[weapon_data.weapon_id].name_id),
							value = weapon_data,
							breadcrumb = breadcrumb
						}
						slot18 = false

						table.insert(slot11, result)
					end
				elseif self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
					slot11 = managers.weapon_inventory
					equipped_weapon_id = managers.weapon_inventory.get_equipped_grenade_id(slot10)

					if self._selected_weapon_id == weapon_data.weapon_id or equipped_weapon_id == weapon_data.weapon_id then
						slot12 = {
							selected = true,
							text = self.translate(slot14, self, tweak_data.projectiles[weapon_data.weapon_id].name_id),
							value = weapon_data
						}
						slot17 = false

						table.insert(slot10, result)
					else
						slot12 = {
							text = self.translate(slot14, self, tweak_data.projectiles[weapon_data.weapon_id].name_id),
							value = weapon_data
						}
						slot17 = false

						table.insert(slot10, result)
					end
				end
			end
		end
	end

	if self._selected_weapon_category_id ~= WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		local class_name = managers.skilltree.get_character_profile_class(slot5)

		function slot8(l, r)
			slot6 = class_name
			local l_level = tweak_data.skilltree.get_weapon_unlock_level(slot3, tweak_data.skilltree, l.value.weapon_id) or 100000
			slot7 = class_name
			local r_level = tweak_data.skilltree.get_weapon_unlock_level(slot4, tweak_data.skilltree, r.value.weapon_id) or 100000

			if l_level ~= r_level then
				return l_level < r_level
			end

			return l.text < r.text
		end

		table.sort(managers.skilltree, result)

		return result
	end

	function slot7(l, r)
		if l.value.unlocked and not r.value.unlocked then
			return true
		elseif not l.value.unlocked and r.value.unlocked then
			return false
		end

		return l.text < r.text
	end

	table.sort(slot5, result)
end
function WeaponSelectionGui:on_equip_button_click()
	slot3 = self._weapon_list
	slot3 = self._weapon_list.selected_item(slot2)

	if self._weapon_list.selected_item(slot2).data(slot2).value.unlocked then
		slot4 = self._weapon_list
	else
		slot3 = self._weapon_list
		slot3 = self._weapon_list.selected_item(slot2)

		if not self._weapon_list.selected_item(slot2).data(slot2).value.unlocked then
			slot4 = WeaponSelectionGui.WEAPON_ERROR_EQUIP_SOUND

			managers.menu_component.post_event(slot2, managers.menu_component)
		end
	end

	return 
end
function WeaponSelectionGui:on_enable_scope_click()
	local checked = self._scope_switch.get_value(slot2)
	slot6 = checked

	managers.weapon_skills.set_player_using_scope(self._scope_switch, managers.weapon_skills, self._selected_weapon_id)

	local weapon_id = managers.weapon_inventory.get_equipped_primary_weapon_id(self._scope_switch)
	slot9 = true

	managers.weapon_skills.recreate_weapon_blueprint(managers.weapon_inventory, managers.weapon_skills, weapon_id, WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID, nil)

	slot5 = self

	self._recreate_and_show_weapon_parts(managers.weapon_inventory)

	slot5 = self

	self._equip_weapon(managers.weapon_inventory)

	return 
end
function WeaponSelectionGui:on_upgrade_button_click()
	if not self._weapon_select_allowed then
		return 
	end

	slot4 = self._selected_weapon_id
	local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(slot2, managers.weapon_factory)
	local weapon_part_names = tweak_data.weapon.factory[weapon_factory_id].uses_parts
	local weapon_part_unit_path = ""
	slot6 = weapon_part_names

	for _, weapon_part_name in ipairs(slot5) do
		weapon_part_unit_path = tweak_data.weapon.factory.parts[weapon_part_name].unit
		slot15 = weapon_part_unit_path
		slot14 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
		slot20 = weapon_part_name

		managers.dyn_resource.load(slot10, managers.dyn_resource, Idstring(slot13), Idstring("unit"), callback(slot16, self, self, "_on_weapon_part_unit_loaded"))
	end

	slot6 = self._weapon_selection_panel

	self._weapon_selection_panel.hide(slot5)

	slot6 = self._weapon_skills_panel

	self._weapon_skills_panel.show(slot5)

	slot6 = self._upgrade_button

	self._upgrade_button.hide(slot5)

	slot6 = self._available_points_label

	self._available_points_label.hide(slot5)

	slot7 = WeaponSelectionGui.SCREEN_STATE_UPGRADE

	self._set_screen_state(slot5, self)

	slot6 = self

	self.bind_controller_inputs_upgrade_weapon_upgrade_forbiden(slot5)

	slot7 = false

	self._weapon_list.set_selected(slot5, self._weapon_list)

	slot8 = self._selected_weapon_id

	self._weapon_skills.set_weapon(slot5, self._weapon_skills, self._selected_weapon_category_id)

	slot8 = false

	self._weapon_skills.set_selected(slot5, self._weapon_skills, true)

	slot6 = self

	self._refresh_available_points(slot5)

	slot6 = self._apply_button

	self._apply_button.disable(slot5)

	return 
end
function WeaponSelectionGui:on_apply_button_click()
	slot3 = self._apply_button

	self._apply_button.disable(slot2)

	local weapon_points_to_apply = self._weapon_skills.get_temp_points(slot2)
	slot4 = self._weapon_skills

	self._weapon_skills.apply_selected_skills(self._weapon_skills)

	slot5 = weapon_points_to_apply

	managers.statistics.spend_weapon_points(self._weapon_skills, managers.statistics)

	slot4 = managers.statistics

	managers.statistics.publish_camp_stats_to_steam(self._weapon_skills)

	return 
end
function WeaponSelectionGui:_on_click_weapon_skill_callback(button, data)
	slot8 = button._name
	slot11 = data

	Application.trace(slot4, Application, "[WeaponSelectionGui:_on_click_weapon_skill_callback] ", button._state, inspect(slot10))

	slot5 = button

	if button.get_state(slot4) == RaidGUIControlButtonWeaponSkill.STATE_NORMAL then
		slot7 = false

		self._remove_weapon_skill_from_temp_skills(slot4, self, data.value)

		slot5 = self._weapon_skills
		local selected_skills = self._weapon_skills.get_temp_skills(slot4)
		local selected_skill_count = 0
		slot7 = selected_skills

		for _ in pairs(data.value) do
			selected_skill_count = selected_skill_count + 1
		end

		if selected_skill_count == 0 then
			slot7 = managers.raid_menu

			if managers.raid_menu.is_pc_controller(slot6) then
				slot7 = self._apply_button

				self._apply_button.disable(slot6)
			else
				slot7 = self

				self.bind_controller_inputs_upgrade_weapon_upgrade_forbiden(slot6)
			end
		end
	else
		slot5 = button

		if button.get_state(slot4) == RaidGUIControlButtonWeaponSkill.STATE_SELECTED then
			slot7 = false

			self._add_weapon_skill_to_temp_skills(slot4, self, data.value)

			slot5 = managers.raid_menu

			if managers.raid_menu.is_pc_controller(slot4) then
				slot5 = self._apply_button

				self._apply_button.enable(slot4)
			else
				slot5 = self

				self.bind_controller_inputs_upgrade_weapon(slot4)
			end
		end
	end

	return 
end
function WeaponSelectionGui:_add_temp_points(value)
	local temp_weapon_points = self._weapon_skills.get_temp_points(slot3)
	temp_weapon_points = temp_weapon_points + value
	slot6 = temp_weapon_points

	self._weapon_skills.set_temp_points(self._weapon_skills, self._weapon_skills)

	return 
end
function WeaponSelectionGui:_refresh_available_points()
	local available_points = self._weapon_skills.get_available_points(slot2)
	slot5 = "" .. available_points

	self._available_points_skills_label.set_value(self._weapon_skills, self._available_points_skills_label)

	return 
end
function WeaponSelectionGui:_selected_weapon_skill_button(button, data, tier)
	if data and data.value then
		slot7 = data

		self._skill_desc.set_weapon_skill(slot5, self._skill_desc)
	end

	slot8 = true

	self._add_weapon_skill_to_temp_skills(slot5, self, data.value)

	slot6 = button
	local button_state = button.get_state(slot5)

	if button_state == RaidGUIControlButtonWeaponSkill.STATE_NORMAL or button_state == RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE or button_state == RaidGUIControlButtonWeaponSkill.STATE_CHALLENGE_ACTIVE or button_state == RaidGUIControlButtonWeaponSkill.STATE_BLOCKED then
		slot9 = self._selected_weapon_category_id
		local upgrade_level = managers.weapon_skills.get_weapon_skills_current_upgrade_level(slot6, managers.weapon_skills, data.value.skill_name)

		if 0 < upgrade_level then
			slot12 = WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE

			managers.weapon_skills.update_weapon_skill(slot7, managers.weapon_skills, data.value.skill_name, {
				value = upgrade_level
			}, self._selected_weapon_category_id)
		end

		slot12 = WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE

		managers.weapon_skills.update_weapon_skill(slot7, managers.weapon_skills, data.value.skill_name, data.value, self._selected_weapon_category_id)
	end

	slot8 = false

	self._update_weapon_stats(slot6, self)

	return 
end
function WeaponSelectionGui:_unselected_weapon_skill_button(button, data)
	slot5 = button
	local button_state = button.get_state(slot4)

	if button_state == RaidGUIControlButtonWeaponSkill.STATE_NORMAL or button_state == RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE or button_state == RaidGUIControlButtonWeaponSkill.STATE_CHALLENGE_ACTIVE or button_state == RaidGUIControlButtonWeaponSkill.STATE_BLOCKED then
		slot8 = true

		self._remove_weapon_skill_from_temp_skills(slot5, self, data.value)

		slot8 = self._selected_weapon_category_id
		local upgrade_level = managers.weapon_skills.get_weapon_skills_current_upgrade_level(slot5, managers.weapon_skills, data.value.skill_name)

		if 0 < upgrade_level then
			slot11 = WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE

			managers.weapon_skills.update_weapon_skill(slot6, managers.weapon_skills, data.value.skill_name, {
				value = upgrade_level
			}, self._selected_weapon_category_id)
		end

		slot10 = button
		slot8 = button.get_data(slot9).i_skill
		local weapon_skill_button = self._get_marked_row_skill_button(slot6, self)

		if weapon_skill_button then
			slot12 = weapon_skill_button
			slot12 = WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE

			managers.weapon_skills.update_weapon_skill(slot7, managers.weapon_skills, weapon_skill_button.get_data(slot10).value.skill_name, weapon_skill_button.get_data(weapon_skill_button).value, self._selected_weapon_category_id)
		end

		slot9 = false

		self._update_weapon_stats(slot7, self)
	end

	return 
end
function WeaponSelectionGui:_on_mouse_enter_weapon_skill_button(button, data)
	slot7 = data

	self._selected_weapon_skill_button(slot4, self, button)

	return 
end
function WeaponSelectionGui:_on_mouse_exit_weapon_skill_button(button, data)
	slot7 = data

	self._unselected_weapon_skill_button(slot4, self, button)

	return 
end
function WeaponSelectionGui:_on_selected_weapon_skill_callback(button, data, tier)
	slot8 = data

	self._selected_weapon_skill_button(slot5, self, button)

	return 
end
function WeaponSelectionGui:_on_unselected_weapon_skill_callback(button, data)
	slot7 = data

	self._unselected_weapon_skill_button(slot4, self, button)

	return 
end
function WeaponSelectionGui:_add_weapon_skill_to_temp_skills(data_value, view_part_only)
	slot5 = self._weapon_skills
	local temp_skills = self._weapon_skills.get_temp_skills(slot4)

	if view_part_only then
		slot8 = self._weapon_skills
		temp_skills = clone(self._weapon_skills.get_temp_skills(slot7))
	end

	temp_skills[data_value] = true
	slot7 = temp_skills

	self._recreate_and_show_weapon_parts(slot5, self)

	return 
end
function WeaponSelectionGui:_remove_weapon_skill_from_temp_skills(data_value, view_part_only)
	slot5 = self._weapon_skills
	local temp_skills = self._weapon_skills.get_temp_skills(slot4)

	if view_part_only then
		slot8 = self._weapon_skills
		temp_skills = clone(self._weapon_skills.get_temp_skills(slot7))
	end

	temp_skills[data_value] = nil
	slot7 = temp_skills

	self._recreate_and_show_weapon_parts(slot5, self)

	return 
end
function WeaponSelectionGui:_on_weapon_part_unit_loaded(params)
	self._preloaded_weapon_part_names[params] = true

	return 
end
function WeaponSelectionGui:_update_weapon_stats(reset_applied_stats)
	local result = {}
	slot5 = self._weapon_list
	slot5 = self._weapon_list.selected_item(slot4)
	local selected_weapon_data = self._weapon_list.selected_item(slot4).data(slot4).value
	local weapon_name = ""
	slot8 = self._selected_weapon_category_id
	local weapon_category = managers.weapon_inventory.get_weapon_category_by_weapon_category_id(slot6, managers.weapon_inventory)

	if weapon_category == WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME or weapon_category == WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME then
		local ammo_max_multiplier = 1

		if weapon_category == WeaponInventoryManager.BM_CATEGORY_PRIMARY_NAME then
			slot12 = 1
			ammo_max_multiplier = managers.player.upgrade_value(slot8, managers.player, "player", "primary_ammo_increase")
		elseif weapon_category == WeaponInventoryManager.BM_CATEGORY_SECONDARY_NAME then
			slot12 = 1
			ammo_max_multiplier = managers.player.upgrade_value(slot8, managers.player, "player", "secondary_ammo_increase")
		end

		slot13 = nil
		local base_stats, mods_stats, skill_stats = managers.weapon_inventory.get_weapon_stats(slot8, managers.weapon_inventory, selected_weapon_data.weapon_id, weapon_category, selected_weapon_data.slot)
		slot13 = skill_stats.damage.value
		local damage = f2s(weapon_category) + f2s(base_stats.damage.value)
		slot14 = skill_stats.magazine.value
		local magazine = f2s(base_stats.damage.value) + f2s(base_stats.magazine.value)
		local total_ammo = f2s(base_stats.magazine.value)
		slot16 = skill_stats.fire_rate.value
		local fire_rate = f2s(base_stats.totalammo.value * ammo_max_multiplier) + f2s(base_stats.fire_rate.value)
		slot17 = skill_stats.spread.value
		local accuracy = f2s(base_stats.fire_rate.value) + f2s(100 / (1 + tweak_data.weapon[selected_weapon_data.weapon_id].spread.steelsight))
		slot18 = skill_stats.recoil.value
		local stability = f2s(100 / (1 + tweak_data.weapon[selected_weapon_data.weapon_id].spread.steelsight)) + f2s(base_stats.recoil.value)

		if reset_applied_stats then
			slot19 = {
				damage_applied_value = damage,
				magazine_applied_value = magazine,
				total_ammo_applied_value = total_ammo,
				rate_of_fire_applied_value = fire_rate,
				accuracy_applied_value = accuracy,
				stability_applied_value = stability
			}

			self._weapon_stats.set_applied_stats(slot17, self._weapon_stats)
		end

		slot19 = {
			damage_modified_value = damage,
			magazine_modified_value = magazine,
			total_ammo_modified_value = total_ammo,
			rate_of_fire_modified_value = fire_rate,
			accuracy_modified_value = accuracy,
			stability_modified_value = stability
		}

		self._weapon_stats.set_modified_stats(slot17, self._weapon_stats)

		weapon_name = tweak_data.weapon[selected_weapon_data.weapon_id].name_id
	elseif weapon_category == WeaponInventoryManager.BM_CATEGORY_MELEE_NAME then
		slot9 = selected_weapon_data.weapon_id
		local base_stats, mods_stats, skill_stats = managers.weapon_inventory.get_melee_weapon_stats(slot7, managers.weapon_inventory)
		slot11 = base_stats.damage.min_value
		local damage = f2s(slot10) .. "-" .. f2s(slot12)
		slot12 = base_stats.damage_effect.min_value
		slot14 = base_stats.damage_effect.max_value
		local knockback = f2s(f2s(slot12)) .. "-" .. f2s(base_stats.damage.max_value)
		local range = f2s(f2s(base_stats.damage.max_value))
		local charge_time = f2s(base_stats.range.value)
		slot19 = charge_time

		self._melee_weapon_stats.set_stats(base_stats.charge_time.value, self._melee_weapon_stats, damage, knockback, range)

		weapon_name = tweak_data.blackmarket.melee_weapons[selected_weapon_data.weapon_id].name_id
	elseif weapon_category == WeaponInventoryManager.BM_CATEGORY_GRENADES_NAME then
		local proj_tweak_data = tweak_data.projectiles[selected_weapon_data.weapon_id]
		local damage = f2s(slot8)
		local range = f2s(proj_tweak_data.damage or 0)
		local distance = f2s(proj_tweak_data.range)
		weapon_name = proj_tweak_data.name_id
		slot15 = distance

		self._grenade_weapon_stats.set_stats(proj_tweak_data.launch_speed or 250, self._grenade_weapon_stats, damage, range)
	end

	slot8 = self._weapon_name_label
	slot13 = true

	self._weapon_name_label.set_text(slot7, self.translate(slot10, self, weapon_name))

	return 
end
function WeaponSelectionGui:_recreate_and_show_weapon_parts(temp_skills)
	local position = self._rotate_weapon.current_position(slot3)
	local rotation = self._rotate_weapon.current_rotation(self._rotate_weapon)
	slot10 = false
	local blueprint = managers.weapon_skills.recreate_weapon_blueprint(self._rotate_weapon, managers.weapon_skills, self._selected_weapon_id, self._weapon_category_id, temp_skills)
	slot9 = blueprint

	self._show_weapon(managers.weapon_skills, self, self._selected_weapon_id)

	slot8 = position

	self._rotate_weapon.set_position(managers.weapon_skills, self._rotate_weapon)

	slot8 = rotation

	self._rotate_weapon.set_rotation(managers.weapon_skills, self._rotate_weapon)

	return 
end
function WeaponSelectionGui:_get_marked_row_skill_button(i_skill)
	slot4 = self._weapon_skills
	local weapon_skills_row = self._weapon_skills.get_rows(slot3)[i_skill]
	local max_skill_value = 0
	local weapon_skill_button = nil

	if weapon_skills_row then
		slot7 = weapon_skills_row
		local skill_buttons = weapon_skills_row.get_skill_buttons(slot6)

		if skill_buttons then
			slot8 = skill_buttons

			for _, skill_button in pairs(slot7) do
				local button_data = skill_button.get_data(slot12)
				local button_state = skill_button.get_state(skill_button)
				slot15 = skill_button

				if skill_button.visible(skill_button) and (button_state == RaidGUIControlButtonWeaponSkill.STATE_ACTIVE or button_state == RaidGUIControlButtonWeaponSkill.STATE_SELECTED) and max_skill_value < button_data.value.value then
					max_skill_value = button_data.value.value
					weapon_skill_button = skill_button
				end
			end
		end
	end

	return weapon_skill_button
end
function WeaponSelectionGui:_equip_weapon()
	slot3 = self._weapon_list
	slot3 = self._weapon_list.selected_item(slot2)
	local selected_weapon_data = self._weapon_list.selected_item(slot2).data(slot2).value

	if not selected_weapon_data.unlocked then
		return 
	end

	slot6 = selected_weapon_data

	managers.weapon_inventory.equip_weapon(slot3, managers.weapon_inventory, self._selected_weapon_category_id)

	slot4 = managers.player

	managers.player._internal_load(slot3)

	slot4 = managers.player
	slot4 = managers.player.local_player(slot3)
	slot6 = true

	managers.player.local_player(slot3).inventory(slot3).equip_selection(slot3, managers.player.local_player(slot3).inventory(slot3), self._selected_weapon_category_id)

	slot4 = managers.player
	slot4 = managers.player.local_player(slot3)
	slot5 = PlayerStandard.IDS_EQUIP

	managers.player.local_player(slot3).camera(slot3).play_redirect(slot3, managers.player.local_player(slot3).camera(slot3))

	slot5 = Global.savefile_manager.save_progress_slot

	managers.savefile.save_game(slot3, managers.savefile)

	slot5 = selected_weapon_data

	self._weapon_list.activate_item_by_value(slot3, self._weapon_list)

	slot4 = self._equip_button

	self._equip_button.hide(slot3)

	slot4 = self._equip_disabled_button

	self._equip_disabled_button.show(slot3)

	slot5 = true

	self._update_weapon_stats(slot3, self)

	return 
end
function WeaponSelectionGui:_select_weapon(weapon_id, weapon_category_switched)

	-- Decompilation error in this vicinity:
	slot7 = weapon_id

	Application.trace(slot4, Application, "[WeaponSelectionGui:_select_weapon] weapon_id ")

	local old_weapon_id = self._selected_weapon_id
	local weapon_switched = self._selected_weapon_id ~= weapon_id
	self._selected_weapon_id = weapon_id
	slot8 = weapon_id
	local use_cosmetics = managers.weapon_skills.get_cosmetics_flag_for_weapon_id(slot6, managers.weapon_skills)
	slot10 = use_cosmetics

	Application.trace(managers.weapon_skills, Application, "[WeaponSelectionGui:_select_weapon] use_cosmetics ")

	if use_cosmetics == nil then
		slot8 = self._weapon_parts_toggle

		self._weapon_parts_toggle.hide(slot7)
	else
		slot8 = self._weapon_parts_toggle

		self._weapon_parts_toggle.show(slot7)

		slot9 = use_cosmetics

		self._weapon_parts_toggle.set_value_and_render(slot7, self._weapon_parts_toggle)
	end

	if weapon_category_switched then
		slot9 = self._selected_weapon_category_id

		managers.weapon_skills.deactivate_all_upgrades_for_bm_weapon_category_id(slot7, managers.weapon_skills)
	elseif not weapon_category_switched then
		slot11 = WeaponSkillsManager.UPGRADE_ACTION_DEACTIVATE

		managers.weapon_skills.update_weapon_skills(slot7, managers.weapon_skills, self._selected_weapon_category_id, old_weapon_id)
	end

	slot11 = WeaponSkillsManager.UPGRADE_ACTION_ACTIVATE

	managers.weapon_skills.update_weapon_skills(slot7, managers.weapon_skills, self._selected_weapon_category_id, self._selected_weapon_id)

	if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
		slot8 = self._weapon_stats

		self._weapon_stats.hide(slot7)

		slot8 = self._melee_weapon_stats

		self._melee_weapon_stats.hide(slot7)

		slot8 = self._grenade_weapon_stats

		self._grenade_weapon_stats.show(slot7)
	elseif self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		slot8 = self._weapon_stats

		self._weapon_stats.hide(slot7)

		slot8 = self._melee_weapon_stats

		self._melee_weapon_stats.show(slot7)

		slot8 = self._grenade_weapon_stats

		self._grenade_weapon_stats.hide(slot7)
	else
		slot8 = self._weapon_stats

		self._weapon_stats.show(slot7)

		slot8 = self._melee_weapon_stats

		self._melee_weapon_stats.hide(slot7)

		slot10 = weapon_id

		self._weapon_skills.set_weapon(slot7, self._weapon_skills, self._selected_weapon_category_id)

		slot8 = self._grenade_weapon_stats

		self._grenade_weapon_stats.hide(slot7)
	end

	if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID or self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		slot11 = weapon_switched

		self._show_weapon(slot7, self, weapon_id, nil)
	else
		slot9 = weapon_id

		self._show_unit(slot7, self)
	end

	slot9 = true

	self._update_weapon_stats(slot7, self)

	slot8 = self

	self._update_scope_switch(slot7)

	local selected_weapon = self._weapon_list.selected_item(slot7)
	slot9 = self._weapon_list

	if selected_weapon == self._weapon_list.get_active_item(self._weapon_list) then
		slot9 = self._equip_button

		self._equip_button.hide(slot8)

		slot9 = self._equip_disabled_button

		self._equip_disabled_button.show(slot8)

		slot9 = self._cant_equip_explanation_label

		self._cant_equip_explanation_label.hide(slot8)

		if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID or self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
			slot9 = self._upgrade_button

			self._upgrade_button.show(slot8)
		end
	else
		slot9 = selected_weapon

		if selected_weapon.data(slot8).value.unlocked then
			slot9 = self._equip_button

			self._equip_button.show(slot8)

			slot9 = self._equip_disabled_button

			self._equip_disabled_button.hide(slot8)

			slot9 = self._cant_equip_explanation_label

			self._cant_equip_explanation_label.hide(slot8)

			if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID or self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
				slot9 = self._upgrade_button

				self._upgrade_button.show(slot8)
			end
		else
			slot9 = self._equip_button

			self._equip_button.hide(slot8)

			slot9 = self._equip_disabled_button

			self._equip_disabled_button.hide(slot8)

			slot9 = self._upgrade_button

			self._upgrade_button.hide(slot8)

			if self._selected_weapon_category_id ~= WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
				local class_name = managers.skilltree.get_character_profile_class(slot8)
				local weapon_unlock_levels = tweak_data.skilltree.get_weapon_unlock_levels(managers.skilltree)
				slot11 = selected_weapon
				local weapon_id = selected_weapon.data(tweak_data.skilltree).value.weapon_id
				local level = weapon_unlock_levels[weapon_id][class_name]

				if level then
					slot13 = self._cant_equip_explanation_label
					slot20 = {
						LEVEL = level
					}

					self._cant_equip_explanation_label.set_text(slot12, utf8.to_upper(managers.localization.text(slot17, managers.localization, "menu_weapons_locked_higher_level")))
				else
					local classes = ""
					slot14 = weapon_unlock_levels[weapon_id]

					for class_name, _ in pairs(slot13) do
						slot22 = true
						classes = classes .. self.translate(slot19, self, "character_skill_tree_" .. class_name) .. ", "
					end

					slot16 = -3
					classes = string.sub(slot13, classes, 0)
					slot14 = self._cant_equip_explanation_label
					slot21 = {
						CLASSES = classes
					}

					self._cant_equip_explanation_label.set_text(slot13, utf8.to_upper(managers.localization.text(slot18, managers.localization, "menu_weapons_locked_wrong_class")))
				end
			else
				slot9 = self._cant_equip_explanation_label
				slot14 = true

				self._cant_equip_explanation_label.set_text(slot8, self.translate(slot11, self, "character_customization_locked_drop_label"))
			end

			slot9 = self._cant_equip_explanation_label

			self._cant_equip_explanation_label.show(slot8)
		end
	end

	slot9 = managers.weapon_skills
	local weapon_upgrade_tree = managers.weapon_skills.get_weapon_skills_skill_tree(slot8)[weapon_id]

	return 
end
function WeaponSelectionGui:_reselect_weapons_in_list()
	local selected_weapon_id = self._selected_weapon_id
	slot4 = self._weapon_list
	local selected_weapon_data = self._weapon_list.selected_item(slot3).data(slot3)
	slot5 = self._weapon_list
	slot5 = self._weapon_list.get_active_item(self._weapon_list.selected_item(slot3))
	local active_weapon_data = self._weapon_list.get_active_item(self._weapon_list.selected_item(slot3)).data(self._weapon_list.selected_item(slot3))
	local active_weapon_id = active_weapon_data.value.weapon_id
	slot7 = self._weapon_list

	self._weapon_list.refresh_data(slot6)

	slot8 = active_weapon_data.value

	self._weapon_list.select_item_by_value(slot6, self._weapon_list)

	slot7 = self

	self._equip_weapon(slot6)

	slot8 = selected_weapon_data.value

	self._weapon_list.select_item_by_value(slot6, self._weapon_list)

	return 
end
function WeaponSelectionGui:destroy_weapon()
	if self._spawned_unit then
		slot3 = self._spawned_unit

		if alive(slot2) then
			slot4 = 0

			self._spawned_unit.set_slot(slot2, self._spawned_unit)
		end
	end

	return 
end
function WeaponSelectionGui:destroy_weapon_parts()
	if self._spawned_weapon_parts then
		slot3 = self._spawned_weapon_parts

		for _, part in pairs(slot2) do
			slot8 = part.unit

			if alive(slot7) then
				slot9 = 0

				part.unit.set_slot(slot7, part.unit)
			end
		end
	end

	return 
end
function WeaponSelectionGui:pix_to_screen(px_x, px_y)
	local sx = (2 * px_x) / self._root_panel.w(slot5) - 1
	slot7 = self._root_panel
	local sy = (2 * px_y) / self._root_panel.h(self._root_panel) - 1

	return sx, sy
end
function WeaponSelectionGui:_show_weapon(weapon_id, pre_created_blueprint, weapon_switched)
	slot6 = self

	self.destroy_weapon_parts(slot5)

	if weapon_switched then
		slot6 = self

		self.destroy_weapon(slot5)
	end

	if not self._weapon_select_allowed then
		return 
	end

	slot7 = false

	self.set_weapon_select_allowed(slot5, self)

	local weapon_tweak_data = tweak_data.weapon[weapon_id]
	local rotation_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.rotation_offset) or 0
	local distance_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.distance_offset) or 0
	local height_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.height_offset) or 0
	local display_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.display_offset) or 0
	local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(slot10, managers.weapon_factory)
	local unit_path = tweak_data.weapon.factory[weapon_factory_id].unit
	slot13 = unit_path
	local unit_path_id = Idstring(weapon_id)
	self._loading_units[unit_path] = true
	slot17 = "unit"
	slot17 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
	slot23 = {
		weapon_tweak_data = weapon_tweak_data,
		rotation_offset = rotation_offset,
		distance_offset = distance_offset,
		height_offset = height_offset,
		display_offset = display_offset,
		weapon_factory_id = weapon_factory_id,
		unit_path = unit_path,
		unit_path_id = unit_path_id,
		weapon_switched = weapon_switched,
		weapon_id = weapon_id,
		pre_created_blueprint = pre_created_blueprint
	}

	managers.dyn_resource.load(true, managers.dyn_resource, Idstring(slot16), unit_path_id, callback(slot19, self, self, "_unit_loading_complete"))

	return 
end
function WeaponSelectionGui:_unit_loading_complete(params)
	self._loading_units[params.unit_path] = nil
	local camera = managers.viewport.get_current_camera(params.unit_path)
	slot5 = camera
	local direction_left = -camera.rotation(managers.viewport).x(managers.viewport)
	slot6 = camera
	local direction_forward = camera.rotation(camera.rotation(managers.viewport)).y(camera.rotation(managers.viewport))
	slot7 = camera
	local direction_up = camera.rotation(camera.rotation(camera.rotation(managers.viewport))).z(camera.rotation(camera.rotation(managers.viewport)))
	slot12 = self._rotate_weapon
	slot13 = self._rotate_weapon
	slot10 = self._rotate_weapon.y(self._rotate_weapon) + self._rotate_weapon.h(self._rotate_weapon) / 2
	local sx, sy = self.pix_to_screen(camera.rotation(camera.rotation(camera.rotation(managers.viewport))), self, self._rotate_weapon.x(slot10) + self._rotate_weapon.w(self._rotate_weapon) / 2)
	slot10 = camera
	slot15 = 200
	self._spawned_unit_position = camera.screen_to_world(self._rotate_weapon.x(slot10) + self._rotate_weapon.w(self._rotate_weapon) / 2, Vector3(self._rotate_weapon, sx, sy)) + direction_left * params.display_offset

	if params.weapon_switched or not self._spawned_unit then
		slot12 = self._spawned_unit_position
		slot17 = 0
		self._spawned_unit = World.spawn_unit(slot9, World, params.unit_path_id, Rotation(slot14, -90, 0))
	end

	self._spawned_unit_offset = direction_forward * params.rotation_offset
	slot11 = self._spawned_unit_position

	self._spawned_unit.set_position(slot9, self._spawned_unit)

	if params.weapon_tweak_data.gui and params.weapon_tweak_data.gui.initial_rotation then
		slot10 = self._spawned_unit
		slot15 = params.weapon_tweak_data.gui.initial_rotation.roll or 0

		self._spawned_unit.set_rotation(slot9, Rotation(slot12, params.weapon_tweak_data.gui.initial_rotation.yaw or -90, params.weapon_tweak_data.gui.initial_rotation.pitch or 0))
	end

	slot10 = self._spawned_unit
	slot11 = params.weapon_factory_id

	self._spawned_unit.base(slot9).set_factory_data(slot9, self._spawned_unit.base(slot9))

	slot10 = self._spawned_unit
	slot11 = nil

	self._spawned_unit.base(slot9).set_texture_switches(slot9, self._spawned_unit.base(slot9))

	slot12 = self._selected_weapon_category_id
	local selected_weapon_slot = managers.weapon_inventory.get_weapon_slot_by_weapon_id(slot9, managers.weapon_inventory, params.weapon_id)
	slot12 = self._selected_weapon_category_id
	local weapon_category = managers.weapon_inventory.get_weapon_category_by_weapon_category_id(managers.weapon_inventory, managers.weapon_inventory)

	if not params.pre_created_blueprint then
		slot14 = selected_weapon_slot
		local weapon_blueprint = managers.blackmarket.get_weapon_blueprint(slot11, managers.blackmarket, weapon_category)
	end

	slot14 = params.weapon_id
	local weapon_factory_id = managers.weapon_factory.get_factory_id_by_weapon_id(slot12, managers.weapon_factory)
	slot17 = weapon_factory_id
	local default_blueprint = clone(managers.weapon_factory.get_default_blueprint_by_factory_id(slot15, managers.weapon_factory))
	slot18 = default_blueprint
	default_blueprint = managers.weapon_skills.update_scope_in_blueprint(managers.weapon_factory.get_default_blueprint_by_factory_id, managers.weapon_skills, params.weapon_id, weapon_category)
	slot15 = self._weapon_parts_toggle
	local use_default_blueprint = not self._weapon_parts_toggle.get_value(managers.weapon_factory.get_default_blueprint_by_factory_id)
	weapon_blueprint = (not use_default_blueprint and weapon_blueprint) or default_blueprint
	slot25 = {
		weapon_factory_id = params.weapon_factory_id,
		weapon_blueprint = weapon_blueprint,
		direction_forward = direction_forward,
		distance_offset = params.distance_offset,
		direction_up = direction_up,
		height_offset = params.height_offset
	}
	slot21 = false
	local parts, blueprint = managers.weapon_factory.preload_blueprint(slot15, managers.weapon_factory, params.weapon_factory_id, weapon_blueprint, false, callback(slot21, self, self, "_preload_blueprint_completed"))
	self._parts_being_loaded = parts

	return 
end
function WeaponSelectionGui:_preload_blueprint_completed(params)
	slot13 = "_assemble_completed"
	slot10 = false
	local parts, blueprint = managers.weapon_factory.assemble_from_blueprint(slot3, managers.weapon_factory, params.weapon_factory_id, self._spawned_unit, params.weapon_blueprint, false, callback(slot10, self, self))
	self._spawned_weapon_parts = parts
	self._spawned_unit_screen_offset = params.direction_forward * params.distance_offset + params.direction_up * params.height_offset
	slot11 = self._spawned_unit_screen_offset

	self._rotate_weapon.set_unit(params.direction_up * params.height_offset, self._rotate_weapon, self._spawned_unit, self._spawned_unit_position, 90, self._spawned_unit_offset)

	return 
end
function WeaponSelectionGui:_assemble_completed()
	slot8 = self._spawned_unit_screen_offset

	self._rotate_weapon.set_unit(slot2, self._rotate_weapon, self._spawned_unit, self._spawned_unit_position, 90, self._spawned_unit_offset)

	slot4 = true

	self.set_weapon_select_allowed(slot2, self)

	self._parts_being_loaded = nil

	return 
end
function WeaponSelectionGui:_show_unit(weapon_id)
	slot4 = self

	self.destroy_weapon(slot3)

	local unit_path, weapon_tweak_data = nil

	if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_MELEE_ID then
		weapon_tweak_data = tweak_data.blackmarket.melee_weapons[weapon_id] or managers.blackmarket._defaults.melee_weapon
		unit_path = weapon_tweak_data.unit
	elseif self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_GRENADES_ID then
		weapon_tweak_data = tweak_data.projectiles[weapon_id]
		unit_path = weapon_tweak_data.unit_hand
	end

	if not unit_path then
		return 
	end

	slot6 = unit_path
	unit_path = Idstring(slot5)
	slot9 = "unit"
	slot10 = false

	managers.dyn_resource.load(slot5, managers.dyn_resource, Idstring(slot8), unit_path, DynamicResourceManager.DYN_RESOURCES_PACKAGE)

	local rotation_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.rotation_offset) or 0
	local distance_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.distance_offset) or 0
	local height_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.height_offset) or 0
	local display_offset = (weapon_tweak_data.gui and weapon_tweak_data.gui.display_offset) or 0
	local camera = managers.viewport.get_current_camera(slot9)
	local position = camera.position(managers.viewport)
	slot12 = camera
	local direction_left = -camera.rotation(camera).x(camera)
	slot13 = camera
	local direction_forward = camera.rotation(camera.rotation(camera)).y(camera.rotation(camera))
	slot14 = camera
	local direction_up = camera.rotation(camera.rotation(camera.rotation(camera))).z(camera.rotation(camera.rotation(camera)))
	slot19 = self._rotate_weapon
	slot20 = self._rotate_weapon
	slot17 = self._rotate_weapon.y(self._rotate_weapon) + self._rotate_weapon.h(self._rotate_weapon) / 2
	local sx, sy = self.pix_to_screen(camera.rotation(camera.rotation(camera.rotation(camera))), self, self._rotate_weapon.x(slot17) + self._rotate_weapon.w(self._rotate_weapon) / 2)
	slot17 = camera
	slot22 = 200
	self._spawned_unit_position = camera.screen_to_world(self._rotate_weapon.x(slot17) + self._rotate_weapon.w(self._rotate_weapon) / 2, Vector3(self._rotate_weapon, sx, sy)) + direction_left * display_offset
	slot19 = 0
	self._spawned_unit_position_temp = Vector3(direction_left * display_offset, 0, 0)
	local start_rot = nil

	if weapon_tweak_data.gui and weapon_tweak_data.gui.initial_rotation then
		slot20 = weapon_tweak_data.gui.initial_rotation.roll or 0
		start_rot = Rotation(slot17, weapon_tweak_data.gui.initial_rotation.yaw or -90, weapon_tweak_data.gui.initial_rotation.pitch or 0)
	end

	slot18 = World
	slot16 = World.spawn_unit
	slot19 = unit_path
	slot20 = self._spawned_unit_position_temp

	if not start_rot then
		slot25 = 0
		slot21 = Rotation(slot22, -90, 0)
	end

	self._spawned_unit = slot16(slot17, slot18, slot19, slot20)
	self._spawned_unit_offset = direction_forward * rotation_offset
	slot19 = self._spawned_unit_position

	self._spawned_unit.set_position(slot17, self._spawned_unit)

	self._spawned_unit_screen_offset = direction_forward * distance_offset + direction_up * height_offset
	slot23 = self._spawned_unit_screen_offset

	self._rotate_weapon.set_unit(direction_up * height_offset, self._rotate_weapon, self._spawned_unit, self._spawned_unit_position, 90, self._spawned_unit_offset)

	return 
end
function WeaponSelectionGui:_despawn_parts(parts)
	if parts then
		slot4 = parts

		for _, part in pairs(slot3) do
			slot9 = part.unit

			if alive(slot8) then
				slot10 = 0

				part.unit.set_slot(slot8, part.unit)
			end
		end
	end

	return 
end
function WeaponSelectionGui:bind_controller_inputs_choose_weapon()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_weapon_category_tab_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_weapon_category_tab_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_trigger_left"
	slot7 = "_on_equipable_tab_left"
	bindings[3] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_trigger_right"
	slot7 = "_on_equipable_tab_right"
	bindings[4] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_top"
	slot7 = "_on_upgrade_weapon_click"
	bindings[5] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_weapons_category",
			"menu_legend_weapons_equipable",
			"menu_legend_weapons_equip",
			"menu_legend_weapons_upgrade"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(self, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = self._scope_switch

	if self._scope_switch.visible() then
		slot5 = managers.localization
		local translated_text = managers.localization.get_default_macros(slot4)[WeaponSelectionGui.TOGGLE_SWITCH_BINDING[1][2]] .. " "
		slot5 = self.translate(slot6, self, WeaponSelectionGui.TOGGLE_SWITCH_BINDING[1][1])
		translated_text = translated_text .. slot5
		slot7 = {
			key = Idstring(true),
			callback = callback(true, self, self)
		}
		slot10 = WeaponSelectionGui.TOGGLE_SWITCH_BINDING[1][3]
		slot12 = "toggle_scope_switch"

		table.insert(slot5, bindings)

		slot7 = {
			translated_text = translated_text
		}

		table.insert(slot5, legend.controller)
	end

	slot5 = self._weapon_parts_toggle

	if self._weapon_parts_toggle.visible(slot4) then
		slot5 = managers.localization
		local translated_text = managers.localization.get_default_macros(slot4)[WeaponSelectionGui.TOGGLE_COSMETICS_BINDING[1][2]] .. " "
		slot5 = self.translate(slot6, self, WeaponSelectionGui.TOGGLE_COSMETICS_BINDING[1][1])
		translated_text = translated_text .. slot5
		slot7 = {
			key = Idstring(true),
			callback = callback(true, self, self)
		}
		slot10 = WeaponSelectionGui.TOGGLE_COSMETICS_BINDING[1][3]
		slot12 = "toggle_weapon_parts"

		table.insert(slot5, bindings)

		slot7 = {
			translated_text = translated_text
		}

		table.insert(slot5, legend.controller)
	end

	slot7 = true

	self.set_controller_bindings(slot4, self, bindings)

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end
function WeaponSelectionGui:bind_controller_inputs_choose_weapon_no_upgrade()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_weapon_category_tab_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_weapon_category_tab_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_trigger_left"
	slot7 = "_on_equipable_tab_left"
	bindings[3] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_trigger_right"
	slot7 = "_on_equipable_tab_right"
	bindings[4] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_weapons_category",
			"menu_legend_weapons_equipable",
			"menu_legend_weapons_equip"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(self, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = self._scope_switch

	if self._scope_switch.visible() then
		slot5 = managers.localization
		local translated_text = managers.localization.get_default_macros(slot4)[WeaponSelectionGui.TOGGLE_SWITCH_BINDING[1][2]] .. " "
		slot5 = self.translate(slot6, self, WeaponSelectionGui.TOGGLE_SWITCH_BINDING[1][1])
		translated_text = translated_text .. slot5
		slot7 = {
			key = Idstring(true),
			callback = callback(true, self, self)
		}
		slot10 = WeaponSelectionGui.TOGGLE_SWITCH_BINDING[1][3]
		slot12 = "toggle_scope_switch"

		table.insert(slot5, bindings)

		slot7 = {
			translated_text = translated_text
		}

		table.insert(slot5, legend.controller)
	end

	slot7 = true

	self.set_controller_bindings(slot4, self, bindings)

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end
function WeaponSelectionGui:bind_controller_inputs_upgrade_weapon()
	local bindings = {}
	slot5 = "menu_controller_face_top"
	slot7 = "_on_apply_weapon_skills_click"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_bottom"
	slot7 = "_on_select_weapon_skills_click"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_weapons_weapon_skill_select",
			"menu_legend_weapons_weapon_skill_apply"
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
function WeaponSelectionGui:bind_controller_inputs_upgrade_weapon_upgrade_forbiden()
	local bindings = {}

	self.set_controller_bindings(slot3, self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_weapons_weapon_skill_select"
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
function WeaponSelectionGui:_on_weapon_category_tab_left()
	slot3 = self._list_tabs

	self._list_tabs._move_left(slot2)

	return true, nil
end
function WeaponSelectionGui:_on_weapon_category_tab_right()
	slot3 = self._list_tabs

	self._list_tabs._move_right(slot2)

	return true, nil
end
function WeaponSelectionGui:_on_equipable_tab_left()
	slot3 = self._equippable_filters_tabs

	self._equippable_filters_tabs._move_left(slot2)

	return true, nil
end
function WeaponSelectionGui:_on_equipable_tab_right()
	slot3 = self._equippable_filters_tabs

	self._equippable_filters_tabs._move_right(slot2)

	return true, nil
end
function WeaponSelectionGui:_on_upgrade_weapon_click()
	slot3 = self

	self.on_upgrade_button_click(slot2)

	return true, nil
end
function WeaponSelectionGui:_on_apply_weapon_skills_click()
	slot3 = self

	self.on_apply_button_click(slot2)

	return true, nil
end
function WeaponSelectionGui:_on_select_weapon_skills_click()
	slot3 = self._weapon_skills

	self._weapon_skills.confirm_pressed(slot2)

	return true, nil
end
function WeaponSelectionGui:confirm_pressed()
	slot3 = self._weapon_selection_panel

	if self._weapon_selection_panel.visible(slot2) then
		self.on_equip_button_click(slot2, self, nil, nil)
	else
		slot3 = self._weapon_skills_panel

		if self._weapon_skills_panel.visible(slot2) then
			slot3 = self._weapon_skills

			self._weapon_skills.confirm_pressed(slot2)
		end
	end

	return true
end
function WeaponSelectionGui:_upgrade_status()
	if self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_PRIMARY_ID or self._selected_weapon_category_id == WeaponInventoryManager.BM_CATEGORY_SECONDARY_ID then
		slot3 = self

		self.bind_controller_inputs_choose_weapon(slot2)
	else
		slot3 = self

		self.bind_controller_inputs_choose_weapon_no_upgrade(slot2)
	end

	return 
end
function WeaponSelectionGui:back_pressed()
	slot3 = managers.raid_menu

	if not managers.raid_menu.is_pc_controller(slot2) then
		slot3 = self._weapon_selection_panel

		if self._weapon_selection_panel.visible(slot2) then
			slot4 = nil

			managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

			slot3 = managers.raid_menu

			managers.raid_menu.on_escape(slot2)
		else
			slot3 = self._weapon_skills_panel

			if self._weapon_skills_panel.visible(slot2) then
				slot3 = self

				self._show_weapon_list_panel(slot2)

				slot4 = true

				self._weapon_list.set_selected(slot2, self._weapon_list)

				slot4 = false

				self._weapon_skills.set_selected(slot2, self._weapon_skills)

				slot4 = self._selected_weapon_category_id

				self._weapon_skills.unacquire_all_temp_skills(slot2, self._weapon_skills)

				slot3 = self

				self._reselect_weapons_in_list(slot2)

				return true
			end
		end
	else
		slot3 = self._weapon_selection_panel

		if self._weapon_selection_panel.visible(slot2) then
		else
			slot3 = self._weapon_skills_panel

			if self._weapon_skills_panel.visible(slot2) then
				slot3 = self

				self._show_weapon_list_panel(slot2)

				slot4 = true

				self._weapon_list.set_selected(slot2, self._weapon_list)

				slot4 = false

				self._weapon_skills.set_selected(slot2, self._weapon_skills)

				slot4 = self._selected_weapon_category_id

				self._weapon_skills.unacquire_all_temp_skills(slot2, self._weapon_skills)

				slot3 = self

				self._reselect_weapons_in_list(slot2)

				return true
			end
		end

		return false
	end

	return 
end

return 
