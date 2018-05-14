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
if not MissionJoinGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

MissionJoinGui = slot0
MissionJoinGui.FILTER_HEIGHT = 20
MissionJoinGui.FILTER_FONT_SIZE = 19
MissionJoinGui.FILTER_BUTTON_W = 20
MissionJoinGui.FILTER_BUTTON_H = 20
MissionJoinGui.SERVER_TABLE_ROW_HEIGHT = 42
function MissionJoinGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	MissionJoinGui.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
function MissionJoinGui:_set_initial_data()
	self.filters = {}
	self._tweak_data = tweak_data.gui.server_browser
	self._max_active_server_jobs = self._tweak_data.max_active_server_jobs
	self._active_jobs = {}
	self._active_server_jobs = {}
	self._server_list_rendered = false
	self._filters_active = false
	self._gui_jobs = {}

	return 
end
function MissionJoinGui:_layout()
	slot3 = self

	MissionJoinGui.super._layout(slot2)

	slot4 = {
		name = "list_panel",
		h = 816,
		y = 0,
		w = 1216,
		x = 0
	}
	self._list_panel = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		visible = true,
		name = "list_panel",
		h = 736,
		y = 64,
		w = 480,
		x = 1248
	}
	self._game_description_panel = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		visible = false,
		name = "list_panel",
		h = 736,
		y = 64,
		w = 480,
		x = 1248
	}
	self._filters_panel = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		name = "list_panel",
		h = 64,
		y = 832,
		w = 1728,
		x = 0
	}
	self._footer_buttons_panel = self._root_panel.panel(slot2, self._root_panel)
	slot3 = self

	self._layout_filters(slot2)

	slot3 = self

	self._layout_server_list_table(slot2)

	slot3 = self

	self._layout_game_description(slot2)

	slot3 = self

	self._layout_footer_buttons(slot2)

	slot3 = self

	self._set_additional_layout(slot2)

	slot3 = self

	self._update_active_controls(slot2)

	slot4 = true

	self._table_servers.set_selected(slot2, self._table_servers)

	slot3 = self

	self._render_filters(slot2)

	slot3 = self

	self._refresh_server_list(slot2)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
function MissionJoinGui:_layout_filters()
	local filter_label_width = 256
	local filter_control_width = 192
	local filter_control_width_wide = 250
	local filter_stepper_width = 470
	local row_spacing = 5
	slot9 = {
		name = "friends_only_button",
		text = "",
		w = 470,
		no_highlight = true,
		y = 32,
		x = 0,
		h = MissionJoinGui.FILTER_HEIGHT,
		button_w = MissionJoinGui.FILTER_BUTTON_W,
		button_h = MissionJoinGui.FILTER_BUTTON_H,
		font_size = MissionJoinGui.FILTER_FONT_SIZE,
		on_click_callback = callback(slot11, self, self),
		description = utf8.to_upper(managers.localization.text(self, managers.localization)),
		description_color = Color.white,
		on_menu_move = {
			down = "in_camp_servers_only",
			up = "mission_filter_stepper"
		}
	}
	slot14 = "friends_only_button_on_click"
	slot15 = "menu_mission_join_filters_friends_only"
	self._friends_only_button = self._filters_panel.toggle_button(slot7, self._filters_panel)
	slot9 = {
		name = "in_camp_servers_only",
		text = "",
		w = 470,
		no_highlight = true,
		x = self._friends_only_button.x(slot11),
		y = self._friends_only_button.y(slot11) + 50,
		h = MissionJoinGui.FILTER_HEIGHT,
		button_w = MissionJoinGui.FILTER_BUTTON_W,
		button_h = MissionJoinGui.FILTER_BUTTON_H,
		font_size = MissionJoinGui.FILTER_FONT_SIZE,
		on_click_callback = callback(slot11, self, self),
		description = utf8.to_upper(managers.localization.text(self, managers.localization)),
		description_color = Color.white,
		on_menu_move = {
			down = "distance_filter_stepper",
			up = "friends_only_button"
		}
	}
	slot12 = self._friends_only_button
	slot12 = self._friends_only_button
	slot14 = "in_camp_servers_only_button_on_click"
	slot15 = "menu_mission_join_filters_in_camp_servers_only"
	self._in_camp_servers_only = self._filters_panel.toggle_button(slot7, self._filters_panel)
	slot9 = {
		name = "distance_filter_stepper",
		font_size = MissionJoinGui.FILTER_FONT_SIZE,
		x = self._in_camp_servers_only.x(slot11),
		y = self._in_camp_servers_only.y(slot11) + 50,
		w = filter_stepper_width,
		h = MissionJoinGui.FILTER_HEIGHT,
		stepper_w = filter_control_width_wide + 30,
		description = utf8.to_upper(managers.localization.text(self, managers.localization)),
		description_color = Color.white,
		data_source_callback = callback(slot11, self, self),
		color = tweak_data.menu.raid_red,
		highlight_color = Color.white,
		arrow_color = tweak_data.menu.raid_red,
		arrow_highlight_color = Color.white,
		button_w = MissionJoinGui.FILTER_BUTTON_W,
		button_h = MissionJoinGui.FILTER_BUTTON_H,
		on_menu_move = {
			down = "difficulty_filter_stepper",
			up = "in_camp_servers_only"
		}
	}
	slot12 = self._in_camp_servers_only
	slot12 = self._in_camp_servers_only
	slot15 = "menu_mission_join_filters_distance_filter"
	slot14 = "data_source_distance_filter_stepper"
	self._distance_filter_stepper = self._filters_panel.stepper(slot7, self._filters_panel)
	slot9 = {
		name = "difficulty_filter_stepper",
		font_size = MissionJoinGui.FILTER_FONT_SIZE,
		x = self._distance_filter_stepper.x(slot11),
		y = self._distance_filter_stepper.y(slot11) + 50,
		w = filter_stepper_width,
		h = MissionJoinGui.FILTER_HEIGHT,
		stepper_w = filter_control_width_wide + 30,
		description = utf8.to_upper(managers.localization.text(self, managers.localization)),
		description_color = Color.white,
		data_source_callback = callback(slot11, self, self),
		color = tweak_data.menu.raid_red,
		highlight_color = Color.white,
		arrow_color = tweak_data.menu.raid_red,
		arrow_highlight_color = Color.white,
		button_w = MissionJoinGui.FILTER_BUTTON_W,
		button_h = MissionJoinGui.FILTER_BUTTON_H,
		on_menu_move = {
			down = "mission_filter_stepper",
			up = "distance_filter_stepper"
		}
	}
	slot12 = self._distance_filter_stepper
	slot12 = self._distance_filter_stepper
	slot15 = "menu_mission_join_filters_difficulty_filter"
	slot14 = "data_source_difficulty_filter_stepper"
	self._difficulty_filter_stepper = self._filters_panel.stepper(slot7, self._filters_panel)
	slot9 = {
		name = "mission_filter_stepper",
		font_size = MissionJoinGui.FILTER_FONT_SIZE,
		x = self._difficulty_filter_stepper.x(slot11),
		y = self._difficulty_filter_stepper.y(slot11) + 50,
		w = filter_stepper_width,
		h = MissionJoinGui.FILTER_HEIGHT,
		stepper_w = filter_control_width_wide + 30,
		description = utf8.to_upper(managers.localization.text(self, managers.localization)),
		description_color = Color.white,
		data_source_callback = callback(slot11, self, self),
		color = tweak_data.menu.raid_red,
		highlight_color = Color.white,
		arrow_color = tweak_data.menu.raid_red,
		arrow_highlight_color = Color.white,
		button_w = MissionJoinGui.FILTER_BUTTON_W,
		button_h = MissionJoinGui.FILTER_BUTTON_H,
		on_menu_move = {
			down = "friends_only_button",
			up = "difficulty_filter_stepper"
		}
	}
	slot12 = self._difficulty_filter_stepper
	slot12 = self._difficulty_filter_stepper
	slot15 = "menu_mission_join_filters_mission_filter"
	slot14 = "data_source_mission_filter_stepper"
	self._mission_filter_stepper = self._filters_panel.stepper(slot7, self._filters_panel)

	return 
