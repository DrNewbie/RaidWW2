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
HUDTabScreen = HUDTabScreen or class()
HUDTabScreen.X_PADDING = 10
HUDTabScreen.Y_PADDING = 10
HUDTabScreen.BACKGROUND_IMAGE = "secondary_menu"
HUDTabScreen.PROFILE_INFO_W = 384
HUDTabScreen.PROFILE_INFO_H = 160
HUDTabScreen.PROFILE_INFO_BOTTOM_OFFSET = 64
HUDTabScreen.PROFILE_NAME_FONT = tweak_data.gui.fonts.din_compressed
HUDTabScreen.PROFILE_NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDTabScreen.PROFILE_LEVEL_FONT_SIZE = tweak_data.gui.font_sizes.menu_list
HUDTabScreen.PROFILE_LEVEL_RIGHT_OFFSET = 22
HUDTabScreen.TIMER_W = 512
HUDTabScreen.TIMER_H = 64
HUDTabScreen.TIMER_FONT = tweak_data.gui.fonts.din_compressed
HUDTabScreen.TIMER_FONT_SIZE = tweak_data.gui.font_sizes.size_56
HUDTabScreen.TIMER_Y = 0
HUDTabScreen.TIMER_ICON = "ico_time"
HUDTabScreen.TIMER_ICON_TEXT_DISTANCE = 25
HUDTabScreen.TIMER_PADDING_LEFT = 32
HUDTabScreen.DIFFICULTY_H = 64
HUDTabScreen.DIFFICULTY_FONT = tweak_data.gui.fonts.din_compressed
HUDTabScreen.DIFFICULTY_FONT_SIZE = tweak_data.gui.font_sizes.size_56
HUDTabScreen.DIFFICULTY_Y = 0
HUDTabScreen.DIFFICULTY_ICON_TEXT_DISTANCE = 10
HUDTabScreen.MISSION_INFO_Y = 0
HUDTabScreen.MISSION_INFO_W = 640
HUDTabScreen.MISSION_INFO_H = 64
HUDTabScreen.MISSION_INFO_TEXT_X = 74
HUDTabScreen.MISSION_INFO_TEXT_Y = -2
HUDTabScreen.MISSION_INFO_TEXT_FONT = tweak_data.gui.fonts.din_compressed
HUDTabScreen.MISSION_INFO_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_56
HUDTabScreen.MISSION_INFO_TEXT_COLOR = tweak_data.gui.colors.raid_red
HUDTabScreen.LOOT_INFO_W = 416
HUDTabScreen.LOOT_INFO_H = 96
HUDTabScreen.LOOT_INFO_BOTTOM_OFFSET = 134
HUDTabScreen.LOOT_INFO_FONT = tweak_data.gui.fonts.din_compressed
HUDTabScreen.LOOT_INFO_TITLE_FONT_SIZE = tweak_data.gui.font_sizes.extra_small
HUDTabScreen.LOOT_INFO_TITLE_COLOR = tweak_data.gui.colors.raid_grey_effects
HUDTabScreen.LOOT_INFO_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_32
HUDTabScreen.LOOT_INFO_VALUE_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDTabScreen.LOOT_INFO_RIBBON_Y = 768
HUDTabScreen.LOOT_INFO_RIBBON_ICON = "rwd_stats_bg"
HUDTabScreen.LOOT_INFO_RIBBON_ICON_CENTER_FROM_RIGHT = 320
HUDTabScreen.LOOT_INFO_RIBBON_CENTER_Y = 800
HUDTabScreen.CARD_INFO_X = 0
HUDTabScreen.CARD_INFO_Y = 128
HUDTabScreen.CARD_INFO_W = 384
HUDTabScreen.CARD_INFO_H = 608
HUDTabScreen.CARD_INFO_TITLE_FONT = tweak_data.gui.fonts.din_compressed
HUDTabScreen.CARD_INFO_TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDTabScreen.CARD_INFO_TITLE_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDTabScreen.CARD_INFO_FAILED_TITLE_COLOR = tweak_data.gui.colors.raid_red
HUDTabScreen.NO_CARD_ICON = "card_pass"
HUDTabScreen.NO_CARD_TEXT_Y = 272
HUDTabScreen.NO_CARD_TEXT_FONT = tweak_data.gui.fonts.lato
HUDTabScreen.NO_CARD_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDTabScreen.CARD_Y = 48
HUDTabScreen.CARD_W = 168
HUDTabScreen.OBJECTIVES_INFO_Y = 96
HUDTabScreen.NEXT_CHALLENGE_QUEUE_ID = "tab_screen_show_next_challenge"
HUDTabScreen.NEXT_CHALLENGE_DELAY = 4
function HUDTabScreen:init(fullscreen_hud, hud)
	slot6 = fullscreen_hud

	self._create_background(slot4, self)

	slot6 = fullscreen_hud

	self._create_map(slot4, self)

	slot6 = hud

	self._create_panel(slot4, self)

	slot5 = self

	self._create_mission_info(slot4)

	slot5 = self

	self._create_timer(slot4)

	slot5 = self

	self._create_progression_timer(slot4)

	slot5 = self

	self._create_card_info(slot4)

	slot5 = self

	self._create_profile_info(slot4)

	slot5 = self

	self._create_weapon_challenge_info(slot4)

	slot5 = self

	self._create_loot_info(slot4)

	slot5 = self

	self._create_greed_bar(slot4)

	slot6 = hud

	self._create_objectives_info(slot4, self)

	slot5 = self
	slot8 = managers.greed

	self.set_current_greed_amount(slot4, managers.greed.current_loot_counter(slot7))

	return 
end
function HUDTabScreen:_create_background(fullscreen_hud)
	local background_params = {
		y = 0,
		name = "tab_screen_background",
		halign = "scale",
		alpha = 0.9,
		visible = false,
		x = 0,
		valign = "scale"
	}
	slot5 = fullscreen_hud.panel
	background_params.w = fullscreen_hud.panel.w(slot4)
	slot5 = fullscreen_hud.panel
	background_params.h = fullscreen_hud.panel.h(slot4)
	background_params.color = tweak_data.gui.colors.raid_black
	background_params.layer = tweak_data.gui.TAB_SCREEN_LAYER
	slot6 = background_params
	self._background = fullscreen_hud.panel.rect(slot4, fullscreen_hud.panel)

	return 
end
function HUDTabScreen:_create_background_image()
	if self._background_image then
		slot3 = self._background_image
		slot4 = self._background_image

		self._background_image.parent(slot2).remove(slot2, self._background_image.parent(slot2))

		self._background_image = nil
	end

	local background_image = nil
	slot4 = managers.raid_job

	if managers.raid_job.is_camp_loaded(slot3) then
		background_image = tweak_data.operations.missions.camp.tab_background_image
	else
		slot4 = managers.raid_job
		local current_job = managers.raid_job.current_job(slot3)

		if current_job then
			if current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
				background_image = tweak_data.operations.missions[current_job.job_id].tab_background_image
			else
				local current_event = current_job.events_index[current_job.current_event]
				local event_data = tweak_data.operations.missions[current_job.job_id].events[current_event]
				background_image = event_data.tab_background_image
			end
		end
	end

	if not background_image then
		return 
	end

	slot4 = self._background
	local fullscreen_panel = self._background.parent(slot3)
	local background_image_params = {
		name = "tab_screen_background_image",
		halign = "scale",
		valign = "scale",
		texture = background_image
	}
	slot6 = self._background
	background_image_params.layer = self._background.layer(slot5) + 1
	slot7 = background_image_params
	self._background_image = fullscreen_panel.bitmap(slot5, fullscreen_panel)
	slot9 = fullscreen_panel
	slot7 = fullscreen_panel.w(slot8) / 2

	self._background_image.set_center_x(slot5, self._background_image)

	slot9 = fullscreen_panel
	slot7 = fullscreen_panel.h(slot8) / 2

	self._background_image.set_center_y(slot5, self._background_image)

	return 
