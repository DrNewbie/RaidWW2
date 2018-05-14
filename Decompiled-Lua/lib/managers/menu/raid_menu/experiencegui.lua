if not ExperienceGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

ExperienceGui = slot0
ExperienceGui.CHARACTER_BASE_INFO_Y = 0
ExperienceGui.CHARACTER_BASE_INFO_W = 352
ExperienceGui.CHARACTER_BASE_INFO_H = 96
ExperienceGui.INFO_ICON_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_24
ExperienceGui.CHARACTER_LEVEL_LABEL_FONT_SIZE = tweak_data.gui.font_sizes.size_56
ExperienceGui.CHARACTER_LEVEL_LABEL_FONT_COLOR = tweak_data.gui.colors.raid_grey
ExperienceGui.SKILLTREE_X = 0
ExperienceGui.SKILLTREE_Y = 128
ExperienceGui.SKILL_DETAILS_X = 0
ExperienceGui.SKILL_DETAILS_Y = 592
ExperienceGui.RESPEC_X = 1168
ExperienceGui.RESPEC_Y = 592
ExperienceGui.RESPEC_INSUFFICIENT_X = 1526
ExperienceGui.RESPEC_UNAVAILABLE_X = 1576
ExperienceGui.CLASS_INFO_H = 96
ExperienceGui.CLASS_ICON_H = 64
ExperienceGui.CLASS_INFO_TEXT_H = 32
ExperienceGui.NATIONALITY_INFO_W = 128
ExperienceGui.NATIONALITY_INFO_H = 96
ExperienceGui.NATIONALITY_ICON_H = 64
ExperienceGui.NATIONALITY_INFO_TEXT_H = 32
ExperienceGui.LEVEL_INFO_W = 64
ExperienceGui.LEVEL_INFO_H = 96
ExperienceGui.LEVEL_INFO_TEXT_H = 32
ExperienceGui.INFO_ICONS_PADDING = 32
ExperienceGui.APPLY_BUTTON_CENTER_Y = 864
ExperienceGui.CLEAR_BUTTON_X = 256
ExperienceGui.CLEAR_BUTTON_CENTER_Y = 864
ExperienceGui.RESPEC_BUTTON_X = 1520
ExperienceGui.RESPEC_BUTTON_CENTER_Y = 864
ExperienceGui.STAT_LEVEL_ACTIVE = "stat_level_active"
ExperienceGui.STAT_LEVEL_INACTIVE = "stat_level_inactive"
ExperienceGui.STAT_LEVEL_PENDING = "stat_level_pending"
ExperienceGui.STATS_W = 560
ExperienceGui.STATS_H = 160
ExperienceGui.STATS_CENTER_Y = 750
ExperienceGui.SINGLE_STAT_W = 256
function ExperienceGui:init(ws, fullscreen_ws, node, component_name)
	self._closing = false
	slot11 = component_name

	ExperienceGui.super.init(slot6, self, ws, fullscreen_ws, node)

	self._activated_skills = {}
	local character_class = managers.skilltree.get_character_profile_class(slot6)
	slot13 = true
	slot15 = true
	slot9 = self.translate(node, self, "menu_skill_screen_title") .. " - " .. self.translate("menu_skill_screen_title", self, "skill_class_" .. character_class .. "_name")

	self._node.components.raid_menu_header.set_screen_name_raw(managers.skilltree, self._node.components.raid_menu_header)

	slot8 = self

	self._refresh_stats(managers.skilltree)

	return 
end
function ExperienceGui:_set_initial_data()
	return 
end
function ExperienceGui:_layout()
	slot3 = self

	ExperienceGui.super._layout(slot2)

	slot3 = self

	self._layout_character_base_info(slot2)

	slot3 = self

	self._layout_skilltree(slot2)

	slot3 = self

	self._layout_skill_details(slot2)

	slot3 = self

	self._layout_respec(slot2)

	slot3 = self

	self._layout_character_overview(slot2)

	slot3 = self

	self._layout_buttons(slot2)

	slot3 = self

	self._layout_stats(slot2)

	slot4 = true

	self._skilltrack_progress_bar.set_selected(slot2, self._skilltrack_progress_bar)

	slot3 = self

	self.bind_controller_inputs_initial_state(slot2)

	slot3 = self

	self._calculate_respec_visibility(slot2)

	return 
