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
if not MissionSelectionGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

MissionSelectionGui = slot0
slot3 = "cccccc"
MissionSelectionGui.BACKGROUND_PAPER_COLOR = Color(slot2)
MissionSelectionGui.BACKGROUND_PAPER_ALPHA = 0.7
MissionSelectionGui.BACKGROUND_PAPER_ROTATION = 5
MissionSelectionGui.BACKGROUND_PAPER_SCALE = 0.9
slot3 = "ffffff"
MissionSelectionGui.FOREGROUND_PAPER_COLOR = Color(slot2)
MissionSelectionGui.SECONDARY_PAPER_PADDING_LEFT = -4
MissionSelectionGui.PAPER_STAMP_ICON = "icon_paper_stamp"
MissionSelectionGui.PAPER_STAMP_ICON_CONSUMABLE = "icon_paper_stamp_consumable"
MissionSelectionGui.SETTINGS_PADDING = 32
MissionSelectionGui.DISPLAY_FIRST = "first"
MissionSelectionGui.DISPLAY_SECOND = "second"
function MissionSelectionGui:init(ws, fullscreen_ws, node, component_name)
	self._settings_selected = {}
	self._selected_column = "left"
	self._selected_tab = "left"
	self._current_display = MissionSelectionGui.DISPLAY_FIRST
	slot7 = managers.progression

	if managers.progression.mission_progression_completion_pending(slot6) then
		slot7 = managers.progression

		managers.progression.complete_mission_progression(slot6)
	end

	slot11 = component_name

	MissionSelectionGui.super.init(slot6, self, ws, fullscreen_ws, node)

	self._controller_list = {}
	slot8 = managers.controller

	for index = 1, managers.controller.get_wrapper_count(self), 1 do
		slot14 = false
		local con = managers.controller.create_controller(slot10, managers.controller, "boot_" .. index, index)
		slot12 = con

		con.enable(managers.controller)

		self._controller_list[index] = con
	end

	slot8 = "mission_selection_gui"
	slot13 = "on_controller_hotswap"

	managers.controller.add_hotswap_callback(slot6, managers.controller, callback(slot10, self, self))

	slot7 = managers.progression
	local just_unlocked_raid = managers.progression.clear_last_unlocked_raid(slot6)

	if just_unlocked_raid then
		slot9 = just_unlocked_raid

		self._raid_list.select_item_by_value(slot7, self._raid_list)
	end

	slot8 = managers.raid_job

	if managers.raid_job.selected_job(slot7) then
		slot8 = self._selected_job_id

		print(slot7)

		slot11 = managers.raid_job
		slot9 = managers.raid_job.selected_job(slot10).level_id

		self._raid_list.select_item_by_value(slot7, self._raid_list)

		slot10 = true

		self._difficulty_stepper.set_value_and_render(slot7, self._difficulty_stepper, Global.game_settings.difficulty)
	end

	return 
end
function MissionSelectionGui:_set_initial_data()
	slot4 = "menu_header_missions_screen_name"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)

	self._settings_selected.difficulty = Global.player_manager.game_settings_difficulty
	self._settings_selected.permission = Global.game_settings.permission
	self._settings_selected.drop_in_allowed = Global.game_settings.drop_in_allowed
	self._settings_selected.team_ai = Global.game_settings.selected_team_ai
	self._settings_selected.auto_kick = Global.game_settings.auto_kick

	return 
end
function MissionSelectionGui:close()
	slot3 = self._primary_paper

	self._primary_paper.stop(slot2)

	slot3 = self._secondary_paper

	self._secondary_paper.stop(slot2)

	slot3 = self._soe_emblem

	self._soe_emblem.stop(slot2)

	slot3 = self

	self._stop_mission_briefing_audio(slot2)

	slot3 = self

	MissionSelectionGui.super.close(slot2)

	return 
end
function MissionSelectionGui:_layout()
	slot3 = self

	MissionSelectionGui.super._layout(slot2)

	slot3 = self

	self._layout_lists(slot2)

	slot3 = self

	self._layout_raid_wrapper_panel(slot2)

	slot3 = self

	self._layout_right_panel(slot2)

	if Global.game_settings.single_player then
		slot3 = self

		self._layout_settings_offline(slot2)
	else
		slot3 = self

		self._layout_settings(slot2)
	end

	slot3 = self

	self._layout_operation_tutorialization(slot2)

	slot3 = self

	self._layout_difficulty_warning(slot2)

	slot3 = self

	self._layout_primary_paper(slot2)

	slot3 = self

	self._layout_info_buttons(slot2)

	slot3 = self

	self._layout_secondary_paper(slot2)

	slot3 = self

	self._layout_folder_front_page(slot2)

	slot3 = self

	self._layout_start_button(slot2)

	slot3 = self

	self._layout_start_disabled_message(slot2)

	slot3 = self

	self._layout_delete_button(slot2)

	slot3 = managers.progression

	if not managers.progression.mission_progression_completed(slot2) then
		slot3 = self

		self._layout_progression_unlock_timer(slot2)
	end

	slot3 = self

	self._create_video_panels(slot2)

	slot4 = 1

	self._intel_image_grid.select(slot2, self._intel_image_grid)

	slot3 = self

	self._select_raids_tab(slot2)

	slot3 = self

	self.bind_controller_inputs(slot2)

	slot3 = managers.controller

	if managers.controller.is_xbox_controller_present(slot2) then
		slot3 = managers.menu

		if not managers.menu.is_pc_controller(slot2) then
			slot3 = self._raid_start_button

			self._raid_start_button.hide(slot2)

			slot3 = self._save_delete_button

			self._save_delete_button.hide(slot2)
		end
	end

	slot3 = self

	self._check_difficulty_warning(slot2)

	return 