end
function HUDTabScreen:_create_map(fullscreen_hud)
	local map_params = {
		name = "tab_map"
	}
	slot5 = self._background
	map_params.layer = self._background.layer(slot4) + 1
	slot7 = map_params
	self._map = HUDMapTab.new(slot4, HUDMapTab, fullscreen_hud.panel)

	return 
end
function HUDTabScreen:_create_panel(hud)
	local panel_params = {
		y = 0,
		name = "tab_screen",
		halign = "scale",
		visible = false,
		x = 0,
		valign = "scale"
	}
	slot5 = hud.panel
	panel_params.w = hud.panel.w(slot4)
	slot5 = hud.panel
	panel_params.h = hud.panel.h(slot4)
	panel_params.layer = tweak_data.gui.TAB_SCREEN_LAYER + 5
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
function HUDTabScreen:_create_card_info()
	local card_info_panel_params = {
		halign = "left",
		name = "card_info_panel",
		valign = "top",
		x = HUDTabScreen.CARD_INFO_X,
		y = HUDTabScreen.CARD_INFO_Y,
		w = HUDTabScreen.CARD_INFO_W,
		h = HUDTabScreen.CARD_INFO_H
	}
	slot5 = card_info_panel_params
	self._card_info_panel = self._object.panel(slot3, self._object)
	local empty_card_panel_params = {
		halign = "scale",
		name = "empty_card_panel",
		y = 0,
		x = 0,
		valign = "scale"
	}
	slot5 = self._card_info_panel
	empty_card_panel_params.w = self._card_info_panel.w(self._object)
	slot5 = self._card_info_panel
	empty_card_panel_params.h = self._card_info_panel.h(self._object)
	slot6 = empty_card_panel_params
	self._empty_card_panel = self._card_info_panel.panel(self._object, self._card_info_panel)
	local empty_card_title_params = {
		name = "empty_card_title",
		h = 32,
		vertical = "center",
		align = "left",
		y = 0,
		x = 0
	}
	slot6 = self._empty_card_panel
	empty_card_title_params.w = self._empty_card_panel.w(self._card_info_panel)
	slot8 = HUDTabScreen.CARD_INFO_TITLE_FONT_SIZE
	empty_card_title_params.font = tweak_data.gui.get_font_path(self._card_info_panel, tweak_data.gui, HUDTabScreen.CARD_INFO_TITLE_FONT)
	empty_card_title_params.font_size = HUDTabScreen.CARD_INFO_TITLE_FONT_SIZE
	slot9 = "hud_empty_challenge_card_title"
	empty_card_title_params.text = utf8.to_upper(managers.localization.text(HUDTabScreen.CARD_INFO_TITLE_FONT, managers.localization))
	empty_card_title_params.color = HUDTabScreen.CARD_INFO_TITLE_COLOR
	slot7 = empty_card_title_params
	local empty_card_title = self._empty_card_panel.text(self._card_info_panel, self._empty_card_panel)
	local empty_slot_texture = tweak_data.gui.icons.cc_empty_slot_small
	local empty_card_image_params = {
		name = "empty_card_image",
		x = 0,
		y = HUDTabScreen.CARD_Y,
		w = HUDTabScreen.CARD_W
	}
	slot10 = HUDTabScreen.NO_CARD_ICON
	slot11 = HUDTabScreen.NO_CARD_ICON
	empty_card_image_params.h = tweak_data.gui.icon_h(managers.localization, tweak_data.gui) / tweak_data.gui.icon_w(tweak_data.gui, tweak_data.gui) * HUDTabScreen.CARD_W
	empty_card_image_params.texture = empty_slot_texture.texture
	empty_card_image_params.texture_rect = empty_slot_texture.texture_rect
	local empty_card_image = self._empty_card_panel.bitmap(HUDTabScreen.CARD_W, self._empty_card_panel)
	local empty_card_text_params = {
		name = "empty_card_text",
		wrap = true,
		align = "left",
		halign = "scale",
		vertical = "top",
		valign = "scale"
	}
	slot11 = empty_card_image
	empty_card_text_params.x = empty_card_image.x(empty_card_image_params) + 5
	empty_card_text_params.y = HUDTabScreen.NO_CARD_TEXT_Y + HUDTabScreen.CARD_Y
	slot11 = self._empty_card_panel
	empty_card_text_params.w = self._empty_card_panel.w(HUDTabScreen.CARD_Y)
	slot11 = self._empty_card_panel
	empty_card_text_params.h = self._empty_card_panel.h(HUDTabScreen.CARD_Y) - HUDTabScreen.NO_CARD_TEXT_Y - HUDTabScreen.CARD_Y
	slot13 = HUDTabScreen.NO_CARD_TEXT_FONT_SIZE
	empty_card_text_params.font = tweak_data.gui.get_font_path(HUDTabScreen.CARD_Y, tweak_data.gui, HUDTabScreen.NO_CARD_TEXT_FONT)
	empty_card_text_params.font_size = HUDTabScreen.NO_CARD_TEXT_FONT_SIZE
	empty_card_text_params.color = HUDTabScreen.CARD_INFO_TITLE_COLOR
	slot12 = "hud_no_challenge_card_text"
	empty_card_text_params.text = managers.localization.text(HUDTabScreen.CARD_Y, managers.localization)
	local empty_card_text = self._empty_card_panel.text(HUDTabScreen.CARD_Y, self._empty_card_panel)
	local active_card_panel_params = {
		halign = "scale",
		name = "active_card_panel",
		y = 0,
		x = 0,
		valign = "scale"
	}
	slot13 = self._card_info_panel
	active_card_panel_params.w = self._card_info_panel.w(empty_card_text_params)
	slot13 = self._card_info_panel
	active_card_panel_params.h = self._card_info_panel.h(empty_card_text_params)
	slot14 = active_card_panel_params
	self._active_card_panel = self._card_info_panel.panel(empty_card_text_params, self._card_info_panel)
	local active_card_title_params = {
		name = "active_card_title",
		h = 32,
		vertical = "center",
		align = "left",
		y = 0,
		x = 0
	}
	slot14 = self._active_card_panel
	active_card_title_params.w = self._active_card_panel.w(self._card_info_panel)
	slot16 = HUDTabScreen.CARD_INFO_TITLE_FONT_SIZE
	active_card_title_params.font = tweak_data.gui.get_font_path(self._card_info_panel, tweak_data.gui, HUDTabScreen.CARD_INFO_TITLE_FONT)
	active_card_title_params.font_size = HUDTabScreen.CARD_INFO_TITLE_FONT_SIZE
	slot17 = "hud_active_challenge_card_title"
	active_card_title_params.text = utf8.to_upper(managers.localization.text(HUDTabScreen.CARD_INFO_TITLE_FONT, managers.localization))
	active_card_title_params.color = HUDTabScreen.CARD_INFO_TITLE_COLOR
	local active_card_title = self._active_card_panel.text(self._card_info_panel, self._active_card_panel)
	local active_card_params = {
		name = "active_card_details",
		x = 0,
		y = HUDTabScreen.CARD_Y
	}
	slot16 = self._active_card_panel
	active_card_params.w = self._active_card_panel.w(active_card_title_params)
	active_card_params.h = self._active_card_panel.h(active_card_title_params) - HUDTabScreen.CARD_Y
	slot18 = HUDTabScreen.NO_CARD_ICON
	slot19 = HUDTabScreen.NO_CARD_ICON
	active_card_params.card_image_params = {
		w = HUDTabScreen.CARD_W,
		h = tweak_data.gui.icon_h(self._active_card_panel, tweak_data.gui) / tweak_data.gui.icon_w(tweak_data.gui, tweak_data.gui) * HUDTabScreen.CARD_W
	}
	slot18 = active_card_params
	self._active_card = HUDCardDetails.new(tweak_data.gui.icon_h(self._active_card_panel, tweak_data.gui) / tweak_data.gui.icon_w(tweak_data.gui, tweak_data.gui) * HUDTabScreen.CARD_W, HUDCardDetails, self._active_card_panel)

	return 