end
function ExperienceGui:_layout_character_base_info()
	local base_info_panel_params = {
		name = "character_base_info_panel",
		x = 0,
		y = ExperienceGui.CHARACTER_BASE_INFO_Y,
		w = ExperienceGui.CHARACTER_BASE_INFO_W,
		h = ExperienceGui.CHARACTER_BASE_INFO_H
	}
	slot5 = base_info_panel_params
	self._character_base_info_panel = self._root_panel.panel(slot3, self._root_panel)
	slot4 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(slot3)
	local class_icon_params = {
		name = "class_icon",
		y = 0,
		x = 0,
		h = ExperienceGui.CLASS_INFO_H,
		text_h = ExperienceGui.CLASS_INFO_TEXT_H,
		icon = "ico_class_" .. character_class,
		icon_h = ExperienceGui.CLASS_ICON_H,
		icon_color = Color.white,
		text = self.translate(character_class, self, "skill_class_" .. character_class .. "_name"),
		text_size = ExperienceGui.INFO_ICON_TEXT_FONT_SIZE,
		text_color = ExperienceGui.CHARACTER_LEVEL_LABEL_FONT_COLOR
	}
	slot7 = class_icon_params
	self._class_icon = self._character_base_info_panel.info_icon(character_class, self._character_base_info_panel)
	slot6 = self._class_icon
	slot9 = self._character_base_info_panel

	self._class_icon.set_bottom(character_class, self._character_base_info_panel.h(true))

	slot6 = managers.player
	local character_nationality = managers.player.get_character_profile_nation(character_class)
	local nationality_icon_params = {
		x = 0,
		name = "nationality_icon",
		y = 0,
		w = ExperienceGui.NATIONALITY_INFO_W,
		h = ExperienceGui.NATIONALITY_INFO_H,
		text_h = ExperienceGui.NATIONALITY_INFO_TEXT_H,
		icon = "ico_flag_" .. character_nationality,
		icon_h = ExperienceGui.NATIONALITY_ICON_H,
		icon_color = Color.white,
		text = self.translate(character_nationality, self, "nationality_" .. character_nationality),
		text_size = RaidGUIControlPeerDetails.ICON_FONT_SIZE,
		text_size = ExperienceGui.INFO_ICON_TEXT_FONT_SIZE,
		text_color = ExperienceGui.CHARACTER_LEVEL_LABEL_FONT_COLOR
	}
	slot9 = nationality_icon_params
	self._nationality_icon = self._character_base_info_panel.info_icon(character_nationality, self._character_base_info_panel)
	slot8 = self._nationality_icon
	slot11 = self._character_base_info_panel

	self._nationality_icon.set_bottom(character_nationality, self._character_base_info_panel.h(true))

	slot8 = managers.experience
	local character_level = managers.experience.current_level(character_nationality)
	local level_icon_params = {
		name = "level_icon",
		y = 0,
		x = 0,
		w = ExperienceGui.LEVEL_INFO_W,
		h = ExperienceGui.LEVEL_INFO_H,
		text_h = ExperienceGui.LEVEL_INFO_TEXT_H
	}
	slot10 = character_level
	level_icon_params.title = tostring(self._character_base_info_panel.h)
	level_icon_params.title_size = ExperienceGui.CHARACTER_LEVEL_LABEL_FONT_SIZE
	level_icon_params.title_color = Color.white
	level_icon_params.text = self.translate(self._character_base_info_panel.h, self, "menu_level_label")
	level_icon_params.text_size = ExperienceGui.INFO_ICON_TEXT_FONT_SIZE
	level_icon_params.text_color = ExperienceGui.CHARACTER_LEVEL_LABEL_FONT_COLOR
	slot11 = level_icon_params
	self._current_level_icon = self._character_base_info_panel.info_icon(self._character_base_info_panel.h, self._character_base_info_panel)
	slot10 = self._current_level_icon
	slot13 = self._character_base_info_panel

	self._current_level_icon.set_bottom(self._character_base_info_panel.h, self._character_base_info_panel.h(true))

	slot14 = self._nationality_icon
	slot14 = self._current_level_icon
	slot12 = self._current_level_icon.w(self._class_icon)
	slot11 = self._class_icon.w(true) + ExperienceGui.INFO_ICONS_PADDING + self._nationality_icon.w(self._class_icon) + ExperienceGui.INFO_ICONS_PADDING + slot12

	self._character_base_info_panel.set_w(self._character_base_info_panel.h, self._character_base_info_panel)

	slot10 = self._character_base_info_panel
	slot13 = self._root_panel

	self._character_base_info_panel.set_right(self._character_base_info_panel.h, self._root_panel.right(slot12))

	slot10 = self._current_level_icon
	slot13 = self._character_base_info_panel

	self._current_level_icon.set_right(self._character_base_info_panel.h, self._character_base_info_panel.w(slot12))

	slot13 = self._current_level_icon
	slot11 = self._current_level_icon.x(slot12) - ExperienceGui.INFO_ICONS_PADDING

	self._nationality_icon.set_right(self._character_base_info_panel.h, self._nationality_icon)

	slot13 = self._nationality_icon
	slot11 = self._nationality_icon.x(ExperienceGui.INFO_ICONS_PADDING) - ExperienceGui.INFO_ICONS_PADDING

	self._class_icon.set_right(self._character_base_info_panel.h, self._class_icon)

	return 
end
function ExperienceGui:_layout_skilltree()
	if self._skilltrack_panel then
		slot3 = self._skilltrack_panel

		self._skilltrack_panel.clear(slot2)
	else
		local params_skill_track_panel = {
			x = ExperienceGui.SKILLTREE_X,
			y = ExperienceGui.SKILLTREE_Y
		}
		slot4 = self._root_panel
		params_skill_track_panel.w = self._root_panel.w(slot3)
		slot5 = params_skill_track_panel
		self._skilltrack_panel = self._root_panel.panel(slot3, self._root_panel)
	end

	local params_skill_track = {
		name = "skilltrack_progress_bar",
		y = 0,
		starting_points = 0,
		x = 0
	}
	slot4 = self._skilltrack_panel
	params_skill_track.w = self._skilltrack_panel.w(slot3)
	slot6 = "on_skill_activated"
	params_skill_track.on_click_callback = callback(slot3, self, self)
	slot6 = "on_skill_mouse_over"
	params_skill_track.on_mouse_enter_callback = callback(slot3, self, self)
	slot6 = "on_skill_mouse_out"
	params_skill_track.on_mouse_exit_callback = callback(slot3, self, self)
	params_skill_track.x_step = ExperienceGui.SKILLTRACK_BPB_X_STEP
	params_skill_track.y_step = ExperienceGui.SKILLTRACK_BPB_Y_STEP
	params_skill_track.padding = ExperienceGui.SKILLTRACK_BPB_X_PADDING
	slot6 = "data_source_branching_progress_bar"
	params_skill_track.data_source_callback = callback(slot3, self, self)
	slot6 = "on_skilltree_selection_changed"
	params_skill_track.on_selection_changed_callback = callback(slot3, self, self)
	self._skilltrack_progress_bar = self._skilltrack_panel.create_custom_control(slot3, self._skilltrack_panel, RaidGUIControlSkilltree)
	slot4 = self._skilltrack_progress_bar
	slot7 = managers.experience

	self._skilltrack_progress_bar.give_points(slot3, managers.experience.total(params_skill_track))

	return 
