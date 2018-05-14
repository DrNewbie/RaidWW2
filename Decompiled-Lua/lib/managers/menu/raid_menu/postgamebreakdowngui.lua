if not PostGameBreakdownGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

PostGameBreakdownGui = slot0
PostGameBreakdownGui.XP_BREAKDOWN_X = 2
PostGameBreakdownGui.XP_BREAKDOWN_Y = 126
PostGameBreakdownGui.TOP_STATS_SMALL_Y = 448
PostGameBreakdownGui.TOP_STATS_SMALL_W = 320
PostGameBreakdownGui.TOP_STATS_SMALL_H = 224
PostGameBreakdownGui.PROGRESS_BAR_Y = 719
PostGameBreakdownGui.XP_BREAKDOWN_WIDTH = 284
PostGameBreakdownGui.XP_BREAKDOWN_HEIGHT = 270
PostGameBreakdownGui.STATS_BREAKDOWN_WIDTH = 284
PostGameBreakdownGui.STATS_BREAKDOWN_HEIGHT = 250
PostGameBreakdownGui.STATS_BREAKDOWN_Y = 126
PostGameBreakdownGui.NEW_LEVEL_LABEL_Y = 533
PostGameBreakdownGui.NEW_LEVEL_LABEL_W = 640
PostGameBreakdownGui.NEW_LEVEL_LABEL_H = 50
PostGameBreakdownGui.NEW_LEVEL_LABEL_FONT_SIZE = tweak_data.gui.font_sizes.size_46
PostGameBreakdownGui.NEW_LEVEL_LABEL_COLOR = tweak_data.gui.colors.raid_red
PostGameBreakdownGui.NEW_WEAPON_LABEL_Y = 597
PostGameBreakdownGui.NEW_WEAPON_LABEL_W = 640
PostGameBreakdownGui.NEW_WEAPON_LABEL_H = 50
PostGameBreakdownGui.NEW_WEAPON_LABEL_FONT_SIZE = tweak_data.gui.font_sizes.size_46
PostGameBreakdownGui.NEW_WEAPON_LABEL_COLOR = tweak_data.gui.colors.raid_red
PostGameBreakdownGui.TOTAL_XP_Y = 549
PostGameBreakdownGui.TOTAL_XP_H = 128
PostGameBreakdownGui.TOTAL_XP_LABEL_FONT_SIZE = tweak_data.gui.font_sizes.size_32
PostGameBreakdownGui.TOTAL_XP_LABEL_COLOR = tweak_data.gui.colors.raid_white
PostGameBreakdownGui.TOTAL_XP_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
PostGameBreakdownGui.TOTAL_XP_VALUE_COLOR = tweak_data.gui.colors.raid_red
PostGameBreakdownGui.TOTAL_XP_VALUE_PADDING = 14
PostGameBreakdownGui.FONT = tweak_data.gui.fonts.din_compressed
PostGameBreakdownGui.CENTRAL_DISPLAY_W = 960
PostGameBreakdownGui.CENTRAL_DISPLAY_H = 512
PostGameBreakdownGui.CENTRAL_DISPLAY_TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
PostGameBreakdownGui.CENTRAL_DISPLAY_TITLE_COLOR = tweak_data.gui.colors.raid_red
PostGameBreakdownGui.CENTRAL_DISPLAY_SUBTITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_56
PostGameBreakdownGui.CENTRAL_DISPLAY_SUBTITLE_COLOR = tweak_data.gui.colors.raid_red
PostGameBreakdownGui.CENTRAL_DISPLAY_FLAVOR_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_32
PostGameBreakdownGui.CENTRAL_DISPLAY_FLAVOR_TEXT_COLOR = tweak_data.gui.colors.raid_white
PostGameBreakdownGui.CENTRAL_DISPLAY_TEXT_H = 76
PostGameBreakdownGui.CENTRAL_DISPLAY_SINGLE_ICON_CENTER_Y = 208
PostGameBreakdownGui.GENERIC_WIN_ICON = "experience_no_progress_large"
PostGameBreakdownGui.FAIL_ICON = "experience_mission_fail_large"
PostGameBreakdownGui.ONE_POINT_SOUND_EFFECT = "one_number_one_click"
PostGameBreakdownGui.LEVEL_UP_SOUND_EFFECT = "leveled_up"
function PostGameBreakdownGui:init(ws, fullscreen_ws, node, component_name)
	slot7 = "[PostGameBreakdownGui:init()]"

	print(slot6)

	self._closing = false
	slot7 = game_state_machine
	self.current_state = game_state_machine.current_state(slot6)
	slot7 = self

	self._calculate_xp_needed_for_levels(slot6)

	slot11 = component_name

	PostGameBreakdownGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot7 = managers.raid_menu
	slot12 = "on_escape"

	managers.raid_menu.register_on_escape_callback(slot6, callback(fullscreen_ws, self, self))

	return 
end
function PostGameBreakdownGui:_set_initial_data()
	slot3 = self.current_state

	if self.current_state.is_success(slot2) then
		slot4 = "menu_header_experience_success"

		self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)
	else
		slot4 = "menu_header_experience_fail"

		self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)
	end

	slot4 = 0

	self._node.components.raid_menu_header._screen_name_label.set_alpha(slot2, self._node.components.raid_menu_header._screen_name_label)

	return 