end
function HUDTabScreen:_create_profile_info()
	local profile_info_panel_params = {
		halign = "left",
		name = "profile_info_panel",
		visible = false,
		valign = "bottom"
	}
	slot4 = self._object
	profile_info_panel_params.y = self._object.h(slot3) - HUDTabScreen.PROFILE_INFO_BOTTOM_OFFSET - HUDTabScreen.PROFILE_INFO_H
	profile_info_panel_params.w = HUDTabScreen.PROFILE_INFO_W
	profile_info_panel_params.h = HUDTabScreen.PROFILE_INFO_H
	slot5 = profile_info_panel_params
	self._profile_info_panel = self._object.panel(HUDTabScreen.PROFILE_INFO_H, self._object)
	local profile_name_params = {
		name = "profile_name",
		h = 32,
		vertical = "bottom",
		align = "left",
		text = "",
		y = 0,
		x = 0
	}
	slot5 = self._profile_info_panel
	profile_name_params.w = self._profile_info_panel.w(self._object)
	slot7 = HUDTabScreen.PROFILE_NAME_FONT_SIZE
	profile_name_params.font = tweak_data.gui.get_font_path(self._object, tweak_data.gui, HUDTabScreen.PROFILE_NAME_FONT)
	profile_name_params.font_size = HUDTabScreen.PROFILE_NAME_FONT_SIZE
	local profile_name = self._profile_info_panel.text(self._object, self._profile_info_panel)
	local details_panel_params = {
		is_root_panel = true,
		name = "profile_details_panel",
		y = 64
	}
	slot7 = self._profile_info_panel
	details_panel_params.h = self._profile_info_panel.h(profile_name_params) - 64
	slot9 = details_panel_params
	local profile_details_panel = RaidGUIPanel.new(profile_name_params, RaidGUIPanel, self._profile_info_panel)
	local class_info_icon_params = {
		name = "class_icon",
		w = 96,
		icon = "player_panel_class_assault"
	}
	slot9 = profile_details_panel
	class_info_icon_params.h = profile_details_panel.h(self._profile_info_panel)
	class_info_icon_params.icon_color = Color.white
	slot10 = "player_panel_class_assault"
	class_info_icon_params.icon_h = tweak_data.gui.icon_h(self._profile_info_panel, tweak_data.gui)
	class_info_icon_params.top_offset_y = (64 - tweak_data.gui.icon_h(self._profile_info_panel, tweak_data.gui)) / 2
	slot12 = "skill_class_assault_name"
	class_info_icon_params.text = utf8.to_upper(managers.localization.text("player_panel_class_assault", managers.localization))
	class_info_icon_params.text_size = tweak_data.gui.font_sizes.size_24
	class_info_icon_params.color = tweak_data.gui.colors.raid_grey
	self._class_icon = profile_details_panel.info_icon(self._profile_info_panel, profile_details_panel)
	local placeholder_nationality = "british"
	local nationality_info_icon_params = {
		name = "nationality_icon",
		w = 96
	}
	slot11 = profile_details_panel
	nationality_info_icon_params.h = profile_details_panel.h(class_info_icon_params)
	nationality_info_icon_params.icon = "ico_flag_" .. placeholder_nationality
	nationality_info_icon_params.icon_color = Color.white
	nationality_info_icon_params.icon_h = tweak_data.gui.icon_h(placeholder_nationality, tweak_data.gui)
	slot14 = "nationality_" .. placeholder_nationality
	nationality_info_icon_params.text = utf8.to_upper(managers.localization.text("ico_flag_" .. placeholder_nationality, managers.localization))
	nationality_info_icon_params.text_size = tweak_data.gui.font_sizes.size_24
	nationality_info_icon_params.color = tweak_data.gui.colors.raid_grey
	slot12 = nationality_info_icon_params
	self._nationality_icon = profile_details_panel.info_icon(placeholder_nationality, profile_details_panel)
	slot14 = profile_details_panel
	slot12 = profile_details_panel.w(managers.localization) / 2

	self._nationality_icon.set_center_x(placeholder_nationality, self._nationality_icon)

	local level_info_icon_params = {
		name = "level_text",
		w = 96,
		title = "6",
		title_h = 64,
		y = 7
	}
	slot12 = profile_details_panel
	level_info_icon_params.h = profile_details_panel.h(self._nationality_icon) - 7
	level_info_icon_params.title_size = HUDTabScreen.PROFILE_LEVEL_FONT_SIZE
	level_info_icon_params.title_color = tweak_data.gui.colors.raid_white
	slot15 = "hud_level"
	level_info_icon_params.text = utf8.to_upper(managers.localization.text(managers.localization, managers.localization))
	level_info_icon_params.text_size = tweak_data.gui.font_sizes.size_24
	level_info_icon_params.text_color = tweak_data.gui.colors.raid_grey
	slot13 = level_info_icon_params
	self._level_text = profile_details_panel.info_icon(self._nationality_icon, profile_details_panel)
	slot13 = 320

	self._level_text.set_center_x(self._nationality_icon, self._level_text)

	local class_icon_params = {
		name = "class_icon",
		visible = false,
		texture = tweak_data.gui.icons.player_panel_class_assault.texture,
		texture_rect = tweak_data.gui.icons.player_panel_class_assault.texture_rect
	}
	slot14 = class_icon_params
	local class_icon = self._profile_info_panel.bitmap(self._level_text, self._profile_info_panel)
	slot17 = self._profile_info_panel

	class_icon.set_bottom(self._profile_info_panel, class_icon)

	local initial_nationality_icon = "player_panel_nationality_british"
	local nationality_icon_params = {
		name = "nationality_icon",
		visible = false,
		texture = tweak_data.gui.icons[initial_nationality_icon].texture,
		texture_rect = tweak_data.gui.icons[initial_nationality_icon].texture_rect
	}
	slot17 = nationality_icon_params
	local nationality_icon = self._profile_info_panel.bitmap(self._profile_info_panel.h(slot16) + 3, self._profile_info_panel)
	slot20 = self._profile_info_panel
	slot18 = self._profile_info_panel.h(slot19) + 3

	nationality_icon.set_bottom(self._profile_info_panel, nationality_icon)

	slot20 = self._profile_info_panel
	slot18 = self._profile_info_panel.w(slot19) / 2 + 3

	nationality_icon.set_center_x(self._profile_info_panel, nationality_icon)

	local level_text_params = {
		vertical = "bottom",
		name = "level_text",
		h = 40,
		w = 40,
		align = "center",
		text = "6",
		visible = false
	}
	slot20 = HUDTabScreen.PROFILE_LEVEL_FONT_SIZE
	level_text_params.font = tweak_data.gui.get_font_path(nationality_icon, tweak_data.gui, HUDTabScreen.PROFILE_NAME_FONT)
	level_text_params.font_size = HUDTabScreen.PROFILE_LEVEL_FONT_SIZE
	slot19 = level_text_params
	local level_text = self._profile_info_panel.text(nationality_icon, self._profile_info_panel)
	slot22 = self._profile_info_panel
	slot20 = self._profile_info_panel.h(slot21) - 3

	level_text.set_bottom(self._profile_info_panel, level_text)

	slot22 = self._profile_info_panel
	slot20 = self._profile_info_panel.w(slot21) - HUDTabScreen.PROFILE_LEVEL_RIGHT_OFFSET

	level_text.set_center_x(self._profile_info_panel, level_text)

	return 
end
function HUDTabScreen:_create_weapon_challenge_info()
	slot4 = self._object
	self._weapon_challenge_info = HUDTabWeaponChallenge.new(slot2, HUDTabWeaponChallenge)
	slot4 = 926

	self._weapon_challenge_info.set_bottom(slot2, self._weapon_challenge_info)

	return 