end
function MissionJoinGui:_layout_server_list_table()

	-- Decompilation error in this vicinity:
	slot4 = {
		name = "servers_title_label",
		vertical = "top",
		h = 69,
		w = 320,
		y = 0,
		x = 0,
		text = utf8.to_upper(managers.localization.text(slot8, managers.localization)),
		color = tweak_data.gui.colors.raid_red,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.title
	}
	slot10 = "menu_mission_join_server_list_title"
	self._servers_title_label = self._list_panel.label(slot2, self._list_panel)
	local server_list_scrollable_area_params = {
		name = "servers_table_scrollable_area",
		h = 720,
		y = 96,
		w = 1216,
		x = 0,
		scroll_step = 35
	}
	slot5 = server_list_scrollable_area_params
	self._server_list_scrollable_area = self._list_panel.scrollable_area(self._list_panel, self._list_panel)
	slot5 = self._server_list_scrollable_area
	slot7 = "bind_controller_inputs"
	slot8 = 0
	slot8 = 0.1
	slot8 = 0.1
	slot9 = "on_row_selected_servers_table"
	slot9 = "on_row_clicked_servers_table"
	slot9 = "on_row_double_clicked_servers_table"
	slot8 = "data_source_servers_table"
	slot10 = true
	slot10 = "on_cell_click_servers_table"
	slot10 = true
	slot10 = "on_cell_click_servers_table"
	slot10 = true
	slot10 = "on_cell_click_servers_table"
	slot10 = true
	slot10 = "on_cell_click_servers_table"
	self._params_servers_table = {
		use_row_dividers = true,
		name = "servers_table",
		loop_items = true,
		use_selector_mark = true,
		y = 0,
		x = 0,
		w = self._server_list_scrollable_area.w(self._list_panel),
		scrollable_area_ref = self._server_list_scrollable_area,
		on_selected_callback = callback(self._list_panel, self, self),
		table_params = {
			header_params = {
				header_height = 32,
				text_color = tweak_data.gui.colors.raid_white,
				font = tweak_data.gui.fonts.din_compressed,
				font_size = tweak_data.gui.font_sizes.small
			},
			row_params = {
				spacing = 0,
				row_background_color = tweak_data.gui.colors.raid_white.with_alpha(self, tweak_data.gui.colors.raid_white),
				row_highlight_background_color = tweak_data.gui.colors.raid_white.with_alpha(self, tweak_data.gui.colors.raid_white),
				row_selected_background_color = tweak_data.gui.colors.raid_white.with_alpha(self, tweak_data.gui.colors.raid_white),
				height = MissionJoinGui.SERVER_TABLE_ROW_HEIGHT,
				font = tweak_data.gui.fonts.din_compressed,
				font_size = tweak_data.gui.font_sizes.extra_small,
				color = tweak_data.gui.colors.raid_grey,
				highlight_color = tweak_data.gui.colors.raid_white,
				selected_color = tweak_data.gui.colors.raid_red,
				on_row_select_callback = callback(self, self, self),
				on_row_click_callback = callback(self, self, self),
				on_row_double_clicked_callback = callback(self, self, self)
			},
			data_source_callback = callback(callback(self, self, self), self, self),
			columns = {
				{
					vertical = "center",
					w = 480,
					align = "left",
					header_padding = 32,
					padding = 32,
					header_text = self.translate(self, self, "menu_mission_join_server_list_columns_mission_type"),
					on_cell_click_callback = callback(self, self, self),
					cell_class = RaidGUIControlTableCell,
					color = tweak_data.gui.colors.raid_grey,
					selected_color = tweak_data.gui.colors.raid_red,
					highlight_color = tweak_data.gui.colors.raid_white
				},
				{
					vertical = "center",
					w = 224,
					align = "left",
					header_padding = 0,
					padding = 0,
					header_text = self.translate(self, self, "menu_mission_join_server_list_columns_difficulty"),
					on_cell_click_callback = callback(self, self, self),
					cell_class = RaidGUIControlTableCell,
					color = tweak_data.gui.colors.raid_grey,
					selected_color = tweak_data.gui.colors.raid_red,
					highlight_color = tweak_data.gui.colors.raid_white
				},
				{
					vertical = "center",
					w = 352,
					align = "left",
					header_padding = 0,
					padding = 0,
					header_text = self.translate(self, self, "menu_mission_join_server_list_columns_host_name"),
					on_cell_click_callback = callback(self, self, self),
					cell_class = RaidGUIControlTableCell,
					color = tweak_data.gui.colors.raid_grey,
					selected_color = tweak_data.gui.colors.raid_red,
					highlight_color = tweak_data.gui.colors.raid_white
				},
				{
					vertical = "center",
					w = 144,
					align = "left",
					header_padding = 0,
					padding = 0,
					header_text = self.translate(self, self, "menu_mission_join_server_list_columns_players"),
					on_cell_click_callback = callback(self, self, self),
					cell_class = RaidGUIControlTableCell,
					color = tweak_data.gui.colors.raid_grey,
					selected_color = tweak_data.gui.colors.raid_red,
					highlight_color = tweak_data.gui.colors.raid_white
				}
			}
		}
	}
	slot5 = "XB1"
	slot4 = self._server_list_scrollable_area
	slot5 = self._params_servers_table
	self._table_servers = self._server_list_scrollable_area.get_panel(slot3).table(slot3, self._server_list_scrollable_area.get_panel(slot3))
	slot4 = self._server_list_scrollable_area

	self._server_list_scrollable_area.setup_scroll_area(slot3)

	return 