end
function ExperienceGui:_layout_respec()
	local params_respecs = {
		name = "respec",
		x = ExperienceGui.RESPEC_X,
		y = ExperienceGui.RESPEC_Y
	}
	slot6 = params_respecs
	self._respec = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlRespec)
	local gold_icon = tweak_data.gui.icons.gold_amount_footer
	local gold_icon_params = {
		halign = "scale",
		valign = "scale",
		texture = gold_icon.texture,
		texture_rect = gold_icon.texture_rect,
		x = ExperienceGui.RESPEC_X,
		y = ExperienceGui.RESPEC_BUTTON_CENTER_Y - 16,
		color = tweak_data.gui.colors.raid_gold,
		w = gold_icon.texture_rect[3],
		h = gold_icon.texture_rect[4]
	}
	self._cost_icon = self._root_panel.bitmap(RaidGUIControlRespec, self._root_panel)
	local cost_params = {
		text = "",
		name = "respec_cost",
		y = 0
	}
	slot8 = self._cost_icon
	slot6 = self._cost_icon.w(gold_icon_params)
	cost_params.x = ExperienceGui.RESPEC_X + slot6 + 12
	cost_params.font = tweak_data.gui.fonts.din_compressed
	cost_params.font_size = tweak_data.gui.font_sizes.size_38
	cost_params.color = tweak_data.gui.colors.raid_gold
	slot8 = cost_params
	self._cost_label = self._root_panel.label(slot6, self._root_panel)
	slot8 = ExperienceGui.RESPEC_BUTTON_CENTER_Y - 19

	self._cost_label.set_y(slot6, self._cost_label)

	local cost_additional_params = {
		text = "",
		name = "respec_cost_additional",
		y = 0,
		x = 0,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_gold
	}
	slot9 = cost_additional_params
	self._cost_additional_label = self._root_panel.label(self._cost_label, self._root_panel)
	slot9 = ExperienceGui.RESPEC_BUTTON_CENTER_Y - 13

	self._cost_additional_label.set_y(self._cost_label, self._cost_additional_label)

	return 
end
function ExperienceGui:_layout_skill_details()
	local params_skill_details = {
		name = "skill_details",
		x = ExperienceGui.SKILL_DETAILS_X,
		y = ExperienceGui.SKILL_DETAILS_Y
	}
	slot6 = params_skill_details
	self._skill_details = self._root_panel.create_custom_control(slot3, self._root_panel, RaidGUIControlSkillDetails)

	return 
end
function ExperienceGui:_layout_character_overview()
	return 
end
function ExperienceGui:_layout_buttons()
	local apply_button_params = {
		name = "apply_button",
		y = 0,
		x = 0
	}
	slot6 = true
	apply_button_params.text = self.translate(slot3, self, "menu_weapons_apply")
	slot6 = "on_click_apply_callback"
	apply_button_params.on_click_callback = callback(slot3, self, self)
	slot5 = apply_button_params
	self._apply_button = self._root_panel.short_primary_button(slot3, self._root_panel)
	slot5 = ExperienceGui.APPLY_BUTTON_CENTER_Y - self._apply_button.h(slot7) / 2

	self._apply_button.set_y(slot3, self._apply_button)
	self._apply_button.hide(slot3)

	local clear_button_params = {
		name = "clear_button_params",
		y = 0,
		x = ExperienceGui.CLEAR_BUTTON_X
	}
	slot7 = true
	clear_button_params.text = self.translate(self._apply_button, self, "menu_weapons_clear")
	slot7 = "on_click_clear_callback"
	clear_button_params.on_click_callback = callback(self._apply_button, self, self)
	slot6 = clear_button_params
	self._clear_button = self._root_panel.short_tertiary_button(self._apply_button, self._root_panel)
	slot6 = ExperienceGui.CLEAR_BUTTON_CENTER_Y - self._clear_button.h(self._apply_button) / 2

	self._clear_button.set_y(self._apply_button, self._clear_button)
	self._clear_button.hide(self._apply_button)

	local respec_button_params = {
		name = "clear_button_params",
		y = 0,
		x = ExperienceGui.RESPEC_BUTTON_X
	}
	slot8 = true
	respec_button_params.text = self.translate(self._clear_button, self, "menu_weapons_respec")
	slot8 = "on_click_respec_callback"
	respec_button_params.on_click_callback = callback(self._clear_button, self, self)
	slot7 = respec_button_params
	self._respec_button = self._root_panel.short_primary_gold_button(self._clear_button, self._root_panel)
	slot10 = self._clear_button
	slot7 = ExperienceGui.RESPEC_BUTTON_CENTER_Y - self._clear_button.h(self._clear_button) / 2

	self._respec_button.set_y(self._clear_button, self._respec_button)

	return 
end
function ExperienceGui:_layout_stats()
	local stats_panel_params = {
		name = "stats_panel",
		halign = "center",
		w = ExperienceGui.STATS_W,
		h = ExperienceGui.STATS_H
	}
	slot5 = stats_panel_params
	self._stats_panel = self._root_panel.panel(slot3, self._root_panel)
	slot7 = self._root_panel
	slot5 = self._root_panel.w(slot6) / 2

	self._stats_panel.set_center_x(slot3, self._stats_panel)

	slot5 = ExperienceGui.STATS_CENTER_Y

	self._stats_panel.set_center_y(slot3, self._stats_panel)

	local health_stat_params = {
		value_padding = 10,
		value_delta_color = tweak_data.gui.colors.raid_red,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey_effects,
		w = ExperienceGui.SINGLE_STAT_W
	}
	self._health_stat = self._stats_panel.create_custom_control(self._stats_panel, self._stats_panel, RaidGUIControlLabelNamedValueWithDelta)
	slot5 = self._health_stat
	slot10 = true

	self._health_stat.set_text(self._stats_panel, self.translate(health_stat_params, self, "select_character_health_label"))

	slot6 = "23"

	self._health_stat.set_value(self._stats_panel, self._health_stat)

	slot6 = 1

	self._health_stat.set_value_delta(self._stats_panel, self._health_stat)

	local speed_stat_params = {
		value_padding = 10,
		value_delta_color = tweak_data.gui.colors.raid_red,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey_effects,
		w = ExperienceGui.SINGLE_STAT_W
	}
	self._speed_stat = self._stats_panel.create_custom_control(self._health_stat, self._stats_panel, RaidGUIControlLabelNamedValueWithDelta)
	slot6 = self._speed_stat
	slot11 = true

	self._speed_stat.set_text(self._health_stat, self.translate(speed_stat_params, self, "select_character_speed_label"))

	slot7 = "34"

	self._speed_stat.set_value(self._health_stat, self._speed_stat)

	slot9 = self._stats_panel
	slot7 = self._stats_panel.w(speed_stat_params) / 2

	self._speed_stat.set_center_x(self._health_stat, self._speed_stat)

	local stamina_stat_params = {
		value_padding = 10,
		value_delta_color = tweak_data.gui.colors.raid_red,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey_effects,
		w = ExperienceGui.SINGLE_STAT_W
	}
	self._stamina_stat = self._stats_panel.create_custom_control(self._speed_stat, self._stats_panel, RaidGUIControlLabelNamedValueWithDelta)
	slot7 = self._stamina_stat
	slot12 = true

	self._stamina_stat.set_text(self._speed_stat, self.translate(stamina_stat_params, self, "select_character_stamina_label"))

	slot8 = "76"

	self._stamina_stat.set_value(self._speed_stat, self._stamina_stat)

	slot8 = 3

	self._stamina_stat.set_value_delta(self._speed_stat, self._stamina_stat)

	slot7 = self._stamina_stat
	slot10 = self._stats_panel

	self._stamina_stat.set_right(self._speed_stat, self._stats_panel.w(stamina_stat_params))

	return 