end
function PostGameBreakdownGui:_layout()
	PostGameBreakdownGui.super._layout(slot2)

	local params_xp_breakdown = {
		name = "xp_breakdown",
		visible = true,
		x = PostGameBreakdownGui.XP_BREAKDOWN_X,
		y = PostGameBreakdownGui.XP_BREAKDOWN_Y
	}
	slot6 = "data_source_xp_breakdown"
	params_xp_breakdown.data_source_callback = callback(self, self, self)
	slot6 = params_xp_breakdown
	self._xp_breakdown = self._root_panel.create_custom_control(self, self._root_panel, RaidGUIControlXPBreakdown)

	self._xp_breakdown.hide(self)

	local params_stats_breakdown = {
		name = "stats_breakdown",
		visible = true
	}
	slot5 = self._root_panel
	slot5 = self._root_panel.get_engine_panel(self._xp_breakdown)
	params_stats_breakdown.x = self._root_panel.get_engine_panel(self._xp_breakdown).w(self._xp_breakdown) - RaidGuiBase.PADDING - PostGameBreakdownGui.STATS_BREAKDOWN_WIDTH
	params_stats_breakdown.y = PostGameBreakdownGui.STATS_BREAKDOWN_Y
	slot7 = "data_source_stats_breakdown"
	params_stats_breakdown.data_source_callback = callback(PostGameBreakdownGui.STATS_BREAKDOWN_WIDTH, self, self)
	self._stats_breakdown = self._root_panel.create_custom_control(PostGameBreakdownGui.STATS_BREAKDOWN_WIDTH, self._root_panel, RaidGUIControlStatsBreakdown)
	slot9 = self._stats_breakdown
	slot6 = self._root_panel.w(params_stats_breakdown) - self._stats_breakdown.w(self._root_panel)

	self._stats_breakdown.set_x(PostGameBreakdownGui.STATS_BREAKDOWN_WIDTH, self._stats_breakdown)
	self._stats_breakdown.hide(PostGameBreakdownGui.STATS_BREAKDOWN_WIDTH)

	local top_stats_small_panel_params = {
		halign = "right",
		name = "top_stats_small_panel",
		alpha = 0,
		valign = "top",
		y = PostGameBreakdownGui.TOP_STATS_SMALL_Y,
		w = PostGameBreakdownGui.TOP_STATS_SMALL_W,
		h = PostGameBreakdownGui.TOP_STATS_SMALL_H
	}
	slot7 = top_stats_small_panel_params
	self._top_stats_small_panel = self._root_panel.panel(self._stats_breakdown, self._root_panel)
	slot6 = self._top_stats_small_panel
	slot9 = self._root_panel

	self._top_stats_small_panel.set_right(self._stats_breakdown, self._root_panel.w(self._root_panel))

	self._top_stats_small = {}

	for i = 1, 3, 1 do
		local top_stat_small_params = {}
		slot12 = i
		top_stat_small_params.name = "top_stat_small_" .. tostring(slot11)
		slot13 = top_stat_small_params
		local top_stat_small = self._top_stats_small_panel.create_custom_control(tostring(slot11), self._top_stats_small_panel, RaidGUIControlTopStatSmall)
		slot13 = top_stat_small

		table.insert(self._top_stats_small_panel, self._top_stats_small)
	end

	slot9 = self._top_stats_small_panel
	slot7 = self._top_stats_small_panel.h(slot8) / 2

	self._top_stats_small[2].set_center_y(slot5, self._top_stats_small[2])

	slot9 = self._top_stats_small_panel

	self._top_stats_small[3].set_bottom(slot5, self._top_stats_small_panel.h(slot8))

	local progress_bar_params = {
		name = "progress_bar",
		bar_w = 62450,
		horizontal_padding = 64,
		y = PostGameBreakdownGui.PROGRESS_BAR_Y
	}
	slot7 = self._root_panel
	progress_bar_params.w = self._root_panel.w(self._top_stats_small[3])
	slot8 = self.current_state.initial_xp
	progress_bar_params.initial_progress = self._get_progress(self._top_stats_small[3], self)
	slot8 = self.current_state.initial_xp
	progress_bar_params.initial_level = self._get_level_by_xp(self._top_stats_small[3], self)
	slot9 = progress_bar_params
	self._progress_bar = self._root_panel.create_custom_control(self._top_stats_small[3], self._root_panel, RaidGUIControlXPProgressBar)
	slot7 = self._progress_bar

	self._progress_bar.hide(self._top_stats_small[3])

	slot8 = self.current_state.initial_xp
	local current_level = self._get_level_by_xp(self._top_stats_small[3], self)

	if current_level ~= 0 then
		slot9 = current_level

		self._progress_bar.set_level(slot7, self._progress_bar)
	end

	local total_xp_params = {
		name = "total_xp",
		value = "0",
		align = "center",
		value_align = "center",
		x = 0,
		layer = 1,
		y = PostGameBreakdownGui.TOTAL_XP_Y
	}
	slot9 = self._root_panel
	total_xp_params.w = self._root_panel.w(slot8)
	total_xp_params.h = PostGameBreakdownGui.TOTAL_XP_H
	total_xp_params.text = self.translate(slot8, self, "menu_total_xp")
	total_xp_params.color = PostGameBreakdownGui.TOTAL_XP_LABEL_COLOR
	total_xp_params.font_size = PostGameBreakdownGui.TOTAL_XP_LABEL_FONT_SIZE
	total_xp_params.value_color = PostGameBreakdownGui.TOTAL_XP_VALUE_COLOR
	total_xp_params.value_font_size = PostGameBreakdownGui.TOTAL_XP_VALUE_FONT_SIZE
	total_xp_params.value_padding = PostGameBreakdownGui.TOTAL_XP_VALUE_PADDING
	slot10 = total_xp_params
	self._total_xp_label = self._root_panel.label_named_value(slot8, self._root_panel)
	slot10 = 0

	self._total_xp_label.set_alpha(slot8, self._total_xp_label)

	slot9 = self._total_xp_label
	slot13 = self.current_state.initial_xp

	self._total_xp_label.set_value(slot8, string.format(true, "%d"))

	slot9 = self

	self._layout_central_display(slot8)

	slot9 = self

	self._layout_generic_win_display(slot8)

	slot9 = self

	self._layout_fail_display(slot8)

	slot9 = self

	self._layout_skill_unlock_display(slot8)

	slot9 = self

	self._layout_double_unlock_display(slot8)

	self._displaying_double_unlock = false
	slot9 = game_state_machine
	slot9 = game_state_machine.current_state(slot8)

	if game_state_machine.current_state(slot8).is_success(slot8) then
		self._current_central_display = self._generic_win_panel
	else
		self._current_central_display = self._fail_panel
	end

	slot9 = game_state_machine

	if game_state_machine.current_state(slot8).stats_ready then
		slot9 = self

		self.animate_breakdown(slot8)
	end

	slot9 = self

	self.bind_controller_inputs(slot8)

	return 
