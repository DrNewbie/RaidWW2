-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDLoadingScreen = HUDLoadingScreen or class()
HUDLoadingScreen.LOADING_TEXT_DEFAULT_Y = 832
HUDLoadingScreen.LOADING_TEXT_Y = 576
HUDLoadingScreen.LOADING_TEXT_W = 500
HUDLoadingScreen.LOADING_TEXT_H = 64
HUDLoadingScreen.LOADING_TEXT_FONT = tweak_data.gui.fonts.din_compressed
HUDLoadingScreen.LOADING_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.medium
HUDLoadingScreen.LOADING_TEXT_COLOR = tweak_data.gui.colors.raid_grey
HUDLoadingScreen.RAID_INFO_Y = 670
HUDLoadingScreen.RAID_INFO_W = 1184
HUDLoadingScreen.RAID_INFO_H = 264
HUDLoadingScreen.INFO_TITLE_Y = 0
HUDLoadingScreen.INFO_TITLE_H = 64
HUDLoadingScreen.INFO_TITLE_FONT = tweak_data.gui.fonts.din_compressed
HUDLoadingScreen.INFO_TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_56
HUDLoadingScreen.INFO_TITLE_COLOR = tweak_data.gui.colors.raid_red
HUDLoadingScreen.RAID_INFO_TITLE_CENTER_Y = 48
HUDLoadingScreen.RAID_INFO_TEXT_Y = 160
HUDLoadingScreen.RAID_INFO_TEXT_FONT = tweak_data.gui.fonts.lato
HUDLoadingScreen.RAID_INFO_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.medium
slot3 = "878787"
HUDLoadingScreen.RAID_INFO_TEXT_COLOR = Color(slot2)
HUDLoadingScreen.RAID_DIFFICULTY_CENTER_Y = 128
HUDLoadingScreen.RAID_COMPLETED_Y = 653
HUDLoadingScreen.RAID_COMPLETED_H = 328
HUDLoadingScreen.OPERATION_COMPLETED_Y = 245
HUDLoadingScreen.MISSION_COMPLETED_Y = 165
HUDLoadingScreen.MISSION_COMPLETED_H = 160
HUDLoadingScreen.MISSION_COMPLETED_FONT = tweak_data.gui.fonts.din_compressed
HUDLoadingScreen.MISSION_COMPLETED_FONT_SIZE = tweak_data.gui.font_sizes.size_84
HUDLoadingScreen.MISSION_COMPLETED_COLOR_SUCCESS = tweak_data.gui.colors.raid_grey
HUDLoadingScreen.MISSION_COMPLETED_COLOR_FAIL = tweak_data.gui.colors.raid_red
HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT = 10
HUDLoadingScreen.OPERATION_INFO_Y = 576
HUDLoadingScreen.OPERATION_INFO_W = 1184
HUDLoadingScreen.OPERATION_INFO_H = 384
HUDLoadingScreen.OPERATION_EVENT_TITLE_Y = 80
HUDLoadingScreen.OPERATION_EVENT_TITLE_H = 64
HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT = tweak_data.gui.fonts.din_compressed
HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_32
slot3 = "ececec"
HUDLoadingScreen.OPERATION_EVENT_TITLE_COLOR = Color(slot2)
HUDLoadingScreen.OPERATION_DIFFICULTY_CENTER_Y = 192
HUDLoadingScreen.OPERATION_INFO_TEXT_Y = 256
HUDLoadingScreen.OPERATION_INFO_TEXT_FONT = tweak_data.gui.fonts.lato
HUDLoadingScreen.OPERATION_INFO_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.medium
slot3 = "878787"
HUDLoadingScreen.OPERATION_INFO_TEXT_COLOR = Color(slot2)
HUDLoadingScreen.OPERATION_PROGRESS_Y = 288
HUDLoadingScreen.OPERATION_PROGRESS_H = 32
HUDLoadingScreen.OPERATION_PROGRESS_FONT = tweak_data.gui.fonts.din_compressed
HUDLoadingScreen.OPERATION_PROGRESS_FONT_SIZE = tweak_data.gui.font_sizes.medium
HUDLoadingScreen.OPERATION_PROGRESS_COLOR = tweak_data.gui.colors.raid_grey
HUDLoadingScreen.DEFAULT_INFO_W = 1024
HUDLoadingScreen.DEFAULT_INFO_Y = 715
HUDLoadingScreen.DEFAULT_INFO_H = 320
HUDLoadingScreen.TIP_Y = 82
HUDLoadingScreen.TIP_H = 160
HUDLoadingScreen.TIP_TEXT_FONT = tweak_data.gui.fonts.lato
HUDLoadingScreen.TIP_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.medium
slot3 = "878787"
HUDLoadingScreen.TIP_TEXT_COLOR = Color(slot2)
HUDLoadingScreen.LOADING_ICON_PANEL_H = 64
HUDLoadingScreen.LOADING_SCREEN_TIPS = {
	"tip_tactical_reload",
	"tip_weapon_effecienty",
	"tip_switch_to_sidearm",
	"tip_head_shot",
	"tip_help_bleed_out",
	"tip_steelsight",
	"tip_melee_attack",
	"tip_objectives",
	"tip_select_reward",
	"tip_shoot_in_bleed_out"
}
function HUDLoadingScreen:init(hud)
	slot4 = managers.gui_data
	self._workspace = managers.gui_data.create_fullscreen_workspace(slot3)
	slot4 = self._workspace
	self._hud_panel = self._workspace.panel(slot3)
	self._state = "hidden"
	slot5 = {
		valign = "scale",
		name = "black_screen_panel",
		y = 0,
		halign = "scale",
		x = 0,
		layer = 65000,
		w = self._hud_panel.w(slot7),
		h = self._hud_panel.h(slot7)
	}
	slot8 = self._hud_panel
	slot8 = self._hud_panel
	self._panel = self._hud_panel.panel(slot3, self._hud_panel)
	slot5 = {
		name = "loading_screen_black_rect",
		halign = "scale",
		alpha = 0,
		y = 0,
		x = 0,
		valign = "scale",
		w = self._panel.w(slot7),
		h = self._panel.h(slot7),
		color = Color.black
	}
	slot8 = self._panel
	slot8 = self._panel
	self._black = self._panel.rect(slot3, self._panel)
	slot4 = self

	self._create_loading_icon(slot3)

	slot4 = managers.viewport
	slot9 = "on_resolution_changed"
	self._resolution_changed_callback_id = managers.viewport.add_resolution_changed_func(slot3, callback(Color.black, self, self))

	return 
end
function HUDLoadingScreen:_create_loading_icon()
	local saferect_data = managers.gui_data.safe_scaled_size(slot2)
	slot4 = self._panel
	local saferect_y = (self._panel.h(managers.gui_data) - saferect_data.h) / 2
	local loading_icon_panel_params = {
		name = "loading_icon_panel",
		x = 0,
		y = (saferect_y + saferect_data.h) - HUDLoadingScreen.LOADING_ICON_PANEL_H
	}
	slot6 = self._panel
	loading_icon_panel_params.w = self._panel.w(HUDLoadingScreen.LOADING_ICON_PANEL_H)
	loading_icon_panel_params.h = HUDLoadingScreen.LOADING_ICON_PANEL_H
	slot7 = loading_icon_panel_params
	self._loading_icon_panel = self._panel.panel(HUDLoadingScreen.LOADING_ICON_PANEL_H, self._panel)
	slot7 = self._loading_icon_panel
	self._loading_icon = HUDSaveIcon.new(HUDLoadingScreen.LOADING_ICON_PANEL_H, HUDSaveIcon)

	return 