end
function ExperienceGui:_calculate_respec_visibility()
	slot3 = self._cost_label
	slot6 = managers.gold_economy

	self._cost_label.set_text(slot2, managers.gold_economy.respec_cost_string(slot5))

	local found = false
	local level_2 = self._skilltrack_progress_bar._levels[2]

	for j = 1, #level_2.nodes, 1 do
		local node = level_2.nodes[j]
		slot10 = node

		if node.state(slot9) == RaidGUIControlBranchingBarNode.STATE_ACTIVE then
			found = true
		end
	end

	if found then
		slot5 = self._cost_icon

		self._cost_icon.show(slot4)

		slot5 = self._cost_label

		self._cost_label.show(slot4)

		slot6 = managers.gold_economy

		if managers.gold_economy.respec_cost(managers.gold_economy) <= managers.gold_economy.current(slot4) then
			slot5 = self._cost_additional_label

			self._cost_additional_label.hide(slot4)

			slot5 = self._respec_button

			self._respec_button.show(slot4)
		else
			slot5 = self._respec_button

			self._respec_button.hide(slot4)

			slot5 = self._cost_additional_label

			self._cost_additional_label.show(slot4)

			slot5 = self._cost_additional_label
			slot11 = "menu_character_skills_insufficient_funds"

			self._cost_additional_label.set_text(slot4, utf8.to_upper(managers.localization.text(slot9, managers.localization)))

			slot6 = tweak_data.gui.colors.raid_gold

			self._cost_additional_label.set_color(slot4, self._cost_additional_label)

			slot6 = ExperienceGui.RESPEC_INSUFFICIENT_X

			self._cost_additional_label.set_x(slot4, self._cost_additional_label)
		end
	else
		slot5 = self._respec_button

		self._respec_button.hide(slot4)

		slot5 = self._cost_icon

		self._cost_icon.hide(slot4)

		slot5 = self._cost_label

		self._cost_label.hide(slot4)

		slot5 = self._cost_additional_label

		self._cost_additional_label.show(slot4)

		slot5 = self._cost_additional_label
		slot11 = "menu_character_skills_retrain_not_available"

		self._cost_additional_label.set_text(slot4, utf8.to_upper(managers.localization.text(slot9, managers.localization)))

		slot6 = tweak_data.gui.colors.raid_red

		self._cost_additional_label.set_color(slot4, self._cost_additional_label)

		slot6 = ExperienceGui.RESPEC_UNAVAILABLE_X

		self._cost_additional_label.set_x(slot4, self._cost_additional_label)
	end

	return 
end
function ExperienceGui:on_skill_activated(button_data)
	slot5 = button_data

	table.insert(slot3, self._activated_skills)

	return 
end
function ExperienceGui:on_skill_mouse_over(button_data)
	if button_data.skill_title then
		local skill_description, color_changes = self._prepare_skill_description(slot3, self)
		slot13 = button_data.skill_title
		slot10 = color_changes

		self._skill_details.set_skill(button_data, self._skill_details, button_data.skill, utf8.to_upper(managers.localization.text(slot11, managers.localization)), skill_description)

		slot8 = button_data.index

		self._skilltrack_progress_bar.select_node(button_data, self._skilltrack_progress_bar, button_data.level)
	end

	return 
end
function ExperienceGui:_prepare_skill_description(button_data)
	local skill = tweak_data.skilltree.skills[button_data.skill]
	local upgrade_tweak_data = tweak_data.upgrades.definitions[skill.upgrades[1]]

	if skill.acquires and skill.acquires[1] and skill.acquires[1].warcry_level then
		slot8 = skill.acquires[1].warcry_level

		return self._prepare_warcry_upgrade_description(slot5, self, button_data.level)
	elseif not upgrade_tweak_data then
		slot7 = button_data.skill_description

		return managers.localization.text(slot5, managers.localization)
	end

	local upgrade = tweak_data.upgrades.definitions[skill.upgrades[1]].upgrade
	slot9 = upgrade.upgrade
	local current_upgrade_level = managers.player.upgrade_level(slot6, managers.player, upgrade.category)
	slot11 = button_data.index
	local current_selected_level = self._upgrade_level_from_selected_skills(managers.player, self, skill, button_data.level)
	local total_upgrade_level = current_upgrade_level + current_selected_level
	local color_changes = {}
	local stat_line = nil

	if skill.stat_desc_id then
		local macros = {}
		local pending = false

		if (button_data.state == RaidGUIControlBranchingBarNode.STATE_HOVER or button_data.state == RaidGUIControlBranchingBarNode.STATE_SELECTED or button_data.state == RaidGUIControlBranchingBarNode.STATE_PENDING) and tweak_data.upgrades.values[upgrade.category][upgrade.upgrade][total_upgrade_level + 1] then
			macros.LEVEL = total_upgrade_level + 1
			pending = true
		else
			macros.LEVEL = total_upgrade_level
		end

		slot16 = macros
		local str_raw = managers.localization.text(slot13, managers.localization, skill.stat_desc_id)
		slot16 = 0
		slot19 = str_raw
		local str_utf8 = utf8.sub(managers.localization, str_raw, string.len(slot18))

		if upgrade_tweak_data.description_data then
			if upgrade_tweak_data.description_data.upgrade_type == UpgradesTweakData.UPGRADE_TYPE_MULTIPLIER then
				slot22 = color_changes

				self._prepare_upgrade_stats_type_multiplier(slot15, self, str_utf8, total_upgrade_level, pending, upgrade_tweak_data, macros)
			elseif upgrade_tweak_data.description_data.upgrade_type == UpgradesTweakData.UPGRADE_TYPE_REDUCTIVE_MULTIPLIER then
				slot22 = color_changes

				self._prepare_upgrade_stats_type_reductive_multiplier(slot15, self, str_utf8, total_upgrade_level, pending, upgrade_tweak_data, macros)
			elseif upgrade_tweak_data.description_data.upgrade_type == UpgradesTweakData.UPGRADE_TYPE_MULTIPLIER_REDUCTIVE_STRING then
				slot22 = color_changes

				self._prepare_upgrade_stats_type_multiplier_reductive_string(slot15, self, str_utf8, total_upgrade_level, pending, upgrade_tweak_data, macros)
			elseif upgrade_tweak_data.description_data.upgrade_type == UpgradesTweakData.UPGRADE_TYPE_RAW_VALUE_REDUCTION then
				slot22 = color_changes

				self._prepare_upgrade_stats_type_raw_value_reduction(slot15, self, str_utf8, total_upgrade_level, pending, upgrade_tweak_data, macros)
			elseif upgrade_tweak_data.description_data.upgrade_type == UpgradesTweakData.UPGRADE_TYPE_RAW_VALUE_AMOUNT then
				slot22 = color_changes

				self._prepare_upgrade_stats_type_raw_value_amount(slot15, self, str_utf8, total_upgrade_level, pending, upgrade_tweak_data, macros)
			elseif upgrade_tweak_data.description_data.upgrade_type == UpgradesTweakData.UPGRADE_TYPE_TEMPORARY_REDUCTION then
				slot22 = color_changes

				self._prepare_upgrade_stats_type_temporary_reduction(slot15, self, str_utf8, total_upgrade_level, pending, upgrade_tweak_data, macros)
			end
		end

		slot18 = macros
		stat_line = managers.localization.text(slot15, managers.localization, skill.stat_desc_id)
	end

	slot13 = button_data.skill_description
	local description_raw = managers.localization.text(slot11, managers.localization)
	slot14 = 0
	slot17 = description_raw
	local description = utf8.sub(managers.localization, description_raw, string.len(slot16))

	if stat_line then
		description = description .. "\n"
		local desc_length = string.len("\n")
		slot15 = color_changes

		for index, color_change in pairs(description) do
			color_change.start_index = color_change.start_index + desc_length
			color_change.end_index = color_change.end_index + desc_length
		end

		description = description .. stat_line
	end

	return description, color_changes