end
function PostGameBreakdownGui:_layout_central_display()
	local central_display_panel_params = {
		alpha = 0,
		name = "central_display_params",
		halign = "center",
		valign = "top",
		w = PostGameBreakdownGui.CENTRAL_DISPLAY_W,
		h = PostGameBreakdownGui.CENTRAL_DISPLAY_H
	}
	slot5 = central_display_panel_params
	self._central_display_panel = self._root_panel.panel(slot3, self._root_panel)
	slot7 = self._root_panel
	slot5 = self._root_panel.w(slot6) / 2

	self._central_display_panel.set_center_x(slot3, self._central_display_panel)

	return 
end
function PostGameBreakdownGui:_layout_generic_win_display()
	local generic_win_panel_params = {
		visible = true,
		name = "generic_win_panel",
		halign = "scale",
		valign = "scale"
	}
	slot4 = self._central_display_panel
	generic_win_panel_params.w = self._central_display_panel.w(slot3)
	slot4 = self._central_display_panel
	generic_win_panel_params.h = self._central_display_panel.h(slot3)
	slot5 = generic_win_panel_params
	self._generic_win_panel = self._central_display_panel.panel(slot3, self._central_display_panel)
	slot4 = self.current_state

	if not self.current_state.is_success(slot3) then
		slot5 = false

		self._generic_win_panel.set_visible(slot3, self._generic_win_panel)
	end

	local icon_params = {
		name = "generic_win_icon",
		texture = tweak_data.gui.icons[PostGameBreakdownGui.GENERIC_WIN_ICON].texture,
		texture_rect = tweak_data.gui.icons[PostGameBreakdownGui.GENERIC_WIN_ICON].texture_rect
	}
	slot6 = icon_params
	local icon = self._generic_win_panel.bitmap(PostGameBreakdownGui.GENERIC_WIN_ICON, self._generic_win_panel)
	slot9 = self._generic_win_panel
	slot7 = self._generic_win_panel.w(slot8) / 2

	icon.set_center_x(self._generic_win_panel, icon)
	icon.set_center_y(self._generic_win_panel, icon)

	slot6 = managers.experience
	local is_player_max_level = managers.experience.reached_level_cap(self._generic_win_panel)
	local title_text_params = {
		vertical = "center",
		name = "generic_win_title_text",
		align = "center",
		h = PostGameBreakdownGui.CENTRAL_DISPLAY_TEXT_H,
		font = PostGameBreakdownGui.FONT,
		font_size = PostGameBreakdownGui.CENTRAL_DISPLAY_TITLE_FONT_SIZE,
		color = PostGameBreakdownGui.CENTRAL_DISPLAY_TITLE_COLOR
	}
	slot10 = true
	title_text_params.text = self.translate(PostGameBreakdownGui.CENTRAL_DISPLAY_SINGLE_ICON_CENTER_Y, self, "menu_almost_there")
	title_text_params.visible = not is_player_max_level
	slot9 = title_text_params
	local title = self._generic_win_panel.text(PostGameBreakdownGui.CENTRAL_DISPLAY_SINGLE_ICON_CENTER_Y, self._generic_win_panel)
	slot9 = title
	local _, _, w, h = title.text_rect(self._generic_win_panel)
	slot14 = w

	title.set_w(slot12, title)

	slot14 = h

	title.set_h(slot12, title)

	slot13 = title
	slot16 = self._generic_win_panel

	title.set_bottom(slot12, self._generic_win_panel.h(slot15))

	slot16 = self._generic_win_panel
	slot14 = self._generic_win_panel.w(slot15) / 2

	title.set_center_x(slot12, title)

	local flavor_text_params = {
		vertical = "center",
		name = "generic_win_flavor_text",
		align = "center",
		h = PostGameBreakdownGui.CENTRAL_DISPLAY_TEXT_H,
		font = PostGameBreakdownGui.FONT,
		font_size = PostGameBreakdownGui.CENTRAL_DISPLAY_FLAVOR_TEXT_FONT_SIZE,
		color = PostGameBreakdownGui.CENTRAL_DISPLAY_FLAVOR_TEXT_COLOR
	}
	slot16 = true
	flavor_text_params.text = self.translate(title, self, "menu_keep_it_up")
	flavor_text_params.visible = not is_player_max_level
	slot15 = flavor_text_params
	local flavor_text = self._generic_win_panel.text(title, self._generic_win_panel)
	slot15 = flavor_text
	local _, _, w, _ = flavor_text.text_rect(self._generic_win_panel)
	slot20 = w

	flavor_text.set_w(slot18, flavor_text)

	slot22 = title
	slot20 = title.y(slot21) + 15

	flavor_text.set_bottom(slot18, flavor_text)

	slot19 = flavor_text
	slot22 = title

	flavor_text.set_x(slot18, title.x(slot21))

	return 