end
function HUDLoadingScreen:setup(data)
	self._data = data

	if self._panel then
		slot4 = self

		self.clean_up(slot3)
	end

	slot5 = {
		name = "loading_Screen_background",
		y = 0,
		alpha = 0,
		x = 0,
		texture = "ui/loading_screens/" .. data.background,
		layer = self._black.layer(data.background) + 1
	}
	slot8 = self._black
	self._bg = self._panel.bitmap(slot3, self._panel)
	local screen_ratio = self._real_aspect_ratio(slot3)
	slot6 = self._bg
	local image_ratio = self._bg.texture_width(self) / self._bg.texture_height(self._bg)

	if screen_ratio < image_ratio then
		slot6 = self._bg
		slot9 = self._hud_panel

		self._bg.set_h(slot5, self._hud_panel.h(slot8))

		slot9 = self._bg
		slot7 = self._bg.h(slot8) * image_ratio

		self._bg.set_w(slot5, self._bg)

		slot7 = self._panel

		if self._panel.w(self._bg) < self._bg.w(slot5) then
			slot10 = self._panel
			slot7 = -(self._bg.w(slot8) - self._panel.w(self._bg)) / 2

			self._bg.set_x(slot5, self._bg)
		end
	else
		slot6 = self._bg
		slot9 = self._hud_panel

		self._bg.set_w(slot5, self._hud_panel.w(slot8))

		slot9 = self._bg
		slot7 = self._bg.w(slot8) / image_ratio

		self._bg.set_h(slot5, self._bg)

		slot7 = self._panel

		if self._panel.h(self._bg) < self._bg.h(slot5) then
			slot10 = self._panel
			slot7 = -(self._bg.h(slot8) - self._panel.h(self._bg)) / 2

			self._bg.set_y(slot5, self._bg)
		end
	end

	local current_job = data.mission

	if current_job and data.success ~= nil then
		if current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
			slot9 = data.success

			self._layout_raid_finished(slot6, self, current_job)
		else
			slot9 = data.success

			self._layout_operation_finished(slot6, self, current_job)
		end
	elseif current_job then
		slot9 = RaidJobManager.CAMP_ID
	elseif current_job then
		if current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
			slot8 = current_job

			self._layout_raid(slot6, self)
		elseif current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
			slot8 = current_job

			self._layout_operation(slot6, self)
		end
	else
		slot7 = self

		self._layout_default(slot6)
	end

	return 