end
function ExperienceGui:_prepare_warcry_upgrade_description(level, warcry_level_increase)
	local active_warcry = managers.warcry.get_active_warcry(slot4)
	local target_warcry_level = math.round(managers.warcry) + 1
	slot8 = target_warcry_level

	return active_warcry.get_level_description(level / 10, active_warcry)
end
function ExperienceGui:_upgrade_level_from_selected_skills(skill, skill_button_level, skill_button_index)
	slot6 = self._skilltrack_progress_bar
	local selected_nodes = self._skilltrack_progress_bar.get_selected_nodes(slot5)
	local selected_num = 0
	slot8 = selected_nodes

	for index, node_data in pairs(slot7) do
		local same_button = node_data.level == skill_button_level and node_data.index == skill_button_index

		if skill.name_id == node_data.skill_title and not same_button then
			selected_num = selected_num + 1
		end
	end

	return selected_num
end
function ExperienceGui:_prepare_upgrade_stats_type_raw_value_reduction(string, current_level, pending, upgrade_tweak_data, macros, color_changes)
	local upgrade_values = tweak_data.upgrades.values[upgrade_tweak_data.upgrade.category][upgrade_tweak_data.upgrade.upgrade]
	slot11 = "$REDUCTION;"
	local starting_index = string.find(slot9, string) - 1
	local current_index = starting_index
	local macro = ""
	local separator = " / "
	slot14 = upgrade_values

	for index, value in pairs(slot13) do
		slot20 = value
		local current_value = string.format(slot18, "%.0f")

		if index <= current_level then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_ACTIVE,
				start_index = current_index,
				end_index = current_index + string.len(slot23) + string.len(current_value)
			}
			slot25 = separator

			table.insert(slot19, color_changes)
		elseif index == current_level + 1 and pending then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_PENDING,
				start_index = current_index,
				end_index = current_index + string.len(slot23)
			}
			slot24 = current_value

			table.insert(slot19, color_changes)
		end

		macro = macro .. current_value

		if index ~= #upgrade_values then
			macro = macro .. separator
		end

		slot21 = separator
		current_index = current_index + string.len(slot19) + string.len(current_value)
	end

	slot16 = {
		state = ExperienceGui.STAT_LEVEL_INACTIVE,
		start_index = starting_index,
		end_index = starting_index + string.len(slot18)
	}
	slot19 = macro

	table.insert(slot13, color_changes, 1)

	macros.REDUCTION = macro

	return 
end
function ExperienceGui:_prepare_upgrade_stats_type_raw_value_amount(string, current_level, pending, upgrade_tweak_data, macros, color_changes)
	local upgrade_values = tweak_data.upgrades.values[upgrade_tweak_data.upgrade.category][upgrade_tweak_data.upgrade.upgrade]
	slot11 = "$AMOUNT;"
	local starting_index = string.find(slot9, string) - 1
	local current_index = starting_index
	local macro = ""
	local separator = " / "
	slot14 = upgrade_values

	for index, value in pairs(slot13) do
		slot20 = value
		local current_value = string.format(slot18, "%.0f")

		if index <= current_level then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_ACTIVE,
				start_index = current_index,
				end_index = current_index + string.len(slot23) + string.len(current_value)
			}
			slot25 = separator

			table.insert(slot19, color_changes)
		elseif index == current_level + 1 and pending then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_PENDING,
				start_index = current_index,
				end_index = current_index + string.len(slot23)
			}
			slot24 = current_value

			table.insert(slot19, color_changes)
		end

		macro = macro .. current_value

		if index ~= #upgrade_values then
			macro = macro .. separator
		end

		slot21 = separator
		current_index = current_index + string.len(slot19) + string.len(current_value)
	end

	slot16 = {
		state = ExperienceGui.STAT_LEVEL_INACTIVE,
		start_index = starting_index,
		end_index = starting_index + string.len(slot18)
	}
	slot19 = macro

	table.insert(slot13, color_changes, 1)

	macros.AMOUNT = macro

	return 