end
function PostGameBreakdownGui:_layout_fail_display()
	local fail_panel_params = {
		visible = false,
		name = "fail_display_panel",
		halign = "scale",
		valign = "scale"
	}
	slot4 = self._central_display_panel
	fail_panel_params.w = self._central_display_panel.w(slot3)
	slot4 = self._central_display_panel
	fail_panel_params.h = self._central_display_panel.h(slot3)
	slot5 = fail_panel_params
	self._fail_panel = self._central_display_panel.panel(slot3, self._central_display_panel)
	slot4 = self.current_state

	if not self.current_state.is_success(slot3) then
		slot5 = true

		self._fail_panel.set_visible(slot3, self._fail_panel)
	end

	local icon_params = {
		name = "fail_icon",
		texture = tweak_data.gui.icons[PostGameBreakdownGui.FAIL_ICON].texture,
		texture_rect = tweak_data.gui.icons[PostGameBreakdownGui.FAIL_ICON].texture_rect
	}
	slot6 = icon_params
	local icon = self._fail_panel.bitmap(PostGameBreakdownGui.FAIL_ICON, self._fail_panel)
	slot9 = self._fail_panel
	slot7 = self._fail_panel.w(slot8) / 2

	icon.set_center_x(self._fail_panel, icon)

	slot7 = PostGameBreakdownGui.CENTRAL_DISPLAY_SINGLE_ICON_CENTER_Y

	icon.set_center_y(self._fail_panel, icon)

	local title_text_params = {
		align = "center",
		vertical = "center",
		name = "fail_title_text",
		h = PostGameBreakdownGui.CENTRAL_DISPLAY_TEXT_H,
		font = PostGameBreakdownGui.FONT,
		font_size = PostGameBreakdownGui.CENTRAL_DISPLAY_TITLE_FONT_SIZE,
		color = PostGameBreakdownGui.CENTRAL_DISPLAY_TITLE_COLOR
	}
	slot9 = true
	title_text_params.text = self.translate(icon, self, "menu_better_luck_next_time")
	slot8 = title_text_params
	local title = self._fail_panel.text(icon, self._fail_panel)
	slot8 = title
	local _, _, w, h = title.text_rect(self._fail_panel)
	slot13 = w

	title.set_w(slot11, title)

	slot13 = h

	title.set_h(slot11, title)

	slot12 = title
	slot15 = self._fail_panel

	title.set_bottom(slot11, self._fail_panel.h(slot14))

	slot15 = self._fail_panel
	slot13 = self._fail_panel.w(slot14) / 2

	title.set_center_x(slot11, title)

	local flavor_text_params = {
		align = "center",
		vertical = "center",
		name = "fail_flavor_text",
		h = PostGameBreakdownGui.CENTRAL_DISPLAY_TEXT_H,
		font = PostGameBreakdownGui.FONT,
		font_size = PostGameBreakdownGui.CENTRAL_DISPLAY_FLAVOR_TEXT_FONT_SIZE,
		color = PostGameBreakdownGui.CENTRAL_DISPLAY_FLAVOR_TEXT_COLOR
	}
	slot15 = true
	flavor_text_params.text = self.translate(title, self, "menu_fail")
	slot14 = flavor_text_params
	local flavor_text = self._fail_panel.text(title, self._fail_panel)
	slot14 = flavor_text
	local _, _, w, _ = flavor_text.text_rect(self._fail_panel)
	slot19 = w

	flavor_text.set_w(slot17, flavor_text)

	slot21 = title
	slot19 = title.y(slot20) + 15

	flavor_text.set_bottom(slot17, flavor_text)

	slot18 = flavor_text
	slot21 = title

	flavor_text.set_x(slot17, title.x(slot20))

	return 