end
function MissionJoinGui:_layout_game_description()
	local desc_mission_icon_name = tweak_data.operations.missions.flakturm.icon_menu
	local desc_mission_icon = {
		texture = tweak_data.gui.icons[desc_mission_icon_name].texture,
		texture_rect = tweak_data.gui.icons[desc_mission_icon_name].texture_rect
	}
	slot6 = {
		visible = false,
		y = 0,
		x = 0,
		texture = desc_mission_icon.texture,
		texture_rect = desc_mission_icon.texture_rect
	}
	self._desc_mission_icon = self._game_description_panel.bitmap(slot4, self._game_description_panel)
	slot6 = {
		y = 0,
		vertical = "center",
		h = 96,
		w = 400,
		align = "left",
		text = "FLAKTURM",
		visible = false,
		x = 80,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.menu_list,
		color = tweak_data.gui.colors.raid_red
	}
	self._desc_mission_name = self._game_description_panel.label(slot4, self._game_description_panel)
	slot6 = {
		y = 0,
		vertical = "center",
		h = 32,
		w = 400,
		align = "left",
		text = "FLAKTURM",
		visible = false,
		x = 80,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_red
	}
	self._desc_mission_name_small = self._game_description_panel.label(slot4, self._game_description_panel)
	local difficulty_params = {
		name = "mission_difficulty"
	}
	slot6 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(self._game_description_panel)
	slot8 = difficulty_params
	self._server_difficulty_indicator = RaidGuiControlDifficultyStars.new(self._game_description_panel, RaidGuiControlDifficultyStars, self._game_description_panel)
	slot7 = 80

	self._server_difficulty_indicator.set_x(self._game_description_panel, self._server_difficulty_indicator)

	slot7 = {
		y = 96,
		vertical = "center",
		h = 32,
		w = 240,
		align = "right",
		text = "1000 XP",
		visible = false,
		x = 240,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_grey
	}
	self._desc_xp_amount = self._game_description_panel.label(self._game_description_panel, self._game_description_panel)
	slot7 = {
		name = "player_info_panel",
		h = 288,
		y = 160,
		w = 480,
		x = 0
	}
	self._player_info_panel = self._game_description_panel.panel(self._game_description_panel, self._game_description_panel)
	self._player_controls = {}

	for counter = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		local player_description_params = {
			h = 96,
			w = 480,
			x = 0
		}
		slot12 = counter
		player_description_params.name = "player_description_" .. tostring(slot11)
		player_description_params.y = (counter - 1) * 96
		slot12 = "XB1"
		slot13 = player_description_params
		local player_control = self._player_info_panel.create_custom_control(slot10, self._player_info_panel, RaidGUIControlServerPlayerDescription)
		slot13 = nil

		player_control.set_data(self._player_info_panel, player_control)

		slot13 = player_control

		table.insert(self._player_info_panel, self._player_controls)
	end

	slot7 = {
		visible = false,
		h = 224,
		y = 512,
		w = 480,
		x = 0
	}
	self._desc_challenge_card_panel = self._game_description_panel.panel(slot5, self._game_description_panel)
	slot7 = {
		h = 138,
		y = 64,
		w = 96,
		x = 0,
		texture = tweak_data.challenge_cards.rarity_definition.loot_rarity_common.texture_path,
		texture_rect = tweak_data.challenge_cards.rarity_definition.loot_rarity_common.texture_rect
	}
	self.desc_challenge_card_icon = self._desc_challenge_card_panel.bitmap(slot5, self._desc_challenge_card_panel)
	slot7 = {
		vertical = "center",
		h = 64,
		w = 384,
		align = "left",
		text = "SWITCH HITLER",
		y = 0,
		x = 0,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	self._desc_challenge_card_name = self._desc_challenge_card_panel.label(slot5, self._desc_challenge_card_panel)
	local desc_challenge_card_rarity_icon = tweak_data.gui.icons.loot_rarity_uncommon
	slot8 = {
		h = 32,
		y = 16,
		w = 32,
		x = 384,
		texture = desc_challenge_card_rarity_icon.texture,
		texture_rect = desc_challenge_card_rarity_icon.texture_rect
	}
	self._desc_challenge_card_rarity_icon = self._desc_challenge_card_panel.bitmap(self._desc_challenge_card_panel, self._desc_challenge_card_panel)
	slot8 = {
		vertical = "center",
		h = 64,
		w = 64,
		align = "right",
		text = "X1.5",
		y = 0,
		x = 416,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	self._desc_challenge_card_xp = self._desc_challenge_card_panel.label(self._desc_challenge_card_panel, self._desc_challenge_card_panel)
	slot8 = {
		vertical = "center",
		wrap = true,
		align = "center",
		text = "SWITCH HITLER",
		w = self.desc_challenge_card_icon.w(slot10) * (1 - 2 * RaidGUIControlCardBase.TITLE_PADDING),
		h = self.desc_challenge_card_icon.h(1 - 2 * RaidGUIControlCardBase.TITLE_PADDING) * RaidGUIControlCardBase.TITLE_H,
		x = self.desc_challenge_card_icon.x(RaidGUIControlCardBase.TITLE_H) + self.desc_challenge_card_icon.w(self.desc_challenge_card_icon) * RaidGUIControlCardBase.TITLE_PADDING,
		y = self.desc_challenge_card_icon.y(self.desc_challenge_card_icon.w(self.desc_challenge_card_icon) * RaidGUIControlCardBase.TITLE_PADDING) + self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.TITLE_Y,
		font = RaidGUIControlCardBase.TITLE_FONT,
		font_size = math.ceil(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.TITLE_Y),
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot11 = self.desc_challenge_card_icon
	slot11 = self.desc_challenge_card_icon
	slot12 = self.desc_challenge_card_icon
	slot12 = self.desc_challenge_card_icon
	slot14 = self.desc_challenge_card_icon
	self._desc_challenge_card_name_on_card = self._desc_challenge_card_panel.label(self._desc_challenge_card_panel, self._desc_challenge_card_panel)
	local desc_challenge_card_rarity_icon = tweak_data.gui.icons.loot_rarity_uncommon
	local card_rarity_icon_texture = desc_challenge_card_rarity_icon.texture
	local card_rarity_icon_texture_rect = desc_challenge_card_rarity_icon.texture_rect
	slot10 = self.desc_challenge_card_icon
	local card_rarity_h = self.desc_challenge_card_icon.h(tweak_data.gui.colors.raid_dirty_white) * RaidGUIControlCardBase.ICON_H
	local card_rarity_w = card_rarity_h * card_rarity_icon_texture_rect[3] / card_rarity_icon_texture_rect[4]
	slot17 = self.desc_challenge_card_icon
	slot17 = self.desc_challenge_card_icon
	self._desc_challenge_card_rarity_icon_on_card = self._desc_challenge_card_panel.bitmap(RaidGUIControlCardBase.TITLE_TEXT_SIZE * self.desc_challenge_card_icon.h({
		w = card_rarity_w,
		h = card_rarity_h,
		x = self.desc_challenge_card_icon.w(slot15) - card_rarity_w - self.desc_challenge_card_icon.w(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_LEFT_PADDING,
		y = self.desc_challenge_card_icon.y(self.desc_challenge_card_icon.w(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_LEFT_PADDING) + self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING,
		texture = desc_challenge_card_rarity_icon.texture,
		texture_rect = desc_challenge_card_rarity_icon.texture_rect
	}) / 255, self._desc_challenge_card_panel)
	local card_type = tweak_data.gui.icons.ico_raid
	local card_type_h = card_rarity_h
	local card_type_w = card_type_h * card_type.texture_rect[3] / card_type.texture_rect[4]
	local params_card_type = {
		name = "card_type_icon",
		w = card_type_w,
		h = card_type_h
	}
	slot16 = self.desc_challenge_card_icon
	params_card_type.x = self.desc_challenge_card_icon.w(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING) * RaidGUIControlCardBase.ICON_LEFT_PADDING
	slot17 = self.desc_challenge_card_icon
	params_card_type.y = self.desc_challenge_card_icon.y(RaidGUIControlCardBase.ICON_LEFT_PADDING) + self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING
	params_card_type.texture = card_type.texture
	params_card_type.texture_rect = card_type.texture_rect
	slot16 = self.desc_challenge_card_icon
	params_card_type.layer = self.desc_challenge_card_icon.layer(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING) + 1
	slot17 = params_card_type
	self._desc_challenge_card_type_icon_on_card = self._desc_challenge_card_panel.image(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING, self._desc_challenge_card_panel)
	slot17 = {
		vertical = "center",
		align = "center",
		text = "X1.5",
		x = 0,
		y = self.desc_challenge_card_icon.y(slot19) + self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.XP_BONUS_Y,
		w = self.desc_challenge_card_icon.w(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.XP_BONUS_Y) * RaidGUIControlCardBase.XP_BONUS_W,
		h = self.desc_challenge_card_icon.h(RaidGUIControlCardBase.XP_BONUS_W) * RaidGUIControlCardBase.XP_BONUS_H,
		font = RaidGUIControlCardBase.XP_BONUS_FONT,
		font_size = math.ceil(RaidGUIControlCardBase.XP_BONUS_H),
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot21 = self.desc_challenge_card_icon
	slot20 = self.desc_challenge_card_icon
	slot20 = self.desc_challenge_card_icon
	slot23 = self.desc_challenge_card_icon
	slot20 = RaidGUIControlCardBase.XP_BONUS_FONT_SIZE * self.desc_challenge_card_icon.w(slot22) * 0.002
	self._desc_challenge_card_xp_on_card = self._desc_challenge_card_panel.label(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING, self._desc_challenge_card_panel)
	slot17 = {
		vertical = "top",
		h = 64,
		wrap = true,
		w = 352,
		align = "left",
		text = "+ shooting your secondary weapon fills up your primary ammo",
		y = 64,
		x = 128,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_18,
		color = tweak_data.gui.colors.raid_grey_effects
	}
	self._desc_challenge_card_bonus = self._desc_challenge_card_panel.label(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING, self._desc_challenge_card_panel)
	slot17 = {
		vertical = "top",
		h = 64,
		wrap = true,
		w = 352,
		align = "left",
		text = "- shooting your primary weapon consumes both primary and secondary ammo",
		y = 128,
		x = 128,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_18,
		color = tweak_data.gui.colors.raid_grey_effects
	}
	self._desc_challenge_card_malus = self._desc_challenge_card_panel.label(self.desc_challenge_card_icon.h(self.desc_challenge_card_icon) * RaidGUIControlCardBase.ICON_TOP_PADDING, self._desc_challenge_card_panel)

	return 
end
function MissionJoinGui:_layout_footer_buttons()
	slot4 = {
		name = "join_button",
		visible = true,
		y = 0,
		x = 0,
		on_click_callback = callback(slot6, self, self),
		text = self.translate(slot6, self, "menu_mission_join_join"),
		on_menu_move = {
			left = "friends_only_button",
			up = "servers_table"
		}
	}
	slot9 = "on_click_join_button"
	slot9 = true
	self._join_button = self._footer_buttons_panel.short_primary_button(slot2, self._footer_buttons_panel)
	slot4 = {
		w = 128,
		name = "apply_filters_button",
		h = 28,
		align = "center",
		vertical = "center",
		y = 0,
		visible = true,
		x = 1280,
		on_click_callback = callback(slot6, self, self),
		text = self.translate(slot6, self, "menu_mission_join_filters_apply"),
		color = Color.black,
		highlight_color = Color.white,
		texture_color = tweak_data.menu.raid_red,
		texture_highlight_color = tweak_data.menu.raid_red
	}
	slot9 = "on_click_apply_filters_button"
	slot9 = true
	self._apply_filters_button = self._footer_buttons_panel.short_tertiary_button(slot2, self._footer_buttons_panel)
	slot4 = {
		w = 128,
		name = "show_filters_button",
		h = 28,
		align = "center",
		vertical = "center",
		y = 0,
		visible = true,
		x = 1536,
		on_click_callback = callback(slot6, self, self),
		text = self.translate(slot6, self, "menu_mission_join_filters_show"),
		color = Color.black,
		highlight_color = Color.white,
		texture_color = tweak_data.menu.raid_red,
		texture_highlight_color = tweak_data.menu.raid_red
	}
	slot9 = "on_click_show_filters_button"
	slot9 = true
	self._show_filters_button = self._footer_buttons_panel.short_secondary_button(slot2, self._footer_buttons_panel)
	slot4 = {
		name = "online_users_count",
		vertical = "center",
		h = 64,
		w = 320,
		align = "left",
		text = "",
		y = 0,
		x = 960,
		color = tweak_data.gui.colors.raid_white,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.large
	}
	self._online_users_count = self._footer_buttons_panel.label(slot2, self._footer_buttons_panel)

	return 
end
function MissionJoinGui:_set_additional_layout()
	slot6 = self._footer_buttons_panel
	slot4 = self._footer_buttons_panel.h(slot5) / 2

	self._join_button.set_center_y(slot2, self._join_button)

	slot6 = self._footer_buttons_panel
	slot4 = self._footer_buttons_panel.h(slot5) / 2

	self._apply_filters_button.set_center_y(slot2, self._apply_filters_button)

	slot6 = self._footer_buttons_panel
	slot4 = self._footer_buttons_panel.h(slot5) / 2

	self._show_filters_button.set_center_y(slot2, self._show_filters_button)

	slot4 = 58

	self._desc_mission_icon.set_center_y(slot2, self._desc_mission_icon)

	slot6 = self._desc_mission_icon
	slot4 = self._desc_mission_icon.center_y(slot5) - 14

	self._desc_mission_name_small.set_center_y(slot2, self._desc_mission_name_small)

	slot6 = self._desc_mission_icon
	slot4 = self._desc_mission_icon.center_y(slot5) + 14

	self._server_difficulty_indicator.set_center_y(slot2, self._server_difficulty_indicator)

	slot3 = self._desc_xp_amount
	slot6 = self._server_difficulty_indicator

	self._desc_xp_amount.set_center_y(slot2, self._server_difficulty_indicator.center_y(slot5))

	return 
end
function MissionJoinGui:close()
	slot3 = self

	MissionJoinGui.super.close(slot2)

	slot3 = self

	self._remove_active_controls(slot2)

	return 
end
function MissionJoinGui:update(t, dt)
	return 
end
function MissionJoinGui:friends_only_button_on_click()
	local friends_only = self._friends_only_button.get_value(slot2)
	slot5 = friends_only

	managers.network.matchmake.set_search_friends_only(self._friends_only_button, managers.network.matchmake)

	return 
end
function MissionJoinGui:in_camp_servers_only_button_on_click()
	slot3 = self._in_camp_servers_only
	local state = (self._in_camp_servers_only.get_value(slot2) and 1) or -1
	slot7 = "equal"

	managers.network.matchmake.add_lobby_filter(slot3, managers.network.matchmake, "state", state)

	return 
end
function MissionJoinGui:on_row_clicked_servers_table(row_data, row_index)
	slot6 = row_data[5].value

	self._select_server_list_item(slot4, self)

	return 
end
function MissionJoinGui:on_row_double_clicked_servers_table(row_data, row_index)
	slot9 = row_data

	Application.trace(slot4, Application, "[MissionJoinGui:on_row_double_clicked_servers_table]", inspect(row_index))

	slot6 = row_data[5].value

	self._select_server_list_item(slot4, self)

	slot5 = self

	self._join_game(slot4)

	return 
end
function MissionJoinGui:on_row_selected_servers_table(row_data, row_index)
	slot6 = row_data[5].value

	self._select_server_list_item(slot4, self)

	return 
end
function MissionJoinGui:on_cell_click_servers_table(data)
	slot5 = self._selected_row_data[5].value

	self._select_server_list_item(slot3, self)

	return 
end
function MissionJoinGui:data_source_servers_table()
	local missions = {}

	if not self._gui_jobs then
		self._gui_jobs = {}
	end

	local mission_data = nil
	slot5 = self._gui_jobs

	for key, value in pairs(slot4) do
		slot10 = value.level_id

		if utf8.to_lower(slot9) == OperationsTweakData.IN_LOBBY then
			slot13 = true
			mission_data = {
				text = self.translate(slot10, self, tweak_data.operations.missions.camp.name_id),
				value = value.room_id,
				info = value.level_name
			}
		else
			slot10 = value.job_name

			if utf8.to_upper(slot9) == RaidJobManager.SINGLE_MISSION_TYPE_NAME then
				slot11 = value.level_name
				mission_data = {
					text = utf8.to_upper(slot10),
					value = value.room_id,
					info = value.level_name
				}
			else
				slot11 = value.job_name .. " " .. value.progress .. ": " .. value.level_name
				mission_data = {
					text = utf8.to_upper(slot10),
					value = value.room_id,
					info = value.level_name
				}
			end
		end

		slot11 = {
			mission_data,
			{
				text = utf8.to_upper(slot14),
				value = value.room_id,
				info = value.difficulty
			},
			{
				text = utf8.to_upper(slot14),
				value = value.room_id,
				info = value.host_name
			},
			{
				text = value.num_plrs .. "",
				value = value.room_id,
				info = value.num_plrs .. ""
			},
			{
				value = value
			}
		}
		slot15 = value.difficulty
		slot15 = value.host_name

		table.insert(slot9, missions)
	end

	return missions
end
function MissionJoinGui:_update_active_controls()
	local active_controls = managers.menu_component._active_controls

	if self._table_servers then
		active_controls[self._table_servers._name] = {
			[self._table_servers._name] = self._table_servers
		}
	end

	return 
end
function MissionJoinGui:_remove_active_controls()
	local active_controls = managers.menu_component._active_controls

	if self._table_servers then
		active_controls[self._table_servers._name] = {}
	end

	return 
end
function MissionJoinGui:data_source_distance_filter_stepper()
	local result = {}
	slot5 = {
		value = 0,
		info = "Close",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_dist_filter_close"

	table.insert(slot3, result)

	slot5 = {
		value = 2,
		info = "Far",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_dist_filter_far"

	table.insert(slot3, result)

	slot5 = {
		value = 3,
		info = "Worldwide",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_dist_filter_worldwide"

	table.insert(slot3, result)

	return result
end
function MissionJoinGui:data_source_difficulty_filter_stepper()
	local result = {}

	if tweak_data.difficulties then
		slot5 = {
			value = 0,
			info = "Any",
			text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
		}
		slot11 = "menu_any"

		table.insert(slot3, result)

		slot4 = tweak_data.difficulties

		for diff_index, diff_name in pairs(slot3) do
			slot10 = {
				text = self.translate(slot12, self),
				value = diff_index,
				info = diff_name
			}
			slot14 = "menu_" .. diff_name

			table.insert(slot8, result)
		end
	end

	return result
end
function MissionJoinGui:data_source_mission_filter_stepper()
	local result = {}
	slot11 = "menu_any"

	table.insert(slot3, result)

	slot6 = tweak_data.operations

	for _, mission_name_id in pairs(tweak_data.operations.get_raids_index({
		value = -1,
		info = "Any",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	})) do
		slot10 = mission_name_id
		local mission_data = tweak_data.operations.mission_data(slot8, tweak_data.operations)
		slot12 = true
		local mission_name = self.translate(tweak_data.operations, self, mission_data.name_id)
		slot12 = {
			text = mission_name,
			value = mission_name_id
		}

		table.insert(self, result)
	end

	slot6 = tweak_data.operations

	for _, mission_name_id in pairs(tweak_data.operations.get_operations_index(slot5)) do
		slot10 = mission_name_id
		local mission_data = tweak_data.operations.mission_data(slot8, tweak_data.operations)
		slot12 = true
		local mission_name = self.translate(tweak_data.operations, self, mission_data.name_id)
		slot12 = {
			text = mission_name,
			value = mission_name_id
		}

		table.insert(self, result)
	end

	return result
end
function MissionJoinGui:on_click_apply_filters_button()
	slot3 = self

	self._refresh_server_list(slot2)

	return 
end
function MissionJoinGui:on_click_show_filters_button()
	slot6 = self._filters_panel
	slot4 = not self._filters_panel.visible(slot5)

	self._filters_panel.set_visible(slot2, self._filters_panel)

	if self._selected_row_data then
		slot6 = self._filters_panel
		slot4 = not self._filters_panel.visible(slot5)

		self._game_description_panel.set_visible(slot2, self._game_description_panel)
	end

	return 
end
function MissionJoinGui:on_click_join_button()
	slot4 = "[MissionJoinGui:on_click_join_button]"

	Application.trace(slot2, Application)

	slot3 = self

	self._join_game(slot2)

	return 
end
function MissionJoinGui:_refresh_server_list()
	slot3 = self._apply_filters_button

	self._apply_filters_button.hide(slot2)

	local maximum_servers = managers.network.matchmake.get_lobby_return_count(slot2)
	local distance_filter = self._distance_filter_stepper.get_value(managers.network.matchmake)
	local difficulty_filter = self._difficulty_filter_stepper.get_value(self._distance_filter_stepper)
	local mission_filter = self._mission_filter_stepper.get_value(self._difficulty_filter_stepper)
	slot7 = self._in_camp_servers_only
	local state = (self._in_camp_servers_only.get_value(self._mission_filter_stepper) and 1) or -1
	slot9 = maximum_servers

	managers.network.matchmake.set_lobby_return_count(slot7, managers.network.matchmake)

	slot9 = distance_filter

	managers.network.matchmake.set_distance_filter(slot7, managers.network.matchmake)

	slot9 = difficulty_filter

	managers.network.matchmake.set_difficulty_filter(slot7, managers.network.matchmake)

	slot11 = "equal"

	managers.network.matchmake.add_lobby_filter(slot7, managers.network.matchmake, "job_id", mission_filter)

	slot11 = "equal"

	managers.network.matchmake.add_lobby_filter(slot7, managers.network.matchmake, "state", state)

	self._selected_row_data = nil
	slot8 = self
	slot11 = managers.network.matchmake

	self._find_online_games(slot7, managers.network.matchmake.search_friends_only(state))

	return 
end
function MissionJoinGui:_select_server_list_item(data_value)
	slot4 = self

	self._select_game_from_list(slot3)

	slot5 = data_value

	self._set_game_description_data(slot3, self)

	return 
end
function MissionJoinGui:_render_filters()
	slot3 = self._friends_only_button
	slot6 = managers.network.matchmake

	self._friends_only_button.set_value_and_render(slot2, managers.network.matchmake.search_friends_only(slot5))

	slot7 = "state"
	slot4 = managers.network.matchmake.get_lobby_filter(slot5, managers.network.matchmake) == 1

	self._in_camp_servers_only.set_value_and_render(slot2, self._in_camp_servers_only)

	slot3 = self._distance_filter_stepper
	slot6 = managers.network.matchmake

	self._distance_filter_stepper.select_item_by_value(slot2, managers.network.matchmake.distance_filter(slot5))

	slot3 = self._difficulty_filter_stepper
	slot6 = managers.network.matchmake

	self._difficulty_filter_stepper.select_item_by_value(slot2, managers.network.matchmake.difficulty_filter(slot5))

	slot3 = self._mission_filter_stepper
	slot7 = "job_id"

	self._mission_filter_stepper.select_item_by_value(slot2, managers.network.matchmake.get_lobby_filter(slot5, managers.network.matchmake))

	return 
end
function MissionJoinGui:_join_game()

	-- Decompilation error in this vicinity:
	slot3 = self._table_servers
	local selected_row = self._table_servers.get_selected_row(slot2)
	slot4 = selected_row
	local data = selected_row.get_data(slot3)
	local steam_player_id = data[4].value
	slot7 = steam_player_id

	managers.network.matchmake.join_server_with_check(slot5, managers.network.matchmake)

	return 
end
function MissionJoinGui:_select_game_from_list()
	slot3 = self._table_servers
	local selected_row = self._table_servers.get_selected_row(slot2)

	if not selected_row then
		return 
	end

	slot4 = selected_row
	self._selected_row_data = selected_row.get_data(slot3)

	return 
end
function MissionJoinGui:_set_game_description_data(data)

	-- Decompilation error in this vicinity:
	local in_camp = data.level_id == "camp"

	if data.level_id == OperationsTweakData.IN_LOBBY then
		data.level_id = "camp"
		in_camp = true
	end

	if data.job_id and data.level_id then
		local desc_mission_icon_name = nil
		slot7 = OperationsTweakData.JOB_TYPE_RAID

		if data.mission_type == tostring(slot6) or in_camp then
			desc_mission_icon_name = tweak_data.operations.missions[data.level_id] and tweak_data.operations.missions[data.level_id].icon_menu
		else
			slot7 = OperationsTweakData.JOB_TYPE_OPERATION

			if data.mission_type == tostring(slot6) then
				desc_mission_icon_name = tweak_data.operations.missions[data.job_id] and tweak_data.operations.missions[data.job_id].icon_menu
			end
		end

		if desc_mission_icon_name then
			local desc_mission_icon = {
				texture = tweak_data.gui.icons[desc_mission_icon_name].texture,
				texture_rect = tweak_data.gui.icons[desc_mission_icon_name].texture_rect
			}
			slot8 = desc_mission_icon.texture
			slot11 = desc_mission_icon.texture_rect

			self._desc_mission_icon.set_image(slot6, self._desc_mission_icon, unpack(slot10))

			slot8 = desc_mission_icon.texture_rect[3]

			self._desc_mission_icon.set_w(slot6, self._desc_mission_icon)

			slot8 = desc_mission_icon.texture_rect[4]

			self._desc_mission_icon.set_h(slot6, self._desc_mission_icon)

			slot7 = self._desc_mission_icon

			self._desc_mission_icon.show(slot6)
		else
			slot6 = self._desc_mission_icon

			self._desc_mission_icon.hide(slot5)
		end
	else
		slot5 = self._desc_mission_icon

		self._desc_mission_icon.hide(slot4)
	end

	if data.job_id and data.level_id then
		if in_camp then
			slot5 = self._desc_mission_name
			slot10 = true

			self._desc_mission_name.set_text(slot4, self.translate(slot7, self, tweak_data.operations.missions[data.level_id].name_id))

			slot5 = self._desc_mission_name

			self._desc_mission_name.show(slot4)

			slot5 = self._desc_mission_name_small

			self._desc_mission_name_small.hide(slot4)

			slot5 = self._server_difficulty_indicator

			self._server_difficulty_indicator.hide(slot4)
		else
			local level_name = ""
			slot7 = OperationsTweakData.JOB_TYPE_RAID

			if data.mission_type == tostring(slot6) then
				if tweak_data.operations.missions[data.level_id] then
					slot8 = true
					level_name = self.translate(slot5, self, tweak_data.operations.missions[data.level_id].name_id)
				end
			else
				slot7 = OperationsTweakData.JOB_TYPE_OPERATION

				if data.mission_type == tostring(slot6) then
					slot8 = true
					slot12 = true
					level_name = self.translate(slot5, self, tweak_data.operations.missions[data.job_id].name_id) .. " " .. data.progress .. ": " .. self.translate(slot9, self, tweak_data.operations.missions[data.job_id].events[data.level_id].name_id)
				end
			end

			slot7 = level_name

			self._desc_mission_name_small.set_text(slot5, self._desc_mission_name_small)

			slot7 = data.difficulty_id

			self._server_difficulty_indicator.set_active_difficulty(slot5, self._server_difficulty_indicator)

			slot6 = self._desc_mission_name_small

			self._desc_mission_name_small.show(slot5)

			slot6 = self._server_difficulty_indicator

			self._server_difficulty_indicator.show(slot5)

			slot6 = self._desc_mission_name

			self._desc_mission_name.hide(slot5)
		end
	else
		slot5 = self._desc_mission_name

		self._desc_mission_name.hide(slot4)
	end

	local level_xp_amount = 0
	slot7 = OperationsTweakData.JOB_TYPE_RAID

	if tostring(slot5) == tostring(data.mission_type) then
		if data.level_id then
			level_xp_amount = tweak_data.operations.missions[data.level_id] and tweak_data.operations.missions[data.level_id].xp
		else
			level_xp_amount = 0
		end
	else
		slot7 = OperationsTweakData.JOB_TYPE_OPERATION

		if tostring(slot5) == tostring(data.mission_type) then
			level_xp_amount = tweak_data.operations.missions[data.job_id].xp
		else
			slot6 = data.mission_type

			if tostring(slot5) == OperationsTweakData.IN_LOBBY then
			end
		end
	end

	if level_xp_amount and 0 < level_xp_amount then
		slot7 = level_xp_amount .. " XP"

		self._desc_xp_amount.set_text(slot5, self._desc_xp_amount)

		slot6 = self._desc_xp_amount

		self._desc_xp_amount.show(slot5)
	else
		slot6 = self._desc_xp_amount

		self._desc_xp_amount.hide(slot5)
	end

	if self._player_controls then
		slot6 = self._player_controls

		for _, player_description_control in pairs(slot5) do
			slot11 = player_description_control

			player_description_control.hide(slot10)
		end
	end

	local control_counter = 1

	for peer_counter = 1, 4, 1 do
		local control_data = data["players_info_" .. peer_counter]

		if control_data ~= NetworkMatchMakingSTEAM.EMPTY_PLAYER_INFO then
			if not self._player_controls[control_counter] then
				break
			end

			if control_data ~= "value_pending" then
				slot13 = control_data

				self._player_controls[control_counter].set_data(slot11, self._player_controls[control_counter])

				slot13 = peer_counter == 1

				self._player_controls[control_counter].set_host(slot11, self._player_controls[control_counter])

				control_counter = control_counter + 1
			end
		end
	end

	slot8 = "XB1"
	local card_key_name = data.challenge_card
	local card_data = nil

	if card_key_name ~= "empty" then
		card_data = tweak_data.challenge_cards.cards[card_key_name]
	end

	if card_data then
		slot9 = self._desc_challenge_card_panel

		self._desc_challenge_card_panel.show(slot8)

		slot10 = tweak_data.challenge_cards.challenge_card_texture_path .. card_data.texture
		slot13 = tweak_data.challenge_cards.challenge_card_texture_rect

		self.desc_challenge_card_icon.set_image(slot8, self.desc_challenge_card_icon, unpack(slot12))

		slot9 = self.desc_challenge_card_icon

		self.desc_challenge_card_icon.show(slot8)

		slot9 = self._desc_challenge_card_name
		slot14 = true

		self._desc_challenge_card_name.set_text(slot8, self.translate(unpack, self, card_data.name))

		slot10 = card_key_name
		local bonus_xp_reward = managers.challenge_cards.get_card_xp_label(slot8, managers.challenge_cards)
		slot11 = bonus_xp_reward

		self._desc_challenge_card_xp.set_text(managers.challenge_cards, self._desc_challenge_card_xp)

		slot10 = self._desc_challenge_card_xp
		local x1, y1, w1, h1 = self._desc_challenge_card_xp.text_rect(managers.challenge_cards)
		slot15 = w1

		self._desc_challenge_card_xp.set_w(card_data.name, self._desc_challenge_card_xp)

		slot17 = self._game_description_panel

		self._desc_challenge_card_xp.set_right(card_data.name, self._game_description_panel.w(slot16))

		local desc_challenge_card_rarity_icon = tweak_data.gui.icons[card_data.rarity]
		slot16 = desc_challenge_card_rarity_icon.texture
		slot19 = desc_challenge_card_rarity_icon.texture_rect

		self._desc_challenge_card_rarity_icon.set_image(self._desc_challenge_card_xp, self._desc_challenge_card_rarity_icon, unpack(slot18))

		slot18 = self._desc_challenge_card_xp
		slot16 = self._desc_challenge_card_xp.x(unpack) - 12

		self._desc_challenge_card_rarity_icon.set_right(self._desc_challenge_card_xp, self._desc_challenge_card_rarity_icon)

		slot15 = self._desc_challenge_card_rarity_icon

		self._desc_challenge_card_rarity_icon.show(self._desc_challenge_card_xp)

		if not card_data.title_in_texture then
			slot15 = self._desc_challenge_card_name_on_card
			slot20 = true

			self._desc_challenge_card_name_on_card.set_text(slot14, self.translate(slot17, self, card_data.name))
		else
			slot16 = ""

			self._desc_challenge_card_name_on_card.set_text(slot14, self._desc_challenge_card_name_on_card)
		end

		slot16 = card_key_name
		local bonus_xp_reward = managers.challenge_cards.get_card_xp_label(slot14, managers.challenge_cards)
		slot17 = bonus_xp_reward

		self._desc_challenge_card_xp_on_card.set_text(managers.challenge_cards, self._desc_challenge_card_xp_on_card)

		slot16 = self._desc_challenge_card_xp_on_card
		local x1, y1, w1, h1 = self._desc_challenge_card_xp_on_card.text_rect(managers.challenge_cards)
		slot21 = w1

		self._desc_challenge_card_xp_on_card.set_w(slot19, self._desc_challenge_card_xp_on_card)

		slot21 = h1

		self._desc_challenge_card_xp_on_card.set_h(slot19, self._desc_challenge_card_xp_on_card)

		slot21 = self.desc_challenge_card_icon.w(slot22) / 2

		self._desc_challenge_card_xp_on_card.set_center_x(slot19, self._desc_challenge_card_xp_on_card)

		slot21 = desc_challenge_card_rarity_icon.texture
		slot24 = desc_challenge_card_rarity_icon.texture_rect

		self._desc_challenge_card_rarity_icon_on_card.set_image(slot19, self._desc_challenge_card_rarity_icon_on_card, unpack(self.desc_challenge_card_icon))

		local type_definition = tweak_data.challenge_cards.type_definition[card_data.card_type]
		slot22 = type_definition.texture_path

		self._desc_challenge_card_type_icon_on_card.set_image(self._desc_challenge_card_rarity_icon_on_card, self._desc_challenge_card_type_icon_on_card)

		slot22 = type_definition.texture_rect

		self._desc_challenge_card_type_icon_on_card.set_texture_rect(self._desc_challenge_card_rarity_icon_on_card, self._desc_challenge_card_type_icon_on_card)

		slot22 = card_key_name
		local bonus_description, malus_description = managers.challenge_cards.get_card_description(self._desc_challenge_card_rarity_icon_on_card, managers.challenge_cards)
		local card_effect_y = 64

		if bonus_description and bonus_description ~= "" then
			slot25 = "+ " .. bonus_description

			self._desc_challenge_card_bonus.set_text(slot23, self._desc_challenge_card_bonus)

			slot24 = self._desc_challenge_card_bonus
			local _, _, _, h = self._desc_challenge_card_bonus.text_rect(slot23)
			slot29 = h

			self._desc_challenge_card_bonus.set_h(slot27, self._desc_challenge_card_bonus)

			card_effect_y = card_effect_y + h
		else
			slot25 = ""

			self._desc_challenge_card_bonus.set_text(slot23, self._desc_challenge_card_bonus)
		end

		if malus_description and malus_description ~= "" then
			slot25 = "- " .. malus_description

			self._desc_challenge_card_malus.set_text(slot23, self._desc_challenge_card_malus)

			slot24 = self._desc_challenge_card_malus
			local _, _, _, h = self._desc_challenge_card_malus.text_rect(slot23)
			slot29 = h

			self._desc_challenge_card_malus.set_h(slot27, self._desc_challenge_card_malus)

			slot29 = card_effect_y

			self._desc_challenge_card_malus.set_y(slot27, self._desc_challenge_card_malus)
		else
			slot25 = ""

			self._desc_challenge_card_malus.set_text(slot23, self._desc_challenge_card_malus)
		end
	else
		slot9 = self._desc_challenge_card_panel

		self._desc_challenge_card_panel.hide(slot8)

		slot10 = ""

		self._desc_challenge_card_name.set_text(slot8, self._desc_challenge_card_name)

		slot9 = self._desc_challenge_card_rarity_icon

		self._desc_challenge_card_rarity_icon.hide(slot8)

		slot10 = ""

		self._desc_challenge_card_xp.set_text(slot8, self._desc_challenge_card_xp)

		slot9 = self.desc_challenge_card_icon

		self.desc_challenge_card_icon.hide(slot8)

		slot10 = ""

		self._desc_challenge_card_bonus.set_text(slot8, self._desc_challenge_card_bonus)

		slot10 = ""

		self._desc_challenge_card_malus.set_text(slot8, self._desc_challenge_card_malus)
	end

	return 
end
slot3 = "WIN32"
local is_win32 = SystemInfo.platform(function (self, data)

	-- Decompilation error in this vicinity:
	if data.level_id ~= "camp" then
		slot2 = false
	else
		local in_camp = true
	end

	if data.level_id == OperationsTweakData.IN_LOBBY then
		data.level_id = "camp"
		in_camp = true
	end

	if data.job_id and data.level_id then
		local desc_mission_icon_name = nil
		slot7 = OperationsTweakData.JOB_TYPE_RAID

		if data.mission_type == tostring(slot6) or in_camp then
			if tweak_data.operations.missions[data.level_id] then
				desc_mission_icon_name = tweak_data.operations.missions[data.level_id].icon_menu
			end
		else
			slot7 = OperationsTweakData.JOB_TYPE_OPERATION

			if data.mission_type == tostring(slot6) and tweak_data.operations.missions[data.job_id] then
				desc_mission_icon_name = tweak_data.operations.missions[data.job_id].icon_menu
			end
		end

		if desc_mission_icon_name then
			local desc_mission_icon = {
				texture = tweak_data.gui.icons[desc_mission_icon_name].texture,
				texture_rect = tweak_data.gui.icons[desc_mission_icon_name].texture_rect
			}
			slot8 = desc_mission_icon.texture
			slot11 = desc_mission_icon.texture_rect

			self._desc_mission_icon.set_image(slot6, self._desc_mission_icon, unpack(slot10))

			slot8 = desc_mission_icon.texture_rect[3]

			self._desc_mission_icon.set_w(slot6, self._desc_mission_icon)

			slot8 = desc_mission_icon.texture_rect[4]

			self._desc_mission_icon.set_h(slot6, self._desc_mission_icon)

			slot7 = self._desc_mission_icon

			self._desc_mission_icon.show(slot6)
		else
			slot6 = self._desc_mission_icon

			self._desc_mission_icon.hide(slot5)
		end
	else
		slot5 = self._desc_mission_icon

		self._desc_mission_icon.hide(slot4)
	end

	if data.job_id and data.level_id then
		if in_camp then
			slot5 = self._desc_mission_name
			slot10 = true

			self._desc_mission_name.set_text(slot4, self.translate(slot7, self, tweak_data.operations.missions[data.level_id].name_id))

			slot5 = self._desc_mission_name

			self._desc_mission_name.show(slot4)

			slot5 = self._desc_mission_name_small

			self._desc_mission_name_small.hide(slot4)

			slot5 = self._server_difficulty_indicator

			self._server_difficulty_indicator.hide(slot4)
		else
			local level_name = ""
			slot7 = OperationsTweakData.JOB_TYPE_RAID

			if data.mission_type == tostring(slot6) then
				if tweak_data.operations.missions[data.level_id] then
					slot8 = true
					level_name = self.translate(slot5, self, tweak_data.operations.missions[data.level_id].name_id)
				end
			else
				slot7 = OperationsTweakData.JOB_TYPE_OPERATION

				if data.mission_type == tostring(slot6) then
					slot8 = true
					slot12 = true
					level_name = self.translate(slot5, self, tweak_data.operations.missions[data.job_id].name_id) .. " " .. data.progress .. ": " .. self.translate(slot9, self, tweak_data.operations.missions[data.job_id].events[data.level_id].name_id)
				end
			end

			slot7 = level_name

			self._desc_mission_name_small.set_text(slot5, self._desc_mission_name_small)

			slot7 = data.difficulty_id

			self._server_difficulty_indicator.set_active_difficulty(slot5, self._server_difficulty_indicator)

			slot6 = self._desc_mission_name_small

			self._desc_mission_name_small.show(slot5)

			slot6 = self._server_difficulty_indicator

			self._server_difficulty_indicator.show(slot5)

			slot6 = self._desc_mission_name

			self._desc_mission_name.hide(slot5)
		end
	else
		slot5 = self._desc_mission_name

		self._desc_mission_name.hide(slot4)
	end

	local level_xp_amount = 0
	slot7 = OperationsTweakData.JOB_TYPE_RAID

	if tostring(slot5) == tostring(data.mission_type) then
		if data.level_id then
			if tweak_data.operations.missions[data.level_id] then
				level_xp_amount = tweak_data.operations.missions[data.level_id].xp
			end
		else
			level_xp_amount = 0
		end
	else
		slot7 = OperationsTweakData.JOB_TYPE_OPERATION

		if tostring(slot5) == tostring(data.mission_type) then
			level_xp_amount = tweak_data.operations.missions[data.job_id].xp
		else
			slot6 = data.mission_type

			if tostring(slot5) == OperationsTweakData.IN_LOBBY then
			end
		end
	end

	if level_xp_amount and 0 < level_xp_amount then
		slot7 = level_xp_amount .. " XP"

		self._desc_xp_amount.set_text(slot5, self._desc_xp_amount)

		slot6 = self._desc_xp_amount

		self._desc_xp_amount.show(slot5)
	else
		slot6 = self._desc_xp_amount

		self._desc_xp_amount.hide(slot5)
	end

	if self._player_controls then
		slot6 = self._player_controls

		for _, player_description_control in pairs(slot5) do
			slot11 = player_description_control

			player_description_control.hide(slot10)
		end
	end

	local control_counter = 1

	for peer_counter = 1, 4, 1 do
		local control_data = data["players_info_" .. peer_counter]

		if control_data ~= NetworkMatchMakingSTEAM.EMPTY_PLAYER_INFO then
			if not self._player_controls[control_counter] then
				break
			end

			if control_data ~= "value_pending" then
				slot13 = control_data

				self._player_controls[control_counter].set_data(slot11, self._player_controls[control_counter])

				slot12 = self._player_controls[control_counter]
				slot10 = self._player_controls[control_counter].set_host

				if peer_counter ~= 1 then
					slot13 = false
				else
					slot13 = true
				end

				slot10(slot11, slot12)

				control_counter = control_counter + 1
			end
		end
	end

	slot8 = "XB1"
	local card_key_name = data.challenge_card
	local card_data = nil

	if card_key_name ~= "empty" then
		card_data = tweak_data.challenge_cards.cards[card_key_name]
	end

	if card_data then
		slot9 = self._desc_challenge_card_panel

		self._desc_challenge_card_panel.show(slot8)

		slot10 = tweak_data.challenge_cards.challenge_card_texture_path .. card_data.texture
		slot13 = tweak_data.challenge_cards.challenge_card_texture_rect

		self.desc_challenge_card_icon.set_image(slot8, self.desc_challenge_card_icon, unpack(slot12))

		slot9 = self.desc_challenge_card_icon

		self.desc_challenge_card_icon.show(slot8)

		slot9 = self._desc_challenge_card_name
		slot14 = true

		self._desc_challenge_card_name.set_text(slot8, self.translate(unpack, self, card_data.name))

		slot10 = card_key_name
		local bonus_xp_reward = managers.challenge_cards.get_card_xp_label(slot8, managers.challenge_cards)
		slot11 = bonus_xp_reward

		self._desc_challenge_card_xp.set_text(managers.challenge_cards, self._desc_challenge_card_xp)

		slot10 = self._desc_challenge_card_xp
		local x1, y1, w1, h1 = self._desc_challenge_card_xp.text_rect(managers.challenge_cards)
		slot15 = w1

		self._desc_challenge_card_xp.set_w(card_data.name, self._desc_challenge_card_xp)

		slot17 = self._game_description_panel

		self._desc_challenge_card_xp.set_right(card_data.name, self._game_description_panel.w(slot16))

		local desc_challenge_card_rarity_icon = tweak_data.gui.icons[card_data.rarity]
		slot16 = desc_challenge_card_rarity_icon.texture
		slot19 = desc_challenge_card_rarity_icon.texture_rect

		self._desc_challenge_card_rarity_icon.set_image(self._desc_challenge_card_xp, self._desc_challenge_card_rarity_icon, unpack(slot18))

		slot18 = self._desc_challenge_card_xp
		slot16 = self._desc_challenge_card_xp.x(unpack) - 12

		self._desc_challenge_card_rarity_icon.set_right(self._desc_challenge_card_xp, self._desc_challenge_card_rarity_icon)

		slot15 = self._desc_challenge_card_rarity_icon

		self._desc_challenge_card_rarity_icon.show(self._desc_challenge_card_xp)

		if not card_data.title_in_texture then
			slot15 = self._desc_challenge_card_name_on_card
			slot20 = true

			self._desc_challenge_card_name_on_card.set_text(slot14, self.translate(slot17, self, card_data.name))
		else
			slot16 = ""

			self._desc_challenge_card_name_on_card.set_text(slot14, self._desc_challenge_card_name_on_card)
		end

		slot16 = card_key_name
		local bonus_xp_reward = managers.challenge_cards.get_card_xp_label(slot14, managers.challenge_cards)
		slot17 = bonus_xp_reward

		self._desc_challenge_card_xp_on_card.set_text(managers.challenge_cards, self._desc_challenge_card_xp_on_card)

		slot16 = self._desc_challenge_card_xp_on_card
		local x1, y1, w1, h1 = self._desc_challenge_card_xp_on_card.text_rect(managers.challenge_cards)
		slot21 = w1

		self._desc_challenge_card_xp_on_card.set_w(slot19, self._desc_challenge_card_xp_on_card)

		slot21 = h1

		self._desc_challenge_card_xp_on_card.set_h(slot19, self._desc_challenge_card_xp_on_card)

		slot21 = self.desc_challenge_card_icon.w(slot22) / 2

		self._desc_challenge_card_xp_on_card.set_center_x(slot19, self._desc_challenge_card_xp_on_card)

		slot21 = desc_challenge_card_rarity_icon.texture
		slot24 = desc_challenge_card_rarity_icon.texture_rect

		self._desc_challenge_card_rarity_icon_on_card.set_image(slot19, self._desc_challenge_card_rarity_icon_on_card, unpack(self.desc_challenge_card_icon))

		local type_definition = tweak_data.challenge_cards.type_definition[card_data.card_type]
		slot22 = type_definition.texture_path

		self._desc_challenge_card_type_icon_on_card.set_image(self._desc_challenge_card_rarity_icon_on_card, self._desc_challenge_card_type_icon_on_card)

		slot22 = type_definition.texture_rect

		self._desc_challenge_card_type_icon_on_card.set_texture_rect(self._desc_challenge_card_rarity_icon_on_card, self._desc_challenge_card_type_icon_on_card)

		slot22 = card_key_name
		local bonus_description, malus_description = managers.challenge_cards.get_card_description(self._desc_challenge_card_rarity_icon_on_card, managers.challenge_cards)
		local card_effect_y = 64

		if bonus_description and bonus_description ~= "" then
			slot25 = "+ " .. bonus_description

			self._desc_challenge_card_bonus.set_text(slot23, self._desc_challenge_card_bonus)

			slot24 = self._desc_challenge_card_bonus
			local _, _, _, h = self._desc_challenge_card_bonus.text_rect(slot23)
			slot29 = h

			self._desc_challenge_card_bonus.set_h(slot27, self._desc_challenge_card_bonus)

			card_effect_y = card_effect_y + h
		else
			slot25 = ""

			self._desc_challenge_card_bonus.set_text(slot23, self._desc_challenge_card_bonus)
		end

		if malus_description and malus_description ~= "" then
			slot25 = "- " .. malus_description

			self._desc_challenge_card_malus.set_text(slot23, self._desc_challenge_card_malus)

			slot24 = self._desc_challenge_card_malus
			local _, _, _, h = self._desc_challenge_card_malus.text_rect(slot23)
			slot29 = h

			self._desc_challenge_card_malus.set_h(slot27, self._desc_challenge_card_malus)

			slot29 = card_effect_y

			self._desc_challenge_card_malus.set_y(slot27, self._desc_challenge_card_malus)
		else
			slot25 = ""

			self._desc_challenge_card_malus.set_text(slot23, self._desc_challenge_card_malus)
		end
	else
		slot9 = self._desc_challenge_card_panel

		self._desc_challenge_card_panel.hide(slot8)

		slot10 = ""

		self._desc_challenge_card_name.set_text(slot8, self._desc_challenge_card_name)

		slot9 = self._desc_challenge_card_rarity_icon

		self._desc_challenge_card_rarity_icon.hide(slot8)

		slot10 = ""

		self._desc_challenge_card_xp.set_text(slot8, self._desc_challenge_card_xp)

		slot9 = self.desc_challenge_card_icon

		self.desc_challenge_card_icon.hide(slot8)

		slot10 = ""

		self._desc_challenge_card_bonus.set_text(slot8, self._desc_challenge_card_bonus)

		slot10 = ""

		self._desc_challenge_card_malus.set_text(slot8, self._desc_challenge_card_malus)
	end

	return 
end) == Idstring(SystemInfo)
slot4 = "PS3"
local is_ps3 = SystemInfo.platform(slot2) == Idstring(SystemInfo)
slot5 = "X360"
local is_x360 = SystemInfo.platform(slot3) == Idstring(SystemInfo)
slot6 = "XB1"
local is_xb1 = SystemInfo.platform(slot4) == Idstring(SystemInfo)
slot7 = "PS4"
local is_ps4 = SystemInfo.platform(slot5) == Idstring(SystemInfo)
function MissionJoinGui:_find_online_games(friends_only)
	if is_win32 then
		slot5 = friends_only

		self._find_online_games_win32(slot3, self)
	elseif is_ps3 then
		slot5 = friends_only

		self._find_online_games_ps3(slot3, self)
	elseif is_ps4 then
		slot5 = friends_only

		self._find_online_games_ps4(slot3, self)
	elseif is_x360 then
		slot5 = friends_only

		self._find_online_games_xbox360(slot3, self)
	elseif is_xb1 then
		slot5 = friends_only

		self._find_online_games_xb1(slot3, self)
	else
		slot5 = "[MissionJoinGui] Unknown gaming platform trying to find online games!"

		Application.error(slot3, Application)
	end

	return 
end
function MissionJoinGui:_find_online_games_win32(friends_only)
	local function f(info)
		slot3 = managers.network.matchmake

		managers.network.matchmake.search_lobby_done(slot2)

		local room_list = info.room_list
		local attribute_list = info.attribute_list
		local dead_list = {}
		slot6 = self._active_server_jobs

		for id, _ in pairs(slot5) do
			dead_list[id] = true
		end

		slot6 = room_list

		for i, room in ipairs(slot5) do
			slot11 = room.owner_name
			local name_str = tostring(slot10)
			local attributes_numbers = attribute_list[i].numbers
			slot16 = attributes_numbers

			if managers.network.matchmake.is_server_ok(slot12, managers.network.matchmake, friends_only, room.owner_id) then

				-- Decompilation error in this vicinity:
				dead_list[room.room_id] = nil
				local host_name = name_str
				local level_id = attributes_numbers[1]
				local name_id = ""
				local level_name = ""
				local difficulty_id = attributes_numbers[2]
				slot20 = true
				local difficulty = self.translate(slot17, self, tweak_data.get_difficulty_string_name_from_index(slot20, tweak_data))
				local job_id = attributes_numbers[14]
				local job_name = ""
				local kick_option = attributes_numbers[8]
				local job_plan = attributes_numbers[10]
				slot24 = attributes_numbers[4]
				local state_string_id = tweak_data.index_to_server_state(difficulty_id, tweak_data)

				if players_info == "value_pending" then
					local players_info = ""
				end

				if progress == "value_pending" then
					local progress = ""
				end

				if mission_type == "value_pending" then
					local mission_type = ""
				end

				if level_id == OperationsTweakData.IN_LOBBY then
					slot36 = "menu_mission_select_in_lobby"
					level_name = self.translate(slot34, self)
					slot36 = "menu_mission_select_in_lobby"
					job_name = self.translate(slot34, self)
				else
					slot35 = mission_type

					if tonumber(slot34) == OperationsTweakData.JOB_TYPE_OPERATION then
						level_name = ""
						job_name = ""
						local operation_data = tweak_data.operations.missions[job_id]

						if operation_data and operation_data.events and operation_data.events[level_id] then
							slot37 = tweak_data.operations.missions[job_id].events[level_id].name_id
							level_name = self.translate(slot35, self)
							slot37 = tweak_data.operations.missions[job_id].name_id
							job_name = self.translate(slot35, self)
						else
							level_name = "N/A"
							job_name = "N/A"
							slot37 = "Level '" .. level_id .. "' can't be found in operation '" .. job_id .. "'."

							Application.error(slot35, Application)
						end
					else
						slot35 = mission_type

						if tonumber(slot34) == OperationsTweakData.JOB_TYPE_RAID then
							local mission_data = tweak_data.operations.missions[level_id]
							level_name = ""

							if mission_data and mission_data.name_id then
								slot37 = tweak_data.operations.missions[level_id].name_id
								level_name = self.translate(slot35, self)
							end

							slot37 = "menu_mission_selected_mission_type_raid"
							job_name = self.translate(slot35, self)
						end
					end
				end

				local is_friend = false
				slot36 = Steam

				if Steam.logged_on(slot35) then
					slot36 = Steam

					if Steam.friends(slot35) then
						slot38 = Steam

						for _, friend in ipairs(Steam.friends(slot37)) do
							slot41 = friend

							if friend.id(slot40) == room.owner_id then
								is_friend = true

								break
							end
						end
					end
				end

				name_id = name_id or "unknown"

				if name_id then
					if not self._active_server_jobs[room.room_id] then
						slot37 = self._active_server_jobs

						if table.size(slot35) + table.size(self._active_jobs) < self._tweak_data.total_active_jobs then
							slot36 = self._active_server_jobs

							if table.size(slot35) < self._max_active_server_jobs then
								self._active_server_jobs[room.room_id] = {
									added = false,
									alive_time = 0
								}
								slot37 = {
									room_id = room.room_id,
									id = room.room_id,
									level_id = level_id,
									difficulty = difficulty,
									difficulty_id = difficulty_id,
									num_plrs = num_plrs,
									host_name = host_name,
									state_name = state_name,
									state = state,
									level_name = level_name,
									job_id = job_id,
									is_friend = is_friend,
									kick_option = kick_option,
									job_plan = job_plan,
									custom_text = room.custom_text,
									challenge_card = challenge_card,
									players_info = players_info,
									progress = progress,
									mission_type = mission_type,
									job_name = job_name,
									players_info_1 = players_info_1,
									players_info_2 = players_info_2,
									players_info_3 = players_info_3,
									players_info_4 = players_info_4
								}

								self.add_gui_job(room.room_id, self)
							end
						end
					else
						slot37 = {
							room_id = room.room_id,
							id = room.room_id,
							level_id = level_id,
							difficulty = difficulty,
							difficulty_id = difficulty_id,
							num_plrs = num_plrs,
							host_name = host_name,
							state_name = state_name,
							state = state,
							level_name = level_name,
							job_id = job_id,
							is_friend = is_friend,
							kick_option = kick_option,
							job_plan = job_plan,
							custom_text = room.custom_text,
							challenge_card = challenge_card,
							players_info = players_info,
							progress = progress,
							mission_type = mission_type,
							job_name = job_name,
							players_info_1 = players_info_1,
							players_info_2 = players_info_2,
							players_info_3 = players_info_3,
							players_info_4 = players_info_4
						}

						self.update_gui_job(slot35, self)
					end
				end
			end
		end

		slot6 = dead_list

		for id, _ in pairs(slot5) do
			self._active_server_jobs[id] = nil
			slot12 = id

			self.remove_gui_job(nil, self)
		end

		if self._table_servers then
			slot6 = self._table_servers

			if self._table_servers.is_alive(slot5) then
				slot6 = self._table_servers

				self._table_servers.refresh_data(slot5)

				slot6 = self._server_list_scrollable_area

				self._server_list_scrollable_area.setup_scroll_area(slot5)

				slot7 = 1

				self._table_servers.select_table_row_by_row_idx(slot5, self._table_servers)

				slot6 = self

				self._select_game_from_list(slot5)

				if self._selected_row_data then
					slot7 = self._selected_row_data[5].value

					self._set_game_description_data(slot5, self)

					slot6 = self._game_description_panel

					self._game_description_panel.show(slot5)

					slot6 = self._filters_panel

					self._filters_panel.hide(slot5)

					slot6 = self

					self._filters_set_selected_server_table(slot5)
				else
					slot6 = self._game_description_panel

					self._game_description_panel.hide(slot5)

					slot6 = self._filters_panel

					self._filters_panel.show(slot5)

					slot6 = self

					self._filters_set_selected_filters(slot5)
				end
			end
		end

		slot6 = self._apply_filters_button

		self._apply_filters_button.show(slot5)

		return 
	end

	slot7 = f

	managers.network.matchmake.register_callback(slot4, managers.network.matchmake, "search_lobby")

	slot6 = friends_only

	managers.network.matchmake.search_lobby(slot4, managers.network.matchmake)

	local function usrs_f(success, amount)
		slot6 = amount

		print(slot3, "usrs_f", success)

		if success then
			slot5 = amount

			self.set_players_online(slot3, self)
		end

		return 
	end

	slot6 = Steam
	slot7 = usrs_f

	Steam.sa_handler(managers.network.matchmake).concurrent_users_callback(managers.network.matchmake, Steam.sa_handler(managers.network.matchmake))

	slot6 = Steam
	slot6 = Steam.sa_handler(managers.network.matchmake)

	Steam.sa_handler(managers.network.matchmake).get_concurrent_users(managers.network.matchmake)

	return 
end
function MissionJoinGui:add_gui_job(data)
	self._gui_jobs[data.id] = data

	return 
end
function MissionJoinGui:update_gui_job(data)
	self._gui_jobs[data.id] = data

	return 
end
function MissionJoinGui:remove_gui_job(id)
	self._gui_jobs[id] = nil

	return 
end
function MissionJoinGui:set_players_online(amount)
	if self._online_users_count then
		slot4 = self._online_users_count

		if self._online_users_count.is_alive(slot3) then
			slot9 = true
			slot5 = self.translate(slot6, self, "menu_mission_join_users_online_count") .. " " .. amount

			self._online_users_count.set_text(slot3, self._online_users_count)
		end
	end

	return 
end
function MissionJoinGui:_filters_set_selected_server_table()
	self._filters_active = false
	slot4 = false

	self._friends_only_button.set_selected(slot2, self._friends_only_button)

	slot4 = false

	self._in_camp_servers_only.set_selected(slot2, self._in_camp_servers_only)

	slot4 = false

	self._distance_filter_stepper.set_selected(slot2, self._distance_filter_stepper)

	slot4 = false

	self._difficulty_filter_stepper.set_selected(slot2, self._difficulty_filter_stepper)

	slot4 = false

	self._mission_filter_stepper.set_selected(slot2, self._mission_filter_stepper)

	for i = 1, #self._player_controls, 1 do
		slot8 = false

		self._player_controls[i].set_selected(slot6, self._player_controls[i])
	end

	slot4 = true

	self._table_servers.set_selected(slot2, self._table_servers)

	return 
end
function MissionJoinGui:_filters_set_selected_filters()
	self._filters_active = true
	slot4 = true

	self._friends_only_button.set_selected(slot2, self._friends_only_button)

	slot4 = false

	self._in_camp_servers_only.set_selected(slot2, self._in_camp_servers_only)

	slot4 = false

	self._distance_filter_stepper.set_selected(slot2, self._distance_filter_stepper)

	slot4 = false

	self._difficulty_filter_stepper.set_selected(slot2, self._difficulty_filter_stepper)

	slot4 = false

	self._mission_filter_stepper.set_selected(slot2, self._mission_filter_stepper)

	for i = 1, #self._player_controls, 1 do
		slot8 = false

		self._player_controls[i].set_selected(slot6, self._player_controls[i])
	end

	slot4 = false

	self._table_servers.set_selected(slot2, self._table_servers)

	return 
end
function MissionJoinGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_top"
	slot7 = "_on_refresh"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_left"
	slot7 = "_on_filter"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_mission_join_refresh",
			"menu_legend_mission_join_filter",
			"menu_legend_mission_join_join"
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
function MissionJoinGui:bind_controller_inputs_no_join()
	local bindings = {}
	slot5 = "menu_controller_face_top"
	slot7 = "_on_refresh"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_left"
	slot7 = "_on_filter"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_mission_join_refresh",
			"menu_legend_mission_join_filter"
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
function MissionJoinGui:bind_controller_inputs_player_description()
	local bindings = {}
	slot5 = "menu_controller_face_top"
	slot7 = "_on_refresh"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_left"
	slot7 = "_on_filter"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {}
	slot7 = managers.localization
	slot11 = true
	legend.controller = {
		"menu_legend_back",
		"menu_legend_mission_join_refresh",
		"menu_legend_mission_join_filter",
		{
			translated_text = managers.localization.get_default_macros(true).BTN_A .. " " .. self.translate(slot8, self, "menu_gamercard_widget_label")
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(" ", self, self, "_on_legend_pc_back")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end
function MissionJoinGui:_on_refresh()
	slot3 = self

	self.on_click_apply_filters_button(slot2)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return true, nil
end
function MissionJoinGui:_on_filter()
	slot3 = self._table_servers
	local server_table_selected = self._table_servers.is_selected(slot2)
	local have_any_servers = false
	slot5 = self._gui_jobs

	for index, job_data in pairs(slot4) do
		have_any_servers = true

		break
	end

	if not self._filters_active or not have_any_servers then
		slot5 = self

		self._filters_set_selected_filters(slot4)

		slot5 = self

		self.bind_controller_inputs_no_join(slot4)
	else
		slot5 = self

		self._filters_set_selected_server_table(slot4)

		slot5 = self

		self.bind_controller_inputs(slot4)
	end

	slot5 = self

	self.on_click_show_filters_button(slot4)

	return true, nil
end
function MissionJoinGui:confirm_pressed()
	slot4 = "[MissionJoinGui:confirm_pressed]"

	Application.trace(slot2, Application)

	slot3 = self._table_servers
	local server_table_selected = self._table_servers.is_selected(slot2)

	if server_table_selected then
		slot4 = self

		self.on_click_join_button(slot3)
	else
		slot4 = self

		MissionJoinGui.super.confirm_pressed(slot3)
	end

	return 
end
function MissionJoinGui:back_pressed()
	slot4 = "[MissionJoinGui:back_pressed]"

	Application.trace(slot2, Application)

	slot3 = managers.raid_menu

	managers.raid_menu.on_escape(slot2)

	return 
end

return 