end
function ExperienceGui:_prepare_upgrade_stats_type_temporary_reduction(string, current_level, pending, upgrade_tweak_data, macros, color_changes)
	local upgrade_values = tweak_data.upgrades.values[upgrade_tweak_data.upgrade.category][upgrade_tweak_data.upgrade.upgrade]
	slot11 = "$PERCENTAGE;"
	local starting_index = string.find(slot9, string) - 1
	local current_index = starting_index
	local macro = ""
	local separator = " / "
	slot14 = upgrade_values

	for index, value in pairs(slot13) do
		slot20 = (1 - value[1]) * 100
		local current_value = string.format(slot18, "%.0f%%")

		if index <= current_level then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_ACTIVE,
				start_index = current_index,
				end_index = current_index + string.len(slot23) + string.len(current_value)
			}
			slot25 = separator

			table.insert(slot19, color_changes)
		elseif index == current_level + 1 and pending then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_PENDING,
				start_index = current_index,
				end_index = current_index + string.len(slot23)
			}
			slot24 = current_value

			table.insert(slot19, color_changes)
		end

		macro = macro .. current_value

		if index ~= #upgrade_values then
			macro = macro .. separator
		end

		slot21 = separator
		current_index = current_index + string.len(slot19) + string.len(current_value)
	end

	slot16 = {
		state = ExperienceGui.STAT_LEVEL_INACTIVE,
		start_index = starting_index,
		end_index = starting_index + string.len(slot18)
	}
	slot19 = macro

	table.insert(slot13, color_changes, 1)

	macros.PERCENTAGE = macro
	slot15 = "$SECONDS;"
	slot15 = macro
	starting_index = (string.find(slot13, string) + string.len(string)) - 13
	current_index = starting_index
	macro = ""
	slot14 = upgrade_values

	for index, value in pairs(string.len(string)) do
		slot20 = value[2]
		local current_value = string.format(slot18, "%.0f")

		if index <= current_level then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_ACTIVE,
				start_index = current_index,
				end_index = current_index + string.len(slot23) + string.len(current_value)
			}
			slot25 = separator

			table.insert(slot19, color_changes)
		elseif index == current_level + 1 and pending then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_PENDING,
				start_index = current_index,
				end_index = current_index + string.len(slot23)
			}
			slot24 = current_value

			table.insert(slot19, color_changes)
		end

		macro = macro .. current_value

		if index ~= #upgrade_values then
			macro = macro .. separator
		end

		slot21 = separator
		current_index = current_index + string.len(slot19) + string.len(current_value)
	end

	slot16 = {
		state = ExperienceGui.STAT_LEVEL_INACTIVE,
		start_index = starting_index,
		end_index = starting_index + string.len(slot18)
	}
	slot19 = macro

	table.insert(slot13, color_changes, 1)

	macros.SECONDS = macro

	return 
end
function ExperienceGui:_prepare_upgrade_stats_type_multiplier(string, current_level, pending, upgrade_tweak_data, macros, color_changes)
	local upgrade_values = tweak_data.upgrades.values[upgrade_tweak_data.upgrade.category][upgrade_tweak_data.upgrade.upgrade]
	slot11 = "$PERCENTAGE;"
	local starting_index = string.find(slot9, string) - 1
	local current_index = starting_index
	local macro = ""
	local separator = " / "
	slot14 = upgrade_values

	for index, value in pairs(slot13) do
		slot20 = (value - 1) * 100
		local current_value = string.format(slot18, "%.0f%%")

		if index <= current_level then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_ACTIVE,
				start_index = current_index,
				end_index = current_index + string.len(slot23) + string.len(current_value)
			}
			slot25 = separator

			table.insert(slot19, color_changes)
		elseif index == current_level + 1 and pending then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_PENDING,
				start_index = current_index,
				end_index = current_index + string.len(slot23)
			}
			slot24 = current_value

			table.insert(slot19, color_changes)
		end

		macro = macro .. current_value

		if index ~= #upgrade_values then
			macro = macro .. separator
		end

		slot21 = separator
		current_index = current_index + string.len(slot19) + string.len(current_value)
	end

	slot16 = {
		state = ExperienceGui.STAT_LEVEL_INACTIVE,
		start_index = starting_index,
		end_index = starting_index + string.len(slot18)
	}
	slot19 = macro

	table.insert(slot13, color_changes, 1)

	macros.PERCENTAGE = macro

	return 
end
function ExperienceGui:_prepare_upgrade_stats_type_multiplier_reductive_string(string, current_level, pending, upgrade_tweak_data, macros, color_changes)
	local upgrade_values = tweak_data.upgrades.values[upgrade_tweak_data.upgrade.category][upgrade_tweak_data.upgrade.upgrade]
	slot11 = "$PERCENTAGE;"
	local starting_index = string.find(slot9, string) - 1
	local current_index = starting_index
	local macro = ""
	local separator = " / "
	slot14 = upgrade_values

	for index, value in pairs(slot13) do
		slot22 = 1 - 1 / value
		slot20 = math.abs(slot21) * 100
		local current_value = string.format(slot18, "%.0f%%")

		if index <= current_level then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_ACTIVE,
				start_index = current_index,
				end_index = current_index + string.len(slot23) + string.len(current_value)
			}
			slot25 = separator

			table.insert(slot19, color_changes)
		elseif index == current_level + 1 and pending then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_PENDING,
				start_index = current_index,
				end_index = current_index + string.len(slot23)
			}
			slot24 = current_value

			table.insert(slot19, color_changes)
		end

		macro = macro .. current_value

		if index ~= #upgrade_values then
			macro = macro .. separator
		end

		slot21 = separator
		current_index = current_index + string.len(slot19) + string.len(current_value)
	end

	slot16 = {
		state = ExperienceGui.STAT_LEVEL_INACTIVE,
		start_index = starting_index,
		end_index = starting_index + string.len(slot18)
	}
	slot19 = macro

	table.insert(slot13, color_changes, 1)

	macros.PERCENTAGE = macro

	return 