end
function PostGameBreakdownGui:_layout_skill_unlock_display()
	slot4 = self._central_display_panel
	self._skill_unlock_display = RaidGUIControlXPSkillSet.new(slot2, RaidGUIControlXPSkillSet)

	return 
end
function PostGameBreakdownGui:_layout_double_unlock_display()
	slot4 = self._central_display_panel
	self._double_unlock_display = RaidGUIControlXPDoubleUnlock.new(slot2, RaidGUIControlXPDoubleUnlock)

	return 
end
function PostGameBreakdownGui:_get_progress(current_xp)
	local level_cap = managers.experience.level_cap(slot3)
	slot6 = current_xp
	local current_level = self._get_level_by_xp(managers.experience, self)
	slot7 = current_level
	local xp_for_current_level = managers.experience.get_total_xp_for_level(self, managers.experience)
	local xp_for_next_level = xp_for_current_level

	if current_level < level_cap then
		slot9 = current_level + 1
		xp_for_next_level = managers.experience.get_total_xp_for_level(slot7, managers.experience)
	end

	local progress_to_level = (current_level - 1) / (level_cap - 1)
	local progress_in_level = 0

	if xp_for_next_level ~= xp_for_current_level then
		progress_in_level = 1 / (level_cap - 1) * (current_xp - xp_for_current_level) / (xp_for_next_level - xp_for_current_level)
	end

	slot12 = 1

	return math.clamp(slot9, progress_to_level + progress_in_level, 0)
end
function PostGameBreakdownGui:_calculate_xp_needed_for_levels()
	slot3 = managers.experience
	local level_cap = managers.experience.level_cap(slot2)
	self._levels_by_xp = {}

	for i = 1, level_cap, 1 do
		slot9 = i
		local points_needed = managers.experience.get_total_xp_for_level(slot7, managers.experience)
		slot10 = points_needed

		table.insert(managers.experience, self._levels_by_xp)
	end

	return 
end
function PostGameBreakdownGui:_get_level_by_xp(xp)
	slot4 = managers.experience
	local level_cap = managers.experience.level_cap(slot3)
	local points_needed = self._levels_by_xp[1]
	local level = 0

	while level < level_cap and points_needed < xp do
		level = level + 1
		points_needed = self._levels_by_xp[level + 1]
	end

	return level
end
function PostGameBreakdownGui:_get_xp_breakdown()
	local xp_table = {
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		},
		{
			{
				value = 1,
				info = "empty",
				text = ""
			},
			{
				value = 0,
				info = "empty",
				text = ""
			}
		}
	}

	return xp_table
end
function PostGameBreakdownGui:data_source_xp_breakdown()
	slot3 = self

	return self._get_xp_breakdown(slot2)
end
function PostGameBreakdownGui:_get_stats_breakdown()
	slot3 = game_state_machine
	local personal_stats = game_state_machine.current_state(slot2).personal_stats
	local stats_breakdown = {}
	slot9 = true
	slot7 = personal_stats.session_killed
	stats_breakdown[1] = {
		{
			value = 1,
			info = "lvl diff",
			text = self.translate(slot6, self, "menu_stat_total_kills_title")
		},
		{
			value = 200,
			info = "lvl diff",
			text = tostring(slot6)
		}
	}
	slot9 = true
	slot8 = personal_stats.session_accuracy
	stats_breakdown[2] = {
		{
			value = 1,
			info = "surviving players",
			text = self.translate(slot6, self, "menu_stat_accuracy_title")
		},
		{
			value = 500,
			info = "surviving players",
			text = string.format(slot6, "%.0f") .. "%"
		}
	}
	slot9 = true
	slot7 = personal_stats.session_headshots
	slot10 = personal_stats.session_headshot_percentage
	stats_breakdown[3] = {
		{
			value = 1,
			info = "human players",
			text = self.translate("%", self, "menu_stat_headshots_title")
		},
		{
			value = 450,
			info = "human players",
			text = tostring("%") .. " (" .. string.format("menu_stat_headshots_title", "%.0f") .. "%)"
		}
	}
	slot9 = true
	slot7 = personal_stats.session_special_kills
	stats_breakdown[4] = {
		{
			value = 1,
			info = "most kills",
			text = self.translate(" (", self, "menu_stat_special_kills_title")
		},
		{
			value = 0,
			info = "most kills",
			text = tostring(" (")
		}
	}
	slot9 = true
	slot7 = personal_stats.session_teammates_revived
	stats_breakdown[5] = {
		{
			value = 1,
			info = "best acc",
			text = self.translate(" (", self, "menu_stat_teammates_revived_title")
		},
		{
			value = 0,
			info = "best acc",
			text = tostring(" (")
		}
	}
	slot9 = true
	slot7 = personal_stats.session_bleedouts
	stats_breakdown[6] = {
		{
			value = 1,
			info = "most specials",
			text = self.translate(" (", self, "menu_stat_bleedouts_title")
		},
		{
			value = 500,
			info = "most specials",
			text = tostring(" (")
		}
	}

	return stats_breakdown
end
function PostGameBreakdownGui:data_source_stats_breakdown()
	slot3 = self

	return self._get_stats_breakdown(slot2)