end
function HUDTabScreen:_create_timer()
	local timer_panel_params = {
		halign = "right",
		name = "timer_panel",
		valign = "top",
		h = HUDTabScreen.TIMER_H
	}
	slot5 = timer_panel_params
	self._timer_panel = self._object.panel(slot3, self._object)
	slot7 = self._object

	self._timer_panel.set_right(slot3, self._object.w(slot6))

	local timer_params = {
		name = "timer",
		vertical = "top",
		align = "right",
		text = "00:00",
		y = HUDTabScreen.TIMER_Y,
		w = HUDTabScreen.TIMER_W,
		h = HUDTabScreen.TIMER_H,
		font = tweak_data.gui.get_font_path(self._timer_panel, tweak_data.gui, HUDTabScreen.TIMER_FONT),
		font_size = HUDTabScreen.TIMER_FONT_SIZE,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot6 = timer_params
	self._timer = self._timer_panel.text(self._timer_panel, self._timer_panel)
	slot5 = self._timer
	slot8 = self._timer_panel

	self._timer.set_right(self._timer_panel, self._timer_panel.w(HUDTabScreen.TIMER_FONT_SIZE))

	local timer_icon_params = {
		name = "timer_icon",
		valign = "center",
		halign = "left",
		texture = tweak_data.gui.icons[HUDTabScreen.TIMER_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTabScreen.TIMER_ICON].texture_rect
	}
	slot7 = timer_icon_params
	local timer_icon = self._timer_panel.bitmap(HUDTabScreen.TIMER_ICON, self._timer_panel)
	slot10 = self._timer_panel
	slot8 = self._timer_panel.h(slot9) / 2

	timer_icon.set_center_y(self._timer_panel, timer_icon)

	self._last_set_time = 0
	slot8 = 0

	self.set_time(self._timer_panel, self)

	return 
end
function HUDTabScreen:_create_progression_timer()
	local progression_timer_panel_params = {
		halign = "right",
		name = "progression_timer_panel",
		h = 64,
		valign = "top"
	}
	slot5 = progression_timer_panel_params
	self._progression_timer_panel = self._object.panel(slot3, self._object)
	slot7 = self._timer_panel

	self._progression_timer_panel.set_right(slot3, self._timer_panel.x(slot6))

	local separator_params = {
		w = 2,
		h = 52,
		halign = "right",
		valign = "center",
		color = tweak_data.gui.colors.raid_dark_grey
	}
	slot6 = separator_params
	local separator = self._progression_timer_panel.rect(self._progression_timer_panel, self._progression_timer_panel)
	slot9 = self._progression_timer_panel
	slot7 = self._progression_timer_panel.w(slot8) - 48

	separator.set_center_x(self._progression_timer_panel, separator)

	slot9 = self._progression_timer_panel
	slot7 = self._progression_timer_panel.h(slot8) / 2

	separator.set_center_y(self._progression_timer_panel, separator)

	local content_panel_params = {
		halign = "left",
		name = "progression_timer_content_panel",
		x = 30,
		valign = "center"
	}
	slot8 = content_panel_params
	self._progression_timer_content_panel = self._progression_timer_panel.panel(separator, self._progression_timer_panel)
	local progression_timer_icon_params = {
		name = "progression_timer_icon",
		valign = "center",
		halign = "left",
		texture = tweak_data.gui.icons.missions_raids_category_menu.texture,
		texture_rect = tweak_data.gui.icons.missions_raids_category_menu.texture_rect,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot9 = progression_timer_icon_params
	local progression_timer_icon = self._progression_timer_content_panel.bitmap(self._progression_timer_panel, self._progression_timer_content_panel)

	progression_timer_icon.set_center_y(self._progression_timer_content_panel, progression_timer_icon)

	slot9 = managers.progression
	local is_final_unlock_cycle = managers.progression.at_final_unlock_cycle(self._progression_timer_content_panel)
	local timer_title_params = {
		name = "progression_timer_title",
		vertical = "center",
		h = 32,
		halign = "left",
		x = 70
	}
	slot13 = tweak_data.gui.font_sizes.small
	timer_title_params.font = tweak_data.gui.get_font_path(self._progression_timer_content_panel.h(slot11) / 2, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	timer_title_params.font_size = tweak_data.gui.font_sizes.small
	timer_title_params.color = tweak_data.gui.colors.raid_dirty_white
	timer_title_params.text = utf8.to_upper(managers.localization.text(self._progression_timer_content_panel, managers.localization))
	local timer_title = self._progression_timer_content_panel.text(slot10, self._progression_timer_content_panel)
	local timer_description_params = {
		name = "progression_timer_description",
		vertical = "center",
		h = 32,
		halign = "left",
		x = 70
	}
	slot15 = tweak_data.gui.font_sizes.size_20
	timer_description_params.font = tweak_data.gui.get_font_path(timer_title_params, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	timer_description_params.font_size = tweak_data.gui.font_sizes.size_20
	timer_description_params.color = tweak_data.gui.colors.raid_grey_effects
	timer_description_params.text = utf8.to_upper(managers.localization.text((is_final_unlock_cycle and "raid_final_raids_in_title") or "raid_next_raid_in_title", managers.localization))
	slot14 = timer_description_params
	local timer_description = self._progression_timer_content_panel.text(self._progression_timer_content_panel, self._progression_timer_content_panel)
	slot17 = self._progression_timer_content_panel

	timer_description.set_bottom(self._progression_timer_content_panel, self._progression_timer_content_panel.h((is_final_unlock_cycle and "raid_final_raids_in_description") or "raid_next_raid_in_description"))

	local timer_params = {
		name = "progression_timer_timer",
		vertical = "center",
		h = 32,
		text = "",
		horizontal = "right",
		halign = "right"
	}
	slot17 = tweak_data.gui.font_sizes.small
	timer_params.font = tweak_data.gui.get_font_path(timer_description, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	timer_params.font_size = tweak_data.gui.font_sizes.small
	timer_params.color = tweak_data.gui.colors.raid_dirty_white
	slot16 = timer_params
	local timer = self._progression_timer_content_panel.text(timer_description, self._progression_timer_content_panel)

	return 
end
function HUDTabScreen:_create_mission_info()
	local mission_info_panel_params = {
		name = "mission_info_panel",
		y = HUDTabScreen.MISSION_INFO_Y,
		w = HUDTabScreen.MISSION_INFO_W,
		h = HUDTabScreen.MISSION_INFO_H
	}
	slot5 = mission_info_panel_params
	self._mission_info_panel = self._object.panel(slot3, self._object)
	local temp_mission = "clear_skies"
	slot6 = temp_mission
	local temp_mission_icon = tweak_data.operations.mission_data(self._object, tweak_data.operations).icon_menu
	local temp_mission_name = tweak_data.operations.mission_data(tweak_data.operations, tweak_data.operations).name_id
	local mission_icon_params = {
		name = "mission_icon",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[temp_mission_icon].texture,
		texture_rect = tweak_data.gui.icons[temp_mission_icon].texture_rect
	}
	slot9 = mission_icon_params
	local mission_icon = self._mission_info_panel.bitmap(temp_mission, self._mission_info_panel)
	slot12 = self._mission_info_panel
	slot10 = self._mission_info_panel.h(slot11) / 2

	mission_icon.set_center_y(self._mission_info_panel, mission_icon)

	local mission_name_params = {
		name = "mission_name",
		vertical = "center",
		align = "left",
		x = HUDTabScreen.MISSION_INFO_TEXT_X,
		y = HUDTabScreen.MISSION_INFO_TEXT_Y
	}
	slot10 = self._mission_info_panel
	mission_name_params.w = self._mission_info_panel.w(mission_icon) - HUDTabScreen.MISSION_INFO_TEXT_X
	slot10 = self._mission_info_panel
	mission_name_params.h = self._mission_info_panel.h(HUDTabScreen.MISSION_INFO_TEXT_X)
	slot12 = HUDTabScreen.MISSION_INFO_TEXT_FONT_SIZE
	mission_name_params.font = tweak_data.gui.get_font_path(HUDTabScreen.MISSION_INFO_TEXT_X, tweak_data.gui, HUDTabScreen.MISSION_INFO_TEXT_FONT)
	mission_name_params.font_size = HUDTabScreen.MISSION_INFO_TEXT_FONT_SIZE
	mission_name_params.color = HUDTabScreen.MISSION_INFO_TEXT_COLOR
	slot13 = temp_mission_name
	mission_name_params.text = utf8.to_upper(managers.localization.text(HUDTabScreen.MISSION_INFO_TEXT_FONT, managers.localization))
	local mission_name_text = self._mission_info_panel.text(HUDTabScreen.MISSION_INFO_TEXT_X, self._mission_info_panel)
	local mission_name_small_params = {
		name = "mission_name_small",
		h = 32,
		vertical = "center",
		align = "left",
		visible = false,
		y = 0,
		x = HUDTabScreen.MISSION_INFO_TEXT_X
	}
	slot12 = self._mission_info_panel
	mission_name_small_params.w = self._mission_info_panel.w(mission_name_params) - HUDTabScreen.MISSION_INFO_TEXT_X
	slot14 = tweak_data.gui.font_sizes.small
	mission_name_small_params.font = tweak_data.gui.get_font_path(HUDTabScreen.MISSION_INFO_TEXT_X, tweak_data.gui, HUDTabScreen.MISSION_INFO_TEXT_FONT)
	mission_name_small_params.font_size = tweak_data.gui.font_sizes.small
	mission_name_small_params.color = HUDTabScreen.MISSION_INFO_TEXT_COLOR
	slot15 = temp_mission_name
	mission_name_small_params.text = utf8.to_upper(managers.localization.text(HUDTabScreen.MISSION_INFO_TEXT_FONT, managers.localization))
	local mission_name_small_text = self._mission_info_panel.text(HUDTabScreen.MISSION_INFO_TEXT_X, self._mission_info_panel)
	local difficulty_params = {
		name = "mission_difficulty"
	}
	slot14 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(mission_name_small_params)
	self._difficulty_indicator = RaidGuiControlDifficultyStars.new(mission_name_small_params, RaidGuiControlDifficultyStars, self._mission_info_panel)
	slot14 = self._difficulty_indicator
	slot17 = mission_name_small_text

	self._difficulty_indicator.set_x(mission_name_small_params, mission_name_small_text.x(difficulty_params))

	slot15 = 48

	self._difficulty_indicator.set_center_y(mission_name_small_params, self._difficulty_indicator)

	slot15 = Global.game_settings.difficulty
	local current_difficulty = tweak_data.difficulty_to_index(mission_name_small_params, tweak_data)
	slot16 = current_difficulty

	self._difficulty_indicator.set_active_difficulty(tweak_data, self._difficulty_indicator)

	return 
end
function HUDTabScreen:_create_loot_info()
	local loot_panel_params = {
		valing = "bottom",
		name = "loot_info_panel",
		h = 96,
		halign = "right",
		w = 416,
		visible = false,
		layer = tweak_data.gui.TAB_SCREEN_LAYER + 10
	}
	slot5 = loot_panel_params
	self._loot_info_panel = self._object.panel(slot3, self._object)
	slot4 = self._loot_info_panel
	slot7 = self._object

	self._loot_info_panel.set_right(slot3, self._object.w(slot6))

	slot7 = self._object

	self._loot_info_panel.set_bottom(slot3, self._object.h(slot6))

	local dog_tag_panel_params = {
		visible = false,
		name = "dog_tag_panel",
		h = 96,
		halign = "left",
		w = 224,
		valign = "bottom"
	}
	slot6 = dog_tag_panel_params
	self._dog_tag_panel = self._loot_info_panel.panel(self._loot_info_panel, self._loot_info_panel)
	local dog_tag_icon_params = {
		name = "dog_tag_icon",
		texture = tweak_data.gui.icons.rewards_dog_tags_small.texture,
		texture_rect = tweak_data.gui.icons.rewards_dog_tags_small.texture_rect
	}
	slot7 = dog_tag_icon_params
	local dog_tag_icon = self._dog_tag_panel.bitmap(self._loot_info_panel, self._dog_tag_panel)
	slot8 = 48

	dog_tag_icon.set_center_x(self._dog_tag_panel, dog_tag_icon)

	slot10 = self._dog_tag_panel
	slot8 = self._dog_tag_panel.h(slot9) / 2

	dog_tag_icon.set_center_y(self._dog_tag_panel, dog_tag_icon)

	local dog_tag_amount_params = {
		vertical = "center",
		h = 64,
		name = "dog_tag_amount",
		w = 160,
		align = "center",
		text = "0 / 0"
	}
	slot10 = HUDTabScreen.LOOT_INFO_VALUE_FONT_SIZE
	dog_tag_amount_params.font = tweak_data.gui.get_font_path(dog_tag_icon, tweak_data.gui, HUDTabScreen.LOOT_INFO_FONT)
	dog_tag_amount_params.font_size = HUDTabScreen.LOOT_INFO_VALUE_FONT_SIZE
	dog_tag_amount_params.color = HUDTabScreen.LOOT_INFO_VALUE_COLOR
	slot9 = dog_tag_amount_params
	self._dog_tag_amount = self._dog_tag_panel.text(dog_tag_icon, self._dog_tag_panel)
	slot9 = 144

	self._dog_tag_amount.set_center_x(dog_tag_icon, self._dog_tag_amount)

	slot9 = 32

	self._dog_tag_amount.set_center_y(dog_tag_icon, self._dog_tag_amount)

	local dog_tag_title_params = {
		vertical = "center",
		h = 32,
		name = "dog_tag_title",
		w = 128,
		align = "center"
	}
	slot11 = HUDTabScreen.LOOT_INFO_TITLE_FONT_SIZE
	dog_tag_title_params.font = tweak_data.gui.get_font_path(self._dog_tag_amount, tweak_data.gui, HUDTabScreen.LOOT_INFO_FONT)
	dog_tag_title_params.font_size = HUDTabScreen.LOOT_INFO_TITLE_FONT_SIZE
	dog_tag_title_params.color = HUDTabScreen.LOOT_INFO_TITLE_COLOR
	slot12 = "hud_dog_tags"
	dog_tag_title_params.text = utf8.to_upper(managers.localization.text(HUDTabScreen.LOOT_INFO_FONT, managers.localization))
	slot10 = dog_tag_title_params
	local dog_tag_title = self._dog_tag_panel.text(self._dog_tag_amount, self._dog_tag_panel)
	slot11 = 144

	dog_tag_title.set_center_x(self._dog_tag_panel, dog_tag_title)

	slot11 = 64

	dog_tag_title.set_center_y(self._dog_tag_panel, dog_tag_title)

	self._loot_picked_up = 0
	self._loot_total = 0
	slot10 = self

	self._refresh_loot_info(self._dog_tag_panel)

	return 
end
function HUDTabScreen:_create_greed_bar()
	self._greed_bar = HUDTabGreedBar.new(slot2, HUDTabGreedBar, self._loot_info_panel)
	slot3 = self._greed_bar
	slot6 = self._loot_info_panel

	self._greed_bar.set_right(slot2, self._loot_info_panel.w({}))

	return 
end
function HUDTabScreen:on_greed_loot_picked_up(old_progress, new_progress)
	slot7 = new_progress

	self._greed_bar.change_progress(slot4, self._greed_bar, old_progress)

	return 
end
function HUDTabScreen:set_current_greed_amount(amount)
	slot5 = amount

	self._greed_bar.set_current_greed_amount(slot3, self._greed_bar)

	return 
end
function HUDTabScreen:reset_greed_indicator()
	slot3 = self._greed_bar

	self._greed_bar.reset_state(slot2)

	return 
end
function HUDTabScreen:_create_objectives_info(hud)
	slot5 = self._object
	self._objectives = HUDObjectivesTab.new(slot3, HUDObjectivesTab)
	slot8 = self._objectives
	slot5 = self._object.w(slot6) - self._objectives.w(self._object)

	self._objectives.set_x(slot3, self._objectives)

	slot5 = HUDTabScreen.OBJECTIVES_INFO_Y

	self._objectives.set_y(slot3, self._objectives)

	return 
end
function HUDTabScreen:get_objectives_control()
	return self._objectives
end
function HUDTabScreen:_refresh_mission_info()
	local mission_icon, mission_name = nil
	slot6 = "mission_name"
	local control_mission_name = self._mission_info_panel.child(slot4, self._mission_info_panel)
	slot7 = "mission_name_small"
	local control_mission_name_small = self._mission_info_panel.child(self._mission_info_panel, self._mission_info_panel)
	slot7 = managers.raid_job

	if managers.raid_job.is_camp_loaded(self._mission_info_panel) then
		mission_icon = tweak_data.operations.missions.camp.icon_hud
		mission_name = tweak_data.operations.missions.camp.name_id
		slot7 = control_mission_name_small
		slot13 = mission_name

		control_mission_name_small.set_text(slot6, utf8.to_upper(managers.localization.text(slot11, managers.localization)))

		slot8 = Global.game_settings.difficulty
		local current_difficulty = tweak_data.difficulty_to_index(slot6, tweak_data)
		slot9 = current_difficulty

		self._difficulty_indicator.set_active_difficulty(tweak_data, self._difficulty_indicator)

		self._current_difficulty = current_difficulty
		slot9 = false

		control_mission_name.set_visible(tweak_data, control_mission_name)

		slot9 = true

		control_mission_name_small.set_visible(tweak_data, control_mission_name_small)

		slot9 = true

		self._difficulty_indicator.set_visible(tweak_data, self._difficulty_indicator)
	else
		slot7 = managers.raid_job
		local current_job = managers.raid_job.current_job(slot6)

		if not current_job then
			slot9 = false

			self._mission_info_panel.set_visible(slot7, self._mission_info_panel)

			return 
		end

		local job_id = current_job.job_id

		if current_job.job_type ~= OperationsTweakData.JOB_TYPE_RAID and current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
			slot9 = managers.raid_job
		elseif current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
			slot9 = managers.raid_job

			if not managers.raid_job.is_camp_loaded(slot8) then
				local current_event_id = current_job.events_index[current_job.current_event]
				local current_event_data = current_job.events[current_event_id]
				mission_icon = current_event_data.icon_menu
				slot13 = current_job.current_event
				slot15 = #current_job.events_index
				slot20 = current_event_data.name_id
				mission_name = utf8.to_upper(managers.localization.text(slot12, managers.localization)) .. " " .. tostring(slot12) .. "/" .. tostring(current_job.name_id) .. ": " .. utf8.to_upper(managers.localization.text(slot18, managers.localization))
			end
		end

		slot10 = mission_name

		control_mission_name_small.set_text(slot8, control_mission_name_small)

		slot10 = Global.game_settings.difficulty
		local current_difficulty = tweak_data.difficulty_to_index(slot8, tweak_data)
		slot11 = current_difficulty

		self._difficulty_indicator.set_active_difficulty(tweak_data, self._difficulty_indicator)

		self._current_difficulty = current_difficulty
		slot11 = false

		control_mission_name.set_visible(tweak_data, control_mission_name)

		slot11 = true

		control_mission_name_small.set_visible(tweak_data, control_mission_name_small)

		slot11 = true

		self._difficulty_indicator.set_visible(tweak_data, self._difficulty_indicator)
	end

	slot8 = true

	self._mission_info_panel.set_visible(slot6, self._mission_info_panel)

	slot8 = "mission_icon"
	slot8 = tweak_data.gui.icons[mission_icon].texture

	self._mission_info_panel.child(slot6, self._mission_info_panel).set_image(slot6, self._mission_info_panel.child(slot6, self._mission_info_panel))

	slot8 = "mission_icon"
	slot7 = self._mission_info_panel.child(slot6, self._mission_info_panel)
	slot10 = tweak_data.gui.icons[mission_icon].texture_rect

	self._mission_info_panel.child(slot6, self._mission_info_panel).set_texture_rect(slot6, unpack(slot9))

	return 
end
function HUDTabScreen:_refresh_profile_info()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	local profile_name = managers.network.session(slot2).local_peer(slot2).name(slot2)
	slot5 = "profile_name"
	slot4 = self._profile_info_panel.child(managers.network.session(slot2).local_peer(slot2), self._profile_info_panel)
	slot7 = profile_name

	self._profile_info_panel.child(managers.network.session(slot2).local_peer(slot2), self._profile_info_panel).set_text(managers.network.session(slot2).local_peer(slot2), utf8.to_upper(slot6))

	local class = managers.skilltree.get_character_profile_class(managers.network.session(slot2).local_peer(slot2))
	slot9 = class
	slot6 = "player_panel_class_" .. tostring(slot8)

	self._class_icon.set_icon(managers.skilltree, self._class_icon)

	slot7 = {
		color = tweak_data.gui.colors.raid_grey
	}

	self._class_icon.set_text(managers.skilltree, self._class_icon, "skill_class_" .. class .. "_name")

	local nationality = managers.player.get_character_profile_nation(managers.skilltree)
	slot8 = {
		icon_h = tweak_data.gui.icon_h(slot10, tweak_data.gui)
	}
	slot12 = "ico_flag_" .. nationality

	self._nationality_icon.set_icon(managers.player, self._nationality_icon, "ico_flag_" .. nationality)

	slot8 = {
		color = tweak_data.gui.colors.raid_grey
	}

	self._nationality_icon.set_text(managers.player, self._nationality_icon, "nationality_" .. nationality)

	local player_level = managers.experience.current_level(managers.player)
	slot10 = player_level
	slot9 = {
		font_size = HUDTabScreen.PROFILE_LEVEL_FONT_SIZE,
		color = tweak_data.gui.colors.raid_white
	}

	self._level_text.set_title(managers.experience, self._level_text, tostring(tweak_data.gui.colors.raid_grey))

	return 
end
function HUDTabScreen:_refresh_loot_info()
	local current_job = managers.raid_job.current_job(slot2)
	slot5 = true

	self._loot_info_panel.set_visible(managers.raid_job, self._loot_info_panel)

	if not current_job then
		slot5 = false

		self._dog_tag_panel.set_visible(slot3, self._dog_tag_panel)

		return 
	end

	slot4 = managers.lootdrop
	self._loot_picked_up = managers.lootdrop.picked_up_current_leg(slot3)
	slot4 = managers.lootdrop
	self._loot_total = managers.lootdrop.loot_spawned_current_leg(slot3)
	slot7 = self._loot_picked_up
	slot9 = self._loot_total
	slot5 = tostring(slot6) .. " / " .. tostring(slot8)

	self._dog_tag_amount.set_text(slot3, self._dog_tag_amount)

	if self._shown == true then
		slot5 = true

		self._dog_tag_panel.set_visible(slot3, self._dog_tag_panel)
	end

	return 
end
function HUDTabScreen:set_loot_picked_up(amount)
	self._loot_picked_up = amount
	slot4 = self

	self._refresh_loot_info(slot3)

	return 
end
function HUDTabScreen:set_loot_total(amount)
	self._loot_total = amount
	slot4 = self

	self._refresh_loot_info(slot3)

	return 
end
function HUDTabScreen:set_time(time)

	-- Decompilation error in this vicinity:
	slot4 = time

	if math.floor(slot3) < self._last_set_time then
		return 
	end

	self._last_set_time = time
	slot4 = time
	time = math.floor(slot3)
	local hours = math.floor(slot3)
	time = time - hours * 3600
	local minutes = math.floor(time / 3600)
	time = time - minutes * 60
	slot6 = time
	local seconds = math.round(time / 60)
	local text = text .. string.format(slot8, "%02d") .. ":" .. string.format(minutes, "%02d")
	slot10 = text

	self._timer.set_text(":", self._timer)

	slot9 = self._timer
	local _, _, w, _ = self._timer.text_rect(":")
	slot18 = "timer_icon"
	slot17 = self._timer_panel.child(slot16, self._timer_panel)
	slot15 = self._timer_panel.child(slot16, self._timer_panel).w(slot16)
	slot14 = w + HUDTabScreen.TIMER_ICON_TEXT_DISTANCE + slot15

	self._timer_panel.set_w(seconds, self._timer_panel)

	slot13 = self._timer_panel
	slot16 = self._object

	self._timer_panel.set_right(seconds, self._object.w(slot15))

	slot14 = w

	self._timer.set_w(seconds, self._timer)

	slot13 = self._timer
	slot16 = self._timer_panel

	self._timer.set_right(seconds, self._timer_panel.w(slot15))

	return 
end
function HUDTabScreen:_refresh_card_info()
	slot3 = managers.challenge_cards
	local active_card = managers.challenge_cards.get_active_card(slot2)

	if not active_card then
		slot5 = true

		self._empty_card_panel.set_visible(slot3, self._empty_card_panel)

		slot5 = false

		self._active_card_panel.set_visible(slot3, self._active_card_panel)
	else
		slot5 = false

		self._empty_card_panel.set_visible(slot3, self._empty_card_panel)

		slot5 = true

		self._active_card_panel.set_visible(slot3, self._active_card_panel)

		slot5 = active_card

		self._active_card.set_card(slot3, self._active_card)

		slot5 = "active_card_title"
		local active_card_title = self._active_card_panel.child(slot3, self._active_card_panel)

		if active_card.status == ChallengeCardsManager.CARD_STATUS_FAILED then
			slot5 = active_card_title
			slot11 = "hud_active_challenge_card_failed_title"

			active_card_title.set_text(slot4, utf8.to_upper(managers.localization.text(slot9, managers.localization)))

			slot6 = HUDTabScreen.CARD_INFO_FAILED_TITLE_COLOR

			active_card_title.set_color(slot4, active_card_title)
		else
			slot5 = active_card_title
			slot11 = "hud_active_challenge_card_title"

			active_card_title.set_text(slot4, utf8.to_upper(managers.localization.text(slot9, managers.localization)))

			slot6 = HUDTabScreen.CARD_INFO_TITLE_COLOR

			active_card_title.set_color(slot4, active_card_title)
		end
	end

	return 
end
function HUDTabScreen:_refresh_weapon_challenge_info()
	slot3 = managers.player

	if not managers.player.player_unit(slot2) then
		slot3 = self._weapon_challenge_info

		self._weapon_challenge_info.hide(slot2)

		slot4 = true

		self._profile_info_panel.set_visible(slot2, self._profile_info_panel)

		return 
	end

	slot3 = managers.player
	slot3 = managers.player.player_unit(slot2)
	slot3 = managers.player.player_unit(slot2).inventory(slot2)
	local equipped_weapon_slot = managers.player.player_unit(slot2).inventory(slot2).equipped_selection(slot2)

	if equipped_weapon_slot == PlayerInventory.SLOT_1 or equipped_weapon_slot == PlayerInventory.SLOT_2 then
		slot4 = managers.player
		slot4 = managers.player.player_unit(slot3)
		slot4 = managers.player.player_unit(slot3).inventory(slot3)
		slot4 = managers.player.player_unit(slot3).inventory(slot3).equipped_unit(slot3)
		local equipped_weapon = managers.player.player_unit(slot3).inventory(slot3).equipped_unit(slot3).base(slot3).get_name_id(slot3)
		slot6 = equipped_weapon
		self._active_weapon_challenges = managers.weapon_skills.get_active_weapon_challenges_for_weapon(managers.player.player_unit(slot3).inventory(slot3).equipped_unit(slot3).base(slot3), managers.weapon_skills)

		if self._active_weapon_challenges then
			self._weapon_challenge_info.set_challenges(slot4, self._weapon_challenge_info)

			slot7 = Application
			self._currently_displayed_weapon_challenge = math.floor(slot4) % #self._active_weapon_challenges
			slot9 = Application
			slot7 = Application.time(slot8) / HUDTabScreen.NEXT_CHALLENGE_DELAY
			local time_until_next_challenge = HUDTabScreen.NEXT_CHALLENGE_DELAY - Application.time(Application.time(self._active_weapon_challenges) / HUDTabScreen.NEXT_CHALLENGE_DELAY) - math.floor(Application) * HUDTabScreen.NEXT_CHALLENGE_DELAY
			slot8 = time_until_next_challenge

			self.show_next_weapon_challenge(math.floor(Application) * HUDTabScreen.NEXT_CHALLENGE_DELAY, self, true)

			slot6 = self._weapon_challenge_info

			self._weapon_challenge_info.show(math.floor(Application) * HUDTabScreen.NEXT_CHALLENGE_DELAY)

			slot7 = false

			self._profile_info_panel.set_visible(math.floor(Application) * HUDTabScreen.NEXT_CHALLENGE_DELAY, self._profile_info_panel)

			return 
		end
	end

	slot4 = self._weapon_challenge_info

	self._weapon_challenge_info.hide(slot3)

	slot5 = true

	self._profile_info_panel.set_visible(slot3, self._profile_info_panel)

	return 
end
function HUDTabScreen:show_next_weapon_challenge(dont_animate, next_delay)
	self._currently_displayed_weapon_challenge = self._currently_displayed_weapon_challenge % #self._active_weapon_challenges + 1
	slot7 = not dont_animate

	self._weapon_challenge_info.set_challenge(#self._active_weapon_challenges, self._weapon_challenge_info, self._currently_displayed_weapon_challenge)

	if 1 < #self._active_weapon_challenges then
		slot11 = nil

		managers.queued_tasks.queue(slot4, managers.queued_tasks, HUDTabScreen.NEXT_CHALLENGE_QUEUE_ID, self.show_next_weapon_challenge, self, nil, next_delay or HUDTabScreen.NEXT_CHALLENGE_DELAY)
	end

	return 
end
function HUDTabScreen:show()
	slot3 = managers.progression

	if not managers.progression.mission_progression_completed(slot2) then
		slot3 = managers.raid_job
		slot1 = managers.raid_job.played_tutorial(slot2)
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	self._progression_timer_shown = slot1
	slot4 = self._progression_timer_shown

	self._progression_timer_panel.set_visible(slot2, self._progression_timer_panel)

	if self._progression_timer_shown and not self._animating_cycle_completed then
		slot3 = self

		self._layout_progression(slot2)
	end

	slot4 = "tab"
	slot9 = "update"

	managers.hud.add_updator(slot2, managers.hud, callback(slot6, self, self))

	self._shown = true
	slot3 = self

	self._refresh_profile_info(slot2)

	slot3 = self

	self._refresh_mission_info(slot2)

	slot3 = self

	self._refresh_loot_info(slot2)

	slot3 = self

	self._refresh_card_info(slot2)

	slot3 = self

	self._refresh_weapon_challenge_info(slot2)

	local current_level = self._get_current_player_level(slot2)
	slot4 = self

	if self._current_level_has_map(self) then
		slot4 = self._map

		self._map.show(slot3)
	end

	slot5 = true

	self._background.set_visible(slot3, self._background)

	slot5 = true

	self._object.set_visible(slot3, self._object)

	if self._grid_panel then
		slot5 = true

		self._grid_panel.set_visible(slot3, self._grid_panel)
	end

	return 
end
function HUDTabScreen:_layout_progression()
	local is_final_unlock_cycle = managers.progression.at_final_unlock_cycle(slot2)
	local cycle_completed = managers.progression.have_pending_missions_to_unlock(managers.progression)
	local progression_completion_pending = managers.progression.mission_progression_completion_pending(managers.progression)
	slot7 = "progression_timer_timer"
	local timer_control = self._progression_timer_content_panel.child(managers.progression, self._progression_timer_content_panel)
	local title_color = tweak_data.gui.colors.raid_dirty_white

	if not cycle_completed and not progression_completion_pending then
		slot8 = self

		self._set_progress_timer_value(slot7)

		slot9 = true

		timer_control.set_visible(slot7, timer_control)
	else
		slot9 = 0

		timer_control.set_w(slot7, timer_control)

		slot9 = false

		timer_control.set_visible(slot7, timer_control)

		title_color = HUDTabScreen.MISSION_INFO_TEXT_COLOR
	end

	local title_text = "raid_next_raid_in_title"
	local description_text = "raid_next_raid_in_description"
	slot11 = "progression_timer_title"
	local timer_title = self._progression_timer_content_panel.child(slot9, self._progression_timer_content_panel)
	slot12 = "progression_timer_description"
	local timer_description = self._progression_timer_content_panel.child(self._progression_timer_content_panel, self._progression_timer_content_panel)

	if is_final_unlock_cycle then
		if progression_completion_pending then
			title_text = "raid_final_unlocked_title"
			description_text = "raid_next_unlocked_description"
		else
			title_text = "raid_final_raids_in_title"
			description_text = "raid_final_raids_in_description"
		end
	elseif cycle_completed then
		title_text = "raid_next_unlocked_title"
		description_text = "raid_next_unlocked_description"
	end

	slot12 = timer_title
	slot18 = title_text

	timer_title.set_text(slot11, utf8.to_upper(managers.localization.text(slot16, managers.localization)))

	slot13 = title_color

	timer_title.set_color(slot11, timer_title)

	slot12 = timer_title
	local _, _, w, _ = timer_title.text_rect(slot11)
	slot17 = w

	timer_title.set_w(managers.localization.text, timer_title)

	slot16 = timer_description

	timer_description.set_text(managers.localization.text, utf8.to_upper(managers.localization.text(slot20, managers.localization)))

	slot16 = timer_description
	local _, _, w, _ = timer_description.text_rect(managers.localization.text)
	slot21 = w

	timer_description.set_w(managers.localization.text, timer_description)

	slot24 = timer_control
	slot21 = timer_title.w(description_text) + timer_control.w(timer_title) + 64
	slot24 = timer_description
	local content_panel_w = timer_title.x(managers.localization.text) + math.max(timer_title, timer_description.w(timer_title))
	slot22 = content_panel_w

	self._progression_timer_content_panel.set_w(timer_title, self._progression_timer_content_panel)

	slot24 = self._progression_timer_content_panel
	slot22 = self._progression_timer_content_panel.w(timer_title) + 126

	self._progression_timer_panel.set_w(timer_title, self._progression_timer_panel)

	if is_final_unlock_cycle or cycle_completed then
		slot21 = self._progression_timer_panel
		slot24 = self._timer_panel

		self._progression_timer_panel.set_right(slot20, self._timer_panel.x(slot23))
	end

	return 
end
function HUDTabScreen:_set_progress_timer_value()

	-- Decompilation error in this vicinity:
	slot4 = "progression_timer_timer"
	local timer_control = self._progression_timer_content_panel.child(slot2, self._progression_timer_content_panel)
	slot6 = managers.progression
	local remaining_time = math.floor(managers.progression.time_until_next_unlock(slot5))
	local hours = math.floor(managers.progression.time_until_next_unlock)
	remaining_time = remaining_time - hours * 3600
	local minutes = math.floor(remaining_time / 3600)
	remaining_time = remaining_time - minutes * 60
	slot7 = remaining_time
	local seconds = math.round(remaining_time / 60)
	local text = text .. string.format(slot9, "%02d") .. ":" .. string.format(minutes, "%02d")
	slot11 = text

	timer_control.set_text(":", timer_control)

	slot10 = timer_control
	local _, _, w, _ = timer_control.text_rect(":")
	slot15 = w

	timer_control.set_w(seconds, timer_control)

	slot14 = timer_control
	slot17 = self._progression_timer_content_panel

	timer_control.set_right(seconds, self._progression_timer_content_panel.w(slot16))

	slot14 = self._progression_timer_panel
	slot17 = self._timer_panel

	self._progression_timer_panel.set_right(seconds, self._timer_panel.x(slot16))

	return 
end
function HUDTabScreen:update()
	slot6 = self._background
	slot6 = self._background.parent(slot5)
	slot4 = self._background.parent(slot5).h(slot5) - HUDTabScreen.LOOT_INFO_BOTTOM_OFFSET

	self._loot_info_panel.set_bottom(slot2, self._loot_info_panel)

	if self._progression_timer_shown then
		slot3 = managers.progression

		if not managers.progression.have_pending_missions_to_unlock(slot2) then
			slot3 = self

			self._set_progress_timer_value(slot2)
		end
	end

	return 
end
function HUDTabScreen:hide()
	slot4 = "tab"

	managers.hud.remove_updator(slot2, managers.hud)

	self._shown = false
	slot4 = false

	self._background.set_visible(slot2, self._background)

	slot4 = false

	self._loot_info_panel.set_visible(slot2, self._loot_info_panel)

	slot4 = false

	self._object.set_visible(slot2, self._object)

	slot3 = self._map

	self._map.hide(slot2)

	slot4 = HUDTabScreen.NEXT_CHALLENGE_QUEUE_ID

	managers.queued_tasks.unqueue(slot2, managers.queued_tasks)

	if self._grid_panel then
		slot4 = false

		self._grid_panel.set_visible(slot2, self._grid_panel)
	end

	return 
end
function HUDTabScreen:refresh_peers()
	slot3 = self._map

	self._map.refresh_peers(slot2)

	return 
end
function HUDTabScreen:add_waypoint(waypoint_data)
	slot5 = waypoint_data

	self._map.add_waypoint(slot3, self._map)

	return 
end
function HUDTabScreen:remove_waypoint(id)
	slot5 = id

	self._map.remove_waypoint(slot3, self._map)

	return 
end
function HUDTabScreen:peer_enter_vehicle(peer_id)
	slot5 = peer_id

	self._map.peer_enter_vehicle(slot3, self._map)

	return 
end
function HUDTabScreen:peer_exit_vehicle(peer_id)
	slot5 = peer_id

	self._map.peer_exit_vehicle(slot3, self._map)

	return 
end
function HUDTabScreen:is_shown()
	slot3 = self._object

	return self._object.visible(slot2)
end
function HUDTabScreen:_current_level_has_map()
	slot3 = self
	local player_world = self._get_current_player_level(slot2)

	if player_world and tweak_data.levels[player_world].map then
		return true
	end

	return false
end
function HUDTabScreen:_get_current_player_level()

	-- Decompilation error in this vicinity:
	slot3 = managers.raid_job
	local current_job = managers.raid_job.current_job(slot2)

	if current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		local current_event_id = current_job.events_index[current_job.current_event]
		local current_event = current_job.events[current_event_id]

		return current_event.level_id
	elseif current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
		return current_job.level_id
	end

	return nil
end
function HUDTabScreen:on_progression_cycle_completed()
	slot3 = self._progression_timer_content_panel

	self._progression_timer_content_panel.stop(slot2)

	slot3 = self._progression_timer_content_panel
	slot8 = "animate_progression_cycle_completed"

	self._progression_timer_content_panel.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDTabScreen:animate_progression_cycle_completed()
	self._animating_cycle_completed = true
	local fade_out_duration = 0.35
	slot4 = self._progression_timer_content_panel
	local t = (1 - self._progression_timer_content_panel.alpha(slot3)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = fade_out_duration
		local current_alpha = Easing.quartic_in(slot5, t, 1, -1)
		slot8 = current_alpha

		self._progression_timer_content_panel.set_alpha(t, self._progression_timer_content_panel)

		slot10 = fade_out_duration
		local current_x = Easing.quartic_in(t, t, 30, -30)
		slot9 = current_x

		self._progression_timer_content_panel.set_x(t, self._progression_timer_content_panel)
	end

	slot6 = 0

	self._progression_timer_content_panel.set_alpha(slot4, self._progression_timer_content_panel)

	slot6 = 0

	self._progression_timer_content_panel.set_x(slot4, self._progression_timer_content_panel)

	slot5 = self

	self._layout_progression(slot4)

	local fade_in_duration = 0.35
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_in_duration
		local current_alpha = Easing.quartic_out(slot6, t, 0, 1)
		slot9 = current_alpha

		self._progression_timer_content_panel.set_alpha(t, self._progression_timer_content_panel)

		slot11 = fade_in_duration
		local current_x = Easing.quartic_out(t, t, 0, 30)
		slot10 = current_x

		self._progression_timer_content_panel.set_x(t, self._progression_timer_content_panel)
	end

	slot7 = 1

	self._progression_timer_content_panel.set_alpha(slot5, self._progression_timer_content_panel)

	slot7 = 30

	self._progression_timer_content_panel.set_x(slot5, self._progression_timer_content_panel)

	self._animating_cycle_completed = false

	return 
end

return 