end
function ExperienceGui:_prepare_upgrade_stats_type_reductive_multiplier(string, current_level, pending, upgrade_tweak_data, macros, color_changes)
	local upgrade_values = tweak_data.upgrades.values[upgrade_tweak_data.upgrade.category][upgrade_tweak_data.upgrade.upgrade]
	slot11 = "$PERCENTAGE;"
	local starting_index = string.find(slot9, string) - 1
	local current_index = starting_index
	local macro = ""
	local separator = " / "
	slot14 = upgrade_values

	for index, value in pairs(slot13) do
		slot20 = (1 - value) * 100
		local current_value = string.format(slot18, "%.0f%%")

		if index <= current_level then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_ACTIVE,
				start_index = current_index,
				end_index = current_index + string.len(slot23) + string.len(current_value)
			}
			slot25 = separator

			table.insert(slot19, color_changes)
		elseif index == current_level + 1 and pending then
			slot21 = {
				state = ExperienceGui.STAT_LEVEL_PENDING,
				start_index = current_index,
				end_index = current_index + string.len(slot23)
			}
			slot24 = current_value

			table.insert(slot19, color_changes)
		end

		macro = macro .. current_value

		if index ~= #upgrade_values then
			macro = macro .. separator
		end

		slot21 = separator
		current_index = current_index + string.len(slot19) + string.len(current_value)
	end

	slot16 = {
		state = ExperienceGui.STAT_LEVEL_INACTIVE,
		start_index = starting_index,
		end_index = starting_index + string.len(slot18)
	}
	slot19 = macro

	table.insert(slot13, color_changes, 1)

	macros.PERCENTAGE = macro

	return 
end
function ExperienceGui:_refresh_stats(additional_hover_pending_skill)
	local character_class = managers.skilltree.get_character_profile_class(slot3)
	slot5 = managers.skilltree
	local applied_skills = managers.skilltree.get_character_skilltree(managers.skilltree)
	local skills_applied = {}
	slot7 = applied_skills

	for level_index, level in pairs(slot6) do
		slot12 = level

		for skill_index, skill in ipairs(slot11) do
			if skill.active then
				slot18 = skill.skill_name

				table.insert(slot16, skills_applied)
			end
		end
	end

	slot7 = self._skilltrack_progress_bar
	local selected_nodes = self._skilltrack_progress_bar.get_selected_nodes(slot6)
	local pending_skills = {}
	slot9 = selected_nodes

	for level_index, skill_node in pairs(slot8) do
		slot15 = skill_node.skill

		table.insert(slot13, pending_skills)
	end

	if additional_hover_pending_skill then
		slot10 = additional_hover_pending_skill

		table.insert(slot8, pending_skills)
	end

	local stats = managers.skilltree.calculate_stats(slot8, managers.skilltree, character_class, skills_applied)
	slot10 = self._health_stat
	slot14 = stats.health.base

	self._health_stat.set_value(managers.skilltree, string.format(pending_skills, "%.0f"))

	slot10 = self._health_stat
	slot13 = stats.health.pending

	self._health_stat.set_value_delta(managers.skilltree, math.round(pending_skills))

	slot10 = self._speed_stat
	slot14 = stats.speed.base

	self._speed_stat.set_value(managers.skilltree, string.format(pending_skills, "%.0f"))

	slot10 = self._speed_stat
	slot13 = stats.speed.pending

	self._speed_stat.set_value_delta(managers.skilltree, math.round(pending_skills))

	slot10 = self._stamina_stat
	slot14 = stats.stamina.base

	self._stamina_stat.set_value(managers.skilltree, string.format(pending_skills, "%.0f"))

	slot10 = self._stamina_stat
	slot13 = stats.stamina.pending

	self._stamina_stat.set_value_delta(managers.skilltree, math.round(pending_skills))

	return 
end
function ExperienceGui:on_skilltree_selection_changed()
	slot3 = self._skilltrack_progress_bar
	local selected_nodes = self._skilltrack_progress_bar.get_selected_nodes(slot2)
	local selected_quantity = 0
	slot5 = selected_nodes

	for _, _ in pairs(slot4) do
		selected_quantity = selected_quantity + 1
	end

	slot7 = selected_quantity

	Application.debug(slot4, Application, "[ExperienceGui:on_skilltree_selection_changed()] selected_quantity")

	if selected_quantity == 0 then
		slot5 = self._apply_button

		self._apply_button.animate_hide(slot4)

		slot5 = self._clear_button

		self._clear_button.animate_hide(slot4)

		slot5 = self

		self.bind_controller_inputs_initial_state(slot4)
	elseif 1 <= selected_quantity then
		slot5 = self._apply_button

		self._apply_button.animate_show(slot4)

		slot5 = self._clear_button

		self._clear_button.animate_show(slot4)

		slot5 = self

		self.bind_controller_inputs_apply_state(slot4)
	end

	slot5 = self

	self._refresh_stats(slot4)

	return 
end
function ExperienceGui:on_click_apply_callback(button_data)
	slot4 = self._skilltrack_progress_bar
	local selection_valid = self._skilltrack_progress_bar.is_selection_valid(slot3)

	if not selection_valid then
		slot5 = managers.menu

		managers.menu.show_skill_selection_invalid_dialog(slot4)

		return 
	end

	slot7 = "on_skill_acquisition_confirmed"
	local confirm_callback = callback(slot4, self, self)
	slot7 = {
		yes_callback = confirm_callback
	}

	managers.menu.show_skill_selection_confirm_dialog(self, managers.menu)

	return 
end
function ExperienceGui:on_click_respec_callback(button_data)
	local dialog_params = {}
	slot5 = managers.gold_economy
	dialog_params.gold = managers.gold_economy.respec_cost_string(slot4)
	slot7 = "do_respec"
	dialog_params.callback_yes = callback(slot4, self, self)
	slot6 = dialog_params

	managers.menu.show_respec_dialog(slot4, managers.menu)

	return 
end
function ExperienceGui:on_click_clear_callback(button_data)
	slot4 = self._skilltrack_progress_bar

	self._skilltrack_progress_bar.clear_selection(slot3)

	slot4 = self

	self.on_skilltree_selection_changed(slot3)

	return 
end
function ExperienceGui:on_skill_acquisition_confirmed()
	local selected_skills = self._skilltrack_progress_bar.get_selected_nodes(slot2)
	slot5 = "skill_confirm"

	managers.hud._sound_source.post_event(self._skilltrack_progress_bar, managers.hud._sound_source)

	slot4 = selected_skills

	for _, skill in pairs(self._skilltrack_progress_bar) do
		slot13 = true

		managers.skilltree.activate_skill_by_index(slot8, managers.skilltree, skill.level, skill.index, skill.skill)
	end

	slot4 = self._skilltrack_progress_bar

	self._skilltrack_progress_bar.apply_selected_skills(slot3)

	slot4 = self._apply_button

	self._apply_button.animate_hide(slot3)

	slot4 = self._clear_button

	self._clear_button.animate_hide(slot3)

	slot4 = self

	self.bind_controller_inputs_initial_state(slot3)

	slot4 = self

	self._calculate_respec_visibility(slot3)

	slot4 = managers.player

	managers.player.sync_upgrades(slot3)

	slot4 = self

	self._refresh_stats(slot3)

	slot4 = managers.player

	managers.player.replenish_player_weapons(slot3)

	return 