end
function MissionSelectionGui:_layout_lists()
	local list_panel_params = {
		name = "list_panel",
		h = 690,
		y = 78,
		w = 448,
		x = 0,
		layer = 1
	}
	slot5 = list_panel_params
	self._list_panel = self._root_panel.panel(slot3, self._root_panel)
	local primary_lists_panel_params = {
		name = "primary_lists_panel"
	}
	slot6 = primary_lists_panel_params
	self._primary_lists_panel = self._list_panel.panel(self._root_panel, self._list_panel)
	local list_tabs_params = {
		name = "list_tabs",
		y = 0,
		tab_align = "center",
		x = 3
	}
	slot8 = "_on_mission_type_changed"
	list_tabs_params.on_click_callback = callback(self._list_panel, self, self)
	slot10 = true
	slot10 = true
	list_tabs_params.tabs_params = {
		{
			name = "tab_raid",
			callback_param = "raids",
			text = self.translate(self, self, "menu_mission_selected_mission_type_raid"),
			breadcrumb = {
				category = BreadcrumbManager.CATEGORY_CONSUMABLE_MISSION
			}
		},
		{
			name = "tab_operation",
			callback_param = "operations",
			text = self.translate(BreadcrumbManager.CATEGORY_CONSUMABLE_MISSION, self, "menu_mission_selected_mission_type_operation"),
			breadcrumb = {
				category = BreadcrumbManager.CATEGORY_OPERATIONS
			}
		}
	}
	slot6 = self._primary_lists_panel
	list_tabs_params.tab_width = (self._primary_lists_panel.w() - 2 * list_tabs_params.x) / #list_tabs_params.tabs_params
	slot7 = list_tabs_params
	self._list_tabs = self._primary_lists_panel.tabs(#list_tabs_params.tabs_params, self._primary_lists_panel)
	self._current_mission_type = "raids"
	local raid_list_scrollable_area_params = {
		name = "raid_list_scrollable_area",
		x = 0,
		scroll_step = 35
	}
	slot7 = self._list_tabs
	raid_list_scrollable_area_params.y = self._list_tabs.h(self._primary_lists_panel)
	slot7 = self._primary_lists_panel
	raid_list_scrollable_area_params.w = self._primary_lists_panel.w(self._primary_lists_panel)
	slot8 = self._list_tabs
	raid_list_scrollable_area_params.h = self._primary_lists_panel.h(self._primary_lists_panel) - self._list_tabs.h(self._primary_lists_panel)
	slot8 = raid_list_scrollable_area_params
	self._raid_list_panel = self._primary_lists_panel.scrollable_area(self._list_tabs.h(self._primary_lists_panel), self._primary_lists_panel)
	local raid_list_params = {
		selection_enabled = true,
		name = "raid_list",
		on_mouse_over_sound_event = "highlight",
		padding_top = 2,
		vertical_spacing = 2,
		on_mouse_click_sound_event = "menu_enter",
		y = 0,
		x = 0
	}
	slot8 = self._raid_list_panel
	raid_list_params.w = self._raid_list_panel.w(self._primary_lists_panel)
	slot10 = "_on_raid_clicked"
	raid_list_params.on_item_clicked_callback = callback(self._primary_lists_panel, self, self)
	slot10 = "_on_raid_selected"
	raid_list_params.on_item_selected_callback = callback(self._primary_lists_panel, self, self)
	slot10 = "_on_mission_list_double_clicked"
	raid_list_params.on_item_double_clicked_callback = callback(self._primary_lists_panel, self, self)
	slot10 = "_raid_list_data_source"
	raid_list_params.data_source_callback = callback(self._primary_lists_panel, self, self)
	raid_list_params.item_class = RaidGUIControlListItemRaids
	raid_list_params.scrollable_area_ref = self._raid_list_panel
	raid_list_params.on_menu_move = {
		right = "info_button"
	}
	slot8 = self._raid_list_panel
	slot9 = raid_list_params
	self._raid_list = self._raid_list_panel.get_panel(self._primary_lists_panel).list(self._primary_lists_panel, self._raid_list_panel.get_panel(self._primary_lists_panel))
	slot8 = self._raid_list_panel

	self._raid_list_panel.setup_scroll_area(self._primary_lists_panel)

	slot8 = self

	self._layout_slot_list(self._primary_lists_panel)

	slot8 = self

	self._layout_operations_list(self._primary_lists_panel)

	return 
end
function MissionSelectionGui:_layout_slot_list()
	if self._slot_list_panel then
		slot3 = self._slot_list_panel

		self._slot_list_panel.clear(slot2)
	else
		local slot_list_panel_params = {
			name = "slot_list_panel",
			x = 0
		}
		slot4 = self._list_tabs
		slot_list_panel_params.y = self._list_tabs.h(slot3)
		slot4 = self._primary_lists_panel
		slot_list_panel_params.w = self._primary_lists_panel.w(slot3)
		slot5 = self._list_tabs
		slot3 = self._list_tabs.h(self._primary_lists_panel)
		slot_list_panel_params.h = self._primary_lists_panel.h(slot3) - slot3
		slot5 = slot_list_panel_params
		self._slot_list_panel = self._list_panel.panel(slot3, self._list_panel)
		slot5 = 0

		self._slot_list_panel.set_alpha(slot3, self._slot_list_panel)

		slot5 = false

		self._slot_list_panel.set_visible(slot3, self._slot_list_panel)
	end

	local slot_list_params = {
		selection_enabled = true,
		name = "slot_list",
		padding_top = 2,
		on_mouse_click_sound_event = "menu_enter",
		vertical_spacing = 2,
		on_mouse_over_sound_event = "highlight",
		y = 0,
		x = 0
	}
	slot4 = self._slot_list_panel
	slot_list_params.w = self._slot_list_panel.w(slot3)
	slot4 = self._slot_list_panel
	slot_list_params.h = self._slot_list_panel.h(slot3)
	slot6 = "_on_slot_clicked"
	slot_list_params.on_item_clicked_callback = callback(slot3, self, self)
	slot6 = "_on_slot_selected"
	slot_list_params.on_item_selected_callback = callback(slot3, self, self)
	slot6 = "_on_slot_double_clicked"
	slot_list_params.on_item_double_clicked_callback = callback(slot3, self, self)
	slot6 = "_slot_list_data_source"
	slot_list_params.data_source_callback = callback(slot3, self, self)
	slot_list_params.item_class = RaidGUIControlListItemSaveSlots
	slot5 = slot_list_params
	self._slot_list = self._slot_list_panel.list(slot3, self._slot_list_panel)

	return 
end
function MissionSelectionGui:_layout_operations_list()
	local operations_list_panel_params = {
		visible = false,
		name = "operations_list_panel"
	}
	slot4 = self._list_tabs
	operations_list_panel_params.y = self._list_tabs.h(slot3)
	slot5 = self._list_tabs
	operations_list_panel_params.h = self._list_panel.h(slot3) - self._list_tabs.h(self._list_panel)
	slot5 = operations_list_panel_params
	self._operations_list_panel = self._list_panel.panel(self._list_tabs.h(self._list_panel), self._list_panel)
	local operations_list_params = {
		selection_enabled = true,
		name = "operation_list",
		on_mouse_click_sound_event = "menu_enter",
		vertical_spacing = 2,
		padding_top = 2,
		on_mouse_over_sound_event = "highlight"
	}
	slot7 = "_on_operation_selected"
	operations_list_params.on_item_clicked_callback = callback(self._list_panel, self, self)
	slot7 = "_on_operation_selected"
	operations_list_params.on_item_selected_callback = callback(self._list_panel, self, self)
	slot7 = "_on_mission_list_double_clicked"
	operations_list_params.on_item_double_clicked_callback = callback(self._list_panel, self, self)
	slot7 = "_operation_list_data_source"
	operations_list_params.data_source_callback = callback(self._list_panel, self, self)
	slot7 = "_on_operation_list_selected"
	operations_list_params.selected_callback = callback(self._list_panel, self, self)
	slot7 = "_on_operation_list_unselected"
	operations_list_params.unselected_callback = callback(self._list_panel, self, self)
	operations_list_params.item_class = RaidGUIControlListItemOperations
	operations_list_params.on_menu_move = {
		right = "info_button"
	}
	slot6 = operations_list_params
	self._new_operation_list = self._operations_list_panel.list(self._list_panel, self._operations_list_panel)

	return 
end
function MissionSelectionGui:_layout_raid_wrapper_panel()
	local raid_wrapper_panel_params = {
		name = "raid_wrapper_panel",
		y = 0,
		x = 0
	}
	slot4 = self._root_panel
	raid_wrapper_panel_params.w = self._root_panel.w(slot3)
	slot4 = self._root_panel
	raid_wrapper_panel_params.h = self._root_panel.h(slot3)
	slot5 = raid_wrapper_panel_params
	self._raid_panel = self._root_panel.panel(slot3, self._root_panel)

	return 
end
function MissionSelectionGui:_layout_right_panel()
	local right_panel_params = {
		name = "right_panel",
		h = 640,
		y = 192,
		w = 480,
		x = 0,
		layer = 1
	}
	slot5 = right_panel_params
	self._right_panel = self._root_panel.panel(slot3, self._root_panel)
	slot8 = self._right_panel
	slot5 = self._root_panel.w(slot6) - self._right_panel.w(self._root_panel)

	self._right_panel.set_x(slot3, self._right_panel)

	return 
end
function MissionSelectionGui:_layout_settings()
	slot4 = "[MissionSelectionGui:_layout_settings]"

	Application.trace(slot2, Application)

	self._settings_controls = {}
	local settings_panel_params = {
		name = "settings_panel"
	}
	slot5 = settings_panel_params
	self._settings_panel = self._right_panel.panel(Application, self._right_panel)
	local difficulty_stepper_params = {
		name = "difficulty_stepper",
		y = 0,
		x = 0
	}
	slot7 = true
	difficulty_stepper_params.description = self.translate(self._right_panel, self, "menu_difficulty_title")
	slot7 = "_on_difficulty_selected"
	difficulty_stepper_params.on_item_selected_callback = callback(self._right_panel, self, self)
	slot7 = "data_source_difficulty_stepper"
	difficulty_stepper_params.data_source_callback = callback(self._right_panel, self, self)
	difficulty_stepper_params.on_menu_move = {
		up = "auto_kick_checkbox",
		down = "permission_stepper",
		left = "audio_button"
	}
	slot6 = difficulty_stepper_params
	self._difficulty_stepper = self._settings_panel.stepper(self._right_panel, self._settings_panel)
	slot7 = true

	self._difficulty_stepper.set_value_and_render(self._right_panel, self._difficulty_stepper, Global.player_manager.game_settings_difficulty)

	slot6 = self._difficulty_stepper

	table.insert(self._right_panel, self._settings_controls)

	local permission_stepper_params = {
		name = "permission_stepper",
		x = 0
	}
	slot7 = self._difficulty_stepper
	permission_stepper_params.y = self._difficulty_stepper.y(self._settings_controls) + self._difficulty_stepper.h(self._difficulty_stepper) + MissionSelectionGui.SETTINGS_PADDING
	slot8 = true
	permission_stepper_params.description = self.translate(MissionSelectionGui.SETTINGS_PADDING, self, "menu_permission_title")
	slot8 = "_on_permission_selected"
	permission_stepper_params.on_item_selected_callback = callback(MissionSelectionGui.SETTINGS_PADDING, self, self)
	slot8 = "data_source_permission_stepper"
	permission_stepper_params.data_source_callback = callback(MissionSelectionGui.SETTINGS_PADDING, self, self)
	permission_stepper_params.on_menu_move = {
		up = "difficulty_stepper",
		down = "drop_in_checkbox",
		left = "audio_button"
	}
	slot7 = permission_stepper_params
	self._permission_stepper = self._settings_panel.stepper(MissionSelectionGui.SETTINGS_PADDING, self._settings_panel)
	slot8 = true

	self._permission_stepper.set_value_and_render(MissionSelectionGui.SETTINGS_PADDING, self._permission_stepper, Global.game_settings.permission)

	slot7 = self._permission_stepper

	table.insert(MissionSelectionGui.SETTINGS_PADDING, self._settings_controls)

	local drop_in_checkbox_params = {
		name = "drop_in_checkbox",
		value = true,
		x = 0
	}
	slot8 = self._permission_stepper
	drop_in_checkbox_params.y = self._permission_stepper.y(self._settings_controls) + self._permission_stepper.h(self._permission_stepper) + MissionSelectionGui.SETTINGS_PADDING
	slot9 = true
	drop_in_checkbox_params.description = self.translate(MissionSelectionGui.SETTINGS_PADDING, self, "menu_allow_drop_in_title")
	slot9 = "_on_toggle_drop_in"
	drop_in_checkbox_params.on_click_callback = callback(MissionSelectionGui.SETTINGS_PADDING, self, self)
	drop_in_checkbox_params.on_menu_move = {
		up = "permission_stepper",
		down = "team_ai_checkbox",
		left = "audio_button"
	}
	slot8 = drop_in_checkbox_params
	self._drop_in_checkbox = self._settings_panel.toggle_button(MissionSelectionGui.SETTINGS_PADDING, self._settings_panel)
	slot8 = Global.game_settings.drop_in_allowed

	self._drop_in_checkbox.set_value_and_render(MissionSelectionGui.SETTINGS_PADDING, self._drop_in_checkbox)

	slot8 = self._drop_in_checkbox

	table.insert(MissionSelectionGui.SETTINGS_PADDING, self._settings_controls)

	local team_ai_checkbox_params = {
		name = "team_ai_checkbox",
		value = true,
		x = 0
	}
	slot9 = self._drop_in_checkbox
	team_ai_checkbox_params.y = self._drop_in_checkbox.y(self._settings_controls) + self._drop_in_checkbox.h(self._drop_in_checkbox) + MissionSelectionGui.SETTINGS_PADDING
	slot10 = true
	team_ai_checkbox_params.description = self.translate(MissionSelectionGui.SETTINGS_PADDING, self, "menu_play_with_team_ai_title")
	slot10 = "_on_toggle_team_ai"
	team_ai_checkbox_params.on_click_callback = callback(MissionSelectionGui.SETTINGS_PADDING, self, self)
	team_ai_checkbox_params.on_menu_move = {
		up = "drop_in_checkbox",
		down = "auto_kick_checkbox",
		left = "audio_button"
	}
	slot9 = team_ai_checkbox_params
	self._team_ai_checkbox = self._settings_panel.toggle_button(MissionSelectionGui.SETTINGS_PADDING, self._settings_panel)
	slot10 = true

	self._team_ai_checkbox.set_value_and_render(MissionSelectionGui.SETTINGS_PADDING, self._team_ai_checkbox, Global.game_settings.selected_team_ai)

	slot9 = self._team_ai_checkbox

	table.insert(MissionSelectionGui.SETTINGS_PADDING, self._settings_controls)

	local auto_kick_checkbox_params = {
		name = "auto_kick_checkbox",
		value = true,
		x = 0
	}
	slot10 = self._team_ai_checkbox
	auto_kick_checkbox_params.y = self._team_ai_checkbox.y(self._settings_controls) + self._team_ai_checkbox.h(self._team_ai_checkbox) + MissionSelectionGui.SETTINGS_PADDING
	slot11 = true
	auto_kick_checkbox_params.description = self.translate(MissionSelectionGui.SETTINGS_PADDING, self, "menu_auto_kick_cheaters_title")
	slot11 = "_on_toggle_auto_kick"
	auto_kick_checkbox_params.on_click_callback = callback(MissionSelectionGui.SETTINGS_PADDING, self, self)
	auto_kick_checkbox_params.on_menu_move = {
		up = "team_ai_checkbox",
		down = "difficulty_stepper",
		left = "audio_button"
	}
	slot10 = auto_kick_checkbox_params
	self._auto_kick_checkbox = self._settings_panel.toggle_button(MissionSelectionGui.SETTINGS_PADDING, self._settings_panel)
	slot11 = true

	self._auto_kick_checkbox.set_value_and_render(MissionSelectionGui.SETTINGS_PADDING, self._auto_kick_checkbox, Global.game_settings.auto_kick)

	slot10 = self._auto_kick_checkbox

	table.insert(MissionSelectionGui.SETTINGS_PADDING, self._settings_controls)

	return 
end
function MissionSelectionGui:_layout_operation_tutorialization()
	local operation_tutorialization_panel_params = {
		alpha = 0,
		name = "operation_tutorialization"
	}
	slot5 = operation_tutorialization_panel_params
	self._operation_tutorialization_panel = self._right_panel.panel(slot3, self._right_panel)
	local op_tutorialization_title_params = {
		h = 40,
		halign = "left",
		vertical = "center",
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot7 = true
	op_tutorialization_title_params.text = self.translate(self._right_panel, self, "operations_tutorialization_title")
	slot6 = op_tutorialization_title_params
	local title = self._operation_tutorialization_panel.text(self._right_panel, self._operation_tutorialization_panel)
	slot7 = 16

	title.set_center_y(self._operation_tutorialization_panel, title)

	local op_tutorialization_title_params = {
		y = 64,
		halign = "left",
		wrap = true,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	slot9 = false
	op_tutorialization_title_params.text = self.translate(title, self, "operations_tutorialization_description")
	slot8 = op_tutorialization_title_params
	local description = self._operation_tutorialization_panel.text(title, self._operation_tutorialization_panel)

	return 
end
function MissionSelectionGui:_layout_settings_offline()
	slot4 = "[MissionSelectionGui:_layout_settings_offline]"

	Application.trace(slot2, Application)

	self._settings_controls = {}
	local settings_panel_params = {
		name = "settings_panel"
	}
	slot5 = settings_panel_params
	self._settings_panel = self._right_panel.panel(Application, self._right_panel)
	local difficulty_stepper_params = {
		name = "difficulty_stepper",
		y = 0,
		x = 0
	}
	slot7 = true
	difficulty_stepper_params.description = self.translate(self._right_panel, self, "menu_difficulty_title")
	slot7 = "_on_difficulty_selected"
	difficulty_stepper_params.on_item_selected_callback = callback(self._right_panel, self, self)
	slot7 = "data_source_difficulty_stepper"
	difficulty_stepper_params.data_source_callback = callback(self._right_panel, self, self)
	difficulty_stepper_params.on_menu_move = {
		left = "audio_button",
		down = "team_ai_checkbox"
	}
	slot6 = difficulty_stepper_params
	self._difficulty_stepper = self._settings_panel.stepper(self._right_panel, self._settings_panel)
	slot7 = true

	self._difficulty_stepper.set_value_and_render(self._right_panel, self._difficulty_stepper, Global.player_manager.game_settings_difficulty)

	slot6 = self._difficulty_stepper

	table.insert(self._right_panel, self._settings_controls)

	local team_ai_checkbox_params = {
		name = "team_ai_checkbox",
		value = true,
		x = 0
	}
	slot7 = self._difficulty_stepper
	team_ai_checkbox_params.y = self._difficulty_stepper.y(self._settings_controls) + self._difficulty_stepper.h(self._difficulty_stepper) + MissionSelectionGui.SETTINGS_PADDING
	slot8 = true
	team_ai_checkbox_params.description = self.translate(MissionSelectionGui.SETTINGS_PADDING, self, "menu_play_with_team_ai_title")
	slot8 = "_on_toggle_team_ai"
	team_ai_checkbox_params.on_click_callback = callback(MissionSelectionGui.SETTINGS_PADDING, self, self)
	team_ai_checkbox_params.on_menu_move = {
		left = "audio_button",
		up = "difficulty_stepper"
	}
	slot7 = team_ai_checkbox_params
	self._team_ai_checkbox = self._settings_panel.toggle_button(MissionSelectionGui.SETTINGS_PADDING, self._settings_panel)
	slot8 = true

	self._team_ai_checkbox.set_value_and_render(MissionSelectionGui.SETTINGS_PADDING, self._team_ai_checkbox, Global.game_settings.team_ai)

	slot7 = self._team_ai_checkbox

	table.insert(MissionSelectionGui.SETTINGS_PADDING, self._settings_controls)

	return 
end
function MissionSelectionGui:_layout_difficulty_warning()
	local difficulty_warning_panel_params = {
		name = "difficulty_warning_panel"
	}
	slot5 = difficulty_warning_panel_params
	self._difficulty_warning_panel = self._settings_panel.panel(slot3, self._settings_panel)
	slot7 = self._difficulty_stepper

	self._difficulty_warning_panel.set_y(slot3, self._difficulty_stepper.bottom(slot6))

	local difficulty_warning_text_params = {
		vertical = "top",
		name = "difficulty_warning_text",
		wrap = true,
		align = "left",
		text = "Bla bla bla"
	}
	slot5 = self._difficulty_stepper
	difficulty_warning_text_params.x = self._difficulty_stepper.label_x(self._difficulty_warning_panel)
	slot6 = self._difficulty_stepper
	slot4 = self._difficulty_stepper.label_x(self._difficulty_warning_panel)
	difficulty_warning_text_params.w = self._difficulty_warning_panel.w(self._difficulty_warning_panel) - slot4
	difficulty_warning_text_params.font = tweak_data.gui.fonts.lato
	difficulty_warning_text_params.font_size = tweak_data.gui.font_sizes.size_20
	difficulty_warning_text_params.color = tweak_data.gui.colors.raid_red
	slot6 = difficulty_warning_text_params
	self._difficulty_warning = self._difficulty_warning_panel.text(slot4, self._difficulty_warning_panel)
	slot6 = 0

	self._difficulty_warning.set_bottom(slot4, self._difficulty_warning)

	return 
end
function MissionSelectionGui:_layout_folder_front_page()
	local front_page_panel_params = {
		name = "front_page_panel",
		halign = "center",
		w = 704,
		alpha = 0,
		valign = "scale"
	}
	slot4 = self._root_panel
	front_page_panel_params.h = self._root_panel.h(slot3)
	slot4 = self._primary_paper_panel
	front_page_panel_params.layer = self._primary_paper_panel.layer(slot3) + 1000
	slot5 = front_page_panel_params
	self._front_page_panel = self._root_panel.panel(slot3, self._root_panel)

	self._front_page_panel.set_center_x(slot3, self._primary_paper_panel.center_x(slot6))

	local front_page_params = {
		name = "front_page_image",
		valign = "center",
		halign = "center",
		texture = tweak_data.gui.icons.folder_mission.texture,
		texture_rect = tweak_data.gui.icons.folder_mission.texture_rect
	}
	slot6 = front_page_params
	self._front_page_image = self._front_page_panel.bitmap(self._front_page_panel, self._front_page_panel)
	slot8 = self._front_page_panel
	slot6 = self._front_page_panel.w(self._primary_paper_panel) / 2

	self._front_page_image.set_center_x(self._front_page_panel, self._front_page_image)

	slot8 = self._front_page_panel
	slot6 = self._front_page_panel.h(self._primary_paper_panel) / 2 + 10

	self._front_page_image.set_center_y(self._front_page_panel, self._front_page_image)

	self._current_front_page_image = "folder_mission"
	local front_page_content_panel_params = {
		alpha = 0,
		name = "front_page_content_panel"
	}
	slot7 = front_page_content_panel_params
	self._front_page_content_panel = self._front_page_panel.panel(self._front_page_image, self._front_page_panel)
	local front_page_icon_params = {
		name = "front_page_icon",
		valign = "center",
		halign = "center",
		texture = tweak_data.gui.icons.xp_events_mission_raid_railyard.texture,
		texture_rect = tweak_data.gui.icons.xp_events_mission_raid_railyard.texture_rect
	}
	slot7 = self._front_page_image
	front_page_icon_params.layer = self._front_page_image.layer(self._front_page_panel) + 1
	front_page_icon_params.color = tweak_data.gui.colors.raid_light_red
	slot8 = front_page_icon_params
	self._front_page_icon = self._front_page_content_panel.bitmap(self._front_page_panel, self._front_page_content_panel)
	slot10 = self._front_page_panel
	slot8 = self._front_page_panel.w(slot9) / 2

	self._front_page_icon.set_center_x(self._front_page_panel, self._front_page_icon)

	slot8 = self._front_page_image.center_y(slot9) - 42

	self._front_page_icon.set_center_y(self._front_page_panel, self._front_page_icon)

	local front_page_title_params = {
		name = "front_page_title",
		h = 80,
		vertical = "center",
		w = 448,
		align = "center",
		text = "TRAINYARD",
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.title,
		color = tweak_data.gui.colors.raid_light_red
	}
	slot8 = self._front_page_icon
	front_page_title_params.layer = self._front_page_icon.layer(self._front_page_icon)
	slot9 = front_page_title_params
	self._front_page_title = self._front_page_content_panel.text(self._front_page_icon, self._front_page_content_panel)
	slot8 = self._front_page_title
	slot11 = self._front_page_image

	self._front_page_title.set_center_x(self._front_page_icon, self._front_page_image.center_x(self._front_page_image))

	slot11 = self._front_page_image
	slot9 = self._front_page_image.center_y(self._front_page_image) + 238

	self._front_page_title.set_center_y(self._front_page_icon, self._front_page_title)

	return 
end
function MissionSelectionGui:_layout_primary_paper()
	local paper_image = "menu_paper"
	local soe_emblem_image = "icon_paper_stamp"
	local primary_paper_panel_params = {
		name = "primary_paper_panel",
		h = 768,
		y = 117,
		w = 524,
		x = 580,
		layer = RaidGuiBase.FOREGROUND_LAYER + 150
	}
	slot7 = primary_paper_panel_params
	self._primary_paper_panel = self._root_panel.panel(slot5, self._root_panel)
	local primary_paper_params = {
		name = "primary_paper",
		y = 0,
		x = 0
	}
	slot7 = self._primary_paper_panel
	primary_paper_params.w = self._primary_paper_panel.w(self._root_panel)
	slot7 = self._primary_paper_panel
	primary_paper_params.h = self._primary_paper_panel.h(self._root_panel)
	primary_paper_params.texture = tweak_data.gui.images[paper_image].texture
	primary_paper_params.texture_rect = tweak_data.gui.images[paper_image].texture_rect
	slot8 = primary_paper_params
	self._primary_paper = self._primary_paper_panel.bitmap(self._root_panel, self._primary_paper_panel)
	local soe_emblem_params = {
		name = "soe_emblem",
		y = 22,
		x = 384,
		texture = tweak_data.gui.icons[soe_emblem_image].texture,
		texture_rect = tweak_data.gui.icons[soe_emblem_image].texture_rect
	}
	slot8 = self._primary_paper
	soe_emblem_params.layer = self._primary_paper.layer(self._primary_paper_panel) + 1
	slot9 = soe_emblem_params
	self._soe_emblem = self._primary_paper_panel.bitmap(self._primary_paper_panel, self._primary_paper_panel)
	local mission_icon_params = {
		name = "mission_icon",
		y = 44,
		x = 32,
		texture = tweak_data.gui.icons[soe_emblem_image].texture,
		texture_rect = tweak_data.gui.icons[soe_emblem_image].texture_rect
	}
	slot9 = self._primary_paper
	mission_icon_params.layer = self._primary_paper.layer(self._primary_paper_panel) + 1
	mission_icon_params.color = tweak_data.gui.colors.raid_black
	slot10 = mission_icon_params
	self._primary_paper_mission_icon = self._primary_paper_panel.bitmap(self._primary_paper_panel, self._primary_paper_panel)
	local title_params = {
		text = "",
		name = "primary_paper_title",
		y = 44,
		x = 112,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_black
	}
	slot10 = self._primary_paper
	title_params.layer = self._primary_paper.layer(self._primary_paper_panel) + 1
	slot11 = title_params
	self._primary_paper_title = self._primary_paper_panel.label(self._primary_paper_panel, self._primary_paper_panel)
	local subtitle_params = {
		text = "",
		name = "primary_paper_title",
		y = 78,
		x = 112,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_black
	}
	slot11 = self._primary_paper
	subtitle_params.layer = self._primary_paper.layer(self._primary_paper_panel) + 1
	slot12 = subtitle_params
	self._primary_paper_subtitle = self._primary_paper_panel.label(self._primary_paper_panel, self._primary_paper_panel)
	local mission_difficulty_params = {
		name = "mission_difficulty",
		y = 78,
		x = 112,
		fill_color = tweak_data.gui.colors.raid_black,
		unavailable_color = tweak_data.gui.colors.raid_dark_grey
	}
	slot12 = tweak_data
	mission_difficulty_params.amount = tweak_data.number_of_difficulties(self._primary_paper_panel)
	slot14 = mission_difficulty_params
	self._primary_paper_difficulty_indicator = self._primary_paper_panel.create_custom_control(self._primary_paper_panel, self._primary_paper_panel, RaidGuiControlDifficultyStars)
	local separator_params = {
		name = "primary_paper_separator",
		h = 2,
		y = 123,
		w = 350,
		x = 34
	}
	slot13 = self._primary_paper
	separator_params.layer = self._primary_paper.layer(self._primary_paper_panel) + 1
	separator_params.color = tweak_data.gui.colors.raid_black
	slot14 = separator_params
	self._primary_paper_separator = self._primary_paper_panel.rect(self._primary_paper_panel, self._primary_paper_panel)
	slot13 = self

	self._layout_raid_description(self._primary_paper_panel)

	slot13 = self

	self._layout_intel_image_grid(self._primary_paper_panel)

	slot13 = self

	self._layout_operation_progress_text(self._primary_paper_panel)

	slot13 = self

	self._layout_operation_list(self._primary_paper_panel)

	return 
end
function MissionSelectionGui:_layout_raid_description()
	local mission_description_params = {
		w = 432,
		name = "mission_descripton",
		h = 528,
		wrap = true,
		text = "",
		y = 136,
		x = 38,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.paragraph,
		color = tweak_data.gui.colors.raid_black
	}
	slot4 = self._primary_paper_panel
	mission_description_params.layer = self._primary_paper_panel.layer(slot3) + 1
	slot5 = mission_description_params
	self._mission_description = self._primary_paper_panel.label(slot3, self._primary_paper_panel)
	slot5 = false

	self._mission_description.set_visible(slot3, self._mission_description)

	self._active_primary_paper_control = self._mission_description

	return 
end
function MissionSelectionGui:_layout_operation_progress_text()
	local operation_progress_panel_params = {
		name = "operation_progress_panel",
		h = 490,
		w = 440
	}
	slot4 = self._primary_paper_mission_icon
	operation_progress_panel_params.x = self._primary_paper_mission_icon.x(slot3)
	slot4 = self._mission_description
	operation_progress_panel_params.y = self._mission_description.y(slot3)
	slot5 = operation_progress_panel_params
	self._operation_progress_panel = self._primary_paper_panel.panel(slot3, self._primary_paper_panel)
	local operation_progress_params = {
		operation = "clear_skies",
		name = "operation_progress",
		y = 0,
		x = 0
	}
	slot5 = self._operation_progress_panel
	operation_progress_params.w = self._operation_progress_panel.w(self._primary_paper_panel)
	slot5 = self._operation_progress_panel
	operation_progress_params.h = self._operation_progress_panel.h(self._primary_paper_panel)
	slot7 = operation_progress_params
	self._operation_progress = self._operation_progress_panel.create_custom_control(self._primary_paper_panel, self._operation_progress_panel, RaidGUIControlOperationProgress)
	slot6 = 0

	self._operation_progress.set_alpha(self._primary_paper_panel, self._operation_progress)

	slot6 = false

	self._operation_progress.set_visible(self._primary_paper_panel, self._operation_progress)

	return 
end
function MissionSelectionGui:_layout_operation_list()
	local operation_list_panel_params = {
		name = "operation_list_panel",
		h = 448,
		y = 136,
		w = 432,
		x = 31
	}
	slot4 = self._primary_paper_panel
	operation_list_panel_params.layer = self._primary_paper_panel.layer(slot3) + 1
	slot5 = operation_list_panel_params
	self._operation_list_panel = self._primary_paper_panel.panel(slot3, self._primary_paper_panel)
	local operation_list_params = {
		selection_enabled = true,
		name = "operation_list",
		y = 0,
		x = 0
	}
	slot5 = self._operation_list_panel
	operation_list_params.w = self._operation_list_panel.w(self._primary_paper_panel)
	slot5 = self._operation_list_panel
	operation_list_params.h = self._operation_list_panel.h(self._primary_paper_panel)
	slot7 = "_on_operation_selected"
	operation_list_params.on_item_clicked_callback = callback(self._primary_paper_panel, self, self)
	slot7 = "_on_operation_selected"
	operation_list_params.on_item_selected_callback = callback(self._primary_paper_panel, self, self)
	slot7 = "_on_mission_list_double_clicked"
	operation_list_params.on_item_double_clicked_callback = callback(self._primary_paper_panel, self, self)
	slot7 = "_operation_list_data_source"
	operation_list_params.data_source_callback = callback(self._primary_paper_panel, self, self)
	operation_list_params.item_class = RaidGUIControlListItemIconDescription
	operation_list_params.item_params = {
		icon_color = Color.black
	}
	operation_list_params.on_menu_move = {
		down = "info_button",
		left = "list_tabs",
		right = "difficulty_stepper"
	}
	slot7 = "_on_operation_list_selected"
	operation_list_params.selected_callback = callback(Color.black, self, self)
	slot7 = "_on_operation_list_unselected"
	operation_list_params.unselected_callback = callback(Color.black, self, self)
	slot6 = operation_list_params
	self._operation_list = self._operation_list_panel.list_active(Color.black, self._operation_list_panel)
	slot6 = 0

	self._operation_list.set_alpha(Color.black, self._operation_list)

	slot6 = false

	self._operation_list.set_visible(Color.black, self._operation_list)

	return 
end
function MissionSelectionGui:_layout_intel_image_grid()
	local intel_image_grid_params = {
		name = "intel_image_grid",
		y = 128,
		x = 10
	}
	slot6 = "_on_intel_image_selected"
	intel_image_grid_params.on_click_callback = callback(slot3, self, self)
	slot4 = self._primary_paper_panel
	intel_image_grid_params.layer = self._primary_paper_panel.layer(slot3) + 1
	intel_image_grid_params.on_menu_move = {
		left = "list_tabs",
		down = "intel_button"
	}
	slot6 = intel_image_grid_params
	self._intel_image_grid = self._primary_paper_panel.create_custom_control(slot3, self._primary_paper_panel, RaidGUIControlIntelImageGrid)
	slot5 = 0

	self._intel_image_grid.set_alpha(slot3, self._intel_image_grid)

	slot5 = false

	self._intel_image_grid.set_visible(slot3, self._intel_image_grid)

	return 
end
function MissionSelectionGui:_on_intel_image_selected(image_index, image_data)
	slot8 = image_data.description_id

	self._intel_image_details.set_image(slot4, self._intel_image_details, image_data.photo, image_data.title_id)

	return 
end
function MissionSelectionGui:_layout_info_buttons()
	local wrapper_panel_padding = 10
	local info_buttons_panel_params = {
		name = "info_buttons_panel",
		h = 96,
		y = 0
	}
	slot5 = self._primary_paper_title
	info_buttons_panel_params.x = self._primary_paper_title.x(slot4)
	slot5 = self._primary_paper_panel
	info_buttons_panel_params.w = self._primary_paper_panel.w(slot4) * 0.85
	slot5 = self._primary_paper_panel
	info_buttons_panel_params.layer = self._primary_paper_panel.layer(slot4) + 1
	slot6 = info_buttons_panel_params
	self._info_buttons_panel = self._primary_paper_panel.panel(slot4, self._primary_paper_panel)
	slot5 = self._info_buttons_panel
	slot10 = self._primary_paper_panel
	slot8 = self._primary_paper_panel.w(slot9) / 2

	self._info_buttons_panel.set_center_x(slot4, math.floor(slot7))

	slot9 = self._info_buttons_panel
	slot6 = self._primary_paper_panel.h(slot7) - self._info_buttons_panel.h(self._primary_paper_panel) - 16

	self._info_buttons_panel.set_y(slot4, self._info_buttons_panel)

	local info_button_params = {
		name = "info_button",
		active = true,
		icon = "ico_info",
		x = wrapper_panel_padding
	}
	slot8 = true
	info_button_params.text = self.translate(self._info_buttons_panel, self, "menu_info_button_title")
	info_button_params.on_click_callback = callback(self._info_buttons_panel, self, self)
	info_button_params.on_menu_move = {
		up = "intel_image_grid",
		left = "list_tabs",
		right = "intel_button"
	}
	slot7 = info_button_params
	self._info_button = self._info_buttons_panel.info_button(self._info_buttons_panel, self._info_buttons_panel)
	slot9 = self._info_buttons_panel
	slot7 = self._info_buttons_panel.h("_on_info_clicked") / 2

	self._info_button.set_center_y(self._info_buttons_panel, self._info_button)

	slot7 = 0

	self._info_button.set_x(self._info_buttons_panel, self._info_button)

	local intel_button_params = {
		name = "intel_button",
		icon = "ico_intel"
	}
	slot9 = true
	intel_button_params.text = self.translate(self._info_button, self, "menu_intel_button_title")
	intel_button_params.on_menu_move = {
		up = "intel_image_grid",
		left = "info_button",
		right = "audio_button"
	}
	intel_button_params.on_click_callback = callback(self._info_button, self, self)
	slot8 = intel_button_params
	self._intel_button = self._info_buttons_panel.info_button(self._info_button, self._info_buttons_panel)
	slot10 = self._info_buttons_panel
	slot8 = self._info_buttons_panel.h("_on_intel_clicked") / 2

	self._intel_button.set_center_y(self._info_button, self._intel_button)

	slot10 = self._info_button
	slot8 = 130 + self._info_button.center_x("_on_intel_clicked")

	self._intel_button.set_center_x(self._info_button, self._intel_button)

	local audio_button_params = {
		name = "audio_button",
		auto_deactivate = true,
		icon = "ico_play_audio"
	}
	slot10 = true
	audio_button_params.text = self.translate(self._intel_button, self, "menu_audio_button_title")
	audio_button_params.on_menu_move = {
		up = "intel_image_grid",
		left = "intel_button",
		right = "difficulty_stepper"
	}
	audio_button_params.on_click_callback = callback(self._intel_button, self, self)
	slot9 = audio_button_params
	self._audio_button = self._info_buttons_panel.info_button(self._intel_button, self._info_buttons_panel)
	slot11 = self._info_buttons_panel
	slot9 = self._info_buttons_panel.h("_on_audio_clicked") / 2

	self._audio_button.set_center_y(self._intel_button, self._audio_button)

	slot11 = self._info_button
	slot9 = 260 + self._info_button.center_x("_on_audio_clicked")

	self._audio_button.set_center_x(self._intel_button, self._audio_button)

	return 
end
function MissionSelectionGui:_layout_secondary_paper()
	local paper_image = "menu_paper"
	local soe_emblem_image = "icon_paper_stamp"
	local secondary_paper_panel_params = {
		name = "secondary_paper_panel",
		h = 768,
		y = 118,
		w = 524,
		x = 580,
		layer = RaidGuiBase.FOREGROUND_LAYER
	}
	slot7 = secondary_paper_panel_params
	self._secondary_paper_panel = self._root_panel.panel(slot5, self._root_panel)
	local secondary_paper_params = {
		name = "secondary_paper",
		y = 0,
		x = 0
	}
	slot7 = self._secondary_paper_panel
	secondary_paper_params.w = self._secondary_paper_panel.w(self._root_panel)
	slot7 = self._secondary_paper_panel
	secondary_paper_params.h = self._secondary_paper_panel.h(self._root_panel)
	secondary_paper_params.texture = tweak_data.gui.images[paper_image].texture
	secondary_paper_params.texture_rect = tweak_data.gui.images[paper_image].texture_rect
	slot8 = secondary_paper_params
	self._secondary_paper = self._secondary_paper_panel.bitmap(self._root_panel, self._secondary_paper_panel)
	slot7 = self

	self._layout_secondary_intel(self._root_panel)

	slot7 = self

	self._layout_secondary_save_info(self._root_panel)

	slot7 = self._secondary_paper_panel
	slot10 = self._primary_paper_panel

	self._secondary_paper_panel.set_x(self._root_panel, self._primary_paper_panel.x(slot9))

	slot8 = MissionSelectionGui.BACKGROUND_PAPER_ROTATION

	self._secondary_paper_panel.set_rotation(self._root_panel, self._secondary_paper_panel)

	slot10 = self._primary_paper_panel
	slot8 = self._primary_paper_panel.w(slot9) * MissionSelectionGui.BACKGROUND_PAPER_SCALE

	self._secondary_paper_panel.set_w(self._root_panel, self._secondary_paper_panel)

	slot10 = self._primary_paper_panel
	slot8 = self._primary_paper_panel.h(MissionSelectionGui.BACKGROUND_PAPER_SCALE) * MissionSelectionGui.BACKGROUND_PAPER_SCALE

	self._secondary_paper_panel.set_h(self._root_panel, self._secondary_paper_panel)

	slot8 = MissionSelectionGui.BACKGROUND_PAPER_COLOR

	self._secondary_paper.set_color(self._root_panel, self._secondary_paper)

	slot8 = MissionSelectionGui.BACKGROUND_PAPER_ALPHA

	self._secondary_paper_panel.set_alpha(self._root_panel, self._secondary_paper_panel)

	self._secondary_paper_shown = false
	self._paper_animation_t = 0

	return 
end
function MissionSelectionGui:_layout_secondary_intel()
	local intel_image_details_params = {
		name = "intel_image_details",
		x = 35,
		y = 144
	}
	slot6 = intel_image_details_params
	self._intel_image_details = self._secondary_paper_panel.create_custom_control(slot3, self._secondary_paper_panel, RaidGUIControlIntelImageDetails)
	self._active_secondary_paper_control = self._intel_image_details

	return 
end
function MissionSelectionGui:_layout_secondary_save_info()
	local save_info_params = {
		name = "save_info",
		y = 0,
		x = 0
	}
	slot4 = self._secondary_paper_panel
	save_info_params.w = self._secondary_paper_panel.w(slot3)
	slot4 = self._secondary_paper_panel
	save_info_params.h = self._secondary_paper_panel.h(slot3)
	slot4 = self._secondary_paper_panel
	save_info_params.layer = self._secondary_paper_panel.layer(slot3) + 1
	slot6 = save_info_params
	self._save_info = self._secondary_paper_panel.create_custom_control(slot3, self._secondary_paper_panel, RaidGUIControlSaveInfo)

	return 
end
function MissionSelectionGui:_layout_start_button()
	local raid_start_button_params = {
		name = "raid_start_button",
		x = 6,
		layer = 1
	}
	slot5 = self._settings_panel
	slot3 = self._settings_panel.h(self._settings_panel)
	raid_start_button_params.y = self._settings_panel.y(slot3) + slot3 + 248
	slot6 = true
	raid_start_button_params.text = self.translate(slot3, self, "menu_start_button_title")
	slot6 = "_on_start_button_click"
	raid_start_button_params.on_click_callback = callback(slot3, self, self)
	slot5 = raid_start_button_params
	self._raid_start_button = self._raid_panel.short_primary_button(slot3, self._raid_panel)
	slot5 = 864

	self._raid_start_button.set_center_y(slot3, self._raid_start_button)

	slot4 = Network

	if not Network.is_server(slot3) then
		slot5 = false

		self._raid_start_button.set_visible(slot3, self._raid_start_button)

		local client_message_params = {
			name = "client_message",
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_32,
			color = tweak_data.gui.colors.raid_red
		}
		slot7 = true
		client_message_params.text = self.translate(self._raid_start_button, self, "menu_only_host_can_start_missions")
		slot6 = client_message_params
		local client_message = self._raid_panel.label(self._raid_start_button, self._raid_panel)
		slot6 = client_message
		local _, _, _, h = client_message.text_rect(self._raid_panel)
		slot11 = h

		client_message.set_h(slot9, client_message)

		slot10 = client_message
		slot13 = self._raid_start_button

		client_message.set_center_y(slot9, self._raid_start_button.center_y(slot12))
	end

	return 
end
function MissionSelectionGui:_layout_start_disabled_message()
	local start_disabled_message_params = {
		name = "start_disabled_message",
		vertical = "center",
		h = 96,
		text = "",
		visible = false
	}
	slot4 = self._list_panel
	start_disabled_message_params.w = self._list_panel.w(slot3)
	start_disabled_message_params.font = tweak_data.gui.fonts.din_compressed
	start_disabled_message_params.font_size = tweak_data.gui.font_sizes.small
	start_disabled_message_params.color = tweak_data.gui.colors.raid_red
	slot5 = start_disabled_message_params
	self._start_disabled_message = self._raid_panel.text(slot3, self._raid_panel)
	slot4 = self._start_disabled_message
	slot7 = self._raid_start_button

	self._start_disabled_message.set_center_y(slot3, self._raid_start_button.center_y(slot6))

	return 
end
function MissionSelectionGui:_layout_delete_button()
	local save_delete_button_params = {
		name = "save_delete_button",
		x = 6,
		layer = 1
	}
	slot5 = self._settings_panel
	slot3 = self._settings_panel.h(self._settings_panel)
	save_delete_button_params.y = self._settings_panel.y(slot3) + slot3 + 248
	slot6 = true
	save_delete_button_params.text = self.translate(slot3, self, "menu_delete_save_button_title")
	save_delete_button_params.on_click_callback = callback(slot3, self, self)
	slot5 = save_delete_button_params
	self._save_delete_button = self._raid_panel.short_secondary_button(slot3, self._raid_panel)
	slot8 = self._raid_list
	slot8 = self._raid_start_button
	slot8 = self._save_delete_button
	slot5 = (self._raid_list.x("_on_delete_button_click") + self._raid_list.w(self._raid_list)) - self._raid_start_button.x(self._raid_list) - self._save_delete_button.w(self._raid_list)

	self._save_delete_button.set_x(slot3, self._save_delete_button)

	slot4 = self._save_delete_button

	self._save_delete_button.hide(slot3)

	slot4 = self._save_delete_button
	slot7 = self._raid_start_button

	self._save_delete_button.set_center_y(slot3, self._raid_start_button.center_y(self._save_delete_button.w(self._raid_list)))

	return 
end
function MissionSelectionGui:_layout_progression_unlock_timer()

	-- Decompilation error in this vicinity:
	local progression_timer_panel_params = {
		halign = "right",
		name = "progression_timer_panel",
		h = 64,
		valign = "top"
	}
	slot5 = progression_timer_panel_params
	self._progression_timer_panel = self._raid_panel.panel(slot3, self._raid_panel)
	local progression_timer_icon_params = {
		name = "progression_timer_icon",
		valign = "center",
		halign = "left",
		texture = tweak_data.gui.icons.missions_raids_category_menu.texture,
		texture_rect = tweak_data.gui.icons.missions_raids_category_menu.texture_rect,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot6 = progression_timer_icon_params
	local progression_timer_icon = self._progression_timer_panel.bitmap(self._raid_panel, self._progression_timer_panel)
	slot9 = self._progression_timer_panel

	progression_timer_icon.set_center_y(self._progression_timer_panel, progression_timer_icon)

	slot6 = managers.progression
	local is_final_unlock_cycle = managers.progression.at_final_unlock_cycle(self._progression_timer_panel)
	local timer_title_params = {
		name = "progression_timer_title",
		vertical = "center",
		h = 32,
		halign = "left",
		x = 64,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot10 = true
	timer_title_params.text = self.translate(self._progression_timer_panel.h(slot8) / 2, self, (is_final_unlock_cycle and "raid_final_raids_in_title") or "raid_next_raid_in_title")
	local timer_title = self._progression_timer_panel.text(self._progression_timer_panel.h(slot8) / 2, self._progression_timer_panel)
	local timer_description_params = {
		name = "progression_timer_description",
		vertical = "center",
		h = 32,
		halign = "left",
		x = 64,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey_effects
	}
	slot12 = true
	timer_description_params.text = self.translate(timer_title_params, self, (is_final_unlock_cycle and "raid_final_raids_in_description") or "raid_next_raid_in_description")
	slot11 = timer_description_params
	local timer_description = self._progression_timer_panel.text(timer_title_params, self._progression_timer_panel)

	timer_description.set_bottom(self._progression_timer_panel, self._progression_timer_panel.h(slot13))

	local timer_params = {
		name = "timer",
		vertical = "center",
		h = 32,
		text = "",
		horizontal = "right",
		halign = "right",
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot13 = timer_params
	local timer = self._progression_timer_panel.text(timer_description, self._progression_timer_panel)
	slot15 = managers.progression
	local remaining_time = math.floor(managers.progression.time_until_next_unlock(self._progression_timer_panel))
	local hours = math.floor(managers.progression.time_until_next_unlock)
	remaining_time = remaining_time - hours * 3600
	local minutes = math.floor(remaining_time / 3600)
	remaining_time = remaining_time - minutes * 60
	slot16 = remaining_time
	local seconds = math.round(remaining_time / 60)
	local text = text .. string.format(slot18, "%02d") .. ":" .. string.format(minutes, "%02d")
	slot20 = text

	timer.set_text(":", timer)

	slot19 = timer
	local _, _, w, _ = timer.text_rect(":")
	slot24 = w

	timer.set_w(seconds, timer)

	slot23 = timer

	timer.set_right(seconds, self._progression_timer_panel.w(slot25))

	slot23 = timer_title
	local _, _, w, _ = timer_title.text_rect(seconds)
	slot28 = w

	timer_title.set_w(self._progression_timer_panel, timer_title)

	slot27 = timer_description
	local _, _, w, _ = timer_description.text_rect(self._progression_timer_panel)

	timer_description.set_w(slot30, timer_description)

	slot34 = timer
	local panel_w = math.max(slot30, timer_description.w(timer_title)) + 64
	slot32 = self._progression_timer_panel
	slot38 = self._settings_panel
	slot36 = self._settings_panel.w(slot37) - 8

	self._progression_timer_panel.set_w(timer_title.w(w) + 32 + timer.w(timer_title), math.max(timer_description, panel_w))

	slot32 = self._progression_timer_panel
	slot35 = self._raid_panel

	self._progression_timer_panel.set_right(timer_title.w(w) + 32 + timer.w(timer_title), self._raid_panel.w(timer_description))

	return 
end
function MissionSelectionGui:_create_video_panels()
	slot3 = managers.gui_data
	self._fullscreen_ws = managers.gui_data.create_fullscreen_16_9_workspace(slot2)
	slot3 = self._fullscreen_ws
	self._full_panel = self._fullscreen_ws.panel(slot2)
	slot3 = Overlay
	slot3 = Overlay.gui(slot2)
	self._safe_rect_workspace = Overlay.gui(slot2).create_screen_workspace(slot2)
	slot4 = self._safe_rect_workspace

	managers.gui_data.layout_workspace(slot2, managers.gui_data)

	slot3 = self._safe_rect_workspace
	self._safe_panel = self._safe_rect_workspace.panel(slot2)

	return 
end
function MissionSelectionGui:_play_operations_intro_video()
	local operations_intro_video = "movies/vanilla/operation_briefings/global/03_operation_brief_op-c3_v004"
	slot5 = operations_intro_video
	local operations_intro_video_id = tweak_data.intel.get_control_video_by_path(slot3, tweak_data.intel)

	if operations_intro_video_id then
		slot7 = {
			operations_intro_video_id
		}

		managers.unlock.unlock(slot4, managers.unlock, {
			slot = UnlockManager.SLOT_PROFILE,
			identifier = UnlockManager.CATEGORY_CONTROL_ARCHIVE
		})
	end

	local video_panel_params = {
		is_root_panel = true,
		layer = 100
	}
	slot8 = video_panel_params
	self._video_panel = RaidGUIPanel.new(slot5, RaidGUIPanel, self._full_panel)
	local video_panel_background_params = {
		layer = 1,
		name = "video_background",
		halign = "scale",
		valign = "scale",
		color = Color.black
	}
	local video_panel_background = self._video_panel.rect(RaidGUIPanel, self._video_panel)
	local video_params = {
		layer = 2
	}
	slot9 = self._video_panel
	video_params.layer = self._video_panel.layer(video_panel_background_params) + 1
	video_params.video = operations_intro_video
	slot9 = self._video_panel
	video_params.width = self._video_panel.w(video_panel_background_params)
	slot10 = video_params
	self._control_briefing_video = self._video_panel.video(video_panel_background_params, self._video_panel)
	slot14 = self._control_briefing_video
	slot10 = self._video_panel.w(slot11) * self._control_briefing_video.video_height(self._video_panel) / self._control_briefing_video.video_width(self._control_briefing_video)

	self._control_briefing_video.set_h(video_panel_background_params, self._control_briefing_video)

	slot12 = self._video_panel
	slot10 = self._video_panel.h(self._control_briefing_video.video_height(self._video_panel) / self._control_briefing_video.video_width(self._control_briefing_video)) / 2

	self._control_briefing_video.set_center_y(video_panel_background_params, self._control_briefing_video)

	self._playing_briefing_video = true
	slot9 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(video_panel_background_params) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	local press_any_key_params = {
		name = "press_any_key_prompt",
		alpha = 0
	}
	slot13 = tweak_data.gui.font_sizes.size_32
	press_any_key_params.font = tweak_data.gui.get_font_path(slot10, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	press_any_key_params.font_size = tweak_data.gui.font_sizes.size_32
	slot14 = press_any_key_text
	press_any_key_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	press_any_key_params.color = tweak_data.gui.colors.raid_dirty_white
	slot11 = self._control_briefing_video
	press_any_key_params.layer = self._control_briefing_video.layer(slot10) + 100
	slot12 = press_any_key_params
	local press_any_key_prompt = self._safe_panel.text(slot10, self._safe_panel)
	slot12 = press_any_key_prompt
	local _, _, w, h = press_any_key_prompt.text_rect(self._safe_panel)
	slot17 = w

	press_any_key_prompt.set_w(slot15, press_any_key_prompt)

	slot17 = h

	press_any_key_prompt.set_h(slot15, press_any_key_prompt)

	slot19 = self._safe_panel
	slot17 = self._safe_panel.w(slot18) - 50

	press_any_key_prompt.set_right(slot15, press_any_key_prompt)

	slot19 = self._safe_panel
	slot17 = self._safe_panel.h(slot18) - 50

	press_any_key_prompt.set_bottom(slot15, press_any_key_prompt)

	slot16 = press_any_key_prompt
	slot21 = "_animate_show_press_any_key_prompt"

	press_any_key_prompt.animate(slot15, callback(slot18, self, self))

	slot17 = "menu_volume_set"

	managers.menu_component.post_event(slot15, managers.menu_component)

	slot16 = managers.music

	managers.music.stop(slot15)

	slot17 = true

	self._control_briefing_video.set_selected(slot15, self._control_briefing_video)

	slot16 = self._root_panel

	self._root_panel.hide(slot15)

	slot17 = -3000

	self._root_panel.set_x(slot15, self._root_panel)

	slot17 = 3000

	self._root_panel.set_y(slot15, self._root_panel)

	slot16 = managers.raid_menu
	slot21 = "_destroy_operations_intro_video"

	managers.raid_menu.register_on_escape_callback(slot15, callback(slot18, self, self))

	return 
end
function MissionSelectionGui:_animate_show_press_any_key_prompt(prompt)
	local duration = 0.7
	local t = 0
	slot6 = 3

	wait(slot5)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 0.85)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0.85

	prompt.set_alpha(slot5, prompt)

	return 
end
function MissionSelectionGui:_animate_change_press_any_key_prompt(prompt)
	local fade_out_duration = 0.25
	slot5 = prompt
	local t = (1 - prompt.alpha(slot4)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0.85, -0.85)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0

	prompt.set_alpha(slot5, prompt)

	slot6 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(slot5) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	slot7 = prompt

	prompt.set_text(slot6, utf8.to_upper(managers.localization.text(slot11, managers.localization)))

	slot7 = prompt
	local _, _, w, h = prompt.text_rect(slot6)
	slot12 = w

	prompt.set_w(managers.localization.text, prompt)

	slot12 = h

	prompt.set_h(managers.localization.text, prompt)

	slot14 = self._safe_panel
	slot12 = self._safe_panel.w(press_any_key_text) - 50

	prompt.set_right(managers.localization.text, prompt)

	local fade_in_duration = 0.25
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot12, t, 0, 0.85)
		slot15 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot13 = 0.85

	prompt.set_alpha(slot11, prompt)

	return 
end
function MissionSelectionGui:on_controller_hotswap()
	slot4 = "press_any_key_prompt"
	local press_any_key_prompt = self._safe_panel.child(slot2, self._safe_panel)

	if press_any_key_prompt then
		slot4 = press_any_key_prompt

		press_any_key_prompt.stop(slot3)

		slot4 = press_any_key_prompt
		slot9 = "_animate_change_press_any_key_prompt"

		press_any_key_prompt.animate(slot3, callback(slot6, self, self))
	end

	return 
end
function MissionSelectionGui:update(t, dt)
	if self._playing_briefing_video then
		slot5 = self
	end

	return 
end
function MissionSelectionGui:_destroy_operations_intro_video()
	slot3 = self._control_briefing_video

	self._control_briefing_video.destroy(slot2)

	slot3 = self._video_panel

	if self._video_panel.engine_panel_alive(slot2) then
		slot4 = self._control_briefing_video

		self._video_panel.remove(slot2, self._video_panel)

		slot3 = self._video_panel

		self._video_panel.remove_background(slot2)

		slot3 = self._video_panel
		slot7 = "video_background"

		self._video_panel.remove(slot2, self._video_panel.child(slot5, self._video_panel))

		slot3 = self._video_panel
		slot7 = "disclaimer"

		self._video_panel.remove(slot2, self._video_panel.child(slot5, self._video_panel))
	end

	self._control_briefing_video = nil
	self._video_panel = nil
	self._playing_briefing_video = false
	slot3 = self._safe_panel

	if alive(slot2) then
		slot4 = "press_any_key_prompt"
		slot3 = self._safe_panel.child(slot2, self._safe_panel)

		self._safe_panel.child(slot2, self._safe_panel).stop(slot2)

		slot3 = self._safe_panel
		slot7 = "press_any_key_prompt"

		self._safe_panel.remove(slot2, self._safe_panel.child(slot5, self._safe_panel))
	end

	slot3 = self

	self._finish_video(slot2)

	return true
end
function MissionSelectionGui:is_playing()
	slot3 = self._control_briefing_video

	if alive(slot2) then
		slot3 = self._control_briefing_video

		return self._control_briefing_video.loop_count(slot2) < 1
	else
		return false
	end

	return 
end
function MissionSelectionGui:is_skipped()
	slot3 = self._controller_list

	for _, controller in ipairs(slot2) do
		slot8 = controller

		if controller.get_any_input_released(slot7) then
			return true
		end
	end

	return false
end
function MissionSelectionGui:_finish_video()
	slot4 = "menu_volume_reset"

	managers.menu_component.post_event(slot2, managers.menu_component)

	slot3 = managers.music

	managers.music.stop(slot2)

	slot5 = true

	managers.music.post_event(slot2, managers.music, "music_camp")

	slot4 = 0

	self._root_panel.set_x(slot2, self._root_panel)

	slot4 = 0

	self._root_panel.set_y(slot2, self._root_panel)

	slot3 = self._root_panel

	self._root_panel.show(slot2)

	slot4 = nil

	managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

	return 
end
function MissionSelectionGui:_on_mission_type_changed(mission_type)
	self._current_mission_type = mission_type

	if mission_type == "raids" then
		slot4 = self

		self._select_raids_tab(slot3)
	else
		slot4 = self

		self._select_operations_tab(slot3)
	end

	return 
end
function MissionSelectionGui:_select_raids_tab()
	self._selected_save_slot = nil
	self._continue_slot_selected = nil
	slot4 = false

	self._slot_list.set_selected(slot2, self._slot_list)

	slot4 = true

	self._raid_list.set_selected(slot2, self._raid_list)

	slot3 = self._save_delete_button

	self._save_delete_button.animate_hide(slot2)

	slot4 = true

	self._raid_list_panel.set_visible(slot2, self._raid_list_panel)

	slot4 = 1

	self._raid_list_panel.set_alpha(slot2, self._raid_list_panel)

	slot4 = false

	self._slot_list_panel.set_visible(slot2, self._slot_list_panel)

	slot4 = 0

	self._slot_list_panel.set_alpha(slot2, self._slot_list_panel)

	return 
end
function MissionSelectionGui:_select_operations_tab()
	slot4 = false

	self._raid_list.set_selected(slot2, self._raid_list)

	slot4 = true

	self._slot_list.set_selected(slot2, self._slot_list)

	slot4 = false

	self._raid_list_panel.set_visible(slot2, self._raid_list_panel)

	slot4 = 0

	self._raid_list_panel.set_alpha(slot2, self._raid_list_panel)

	slot4 = true

	self._slot_list_panel.set_visible(slot2, self._slot_list_panel)

	slot4 = 1

	self._slot_list_panel.set_alpha(slot2, self._slot_list_panel)

	return 
end
function MissionSelectionGui:_select_raid(raid)
	return 
end
function MissionSelectionGui:_on_start_button_click()
	slot3 = managers.challenge_cards

	managers.challenge_cards.remove_active_challenge_card(slot2)

	if self._selected_job_id then
		slot4 = self._selected_job_id

		self._start_job(slot2, self)
	elseif self._continue_slot_selected then
		slot3 = self

		self._continue_operation(slot2)
	else
		slot3 = self

		self._display_second_screen(slot2)
	end

	return 
end
function MissionSelectionGui:_on_delete_button_click()
	local selected_job = managers.raid_job.get_save_slots(slot2)[self._continue_slot_selected].current_job
	slot4 = managers.raid_job
	local current_job = managers.raid_job.current_job(managers.raid_job)

	if current_job and current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		slot5 = managers.raid_job
	else
		local params = {}
		slot8 = "on_save_slot_delete_confirmed"
		params.yes_callback = callback(slot5, self, self)
		slot7 = params

		managers.menu.show_save_slot_delete_confirm_dialog(slot5, managers.menu)
	end

	return 
end
function MissionSelectionGui:on_save_slot_delete_confirmed()
	if self._continue_slot_selected then
		slot4 = self._continue_slot_selected

		managers.raid_job.delete_save(slot2, managers.raid_job)
		self._slot_list.refresh_data(slot2)

		local slot_to_select = self._continue_slot_selected
		slot5 = false

		self._raid_list.set_selected(self._slot_list, self._raid_list)

		slot5 = true

		self._slot_list.set_selected(self._slot_list, self._slot_list)

		slot5 = slot_to_select

		self._slot_list.click_item(self._slot_list, self._slot_list)

		slot4 = self

		self._on_empty_slot_selected(self._slot_list)
	end

	return 
end
function MissionSelectionGui:_select_save_slot(slot)
	return 
end
function MissionSelectionGui:_set_settings_enabled(enabled)
	slot4 = self._settings_controls

	for index, setting_control in pairs(slot3) do
		slot10 = enabled

		setting_control.set_enabled(slot8, setting_control)
	end

	return 
end
function MissionSelectionGui:_on_raid_clicked(raid_data)
	if self._selected_job_id and self._selected_job_id == raid_data.value then
		return 
	end

	if not self._selected_job_id or self._selected_job_id ~= raid_data.value then
		slot4 = self

		self._stop_mission_briefing_audio(slot3)
	end

	slot6 = raid_data.value
	local difficulty_available = managers.progression.get_mission_progression(slot3, managers.progression, tweak_data.operations.missions[raid_data.value].job_type)

	if difficulty_available then
		slot5 = tweak_data
		slot8 = self._difficulty_stepper

		if difficulty_available < tweak_data.difficulty_to_index(slot4, self._difficulty_stepper.get_value(slot7)) then
			slot9 = difficulty_available
			slot7 = true

			self._difficulty_stepper.set_value_and_render(slot4, self._difficulty_stepper, tweak_data.index_to_difficulty(slot7, tweak_data))

			slot5 = self

			self._check_difficulty_warning(slot4)
		end
	end

	slot5 = self._operation_tutorialization_panel
	slot5 = self._operation_tutorialization_panel.get_engine_panel(slot4)

	self._operation_tutorialization_panel.get_engine_panel(slot4).stop(slot4)

	slot5 = self._operation_tutorialization_panel
	slot10 = "_animate_hide_operation_tutorialization"

	self._operation_tutorialization_panel.get_engine_panel(slot4).animate(slot4, callback(slot7, self, self))

	self._selected_job_id = raid_data.value
	self._selected_new_operation_index = nil
	local job_tweak_data = tweak_data.operations.missions[self._selected_job_id]
	slot8 = self._selected_job_id

	if not managers.progression.mission_unlocked(self._operation_tutorialization_panel.get_engine_panel(slot4), managers.progression, job_tweak_data.job_type) and not job_tweak_data.consumable and not job_tweak_data.debug then
		slot6 = Network

		if Network.is_server(slot5) then
			slot6 = self._start_disabled_message
			slot11 = true

			self._start_disabled_message.set_text(slot5, self.translate(slot8, self, "raid_locked_progression"))

			slot7 = true

			self._start_disabled_message.set_visible(slot5, self._start_disabled_message)

			slot7 = false

			self._raid_start_button.set_visible(slot5, self._raid_start_button)
		end

		slot6 = self

		self._on_locked_raid_clicked(slot5)
	else
		slot6 = Network

		if Network.is_server(slot5) then
			slot7 = false

			self._start_disabled_message.set_visible(slot5, self._start_disabled_message)

			slot7 = true

			self._raid_start_button.set_visible(slot5, self._raid_start_button)
		end

		slot8 = self._selected_job_id
		local difficulty_available, difficulty_completed = managers.progression.get_mission_progression(slot5, managers.progression, OperationsTweakData.JOB_TYPE_RAID)
		slot10 = difficulty_completed

		self.set_difficulty_stepper_data(OperationsTweakData.JOB_TYPE_RAID, self, difficulty_available)

		local raid_tweak_data = tweak_data.operations.missions[raid_data.value]
		slot10 = tweak_data.gui.icons[raid_tweak_data.icon_menu].texture

		self._primary_paper_mission_icon.set_image(self, self._primary_paper_mission_icon)

		slot9 = self._primary_paper_mission_icon
		slot12 = tweak_data.gui.icons[raid_tweak_data.icon_menu].texture_rect

		self._primary_paper_mission_icon.set_texture_rect(self, unpack(raid_tweak_data.icon_menu))

		slot9 = self._primary_paper_mission_icon
		slot13 = raid_tweak_data.icon_menu

		self._primary_paper_mission_icon.set_w(self, tweak_data.gui.icon_w(raid_tweak_data.icon_menu, tweak_data.gui))

		slot9 = self._primary_paper_mission_icon
		slot13 = raid_tweak_data.icon_menu

		self._primary_paper_mission_icon.set_h(self, tweak_data.gui.icon_h(raid_tweak_data.icon_menu, tweak_data.gui))

		slot9 = self._primary_paper_title
		slot14 = true

		self._primary_paper_title.set_text(self, self.translate(raid_tweak_data.icon_menu, self, raid_tweak_data.name_id))

		if job_tweak_data.consumable then
			slot10 = true

			self._primary_paper_subtitle.set_visible(slot8, self._primary_paper_subtitle)

			slot9 = self._primary_paper_subtitle
			slot14 = true

			self._primary_paper_subtitle.set_text(slot8, self.translate(slot11, self, "menu_mission_selected_mission_type_consumable"))

			slot10 = false

			self._primary_paper_difficulty_indicator.set_visible(slot8, self._primary_paper_difficulty_indicator)
		elseif difficulty_available and difficulty_completed then
			slot10 = false

			self._primary_paper_subtitle.set_visible(slot8, self._primary_paper_subtitle)

			slot10 = true

			self._primary_paper_difficulty_indicator.set_visible(slot8, self._primary_paper_difficulty_indicator)

			slot11 = difficulty_completed

			self._primary_paper_difficulty_indicator.set_progress(slot8, self._primary_paper_difficulty_indicator, difficulty_available)
		end

		local stamp_texture = tweak_data.gui.icons[MissionSelectionGui.PAPER_STAMP_ICON]

		if raid_tweak_data.consumable then
			stamp_texture = tweak_data.gui.icons[MissionSelectionGui.PAPER_STAMP_ICON_CONSUMABLE]
		end

		slot11 = stamp_texture.texture

		self._soe_emblem.set_image(slot9, self._soe_emblem)

		slot10 = self._soe_emblem
		slot13 = stamp_texture.texture_rect

		self._soe_emblem.set_texture_rect(slot9, unpack(slot12))

		slot11 = true

		self._info_button.set_active(slot9, self._info_button)

		slot11 = false

		self._intel_button.set_active(slot9, self._intel_button)

		slot11 = false

		self._audio_button.set_active(slot9, self._audio_button)

		slot10 = self._info_button

		self._info_button.enable(slot9)

		slot10 = self._intel_button

		self._intel_button.enable(slot9)

		if raid_tweak_data.consumable then
			slot10 = self._audio_button

			self._audio_button.hide(slot9)
		else
			slot10 = self._audio_button

			self._audio_button.show(slot9)

			slot10 = self._audio_button

			self._audio_button.enable(slot9)
		end

		slot12 = true

		self._on_info_clicked(slot9, self, nil)

		slot10 = self._intel_image_grid

		self._intel_image_grid.clear_selection(slot9)

		slot10 = self

		self._stop_mission_briefing_audio(slot9)

		local short_audio_briefing_id = raid_tweak_data.short_audio_briefing_id

		if short_audio_briefing_id then
			slot17 = nil

			managers.queued_tasks.queue(slot10, managers.queued_tasks, "play_short_audio_briefing", self.play_short_audio_briefing, self, short_audio_briefing_id, 1)
		end
	end

	return 
end
function MissionSelectionGui:play_short_audio_briefing(briefing_id)
	slot5 = briefing_id
	self._briefing_audio = managers.menu_component.post_event(slot3, managers.menu_component)

	return 
end
function MissionSelectionGui:_on_raid_selected(raid_data)
	slot5 = raid_data

	self._on_raid_clicked(slot3, self)

	return 
end
function MissionSelectionGui:_on_mission_list_double_clicked(raid_data)

	-- Decompilation error in this vicinity:
	slot6 = raid_data.value
	local difficulty_available = managers.progression.get_mission_progression(slot3, managers.progression, tweak_data.operations.missions[raid_data.value].job_type)
	slot7 = raid_data.value

	return 
end
function MissionSelectionGui:_on_slot_double_clicked(slot_data)

	-- Decompilation error in this vicinity:
	slot4 = managers.progression
	slot4 = managers.raid_job
	local current_save_slots = managers.raid_job.get_save_slots(slot3)

	if current_save_slots[slot_data.value] then
		slot5 = self

		self._on_start_button_click(slot4)
	else
		slot5 = self

		self._display_second_screen(slot4)
	end

	return 
end
function MissionSelectionGui:_display_second_screen()
	self._current_display = MissionSelectionGui.DISPLAY_SECOND
	slot3 = self._primary_lists_panel

	self._primary_lists_panel.hide(slot2)

	slot4 = false

	self._list_tabs.set_enabled(slot2, self._list_tabs)

	slot3 = self._raid_list

	self._raid_list.hide(slot2)

	slot3 = self._slot_list

	self._slot_list.hide(slot2)

	slot3 = self._operations_list_panel

	self._operations_list_panel.show(slot2)

	slot4 = true

	self._new_operation_list.set_selected(slot2, self._new_operation_list)

	slot4 = false

	self._slot_list.set_selected(slot2, self._slot_list)

	local info_button_menu_move = {
		up = "intel_image_grid",
		left = "operation_list",
		right = "intel_button"
	}
	slot5 = info_button_menu_move

	self._info_button.set_menu_move_controls(self._slot_list, self._info_button)

	self._selected_save_slot = nil
	slot4 = self._operation_tutorialization_panel
	slot4 = self._operation_tutorialization_panel.get_engine_panel(self._slot_list)

	self._operation_tutorialization_panel.get_engine_panel(self._slot_list).stop(self._slot_list)

	slot4 = self._operation_tutorialization_panel
	slot4 = self._operation_tutorialization_panel.get_engine_panel(self._slot_list)
	slot9 = "_animate_hide_operation_tutorialization"

	self._operation_tutorialization_panel.get_engine_panel(self._slot_list).animate(self._slot_list, callback(slot6, self, self))

	slot4 = managers.raid_menu
	slot9 = "back_pressed"

	managers.raid_menu.register_on_escape_callback(self._slot_list, callback(slot6, self, self))

	return true, nil
end
function MissionSelectionGui:_display_first_screen()
	self._current_display = MissionSelectionGui.DISPLAY_FIRST
	slot3 = self._primary_lists_panel

	self._primary_lists_panel.show(slot2)

	slot4 = true

	self._list_tabs.set_enabled(slot2, self._list_tabs)

	slot3 = self._raid_list

	self._raid_list.show(slot2)

	slot3 = self._slot_list

	self._slot_list.show(slot2)

	slot3 = self._operations_list_panel

	self._operations_list_panel.hide(slot2)

	slot4 = false

	self._new_operation_list.set_selected(slot2, self._new_operation_list)

	slot4 = true

	self._slot_list.set_selected(slot2, self._slot_list)

	local info_button_menu_move = {
		up = "intel_image_grid",
		left = "list_tabs",
		right = "intel_button"
	}
	slot5 = info_button_menu_move

	self._info_button.set_menu_move_controls(self._slot_list, self._info_button)

	slot5 = nil

	managers.raid_menu.register_on_escape_callback(self._slot_list, managers.raid_menu)

	return true, nil
end
function MissionSelectionGui:_on_operation_selected(operation_data)
	self._selected_new_operation_index = operation_data.index

	if self._selected_job_id ~= operation_data.value then
		local clbk = callback(slot3, self._mission_description, self._mission_description, "set_text")
		slot5 = self._primary_paper

		self._primary_paper.stop(self._mission_description)

		slot10 = "_animate_change_primary_paper_control"
		slot8 = self._mission_description

		self._primary_paper.animate(self._mission_description, self._primary_paper, callback(operation_data.description, self, self), clbk)
	end

	slot4 = self._front_page_title

	self._front_page_title.stop(slot3)

	slot4 = self._front_page_title
	slot9 = "_animate_hide_front_page"

	self._front_page_title.animate(slot3, callback(slot6, self, self))

	if self._secondary_paper_shown then
		slot4 = self._secondary_paper

		self._secondary_paper.stop(slot3)

		slot4 = self._secondary_paper
		slot9 = "_animate_hide_secondary_paper"

		self._secondary_paper.animate(slot3, callback(slot6, self, self))
	end

	slot4 = self._info_button

	self._info_button.enable(slot3)

	slot4 = self._intel_button

	self._intel_button.enable(slot3)

	slot4 = self._audio_button

	self._audio_button.enable(slot3)

	slot5 = true

	self._info_button.set_active(slot3, self._info_button)

	slot5 = false

	self._intel_button.set_active(slot3, self._intel_button)

	slot5 = false

	self._audio_button.set_active(slot3, self._audio_button)

	slot5 = true

	self._set_settings_enabled(slot3, self)

	slot5 = operation_data.value
	local operation_tweak_data = tweak_data.operations.mission_data(slot3, tweak_data.operations)
	slot6 = tweak_data.gui.icons[operation_tweak_data.icon_menu].texture

	self._primary_paper_mission_icon.set_image(tweak_data.operations, self._primary_paper_mission_icon)

	slot5 = self._primary_paper_mission_icon
	slot8 = tweak_data.gui.icons[operation_tweak_data.icon_menu].texture_rect

	self._primary_paper_mission_icon.set_texture_rect(tweak_data.operations, unpack(operation_tweak_data.icon_menu))

	slot5 = self._primary_paper_mission_icon
	slot9 = operation_tweak_data.icon_menu

	self._primary_paper_mission_icon.set_w(tweak_data.operations, tweak_data.gui.icon_w(operation_tweak_data.icon_menu, tweak_data.gui))

	slot5 = self._primary_paper_mission_icon
	slot9 = operation_tweak_data.icon_menu

	self._primary_paper_mission_icon.set_h(tweak_data.operations, tweak_data.gui.icon_h(operation_tweak_data.icon_menu, tweak_data.gui))

	slot5 = self._primary_paper_title
	slot10 = true

	self._primary_paper_title.set_text(tweak_data.operations, self.translate(operation_tweak_data.icon_menu, self, operation_tweak_data.name_id))

	if self._selected_job_id ~= operation_data.value then
		slot5 = self

		self._stop_mission_briefing_audio(slot4)

		if operation_tweak_data.short_audio_briefing_id then
			local audio_briefing_id = operation_tweak_data.short_audio_briefing_id
			slot12 = nil

			managers.queued_tasks.queue(slot5, managers.queued_tasks, "play_short_audio_briefing", self.play_short_audio_briefing, self, audio_briefing_id, 1)
		end
	end

	self._selected_job_id = operation_data.value
	slot7 = operation_data.value
	local difficulty_available, difficulty_completed = managers.progression.get_mission_progression(slot4, managers.progression, OperationsTweakData.JOB_TYPE_OPERATION)
	slot9 = difficulty_completed

	self.set_difficulty_stepper_data(OperationsTweakData.JOB_TYPE_OPERATION, self, difficulty_available)

	slot8 = false

	self._primary_paper_subtitle.set_visible(OperationsTweakData.JOB_TYPE_OPERATION, self._primary_paper_subtitle)

	slot8 = true

	self._primary_paper_difficulty_indicator.set_visible(OperationsTweakData.JOB_TYPE_OPERATION, self._primary_paper_difficulty_indicator)

	slot9 = difficulty_completed

	self._primary_paper_difficulty_indicator.set_progress(OperationsTweakData.JOB_TYPE_OPERATION, self._primary_paper_difficulty_indicator, difficulty_available)

	return 
end
function MissionSelectionGui:_on_operation_list_selected()
	slot3 = self

	self._bind_operation_list_controller_inputs(slot2)

	return 
end
function MissionSelectionGui:_on_operation_list_unselected()
	slot3 = self

	self._bind_empty_slot_controller_inputs(slot2)

	return 
end
function MissionSelectionGui:_on_slot_clicked(slot_data)
	if self._selected_save_slot == slot_data.value then
		return 
	end

	slot4 = self

	self._stop_mission_briefing_audio(slot3)

	self._selected_save_slot = slot_data.value
	slot4 = managers.progression

	if managers.progression.operations_state(slot3) == ProgressionManager.OPERATIONS_STATE_LOCKED then
		slot4 = Network

		if Network.is_server(slot3) then
			slot8 = {
				LEVEL = tostring(slot10)
			}
			slot11 = tweak_data.operations.progression.operations_unlock_level
			local message_text = utf8.to_upper(managers.localization.text(slot5, managers.localization, "operations_locked_progression"))
			slot6 = message_text

			self._start_disabled_message.set_text(managers.localization.text, self._start_disabled_message)

			slot6 = true

			self._start_disabled_message.set_visible(managers.localization.text, self._start_disabled_message)

			slot6 = false

			self._raid_start_button.set_visible(managers.localization.text, self._raid_start_button)
		end

		self._selected_job_id = nil
		self._selected_new_operation_index = nil
		self._continue_slot_selected = nil
		slot4 = self._front_page_icon

		self._front_page_icon.stop(slot3)

		slot9 = "_animate_change_front_page_data"
		slot9 = tweak_data.gui.colors.raid_light_gold

		self._front_page_icon.animate(slot3, self._front_page_icon, callback(slot6, self, self), "xp_events_missions_operations_category", "menu_mission_selected_mission_type_operation", "folder_mission_op")

		slot4 = self._front_page_title

		self._front_page_title.stop(slot3)

		slot4 = self._front_page_title
		slot9 = "_animate_show_front_page"

		self._front_page_title.animate(slot3, callback("xp_events_missions_operations_category", self, self))

		slot4 = self._operation_tutorialization_panel
		slot4 = self._operation_tutorialization_panel.get_engine_panel(slot3)

		self._operation_tutorialization_panel.get_engine_panel(slot3).stop(slot3)

		slot4 = self._operation_tutorialization_panel
		slot4 = self._operation_tutorialization_panel.get_engine_panel(slot3)
		slot9 = "_animate_show_operation_tutorialization"

		self._operation_tutorialization_panel.get_engine_panel(slot3).animate(slot3, callback("xp_events_missions_operations_category", self, self))

		slot4 = self

		self._bind_locked_raid_controller_inputs(slot3)
	else
		slot4 = managers.progression

		if managers.progression.operations_state(slot3) == ProgressionManager.OPERATIONS_STATE_PENDING then
			local delay = 0.1
			slot5 = managers.controller

			if managers.controller.is_using_controller(slot4) then
				delay = 0.2
			end

			slot11 = nil

			managers.queued_tasks.queue(slot4, managers.queued_tasks, "mission_screen_play_operation_intro_video", self._play_operations_intro_video, self, nil, delay)

			slot6 = ProgressionManager.OPERATIONS_STATE_UNLOCKED

			managers.progression.set_operations_state(slot4, managers.progression)
		end

		slot4 = managers.raid_job
		local save_slots = managers.raid_job.get_save_slots(slot3)

		if save_slots[self._selected_save_slot] then
			slot5 = self

			self._on_save_selected(slot4)
		else
			slot5 = self

			self._on_empty_slot_selected(slot4)
		end

		slot5 = Network

		if Network.is_server(slot4) then
			slot6 = false

			self._start_disabled_message.set_visible(slot4, self._start_disabled_message)

			slot6 = true

			self._raid_start_button.set_visible(slot4, self._raid_start_button)

			slot5 = self._raid_start_button

			self._raid_start_button.enable(slot4)
		end
	end

	return 
end
function MissionSelectionGui:_on_slot_selected(slot_data)
	slot5 = slot_data

	self._on_slot_clicked(slot3, self)

	return 
end
function MissionSelectionGui:set_current_slot_progress_report()
	slot3 = managers.raid_job
	local save_slots = managers.raid_job.get_save_slots(slot2)

	if not self._selected_save_slot or not save_slots[self._selected_save_slot] then
		return 
	end

	local selected_job = save_slots[self._selected_save_slot].current_job
	slot6 = selected_job.job_id

	self._operation_progress.set_operation(slot4, self._operation_progress)

	slot6 = selected_job.events_index

	self._operation_progress.set_event_index(slot4, self._operation_progress)

	slot6 = selected_job.current_event

	self._operation_progress.set_number_drawn(slot4, self._operation_progress)

	return 
end
function MissionSelectionGui:_on_save_selected()
	self._selected_job_id = nil
	self._selected_new_operation_index = nil
	self._continue_slot_selected = self._selected_save_slot
	slot3 = managers.raid_job
	local current_slot_data = managers.raid_job.get_save_slots(slot2)[self._continue_slot_selected]
	local current_job = current_slot_data.current_job
	local name_id = current_job.name_id
	local total_events = #current_job.events_index
	slot9 = total_events
	local current_event = math.clamp(slot6, current_job.current_event, 1)
	local mission_progress_fraction = " (" .. current_event .. "/" .. total_events .. ")"
	slot11 = true
	local title_text = self.translate("/", self, name_id) .. mission_progress_fraction
	slot11 = title_text

	self._primary_paper_title.set_text(self, self._primary_paper_title)

	slot11 = current_job.job_id
	local operation_tweak_data = tweak_data.operations.mission_data(self, tweak_data.operations)
	slot12 = tweak_data.gui.icons[operation_tweak_data.icon_menu].texture

	self._primary_paper_mission_icon.set_image(tweak_data.operations, self._primary_paper_mission_icon)

	slot11 = self._primary_paper_mission_icon
	slot14 = tweak_data.gui.icons[operation_tweak_data.icon_menu].texture_rect

	self._primary_paper_mission_icon.set_texture_rect(tweak_data.operations, unpack(operation_tweak_data.icon_menu))

	slot11 = self._primary_paper_mission_icon
	slot15 = operation_tweak_data.icon_menu

	self._primary_paper_mission_icon.set_w(tweak_data.operations, tweak_data.gui.icon_w(operation_tweak_data.icon_menu, tweak_data.gui))

	slot11 = self._primary_paper_mission_icon
	slot15 = operation_tweak_data.icon_menu

	self._primary_paper_mission_icon.set_h(tweak_data.operations, tweak_data.gui.icon_h(operation_tweak_data.icon_menu, tweak_data.gui))

	slot12 = current_slot_data.difficulty
	local difficulty = tweak_data.difficulty_to_index(tweak_data.operations, tweak_data)
	slot13 = difficulty

	self._primary_paper_difficulty_indicator.set_active_difficulty(tweak_data, self._primary_paper_difficulty_indicator)

	slot12 = managers.raid_menu

	if managers.raid_menu.is_pc_controller(tweak_data) then
		slot12 = Network
	else
		slot12 = self._save_delete_button

		self._save_delete_button.hide(slot11)
	end

	slot13 = true

	self._info_button.set_active(slot11, self._info_button)

	slot13 = false

	self._intel_button.set_active(slot11, self._intel_button)

	slot13 = false

	self._audio_button.set_active(slot11, self._audio_button)

	slot12 = self._info_button

	self._info_button.enable(slot11)

	slot12 = self._intel_button

	self._intel_button.enable(slot11)

	slot12 = self._audio_button

	self._audio_button.enable(slot11)

	slot14 = true

	self._on_info_clicked(slot11, self, nil)

	slot12 = self._intel_image_grid

	self._intel_image_grid.clear_selection(slot11)
	self._bind_save_slot_controller_inputs(slot11)

	local slot_list_move_controls = {
		right = "info_button"
	}
	slot14 = slot_list_move_controls

	self._slot_list.set_menu_move_controls(self, self._slot_list)

	return 
end
function MissionSelectionGui:_on_empty_slot_selected()
	self._continue_slot_selected = nil
	self._selected_job_id = nil
	slot3 = self._save_delete_button

	self._save_delete_button.animate_hide(slot2)

	slot3 = self._front_page_icon

	self._front_page_icon.stop(slot2)

	slot8 = "_animate_change_front_page_data"
	slot8 = tweak_data.gui.colors.raid_light_gold

	self._front_page_icon.animate(slot2, self._front_page_icon, callback(slot5, self, self), "xp_events_missions_operations_category", "menu_mission_selected_mission_type_operation", "folder_mission_op")

	slot3 = self._front_page_title

	self._front_page_title.stop(slot2)

	slot3 = self._front_page_title
	slot8 = "_animate_show_front_page"

	self._front_page_title.animate(slot2, callback("xp_events_missions_operations_category", self, self))

	slot3 = self._operation_tutorialization_panel
	slot3 = self._operation_tutorialization_panel.get_engine_panel(slot2)

	self._operation_tutorialization_panel.get_engine_panel(slot2).stop(slot2)

	slot3 = self._operation_tutorialization_panel
	slot3 = self._operation_tutorialization_panel.get_engine_panel(slot2)
	slot8 = "_animate_show_operation_tutorialization"

	self._operation_tutorialization_panel.get_engine_panel(slot2).animate(slot2, callback("xp_events_missions_operations_category", self, self))

	if self._secondary_paper_shown then
		slot3 = self._secondary_paper

		self._secondary_paper.stop(slot2)

		slot3 = self._secondary_paper
		slot8 = "_animate_hide_secondary_paper"

		self._secondary_paper.animate(slot2, callback(slot5, self, self))
	end

	local slot_list_move_controls = {}
	slot5 = slot_list_move_controls

	self._slot_list.set_menu_move_controls(slot3, self._slot_list)

	slot4 = self

	self._bind_empty_slot_controller_inputs(slot3)

	return 
end
function MissionSelectionGui:_on_locked_raid_clicked()
	slot3 = self._info_button

	self._info_button.disable(slot2)

	slot3 = self._intel_button

	self._intel_button.disable(slot2)

	slot3 = self._audio_button

	self._audio_button.disable(slot2)

	slot3 = self._secondary_paper

	self._secondary_paper.stop(slot2)

	slot3 = self._secondary_paper
	slot8 = "_animate_hide_secondary_paper"

	self._secondary_paper.animate(slot2, callback(slot5, self, self))

	slot3 = self._front_page_title

	self._front_page_title.stop(slot2)

	slot3 = self._front_page_title
	slot8 = "_animate_show_front_page"

	self._front_page_title.animate(slot2, callback(slot5, self, self))

	slot4 = self._selected_job_id
	local raid_data = tweak_data.operations.mission_data(slot2, tweak_data.operations)
	slot4 = self._front_page_icon

	self._front_page_icon.stop(tweak_data.operations)

	slot9 = "_animate_change_front_page_data"
	slot9 = tweak_data.gui.colors.raid_light_red

	self._front_page_icon.animate(tweak_data.operations, self._front_page_icon, callback(self, self, self), raid_data.icon_menu_big, raid_data.name_id, "folder_mission")

	slot4 = self._difficulty_warning_panel
	slot4 = self._difficulty_warning_panel.get_engine_panel(tweak_data.operations)

	self._difficulty_warning_panel.get_engine_panel(tweak_data.operations).stop(tweak_data.operations)

	slot4 = self._difficulty_warning_panel
	slot4 = self._difficulty_warning_panel.get_engine_panel(tweak_data.operations)
	slot9 = "_animate_slide_out_difficulty_warning_message"

	self._difficulty_warning_panel.get_engine_panel(tweak_data.operations).animate(tweak_data.operations, callback(raid_data.icon_menu_big, self, self))

	slot5 = false

	self._set_settings_enabled(tweak_data.operations, self)

	slot4 = self

	self._bind_locked_raid_controller_inputs(tweak_data.operations)

	return 
end
function MissionSelectionGui:_on_info_clicked(secondary_paper_callback, force)
	slot5 = self._info_button

	if self._info_button.active(slot4) and force ~= true then
		return 
	end

	slot6 = true

	self._set_settings_enabled(slot4, self)

	if self._selected_job_id then
		slot5 = self._front_page_title

		self._front_page_title.stop(slot4)

		slot5 = self._front_page_title
		slot10 = "_animate_hide_front_page"

		self._front_page_title.animate(slot4, callback(slot7, self, self))

		if self._secondary_paper_shown then
			slot5 = self._secondary_paper

			self._secondary_paper.stop(slot4)

			slot5 = self._secondary_paper
			slot10 = "_animate_hide_secondary_paper"

			self._secondary_paper.animate(slot4, callback(slot7, self, self))
		end

		if self._list_tabs._items[self._list_tabs._selected_item_idx]._name == "tab_operation" then
			slot7 = "set_text"
			slot11 = tweak_data.operations.missions[self._selected_job_id].briefing_id
			local clbk = callback(slot4, self._mission_description, self._mission_description, self.translate(slot9, self))
			slot6 = self._primary_paper

			self._primary_paper.stop(self._mission_description)

			slot11 = "_animate_change_primary_paper_control"
			slot9 = self._mission_description

			self._primary_paper.animate(self._mission_description, self._primary_paper, callback(self.translate, self, self), clbk)
		else
			slot7 = "set_text"
			slot11 = tweak_data.operations.missions[self._selected_job_id].briefing_id
			local clbk = callback(slot4, self._mission_description, self._mission_description, self.translate(slot9, self))
			slot6 = self._primary_paper

			self._primary_paper.stop(self._mission_description)

			slot11 = "_animate_change_primary_paper_control"
			slot9 = self._mission_description

			self._primary_paper.animate(self._mission_description, self._primary_paper, callback(self.translate, self, self), clbk)
		end

		slot6 = true

		self._info_button.set_active(slot4, self._info_button)

		slot6 = false

		self._intel_button.set_active(slot4, self._intel_button)

		slot6 = false

		self._audio_button.set_active(slot4, self._audio_button)
	elseif self._continue_slot_selected then
		slot5 = self._front_page_title

		self._front_page_title.stop(slot4)

		slot5 = self._front_page_title
		slot10 = "_animate_hide_front_page"

		self._front_page_title.animate(slot4, callback(slot7, self, self))

		if not self._secondary_paper_shown then
			slot5 = self

			self._hide_all_secondary_panels(slot4)

			slot6 = 1

			self._save_info.set_alpha(slot4, self._save_info)

			slot6 = true

			self._save_info.set_visible(slot4, self._save_info)

			slot6 = self._continue_slot_selected

			self._save_info.set_save_info(slot4, self._save_info)

			self._active_secondary_paper_control = self._save_info
			slot5 = self._secondary_paper

			self._secondary_paper.stop(slot4)

			slot5 = self._secondary_paper
			slot10 = "_animate_show_secondary_paper"

			self._secondary_paper.animate(slot4, callback(slot7, self, self))
		else
			local clbk = callback(slot4, self._save_info, self._save_info, "set_save_info")
			slot6 = self._soe_emblem

			self._soe_emblem.stop(self._save_info)

			slot11 = "_animate_change_secondary_paper_control"
			slot9 = self._save_info

			self._soe_emblem.animate(self._save_info, self._soe_emblem, callback(self._continue_slot_selected, self, self), clbk)
		end

		slot5 = self._primary_paper

		self._primary_paper.stop(slot4)

		slot10 = "_animate_change_primary_paper_control"
		slot11 = "set_current_slot_progress_report"
		slot8 = self._operation_progress

		self._primary_paper.animate(slot4, self._primary_paper, callback(slot7, self, self), callback(self, self, self))

		slot6 = true

		self._info_button.set_active(slot4, self._info_button)

		slot6 = false

		self._intel_button.set_active(slot4, self._intel_button)

		slot6 = false

		self._audio_button.set_active(slot4, self._audio_button)

		slot5 = self._info_button

		self._info_button.enable(slot4)

		slot5 = self._intel_button

		self._intel_button.enable(slot4)

		slot5 = self._audio_button

		self._audio_button.enable(slot4)
	end

	return 
end
function MissionSelectionGui:_prepare_intel_image_for_selected_job()
	if self._selected_job_id then
		local first_n_missions = nil

		if self._list_tabs._items[self._list_tabs._selected_item_idx]._name == "tab_operation" then
			first_n_missions = 1
		end

		slot5 = {
			image_selected = 1,
			mission = self._selected_job_id,
			only_first_n_events = first_n_missions
		}

		self._intel_image_grid.set_data(slot3, self._intel_image_grid)
	elseif self._continue_slot_selected then
		slot3 = managers.raid_job
		local save_slots = managers.raid_job.get_save_slots(slot2)
		local save_data = save_slots[self._continue_slot_selected].current_job
		slot6 = {
			save_data.current_event,
			image_selected = 1,
			mission = save_data.job_id,
			save_data = save_data
		}

		self._intel_image_grid.set_data(slot4, self._intel_image_grid)
	end

	return 
end
function MissionSelectionGui:_prepare_intel_image_for_selected_save(...)
	return 
end
function MissionSelectionGui:_on_intel_clicked()
	slot3 = self._intel_button

	if self._intel_button.active(slot2) then
		return 
	end

	local save_data = nil

	if not self._secondary_paper_shown then
		slot4 = self

		self._hide_all_secondary_panels(slot3)

		slot5 = 1

		self._intel_image_details.set_alpha(slot3, self._intel_image_details)

		slot5 = true

		self._intel_image_details.set_visible(slot3, self._intel_image_details)

		self._active_secondary_paper_control = self._intel_image_details
		slot4 = self

		self._prepare_intel_image_for_selected_job(slot3)

		slot4 = self._secondary_paper

		self._secondary_paper.stop(slot3)

		slot4 = self._secondary_paper
		slot9 = "_animate_show_secondary_paper"

		self._secondary_paper.animate(slot3, callback(slot6, self, self))
	else
		slot6 = "_prepare_intel_image_for_selected_job"
		local clbk = callback(slot3, self, self)
		slot5 = self._soe_emblem

		self._soe_emblem.stop(self)

		slot10 = "_animate_change_secondary_paper_control"
		slot8 = self._intel_image_details

		self._soe_emblem.animate(self, self._soe_emblem, callback(slot7, self, self), clbk)
	end

	if self._continue_slot_selected then
		slot4 = managers.raid_job
		save_data = managers.raid_job.get_save_slots(slot3)[self._continue_slot_selected].current_job
	end

	local first_n_missions = nil

	if self._list_tabs._items[self._list_tabs._selected_item_idx]._name == "tab_operation" and self._selected_job_id and not self._continue_slot_selected then
		first_n_missions = 1
	end

	slot3 = callback
	slot5 = self._intel_image_grid
	slot6 = self._intel_image_grid
	slot7 = "set_data"
	slot8 = {}

	if not self._selected_job_id then
		slot11 = managers.raid_job
		slot9 = managers.raid_job.get_save_slots(slot10)[self._continue_slot_selected].current_job.job_id
	end

	slot8.mission = slot9
	slot8.only_first_n_events = first_n_missions
	slot8.save_data = save_data
	local clbk = slot3(slot4, slot5, slot6, slot7)
	slot6 = self._primary_paper

	self._primary_paper.stop(slot5)

	slot11 = "_animate_change_primary_paper_control"
	slot9 = self._intel_image_grid

	self._primary_paper.animate(slot5, self._primary_paper, callback(slot8, self, self), clbk)

	slot7 = false

	self._info_button.set_active(slot5, self._info_button)

	slot7 = true

	self._intel_button.set_active(slot5, self._intel_button)

	slot7 = false

	self._audio_button.set_active(slot5, self._audio_button)

	return 
end
function MissionSelectionGui:_on_audio_clicked()
	local job_id = self._selected_job_id

	if not job_id then
		slot4 = managers.raid_job
		local save_slots = managers.raid_job.get_save_slots(slot3)
		job_id = save_slots[self._continue_slot_selected].current_job.job_id
	end

	local audio_briefing_id = tweak_data.operations.missions[job_id].audio_briefing_id
	slot5 = self

	self._stop_mission_briefing_audio(slot4)

	slot6 = "mrs_white_mission_briefing_button"
	self._briefing_button_sfx = managers.menu_component.post_event(slot4, managers.menu_component)
	slot6 = audio_briefing_id
	self._briefing_audio = managers.menu_component.post_event(slot4, managers.menu_component)

	return 
end
function MissionSelectionGui:_stop_mission_briefing_audio()
	slot4 = "play_short_audio_briefing"

	managers.queued_tasks.unqueue(slot2, managers.queued_tasks)

	slot3 = self._briefing_button_sfx

	if alive(slot2) then
		slot3 = self._briefing_button_sfx

		self._briefing_button_sfx.stop(slot2)

		self._briefing_button_sfx = nil
	end

	slot3 = self._briefing_audio

	if alive(slot2) then
		slot3 = self._briefing_audio

		self._briefing_audio.stop(slot2)

		self._briefing_audio = nil
	end

	return 
end
function MissionSelectionGui:_hide_all_secondary_panels()
	slot4 = 0

	self._intel_image_details.set_alpha(slot2, self._intel_image_details)

	slot4 = false

	self._intel_image_details.set_visible(slot2, self._intel_image_details)

	slot4 = 0

	self._save_info.set_alpha(slot2, self._save_info)

	slot4 = false

	self._save_info.set_visible(slot2, self._save_info)

	return 
end
function MissionSelectionGui:_on_difficulty_selected(data)
	slot4 = self

	self._check_difficulty_warning(slot3)

	return 
end
function MissionSelectionGui:data_source_difficulty_stepper()
	local difficulties = {}
	slot5 = {
		value = "difficulty_1",
		info = "difficulty_1",
		text = self.translate(slot7, self, "menu_difficulty_1")
	}
	slot10 = true

	table.insert(slot3, difficulties)

	slot5 = {
		value = "difficulty_2",
		info = "difficulty_2",
		text = self.translate(slot7, self, "menu_difficulty_2")
	}
	slot10 = true

	table.insert(slot3, difficulties)

	slot5 = {
		value = "difficulty_3",
		info = "difficulty_3",
		text = self.translate(slot7, self, "menu_difficulty_3")
	}
	slot10 = true

	table.insert(slot3, difficulties)

	slot5 = {
		value = "difficulty_4",
		info = "difficulty_4",
		text = self.translate(slot7, self, "menu_difficulty_4")
	}
	slot10 = true

	table.insert(slot3, difficulties)

	return difficulties
end
function MissionSelectionGui:set_difficulty_stepper_data(difficulty_available, difficulty_completed)
	if not difficulty_available then
		slot5 = tweak_data
		difficulty_available = tweak_data.number_of_difficulties(slot4)
	end

	difficulty_completed = difficulty_completed or 0
	local difficulties = {}
	slot7 = tweak_data

	for i = 1, tweak_data.number_of_difficulties(slot6), 1 do
		local difficulty_available = i <= difficulty_available
		slot12 = difficulty_available

		table.insert(slot10, difficulties)
	end

	slot7 = difficulties

	self._difficulty_stepper.set_disabled_items(slot5, self._difficulty_stepper)

	slot6 = self

	self._check_difficulty_warning(slot5)

	return 
end
function MissionSelectionGui:_check_difficulty_warning()
	if self._selected_job_id and tweak_data.operations.missions[self._selected_job_id].consumable then
		slot3 = self._difficulty_warning_panel
		slot3 = self._difficulty_warning_panel.get_engine_panel(slot2)

		self._difficulty_warning_panel.get_engine_panel(slot2).stop(slot2)

		slot3 = self._difficulty_warning_panel
		slot3 = self._difficulty_warning_panel.get_engine_panel(slot2)
		slot8 = "_animate_slide_out_difficulty_warning_message"

		self._difficulty_warning_panel.get_engine_panel(slot2).animate(slot2, callback(slot5, self, self))

		slot3 = self._raid_start_button

		self._raid_start_button.enable(slot2)

		slot3 = self._difficulty_warning

		self._difficulty_warning.stop(slot2)

		slot3 = self._difficulty_warning
		slot8 = "_animate_hide_difficulty_warning_message"

		self._difficulty_warning.animate(slot2, callback(slot5, self, self))

		return 
	end

	slot5 = self._selected_job_id
	local difficulty_available, difficulty_completed = managers.progression.get_mission_progression(slot2, managers.progression, tweak_data.operations.missions[self._selected_job_id].job_type)
	slot5 = tweak_data
	slot8 = self._difficulty_stepper
	local difficulty = tweak_data.difficulty_to_index(tweak_data.operations.missions[self._selected_job_id].job_type, self._difficulty_stepper.get_value(slot7))

	if difficulty_available < difficulty then
		slot8 = {
			TARGET_DIFFICULTY = managers.localization.text(slot10, managers.localization),
			NEEDED_DIFFICULTY = managers.localization.text(slot10, managers.localization)
		}
		slot15 = difficulty
		slot12 = "menu_difficulty_" .. tostring(slot14)
		slot15 = difficulty - 1
		slot12 = "menu_difficulty_" .. tostring(slot14)
		local message = managers.localization.text(slot5, managers.localization, "raid_difficulty_warning")
		slot7 = self._difficulty_warning_panel
		slot7 = self._difficulty_warning_panel.get_engine_panel(managers.localization)

		self._difficulty_warning_panel.get_engine_panel(managers.localization).stop(managers.localization)

		slot7 = self._difficulty_warning_panel
		slot12 = "_animate_slide_in_difficulty_warning_message"

		self._difficulty_warning_panel.get_engine_panel(managers.localization).animate(managers.localization, self._difficulty_warning_panel.get_engine_panel(managers.localization), callback(managers.localization.text(slot10, managers.localization), self, self))

		slot7 = self._raid_start_button

		self._raid_start_button.disable(managers.localization)

		slot7 = self._difficulty_warning

		self._difficulty_warning.stop(managers.localization)

		slot12 = "_animate_set_difficulty_warning_message"
		slot9 = message

		self._difficulty_warning.animate(managers.localization, self._difficulty_warning, callback(message, self, self))

		if self._current_mission_type == "raids" then
			slot7 = self

			self._bind_locked_raid_controller_inputs(slot6)
		elseif self._current_mission_type == "operations" and self._current_display == MissionSelectionGui.DISPLAY_SECOND then
			slot7 = self

			self._bind_locked_operation_list_controller_inputs(slot6)
		elseif self._current_mission_type == "operations" and self._current_display == MissionSelectionGui.DISPLAY_FIRST then
			slot7 = self

			self._bind_operation_list_controller_inputs(slot6)
		end
	else
		slot6 = self._difficulty_warning_panel
		slot6 = self._difficulty_warning_panel.get_engine_panel(slot5)

		self._difficulty_warning_panel.get_engine_panel(slot5).stop(slot5)

		slot6 = self._difficulty_warning_panel
		slot6 = self._difficulty_warning_panel.get_engine_panel(slot5)
		slot11 = "_animate_slide_out_difficulty_warning_message"

		self._difficulty_warning_panel.get_engine_panel(slot5).animate(slot5, callback(slot8, self, self))

		slot6 = self._raid_start_button

		self._raid_start_button.enable(slot5)

		slot6 = self._difficulty_warning

		self._difficulty_warning.stop(slot5)

		slot6 = self._difficulty_warning
		slot11 = "_animate_hide_difficulty_warning_message"

		self._difficulty_warning.animate(slot5, callback(slot8, self, self))

		if self._current_mission_type == "raids" then
			slot6 = self

			self._bind_raid_controller_inputs(slot5)
		elseif self._current_mission_type == "operations" then
			slot6 = self

			self._bind_operation_list_controller_inputs(slot5)
		end
	end

	return 
end
function MissionSelectionGui:_animate_set_difficulty_warning_message(o, message)
	local fade_out_duration = 0.2
	local t = (1 - self._difficulty_warning.alpha(slot5)) * fade_out_duration
	slot7 = self._difficulty_warning

	if self._difficulty_warning.text(self._difficulty_warning) ~= message then
		while t < fade_out_duration do
			local dt = coroutine.yield()
			t = t + dt
			slot11 = fade_out_duration
			local current_alpha = Easing.quartic_in_out(slot7, t, 1, -1)
			slot10 = current_alpha

			self._difficulty_warning.set_alpha(t, self._difficulty_warning)
		end

		slot8 = 0

		self._difficulty_warning.set_alpha(slot6, self._difficulty_warning)

		slot8 = message

		self._difficulty_warning.set_text(slot6, self._difficulty_warning)

		slot7 = self._difficulty_warning
		local _, _, _, h = self._difficulty_warning.text_rect(slot6)
		slot12 = h

		self._difficulty_warning.set_h(slot10, self._difficulty_warning)
	end

	local fade_in_duration = 0.2
	slot8 = self._difficulty_warning
	t = self._difficulty_warning.alpha(slot7) * fade_in_duration

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 0, 1)
		slot11 = current_alpha

		self._difficulty_warning.set_alpha(t, self._difficulty_warning)
	end

	slot9 = 1

	self._difficulty_warning.set_alpha(slot7, self._difficulty_warning)

	return 
end
function MissionSelectionGui:_animate_hide_difficulty_warning_message(o)
	local fade_out_duration = 0.2
	slot5 = self._difficulty_warning
	local t = (1 - self._difficulty_warning.alpha(slot4)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 1, -1)
		slot9 = current_alpha

		self._difficulty_warning.set_alpha(t, self._difficulty_warning)
	end

	slot7 = 0

	self._difficulty_warning.set_alpha(slot5, self._difficulty_warning)

	return 
end
function MissionSelectionGui:_animate_slide_in_difficulty_warning_message(o, message)
	local slide_duration = 0.4
	self._difficulty_warning_slide_animation_t = self._difficulty_warning_slide_animation_t or 0
	local t = self._difficulty_warning_slide_animation_t * slide_duration
	local current_warning_text = self._difficulty_warning.text(slot6)
	slot9 = message

	self._difficulty_warning.set_text(self._difficulty_warning, self._difficulty_warning)

	slot8 = self._difficulty_warning
	local _, _, _, warning_text_h = self._difficulty_warning.text_rect(self._difficulty_warning)
	slot13 = current_warning_text

	self._difficulty_warning.set_text(slot11, self._difficulty_warning)

	slot13 = self._difficulty_stepper
	local difficulty_control_index = table.index_of(slot11, self._settings_controls)

	while t < slide_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot17 = slide_duration
		local current_warning_bottom = Easing.quartic_in_out(slot13, t, 0, MissionSelectionGui.SETTINGS_PADDING + warning_text_h)
		slot16 = current_warning_bottom

		self._difficulty_warning.set_bottom(t, self._difficulty_warning)

		slot15 = self._settings_controls

		for index, control in pairs(t) do
			if control ~= self._difficulty_stepper then
				slot21 = self._difficulty_stepper

				if self._difficulty_stepper.y(control) < control.y(slot19) then
					slot20 = self._difficulty_stepper
					local control_default_y = (self._difficulty_stepper.bottom(slot19) + (index - difficulty_control_index) * (MissionSelectionGui.SETTINGS_PADDING + 32)) - 32
					slot24 = slide_duration
					local current_control_y = Easing.quartic_in_out(MissionSelectionGui.SETTINGS_PADDING + 32, t, control_default_y, warning_text_h + 32)
					slot23 = current_control_y

					control.set_y(t, control)
				end
			end
		end

		self._difficulty_warning_slide_animation_t = t / slide_duration
	end

	self._difficulty_warning_slide_animation_t = 1

	return 
end
function MissionSelectionGui:_animate_slide_out_difficulty_warning_message(o)
	local slide_duration = 0.4
	self._difficulty_warning_slide_animation_t = self._difficulty_warning_slide_animation_t or 0
	local t = (1 - self._difficulty_warning_slide_animation_t) * slide_duration
	slot6 = self._difficulty_warning
	local _, _, _, warning_text_h = self._difficulty_warning.text_rect(slot5)
	slot11 = self._difficulty_stepper
	local difficulty_control_index = table.index_of(slot9, self._settings_controls)

	while t < slide_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot15 = slide_duration
		local current_warning_bottom = Easing.quartic_in_out(slot11, t, MissionSelectionGui.SETTINGS_PADDING + warning_text_h, -(MissionSelectionGui.SETTINGS_PADDING + warning_text_h))
		slot14 = current_warning_bottom

		self._difficulty_warning.set_bottom(t, self._difficulty_warning)

		slot13 = self._settings_controls

		for index, control in pairs(t) do
			if control ~= self._difficulty_stepper then
				slot19 = self._difficulty_stepper

				if self._difficulty_stepper.y(control) < control.y(slot17) then
					slot18 = self._difficulty_stepper
					local control_default_y = (self._difficulty_stepper.bottom(slot17) + (index - difficulty_control_index) * (MissionSelectionGui.SETTINGS_PADDING + 32)) - 32
					slot22 = slide_duration
					local current_control_y = Easing.quartic_in_out(MissionSelectionGui.SETTINGS_PADDING + 32, t, control_default_y + warning_text_h + 32, -warning_text_h - 32)
					slot21 = current_control_y

					control.set_y(t, control)
				end
			end
		end

		self._difficulty_warning_slide_animation_t = t / slide_duration
	end

	self._difficulty_warning_slide_animation_t = 0

	return 
end
function MissionSelectionGui:_on_permission_selected(data)
	return 
end
function MissionSelectionGui:data_source_permission_stepper()
	local permissions = {}
	slot5 = {
		value = "public",
		info = "public",
		text = self.translate(slot7, self, "menu_permission_public")
	}
	slot10 = true

	table.insert(slot3, permissions)

	slot5 = {
		value = "friends_only",
		info = "friends_only",
		text = self.translate(slot7, self, "menu_permission_friends")
	}
	slot10 = true

	table.insert(slot3, permissions)

	slot5 = {
		value = "private",
		info = "private",
		text = self.translate(slot7, self, "menu_permission_private")
	}
	slot10 = true

	table.insert(slot3, permissions)

	return permissions
end
function MissionSelectionGui:_on_toggle_drop_in(button, control, value)
	return 
end
function MissionSelectionGui:_on_toggle_team_ai(button, control, value)
	return 
end
function MissionSelectionGui:_on_toggle_auto_kick(button, control, value)
	return 
end
function MissionSelectionGui:_raid_list_data_source()
	local non_consumable_list = {}
	local consumable_list = {}
	slot7 = tweak_data.operations

	for raid_index, mission_name in pairs(tweak_data.operations.get_raids_index(slot6)) do
		slot11 = mission_name
		local mission_data = tweak_data.operations.mission_data(slot9, tweak_data.operations)
		slot12 = mission_data.name_id
		local item_text = self.translate(tweak_data.operations, self)
		local item_icon_name = mission_data.icon_menu
		local item_icon = {
			texture = tweak_data.gui.icons[item_icon_name].texture,
			texture_rect = tweak_data.gui.icons[item_icon_name].texture_rect
		}

		if mission_data.consumable then
			slot15 = mission_name

			if managers.consumable_missions.is_mission_unlocked(slot13, managers.consumable_missions) then
				slot15 = {
					unlocked = true,
					text = item_text,
					value = mission_name,
					icon = item_icon,
					selected_color = tweak_data.gui.colors.raid_gold,
					breadcrumb = {
						category = BreadcrumbManager.CATEGORY_CONSUMABLE_MISSION,
						identifiers = {
							mission_name
						}
					}
				}

				table.insert(slot13, consumable_list)
			end
		else
			slot12 = table.insert
			slot14 = non_consumable_list
			slot15 = {
				index = raid_index,
				text = item_text,
				value = mission_name,
				icon = item_icon,
				color = tweak_data.gui.colors.raid_white,
				selected_color = tweak_data.gui.colors.raid_red,
				breadcrumb = {
					category = BreadcrumbManager.CATEGORY_NEW_RAID,
					identifiers = {
						mission_name
					}
				},
				debug = mission_data.debug
			}

			if not mission_data.debug then
				slot20 = mission_name
				slot16 = managers.progression.mission_unlocked(slot17, managers.progression, mission_data.job_type)
			end

			slot15.unlocked = slot16

			slot12(slot13, slot14)
		end
	end

	function slot6(l, r)
		if l.unlocked and not l.debug and not r.unlocked then
			return true
		elseif not l.unlocked and r.unlocked and not r.debug then
			return false
		end

		return l.index < r.index and not l.debug
	end

	table.sort(slot4, non_consumable_list)

	local raid_list = consumable_list
	slot6 = non_consumable_list

	for _, mission in pairs(non_consumable_list) do
		slot12 = mission

		table.insert(slot10, raid_list)
	end

	return raid_list
end
function MissionSelectionGui:_operation_list_data_source()
	local operation_list = {}
	slot6 = tweak_data.operations

	for index, mission_name in pairs(tweak_data.operations.get_operations_index(slot5)) do
		slot10 = mission_name
		local operation_tweak_data = tweak_data.operations.mission_data(slot8, tweak_data.operations)
		slot11 = operation_tweak_data.name_id
		local item_title = self.translate(tweak_data.operations, self)
		slot12 = operation_tweak_data.briefing_id
		local item_description = self.translate(self, self)
		local item_icon_name = operation_tweak_data.icon_menu
		local item_icon = {
			texture = tweak_data.gui.icons[item_icon_name].texture,
			texture_rect = tweak_data.gui.icons[item_icon_name].texture_rect
		}
		slot15 = {
			index = index,
			title = item_title,
			description = item_description,
			value = mission_name,
			icon = item_icon
		}

		table.insert(slot13, operation_list)
	end

	if 1 <= #operation_list then
	end

	return operation_list
end
function MissionSelectionGui:_slot_list_data_source()
	slot3 = managers.raid_job
	local current_save_slots = managers.raid_job.get_save_slots(slot2)
	local slot_list = {}

	for i = 1, 5, 1 do
		local current_slot = {
			value = i
		}

		if current_save_slots[i] then
			slot11 = current_save_slots[i].current_job.name_id
			current_slot.text = self.translate(slot9, self)
			slot11 = current_save_slots[i].current_job.job_id
			local icon_name = tweak_data.operations.mission_data(slot9, tweak_data.operations).icon_menu
			current_slot.icon = {
				texture = tweak_data.gui.icons[icon_name].texture,
				texture_rect = tweak_data.gui.icons[icon_name].texture_rect
			}
			current_slot.difficulty = current_save_slots[i].difficulty
		else
			slot11 = "menu_empty_save_slot_title"
			current_slot.text = self.translate(slot9, self)
			local icon_name = "missions_operation_empty_slot_menu"
			current_slot.icon = {
				texture = tweak_data.gui.icons[icon_name].texture,
				texture_rect = tweak_data.gui.icons[icon_name].texture_rect
			}
			current_slot.empty = true
		end

		slot11 = current_slot

		table.insert(slot9, slot_list)
	end

	return slot_list
end
function MissionSelectionGui:_continue_operation()
	if self._continue_slot_selected then
		slot4 = self._continue_slot_selected

		managers.raid_job.continue_operation(slot2, managers.raid_job)
	end

	slot3 = managers.raid_job
	local save_slot = managers.raid_job.get_save_slots(slot2)[self._continue_slot_selected]

	if save_slot.difficulty then
		slot5 = save_slot.difficulty

		tweak_data.set_difficulty(slot3, tweak_data)
	end

	if save_slot.team_ai then
		Global.game_settings.team_ai = save_slot.team_ai
	end

	slot4 = managers.raid_menu

	managers.raid_menu.close_all_menus(slot3)

	slot5 = false

	managers.menu.input_enabled(slot3, managers.menu)

	return 
end
function MissionSelectionGui:_start_job(job_id)
	local difficulty = self._difficulty_stepper.get_value(slot3)
	slot5 = self._team_ai_checkbox
	local team_ai = self._team_ai_checkbox.get_value(self._difficulty_stepper)
	local permission = Global.DEFAULT_PERMISSION
	local drop_in_allowed = true
	local auto_kick = true
	slot10 = difficulty

	tweak_data.set_difficulty(slot8, tweak_data)

	Global.game_settings.team_ai = team_ai
	Global.game_settings.selected_team_ai = team_ai
	Global.player_manager.game_settings_difficulty = difficulty
	Global.player_manager.game_settings_team_ai = team_ai
	Global.player_manager.game_settings_selected_team_ai = team_ai

	if not Global.game_settings.single_player then
		slot9 = self._permission_stepper
		permission = self._permission_stepper.get_value(slot8)
		slot9 = self._drop_in_checkbox
		drop_in_allowed = self._drop_in_checkbox.get_value(slot8)
		slot9 = self._auto_kick_checkbox
		auto_kick = self._auto_kick_checkbox.get_value(slot8)
		Global.game_settings.permission = permission
		Global.game_settings.drop_in_allowed = drop_in_allowed
		Global.game_settings.auto_kick = auto_kick
		Global.player_manager.game_settings_permission = permission
		Global.player_manager.game_settings_drop_in_allowed = drop_in_allowed
		Global.player_manager.game_settings_auto_kick = auto_kick
	end

	slot9 = Network

	if Network.is_server(slot8) then
		slot9 = managers.network
		slot9 = managers.network.session(slot8)

		managers.network.session(slot8).chk_server_joinable_state(slot8)

		slot9 = managers.network

		managers.network.update_matchmake_attributes(slot8)

		if self._settings_selected.difficulty ~= Global.game_settings.difficulty or self._settings_selected.permission ~= Global.game_settings.permission or self._settings_selected.drop_in_allowed ~= Global.game_settings.drop_in_allowed or self._settings_selected.team_ai ~= Global.game_settings.team_ai or self._settings_selected.auto_kick ~= Global.game_settings.auto_kick then
			slot9 = managers.savefile
			slot12 = managers.savefile

			managers.savefile.save_game(slot8, managers.savefile.get_save_progress_slot(slot11))
		end
	end

	managers.raid_job._next_event_index = nil
	slot10 = job_id

	managers.raid_job.set_selected_job(nil, managers.raid_job)

	slot9 = managers.raid_menu

	managers.raid_menu.close_all_menus(nil)

	return 
end
function MissionSelectionGui:_select_mission(job_id)
	self._selected_job_id = job_id
	slot5 = job_id
	local job_data = tweak_data.operations.mission_data(slot3, tweak_data.operations)
	slot6 = job_data.briefing_id
	local description = managers.localization.text(tweak_data.operations, managers.localization)
	slot7 = "menu_mission_selected_title"
	local mission_title = managers.localization.text(managers.localization, managers.localization)
	self._selected_job_id = job_id

	return 
end
function MissionSelectionGui:_select_slot(slot)
	self._selected_operation_save_slot = slot

	return 
end
function MissionSelectionGui:_animate_change_primary_paper_control(control, mid_callback, new_active_control)
	local fade_out_duration = 0.2
	local t = nil

	if self._active_primary_paper_control then
		slot8 = self._active_primary_paper_control
		t = (1 - self._active_primary_paper_control.alpha(slot7)) * fade_out_duration
	else
		t = 0
	end

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_out_duration
		local alpha = Easing.cubic_in_out(slot8, t, 1, -1)
		slot11 = alpha

		self._active_primary_paper_control.set_alpha(t, self._active_primary_paper_control)
	end

	slot9 = 0

	self._active_primary_paper_control.set_alpha(slot7, self._active_primary_paper_control)

	slot9 = false

	self._active_primary_paper_control.set_visible(slot7, self._active_primary_paper_control)

	if mid_callback then
		mid_callback()
	end

	self._active_primary_paper_control = new_active_control
	slot9 = true

	self._active_primary_paper_control.set_visible(slot7, self._active_primary_paper_control)

	local fade_in_duration = 0.25
	slot9 = self._active_primary_paper_control
	t = self._active_primary_paper_control.alpha(self._active_primary_paper_control) * fade_out_duration

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = fade_in_duration
		local alpha = Easing.cubic_in_out(slot9, t, 0, 1)
		slot12 = alpha

		self._active_primary_paper_control.set_alpha(t, self._active_primary_paper_control)
	end

	slot10 = 1

	self._active_primary_paper_control.set_alpha(slot8, self._active_primary_paper_control)

	return 
end
function MissionSelectionGui:_animate_change_secondary_paper_control(control, mid_callback, new_active_control)
	local fade_out_duration = 0.2
	slot7 = self._active_secondary_paper_control
	local t = (1 - self._active_secondary_paper_control.alpha(slot6)) * fade_out_duration
	local old_control = self._active_secondary_paper_control
	self._active_secondary_paper_control = new_active_control

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = fade_out_duration
		local alpha = Easing.cubic_in_out(slot9, t, 1, -1)
		slot12 = alpha

		old_control.set_alpha(t, old_control)
	end

	slot10 = 0

	old_control.set_alpha(slot8, old_control)

	slot10 = false

	old_control.set_visible(slot8, old_control)

	if mid_callback then
		mid_callback()
	end

	slot10 = true

	self._active_secondary_paper_control.set_visible(slot8, self._active_secondary_paper_control)

	local fade_in_duration = 0.25
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = fade_in_duration
		local alpha = Easing.cubic_in_out(slot10, t, 0, 1)
		slot13 = alpha

		self._active_secondary_paper_control.set_alpha(t, self._active_secondary_paper_control)
	end

	slot11 = 1

	self._active_secondary_paper_control.set_alpha(slot9, self._active_secondary_paper_control)

	return 
end
function MissionSelectionGui:_animate_show_secondary_paper()
	local duration = 0.5
	local t = self._paper_animation_t * duration
	slot6 = false

	self._difficulty_stepper.set_selectable(slot4, self._difficulty_stepper)

	self._secondary_paper_shown = true

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local setting_alpha = Easing.cubic_in_out(slot5, t, 1, -1)
		slot8 = setting_alpha

		self._right_panel.set_alpha(t, self._right_panel)

		slot10 = duration
		local alpha = Easing.cubic_in_out(t, t, MissionSelectionGui.BACKGROUND_PAPER_ALPHA, 1 - MissionSelectionGui.BACKGROUND_PAPER_ALPHA)
		slot11 = duration
		local color_r = Easing.cubic_in_out(t, t, MissionSelectionGui.BACKGROUND_PAPER_COLOR.r, MissionSelectionGui.FOREGROUND_PAPER_COLOR.r - MissionSelectionGui.BACKGROUND_PAPER_COLOR.r)
		slot12 = duration
		local color_g = Easing.cubic_in_out(t, t, MissionSelectionGui.BACKGROUND_PAPER_COLOR.g, MissionSelectionGui.FOREGROUND_PAPER_COLOR.g - MissionSelectionGui.BACKGROUND_PAPER_COLOR.g)
		local color_b = Easing.cubic_in_out(t, t, MissionSelectionGui.BACKGROUND_PAPER_COLOR.b, MissionSelectionGui.FOREGROUND_PAPER_COLOR.b - MissionSelectionGui.BACKGROUND_PAPER_COLOR.b)
		slot11 = self._secondary_paper
		slot16 = color_b

		self._secondary_paper.set_color(t, Color(duration, color_r, color_g))

		slot12 = alpha

		self._secondary_paper_panel.set_alpha(t, self._secondary_paper_panel)

		local scale = Easing.cubic_in_out(t, t, MissionSelectionGui.BACKGROUND_PAPER_SCALE, 1 - MissionSelectionGui.BACKGROUND_PAPER_SCALE)
		slot15 = self._primary_paper_panel
		slot13 = self._primary_paper_panel.w(duration) * scale

		self._secondary_paper_panel.set_w(t, self._secondary_paper_panel)

		slot15 = self._primary_paper_panel
		slot13 = self._primary_paper_panel.h(duration) * scale

		self._secondary_paper_panel.set_h(t, self._secondary_paper_panel)

		local rotation = Easing.cubic_in_out(t, t, MissionSelectionGui.BACKGROUND_PAPER_ROTATION, -MissionSelectionGui.BACKGROUND_PAPER_ROTATION)
		slot14 = rotation

		self._secondary_paper_panel.set_rotation(t, self._secondary_paper_panel)

		slot17 = self._primary_paper_panel
		slot16 = duration
		local x = Easing.cubic_in_out(t, t, self._primary_paper_panel.x(duration), self._primary_paper_panel.w(self._primary_paper_panel) + MissionSelectionGui.SECONDARY_PAPER_PADDING_LEFT)
		slot15 = x

		self._secondary_paper_panel.set_x(t, self._secondary_paper_panel)

		self._paper_animation_t = t / duration
	end

	slot6 = 0

	self._right_panel.set_alpha(slot4, self._right_panel)

	slot6 = false

	self._right_panel.set_visible(slot4, self._right_panel)

	slot9 = self._primary_paper_panel
	slot6 = self._primary_paper_panel.x(slot7) + self._primary_paper_panel.w(self._primary_paper_panel) + MissionSelectionGui.SECONDARY_PAPER_PADDING_LEFT

	self._secondary_paper_panel.set_x(slot4, self._secondary_paper_panel)

	slot6 = 0

	self._secondary_paper_panel.set_rotation(slot4, self._secondary_paper_panel)

	slot5 = self._secondary_paper_panel
	slot8 = self._primary_paper_panel

	self._secondary_paper_panel.set_w(slot4, self._primary_paper_panel.w(MissionSelectionGui.SECONDARY_PAPER_PADDING_LEFT))

	slot5 = self._secondary_paper_panel
	slot8 = self._primary_paper_panel

	self._secondary_paper_panel.set_h(slot4, self._primary_paper_panel.h(MissionSelectionGui.SECONDARY_PAPER_PADDING_LEFT))

	slot6 = MissionSelectionGui.FOREGROUND_PAPER_COLOR

	self._secondary_paper.set_color(slot4, self._secondary_paper)

	slot6 = 1

	self._secondary_paper_panel.set_alpha(slot4, self._secondary_paper_panel)

	self._paper_animation_t = 1

	return 
end
function MissionSelectionGui:_animate_hide_secondary_paper()
	local duration = 0.5
	local t = (1 - self._paper_animation_t) * duration
	slot6 = true

	self._difficulty_stepper.set_selectable(slot4, self._difficulty_stepper)

	self._secondary_paper_shown = false
	slot6 = true

	self._right_panel.set_visible(slot4, self._right_panel)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local setting_alpha = Easing.cubic_in_out(slot5, t, 0, 1)
		slot8 = setting_alpha

		self._right_panel.set_alpha(t, self._right_panel)

		slot10 = duration
		local alpha = Easing.cubic_in_out(t, t, 1, MissionSelectionGui.BACKGROUND_PAPER_ALPHA - 1)
		slot11 = duration
		local color_r = Easing.cubic_in_out(t, t, MissionSelectionGui.FOREGROUND_PAPER_COLOR.r, MissionSelectionGui.BACKGROUND_PAPER_COLOR.r - MissionSelectionGui.FOREGROUND_PAPER_COLOR.r)
		slot12 = duration
		local color_g = Easing.cubic_in_out(t, t, MissionSelectionGui.FOREGROUND_PAPER_COLOR.g, MissionSelectionGui.BACKGROUND_PAPER_COLOR.g - MissionSelectionGui.FOREGROUND_PAPER_COLOR.g)
		local color_b = Easing.cubic_in_out(t, t, MissionSelectionGui.FOREGROUND_PAPER_COLOR.b, MissionSelectionGui.BACKGROUND_PAPER_COLOR.b - MissionSelectionGui.FOREGROUND_PAPER_COLOR.b)
		slot11 = self._secondary_paper
		slot16 = color_b

		self._secondary_paper.set_color(t, Color(duration, color_r, color_g))

		slot12 = alpha

		self._secondary_paper_panel.set_alpha(t, self._secondary_paper_panel)

		local scale = Easing.cubic_in_out(t, t, 1, MissionSelectionGui.BACKGROUND_PAPER_SCALE - 1)
		slot15 = self._primary_paper_panel
		slot13 = self._primary_paper_panel.w(duration) * scale

		self._secondary_paper_panel.set_w(t, self._secondary_paper_panel)

		slot15 = self._primary_paper_panel
		slot13 = self._primary_paper_panel.h(duration) * scale

		self._secondary_paper_panel.set_h(t, self._secondary_paper_panel)

		local rotation = Easing.cubic_in_out(t, t, 0, MissionSelectionGui.BACKGROUND_PAPER_ROTATION)
		slot14 = rotation

		self._secondary_paper_panel.set_rotation(t, self._secondary_paper_panel)

		slot17 = self._primary_paper_panel
		slot17 = self._primary_paper_panel
		slot16 = duration
		local x = Easing.cubic_in_out(t, t, self._primary_paper_panel.x(duration) + self._primary_paper_panel.w(self._primary_paper_panel) + MissionSelectionGui.SECONDARY_PAPER_PADDING_LEFT, -self._primary_paper_panel.w(self._primary_paper_panel) - MissionSelectionGui.SECONDARY_PAPER_PADDING_LEFT)
		slot15 = x

		self._secondary_paper_panel.set_x(t, self._secondary_paper_panel)

		self._paper_animation_t = 1 - t / duration
	end

	slot6 = 1

	self._right_panel.set_alpha(slot4, self._right_panel)

	slot5 = self._secondary_paper_panel
	slot8 = self._primary_paper_panel

	self._secondary_paper_panel.set_x(slot4, self._primary_paper_panel.x(slot7))

	slot6 = MissionSelectionGui.BACKGROUND_PAPER_ROTATION

	self._secondary_paper_panel.set_rotation(slot4, self._secondary_paper_panel)

	slot8 = self._primary_paper_panel
	slot6 = self._primary_paper_panel.w(slot7) * MissionSelectionGui.BACKGROUND_PAPER_SCALE

	self._secondary_paper_panel.set_w(slot4, self._secondary_paper_panel)

	slot8 = self._primary_paper_panel
	slot6 = self._primary_paper_panel.h(MissionSelectionGui.BACKGROUND_PAPER_SCALE) * MissionSelectionGui.BACKGROUND_PAPER_SCALE

	self._secondary_paper_panel.set_h(slot4, self._secondary_paper_panel)

	slot6 = MissionSelectionGui.BACKGROUND_PAPER_COLOR

	self._secondary_paper.set_color(slot4, self._secondary_paper)

	slot6 = MissionSelectionGui.BACKGROUND_PAPER_ALPHA

	self._secondary_paper_panel.set_alpha(slot4, self._secondary_paper_panel)

	self._paper_animation_t = 0

	return 
end
function MissionSelectionGui:_animate_show_front_page(o)
	self._front_page_movement_t = self._front_page_movement_t or 0
	local fade_in_duration = 0.4
	local t = self._front_page_movement_t * fade_in_duration

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_in_duration / 2
		local current_alpha = Easing.quartic_out(slot6, t, 0, 1)
		slot9 = current_alpha

		self._front_page_panel.set_alpha(t, self._front_page_panel)

		slot11 = fade_in_duration
		local papers_alpha = Easing.quartic_in(t, t, 1, -1)
		slot10 = papers_alpha

		self._primary_paper_panel.set_alpha(t, self._primary_paper_panel)

		slot10 = papers_alpha

		self._secondary_paper_panel.set_alpha(t, self._secondary_paper_panel)

		slot12 = fade_in_duration
		local current_offset = Easing.quartic_out(t, t, -65, 65)
		slot11 = current_offset

		self._front_page_panel.set_y(t, self._front_page_panel)

		slot13 = fade_in_duration
		local current_rotation = Easing.quartic_out(t, t, -6, 6)
		slot12 = current_rotation

		self._front_page_panel.set_rotation(t, self._front_page_panel)

		self._front_page_movement_t = t / fade_in_duration
	end

	slot7 = 0

	self._primary_paper_panel.set_alpha(slot5, self._primary_paper_panel)

	slot7 = 0

	self._secondary_paper_panel.set_alpha(slot5, self._secondary_paper_panel)

	slot7 = 1

	self._front_page_panel.set_alpha(slot5, self._front_page_panel)

	self._front_page_movement_t = 1

	return 
end
function MissionSelectionGui:_animate_hide_front_page(o)
	self._front_page_movement_t = self._front_page_movement_t or 0
	local fade_out_duration = 0.45
	local t = (1 - self._front_page_movement_t) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration / 2
		local current_alpha = Easing.quadratic_in(slot6, t, 1, -1)
		slot9 = current_alpha

		self._front_page_panel.set_alpha(t, self._front_page_panel)

		slot11 = fade_out_duration / 2
		local papers_alpha = Easing.quartic_out(t, t, 0, 1)
		slot10 = papers_alpha

		self._primary_paper_panel.set_alpha(t, self._primary_paper_panel)

		slot10 = papers_alpha

		self._secondary_paper_panel.set_alpha(t, self._secondary_paper_panel)

		slot12 = fade_out_duration
		local current_offset = Easing.quartic_out(t, t, 0, -65)
		slot11 = current_offset

		self._front_page_panel.set_y(t, self._front_page_panel)

		slot13 = fade_out_duration
		local current_rotation = Easing.quartic_out(t, t, 0, -6)
		slot12 = current_rotation

		self._front_page_panel.set_rotation(t, self._front_page_panel)

		self._front_page_movement_t = 1 - t / fade_out_duration
	end

	slot7 = 1

	self._primary_paper_panel.set_alpha(slot5, self._primary_paper_panel)

	slot7 = 1

	self._secondary_paper_panel.set_alpha(slot5, self._secondary_paper_panel)

	slot7 = 0

	self._front_page_panel.set_alpha(slot5, self._front_page_panel)

	slot7 = 0

	self._front_page_content_panel.set_alpha(slot5, self._front_page_content_panel)

	self._front_page_movement_t = 0

	return 
end
function MissionSelectionGui:_animate_change_front_page_data(o, icon, text_id, folder_image, text_color, x_offset)
	local fade_out_duration = 0.2
	slot10 = self._front_page_content_panel
	local t = (1 - self._front_page_content_panel.alpha(slot9)) * fade_out_duration
	local changing_front_page_image = false
	x_offset = x_offset or 0

	if self._front_page_icon_id ~= icon or self._front_page_text_id ~= text_id or folder_image ~= self._current_front_page_image then
		while t < fade_out_duration do
			local dt = coroutine.yield()
			t = t + dt
			slot16 = fade_out_duration
			local current_alpha = Easing.quartic_in_out(slot12, t, 1, -1)
			slot15 = current_alpha

			self._front_page_content_panel.set_alpha(t, self._front_page_content_panel)

			if folder_image and folder_image ~= self._current_front_page_image then
				slot15 = current_alpha

				self._front_page_image.set_alpha(slot13, self._front_page_image)
			end
		end

		slot13 = 0

		self._front_page_content_panel.set_alpha(slot11, self._front_page_content_panel)

		if folder_image ~= self._current_front_page_image then
			slot13 = 0

			self._front_page_image.set_alpha(slot11, self._front_page_image)

			local texture_rect = tweak_data.gui.icons[folder_image].texture_rect
			slot14 = tweak_data.gui.icons[folder_image].texture

			self._front_page_image.set_image(self._front_page_image, self._front_page_image)

			slot13 = self._front_page_image
			slot16 = texture_rect

			self._front_page_image.set_texture_rect(self._front_page_image, unpack(slot15))

			slot14 = texture_rect[3]

			self._front_page_image.set_w(self._front_page_image, self._front_page_image)

			slot14 = texture_rect[4]

			self._front_page_image.set_h(self._front_page_image, self._front_page_image)

			self._current_front_page_image = folder_image
			changing_front_page_image = true
		end

		if icon then
			slot13 = tweak_data.gui.icons[icon].texture

			self._front_page_icon.set_image(slot11, self._front_page_icon)

			slot12 = self._front_page_icon
			slot15 = tweak_data.gui.icons[icon].texture_rect

			self._front_page_icon.set_texture_rect(slot11, unpack(slot14))

			self._front_page_icon_id = icon
		end

		slot12 = self._front_page_title
		slot17 = true

		self._front_page_title.set_text(slot11, self.translate(slot14, self, text_id))

		slot12 = self

		self._fit_front_page_title(slot11)

		if text_color then
			slot13 = text_color

			self._front_page_title.set_color(slot11, self._front_page_title)

			slot13 = text_color

			self._front_page_icon.set_color(slot11, self._front_page_icon)
		end

		self._front_page_text_id = text_id
	end

	local front_page_rotation = self._front_page_content_panel.rotation(slot11)
	slot14 = 0

	self._front_page_content_panel.set_rotation(self._front_page_content_panel, self._front_page_content_panel)

	slot16 = self._front_page_panel
	slot14 = self._front_page_panel.w(slot15) / 2 + x_offset

	self._front_page_icon.set_center_x(self._front_page_content_panel, self._front_page_icon)

	slot13 = self._front_page_title
	slot16 = self._front_page_icon

	self._front_page_title.set_center_x(self._front_page_content_panel, self._front_page_icon.center_x(slot15))

	slot14 = front_page_rotation

	self._front_page_content_panel.set_rotation(self._front_page_content_panel, self._front_page_content_panel)

	slot13 = self._front_page_content_panel
	t = self._front_page_content_panel.alpha(self._front_page_content_panel) * fade_out_duration
	local fade_in_duration = 0.2

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot18 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot14, t, 0, 1)
		slot17 = current_alpha

		self._front_page_content_panel.set_alpha(t, self._front_page_content_panel)

		if changing_front_page_image then
			slot17 = current_alpha

			self._front_page_image.set_alpha(slot15, self._front_page_image)
		end
	end

	slot15 = 1

	self._front_page_content_panel.set_alpha(slot13, self._front_page_content_panel)

	slot15 = 1

	self._front_page_image.set_alpha(slot13, self._front_page_image)

	return 
end
function MissionSelectionGui:_fit_front_page_title()
	local default_font_size = tweak_data.gui.font_sizes.title
	local font_sizes = {}
	slot5 = tweak_data.gui.font_sizes

	for index, size in pairs(slot4) do
		if size <= default_font_size then
			slot11 = size

			table.insert(slot9, font_sizes)
		end
	end

	slot5 = font_sizes

	table.sort(slot4)

	for i = #font_sizes, 1, -1 do
		slot10 = font_sizes[i]

		self._front_page_title.set_font_size(slot8, self._front_page_title)

		slot9 = self._front_page_title
		local _, _, w, _ = self._front_page_title.text_rect(slot8)
		slot13 = self._front_page_title

		if w <= self._front_page_title.w(slot12) then
			break
		end
	end

	return 
end
function MissionSelectionGui:_animate_show_operation_tutorialization()
	local fade_out_duration = 0.15
	slot4 = self._settings_panel
	local t = (1 - self._settings_panel.alpha(slot3)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot5, t, 1, -1)
		slot8 = current_alpha

		self._settings_panel.set_alpha(t, self._settings_panel)
	end

	slot6 = 0

	self._settings_panel.set_alpha(slot4, self._settings_panel)

	local fade_in_duration = 0.15
	slot6 = self._operation_tutorialization_panel
	t = self._operation_tutorialization_panel.alpha(self._settings_panel) * fade_in_duration

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 1)
		slot9 = current_alpha

		self._operation_tutorialization_panel.set_alpha(t, self._operation_tutorialization_panel)
	end

	slot7 = 1

	self._operation_tutorialization_panel.set_alpha(slot5, self._operation_tutorialization_panel)

	return 
end
function MissionSelectionGui:_animate_hide_operation_tutorialization()
	local fade_out_duration = 0.15
	slot4 = self._operation_tutorialization_panel
	local t = (1 - self._operation_tutorialization_panel.alpha(slot3)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot5, t, 1, -1)
		slot8 = current_alpha

		self._operation_tutorialization_panel.set_alpha(t, self._operation_tutorialization_panel)
	end

	slot6 = 0

	self._operation_tutorialization_panel.set_alpha(slot4, self._operation_tutorialization_panel)

	local fade_in_duration = 0.15
	slot6 = self._settings_panel
	t = self._settings_panel.alpha(self._operation_tutorialization_panel) * fade_in_duration

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 1)
		slot9 = current_alpha

		self._settings_panel.set_alpha(t, self._settings_panel)
	end

	slot7 = 1

	self._settings_panel.set_alpha(slot5, self._settings_panel)

	return 
end
function MissionSelectionGui:special_btn_pressed_old(...)
	slot3 = 1
	local button_pressed = select(slot2, ...)

	if not button_pressed then
		return 
	end

	slot4 = "trigger_right"

	if button_pressed == Idstring(slot3) then
		if not self._secondary_paper_shown then
			slot5 = true

			self._difficulty_stepper.set_selected(slot3, self._difficulty_stepper)

			slot5 = false

			self._list_tabs.set_selected(slot3, self._list_tabs)

			slot5 = false

			self._raid_list.set_selected(slot3, self._raid_list)

			slot5 = false

			self._slot_list.set_selected(slot3, self._slot_list)
		end
	else
		slot4 = "trigger_left"

		if button_pressed == Idstring(slot3) then
			slot4 = self

			self._unselect_right_column(slot3)

			slot5 = true

			self._list_tabs.set_selected(slot3, self._list_tabs)
		else
			slot4 = "menu_tab_right"
		end
	end

	return 
end
function MissionSelectionGui:back_pressed()
	if self._current_display == MissionSelectionGui.DISPLAY_FIRST then
		slot3 = managers.controller

		if managers.controller.is_using_controller(slot2) then
			slot4 = nil

			managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

			slot3 = managers.raid_menu

			managers.raid_menu.on_escape(slot2)
		end
	else
		slot4 = nil

		managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

		slot3 = self

		self._display_first_screen(slot2)

		return true, nil
	end

	return 
end
function MissionSelectionGui:_unselect_right_column()
	slot4 = false

	self._difficulty_stepper.set_selected(slot2, self._difficulty_stepper)

	slot4 = false

	self._team_ai_checkbox.set_selected(slot2, self._team_ai_checkbox)

	if not Global.game_settings.single_player then
		slot4 = false

		self._permission_stepper.set_selected(slot2, self._permission_stepper)

		slot4 = false

		self._drop_in_checkbox.set_selected(slot2, self._drop_in_checkbox)

		slot4 = false

		self._auto_kick_checkbox.set_selected(slot2, self._auto_kick_checkbox)
	end

	return 
end
function MissionSelectionGui:_unselect_middle_column()
	slot4 = false

	self._info_button.set_selected(slot2, self._info_button)

	slot4 = false

	self._intel_button.set_selected(slot2, self._intel_button)

	slot4 = false

	self._audio_button.set_selected(slot2, self._audio_button)

	slot4 = false

	self._intel_image_grid.set_selected(slot2, self._intel_image_grid)

	return 
end
function MissionSelectionGui:bind_controller_inputs()
	slot3 = self

	self._bind_raid_controller_inputs(slot2)

	return 
end
function MissionSelectionGui:_bind_raid_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_list_tabs_left"
	bindings[1] = {
		label = "",
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_list_tabs_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot4 = Network

	if Network.is_server(callback(slot4, self, self)) then
		slot5 = {
			key = Idstring(slot7),
			callback = callback(slot7, self, self)
		}
		slot8 = "menu_controller_face_top"
		slot10 = "_on_start_raid"

		table.insert(slot3, bindings)
	end

	self.set_controller_bindings(slot3, self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_mission_raids",
			"menu_legend_mission_operations"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = Network

	if Network.is_server() then
		slot6 = "menu_legend_mission_start_raid"

		table.insert(slot4, legend.controller)
	end

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end
function MissionSelectionGui:_bind_locked_raid_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_list_tabs_left"
	bindings[1] = {
		label = "",
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_list_tabs_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_mission_raids",
			"menu_legend_mission_operations"
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
function MissionSelectionGui:_bind_save_slot_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_list_tabs_left"
	bindings[1] = {
		label = "",
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_list_tabs_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_left"
	slot7 = "_on_delete_save"
	bindings[3] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot4 = Network

	if Network.is_server(callback(slot4, self, self)) then
		slot5 = {
			key = Idstring(slot7),
			callback = callback(slot7, self, self)
		}
		slot8 = "menu_controller_face_top"
		slot10 = "_on_continue_save"

		table.insert(slot3, bindings)
	end

	self.set_controller_bindings(slot3, self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_mission_raids",
			"menu_legend_mission_operations",
			"menu_legend_delete"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = Network

	if Network.is_server() then
		slot6 = "menu_legend_mission_continue_save"

		table.insert(slot4, legend.controller)
	end

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end
function MissionSelectionGui:_bind_empty_slot_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_list_tabs_left"
	bindings[1] = {
		label = "",
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_list_tabs_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot4 = Network

	if Network.is_server(callback(slot4, self, self)) then
		slot5 = {
			key = Idstring(slot7),
			callback = callback(slot7, self, self)
		}
		slot8 = "menu_controller_face_top"
		slot10 = "_on_start_operation"

		table.insert(slot3, bindings)
	end

	self.set_controller_bindings(slot3, self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_mission_raids",
			"menu_legend_mission_operations"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = Network

	if Network.is_server() then
		slot6 = "menu_legend_mission_start_operation"

		table.insert(slot4, legend.controller)
	end

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end
function MissionSelectionGui:_bind_operation_list_controller_inputs()
	local bindings = {}
	slot4 = Network

	if Network.is_server(slot3) then
		slot5 = {
			key = Idstring(slot7),
			callback = callback(slot7, self, self)
		}
		slot8 = "menu_controller_face_top"
		slot10 = "_on_start_operation"

		table.insert(slot3, bindings)
	end

	self.set_controller_bindings(slot3, self, bindings)

	local legend = {
		controller = {
			"menu_legend_back"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = Network

	if Network.is_server() then
		slot6 = "menu_legend_mission_start_operation"

		table.insert(slot4, legend.controller)
	end

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end
function MissionSelectionGui:_bind_locked_operation_list_controller_inputs()
	local bindings = {}

	self.set_controller_bindings(slot3, self, bindings)

	local legend = {
		controller = {
			"menu_legend_back"
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
function MissionSelectionGui:_on_list_tabs_left()
	slot3 = self

	self._unselect_right_column(slot2)

	slot3 = self

	self._unselect_middle_column(slot2)

	slot3 = self._list_tabs

	self._list_tabs._move_left(slot2)

	self._selected_column = "left"
	self._selected_tab = "left"

	return true, nil
end
function MissionSelectionGui:_on_list_tabs_right()
	slot3 = self

	self._unselect_right_column(slot2)

	slot3 = self

	self._unselect_middle_column(slot2)

	slot3 = self._list_tabs

	self._list_tabs._move_right(slot2)

	self._selected_column = "left"
	self._selected_tab = "right"

	return true, nil
end
function MissionSelectionGui:_on_column_left()

	-- Decompilation error in this vicinity:
	if self._selected_column == "left" then
		return true, nil
	end

	slot3 = self

	self._unselect_right_column(slot2)

	slot4 = true

	self._list_tabs.set_selected(slot2, self._list_tabs)

	self._selected_column = "left"

	return true, nil
end
function MissionSelectionGui:_on_column_right()
	if self._selected_column == "right" then
		return true, nil
	end

	slot3 = self

	self._unselect_right_column(slot2)

	if not self._secondary_paper_shown then
		slot4 = true

		self._difficulty_stepper.set_selected(slot2, self._difficulty_stepper)

		slot4 = false

		self._list_tabs.set_selected(slot2, self._list_tabs)

		slot4 = false

		self._raid_list.set_selected(slot2, self._raid_list)

		slot4 = false

		self._slot_list.set_selected(slot2, self._slot_list)
	end

	self._selected_column = "right"

	return true, nil
end
function MissionSelectionGui:_on_start_raid()
	slot3 = self

	self._on_start_button_click(slot2)

	return true, nil
end
function MissionSelectionGui:_on_delete_save()
	slot3 = self

	self._on_delete_button_click(slot2)

	return true, nil
end
function MissionSelectionGui:_on_continue_save()
	slot3 = self

	self._on_start_button_click(slot2)

	return true, nil
end
function MissionSelectionGui:_on_next_operation()
	slot3 = self._operation_list

	self._operation_list.select_next_row(slot2)

	return 
end
function MissionSelectionGui:_on_start_operation()
	slot3 = self

	self._on_start_button_click(slot2)

	return true, nil
end
function MissionSelectionGui:_on_select_confirm()
	slot3 = self

	self._on_start_button_click(slot2)

	return true, nil
end

return 