end
function PostGameBreakdownGui:_continue_button_on_click()
	slot3 = managers.raid_menu

	managers.raid_menu.close_menu(slot2)

	return 
end
function PostGameBreakdownGui:close()
	if self._closing then
		return 
	end

	slot3 = self._root_panel
	slot3 = self._root_panel.get_engine_panel(slot2)

	self._root_panel.get_engine_panel(slot2).stop(slot2)

	self._closing = true
	slot3 = game_state_machine

	if game_state_machine.current_state_name(slot2) == "event_complete_screen" then
		slot3 = game_state_machine
		slot3 = game_state_machine.current_state(slot2)

		game_state_machine.current_state(slot2).continue(slot2)
	end

	slot3 = self

	PostGameBreakdownGui.super.close(slot2)

	return 
end
function PostGameBreakdownGui:give_xp(xp_earned)
	slot4 = self._root_panel
	slot9 = "_animate_giving_xp"
	slot6 = xp_earned

	self._root_panel.get_engine_panel(slot3).animate(slot3, self._root_panel.get_engine_panel(slot3), callback(slot6, self, self))

	return 
end
function PostGameBreakdownGui:_unlock_level(level)
	if level == 1 then
		return 
	end

	managers.menu_component.post_event(slot3, managers.menu_component)

	slot4 = managers.skilltree
	local character_class = managers.skilltree.get_character_profile_class(slot3)
	local weapon_unlock_progression = tweak_data.skilltree.automatic_unlock_progressions[character_class]
	slot7 = level

	self._progress_bar.unlock_level(PostGameBreakdownGui.LEVEL_UP_SOUND_EFFECT, self._progress_bar)

	slot7 = level

	self._skill_unlock_display.set_level(PostGameBreakdownGui.LEVEL_UP_SOUND_EFFECT, self._skill_unlock_display)

	slot7 = level

	self._double_unlock_display.set_level(PostGameBreakdownGui.LEVEL_UP_SOUND_EFFECT, self._double_unlock_display)

	self._displaying_double_unlock = false

	if ((weapon_unlock_progression[level] and weapon_unlock_progression[level].weapons) or self._should_display_double_unlock) and not self._displaying_double_unlock then
		self._should_display_double_unlock = true
		slot6 = self._central_display_panel
		slot6 = self._central_display_panel.get_engine_panel(slot5)

		self._central_display_panel.get_engine_panel(slot5).stop(slot5)

		slot6 = self._central_display_panel
		slot11 = "_animate_active_display_panel"
		slot8 = self._double_unlock_display

		self._central_display_panel.get_engine_panel(slot5).animate(slot5, self._central_display_panel.get_engine_panel(slot5), callback(slot8, self, self))
	elseif self._current_central_display == self._generic_win_panel or self._current_central_display == self._fail_panel then
		slot6 = self._central_display_panel
		slot6 = self._central_display_panel.get_engine_panel(slot5)

		self._central_display_panel.get_engine_panel(slot5).stop(slot5)

		slot6 = self._central_display_panel
		slot11 = "_animate_active_display_panel"
		slot8 = self._skill_unlock_display

		self._central_display_panel.get_engine_panel(slot5).animate(slot5, self._central_display_panel.get_engine_panel(slot5), callback(slot8, self, self))
	end

	return 
end
function PostGameBreakdownGui:_animate_active_display_panel(central_display_panel, new_active_panel)
	local fade_out_duration = 0.25
	local fade_in_duration = 0.3
	slot7 = self._central_display_panel
	local t = (1 - self._central_display_panel.alpha(slot6)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 1, -1)
		slot11 = current_alpha

		self._central_display_panel.set_alpha(t, self._central_display_panel)
	end

	slot9 = 0

	self._central_display_panel.set_alpha(slot7, self._central_display_panel)

	slot9 = false

	self._current_central_display.set_visible(slot7, self._current_central_display)

	self._current_central_display = new_active_panel
	slot9 = true

	self._current_central_display.set_visible(slot7, self._current_central_display)

	if new_active_panel == self._double_unlock_display then
		self._displaying_double_unlock = true
	end

	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot8, t, 0, 1)
		slot11 = current_alpha

		self._central_display_panel.set_alpha(t, self._central_display_panel)
	end

	slot9 = 1

	self._central_display_panel.set_alpha(slot7, self._central_display_panel)

	return 
end
function PostGameBreakdownGui:animate_breakdown()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)

	if 1 < managers.network.session(slot2).amount_of_players(slot2) then
		slot3 = managers.statistics
		local top_stats = managers.statistics.get_top_stats(slot2)

		for i = 1, 3, 1 do
			local data = {
				player_nickname = top_stats[i].peer_name,
				stat = top_stats[i].id,
				icon = tweak_data.statistics.top_stats[top_stats[i].id].icon,
				icon_texture = tweak_data.statistics.top_stats[top_stats[i].id].texture,
				icon_texture_rect = tweak_data.statistics.top_stats[top_stats[i].id].texture_rect,
				score = top_stats[i].score,
				score_format = tweak_data.statistics.top_stats[top_stats[i].id].score_format
			}
			slot10 = data

			self._top_stats_small[i].set_data(top_stats[i].id, self._top_stats_small[i])
		end
	end

	slot4 = "[PostGameBreakdownGui:_layout()] Saving progress!"

	Application.debug(slot2, Application)

	slot3 = managers.savefile

	managers.savefile.save_progress(slot2)

	slot3 = self._root_panel
	slot3 = self._root_panel.get_engine_panel(slot2)
	slot8 = "_animate_xp_breakdown"

	self._root_panel.get_engine_panel(slot2).animate(slot2, callback(slot5, self, self))

	return 