end
function HUDLoadingScreen:_layout_raid(current_job)
	local info_panel_params = {
		alpha = 0,
		name = "info_panel"
	}
	slot5 = self._panel
	info_panel_params.x = self._panel.w(slot4) / 2 - HUDLoadingScreen.RAID_INFO_W / 2
	info_panel_params.y = HUDLoadingScreen.RAID_INFO_Y
	info_panel_params.w = HUDLoadingScreen.RAID_INFO_W
	info_panel_params.h = HUDLoadingScreen.RAID_INFO_H
	slot5 = self._bg
	info_panel_params.layer = self._bg.layer(HUDLoadingScreen.RAID_INFO_W / 2) + 1
	slot6 = info_panel_params
	self._info_panel = self._panel.panel(HUDLoadingScreen.RAID_INFO_W / 2, self._panel)
	local raid_title_panel_params = {
		name = "raid_title_panel",
		h = HUDLoadingScreen.INFO_TITLE_H
	}
	slot6 = self._info_panel
	raid_title_panel_params.layer = self._info_panel.layer(self._panel) + 1
	slot7 = raid_title_panel_params
	local raid_title_panel = self._info_panel.panel(self._panel, self._info_panel)
	slot8 = HUDLoadingScreen.RAID_INFO_TITLE_CENTER_Y

	raid_title_panel.set_center_y(self._info_panel, raid_title_panel)

	local raid_icon_params = {
		name = "raid_icon",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[current_job.icon_menu].texture,
		texture_rect = tweak_data.gui.icons[current_job.icon_menu].texture_rect
	}
	slot9 = raid_icon_params
	local raid_icon = raid_title_panel.bitmap(current_job.icon_menu, raid_title_panel)
	slot12 = raid_title_panel
	slot10 = raid_title_panel.h(slot11) / 2

	raid_icon.set_center_y(raid_title_panel, raid_icon)

	local raid_title_params = {
		name = "raid_title",
		vertical = "center",
		align = "center"
	}
	slot10 = raid_icon
	raid_title_params.x = raid_icon.w(raid_icon) + HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT
	slot10 = raid_title_panel
	raid_title_params.h = raid_title_panel.h(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT)
	slot12 = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	raid_title_params.font = tweak_data.gui.get_font_path(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, tweak_data.gui, HUDLoadingScreen.INFO_TITLE_FONT)
	raid_title_params.font_size = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	raid_title_params.color = HUDLoadingScreen.INFO_TITLE_COLOR
	slot13 = current_job.name_id
	raid_title_params.text = utf8.to_upper(managers.localization.text(HUDLoadingScreen.INFO_TITLE_FONT, managers.localization))
	slot11 = raid_title_params
	local title = raid_title_panel.text(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, raid_title_panel)
	slot11 = title
	local _, _, w, _ = title.text_rect(raid_title_panel)
	slot16 = w

	title.set_w(slot14, title)

	slot16 = title.x(slot17) + title.w(title)

	raid_title_panel.set_w(slot14, raid_title_panel)

	slot18 = self._info_panel
	slot16 = self._info_panel.w(title.w(title)) / 2

	raid_title_panel.set_center_x(slot14, raid_title_panel)

	local difficulty_params = {}
	slot16 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(raid_title_panel)
	slot18 = difficulty_params
	local difficulty_indicator = RaidGuiControlDifficultyStars.new(raid_title_panel, RaidGuiControlDifficultyStars, self._info_panel)
	slot20 = self._info_panel
	slot18 = self._info_panel.w(title) / 2

	difficulty_indicator.set_center_x(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot18 = HUDLoadingScreen.RAID_DIFFICULTY_CENTER_Y

	difficulty_indicator.set_center_y(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot18 = Global.game_settings.difficulty
	local current_difficulty = tweak_data.difficulty_to_index(RaidGuiControlDifficultyStars, tweak_data)
	slot19 = current_difficulty

	difficulty_indicator.set_active_difficulty(tweak_data, difficulty_indicator)

	local raid_description_params = {
		name = "raid_description",
		vertical = "center",
		wrap = true,
		align = "center",
		y = HUDLoadingScreen.RAID_INFO_TEXT_Y
	}
	slot19 = self._info_panel
	raid_description_params.h = self._info_panel.h(difficulty_indicator) - HUDLoadingScreen.RAID_INFO_TEXT_Y
	slot21 = HUDLoadingScreen.RAID_INFO_TEXT_FONT_SIZE
	raid_description_params.font = tweak_data.gui.get_font_path(HUDLoadingScreen.RAID_INFO_TEXT_Y, tweak_data.gui, HUDLoadingScreen.RAID_INFO_TEXT_FONT)
	raid_description_params.font_size = HUDLoadingScreen.RAID_INFO_TEXT_FONT_SIZE
	raid_description_params.color = HUDLoadingScreen.RAID_INFO_TEXT_COLOR
	slot20 = current_job.loading.text
	raid_description_params.text = managers.localization.text(HUDLoadingScreen.RAID_INFO_TEXT_Y, managers.localization)
	slot20 = raid_description_params
	local description = self._info_panel.text(HUDLoadingScreen.RAID_INFO_TEXT_Y, self._info_panel)

	return 
end
function HUDLoadingScreen:_layout_raid_finished(current_job, success)
	local info_panel_params = {
		alpha = 0,
		name = "info_panel"
	}
	slot6 = self._panel
	info_panel_params.x = self._panel.w(slot5) / 2 - HUDLoadingScreen.RAID_INFO_W / 2
	info_panel_params.y = HUDLoadingScreen.RAID_COMPLETED_Y
	info_panel_params.w = HUDLoadingScreen.RAID_INFO_W
	info_panel_params.h = HUDLoadingScreen.RAID_COMPLETED_H
	slot6 = self._bg
	info_panel_params.layer = self._bg.layer(HUDLoadingScreen.RAID_INFO_W / 2) + 1
	slot7 = info_panel_params
	self._info_panel = self._panel.panel(HUDLoadingScreen.RAID_INFO_W / 2, self._panel)
	local raid_title_panel_params = {
		name = "raid_title_panel",
		y = HUDLoadingScreen.INFO_TITLE_Y,
		h = HUDLoadingScreen.INFO_TITLE_H
	}
	slot7 = self._info_panel
	raid_title_panel_params.layer = self._info_panel.layer(self._panel) + 1
	slot8 = raid_title_panel_params
	local raid_title_panel = self._info_panel.panel(self._panel, self._info_panel)
	local raid_icon_params = {
		name = "raid_icon",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[current_job.icon_menu].texture,
		texture_rect = tweak_data.gui.icons[current_job.icon_menu].texture_rect
	}
	slot10 = raid_icon_params
	local raid_icon = raid_title_panel.bitmap(current_job.icon_menu, raid_title_panel)
	slot13 = raid_title_panel
	slot11 = raid_title_panel.h(slot12) / 2

	raid_icon.set_center_y(raid_title_panel, raid_icon)

	local raid_title_params = {
		name = "raid_title",
		vertical = "center",
		align = "center"
	}
	slot11 = raid_icon
	raid_title_params.x = raid_icon.w(raid_icon) + HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT
	slot11 = raid_title_panel
	raid_title_params.h = raid_title_panel.h(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT)
	slot13 = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	raid_title_params.font = tweak_data.gui.get_font_path(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, tweak_data.gui, HUDLoadingScreen.INFO_TITLE_FONT)
	raid_title_params.font_size = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	raid_title_params.color = HUDLoadingScreen.INFO_TITLE_COLOR
	slot14 = current_job.name_id
	raid_title_params.text = utf8.to_upper(managers.localization.text(HUDLoadingScreen.INFO_TITLE_FONT, managers.localization))
	slot12 = raid_title_params
	local title = raid_title_panel.text(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, raid_title_panel)
	slot12 = title
	local _, _, w, _ = title.text_rect(raid_title_panel)
	slot17 = w

	title.set_w(slot15, title)

	slot17 = title.x(slot18) + title.w(title)

	raid_title_panel.set_w(slot15, raid_title_panel)

	slot19 = self._info_panel
	slot17 = self._info_panel.w(title.w(title)) / 2

	raid_title_panel.set_center_x(slot15, raid_title_panel)

	local difficulty_params = {}
	slot17 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(raid_title_panel)
	slot19 = difficulty_params
	local difficulty_indicator = RaidGuiControlDifficultyStars.new(raid_title_panel, RaidGuiControlDifficultyStars, self._info_panel)
	slot21 = self._info_panel
	slot19 = self._info_panel.w(title) / 2

	difficulty_indicator.set_center_x(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot19 = HUDLoadingScreen.RAID_DIFFICULTY_CENTER_Y - 16

	difficulty_indicator.set_center_y(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot19 = Global.game_settings.difficulty
	local current_difficulty = tweak_data.difficulty_to_index(RaidGuiControlDifficultyStars, tweak_data)
	slot20 = current_difficulty

	difficulty_indicator.set_active_difficulty(tweak_data, difficulty_indicator)

	local mission_status_panel_params = {
		name = "mission_status_panel",
		y = HUDLoadingScreen.MISSION_COMPLETED_Y,
		h = HUDLoadingScreen.MISSION_COMPLETED_H
	}
	local mission_status_panel = self._info_panel.panel(difficulty_indicator, self._info_panel)
	slot24 = self._info_panel
	slot22 = self._info_panel.w(slot23) / 2

	mission_status_panel.set_center_x(self._info_panel, mission_status_panel)

	local mission_status_params = {
		wrap = true,
		align = "center",
		vertical = "top",
		name = "mission_status"
	}
	slot24 = HUDLoadingScreen.MISSION_COMPLETED_FONT_SIZE
	mission_status_params.font = tweak_data.gui.get_font_path(mission_status_panel, tweak_data.gui, HUDLoadingScreen.MISSION_COMPLETED_FONT)
	mission_status_params.font_size = HUDLoadingScreen.MISSION_COMPLETED_FONT_SIZE
	mission_status_params.color = (success and HUDLoadingScreen.MISSION_COMPLETED_COLOR_SUCCESS) or HUDLoadingScreen.MISSION_COMPLETED_COLOR_FAIL
	slot25 = (success and "loading_mission_completed") or "loading_mission_failed"
	mission_status_params.text = utf8.to_upper(managers.localization.text(slot23, managers.localization))
	slot23 = mission_status_params
	local mission_status = mission_status_panel.text(mission_status_panel_params, mission_status_panel)

	return 
end
function HUDLoadingScreen:_layout_operation(current_job)
	local info_panel_params = {
		alpha = 0,
		name = "info_panel"
	}
	slot5 = self._panel
	info_panel_params.x = self._panel.w(slot4) / 2 - HUDLoadingScreen.OPERATION_INFO_W / 2
	info_panel_params.y = HUDLoadingScreen.OPERATION_INFO_Y
	info_panel_params.w = HUDLoadingScreen.OPERATION_INFO_W
	info_panel_params.h = HUDLoadingScreen.OPERATION_INFO_H
	slot5 = self._bg
	info_panel_params.layer = self._bg.layer(HUDLoadingScreen.OPERATION_INFO_W / 2) + 1
	slot6 = info_panel_params
	self._info_panel = self._panel.panel(HUDLoadingScreen.OPERATION_INFO_W / 2, self._panel)
	local operation_title_panel_params = {
		name = "raid_title_panel",
		y = HUDLoadingScreen.INFO_TITLE_Y,
		h = HUDLoadingScreen.INFO_TITLE_H
	}
	slot6 = self._info_panel
	operation_title_panel_params.layer = self._info_panel.layer(self._panel) + 1
	slot7 = operation_title_panel_params
	local operation_title_panel = self._info_panel.panel(self._panel, self._info_panel)
	local operation_icon_params = {
		name = "operation_icon",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[current_job.operation_icon].texture,
		texture_rect = tweak_data.gui.icons[current_job.operation_icon].texture_rect
	}
	slot9 = operation_icon_params
	local operation_icon = operation_title_panel.bitmap(current_job.operation_icon, operation_title_panel)
	slot12 = operation_title_panel
	slot10 = operation_title_panel.h(slot11) / 2

	operation_icon.set_center_y(operation_title_panel, operation_icon)

	local operation_title_params = {
		name = "operation_title",
		vertical = "center",
		align = "center"
	}
	slot10 = operation_icon
	operation_title_params.x = operation_icon.w(operation_icon) + HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT
	slot10 = operation_title_panel
	operation_title_params.h = operation_title_panel.h(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT)
	slot12 = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	operation_title_params.font = tweak_data.gui.get_font_path(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, tweak_data.gui, HUDLoadingScreen.INFO_TITLE_FONT)
	operation_title_params.font_size = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	operation_title_params.color = HUDLoadingScreen.INFO_TITLE_COLOR
	slot14 = current_job.current_event
	slot16 = current_job.number_of_events
	slot14 = tostring(slot15)
	slot10 = managers.localization.text(HUDLoadingScreen.INFO_TITLE_FONT, managers.localization) .. " " .. tostring(current_job.operation_name_id) .. "/" .. slot14
	operation_title_params.text = utf8.to_upper(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT)
	slot11 = operation_title_params
	local title = operation_title_panel.text(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, operation_title_panel)
	slot11 = title
	local _, _, w, _ = title.text_rect(operation_title_panel)
	slot16 = w

	title.set_w(slot14, title)

	slot19 = title
	slot16 = title.x(slot17) + title.w(title)

	operation_title_panel.set_w(slot14, operation_title_panel)

	slot18 = self._info_panel
	slot16 = self._info_panel.w(title.w(title)) / 2

	operation_title_panel.set_center_x(slot14, operation_title_panel)

	local event_title_params = {
		name = "current_event_title",
		vertical = "center",
		align = "center",
		y = HUDLoadingScreen.OPERATION_EVENT_TITLE_Y,
		h = HUDLoadingScreen.OPERATION_EVENT_TITLE_H
	}
	slot18 = HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT_SIZE
	event_title_params.font = tweak_data.gui.get_font_path(operation_title_panel, tweak_data.gui, HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT)
	event_title_params.font_size = HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT_SIZE
	event_title_params.color = HUDLoadingScreen.OPERATION_EVENT_TITLE_COLOR
	slot19 = current_job.progress_title_id
	event_title_params.text = utf8.to_upper(managers.localization.text(HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT, managers.localization))
	slot17 = event_title_params
	local title = self._info_panel.text(operation_title_panel, self._info_panel)
	slot17 = title
	local _, _, w, _ = title.text_rect(self._info_panel)
	slot22 = w

	title.set_w(slot20, title)

	slot24 = self._info_panel
	slot22 = self._info_panel.w(slot23) / 2

	title.set_center_x(slot20, title)

	local difficulty_params = {}
	slot22 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(title)
	slot24 = difficulty_params
	local difficulty_indicator = RaidGuiControlDifficultyStars.new(title, RaidGuiControlDifficultyStars, self._info_panel)
	slot26 = self._info_panel
	slot24 = self._info_panel.w(slot25) / 2

	difficulty_indicator.set_center_x(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot24 = HUDLoadingScreen.OPERATION_DIFFICULTY_CENTER_Y

	difficulty_indicator.set_center_y(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot24 = Global.game_settings.difficulty
	local current_difficulty = tweak_data.difficulty_to_index(RaidGuiControlDifficultyStars, tweak_data)
	slot25 = current_difficulty

	difficulty_indicator.set_active_difficulty(tweak_data, difficulty_indicator)

	local event_description_params = {
		name = "raid_description",
		vertical = "top",
		wrap = true,
		align = "center",
		y = HUDLoadingScreen.OPERATION_INFO_TEXT_Y
	}
	slot25 = self._info_panel
	event_description_params.h = self._info_panel.h(difficulty_indicator) - HUDLoadingScreen.OPERATION_INFO_TEXT_Y
	slot27 = HUDLoadingScreen.OPERATION_INFO_TEXT_FONT_SIZE
	event_description_params.font = tweak_data.gui.get_font_path(HUDLoadingScreen.OPERATION_INFO_TEXT_Y, tweak_data.gui, HUDLoadingScreen.OPERATION_INFO_TEXT_FONT)
	event_description_params.font_size = HUDLoadingScreen.OPERATION_INFO_TEXT_FONT_SIZE
	event_description_params.color = HUDLoadingScreen.OPERATION_INFO_TEXT_COLOR
	slot26 = current_job.loading.text
	event_description_params.text = managers.localization.text(HUDLoadingScreen.OPERATION_INFO_TEXT_Y, managers.localization)
	slot26 = event_description_params
	local description = self._info_panel.text(HUDLoadingScreen.OPERATION_INFO_TEXT_Y, self._info_panel)

	return 
end
function HUDLoadingScreen:_layout_operation_finished(current_job, success)
	local info_panel_params = {
		alpha = 0,
		name = "info_panel"
	}
	slot6 = self._panel
	info_panel_params.x = self._panel.w(slot5) / 2 - HUDLoadingScreen.OPERATION_INFO_W / 2
	info_panel_params.y = HUDLoadingScreen.OPERATION_INFO_Y
	info_panel_params.w = HUDLoadingScreen.OPERATION_INFO_W
	info_panel_params.h = HUDLoadingScreen.OPERATION_INFO_H
	slot6 = self._bg
	info_panel_params.layer = self._bg.layer(HUDLoadingScreen.OPERATION_INFO_W / 2) + 1
	self._info_panel = self._panel.panel(HUDLoadingScreen.OPERATION_INFO_W / 2, self._panel)
	slot6 = managers.raid_job
	local current_event = managers.raid_job.current_job(HUDLoadingScreen.OPERATION_INFO_W / 2).current_event
	local operation_tweak_data = tweak_data.operations.missions[managers.raid_job.current_job(info_panel_params).job_id]
	local current_event_tweak_data = operation_tweak_data.events[managers.raid_job.current_job(managers.raid_job).events_index[current_event]]
	local operation_title_panel_params = {
		name = "raid_title_panel",
		y = HUDLoadingScreen.INFO_TITLE_Y,
		h = HUDLoadingScreen.INFO_TITLE_H
	}
	slot10 = self._info_panel
	operation_title_panel_params.layer = self._info_panel.layer(managers.raid_job) + 1
	slot11 = operation_title_panel_params
	local operation_title_panel = self._info_panel.panel(managers.raid_job, self._info_panel)
	local operation_icon_params = {
		name = "operation_icon",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[current_job.icon_menu].texture,
		texture_rect = tweak_data.gui.icons[current_job.icon_menu].texture_rect
	}
	slot13 = operation_icon_params
	local operation_icon = operation_title_panel.bitmap(current_job.icon_menu, operation_title_panel)
	slot16 = operation_title_panel
	slot14 = operation_title_panel.h(slot15) / 2

	operation_icon.set_center_y(operation_title_panel, operation_icon)

	local operation_title_params = {
		name = "operation_title",
		vertical = "center",
		align = "center"
	}
	slot14 = operation_icon
	operation_title_params.x = operation_icon.w(operation_icon) + HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT
	slot14 = operation_title_panel
	operation_title_params.h = operation_title_panel.h(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT)
	slot16 = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	operation_title_params.font = tweak_data.gui.get_font_path(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, tweak_data.gui, HUDLoadingScreen.INFO_TITLE_FONT)
	operation_title_params.font_size = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	operation_title_params.color = HUDLoadingScreen.INFO_TITLE_COLOR
	slot18 = current_event
	slot20 = #operation_tweak_data.events_index_template
	slot18 = tostring(slot19)
	slot14 = managers.localization.text(HUDLoadingScreen.INFO_TITLE_FONT, managers.localization) .. " " .. tostring(operation_tweak_data.name_id) .. "/" .. slot18
	operation_title_params.text = utf8.to_upper(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT)
	slot15 = operation_title_params
	local title = operation_title_panel.text(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, operation_title_panel)
	slot15 = title
	local _, _, w, _ = title.text_rect(operation_title_panel)
	slot20 = w

	title.set_w(slot18, title)

	slot23 = title
	slot20 = title.x(slot21) + title.w(title)

	operation_title_panel.set_w(slot18, operation_title_panel)

	slot22 = self._info_panel
	slot20 = self._info_panel.w(title.w(title)) / 2

	operation_title_panel.set_center_x(slot18, operation_title_panel)

	local event_title_params = {
		name = "current_event_title",
		vertical = "center",
		align = "center",
		y = HUDLoadingScreen.OPERATION_EVENT_TITLE_Y,
		h = HUDLoadingScreen.OPERATION_EVENT_TITLE_H
	}
	slot22 = HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT_SIZE
	event_title_params.font = tweak_data.gui.get_font_path(operation_title_panel, tweak_data.gui, HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT)
	event_title_params.font_size = HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT_SIZE
	event_title_params.color = HUDLoadingScreen.OPERATION_EVENT_TITLE_COLOR
	slot23 = current_event_tweak_data.progress_title_id
	event_title_params.text = utf8.to_upper(managers.localization.text(HUDLoadingScreen.OPERATION_EVENT_TITLE_FONT, managers.localization))
	slot21 = event_title_params
	local title = self._info_panel.text(operation_title_panel, self._info_panel)
	slot21 = title
	local _, _, w, _ = title.text_rect(self._info_panel)
	slot26 = w

	title.set_w(slot24, title)

	slot28 = self._info_panel
	slot26 = self._info_panel.w(slot27) / 2

	title.set_center_x(slot24, title)

	local difficulty_params = {}
	slot26 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(title)
	slot28 = difficulty_params
	local difficulty_indicator = RaidGuiControlDifficultyStars.new(title, RaidGuiControlDifficultyStars, self._info_panel)
	slot30 = self._info_panel
	slot28 = self._info_panel.w(slot29) / 2

	difficulty_indicator.set_center_x(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot28 = HUDLoadingScreen.OPERATION_DIFFICULTY_CENTER_Y

	difficulty_indicator.set_center_y(RaidGuiControlDifficultyStars, difficulty_indicator)

	slot28 = Global.game_settings.difficulty
	local current_difficulty = tweak_data.difficulty_to_index(RaidGuiControlDifficultyStars, tweak_data)
	slot29 = current_difficulty

	difficulty_indicator.set_active_difficulty(tweak_data, difficulty_indicator)

	local mission_status_panel_params = {
		name = "mission_status_panel",
		y = HUDLoadingScreen.OPERATION_COMPLETED_Y,
		h = HUDLoadingScreen.MISSION_COMPLETED_H
	}
	local mission_status_panel = self._info_panel.panel(difficulty_indicator, self._info_panel)
	slot33 = self._info_panel
	slot31 = self._info_panel.w(slot32) / 2

	mission_status_panel.set_center_x(self._info_panel, mission_status_panel)

	local mission_status_params = {
		wrap = true,
		align = "center",
		vertical = "top",
		name = "mission_status"
	}
	slot33 = HUDLoadingScreen.MISSION_COMPLETED_FONT_SIZE
	mission_status_params.font = tweak_data.gui.get_font_path(mission_status_panel, tweak_data.gui, HUDLoadingScreen.MISSION_COMPLETED_FONT)
	mission_status_params.font_size = HUDLoadingScreen.MISSION_COMPLETED_FONT_SIZE
	mission_status_params.color = (success and HUDLoadingScreen.MISSION_COMPLETED_COLOR_SUCCESS) or HUDLoadingScreen.MISSION_COMPLETED_COLOR_FAIL
	slot34 = (success and "loading_mission_completed") or "loading_mission_failed"
	mission_status_params.text = utf8.to_upper(managers.localization.text(slot32, managers.localization))
	slot32 = mission_status_params
	local mission_status = mission_status_panel.text(mission_status_panel_params, mission_status_panel)

	return 
end
function HUDLoadingScreen:_layout_camp()
	local current_job = tweak_data.operations.missions.camp
	local info_panel_params = {
		alpha = 0,
		name = "info_panel"
	}
	slot5 = self._panel
	info_panel_params.x = self._panel.w(slot4) / 2 - HUDLoadingScreen.DEFAULT_INFO_W / 2
	info_panel_params.y = HUDLoadingScreen.DEFAULT_INFO_Y
	info_panel_params.w = HUDLoadingScreen.DEFAULT_INFO_W
	info_panel_params.h = HUDLoadingScreen.DEFAULT_INFO_H
	slot5 = self._bg
	info_panel_params.layer = self._bg.layer(HUDLoadingScreen.DEFAULT_INFO_W / 2) + 1
	slot6 = info_panel_params
	self._info_panel = self._panel.panel(HUDLoadingScreen.DEFAULT_INFO_W / 2, self._panel)
	local title_panel_params = {
		name = "raid_title_panel",
		y = HUDLoadingScreen.INFO_TITLE_Y,
		h = HUDLoadingScreen.INFO_TITLE_H
	}
	slot6 = self._info_panel
	title_panel_params.layer = self._info_panel.layer(self._panel) + 1
	slot7 = title_panel_params
	local title_panel = self._info_panel.panel(self._panel, self._info_panel)
	local icon_params = {
		name = "icon",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[current_job.icon_hud].texture,
		texture_rect = tweak_data.gui.icons[current_job.icon_hud].texture_rect
	}
	slot9 = icon_params
	local icon = title_panel.bitmap(current_job.icon_hud, title_panel)
	slot12 = title_panel
	slot10 = title_panel.h(slot11) / 2

	icon.set_center_y(title_panel, icon)

	local title_params = {
		name = "title",
		vertical = "center",
		align = "center"
	}
	slot10 = icon
	title_params.x = icon.w(icon) + HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT
	slot10 = title_panel
	title_params.h = title_panel.h(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT)
	slot12 = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	title_params.font = tweak_data.gui.get_font_path(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, tweak_data.gui, HUDLoadingScreen.INFO_TITLE_FONT)
	title_params.font_size = HUDLoadingScreen.INFO_TITLE_FONT_SIZE
	title_params.color = HUDLoadingScreen.INFO_TITLE_COLOR
	slot13 = current_job.name_id
	title_params.text = utf8.to_upper(managers.localization.text(HUDLoadingScreen.INFO_TITLE_FONT, managers.localization))
	slot11 = title_params
	local title = title_panel.text(HUDLoadingScreen.MISSION_ICON_PADDING_RIGHT, title_panel)
	slot11 = title
	local _, _, w, _ = title.text_rect(title_panel)
	slot16 = w

	title.set_w(slot14, title)

	slot16 = title.x(slot17) + title.w(title)

	title_panel.set_w(slot14, title_panel)

	slot18 = self._info_panel
	slot16 = self._info_panel.w(title.w(title)) / 2

	title_panel.set_center_x(slot14, title_panel)

	local tip_panel_params = {
		name = "tip_panel",
		y = HUDLoadingScreen.TIP_Y,
		h = HUDLoadingScreen.TIP_H
	}
	slot17 = tip_panel_params
	local tip_panel = self._info_panel.panel(title_panel, self._info_panel)
	slot20 = self._info_panel
	slot18 = self._info_panel.w(title) / 2

	tip_panel.set_center_x(self._info_panel, tip_panel)

	local tip_params = {
		wrap = true,
		align = "center",
		vertical = "top",
		name = "tip"
	}
	slot20 = HUDLoadingScreen.TIP_TEXT_FONT_SIZE
	tip_params.font = tweak_data.gui.get_font_path(tip_panel, tweak_data.gui, HUDLoadingScreen.TIP_TEXT_FONT)
	tip_params.font_size = HUDLoadingScreen.TIP_TEXT_FONT_SIZE
	tip_params.color = HUDLoadingScreen.TIP_TEXT_COLOR
	slot18 = self
	tip_params.text = self._get_random_tip(tip_panel)
	slot19 = tip_params
	local tip = tip_panel.text(tip_panel, tip_panel)

	return 
end
function HUDLoadingScreen:_layout_default()
	return 
end
function HUDLoadingScreen:_get_random_tip()
	local number_of_tips = #HUDLoadingScreen.LOADING_SCREEN_TIPS
	slot5 = number_of_tips
	local chosen_tip = math.random(slot3, 1)
	slot8 = "tip_tips"
	slot8 = HUDLoadingScreen.LOADING_SCREEN_TIPS[chosen_tip]

	return utf8.to_upper(managers.localization.text(slot6, managers.localization)) .. " " .. managers.localization.text(slot6, managers.localization)
end
function HUDLoadingScreen:_fit_panel_to_screen()
	slot4 = 0

	self._hud_panel.set_x(slot2, self._hud_panel)

	slot4 = 0

	self._hud_panel.set_y(slot2, self._hud_panel)

	slot3 = self._hud_panel
	slot6 = self._workspace

	self._hud_panel.set_w(slot2, self._workspace.width(slot5))

	slot3 = self._hud_panel
	slot6 = self._workspace

	self._hud_panel.set_h(slot2, self._workspace.height(slot5))

	slot3 = self._black
	slot6 = self._workspace

	self._black.set_w(slot2, self._workspace.width(slot5))

	return 
end
function HUDLoadingScreen:on_resolution_changed()
	slot4 = self._workspace

	managers.gui_data.layout_fullscreen_16_9_workspace(slot2, managers.gui_data)

	return 
end
function HUDLoadingScreen:show(data, clbk)
	if self._state == "shown" then
		if clbk then
			slot5 = self

			clbk(slot4)
		end

		return 
	end

	slot6 = data

	self.setup(slot4, self)

	if managers.queued_tasks then
		slot12 = true

		managers.queued_tasks.queue(slot4, managers.queued_tasks, "menu_background_destruction", managers.raid_menu.clean_up_background, managers.raid_menu, nil, 0.5, nil)
	end

	if self._state == "hidden" then
		if data.instant then
			slot6 = 0

			self._black.set_alpha(slot4, self._black)

			slot6 = 1

			self._bg.set_alpha(slot4, self._bg)

			slot5 = self._loading_icon_panel

			self._loading_icon_panel.show(slot4)

			slot6 = {
				text = "generic_loading"
			}

			self._loading_icon.show(slot4, self._loading_icon)

			if self._info_panel then
				slot6 = 1

				self._info_panel.set_alpha(slot4, self._info_panel)
			end
		else
			slot10 = "_animate_alpha"
			slot9 = 0
			slot14 = "_on_faded_to_black"

			self._black.animate(slot4, self._black, callback(slot7, self, self), 1, 0.5, callback(slot11, self, self))

			slot10 = "_animate_alpha"
			slot10 = clbk

			self._bg.animate(slot4, self._bg, callback(1, self, self), 1, 0.6, 0.45)

			if self._info_panel then
				slot10 = "_animate_alpha"
				slot9 = 0.5

				self._info_panel.animate(slot4, self._info_panel, callback(slot7, self, self), 1, 0.45)
			end
		end
	elseif self._state == "black" then
		slot5 = self._loading_icon_panel

		self._loading_icon_panel.show(slot4)

		slot6 = {
			text = "generic_loading"
		}

		self._loading_icon.show(slot4, self._loading_icon)

		slot10 = "_animate_alpha"
		slot8 = 0.6

		self._bg.animate(slot4, self._bg, callback(slot7, self, self), 1)

		if self._info_panel then
			slot10 = "_animate_alpha"
			slot9 = 0.5

			self._info_panel.animate(slot4, self._info_panel, callback(slot7, self, self), 1, 0.45)
		end
	end

	self._state = "shown"

	return 
end
function HUDLoadingScreen:hide()
	if self._state == "shown" then
		if self._info_panel then
			slot8 = "_animate_alpha"
			slot7 = 0

			self._info_panel.animate(slot2, self._info_panel, callback(slot5, self, self), 0, 0.6)
		end

		slot8 = "_animate_alpha"
		slot7 = 0.2

		self._bg.animate(slot2, self._bg, callback(slot5, self, self), 0, 0.8)

		slot8 = "_animate_alpha"
		slot8 = self.clean_up

		self._black.animate(slot2, self._black, callback(0, self, self), 0, 0.6, 0.7)
	elseif self._state == "black" then
		slot8 = "_animate_alpha"
		slot8 = self.clean_up

		self._black.animate(slot2, self._black, callback(slot5, self, self), 0, 0.6, 0)
	end

	slot3 = self._loading_icon

	self._loading_icon.hide(slot2)

	self._state = "hidden"

	return 
end
function HUDLoadingScreen:fade_to_black()
	if self._state == "hidden" then
		slot8 = "_animate_alpha"
		slot8 = self.black_alpha_full
		slot13 = "_on_faded_to_black"

		self._black.animate(slot2, self._black, callback(slot5, self, self), 1, 0.5, 0, callback(slot10, self, self))
	elseif self._state == "shown" then
		if self._info_panel then
			slot8 = "_animate_alpha"
			slot7 = 0

			self._info_panel.animate(slot2, self._info_panel, callback(slot5, self, self), 0, 0.6)
		end

		slot8 = "_animate_alpha"
		slot7 = 0.2

		self._bg.animate(slot2, self._bg, callback(slot5, self, self), 0, 0.8)
	end

	self._state = "black"

	return 
end
function HUDLoadingScreen:_on_faded_to_black()
	if managers.hud then
		slot3 = managers.hud

		managers.hud.on_loading_screen_faded_to_black(slot2)
	end

	if managers.warcry then
		slot3 = managers.warcry

		managers.warcry.deactivate_warcry(slot2)
	end

	slot3 = self._loading_icon_panel

	self._loading_icon_panel.show(slot2)

	slot4 = {
		text = "generic_loading"
	}

	self._loading_icon.show(slot2, self._loading_icon)

	return 
end
function HUDLoadingScreen:clean_up()
	if self._prompt then
		slot3 = self._prompt
		slot4 = self._prompt

		self._prompt.parent(slot2).remove(slot2, self._prompt.parent(slot2))

		self._prompt = nil
	end

	if self._info_panel then
		slot3 = self._info_panel

		self._info_panel.clear(slot2)

		slot3 = self._info_panel
		slot4 = self._info_panel

		self._info_panel.parent(slot2).remove(slot2, self._info_panel.parent(slot2))

		self._info_panel = nil
	end

	if self._summary_background then
		slot3 = self._summary_border_up
		slot4 = self._summary_border_up

		self._summary_border_up.parent(slot2).remove(slot2, self._summary_border_up.parent(slot2))

		self._summary_border_up = nil
		slot3 = self._summary_border_dn
		slot4 = self._summary_border_dn

		self._summary_border_dn.parent(slot2).remove(slot2, self._summary_border_dn.parent(slot2))

		self._summary_border_dn = nil
		slot3 = self._summary_border_lt
		slot4 = self._summary_border_lt

		self._summary_border_lt.parent(slot2).remove(slot2, self._summary_border_lt.parent(slot2))

		self._summary_border_lt = nil
		slot3 = self._summary_border_rt
		slot4 = self._summary_border_rt

		self._summary_border_rt.parent(slot2).remove(slot2, self._summary_border_rt.parent(slot2))

		self._summary_border_rt = nil
		slot3 = self._summary_background
		slot4 = self._summary_background

		self._summary_background.parent(slot2).remove(slot2, self._summary_background.parent(slot2))

		self._summary_background = nil
	end

	if self._bg then
		slot3 = self._bg
		slot4 = self._bg

		self._bg.parent(slot2).remove(slot2, self._bg.parent(slot2))

		self._bg = nil
	end

	if self._resolution_changed_callback_id then
		slot4 = self._resolution_changed_callback_id

		managers.viewport.remove_resolution_changed_func(slot2, managers.viewport)
	end

	return 
end
function HUDLoadingScreen:_real_aspect_ratio()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		return RenderSettings.aspect_ratio
	else
		slot3 = Application
		local screen_res = Application.screen_resolution(slot2)
		local screen_pixel_aspect = screen_res.x / screen_res.y

		return screen_pixel_aspect
	end

	return 
end
function HUDLoadingScreen:_animate_show_summary(summary_panel, delay)
	slot6 = true

	summary_panel.set_visible(slot4, summary_panel)

	slot6 = 1

	summary_panel.set_alpha(slot4, summary_panel)

	slot6 = 0

	self._summary_background.set_alpha(slot4, self._summary_background)

	slot5 = self._summary_background

	self._summary_background.stop(slot4)

	slot6 = true

	self._summary_background.set_visible(slot4, self._summary_background)

	if delay then
		slot5 = delay

		wait(slot4)
	end

	local t = 0
	local borders_set = false

	while t < 0.95 do
		local dt = coroutine.yield()
		t = t + dt

		if t < 0.75 then
			slot11 = self._summary_background.w(slot12)
			slot12 = 0.75
			local w = self._ease_out_quint(slot7, self, t, 0, slot11)
			slot10 = w

			self._summary_border_up.set_w(self, self._summary_border_up)

			slot9 = self._summary_border_up
			slot12 = self._summary_background

			self._summary_border_up.set_center_x(self, self._summary_background.center_x(slot11))

			slot10 = w

			self._summary_border_dn.set_w(self, self._summary_border_dn)

			slot9 = self._summary_border_dn
			slot12 = self._summary_background

			self._summary_border_dn.set_center_x(self, self._summary_background.center_x(slot11))

			slot14 = self._summary_background
			slot12 = self._summary_background.h(self._summary_background)
			slot13 = 0.75
			local h = self._ease_out_quint(self, self, t, 0, slot12)
			slot11 = h

			self._summary_border_lt.set_h(self, self._summary_border_lt)

			slot10 = self._summary_border_lt
			slot13 = self._summary_background

			self._summary_border_lt.set_center_y(self, self._summary_background.center_y(slot12))

			slot11 = h

			self._summary_border_rt.set_h(self, self._summary_border_rt)

			slot10 = self._summary_border_rt
			slot13 = self._summary_background

			self._summary_border_rt.set_center_y(self, self._summary_background.center_y(slot12))
		end

		if 0.75 <= t and not borders_set then
			slot8 = self._summary_border_up
			slot11 = self._summary_background

			self._summary_border_up.set_w(slot7, self._summary_background.w(slot10))

			slot8 = self._summary_border_up
			slot11 = self._summary_background

			self._summary_border_up.set_center_x(slot7, self._summary_background.center_x(slot10))

			slot8 = self._summary_border_dn
			slot11 = self._summary_background

			self._summary_border_dn.set_w(slot7, self._summary_background.w(slot10))

			slot8 = self._summary_border_dn
			slot11 = self._summary_background

			self._summary_border_dn.set_center_x(slot7, self._summary_background.center_x(slot10))

			slot8 = self._summary_border_lt
			slot11 = self._summary_background

			self._summary_border_lt.set_h(slot7, self._summary_background.h(slot10))

			slot8 = self._summary_border_lt
			slot11 = self._summary_background

			self._summary_border_lt.set_center_y(slot7, self._summary_background.center_y(slot10))

			slot8 = self._summary_border_rt
			slot11 = self._summary_background

			self._summary_border_rt.set_h(slot7, self._summary_background.h(slot10))

			slot8 = self._summary_border_rt
			slot11 = self._summary_background

			self._summary_border_rt.set_center_y(slot7, self._summary_background.center_y(slot10))

			borders_set = true
		end

		if 0.3 <= t and t < 0.8 then
			slot12 = 0.5
			local curr_alpha = self._ease_in_out_quart(slot7, self, t - 0.3, 0, 0.7)
			slot10 = curr_alpha

			self._summary_background.set_alpha(self, self._summary_background)
		end
	end

	slot7 = self._summary_border_up
	slot10 = self._summary_background

	self._summary_border_up.set_w(slot6, self._summary_background.w(slot9))

	slot7 = self._summary_border_dn
	slot10 = self._summary_background

	self._summary_border_dn.set_w(slot6, self._summary_background.w(slot9))

	slot7 = self._summary_border_lt
	slot10 = self._summary_background

	self._summary_border_lt.set_h(slot6, self._summary_background.h(slot9))

	slot7 = self._summary_border_rt
	slot10 = self._summary_background

	self._summary_border_rt.set_h(slot6, self._summary_background.h(slot9))

	slot8 = 0.7

	self._summary_background.set_alpha(slot6, self._summary_background)

	return 
end
function HUDLoadingScreen:_animate_hide_summary(summary_panel, delay)
	slot6 = true

	summary_panel.set_visible(slot4, summary_panel)

	slot6 = 1

	summary_panel.set_alpha(slot4, summary_panel)

	slot6 = 1

	self._summary_background.set_alpha(slot4, self._summary_background)

	slot5 = self._summary_background

	self._summary_background.stop(slot4)

	slot6 = true

	self._summary_background.set_visible(slot4, self._summary_background)

	if delay then
		slot5 = delay

		wait(slot4)
	end

	local t = 0

	while t < 0.95 do
		local dt = coroutine.yield()
		t = t + dt

		if t < 0.75 then
			slot12 = self._summary_background
			slot11 = 0.75
			local w = self._ease_out_quint(slot6, self, t, self._summary_background.w(slot10) - 2, -(self._summary_background.w(self._summary_background) - 2))
			slot9 = w

			self._summary_border_up.set_w(self, self._summary_border_up)

			slot8 = self._summary_border_up
			slot11 = self._summary_background

			self._summary_border_up.set_center_x(self, self._summary_background.center_x(-(self._summary_background.w(self._summary_background) - 2)))

			slot9 = w

			self._summary_border_dn.set_w(self, self._summary_border_dn)

			slot8 = self._summary_border_dn

			self._summary_border_dn.set_center_x(self, self._summary_background.center_x(-(self._summary_background.w(self._summary_background) - 2)))

			slot13 = self._summary_background
			slot12 = 0.75
			local h = self._ease_out_quint(self, self, t, self._summary_background.h(self._summary_background) + 2, -(self._summary_background.h(self._summary_background) + 2))
			slot10 = h

			self._summary_border_lt.set_h(self, self._summary_border_lt)

			slot9 = self._summary_border_lt
			slot12 = self._summary_background

			self._summary_border_lt.set_center_y(self, self._summary_background.center_y(-(self._summary_background.h(self._summary_background) + 2)))

			slot10 = h

			self._summary_border_rt.set_h(self, self._summary_border_rt)

			slot9 = self._summary_border_rt
			slot12 = self._summary_background

			self._summary_border_rt.set_center_y(self, self._summary_background.center_y(-(self._summary_background.h(self._summary_background) + 2)))
		end

		if 0.15 <= t and t < 0.45 then
			slot11 = 0.3
			local curr_alpha = self._ease_in_out_quart(slot6, self, t - 0.15, 0.7, -0.7)
			slot9 = curr_alpha

			self._summary_background.set_alpha(self, self._summary_background)
		end
	end

	slot7 = 0

	self._summary_border_up.set_w(slot5, self._summary_border_up)

	slot7 = 0

	self._summary_border_dn.set_w(slot5, self._summary_border_dn)

	slot7 = 0

	self._summary_border_lt.set_h(slot5, self._summary_border_lt)

	slot7 = 0

	self._summary_border_rt.set_h(slot5, self._summary_border_rt)

	slot7 = 0

	self._summary_background.set_alpha(slot5, self._summary_background)

	return 
end
function HUDLoadingScreen:_animate_alpha(o, new_alpha, duration, delay, callback)
	local t = 0
	slot9 = o
	local starting_alpha = o.alpha(slot8)
	local change = new_alpha - starting_alpha

	if delay then
		slot11 = delay

		wait(slot10)
	end

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = duration
		local curr_alpha = self._ease_in_out_quart(slot11, self, t, starting_alpha, change)
		slot14 = curr_alpha

		o.set_alpha(self, o)
	end

	slot12 = starting_alpha + change

	o.set_alpha(slot10, o)

	if callback then
		slot11 = self

		callback(slot10)
	end

	return 
end
function HUDLoadingScreen:_animate_move_background_horizontal(background)
	local t = 0
	local starting_x = 0
	slot7 = background
	local change_x = self._panel.w(slot5) - background.w(self._panel)
	local duration = 20

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local curr_x = self._linear(slot8, self, t, starting_x, change_x)
		slot11 = curr_x

		background.set_x(self, background)
	end

	return 
end
function HUDLoadingScreen:_linear(t, starting_value, change, duration)
	return (change * t) / duration + starting_value
end
function HUDLoadingScreen:_ease_in_out_quart(t, starting_value, change, duration)
	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t * t * t + starting_value
	end

	t = t - 2

	return -change / 2 * (t * t * t * t - 2) + starting_value
end
function HUDLoadingScreen:_ease_in_out_quadratic(t, starting_value, change, duration)
	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t + starting_value
	end

	t = t - 1

	return -change / 2 * (t * (t - 2) - 1) + starting_value
end
function HUDLoadingScreen:_ease_out_quint(t, starting_value, change, duration)
	t = t / duration
	t = t - 1

	return change * (t * t * t * t * t + 1) + starting_value
end
function HUDLoadingScreen:set_mid_text(text)
	slot5 = "mid_text"
	local mid_text = self._blackscreen_panel.child(slot3, self._blackscreen_panel)
	slot6 = 0

	mid_text.set_alpha(self._blackscreen_panel, mid_text)

	slot5 = mid_text
	slot8 = text

	mid_text.set_text(self._blackscreen_panel, utf8.to_upper(slot7))

	return 
end
function HUDLoadingScreen:fade_in_mid_text()
	slot4 = "mid_text"
	slot3 = self._blackscreen_panel.child(slot2, self._blackscreen_panel)
	slot8 = "_animate_fade_in"

	self._blackscreen_panel.child(slot2, self._blackscreen_panel).animate(slot2, callback(slot5, self, self))

	return 
end
function HUDLoadingScreen:fade_out_mid_text()
	slot4 = "mid_text"
	slot3 = self._blackscreen_panel.child(slot2, self._blackscreen_panel)
	slot8 = "_animate_fade_out"

	self._blackscreen_panel.child(slot2, self._blackscreen_panel).animate(slot2, callback(slot5, self, self))

	return 
end
function HUDLoadingScreen:_animate_fade_in(mid_text)
	slot5 = "job_panel"
	local job_panel = self._blackscreen_panel.child(slot3, self._blackscreen_panel)
	local t = 1
	local d = t

	while 0 < t do
		local dt = coroutine.yield()
		t = t - dt
		local a = (d - t) / d
		slot10 = a

		mid_text.set_alpha(slot8, mid_text)

		if job_panel then
			slot10 = a

			job_panel.set_alpha(slot8, job_panel)
		end

		slot10 = a

		self._blackscreen_panel.set_alpha(slot8, self._blackscreen_panel)
	end

	slot8 = 1

	mid_text.set_alpha(slot6, mid_text)

	if job_panel then
		slot8 = 1

		job_panel.set_alpha(slot6, job_panel)
	end

	slot8 = 1

	self._blackscreen_panel.set_alpha(slot6, self._blackscreen_panel)

	slot7 = self

	self._on_faded_to_black(slot6)

	return 
end
function HUDLoadingScreen:_animate_fade_out(mid_text)
	slot5 = "job_panel"
	local job_panel = self._blackscreen_panel.child(slot3, self._blackscreen_panel)
	local t = 1
	local d = t

	while 0 < t do
		local dt = coroutine.yield()
		t = t - dt
		local a = t / d
		slot10 = a

		mid_text.set_alpha(slot8, mid_text)

		if job_panel then
			slot10 = a

			job_panel.set_alpha(slot8, job_panel)
		end

		slot10 = a

		self._blackscreen_panel.set_alpha(slot8, self._blackscreen_panel)
	end

	slot8 = 0

	mid_text.set_alpha(slot6, mid_text)

	if job_panel then
		slot8 = 0

		job_panel.set_alpha(slot6, job_panel)
	end

	slot8 = 0

	self._blackscreen_panel.set_alpha(slot6, self._blackscreen_panel)

	return 
end

return 