end
function ExperienceGui:on_skill_mouse_out(button_data)
	return 
end
function ExperienceGui:_get_character_skilltree()
	slot3 = managers.skilltree
	local skill_tree = managers.skilltree.get_character_skilltree(slot2)
	local tree = {}
	local last_skill_level = {
		nodes = {}
	}
	slot6 = skill_tree

	for level, skills in ipairs(slot5) do
		local skill_level = {}
		slot13 = skills.level_required
		skill_level.points_needed = managers.experience.get_total_xp_for_level(slot11, managers.experience)
		skill_level.nodes = {}
		slot12 = skills

		for index, skill_item in ipairs(slot11) do
			local node = {}
			local skill = tweak_data.skilltree.skills[skill_item.skill_name]
			node.value = {
				skill = skill_item.skill_name,
				skill_title = skill.name_id,
				skill_description = skill.desc_id
			}
			node.state = (skill_item.active and "active") or "inactive"
			node.parents = {}

			for i = 1, #last_skill_level.nodes, 1 do
				slot24 = i

				table.insert(slot22, node.parents)
			end

			slot20 = node

			table.insert(slot18, skill_level.nodes)
		end

		slot13 = skill_level

		table.insert(slot11, tree)

		last_skill_level = skill_level
	end

	return tree
end
function ExperienceGui:data_source_branching_progress_bar()
	slot3 = self

	return self._get_character_skilltree(slot2)
end
function ExperienceGui:close()
	if self._closing then
		return 
	end

	self._closing = true
	slot3 = game_state_machine

	if game_state_machine.current_state_name(slot2) == "event_complete_screen" then
		slot3 = game_state_machine
		slot3 = game_state_machine.current_state(slot2)

		game_state_machine.current_state(slot2).continue(slot2)
	end

	slot3 = managers.savefile

	managers.savefile.save_progress(slot2)

	slot3 = self

	ExperienceGui.super.close(slot2)

	return 
end
function ExperienceGui:bind_controller_inputs_initial_state()
	slot4 = managers.gold_economy
	local have_enough_money = managers.gold_economy.respec_cost(managers.gold_economy) <= managers.gold_economy.current(slot2)
	local respec_binding, respec_legend = nil

	if have_enough_money then
		slot7 = "menu_controller_trigger_left"
		slot9 = "on_click_respec_callback"
		respec_binding = {
			key = Idstring(slot6),
			callback = callback(slot6, self, self)
		}
		respec_legend = "menu_legend_player_skill_retrain"
	end

	local bindings = {}
	slot8 = "menu_controller_shoulder_left"
	slot10 = "_on_move_panel_left"
	bindings[1] = {
		key = Idstring(slot7),
		callback = callback(slot7, self, self)
	}
	slot8 = "menu_controller_shoulder_right"
	slot10 = "_on_move_panel_right"
	bindings[2] = {
		key = Idstring(slot7),
		callback = callback(slot7, self, self)
	}
	bindings[3] = respec_binding

	self.set_controller_bindings(callback(slot7, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_player_skill_select",
			"menu_legend_player_skill_shoulder",
			respec_legend
		}
	}
	slot13 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot9 = legend

	self.set_legend(, self)

	return 
end
function ExperienceGui:bind_controller_inputs_apply_state()
	slot4 = managers.gold_economy
	local have_enough_money = managers.gold_economy.respec_cost(managers.gold_economy) <= managers.gold_economy.current(slot2)
	local respec_binding, respec_legend = nil

	if have_enough_money then
		slot7 = "menu_controller_trigger_left"
		slot9 = "on_click_respec_callback"
		respec_binding = {
			key = Idstring(slot6),
			callback = callback(slot6, self, self)
		}
		respec_legend = "menu_legend_player_skill_retrain"
	end

	local bindings = {}
	slot8 = "menu_controller_shoulder_left"
	slot10 = "_on_move_panel_left"
	bindings[1] = {
		key = Idstring(slot7),
		callback = callback(slot7, self, self)
	}
	slot8 = "menu_controller_shoulder_right"
	slot10 = "_on_move_panel_right"
	bindings[2] = {
		key = Idstring(slot7),
		callback = callback(slot7, self, self)
	}
	slot8 = "menu_controller_face_top"
	slot10 = "_on_apply_selected_skills"
	bindings[3] = {
		key = Idstring(slot7),
		callback = callback(slot7, self, self)
	}
	bindings[4] = respec_binding

	self.set_controller_bindings(callback(slot7, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_player_skill_select",
			"menu_legend_player_skill_shoulder",
			"menu_legend_player_skill_apply",
			respec_legend
		}
	}
	slot13 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot9 = legend

	self.set_legend(, self)

	return 
end
function ExperienceGui:_on_move_panel_left()
	slot3 = self._skilltrack_progress_bar

	self._skilltrack_progress_bar.shoulder_move_left(slot2)

	return 
end
function ExperienceGui:_on_move_panel_right()
	slot3 = self._skilltrack_progress_bar

	self._skilltrack_progress_bar.shoulder_move_right(slot2)

	return 
end
function ExperienceGui:_on_apply_selected_skills()
	slot3 = self

	self.on_click_apply_callback(slot2)

	return 
end
function ExperienceGui:do_respec()
	slot3 = managers.skilltree

	managers.skilltree.respec(slot2)

	slot3 = managers.gold_economy

	managers.gold_economy.respec(slot2)

	slot3 = self._skilltrack_progress_bar

	self._skilltrack_progress_bar.on_respec(slot2)

	slot3 = self

	self.on_skilltree_selection_changed(slot2)

	slot3 = self

	self._calculate_respec_visibility(slot2)

	slot4 = 0

	managers.savefile.save_game(slot2, managers.savefile)

	slot3 = managers.player

	managers.player.replenish_player_weapons(slot2)

	return 
end

return 