end
function PostGameBreakdownGui:_animate_xp_breakdown()
	local t = 0
	local xp_breakdown = self.current_state.xp_breakdown
	local table = self._xp_breakdown._breakdown_table
	local table_rows = table.get_rows(slot5)
	slot7 = table_rows[#table_rows]
	local total_row_cells = table_rows[#table_rows].get_cells(table)
	local shown_total_row = false
	local current_index = 1
	local current_multiplier = 1
	local current_total = 0
	slot13 = self.current_state.initial_xp
	local previous_level = self._get_level_by_xp(slot11, self)
	local current_level = previous_level
	local max_unlocked_level = previous_level
	local actual_level = managers.experience.current_level(slot14)
	slot16 = 0.5

	wait(managers.experience)

	slot21 = "_fade_in_label"

	self._node.components.raid_menu_header._screen_name_label._object.animate(managers.experience, self._node.components.raid_menu_header._screen_name_label._object, callback(slot18, self, self))

	slot16 = self._xp_breakdown

	self._xp_breakdown.fade_in(managers.experience)

	slot16 = self._progress_bar

	self._progress_bar.fade_in(managers.experience)

	slot16 = self._total_xp_label._object
	slot21 = "_fade_in_label"

	self._total_xp_label._object.get_engine_panel(managers.experience).animate(managers.experience, self._total_xp_label._object.get_engine_panel(managers.experience), callback(0.2, self, self))

	slot16 = self._central_display_panel
	slot21 = "_fade_in_label"
	slot18 = 0.2

	self._central_display_panel.get_engine_panel(managers.experience).animate(managers.experience, self._central_display_panel.get_engine_panel(managers.experience), callback(0.2, self, self))

	slot16 = 1.1

	wait(managers.experience)

	for i = 1, #xp_breakdown.additive, 1 do
		local previous_value = 0
		local current_value = 0
		t = 0
		local row_cells = table_rows[current_index].get_cells(slot21)
		slot24 = false

		row_cells[1].set_visible(table_rows[current_index], row_cells[1])

		slot24 = false

		row_cells[2].set_visible(table_rows[current_index], row_cells[2])

		slot23 = row_cells[1]
		slot29 = xp_breakdown.additive[i].id

		row_cells[1].set_text(table_rows[current_index], utf8.to_upper(managers.localization.text(slot27, managers.localization)))

		slot24 = "0"

		row_cells[2].set_text(table_rows[current_index], row_cells[2])

		slot24 = 0.15

		row_cells[1].fade_in(table_rows[current_index], row_cells[1])

		slot24 = 0.15

		row_cells[2].fade_in(table_rows[current_index], row_cells[2])

		if not shown_total_row then
			slot24 = "0"

			self._xp_breakdown.set_total(slot22, self._xp_breakdown)

			slot23 = self._xp_breakdown

			self._xp_breakdown.fade_in_total(slot22)

			shown_total_row = true
		end

		slot23 = 0.13

		wait(slot22)

		while t < 0.5 do
			local dt = coroutine.yield()
			t = t + dt
			slot27 = 0.5
			current_value = Easing.quartic_in_out(slot23, t, 0, xp_breakdown.additive[i].amount)
			slot28 = current_value

			row_cells[2].set_text(slot23, row_cells[2], string.format(xp_breakdown.additive[i].amount, "%.0f"))

			slot28 = current_total + current_value

			self._xp_breakdown.set_total(slot23, self._xp_breakdown, string.format(true, "%.0f"))

			slot28 = self.current_state.initial_xp + current_total + current_value
			slot26 = true

			self._total_xp_label.set_value(slot23, self._total_xp_label, string.format(true, "%.0f"))

			if current_value ~= previous_value then
				slot25 = PostGameBreakdownGui.ONE_POINT_SOUND_EFFECT

				managers.menu_component.post_event(slot23, managers.menu_component)
			end

			slot28 = self.current_state.initial_xp + current_total + current_value
			slot26 = current_total + current_value

			self._progress_bar.set_progress(slot23, self._progress_bar, self._get_progress(slot26, self))

			slot25 = self.current_state.initial_xp + current_total + current_value
			current_level = self._get_level_by_xp(slot23, self)

			if previous_level < current_level and max_unlocked_level < current_level and current_level <= actual_level then
				slot25 = current_level

				self._unlock_level(slot23, self)

				max_unlocked_level = current_level
			end

			previous_value = current_value
			previous_level = current_level
		end

		slot23 = 0.1

		wait(slot22)

		current_total = current_total + xp_breakdown.additive[i].amount
		current_index = current_index + 1
	end

	slot16 = 0.25

	wait(slot15)

	current_index = current_index + 1
	local total_base = current_total

	for i = 1, #xp_breakdown.multiplicative, 1 do
		local previous_value = 0
		local current_value = 0
		t = 0
		local row_cells = table_rows[current_index].get_cells(slot22)
		slot25 = false

		row_cells[1].set_visible(table_rows[current_index], row_cells[1])

		slot25 = false

		row_cells[2].set_visible(table_rows[current_index], row_cells[2])

		slot24 = row_cells[1]
		slot30 = xp_breakdown.multiplicative[i].id

		row_cells[1].set_text(table_rows[current_index], utf8.to_upper(managers.localization.text(slot28, managers.localization)))

		slot25 = "+0%"

		row_cells[2].set_text(table_rows[current_index], row_cells[2])

		slot25 = 0.15

		row_cells[1].fade_in(table_rows[current_index], row_cells[1])

		slot25 = 0.15

		row_cells[2].fade_in(table_rows[current_index], row_cells[2])

		slot24 = 0.13

		wait(table_rows[current_index])

		while t < 0.5 do
			local dt = coroutine.yield()
			t = t + dt
			slot28 = 0.5
			current_value = Easing.quartic_in_out(slot24, t, 0, xp_breakdown.multiplicative[i].amount)
			slot29 = current_value * 100

			row_cells[2].set_text(slot24, row_cells[2], string.format(xp_breakdown.multiplicative[i].amount, "+%.0f%%"))

			slot29 = current_total + current_value * total_base

			self._xp_breakdown.set_total(slot24, self._xp_breakdown, string.format(true, "%.0f"))

			slot29 = self.current_state.initial_xp + current_total + current_value * total_base
			slot27 = true

			self._total_xp_label.set_value(slot24, self._total_xp_label, string.format(true, "%.0f"))

			if current_value ~= previous_value then
				slot26 = PostGameBreakdownGui.ONE_POINT_SOUND_EFFECT

				managers.menu_component.post_event(slot24, managers.menu_component)
			end

			slot26 = self.current_state.initial_xp + current_total + current_value * total_base
			local current_progress = self._get_progress(slot24, self)
			slot30 = self.current_state.initial_xp + current_total + current_value * total_base
			slot28 = current_total + current_value * total_base

			self._progress_bar.set_progress(self, self._progress_bar, self._get_progress(slot28, self))

			slot27 = self.current_state.initial_xp + current_total + current_value * total_base
			current_level = self._get_level_by_xp(self, self)

			if previous_level < current_level and max_unlocked_level < current_level and current_level <= actual_level then
				slot27 = current_level

				self._unlock_level(slot25, self)

				max_unlocked_level = current_level
			end

			previous_value = current_value
			previous_level = current_level
		end

		slot24 = 0.1

		wait(slot23)

		current_total = current_total + xp_breakdown.multiplicative[i].amount * total_base
		current_index = current_index + 1
	end

	slot17 = self._stats_breakdown

	self._stats_breakdown.fade_in(slot16)

	slot17 = managers.network
	slot17 = managers.network.session(slot16)

	if 1 < managers.network.session(slot16).amount_of_players(slot16) then
		slot17 = game_state_machine
		slot17 = game_state_machine.current_state(slot16)

		if game_state_machine.current_state(slot16).is_success(slot16) then
			slot18 = "XB1"

			if SystemInfo.platform(slot16) ~= Idstring(SystemInfo) then
				slot18 = "X360"

				if SystemInfo.platform(slot16) ~= Idstring(SystemInfo) then
					slot17 = 1.5

					wait(slot16)

					slot17 = self._top_stats_small_panel
					slot22 = "_fade_in_label"
					slot19 = 0.2

					self._top_stats_small_panel.get_engine_panel(slot16).animate(slot16, self._top_stats_small_panel.get_engine_panel(slot16), callback(slot19, self, self))
				end
			end
		end
	end

	return 
end
function PostGameBreakdownGui:_fade_in_label(text, duration, delay)
	local anim_duration = duration or 0.15
	slot7 = text
	local t = text.alpha(slot6) * anim_duration

	if delay then
		slot8 = delay

		wait(slot7)
	end

	while t < anim_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = anim_duration
		local current_alpha = Easing.quartic_out(slot8, t, 0, 1)
		slot11 = current_alpha

		text.set_alpha(t, text)
	end

	slot9 = 1

	text.set_alpha(slot7, text)

	return 
end
function PostGameBreakdownGui:_animate_giving_xp(panel, xp_earned)
	local points_given = 0
	local mid_speed = 30
	local in_duration = 3
	local out_duration = 2
	local t = 0

	while t < in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = in_duration
		local current_speed = Easing.quadratic_in(slot10, t, 1, mid_speed - 1)

		if xp_earned < points_given + current_speed then
			break
		end

		points_given = points_given + current_speed
	end

	while points_given + mid_speed < xp_earned do
		local dt = coroutine.yield()
		points_given = points_given + mid_speed
	end

	return 
end
function PostGameBreakdownGui:confirm_pressed()
	slot3 = self

	self._continue_button_on_click(slot2)

	return 
end
function PostGameBreakdownGui:on_escape()
	return true
end
function PostGameBreakdownGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_bottom"
	slot7 = "_continue_button_on_click"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_continue"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_continue",
			callback = callback(true, self, self, "_continue_button_on_click")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end

return 
